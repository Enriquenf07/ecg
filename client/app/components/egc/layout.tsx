import React, { Suspense } from "react";
import { Sidebar, SidebarContent, SidebarGroup, SidebarGroupContent, SidebarGroupLabel, SidebarMenu, SidebarMenuButton, SidebarMenuItem, SidebarProvider, SidebarTrigger } from "../ui/sidebar";
import { Calendar, Home, Inbox, Search, Settings, LogOut, LucideProps } from "lucide-react"
import { useMediaQuery } from 'usehooks-ts'

export interface MenuItem {
    title: string;
    url: string;
    icon: React.ForwardRefExoticComponent<Omit<LucideProps, "ref"> & React.RefAttributes<SVGSVGElement>>
}


const InitialItems = [
    {
        title: "Página Inicial",
        url: "/app",
        icon: Home,
    },
]

const FinalItems = [
    {
        title: "Configurações",
        url: "/config",
        icon: Settings,
    },
    {
        title: "Sair",
        url: "/sair",
        icon: LogOut,
    },
]

export default function ({ children, items = [],  noDefaultItens, className}: 
    { children: React.ReactNode, items?: Array<MenuItem>, noDefaultItens?: boolean, className?: string }) {
    const newItems = !noDefaultItens ? [...InitialItems, ...items, ...FinalItems] : items
    const matches = useMediaQuery('(max-width: 768px)')
    return (
        <Suspense>
            <SidebarProvider className="flex w-screen">
                <Sidebar>
                    <Sidebar>
                        <SidebarContent>
                            <SidebarGroup>
                                <SidebarGroupLabel>ECG</SidebarGroupLabel>
                                <SidebarGroupContent>
                                    <SidebarMenu>
                                        {newItems.map((item) => (
                                            <SidebarMenuItem key={item.title}>
                                                <SidebarMenuButton asChild>
                                                    <a href={item.url}>
                                                        <item.icon />
                                                        <span>{item.title}</span>
                                                    </a>
                                                </SidebarMenuButton>
                                            </SidebarMenuItem>
                                        ))}
                                    </SidebarMenu>
                                </SidebarGroupContent>
                            </SidebarGroup>
                        </SidebarContent>
                    </Sidebar>
                </Sidebar>
                <main className="flex-grow">
                    {matches && <SidebarTrigger />}
                    <div className={className || "pt-4 pl-4 lg:pt-12 lg:pl-12 h-screen"}>
                        {children}
                    </div>
                </main>
            </SidebarProvider>
        </Suspense>
    )
}
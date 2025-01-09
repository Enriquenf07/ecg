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
        url: "/",
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

export default function ({ children, items = [] }: { children: React.ReactNode, items?: Array<MenuItem> }) {
    const newItems = [...InitialItems, ...items, ...FinalItems]
    const matches = useMediaQuery('(max-width: 768px)')
    return (
        <Suspense>
            <SidebarProvider>
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
                <main>
                    {matches && <SidebarTrigger />}
                    <div className="p-4 lg:p-12 w-[100vw] lg:w-[70vw]">
                        {children}
                    </div>
                </main>
            </SidebarProvider>
        </Suspense>
    )
}
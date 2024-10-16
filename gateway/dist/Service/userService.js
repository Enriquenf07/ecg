"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.login = void 0;
const bcryptjs_1 = require("bcryptjs");
const sqlConfig_1 = require("../sqlConfig");
const jsonwebtoken_1 = require("jsonwebtoken");
const login = (_a) => __awaiter(void 0, [_a], void 0, function* ({ userReq, passwordReq }) {
    const { id, user, password } = yield sqlConfig_1.knex.select('*').from('users').where('user', userReq).first();
    const isPasswordEqual = yield (0, bcryptjs_1.compare)(passwordReq, password);
    if (!isPasswordEqual) {
        throw new Error('senha invalida');
    }
    const token = (0, jsonwebtoken_1.sign)({ user: user, }, "12345", {
        subject: id, expiresIn: "1d",
    });
    return { accessToken: token };
});
exports.login = login;

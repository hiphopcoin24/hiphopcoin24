// Copyright (c) 2015-2020 The Hiphopcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef HIPHOPCOIN_UTIL_URL_H
#define HIPHOPCOIN_UTIL_URL_H

#include <string>

using UrlDecodeFn = std::string(const std::string& url_encoded);
UrlDecodeFn urlDecode;
extern UrlDecodeFn* const URL_DECODE;

#endif // HIPHOPCOIN_UTIL_URL_H

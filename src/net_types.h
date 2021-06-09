// Copyright (c) 2019 The Hiphopcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef HIPHOPCOIN_NET_TYPES_H
#define HIPHOPCOIN_NET_TYPES_H

#include <map>

class CBanEntry;
class CSubNet;

using banmap_t = std::map<CSubNet, CBanEntry>;

#endif // HIPHOPCOIN_NET_TYPES_H

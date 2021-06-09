// Copyright (c) 2011-2014 The Hiphopcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef HIPHOPCOIN_QT_HIPHOPCOINADDRESSVALIDATOR_H
#define HIPHOPCOIN_QT_HIPHOPCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class HiphopcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit HiphopcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const override;
};

/** Hiphopcoin address widget validator, checks for a valid hiphopcoin address.
 */
class HiphopcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit HiphopcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const override;
};

#endif // HIPHOPCOIN_QT_HIPHOPCOINADDRESSVALIDATOR_H

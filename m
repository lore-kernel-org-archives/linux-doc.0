Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC23EC433DB
	for <linux-doc@archiver.kernel.org>; Sun, 21 Mar 2021 08:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE16261924
	for <linux-doc@archiver.kernel.org>; Sun, 21 Mar 2021 08:50:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhCUIuC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 21 Mar 2021 04:50:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34738 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229784AbhCUItp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 21 Mar 2021 04:49:45 -0400
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Sun, 21 Mar 2021
 16:49:34 +0800 (GMT+08:00)
X-Originating-IP: [153.37.224.188]
Date:   Sun, 21 Mar 2021 16:49:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5Y+45bu26IW+?= <siyanteng@loongson.cn>
To:     "Namjae Jeon" <namjae.jeon@samsung.com>
Cc:     mchehab+huawei@kernel.org,
        "'Steve French'" <stfrench@microsoft.com>,
        "'Gibeom Kim'" <gibeomii.kim@samsung.com>,
        linux-doc@vger.kernel.org, "'Huacai chen'" <chenhuacai@gmail.com>,
        siyanteng@gmail.com, "'Jonathan Corbet'" <corbet@lwn.net>
Subject: Re: RE: RE: [PATCH 2/2]  docs: filesystems: add cifs to the index
 file
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2021 www.mailtech.cn .loongson.cn
In-Reply-To: <000e01d71c70$eeb6a0e0$cc23e2a0$@samsung.com>
References: <20210318032604.9727-1-siyanteng@loongson.cn>
 <CGME20210318032616epcas1p2c5cc60dfae033e48bb26cabf81c3c032@epcas1p2.samsung.com>
 <20210318032604.9727-3-siyanteng@loongson.cn>
 <01b301d71ba9$5f234950$1d69dbf0$@samsung.com>
 <391b9b12.11cc.178483decb1.Coremail.siyanteng@loongson.cn>
 <000e01d71c70$eeb6a0e0$cc23e2a0$@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6571ffec.19c5.17853f9ac3a.Coremail.siyanteng@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9BxA+WfCFdgWDQEAA--.1165W
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/1tbiAQAFEV3QvNFCMwACsG
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

ClRoYW5rIHlvdSEgSW4gdGhlIHBhc3QgdHdvIGRheXMgSSBoYXZlIGNvbnN1bHRlZCBub3Qgb25s
eSBvdGhlciBpbmRleGVzLCBidXQgYWxzbyB0aGUgU3BoaW54IG1hbnVhbC4gIEluIHRoZSBtZWFu
dGltZSBJIGhhdmUgZG9uZSBhIGxvdCBvZiBleHBlcmltZW50YXRpb24uIE5vdyBJIGFtIGNvbnZp
bmNlZCB0aGF0OiAiOm1heGRlcHRo77yaMSIgaXMgYXBwcm9wcmlhdGU7ICI6bnVtYmVyZWQiIGlz
IG5vdCBuZWVkZWQuClRoYW5rc++8gQoKWWFudGVuZwomZ3Q7IC0tLS0t5Y6f5aeL6YKu5Lu2LS0t
LS0KJmd0OyDlj5Hku7bkuro6ICJOYW1qYWUgSmVvbiIgPG5hbWphZS5qZW9uQHNhbXN1bmcuY29t
PgomZ3Q7IOWPkemAgeaXtumXtDogMjAyMS0wMy0xOSAxMTozNTozOSAo5pif5pyf5LqUKQomZ3Q7
IOaUtuS7tuS6ujogIiflj7jlu7bohb4nIiA8c2l5YW50ZW5nQGxvb25nc29uLmNuPgomZ3Q7IOaK
hOmAgTogbWNoZWhhYitodWF3ZWlAa2VybmVsLm9yZywgIidTdGV2ZSBGcmVuY2gnIiA8c3RmcmVu
Y2hAbWljcm9zb2Z0LmNvbT4sICInR2liZW9tIEtpbSciIDxnaWJlb21paS5raW1Ac2Ftc3VuZy5j
b20+LCBsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnLCAiJ0h1YWNhaSBjaGVuJyIgPGNoZW5odWFj
YWlAZ21haWwuY29tPiwgc2l5YW50ZW5nQGdtYWlsLmNvbSwgIidKb25hdGhhbgomZ3Q7ICBDb3Ji
ZXQnIiA8Y29yYmV0QGx3bi5uZXQ+CiZndDsg5Li76aKYOiBSRTogUkU6IFtQQVRDSCAyLzJdICBk
b2NzOiBmaWxlc3lzdGVtczogYWRkIGNpZnMgdG8gdGhlIGluZGV4IGZpbGUKJmd0OyAKJmd0OyAm
Z3Q7IFNvcnJ5LCBJIGNvcGllZCBhbiBpbmRleCBhcyBhIGJhc2UgZnJvbSBzb21ld2hlcmUgZWxz
ZSBhbmQgbW9kaWZpZWQgaXQsIG9idmlvdXNseSBJIGRpZG4ndCBkbyBhIHZlcnkKJmd0OyAmZ3Q7
IG5pY2Ugam9iIGFuZCB0aGlzIHdpbGwgY2F1c2UgcHJvYmxlbXMgZm9yIGZ1dHVyZSBkZXZlbG9w
ZXJzLiBKdXN0IGtlZXAgdGhlIGRlZmF1bHRzLCBjYW4gSSBkZWxldGUgdGhlbQomZ3Q7ICZndDsg
aW4gdjI/CiZndDsgSXMgaXQgcmVhbGx5IHJpZ2h0IHRvIGRlbGV0ZSB0aGVtPyBGaXJzdCB3ZSBo
YXZlIHRvIGtub3cgd2hhdCB0aGV5IG1lYW4uCiZndDsgV2hlbiBJIHNlZSBEb2N1bWVudGF0aW9u
L2ZpbGVzeXN0ZW1zL25mcy9pbmRleC5zdCwgOm1heGRlcHRoIGlzIHNldCB0byAxLgomZ3Q7IENh
biB5b3UgdGFrZSBhIGxvb2sgbW9yZSA/CiZndDsgCiZndDsgJmd0OyBUaGFua3MhCiZndDsgJmd0
OyAKJmd0OyAmZ3Q7IFlhbnRlbmcKJmd0OyAmZ3Q7IAomZ3Q7ICZndDsgIk5hbWphZSBKZW9uIiA8
bmFtamFlLmplb25Ac2Ftc3VuZy5jb20+5YaZ6YGT77yaCiZndDsgJmd0OyAmZ3Q7ICZndDsgICAg
IEZpbGVzeXN0ZW1zIGhhcyBhIG5ldyBjaWZzIGZvbGRlci4gQWRkIGl0IHRvIHRoZSBpbmRleCBm
aWxlLgomZ3Q7ICZndDsgJmd0OyAmZ3Q7ICAgICBTaG91bGQgYWRkcmVzcyB0aGlzIHdhcm5pbmc6
CiZndDsgJmd0OyAmZ3Q7ICZndDsKJmd0OyAmZ3Q7ICZndDsgJmd0OyAgbGludXgtbmV4dC9Eb2N1
bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2NpZnMvY2lmc2QucnN0OiBXQVJOSU5HOgomZ3Q7ICZndDsg
Jmd0OyAmZ3Q7ICBkb2N1bWVudCBpc24ndCBpbmNsdWRlZCBpbiBhbnkgdG9jdHJlZSAmZ3Q7ICZn
dDsgLS0tICZndDsgJmd0OwomZ3Q7ICZndDsgRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9jaWZz
L2luZGV4LnJzdCB8IDEyICsrKysrKysrKysrKwomZ3Q7ICZndDsgJmd0OyAmZ3Q7ICBEb2N1bWVu
dGF0aW9uL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdCAgICAgIHwgIDIgKy0KJmd0OyAmZ3Q7ICZndDsg
Jmd0OyAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pICBj
cmVhdGUgbW9kZSAxMDA2NDQgJmd0OyAmZ3Q7CiZndDsgJmd0OyBEb2N1bWVudGF0aW9uL2ZpbGVz
eXN0ZW1zL2NpZnMvaW5kZXgucnN0CiZndDsgJmd0OyAmZ3Q7ICZndDsKJmd0OyAmZ3Q7ICZndDsg
Jmd0OyBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9jaWZzL2luZGV4LnJz
dAomZ3Q7ICZndDsgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2NpZnMvaW5kZXgucnN0CiZn
dDsgJmd0OyAmZ3Q7ICZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQKJmd0OyAmZ3Q7ICZndDsgJmd0
OyBpbmRleCAwMDAwMDAwMDAwMDAuLmI0YTQ4N2U5YWRmZiAmZ3Q7ICZndDsgLS0tIC9kZXYvbnVs
bCAmZ3Q7ICZndDsgKysrCiZndDsgJmd0OyBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvY2lm
cy9pbmRleC5yc3QKJmd0OyAmZ3Q7ICZndDsgJmd0OyBAQCAtMCwwICsxLDEyIEBACiZndDsgJmd0
OyAmZ3Q7ICZndDsgKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICZndDsgJmd0
OyArICZndDsgJmd0OyArPT09PSAmZ3Q7ICZndDsgK0NJRlMgJmd0OyAmZ3Q7CiZndDsgJmd0OyAr
PT09PSAmZ3Q7ICZndDsgKyAmZ3Q7ICZndDsgKy4uIHRvY3RyZWU6OgomZ3Q7ICZndDsgJmd0OyAm
Z3Q7ICsgICA6bWF4ZGVwdGg6IDIKJmd0OyAmZ3Q7ICZndDsgJmd0OyArICAgOm51bWJlcmVkOgom
Z3Q7ICZndDsgJmd0OyBDb3VsZCB5b3UgcGxlYXNlIGV4cGxhaW4gd2hhdCA6bWF4ZGVwdGggYW5k
IDpudW1iZXJlZCBhcmUgPwomZ3Q7ICZndDsgJmd0OwomZ3Q7ICZndDsgJmd0OyBUaGFua3MhCiZn
dDsgJmd0OyAmZ3Q7ICZndDsgKwomZ3Q7ICZndDsgJmd0OyAmZ3Q7ICsgICBjaWZzZAomZ3Q7ICZn
dDsgJmd0OyAmZ3Q7ICsgICBjaWZzcm9vdAomZ3Q7ICZndDsgJmd0OyAmZ3Q7IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vZmls
ZXN5c3RlbXMvaW5kZXgucnN0CiZndDsgJmd0OyAmZ3Q7ICZndDsgaW5kZXggZDQ4NTNjYjkxOWQy
Li5iZGJhODBhZTJiYjEgMTAwNjQ0ICZndDsgJmd0OyAtLS0gYS9Eb2N1bWVudGF0aW9uL2ZpbGVz
eXN0ZW1zL2luZGV4LnJzdAomZ3Q7ICZndDsgJmd0OyAmZ3Q7ICsrKyBiL0RvY3VtZW50YXRpb24v
ZmlsZXN5c3RlbXMvaW5kZXgucnN0CiZndDsgJmd0OyAmZ3Q7ICZndDsgQEAgLTcyLDcgKzcyLDcg
QEAgRG9jdW1lbnRhdGlvbiBmb3IgZmlsZXN5c3RlbSBpbXBsZW1lbnRhdGlvbnMuCiZndDsgJmd0
OyAmZ3Q7ICZndDsgICAgIGJlZnMKJmd0OyAmZ3Q7ICZndDsgJmd0OyAgICAgYmZzCiZndDsgJmd0
OyAmZ3Q7ICZndDsgICAgIGJ0cmZzCiZndDsgJmd0OyAmZ3Q7ICZndDsgLSAgIGNpZnMvY2lmc3Jv
b3QKJmd0OyAmZ3Q7ICZndDsgJmd0OyArICAgY2lmcy9pbmRleAomZ3Q7ICZndDsgJmd0OyAmZ3Q7
ICAgICBjZXBoCiZndDsgJmd0OyAmZ3Q7ICZndDsgICAgIGNvZGEKJmd0OyAmZ3Q7ICZndDsgJmd0
OyAgICAgY29uZmlnZnMKJmd0OyAmZ3Q7ICZndDsgJmd0OyAtLQomZ3Q7ICZndDsgJmd0OyAmZ3Q7
IDIuMjUuMQomZ3Q7ICZndDsgJmd0OwomZ3Q7ICZndDsgCiZndDsgJmd0OyAKJmd0OyAmZ3Q7IDwv
bmFtamFlLmplb25Ac2Ftc3VuZy5jb20+CiZndDsgCiZndDsKCgo8L2NvcmJldEBsd24ubmV0Pjwv
Y2hlbmh1YWNhaUBnbWFpbC5jb20+PC9naWJlb21paS5raW1Ac2Ftc3VuZy5jb20+PC9zdGZyZW5j
aEBtaWNyb3NvZnQuY29tPjwvc2l5YW50ZW5nQGxvb25nc29uLmNuPjwvbmFtamFlLmplb25Ac2Ft
c3VuZy5jb20+

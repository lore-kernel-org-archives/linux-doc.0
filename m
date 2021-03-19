Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F5BC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 02:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F24C264F1B
	for <linux-doc@archiver.kernel.org>; Fri, 19 Mar 2021 02:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhCSCJL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 22:09:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58086 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229736AbhCSCIs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 22:08:48 -0400
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Fri, 19 Mar 2021
 10:08:41 +0800 (GMT+08:00)
X-Originating-IP: [112.20.110.110]
Date:   Fri, 19 Mar 2021 10:08:41 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5Y+45bu26IW+?= <siyanteng@loongson.cn>
To:     "Namjae Jeon" <namjae.jeon@samsung.com>
Cc:     mchehab+huawei@kernel.org,
        "'Steve French'" <stfrench@microsoft.com>,
        "'Gibeom Kim'" <gibeomii.kim@samsung.com>,
        linux-doc@vger.kernel.org, "'Huacai chen'" <chenhuacai@gmail.com>,
        siyanteng@gmail.com, "'Jonathan Corbet'" <corbet@lwn.net>
Subject: Re: RE: [PATCH 2/2]  docs: filesystems: add cifs to the index file
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2021 www.mailtech.cn .loongson.cn
In-Reply-To: <01b301d71ba9$5f234950$1d69dbf0$@samsung.com>
References: <20210318032604.9727-1-siyanteng@loongson.cn>
 <CGME20210318032616epcas1p2c5cc60dfae033e48bb26cabf81c3c032@epcas1p2.samsung.com>
 <20210318032604.9727-3-siyanteng@loongson.cn>
 <01b301d71ba9$5f234950$1d69dbf0$@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <391b9b12.11cc.178483decb1.Coremail.siyanteng@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9BxI+WqB1Rgr2YCAA--.971W
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/1tbiAQAEEV3QvNEuSgAJsZ
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

U29ycnksIEkgY29waWVkIGFuIGluZGV4IGFzIGEgYmFzZSBmcm9tIHNvbWV3aGVyZSBlbHNlIGFu
ZCBtb2RpZmllZCBpdCwgb2J2aW91c2x5IEkgZGlkbid0IGRvIGEgdmVyeSBuaWNlIGpvYiBhbmQg
dGhpcyB3aWxsIGNhdXNlIHByb2JsZW1zIGZvciBmdXR1cmUgZGV2ZWxvcGVycy4gSnVzdCBrZWVw
IHRoZSBkZWZhdWx0cywgY2FuIEkgZGVsZXRlIHRoZW0gaW4gdjI/ClRoYW5rcyEKCllhbnRlbmcK
CiJOYW1qYWUgSmVvbiIgPG5hbWphZS5qZW9uQHNhbXN1bmcuY29tPuWGmemBk++8mgomZ3Q7ICZn
dDsgICAgIEZpbGVzeXN0ZW1zIGhhcyBhIG5ldyBjaWZzIGZvbGRlci4gQWRkIGl0IHRvIHRoZSBp
bmRleCBmaWxlLgomZ3Q7ICZndDsgICAgIFNob3VsZCBhZGRyZXNzIHRoaXMgd2FybmluZzoKJmd0
OyAmZ3Q7IAomZ3Q7ICZndDsgIGxpbnV4LW5leHQvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9j
aWZzL2NpZnNkLnJzdDogV0FSTklORzoKJmd0OyAmZ3Q7ICBkb2N1bWVudCBpc24ndCBpbmNsdWRl
ZCBpbiBhbnkgdG9jdHJlZQomZ3Q7ICZndDsgLS0tCiZndDsgJmd0OyAgRG9jdW1lbnRhdGlvbi9m
aWxlc3lzdGVtcy9jaWZzL2luZGV4LnJzdCB8IDEyICsrKysrKysrKysrKwomZ3Q7ICZndDsgIERv
Y3VtZW50YXRpb24vZmlsZXN5c3RlbXMvaW5kZXgucnN0ICAgICAgfCAgMiArLQomZ3Q7ICZndDsg
IDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKSAgY3JlYXRl
IG1vZGUgMTAwNjQ0CiZndDsgJmd0OyBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2NpZnMvaW5k
ZXgucnN0CiZndDsgJmd0OyAKJmd0OyAmZ3Q7IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Zp
bGVzeXN0ZW1zL2NpZnMvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9jaWZz
L2luZGV4LnJzdAomZ3Q7ICZndDsgbmV3IGZpbGUgbW9kZSAxMDA2NDQKJmd0OyAmZ3Q7IGluZGV4
IDAwMDAwMDAwMDAwMC4uYjRhNDg3ZTlhZGZmCiZndDsgJmd0OyAtLS0gL2Rldi9udWxsCiZndDsg
Jmd0OyArKysgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2NpZnMvaW5kZXgucnN0CiZndDsg
Jmd0OyBAQCAtMCwwICsxLDEyIEBACiZndDsgJmd0OyArLi4gU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEdQTC0yLjAKJmd0OyAmZ3Q7ICsKJmd0OyAmZ3Q7ICs9PT09CiZndDsgJmd0OyArQ0lGUwom
Z3Q7ICZndDsgKz09PT0KJmd0OyAmZ3Q7ICsKJmd0OyAmZ3Q7ICsuLiB0b2N0cmVlOjoKJmd0OyAm
Z3Q7ICsgICA6bWF4ZGVwdGg6IDIKJmd0OyAmZ3Q7ICsgICA6bnVtYmVyZWQ6CiZndDsgQ291bGQg
eW91IHBsZWFzZSBleHBsYWluIHdoYXQgOm1heGRlcHRoIGFuZCA6bnVtYmVyZWQgYXJlID8KJmd0
OyAKJmd0OyBUaGFua3MhCiZndDsgJmd0OyArCiZndDsgJmd0OyArICAgY2lmc2QKJmd0OyAmZ3Q7
ICsgICBjaWZzcm9vdAomZ3Q7ICZndDsgZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmlsZXN5
c3RlbXMvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9pbmRleC5yc3QKJmd0
OyAmZ3Q7IGluZGV4IGQ0ODUzY2I5MTlkMi4uYmRiYTgwYWUyYmIxIDEwMDY0NAomZ3Q7ICZndDsg
LS0tIGEvRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy9pbmRleC5yc3QKJmd0OyAmZ3Q7ICsrKyBi
L0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvaW5kZXgucnN0CiZndDsgJmd0OyBAQCAtNzIsNyAr
NzIsNyBAQCBEb2N1bWVudGF0aW9uIGZvciBmaWxlc3lzdGVtIGltcGxlbWVudGF0aW9ucy4KJmd0
OyAmZ3Q7ICAgICBiZWZzCiZndDsgJmd0OyAgICAgYmZzCiZndDsgJmd0OyAgICAgYnRyZnMKJmd0
OyAmZ3Q7IC0gICBjaWZzL2NpZnNyb290CiZndDsgJmd0OyArICAgY2lmcy9pbmRleAomZ3Q7ICZn
dDsgICAgIGNlcGgKJmd0OyAmZ3Q7ICAgICBjb2RhCiZndDsgJmd0OyAgICAgY29uZmlnZnMKJmd0
OyAmZ3Q7IC0tCiZndDsgJmd0OyAyLjI1LjEKJmd0OwoKCjwvbmFtamFlLmplb25Ac2Ftc3VuZy5j
b20+

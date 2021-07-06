Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48307C07E96
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 09:32:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29A0761998
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jul 2021 09:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbhGFJfe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jul 2021 05:35:34 -0400
Received: from mail.loongson.cn ([114.242.206.163]:48434 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230472AbhGFJfe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Jul 2021 05:35:34 -0400
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Tue, 6 Jul 2021
 17:32:49 +0800 (GMT+08:00)
X-Originating-IP: [112.20.109.145]
Date:   Tue, 6 Jul 2021 17:32:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?6ZmI5Y2O5omN?= <chenhuacai@loongson.cn>
To:     "Jonathan Corbet" <corbet@lwn.net>
Cc:     "Alex Shi" <alexs@kernel.org>, "Alex Shi" <seakeel@gmail.com>,
        linux-doc@vger.kernel.org, "Wu XiangCheng" <bobwxc@email.cn>,
        "Xuefeng Li" <lixuefeng@loongson.cn>,
        "Yanteng Si" <siyanteng@loongson.cn>,
        "Jiaxun Yang" <jiaxun.yang@flygoat.com>
Subject: Re: Re: [PATCH 1/2] Documentation: LoongArch: Add basic
 documentations
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2021 www.mailtech.cn .loongson.cn
In-Reply-To: <87a6n0kdv5.fsf@meer.lwn.net>
References: <20210705111607.1208270-1-chenhuacai@loongson.cn>
 <87a6n0kdv5.fsf@meer.lwn.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <25a26520.94b3.17a7b29b8c6.Coremail.chenhuacai@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9AxmuBBI+RgBQAdAA--.10434W
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/1tbiAQAOBl3QvNoizQABsM
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGksIEpvbmF0aGFuLAoKCiZndDsgLS0tLS3ljp/lp4vpgq7ku7YtLS0tLQomZ3Q7IOWPkeS7tuS6
ujogIkpvbmF0aGFuIENvcmJldCIgPGNvcmJldEBsd24ubmV0PgomZ3Q7IOWPkemAgeaXtumXtDog
MjAyMS0wNy0wNSAyMjo1NzoxOCAo5pif5pyf5LiAKQomZ3Q7IOaUtuS7tuS6ujogIkh1YWNhaSBD
aGVuIiA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4sICJBbGV4IFNoaSIgPGFsZXhzQGtlcm5lbC5v
cmc+LCAiQWxleAomZ3Q7ICBTaGkiIDxzZWFrZWVsQGdtYWlsLmNvbT4KJmd0OyDmioTpgIE6IGxp
bnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcsICJXdSBYaWFuZ0NoZW5nIiA8Ym9id3hjQGVtYWlsLmNu
PiwgIlh1ZWZlbmcgTGkiIDxsaXh1ZWZlbmdAbG9vbmdzb24uY24+LCAiWWFudGVuZyBTaSIgPHNp
eWFudGVuZ0Bsb29uZ3Nvbi5jbj4sICJKaWF4dW4gWWFuZyIgPGppYXh1bi55YW5nQGZseWdvYXQu
Y29tPiwgIkh1YWNhaSBDaGVuIiA8Y2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj4KJmd0OyDkuLvpopg6
IFJlOiBbUEFUQ0ggMS8yXSBEb2N1bWVudGF0aW9uOiBMb29uZ0FyY2g6IEFkZCBiYXNpYyBkb2N1
bWVudGF0aW9ucwomZ3Q7IAomZ3Q7IEh1YWNhaSBDaGVuIDxjaGVuaHVhY2FpQGxvb25nc29uLmNu
PiB3cml0ZXM6CiZndDsgCiZndDsgJmd0OyBBZGQgc29tZSBiYXNpYyBkb2N1bWVudGF0aW9ucyBm
b3IgTG9vbmdBcmNoLiBMb29uZ0FyY2ggaXMgYSBuZXcgUklTQwomZ3Q7ICZndDsgSVNBLCB3aGlj
aCBpcyBhIGJpdCBsaWtlIE1JUFMgb3IgUklTQy1WLiBMb29uZ0FyY2ggaW5jbHVkZXMgYSByZWR1
Y2VkCiZndDsgJmd0OyAzMi1iaXQgdmVyc2lvbiAoTEEzMlIpLCBhIHN0YW5kYXJkIDMyLWJpdCB2
ZXJzaW9uIChMQTMyUykgYW5kIGEgNjQtYml0CiZndDsgJmd0OyB2ZXJzaW9uIChMQTY0KS4KJmd0
OyAmZ3Q7CiZndDsgJmd0OyBTaWduZWQtb2ZmLWJ5OiBIdWFjYWkgQ2hlbiA8Y2hlbmh1YWNhaUBs
b29uZ3Nvbi5jbj4KJmd0OyAmZ3Q7IC0tLQomZ3Q7ICZndDsgIERvY3VtZW50YXRpb24vYXJjaC5y
c3QgICAgICAgICAgICAgICAgICAgICB8ICAgMSArCiZndDsgJmd0OyAgRG9jdW1lbnRhdGlvbi9s
b29uZ2FyY2gvZmVhdHVyZXMucnN0ICAgICAgIHwgICAzICsKJmd0OyAmZ3Q7ICBEb2N1bWVudGF0
aW9uL2xvb25nYXJjaC9pbmRleC5yc3QgICAgICAgICAgfCAgMjEgKysKJmd0OyAmZ3Q7ICBEb2N1
bWVudGF0aW9uL2xvb25nYXJjaC9pbnRyb2R1Y3Rpb24ucnN0ICAgfCAzNDIgKysrKysrKysrKysr
KysrKysrKysrCiZndDsgJmd0OyAgRG9jdW1lbnRhdGlvbi9sb29uZ2FyY2gvaXJxLWNoaXAtbW9k
ZWwucnN0IHwgMTU4ICsrKysrKysrKysKJmd0OyAmZ3Q7ICA1IGZpbGVzIGNoYW5nZWQsIDUyNSBp
bnNlcnRpb25zKCspCiZndDsgJmd0OyAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
bG9vbmdhcmNoL2ZlYXR1cmVzLnJzdAomZ3Q7ICZndDsgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2xvb25nYXJjaC9pbmRleC5yc3QKJmd0OyAmZ3Q7ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9sb29uZ2FyY2gvaW50cm9kdWN0aW9uLnJzdAomZ3Q7ICZndDsgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2xvb25nYXJjaC9pcnEtY2hpcC1tb2RlbC5y
c3QKJmd0OyAKJmd0OyBTbyBkb2N1bWVudGF0aW9uIGlzIGdvb2QsIGJ1dCBpdCBzdGlsbCBzZWVt
cyBhIGJpdCBzdHJhbmdlIHRvIGFkZAomZ3Q7IGRvY3VtZW50YXRpb24gZm9yIGFuIGFyY2hpdGVj
dHVyZSB0aGF0IExpbnV4IGRvZXNuJ3Qgc3VwcG9ydC4gIEkgYXNzdW1lCiZndDsgdGhhdCBwYXRj
aGVzIGFkZGluZyB0aGF0IHN1cHBvcnQgZXhpc3QsIHJpZ2h0PyAgVGhlIGRvY3VtZW50YXRpb24K
Jmd0OyBwYXRjaGVzIHNob3VsZCBwcm9iYWJseSBiZSBhIHBhcnQgb2YgdGhhdCBwYXRjaCBzZXQu
Ck5vdyB0aGUgTG9vbmdBcmNoIHN1cHBvcnRpbmcgcGF0Y2hlcyBhcmUgc2VudCBpbiBmb3VyIHNl
cmllczoKMSwgRG9jdW1lbnQgc2VyaWVzICh0aGlzIG9uZSkKMiwgQUNQSSBkZWZpbml0aW9uIHNl
cmllczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYWNwaS8yMDIxMDcwNTEyNDIwNi4x
MjI4OTU4LTEtY2hlbmh1YWNhaUBsb29uZ3Nvbi5jbi9ULyN0CjMsIGlycWNoaXAgZHJpdmVyIHNl
cmllczogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIxMDcwNjAzMDkwNC4xNDExNzc1
LTEtY2hlbmh1YWNhaUBsb29uZ3Nvbi5jbi9ULyN0CjQsIGNvcmUgYXJjaGl0ZWN1cmUgc2VyaWVz
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcmNoLzIwMjEwNzA2MDQxODIwLjE1MzY1
MDItMS1jaGVuaHVhY2FpQGxvb25nc29uLmNuL1QvI3QKClRoaXMgaXMgYmVjYXVzZSB0aGV5IGFy
ZSBzZW50IHRvIGRpZmZlcmVudCBtYWlsbGlzdCwgc28gSSB0aG91Z2h0IEkgc2hvdWxkIHNwbGl0
IGl0LgoKSHVhY2FpCiZndDsgCiZndDsgVGhhbmtzLAomZ3Q7IAomZ3Q7IGpvbgo8L2NoZW5odWFj
YWlAbG9vbmdzb24uY24+PC9jaGVuaHVhY2FpQGxvb25nc29uLmNuPjwvY2hlbmh1YWNhaUBsb29u
Z3Nvbi5jbj48L2ppYXh1bi55YW5nQGZseWdvYXQuY29tPjwvc2l5YW50ZW5nQGxvb25nc29uLmNu
PjwvbGl4dWVmZW5nQGxvb25nc29uLmNuPjwvYm9id3hjQGVtYWlsLmNuPjwvc2Vha2VlbEBnbWFp
bC5jb20+PC9hbGV4c0BrZXJuZWwub3JnPjwvY2hlbmh1YWNhaUBsb29uZ3Nvbi5jbj48L2NvcmJl
dEBsd24ubmV0Pg==

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B4FCCA486
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 10:30:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237243AbiFHKan (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 06:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238189AbiFHK34 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 06:29:56 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C53411957A9
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 03:22:15 -0700 (PDT)
Received: by ajax-webmail-mail.loongson.cn (Coremail) ; Wed, 8 Jun 2022
 18:22:12 +0800 (GMT+08:00)
X-Originating-IP: [223.64.16.213]
Date:   Wed, 8 Jun 2022 18:22:12 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5ZGo5b2s5b2s?= <zhoubinbin@loongson.cn>
To:     "teng sterling" <sterlingteng@gmail.com>
Cc:     "Alex Shi" <alexs@kernel.org>,
        "Yanteng Si" <siyanteng@loongson.cn>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Huacai Chen" <chenhuacai@loongson.cn>,
        "Wu X.C." <bobwxc@email.cn>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>
Subject: Re: Re: [PATCH 0/3] docs/zh_CN: riscv: Update the translation to
 5.19-rc1
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10a build 20191018(4c4f6d15)
 Copyright (c) 2002-2022 www.mailtech.cn .loongson.cn
In-Reply-To: <CAMU9jJpCXt1eD3NuPy6XJxarcAnn9AdUmOBwWPZQ2NwjqJLH_g@mail.gmail.com>
References: <cover.1654652729.git.zhoubinbin@loongson.cn>
 <CAMU9jJpCXt1eD3NuPy6XJxarcAnn9AdUmOBwWPZQ2NwjqJLH_g@mail.gmail.com>
Content-Transfer-Encoding: base64
X-CM-CTRLDATA: yoAy52Zvb3Rlcl90eHQ9MjEwODo2MTI=
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <55677a71.b23b.18142d60b70.Coremail.zhoubinbin@loongson.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: AQAAf9CxP+ZUeKBihDAtAA--.4162W
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQALCF3QvPiYcgAAsh
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VW5Jw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

SGkgWWFudGVuZzoKClRoYW5rcyBmb3IgeW91ciByZXBseSwgYW5kIEknbGwgc2VuZCB0aGUgVjIg
cGF0Y2ggc2V0LgoKQmluYmluCgomZ3Q7IC0tLS0t5Y6f5aeL6YKu5Lu2LS0tLS0KJmd0OyDlj5Hk
u7bkuro6ICJ0ZW5nIHN0ZXJsaW5nIiA8c3Rlcmxpbmd0ZW5nQGdtYWlsLmNvbT4KJmd0OyDlj5Hp
gIHml7bpl7Q6IDIwMjItMDYtMDggMTY6MTk6NDkgKOaYn+acn+S4iSkKJmd0OyDmlLbku7bkuro6
ICJCaW5iaW4gWmhvdSIgPHpob3ViaW5iaW5AbG9vbmdzb24uY24+CiZndDsg5oqE6YCBOiAiQWxl
eCBTaGkiIDxhbGV4c0BrZXJuZWwub3JnPiwgIllhbnRlbmcgU2kiIDxzaXlhbnRlbmdAbG9vbmdz
b24uY24+LCAiSm9uYXRoYW4gQ29yYmV0IiA8Y29yYmV0QGx3bi5uZXQ+LCAiSHVhY2FpIENoZW4i
IDxjaGVuaHVhY2FpQGxvb25nc29uLmNuPiwgIld1IFguQy4iIDxib2J3eGNAZW1haWwuY24+LCAi
TGludXggRG9jIE1haWxpbmcgTGlzdCIgPGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc+CiZndDsg
5Li76aKYOiBSZTogW1BBVENIIDAvM10gZG9jcy96aF9DTjogcmlzY3Y6IFVwZGF0ZSB0aGUgdHJh
bnNsYXRpb24gdG8gNS4xOS1yYzEKJmd0OyAKJmd0OyBCaW5iaW4gWmhvdSA8emhvdWJpbmJpbkBs
b29uZ3Nvbi5jbj4g5LqOMjAyMuW5tDbmnIg45pel5ZGo5LiJIDE1OjU15YaZ6YGT77yaCiZndDsg
SGkgQmluYmluCiZndDsgJmd0OwomZ3Q7ICZndDsgVGhlIGNvbnRlbnQgb2YgcmlzY3YgQ2hpbmVz
ZSBkb2N1bWVudHMgbGFncyBiZWhpbmQgdGhlIGNvcnJlc3BvbmRpbmcKJmd0OyAmZ3Q7IEVuZ2xp
c2ggZG9jdW1lbnRzLCBhbmQgdGhlIHJlbGV2YW50IGNvbW1pdHMgYXJlIHVwZGF0ZWQgc3luY2hy
b25vdXNseS4KJmd0OyAmZ3Q7CiZndDsgJmd0OyBCaW5iaW4gWmhvdSAoMyk6CiZndDsgJmd0OyAg
IGRvY3MvemhfQ046IHJpc2N2OiBVcGRhdGUgdGhlIHRyYW5zbGF0aW9uIG9mIGZlYXR1cmVzLnJz
dCB0byA1LjE5LXJjMQomZ3Q7ICZndDsgICBkb2NzL3poX0NOOiByaXNjdjogVXBkYXRlIHRoZSB0
cmFuc2xhdGlvbiBvZiBwbXUucnN0IHRvIDUuMTktcmMxCiZndDsgSSBub3RpY2VkIHRoYXQgaW4g
NS4xOS1yYzEsIHRoaXMgZG9jdW1lbnQgbm8gbG9uZ2VyIGV4aXN0cywgc28gd2UgY2FuCiZndDsg
d3JpdGUgdGhlIHN1YmplY3QgbGlrZSB0aGlz77yaCiZndDsgCiZndDsgZG9jcy96aF9DTjogcmlz
Y3Y6IFJlbW92ZSB0aGUgdHJhbnNsYXRpb24gb2YgcG11LnJzdAomZ3Q7IAomZ3Q7ICZndDsgICBk
b2NzL3poX0NOOiByaXNjdjogVXBkYXRlIHRoZSB0cmFuc2xhdGlvbiBvZiB2bS1sYXlvdXQucnN0
IHRvIDUuMTktcmMxCiZndDsgJmd0OwomZ3Q7ICZndDsgIC4uLi90cmFuc2xhdGlvbnMvemhfQ04v
cmlzY3YvZmVhdHVyZXMucnN0ICAgICB8ICAgOCArCiZndDsgV2UgZG9uJ3QgbmVlZCB0byB0cmFu
c2xhdGUgZmVhdHVyZXMucnN0LgomZ3Q7IAomZ3Q7IFRoYW5rcywKJmd0OyBZYW50ZW5nCiZndDsg
Jmd0OyAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9yaXNjdi9pbmRleC5yc3QgICAgICAgIHwgICAy
ICstCiZndDsgJmd0OyAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9yaXNjdi9wbXUucnN0ICAgICAg
ICAgIHwgMjM1IC0tLS0tLS0tLS0tLS0tLS0tLQomZ3Q7ICZndDsgIC4uLi90cmFuc2xhdGlvbnMv
emhfQ04vcmlzY3Yvdm0tbGF5b3V0LnJzdCAgICB8ICAzNyArKysKJmd0OyAmZ3Q7ICA0IGZpbGVz
IGNoYW5nZWQsIDQ2IGluc2VydGlvbnMoKyksIDIzNiBkZWxldGlvbnMoLSkKJmd0OyAmZ3Q7ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcmlzY3Yv
ZmVhdHVyZXMucnN0CiZndDsgJmd0OyAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3Jpc2N2L3BtdS5yc3QKJmd0OyAmZ3Q7CiZndDsgJmd0OyAtLQom
Z3Q7ICZndDsgMi4yMC4xCiZndDsgJmd0Owo8L3pob3ViaW5iaW5AbG9vbmdzb24uY24+PC9saW51
eC1kb2NAdmdlci5rZXJuZWwub3JnPjwvYm9id3hjQGVtYWlsLmNuPjwvY2hlbmh1YWNhaUBsb29u
Z3Nvbi5jbj48L2NvcmJldEBsd24ubmV0Pjwvc2l5YW50ZW5nQGxvb25nc29uLmNuPjwvYWxleHNA
a2VybmVsLm9yZz48L3pob3ViaW5iaW5AbG9vbmdzb24uY24+PC9zdGVybGluZ3RlbmdAZ21haWwu
Y29tPg0KDQrmnKzpgq7ku7blj4rlhbbpmYTku7blkKvmnInpvpnoiq/kuK3np5HnmoTllYbkuJrn
p5jlr4bkv6Hmga/vvIzku4XpmZDkuo7lj5HpgIHnu5nkuIrpnaLlnLDlnYDkuK3liJflh7rnmoTk
uKrkurrmiJbnvqTnu4TjgILnpoHmraLku7vkvZXlhbbku5bkurrku6Xku7vkvZXlvaLlvI/kvb/n
lKjvvIjljIXmi6zkvYbkuI3pmZDkuo7lhajpg6jmiJbpg6jliIblnLDms4TpnLLjgIHlpI3liLbm
iJbmlaPlj5HvvInmnKzpgq7ku7blj4rlhbbpmYTku7bkuK3nmoTkv6Hmga/jgILlpoLmnpzmgqjp
lJnmlLbmnKzpgq7ku7bvvIzor7fmgqjnq4vljbPnlLXor53miJbpgq7ku7bpgJrnn6Xlj5Hku7bk
urrlubbliKDpmaTmnKzpgq7ku7bjgIIgDQpUaGlzIGVtYWlsIGFuZCBpdHMgYXR0YWNobWVudHMg
Y29udGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJvbSBMb29uZ3NvbiBUZWNobm9sb2d5
ICwgd2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNvbiBvciBlbnRpdHkgd2hvc2Ug
YWRkcmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgdGhlIGluZm9ybWF0aW9uIGNvbnRh
aW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQgbm90IGxpbWl0ZWQgdG8sIHRv
dGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9uIG9yIGRpc3NlbWluYXRpb24p
IGJ5IHBlcnNvbnMgb3RoZXIgdGhhbiB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHByb2hp
Yml0ZWQuIElmIHlvdSByZWNlaXZlIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkg
dGhlIHNlbmRlciBieSBwaG9uZSBvciBlbWFpbCBpbW1lZGlhdGVseSBhbmQgZGVsZXRlIGl0LiA=


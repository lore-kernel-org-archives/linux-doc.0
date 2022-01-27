Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCABDC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 12:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240833AbiA0M6L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 07:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiA0M6K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 07:58:10 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03D2C061714
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 04:58:10 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id z199so3404926iof.10
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 04:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jnICg5umPxJCcbO3YKS8LgdijA6fT1CIffxRQURc6ug=;
        b=daj1v6oOHm5MtKaSn8JqOaIheqeiJExxURmp3kiJPhywgceySsjBo4bVASvqo2ZPMH
         tr3mpTUP24HhZ7jSmpxqL/PlygPTtxMbIW5djf4HeSWpcJyLd4OcDMBaqsIugAetuvZt
         pIKPO1sb0y91IgdWY/7rNse8+NF/robYPB8kzBzhOJ7ZIbSsML7LAm7JbloqeG2Tsvyq
         rs4yGCO8pqO2tAEznfFTiossEvFSsAFdKBputvyZKCaq8/xMCh2Z9GM/QvT8mr885O/z
         uLcqr5tIuiYlxm2j44IWhtZSv+0ubPcrlSzhofFYrNS1H6HG2agyJkkEFW3rED3ytc6/
         kZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jnICg5umPxJCcbO3YKS8LgdijA6fT1CIffxRQURc6ug=;
        b=CGYsCJmYgkdAzAhnGXQ5qx1HQbC9Q+vFP88wi3pNxu775ej0LZaD9ZoMiYAo6EIKbi
         5+hFKHuoQQxNdW9LsvQqdCgp67MWibLtAqcEcamnRnliLlIdq9rzjjcs9kWkvI0MhRVz
         /nh+C14bTAdtPwjCXjuLtEvtq811OIq0xkmSWGXswPU5nbRZZEt2uEgdDRp+erqBoqRd
         XBC02j1G08kMbG1gLEcTVk7UubAuHjz6s5u4WL/PGVr5f/mmJ4QwTKkixerbsE0XCMOp
         u+H1NHyoYPdoJ7FDhAWGCVlbkXWJd/EMQIZ8DiVBPyW3g5zW7JPoA54hpQM/vuyly7AP
         OHzQ==
X-Gm-Message-State: AOAM5323En09QgtTaRvHcX4Ts/ooPAsBGWyUHnAiMhtTLezh4DlUXFnp
        nZNCEouaWaCxwi3YgEqcFtthKN1Z0ep52adWwRw=
X-Google-Smtp-Source: ABdhPJz9D0J/HUo2efcMKsERVH7QCxlE83CjGkt7O0t4RizwZbWB+BC+nUtn7mcOKFrvj5MPlySJBbBslNqfk46A3Vs=
X-Received: by 2002:a5e:d509:: with SMTP id e9mr1889999iom.93.1643288290066;
 Thu, 27 Jan 2022 04:58:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643246827.git.siyanteng@loongson.cn> <4ef77c1be8319fc45b18e9f4c41986095d794562.1643246827.git.siyanteng@loongson.cn>
In-Reply-To: <4ef77c1be8319fc45b18e9f4c41986095d794562.1643246827.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 27 Jan 2022 20:57:34 +0800
Message-ID: <CAJy-AmkqPV3MW3b8JgZ4Yj3eVeoJ7=S-gnWmJGd4dzRSH3k+8g@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: add free_page_reporting translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBKYW4gMjcsIDIwMjIgYXQgOTo1MCBBTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgLi4uL3ZtL2ZyZWVfcGFnZV9yZXBvcnRp
bmcucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5
YW50ZW5nQGxvb25nc29uLmNuPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5l
bC5vcmc+DQoNCj4gLS0tDQo+ICAuLi4vemhfQ04vdm0vZnJlZV9wYWdlX3JlcG9ydGluZy5yc3Qg
ICAgICAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrDQo+ICBEb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAgNSArKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwg
NDEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBE
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9mcmVlX3BhZ2VfcmVwb3J0aW5nLnJz
dA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0v
ZnJlZV9wYWdlX3JlcG9ydGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9D
Ti92bS9mcmVlX3BhZ2VfcmVwb3J0aW5nLnJzdA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjY4OTRlMjZjZTA3OQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2ZyZWVfcGFnZV9yZXBvcnRpbmcu
cnN0DQo+IEBAIC0wLDAgKzEsMzggQEANCj4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpo
X0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRpb24vdm0vX2ZyZWVfcGFnZV9y
ZXBvcnRpbmcucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4gWWFudGVu
ZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiArDQo+ICs9
PT09PT09PT09DQo+ICvnqbrpl7LpobXmiqXlkYoNCj4gKz09PT09PT09PT0NCj4gKw0KPiAr56m6
6Zey6aG15oql5ZGK5piv5LiA5LiqQVBJ77yM6K6+5aSH5Y+v5Lul6YCa6L+H5a6D5p2l5rOo5YaM
5o6l5pS257O757uf5b2T5YmN5pyq5L2/55So55qE6aG16Z2i5YiX6KGo44CC6L+Z5Zyo6Jma5ouf
DQo+ICvljJbnmoTmg4XlhrXkuIvmmK/lvojmnInnlKjnmoTvvIzlrqLmiLfmnLrog73lpJ/kvb/n
lKjov5nkupvmlbDmja7mnaXpgJrnn6XnrqHnkIblmajlroPkuI3lho3kvb/nlKjlhoXlrZjkuK3n
moTmn5DkupvpobUNCj4gK+mdouOAgg0KPiArDQo+ICvlr7nkuo7pqbHliqjvvIzpgJrluLjmmK/m
sJTnkIPpqbHliqjopoHkvb/nlKjov5nkuKrlip/og73vvIzlroPlsIbliIbphY3lkozliJ3lp4vl
jJbkuIDkuKpwYWdlX3JlcG9ydGluZ19kZXZfaW5mbw0KPiAr57uT5p6E5L2T44CC5a6D6KaB5aGr
5YWF55qE57uT5p6E5L2T5Lit55qE5a2X5q615piv55So5LqO5aSE55CG5pWj54K55YiX6KGo55qE
ICJyZXBvcnQiIOWHveaVsOaMh+mSiOOAguWug+i/mOW/hQ0KPiAr6aG75L+d6K+B5q+P5qyh6LCD
55So6K+l5Ye95pWw5pe26IO95aSE55CG6Iez5bCR55u45b2T5LqOUEFHRV9SRVBPUlRJTkdfQ0FQ
QUNJVFnnmoTmlaPngrnliJfooajmnaHnm67jgIINCj4gK+WBh+iuvuayoeacieWFtuS7lumhtemd
ouaKpeWRiuiuvuWkh+W3sue7j+azqOWGjO+8jCDlr7lwYWdlX3JlcG9ydGluZ19yZWdpc3Rlcuea
hOiwg+eUqOWwhuWQkeaKpeWRiuahhg0KPiAr5p625rOo5YaM6aG16Z2i5oql5ZGK5o6l5Y+j44CC
DQo+ICsNCj4gK+S4gOaXpuazqOWGjO+8jOmhtemdouaKpeWRikFQSeWwhuW8gOWni+WQkempseWK
qOaKpeWRiuaIkOaJueeahOmhtemdouOAgkFQSeWwhuWcqOaOpeWPo+iiq+azqOWGjOWQjjLnp5Ll
vIDlp4vmiqXlkYoNCj4gK+mhtemdou+8jOW5tuWcqOS7u+S9lei2s+Wkn+mrmOeahOmhtemdouii
q+mHiuaUvuS5i+WQjjLnp5Lnu6fnu63miqXlkYrjgIINCj4gKw0KPiAr5oql5ZGK55qE6aG16Z2i
5bCG6KKr5a2Y5YKo5Zyo5Lyg6YCS57uZ5oql5ZGK5Ye95pWw55qE5pWj5YiX6KGo5Lit77yM5pyA
5ZCO5LiA5Liq5p2h55uu55qE57uT5p2f5L2N6KKr6K6+572u5Zyo5p2h55uuDQo+ICtuZW50LTHk
uK3jgIIg5b2T6aG16Z2i6KKr5oql5ZGK5Ye95pWw5aSE55CG5pe277yM5YiG6YWN5Zmo5bCG5peg
5rOV6K6/6Zeu5a6D5Lus44CC5LiA5pem5oql5ZGK5Ye95pWw5a6M5oiQ77yM6L+Z5LqbDQo+ICvp
obXlsIbooqvov5Tlm57liLDlroPku6zmiYDojrflvpfnmoToh6rnlLHljLrln5/jgIINCj4gKw0K
PiAr5Zyo56e76Zmk5L2/55So56m66Zey6aG15oql5ZGK55qE6amx5Yqo5LmL5YmN77yM5pyJ5b+F
6KaB6LCD55SocGFnZV9yZXBvcnRpbmdfdW5yZWdpc3Rlcu+8jOS7peenu+mZpA0KPiAr55uu5YmN
6KKr56m66Zey6aG15oql5ZGK5L2/55So55qEcGFnZV9yZXBvcnRpbmdfZGV2X2luZm/nu5PmnoTk
vZPjgILov5nmoLflgZrlsIbpmLvmraLov5vkuIDmraXnmoTmiqUNCj4gK+WRiumAmui/h+ivpeaO
peWPo+WPkeWHuuOAguWmguaenOWPpuS4gOS4qumpseWKqOaIluWQjOS4gOmpseWKqOiiq+azqOWG
jO+8jOWug+WwseacieWPr+iDveaBouWkjeWJjeS4gOS4qumpseWKqOWcqOaKpeWRig0KPiAr56m6
6Zey6aG15pa56Z2i55qE5bel5L2c44CCDQo+ICsNCj4gKw0KPiArQWxleGFuZGVyIER1eWNrLCAy
MDE55bm0MTLmnIgwNOaXpQ0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdm0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
dm0vaW5kZXgucnN0DQo+IGluZGV4IGZjMzlmMGQ2MDMxOC4uOWNkZmRlMDM2NGYwIDEwMDY0NA0K
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4g
KysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+IEBA
IC0yMywxNyArMjMsMTggQEAgVE9ETzrlvoXlvJXnlKjmlofmoaPpm4booqvnv7vor5Hlrozmr5Xl
kI7or7flj4rml7bkv67mlLnmraTlpITvvIkNCj4NCj4gICAgIGFjdGl2ZV9tbQ0KPiAgICAgYmFs
YW5jZQ0KPiArICAgZGFtb24vaW5kZXgNCj4gKyAgIGZyZWVfcGFnZV9yZXBvcnRpbmcNCj4gKyAg
IGtzbQ0KPg0KPiAgVE9ET0xJU1Q6DQo+ICAqIGFyY2hfcGd0YWJsZV9oZWxwZXJzDQo+IC0qIGRh
bW9uL2luZGV4DQo+ICAqIGZyZWVfcGFnZV9yZXBvcnRpbmcNCj4gICogZnJvbnRzd2FwDQo+ICAq
IGhpZ2htZW0NCj4gICogaG1tDQo+ICAqIGh3cG9pc29uDQo+ICAqIGh1Z2V0bGJmc19yZXNlcnYN
Cj4gLSoga3NtDQo+ICAqIG1lbW9yeS1tb2RlbA0KPiAgKiBtbXVfbm90aWZpZXINCj4gICogbnVt
YQ0KPiAtLQ0KPiAyLjI3LjANCj4NCg==

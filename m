Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A91C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 15:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344049AbiCHPRr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 10:17:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343967AbiCHPRr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 10:17:47 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B740C49C8D
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 07:16:50 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id j29so1382533ila.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 07:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5YDpKssXHrAgqXX1v2GL2q2XsE+iA/mVHCngQH4pht8=;
        b=jA/ERObqOEovU6VQSZEM+zhfpDFz+LD4rKaZGEXaf2C4GmUPciqwkAe+9R++jvRbZX
         DGf1DzW71Ub2rzzJqhndnDhiDrVmhN1FUgXLq8ofQ9Y4HBlaXRY7HQK1Erm356FVqcYp
         PzqhWDsixPmn5dEWPZilBXFtg/4HgAu/cTts2inTI5d70CutLruFAPm7wA3CEZQ5z2+Q
         wKV1NSnMnL/l4ulR6m+7OgUx8VboYT+pQqOz7l3oGtq90jAcVQmyZytGrKeZtkLxezwU
         BmqXx3yPKhuISppRHeuUXS5J6zjXcfbYfvRhBocQoxxthOZ00+7JUb1HSQZvLjwSPU2x
         XeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5YDpKssXHrAgqXX1v2GL2q2XsE+iA/mVHCngQH4pht8=;
        b=VYTvayifz9E548tIc5YgUeUFeMXoqyEL59bp7kJKPcdZyYzAGyKX7q7FwHVqYbBCT1
         6+2UB3KzjMKAjWwi1kwCT54yCBR9EOd2/UOJBVCpoe0K0358mx2tmSixH0sIWeZCHtP9
         8qH+0JdtZTIf9B9dYMDISpoiSt4zdFiugLEiB1of/DNH7IFxvSAFnTEuXldNth/lrOPn
         VWXYHvq8yRr1ehPADjSNERMUhW6fS85cwRMHtosGZ1MfyofKQW/nqPY1TS8bvmprb4Z4
         GyyUJzYGBjASdv5oNsYACUPZI7LpZEq9SOtLlnVMsFyZo/mgvQCHn66yF9gMn1W5CChI
         SGTw==
X-Gm-Message-State: AOAM532wxFMYXcrbbUDQSfR/DK6VLBSnF/WMqfOSDb3mtz7UT0voAy+0
        zkV1gsYJI8kvtvecup1csLy0t/63EuiyAgmWxKM=
X-Google-Smtp-Source: ABdhPJx8Z7mJMIjM856qQacHkOnJYrdt12x7mor4+A41CJwqXZPxIvwDXcA6AE3kxplpHaprz7NAzsQ9Ik+0/YzLie4=
X-Received: by 2002:a05:6e02:1746:b0:2c2:8a1f:8ca6 with SMTP id
 y6-20020a056e02174600b002c28a1f8ca6mr15675570ill.178.1646752609493; Tue, 08
 Mar 2022 07:16:49 -0800 (PST)
MIME-Version: 1.0
References: <cover.1646496448.git.siyanteng@loongson.cn> <f8b38603bc022c4d2c8017bf8b66a4c26bc48fb3.1646496448.git.siyanteng@loongson.cn>
In-Reply-To: <f8b38603bc022c4d2c8017bf8b66a4c26bc48fb3.1646496448.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 8 Mar 2022 23:16:13 +0800
Message-ID: <CAJy-AmnQqooh7OpNG_wpwoaCsyZLNFPyyaYgNKHUZv15_vvgvQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] docs/zh_CN: add vm overcommit-accounting translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBNYXIgNiwgMjAyMiBhdCAxMjoyNSBBTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgLi4uL3ZtL292ZXJjb21taXQtYWNjb3Vu
dGluZy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxz
aXlhbnRlbmdAbG9vbmdzb24uY24+DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vdm0vaW5kZXgucnN0IHwgIDIgKy0NCj4gIC4uLi96aF9DTi92bS9vdmVyY29tbWl0
LWFjY291bnRpbmcucnN0ICAgICAgICB8IDg2ICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmls
ZXMgY2hhbmdlZCwgODcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL292ZXJjb21taXQt
YWNjb3VudGluZy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL3ZtL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3ZtL2luZGV4LnJzdA0KPiBpbmRleCA5MTllODc5YjgxNjcuLjJhM2E5M2E0YzA1MCAxMDA2NDQN
Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0DQo+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiBA
QCAtMzAsNiArMzAsNyBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQ
juivt+WPiuaXtuS/ruaUueatpOWkhO+8iQ0KPiAgICAgaHdwb2lzb24NCj4gICAgIG1lbW9yeS1t
b2RlbA0KPiAgICAgbW11X25vdGlmaWVyDQo+ICsgICBvdmVyY29tbWl0LWFjY291bnRpbmcNCj4N
Cj4gIFRPRE9MSVNUOg0KPiAgKiBhcmNoX3BndGFibGVfaGVscGVycw0KPiBAQCAtMzcsNyArMzgs
NiBAQCBUT0RPTElTVDoNCj4gICogaG1tDQo+ICAqIGh1Z2V0bGJmc19yZXNlcnYNCj4gICogbnVt
YQ0KPiAtKiBvdmVyY29tbWl0LWFjY291bnRpbmcNCj4gICogcGFnZV9taWdyYXRpb24NCj4gICog
cGFnZV9mcmFncw0KPiAgKiBwYWdlX293bmVyDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi92bS9vdmVyY29tbWl0LWFjY291bnRpbmcucnN0IGIvRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vb3ZlcmNvbW1pdC1hY2NvdW50aW5nLnJzdA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjFlM2VhZTEzMzhj
Yg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3ZtL292ZXJjb21taXQtYWNjb3VudGluZy5yc3QNCj4gQEAgLTAsMCArMSw4NiBAQA0KPiAr
Ok9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3ZtL292ZXJjb21taXQucnN0DQoNCkRvY3VtZW50YXRp
b24vdm0vb3ZlcmNvbW1pdC1hY2NvdW50aW5nLnJzdCA/DQoNCj4gKw0KPiArOue/u+ivkToNCj4g
Kw0KPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ICsN
Cj4gKzrmoKHor5E6DQo+ICsNCj4gKw0KPiArDQo+ICs9PT09PT09PT09PT09PQ0KPiArT3ZlcmNv
bW1pdOWuoeiuoQ0KDQpvdmVyY29tbWl0IC0+IOi2hemHj+S9v+eUqD8NCg0KPiArPT09PT09PT09
PT09PT0NCj4gKw0KPiArTGludXjlhoXmoLjmlK/mjIHkuIvliJdvdmVyY29tbWl05aSE55CG5qih
5byPDQo+ICsNCj4gKzANCj4gKyAgICAgICDlkK/lj5HlvI9vdmVyY29tbWl05aSE55CG44CC5ouS
57ud5piO5pi+55qE5Zyw5Z2A56m66Ze0b3ZlcmNvbW1pdOOAgueUqOS6juS4gOS4quWFuOWei+ea
hOezu+e7n+OAgg0KPiArICAgICAgIOWug+ehruS/neS4pemHjeeahOeWr+eLguWIhumFjeWksei0
pe+8jOWQjOaXtuWFgeiuuG92ZXJjb21taXTku6Xlh4/lsJFzd2Fw55qE5L2/55So44CC5Zyo6L+Z
56eN5qih5byP5LiL77yMDQo+ICsgICAgICAg5YWB6K64cm9vdOWIhumFjeeojeWkmueahOWGheWt
mOOAgui/meaYr+m7mOiupOeahOOAgg0KPiArMQ0KPiArICAgICAgIOaAu+aYr292ZXJjb21taXTj
gILpgILnlKjkuo7kuIDkupvnp5HlrablupTnlKjjgILnu4/lhbjnmoTkvovlrZDmmK/kvb/nlKjn
qIDnlo/mlbDnu4TnmoTku6PnoIHvvIzlj6rmmK/kvp3otZYNCj4gKyAgICAgICDlh6DkuY7lrozl
hajnlLHpm7bpobXnu4TmiJDnmoTomZrmi5/lhoXlrZgNCj4gKw0KPiArMg0KPiArICAgICAgIOS4
jW92ZXJjb21taXTjgILns7vnu5/mj5DkuqTnmoTmgLvlnLDlnYDnqbrpl7TkuI3lhYHorrjotoXo
v4dzd2FwK+S4gOS4quWPr+mFjee9rueahOeJqeeQhlJBTeeahOaVsOmHjw0KPiArICAgICAgIO+8
iOm7mOiupOS4ujUwJe+8ieOAguagueaNruS9oOS9v+eUqOeahOaVsOmHj++8jOWcqOWkp+WkmuaV
sOaDheWGteS4i++8jOi/meaEj+WRs+edgOS4gOS4qui/m+eoi+WcqOiuv+mXrumhtemdouaXtg0K
PiArICAgICAgIOS4jeS8muiiq+adgOatu++8jOS9huS8muWcqOWGheWtmOWIhumFjeS4iuaUtuWI
sOebuOW6lOeahOmUmeivr+OAgg0KPiArDQo+ICsgICAgICAg5a+55LqO6YKj5Lqb5oOz5L+d6K+B
5LuW5Lus55qE5YaF5a2Y5YiG6YWN5Zyo5pyq5p2l5Y+v55So6ICM5Y+I5LiN6ZyA6KaB5Yid5aeL
5YyW5q+P5LiA5Liq6aG16Z2i55qE5bqU55So56iL5bqP5p2l6K+0DQo+ICsgICAgICAg5piv5b6I
5pyJ55So55qE44CCDQo+ICsNCj4gK292ZXJjb21taXTnrZbnlaXmmK/pgJrov4dzeXNjdGwgIGB2
bS5vdmVyY29tbWl0X21lbW9yeWAg6K6+572u55qE44CCDQo+ICsNCj4gK+WPr+S7pemAmui/hyBg
dm0ub3ZlcmNvbW1pdF9yYXRpb2Ag77yI55m+5YiG5q+U77yJ5oiWIGB2bS5vdmVyY29tbWl0X2ti
eXRlc2Ag77yI57ud5a+55YC877yJDQo+ICvmnaXorr7nva7otoXpmZDmlbDph4/jgILov5nkupvl
j6rmnInlnKggYHZtLm92ZXJjb21taXRfbWVtb3J5YCDooqvorr7nva7kuLoy5pe25omN5pyJ5pWI
5p6c44CCDQo+ICsNCj4gK+WcqCBgYC9wcm9jL21lbWluZm9gYCDkuK3lj6/ku6XliIbliKvku6VD
b21taXRMaW1pdOWSjENvbW1pdHRlZF9BU+eahOW9ouW8j+afpeeci+W9k+WJjQ0KPiAr55qEb3Zl
cmNvbW1pdOWSjOaPkOS6pOmHj+OAgg0KPiArDQo+ICvpmbfpmLENCj4gKz09PT0NCj4gKw0KPiAr
Q+ivreiogOeahOWghuagiOWinumVv+aYr+S4gOS4qumakOWQq+eahG1yZW1hcOOAguWmguaenOS9
oOaDs+W+l+WIsOe7neWvueeahOS/neivge+8jOW5tuWcqOaOpei/kei+uee8mOeahOWcsOaWuei/
kOihjO+8jA0KPiAr5L2gICoq5b+F6aG7Kiog5Li65L2g6K6k5Li65L2g6ZyA6KaB55qE5pyA5aSn
5bC65a+455qE5aCG5qCI6L+b6KGMbW1hcOOAguWvueS6juWFuOWei+eahOWghuagiOS9v+eUqOad
peivtO+8jOi/meW5tg0KPiAr5LiN6YeN6KaB77yM5L2G5aaC5p6c5L2g55yf55qE6Z2e5bi45YWz
5b+D55qE6K+d77yM6L+Z5bCx5piv5LiA5Liq5YC85b6X5YWz5rOo55qE5qGI5L6L44CCDQo+ICsN
Cj4gKw0KPiAr5Zyo5qih5byPMuS4re+8jE1BUF9OT1JFU0VSVkXmoIflv5fooqvlv73nlaXjgIIN
Cj4gKw0KPiArDQo+ICvlroPmmK/lpoLkvZXlt6XkvZznmoQNCj4gKz09PT09PT09PT09PT09DQo+
ICsNCj4gK292ZXJjb21taXTmmK/ln7rkuo7ku6XkuIvop4TliJkNCj4gKw0KPiArRm9yIGEgZmls
ZSBiYWNrZWQgbWFwDQoNCuWvueS6juaWh+S7tuaYoOWwhA0KDQo+ICsgICAgICAgfCBTSEFSRUQg
b3IgUkVBRC1vbmx5ICAgLSAgICAgICAwIGNvc3QgKOivpeaWh+S7tuaYr+aYoOWwhOiAjOS4jeaY
r+S6pOaNoikNCj4gKyAgICAgICB8IFBSSVZBVEUgV1JJVEFCTEUgICAgICAtICAgICAgIOavj+S4
quWunuS+i+eahOaYoOWwhOWkp+Wwjw0KPiArDQo+ICtGb3IgYW4gYW5vbnltb3VzIG9yIGBgL2Rl
di96ZXJvYGAgbWFwDQrlr7nkuo7ljL/lkI3miJbogIUvZGV2L3plcm8g5pig5bCE77yfDQoNCj4g
KyAgICAgICB8IFNIQVJFRCAgICAgICAgICAgICAgICAgICAgICAgIC0gICAgICAg5pig5bCE55qE
5aSn5bCPDQo+ICsgICAgICAgfCBQUklWQVRFIFJFQUQtb25seSAgICAgLSAgICAgICAwIGNvc3Qg
KOS9huS9nOeUqOS4jeWkpykNCj4gKyAgICAgICB8IFBSSVZBVEUgV1JJVEFCTEUgICAgICAtICAg
ICAgIOavj+S4quWunuS+i+eahOaYoOWwhOWkp+Wwjw0KPiArDQo+ICtBZGRpdGlvbmFsIGFjY291
bnRpbmcNCumineWklueahOiuoeaVsA0KDQo+ICsgICAgICAgfCDpgJrov4dtbWFw5Yi25L2c5Y+v
5YaZ5Ymv5pys55qE6aG16Z2iDQo+ICsgICAgICAgfCDku47lkIzkuIDmsaDkuK3mj5Dlj5bnmoRz
aG1mc+WGheWtmA0KPiArDQo+ICvnirbmgIENCj4gKz09PT0NCj4gKw0KPiArKiAgICAgIOaIkeS7
rOaguOeul21tYXDlhoXlrZjmmKDlsIQNCj4gKyogICAgICDmiJHku6zmoLjnrpdtcHJvdGVjdOWc
qOaPkOS6pOS4reeahOWPmOWMlg0KPiArKiAgICAgIOaIkeS7rOaguOeul21yZW1hcOeahOWkp+Ww
j+WPmOWMlg0KPiArKiAgICAgIOaIkeS7rOeahOWuoeiuoSBicmsNCj4gKyogICAgICDlrqHorqFt
dW5tYXANCj4gKyogICAgICDmiJHku6zlnKgvcHJvY+S4reaKpeWRimNvbW1pdCDnirbmgIENCj4g
KyogICAgICDmoLjlr7nlubbmo4Dmn6XliIblj4nnmoTmg4XlhrUNCj4gKyogICAgICDlrqHmn6Xl
oIbmoIjlpITnkIYv5omn6KGM5Lit55qE5p6E5bu6DQo+ICsqICAgICAg5Y+Z6L+wU0hNZnPnmoTm
g4XlhrUNCj4gKyogICAgICDlrp7njrDlrp7pmYXpmZDliLbnmoTmiafooYwNCj4gKw0KPiAr5b6F
57utDQo+ICs9PT09DQo+ICsqICAgICAg5biQ5oi3dHJhY2XpobXvvIjov5nlvojpmr7vvInjgIIN
Cg0KcHRyYWNlIOmhteiuoeaVsO+8nw0KDQpUaGFua3MNCkFsZXgNCg0KPiAtLQ0KPiAyLjI3LjAN
Cj4NCg==

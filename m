Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D64E6C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 14 Mar 2022 12:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239640AbiCNML2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 08:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240789AbiCNMHy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 08:07:54 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D0E2612F
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 05:03:54 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id u10so30189325ybd.9
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 05:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VKHSptGTtDWpWAfeYmE7mRLCiwPqgGT9ni2QXIekWXQ=;
        b=BCG4ZUpHpZ35ywjf43lyzLvpb+sYPvX8ZhjcGSL3OGG+OkmxlOd/Deo5LqjXi0twfw
         2+5QWTO/DnrZVrfuodoZ2l7M6pma1XaNRowrOZTmegDFmaCcbAzaW39qdS7MK6HL8dBf
         lhGMDfeQF33FMJMs/IyZNn9UuQPCKvO/vgyKDMHY8VsQwiOrNCNeZV8QunQq1br2iH/V
         jTUfnoWRIh52zUYcTzO+uX2eB+4ZuUK7BwMrhAx9vKCfsmqXYL0YvtXd+qx3y6HfgN88
         Cct3q9gRqX5at6OPkmu3mTmF38u00gVolaTphSWsVqE59qaRGKRYPc4LbaYoSsT+gvSW
         hAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VKHSptGTtDWpWAfeYmE7mRLCiwPqgGT9ni2QXIekWXQ=;
        b=4+S3JmEYbjkeI2m4JR9ja8t3sG7fBKran3mKsOK4xqYE+w4wUfVXlHpC5Tq45ELGW3
         7txIaLVZkFZfoL6epwUtBfaSE/TmdBcfFwU/PvJkaT5PWT38emc+as+WNZdpQIOdBqiB
         1NnVzseVyZkQ93P19GVluxZTXqIbrmF19ac+4kpqdcMXE0klQs8AC6zVo2p5JcMtZJAw
         rV34vjuUGnS8UMwWxM2oP1iKNckYf46VgR20+dKmH3NLNyBGkYM9jx9jlkqvGi7osaSS
         aicJZgCfsHmNElsCRvjlM347HCxWzRa7+UN7qVQUO6K3rXnChTonbKRDNbeOHopNlM3d
         pb7g==
X-Gm-Message-State: AOAM531ru92/Wbr6pvHSBXpc83K1Ty9DDflu5/KjdvuadguCu7AeEFgk
        H3E26LghH68ZCQoQTVpfD4tqFZjly86yPi/nFxw=
X-Google-Smtp-Source: ABdhPJyrOxsHZbpYXth6x44p9Cpa1sNkR3yX5G055Zk+iyG8kYrZoVHwfnpbaya0c9ig353MTEoG9wkenXO2Li7O3Dw=
X-Received: by 2002:a25:9a43:0:b0:628:672c:e471 with SMTP id
 r3-20020a259a43000000b00628672ce471mr16228440ybo.73.1647259433443; Mon, 14
 Mar 2022 05:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1646496448.git.siyanteng@loongson.cn> <f8b38603bc022c4d2c8017bf8b66a4c26bc48fb3.1646496448.git.siyanteng@loongson.cn>
 <CAJy-AmnQqooh7OpNG_wpwoaCsyZLNFPyyaYgNKHUZv15_vvgvQ@mail.gmail.com>
In-Reply-To: <CAJy-AmnQqooh7OpNG_wpwoaCsyZLNFPyyaYgNKHUZv15_vvgvQ@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 14 Mar 2022 20:03:30 +0800
Message-ID: <CAEensMw2TQv7SezQ1rYvfjdYH_cF3Ko+QAi0Kngfy+8kRsauOQ@mail.gmail.com>
Subject: Re: [PATCH 05/12] docs/zh_CN: add vm overcommit-accounting translation
To:     Alex Shi <seakeel@gmail.com>
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

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIy5bm0M+aciDjml6XlkajkuowgMjM6
MTblhpnpgZPvvJoNCj4NCj4gT24gU3VuLCBNYXIgNiwgMjAyMiBhdCAxMjoyNSBBTSBZYW50ZW5n
IFNpIDxzaXlhbnRlbmcwMUBnbWFpbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gVHJhbnNsYXRlIC4u
Li92bS9vdmVyY29tbWl0LWFjY291bnRpbmcucnN0IGludG8gQ2hpbmVzZS4NCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCj4gPiAtLS0N
Cj4gPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5kZXgucnN0IHwgIDIg
Ky0NCj4gPiAgLi4uL3poX0NOL3ZtL292ZXJjb21taXQtYWNjb3VudGluZy5yc3QgICAgICAgIHwg
ODYgKysrKysrKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL292ZXJjb21taXQtYWNjb3VudGluZy5yc3QNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRl
eC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4g
PiBpbmRleCA5MTllODc5YjgxNjcuLjJhM2E5M2E0YzA1MCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiArKysgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiBAQCAtMzAsNiAr
MzAsNyBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQjuivt+WPiuaX
tuS/ruaUueatpOWkhO+8iQ0KPiA+ICAgICBod3BvaXNvbg0KPiA+ICAgICBtZW1vcnktbW9kZWwN
Cj4gPiAgICAgbW11X25vdGlmaWVyDQo+ID4gKyAgIG92ZXJjb21taXQtYWNjb3VudGluZw0KPiA+
DQo+ID4gIFRPRE9MSVNUOg0KPiA+ICAqIGFyY2hfcGd0YWJsZV9oZWxwZXJzDQo+ID4gQEAgLTM3
LDcgKzM4LDYgQEAgVE9ET0xJU1Q6DQo+ID4gICogaG1tDQo+ID4gICogaHVnZXRsYmZzX3Jlc2Vy
dg0KPiA+ICAqIG51bWENCj4gPiAtKiBvdmVyY29tbWl0LWFjY291bnRpbmcNCj4gPiAgKiBwYWdl
X21pZ3JhdGlvbg0KPiA+ICAqIHBhZ2VfZnJhZ3MNCj4gPiAgKiBwYWdlX293bmVyDQo+ID4gZGlm
ZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL292ZXJjb21taXQt
YWNjb3VudGluZy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9vdmVy
Y29tbWl0LWFjY291bnRpbmcucnN0DQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRl
eCAwMDAwMDAwMDAwMDAuLjFlM2VhZTEzMzhjYg0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9vdmVyY29tbWl0LWFjY291bnRp
bmcucnN0DQo+ID4gQEAgLTAsMCArMSw4NiBAQA0KPiA+ICs6T3JpZ2luYWw6IERvY3VtZW50YXRp
b24vdm0vb3ZlcmNvbW1pdC5yc3QNCj4NCj4gRG9jdW1lbnRhdGlvbi92bS9vdmVyY29tbWl0LWFj
Y291bnRpbmcucnN0ID8NCm9rIQ0KPg0KPiA+ICsNCj4gPiArOue/u+ivkToNCj4gPiArDQo+ID4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4g
PiArOuagoeivkToNCj4gPiArDQo+ID4gKw0KPiA+ICsNCj4gPiArPT09PT09PT09PT09PT0NCj4g
PiArT3ZlcmNvbW1pdOWuoeiuoQ0KPg0KPiBvdmVyY29tbWl0IC0+IOi2hemHj+S9v+eUqD8NCm9r
IQ0KPg0KPiA+ICs9PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArTGludXjlhoXmoLjmlK/mjIHk
uIvliJdvdmVyY29tbWl05aSE55CG5qih5byPDQo+ID4gKw0KPiA+ICswDQo+ID4gKyAgICAgICDl
kK/lj5HlvI9vdmVyY29tbWl05aSE55CG44CC5ouS57ud5piO5pi+55qE5Zyw5Z2A56m66Ze0b3Zl
cmNvbW1pdOOAgueUqOS6juS4gOS4quWFuOWei+eahOezu+e7n+OAgg0KPiA+ICsgICAgICAg5a6D
56Gu5L+d5Lil6YeN55qE55av54uC5YiG6YWN5aSx6LSl77yM5ZCM5pe25YWB6K64b3ZlcmNvbW1p
dOS7peWHj+WwkXN3YXDnmoTkvb/nlKjjgILlnKjov5nnp43mqKHlvI/kuIvvvIwNCj4gPiArICAg
ICAgIOWFgeiuuHJvb3TliIbphY3nqI3lpJrnmoTlhoXlrZjjgILov5nmmK/pu5jorqTnmoTjgIIN
Cj4gPiArMQ0KPiA+ICsgICAgICAg5oC75pivb3ZlcmNvbW1pdOOAgumAgueUqOS6juS4gOS6m+en
keWtpuW6lOeUqOOAgue7j+WFuOeahOS+i+WtkOaYr+S9v+eUqOeogOeWj+aVsOe7hOeahOS7o+eg
ge+8jOWPquaYr+S+nei1lg0KPiA+ICsgICAgICAg5Yeg5LmO5a6M5YWo55Sx6Zu26aG157uE5oiQ
55qE6Jma5ouf5YaF5a2YDQo+ID4gKw0KPiA+ICsyDQo+ID4gKyAgICAgICDkuI1vdmVyY29tbWl0
44CC57O757uf5o+Q5Lqk55qE5oC75Zyw5Z2A56m66Ze05LiN5YWB6K646LaF6L+Hc3dhcCvkuIDk
uKrlj6/phY3nva7nmoTniannkIZSQU3nmoTmlbDph48NCj4gPiArICAgICAgIO+8iOm7mOiupOS4
ujUwJe+8ieOAguagueaNruS9oOS9v+eUqOeahOaVsOmHj++8jOWcqOWkp+WkmuaVsOaDheWGteS4
i++8jOi/meaEj+WRs+edgOS4gOS4qui/m+eoi+WcqOiuv+mXrumhtemdouaXtg0KPiA+ICsgICAg
ICAg5LiN5Lya6KKr5p2A5q2777yM5L2G5Lya5Zyo5YaF5a2Y5YiG6YWN5LiK5pS25Yiw55u45bqU
55qE6ZSZ6K+v44CCDQo+ID4gKw0KPiA+ICsgICAgICAg5a+55LqO6YKj5Lqb5oOz5L+d6K+B5LuW
5Lus55qE5YaF5a2Y5YiG6YWN5Zyo5pyq5p2l5Y+v55So6ICM5Y+I5LiN6ZyA6KaB5Yid5aeL5YyW
5q+P5LiA5Liq6aG16Z2i55qE5bqU55So56iL5bqP5p2l6K+0DQo+ID4gKyAgICAgICDmmK/lvojm
nInnlKjnmoTjgIINCj4gPiArDQo+ID4gK292ZXJjb21taXTnrZbnlaXmmK/pgJrov4dzeXNjdGwg
IGB2bS5vdmVyY29tbWl0X21lbW9yeWAg6K6+572u55qE44CCDQo+ID4gKw0KPiA+ICvlj6/ku6Xp
gJrov4cgYHZtLm92ZXJjb21taXRfcmF0aW9gIO+8iOeZvuWIhuavlO+8ieaIliBgdm0ub3ZlcmNv
bW1pdF9rYnl0ZXNgIO+8iOe7neWvueWAvO+8iQ0KPiA+ICvmnaXorr7nva7otoXpmZDmlbDph4/j
gILov5nkupvlj6rmnInlnKggYHZtLm92ZXJjb21taXRfbWVtb3J5YCDooqvorr7nva7kuLoy5pe2
5omN5pyJ5pWI5p6c44CCDQo+ID4gKw0KPiA+ICvlnKggYGAvcHJvYy9tZW1pbmZvYGAg5Lit5Y+v
5Lul5YiG5Yir5LulQ29tbWl0TGltaXTlkoxDb21taXR0ZWRfQVPnmoTlvaLlvI/mn6XnnIvlvZPl
iY0NCj4gPiAr55qEb3ZlcmNvbW1pdOWSjOaPkOS6pOmHj+OAgg0KPiA+ICsNCj4gPiAr6Zm36Zix
DQo+ID4gKz09PT0NCj4gPiArDQo+ID4gK0Por63oqIDnmoTloIbmoIjlop7plb/mmK/kuIDkuKrp
mpDlkKvnmoRtcmVtYXDjgILlpoLmnpzkvaDmg7PlvpfliLDnu53lr7nnmoTkv53or4HvvIzlubbl
nKjmjqXov5HovrnnvJjnmoTlnLDmlrnov5DooYzvvIwNCj4gPiAr5L2gICoq5b+F6aG7Kiog5Li6
5L2g6K6k5Li65L2g6ZyA6KaB55qE5pyA5aSn5bC65a+455qE5aCG5qCI6L+b6KGMbW1hcOOAguWv
ueS6juWFuOWei+eahOWghuagiOS9v+eUqOadpeivtO+8jOi/meW5tg0KPiA+ICvkuI3ph43opoHv
vIzkvYblpoLmnpzkvaDnnJ/nmoTpnZ7luLjlhbPlv4PnmoTor53vvIzov5nlsLHmmK/kuIDkuKrl
gLzlvpflhbPms6jnmoTmoYjkvovjgIINCj4gPiArDQo+ID4gKw0KPiA+ICvlnKjmqKHlvI8y5Lit
77yMTUFQX05PUkVTRVJWReagh+W/l+iiq+W/veeVpeOAgg0KPiA+ICsNCj4gPiArDQo+ID4gK+Wu
g+aYr+WmguS9leW3peS9nOeahA0KPiA+ICs9PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiArb3Zl
cmNvbW1pdOaYr+WfuuS6juS7peS4i+inhOWImQ0KPiA+ICsNCj4gPiArRm9yIGEgZmlsZSBiYWNr
ZWQgbWFwDQo+DQo+IOWvueS6juaWh+S7tuaYoOWwhA0Kb2sNCj4NCj4gPiArICAgICAgIHwgU0hB
UkVEIG9yIFJFQUQtb25seSAgIC0gICAgICAgMCBjb3N0ICjor6Xmlofku7bmmK/mmKDlsITogIzk
uI3mmK/kuqTmjaIpDQo+ID4gKyAgICAgICB8IFBSSVZBVEUgV1JJVEFCTEUgICAgICAtICAgICAg
IOavj+S4quWunuS+i+eahOaYoOWwhOWkp+Wwjw0KPiA+ICsNCj4gPiArRm9yIGFuIGFub255bW91
cyBvciBgYC9kZXYvemVyb2BgIG1hcA0KPiDlr7nkuo7ljL/lkI3miJbogIUvZGV2L3plcm8g5pig
5bCE77yfDQpvaw0KPg0KPiA+ICsgICAgICAgfCBTSEFSRUQgICAgICAgICAgICAgICAgICAgICAg
ICAtICAgICAgIOaYoOWwhOeahOWkp+Wwjw0KPiA+ICsgICAgICAgfCBQUklWQVRFIFJFQUQtb25s
eSAgICAgLSAgICAgICAwIGNvc3QgKOS9huS9nOeUqOS4jeWkpykNCj4gPiArICAgICAgIHwgUFJJ
VkFURSBXUklUQUJMRSAgICAgIC0gICAgICAg5q+P5Liq5a6e5L6L55qE5pig5bCE5aSn5bCPDQo+
ID4gKw0KPiA+ICtBZGRpdGlvbmFsIGFjY291bnRpbmcNCj4g6aKd5aSW55qE6K6h5pWwDQpvaw0K
Pg0KPiA+ICsgICAgICAgfCDpgJrov4dtbWFw5Yi25L2c5Y+v5YaZ5Ymv5pys55qE6aG16Z2iDQo+
ID4gKyAgICAgICB8IOS7juWQjOS4gOaxoOS4reaPkOWPlueahHNobWZz5YaF5a2YDQo+ID4gKw0K
PiA+ICvnirbmgIENCj4gPiArPT09PQ0KPiA+ICsNCj4gPiArKiAgICAgIOaIkeS7rOaguOeul21t
YXDlhoXlrZjmmKDlsIQNCj4gPiArKiAgICAgIOaIkeS7rOaguOeul21wcm90ZWN05Zyo5o+Q5Lqk
5Lit55qE5Y+Y5YyWDQo+ID4gKyogICAgICDmiJHku6zmoLjnrpdtcmVtYXDnmoTlpKflsI/lj5jl
jJYNCj4gPiArKiAgICAgIOaIkeS7rOeahOWuoeiuoSBicmsNCj4gPiArKiAgICAgIOWuoeiuoW11
bm1hcA0KPiA+ICsqICAgICAg5oiR5Lus5ZyoL3Byb2PkuK3miqXlkYpjb21taXQg54q25oCBDQo+
ID4gKyogICAgICDmoLjlr7nlubbmo4Dmn6XliIblj4nnmoTmg4XlhrUNCj4gPiArKiAgICAgIOWu
oeafpeWghuagiOWkhOeQhi/miafooYzkuK3nmoTmnoTlu7oNCj4gPiArKiAgICAgIOWPmei/sFNI
TWZz55qE5oOF5Ya1DQo+ID4gKyogICAgICDlrp7njrDlrp7pmYXpmZDliLbnmoTmiafooYwNCj4g
PiArDQo+ID4gK+W+hee7rQ0KPiA+ICs9PT09DQo+ID4gKyogICAgICDluJDmiLd0cmFjZemhte+8
iOi/meW+iOmavu+8ieOAgg0KPg0KPiBwdHJhY2Ug6aG16K6h5pWw77yfDQpvayENCg0KVGhhbmtz
LA0KWWFudGVuZw0KPg0KPiBUaGFua3MNCj4gQWxleA0KPg0KPiA+IC0tDQo+ID4gMi4yNy4wDQo+
ID4NCg==

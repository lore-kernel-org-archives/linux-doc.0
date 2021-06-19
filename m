Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A996C48BDF
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 02:07:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1006B611CE
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 02:07:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbhFSCJw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Jun 2021 22:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhFSCJv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jun 2021 22:09:51 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DBBC061574
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 19:07:40 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t40so12735501oiw.8
        for <linux-doc@vger.kernel.org>; Fri, 18 Jun 2021 19:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RvfCu3LaQv2ml2n546DlFmAAX05ADxymYkf4Cr8VpuU=;
        b=ez/78AKAOUjyd534h5niFuInxIbsmO9P7s8Og7XvOlcS2T/XM5T1pXqrRTzGMlpVep
         R20vbunLg/klluOFubAi3X6pi5oyjzLoPvxmoP1P/tQ7J+hphV8VCT2/R7W6vWSpVzOJ
         /zne5AShD1SNjplpRxG0BRzJSLwb0k5NNoIpS1cHga7ojfy9FPNPXiaPBUbFpd4/b/7n
         rEe5WbVy08c+H3IdixkUjRR012FfyMGO3c3MhN7ENulJWOpg36GSXJmC4RpOzyvEH2oX
         z7EodDzhVZzJJAYEmiOZ4xUM1E7t4QzE2CxvBAPgSYc3l2BkWWn55UhzebiisNs0OuFT
         LWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RvfCu3LaQv2ml2n546DlFmAAX05ADxymYkf4Cr8VpuU=;
        b=ZPiQv3wXbwRRCLCIw4gxNMokHJI05DVHAt21cw0tsFVaoVrczmp4gjcbRU1ETxhUaw
         racpGq+bQ557gYrTB3xRYre4AL7brVp8LNIQohIQ0GhRxSFNvotxyVUqNEsrOF9Hgj5r
         m2lm94GYTo0YaiwRvZsvIU7r2wWZ2jKxufTr26X7zn6tyboZFGCyCVgcuA+0z68YX/yS
         RvxV8gIXitNw6BtEkL1z6hZl53WrYpZNH8kASrF3Bh6asgxtQMyzz3Dku4Idfw/zf1gp
         YDEntuVoO54bwNRXJ1R3/qUQakyMc0HovB+qU6Eg6nn3jhhzmusmNYXn1d5ctYMXwQGr
         mERQ==
X-Gm-Message-State: AOAM5338mdazGslUALOfTs92PMR7Y0ExFYa0zkW6eEfodUnqHygghzzQ
        YA58B15CFCipLy/4RhcLphk7CGj2XLbuFjp5rGHjeCazm6XnxV/g
X-Google-Smtp-Source: ABdhPJzraN33HwFYs6B7qLcLnFSbYrAmRCZy8o8CxVHZ3puhD0Nt+/Ff6T+Z3E/pF8/V3aJR6LFCK/nC5/t+UEkHTMw=
X-Received: by 2002:aca:a9c3:: with SMTP id s186mr9129015oie.103.1624068460054;
 Fri, 18 Jun 2021 19:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1623743265.git.siyanteng@loongson.cn> <592b325fbc92ac72752b36195718c32763d15ecf.1623743265.git.siyanteng@loongson.cn>
 <20210617074842.GA16827@bobwxc.top>
In-Reply-To: <20210617074842.GA16827@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Sat, 19 Jun 2021 10:07:33 +0800
Message-ID: <CAEensMyx03ycKtDRwFENQf8uw3=JcuqD=e_Fw5FwzPq6YGjrSg@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: add core api memory_hotplug translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NuaciDE35pel5ZGo5ZubIOS4i+WN
iDM6NDjlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMDM6NTI6MzlQTSAr
MDgwMCwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9jb3Jl
LWFwaS9jYWNoZXRsYi5yc3QgaW50byBDaGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
WWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+IC0tLQ0KPiA+ICAuLi4vdHJh
bnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL2luZGV4LnJzdCAgICAgfCAgIDIgKy0NCj4gPiAgLi4u
L3poX0NOL2NvcmUtYXBpL21lbW9yeS1ob3RwbHVnLnJzdCAgICAgICAgIHwgMTI2ICsrKysrKysr
KysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9jb3JlLWFwaS9tZW1vcnktaG90cGx1Zy5yc3QNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5yc3QNCj4g
PiBpbmRleCBiNGJkZTkzOTYzMzkuLjE0MDEyYzViMGY0MCAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5yc3QNCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFwaS9pbmRleC5yc3QNCj4g
PiBAQCAtODAsMTIgKzgwLDEyIEBAIFRvZG9saXN0Og0KPiA+ICAgICA6bWF4ZGVwdGg6IDENCj4g
Pg0KPiA+ICAgICBjYWNoZXRsYg0KPiA+ICsgICBtZW1vcnktaG90cGx1Zw0KPiA+DQo+ID4gIFRv
ZG9saXN0Og0KPiA+DQo+ID4NCj4gPiAgICAgY3B1X2hvdHBsdWcNCj4gPiAtICAgbWVtb3J5LWhv
dHBsdWcNCj4gPiAgICAgZ2VuZXJpY2lycQ0KPiA+ICAgICBwcm90ZWN0aW9uLWtleXMNCj4gPg0K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9jb3JlLWFw
aS9tZW1vcnktaG90cGx1Zy5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9j
b3JlLWFwaS9tZW1vcnktaG90cGx1Zy5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+
IGluZGV4IDAwMDAwMDAwMDAwMC4uMzViZDhmMjBhMWJlDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+
ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2NvcmUtYXBpL21lbW9yeS1o
b3RwbHVnLnJzdA0KPiA+IEBAIC0wLDAgKzEsMTI2IEBADQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9k
aXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9u
L2NvcmUtYXBpL2NhY2hldGxiLnJzdA0KPiA+ICsNCj4gPiArOue/u+ivkToNCj4gPiArDQo+ID4g
KyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4g
PiArOuagoeivkToNCj4gPiArDQo+ID4gKw0KPiA+ICsuLiBfY25fY29yZS1hcGlfbWVtb3J5LWhv
dHBsdWc6DQo+ID4gKy4uIF9tZW1vcnlfaG90cGx1ZzoNCj4gICAgICAgIF5eXl5eXl5eXl5eXl5e
DQo+ICAgICAgICB0d28gdGFncywgcmVtb3ZlIHRoZSAybmQgdGFnDQotIC4uIF9tZW1vcnlfaG90
cGx1ZzoNCj4NCj4gPiArDQo+ID4gKz09PT09PT09PT0NCj4gPiAr5YaF5a2Y54Ot5o+S5ouUDQo+
ID4gKz09PT09PT09PT0NCj4gPiArDQo+ID4gK+WGheWtmOeDreaLlOaPkuS6i+S7tumAmuefpeWZ
qA0KPiA+ICs9PT09PT09PT09PT09PT09PT09PQ0KPiA+ICsNCj4gPiAr54Ot5o+S5ouU5LqL5Lu2
6KKr5Y+R6YCB5Yiw5LiA5Liq6YCa55+l6Zif5YiX5Lit44CCDQo+ID4gKw0KPiA+ICvlnKggYGBp
bmNsdWRlL2xpbnV4L21lbW9yeS5oYGAg5Lit5a6a5LmJ5LqG5YWt56eN57G75Z6L55qE6YCa55+l
77yaDQo+ID4gKw0KPiA+ICtNRU1fR09JTkdfT05MSU5FDQo+ID4gKyAg5Zyo5paw5YaF5a2Y5Y+v
55So5LmL5YmN55Sf5oiQ77yM5Lul5L6/6IO95aSf5Li65a2Q57O757uf5aSE55CG5YaF5a2Y5YGa
5YeG5aSH44CC6aG16Z2i5YiG6YWN5Zmo5LuN54S25peg5rOV5LuO5pawDQo+ID4gKyAg55qE5YaF
5a2Y5Lit6L+b6KGM5YiG6YWN44CCDQo+ID4gKw0KPiA+ICtNRU1fQ0FOQ0VMX09OTElORQ0KPiA+
ICsgIOWmguaenE1FTV9HT0lOR19PTkxJTkXlpLHotKXvvIzliJnnlJ/miJDjgIINCj4gPiArDQo+
ID4gK01FTV9PTkxJTkUNCj4gPiArICDlvZPlhoXlrZjmiJDlip/kuIrnur/ml7bkuqfnlJ/jgILl
m57osIPlj6/ku6Xku47mlrDnmoTlhoXlrZjkuK3liIbphY3pobXpnaLjgIINCj4gPiArDQo+ID4g
K01FTV9HT0lOR19PRkZMSU5FDQo+ID4gKyAg5Zyo5byA5aeL5a+55YaF5a2Y6L+b6KGM5LiL57q/
5aSE55CG5pe255Sf5oiQ44CC5LuO5YaF5a2Y5Lit55qE5YiG6YWN5LiN5YaN5Y+v6IO977yM5L2G
5piv5LiA5Lqb6KaB5LiL57q/55qE5YaF5a2YDQo+ID4gKyAg5LuN54S25Zyo5L2/55So44CC5Zue
6LCD5Y+v5Lul55So5p2l6YeK5pS+5LiA5Liq5a2Q57O757uf5Zyo5oyH5a6a5YaF5a2Y5Z2X5Lit
5bey55+l55qE5YaF5a2Y44CCDQo+ID4gKw0KPiA+ICtNRU1fQ0FOQ0VMX09GRkxJTkUNCj4gPiAr
ICDlpoLmnpxNRU1fR09JTkdfT0ZGTElOReWksei0pe+8jOWImeeUn+aIkOOAguadpeiHquaIkeS7
rOivleWbvuemu+e6v+eahOWGheWtmOWdl+S4reeahOWGheWtmOWPiOWPr+S7peS9vw0KPiA+ICsg
IOeUqOS6huOAgg0KPiA+ICsNCj4gPiArTUVNX09GRkxJTkUNCj4gPiArICDlnKjkuIvnur/lhoXl
rZjlrozmiJDlkI7nlJ/miJDjgIINCj4NCj4g5YaF5a2Y5LiL57q/5a6M5oiQIO+8nw0Kb2vvvIEN
Cj4NCj4gPiArDQo+ID4gK+S4gOS4quWbnuiwg+eoi+W6j+WPr+S7pemAmui/h+iwg+eUqDo6DQo+
DQo+IGJlIHJlZ2lzdGVyZWQgYnkgY2FsbGluZzoNCj4g5Y+v5Lul6YCa6L+H6LCD55So5aaC5LiL
5Ye95pWw5p2l5rOo5YaM5LiA5Liq5Zue6LCD56iL5bqPOjoNCm9rIQ0KPg0KPiA+ICsNCj4gPiAr
ICBob3RwbHVnX21lbW9yeV9ub3RpZmllcihjYWxsYmFja19mdW5jLCBwcmlvcml0eSkNCj4gPiAr
DQo+ID4gK+S8mOWFiOe6p+aVsOWAvOi+g+mrmOeahOWbnuiwg+WHveaVsOWcqOaVsOWAvOi+g+S9
jueahOWbnuiwg+WHveaVsOS5i+WJjeiiq+iwg+eUqOOAgg0KPiA+ICsNCj4gPiAr5LiA5Liq5Zue
6LCD5Ye95pWw5b+F6aG75pyJ5Lul5LiL5Y6f5Z6LOjoNCj4gPiArDQo+ID4gKyAgaW50IGNhbGxi
YWNrX2Z1bmMoDQo+ID4gKyAgICBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2sgKnNlbGYsIHVuc2lnbmVk
IGxvbmcgYWN0aW9uLCB2b2lkICphcmcpOw0KPiA+ICsNCj4gPiAr5Zue6LCD5Ye95pWw55qE56ys
5LiA5Liq5Y+C5pWw77yIc2VsZu+8ieaYr+aMh+WQkeWbnuiwg+WHveaVsOacrOi6q+eahOmAmuef
peWZqOmTvuWdl+eahOS4gOS4quaMh+mSiOOAguesrOS6jOS4quWPgg0KPiA+ICvmlbDvvIhhY3Rp
b27vvInmmK/kuIrov7DnmoTkuovku7bnsbvlnovkuYvkuIDjgILnrKzkuInkuKrlj4LmlbDvvIhh
cmfvvInkvKDpgJLkuIDkuKrmjIflkJENCj4gPiArc3RydWN0IG1lbW9yeV9ub3RpZnnnmoTmjIfp
kog6Og0KPiAgICBeXl5eXl5eDQo+ICAgIG1lbW9yeV9ub3RpZnnnu5PmnoTkvZMNCm9rIQ0KPg0K
PiA+ICsNCj4gPiArICAgICBzdHJ1Y3QgbWVtb3J5X25vdGlmeSB7DQo+ID4gKyAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbjsNCj4gPiArICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgbnJfcGFnZXM7DQo+ID4gKyAgICAgICAgICAgICBpbnQgc3RhdHVzX2NoYW5nZV9uaWRfbm9y
bWFsOw0KPiA+ICsgICAgICAgICAgICAgaW50IHN0YXR1c19jaGFuZ2VfbmlkX2hpZ2g7DQo+ID4g
KyAgICAgICAgICAgICBpbnQgc3RhdHVzX2NoYW5nZV9uaWQ7DQo+ID4gKyAgICAgfQ0KPiA+ICsN
Cj4gPiArLSBzdGFydF9wZm7mmK/lnKjnur8v56a757q/5YaF5a2Y55qEc3RhcnRfcGZu44CCDQo+
ID4gKw0KPiA+ICstIG5yX3BhZ2Vz5piv5Zyo57q/L+emu+e6v+WGheWtmOeahCPpobXmlbDjgIIN
Cj4NCj4gIyBvZiBwYWdlcyA9IG51bWJlciBvZiBwYWdlcw0KPiByZW1vdmUgIw0Kb2sscmVtb3Zl
ZC4NCj4NCj4gPiArDQo+ID4gKy0gc3RhdHVzX2NoYW5nZV9uaWRfbm9ybWFs5piv5b2Tbm9kZW1h
c2vnmoROX05PUk1BTF9NRU1PUlnooqvorr7nva4v5riF6Zmk5pe26K6+572u6IqCDQo+ID4gKyAg
54K5aWTvvIzlpoLmnpzmmK8tMe+8jOWImW5vZGVtYXNr54q25oCB5LiN5pS55Y+Y44CCDQo+ID4g
Kw0KPiA+ICstIHN0YXR1c19jaGFuZ2VfbmlkX2hpZ2jmmK/lvZNub2RlbWFza+eahE5fSElHSF9N
RU1PUlnooqvorr7nva4v5riF6Zmk5pe26K6+572u55qE6IqC54K5DQo+ID4gKyAgaWTvvIzlpoLm
npzov5nkuKrlgLzkuLotMe+8jOmCo+S5iG5vZGVtYXNr54q25oCB5LiN5Lya5pS55Y+Y44CCDQo+
ID4gKw0KPiA+ICstIHN0YXR1c19jaGFuZ2Vfbmlk5piv5b2Tbm9kZW1hc2vnmoROX01FTU9SWeii
q++8iOWwhu+8ieiuvue9ri/muIXpmaTml7borr7nva7nmoToioLngrlpZOOAgui/mQ0KPiA+ICsg
IOaEj+WRs+edgOS4gOS4quaWsOeahO+8iOaXoOiusOW/hueahO+8ieiKgueCuemAmui/h+iBlOac
uuiOt+W+l+aWsOeahOWGheWtmO+8jOiAjOS4gOS4quiKgueCueWkseWOu+S6huaJgOacieeahOWG
hQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIOS4iue6vyDvvJ8NCmVtbW1tLG9rIQ0K
5rKh5LiK57q/55qEDQo+DQo+ID4gKyAg5a2Y44CC5aaC5p6c6L+Z5Liq5YC85Li6LTHvvIzpgqPk
uYhub2RlbWFza+eahOeKtuaAgeWwseS4jeS8muaUueWPmOOAgg0KPiA+ICsNCj4gPiArICDlpoLm
npwgc3RhdHVzX2NoYW5nZWRfbmlkKiA+PSAw77yM5Zue6LCD5bqU6K+l5Zyo5b+F6KaB5pe25Li6
6IqC54K55Yib5bu6L+S4ouW8g+e7k+aehOS9k+OAgg0KPiA+ICsNCj4gPiAr5Zue6LCD5L6L56iL
5bqU6L+U5ZueIGBgaW5jbHVkZS9saW51eC9ub3RpZmllci5oYGAg5Lit5a6a5LmJ55qETk9USUZZ
X0RPTkUsIE5PVElGWV9PSywNCj4NCj4gcy/kvovnqIsv56iL5bqPLw0Kb2shDQo+DQo+ID4gK05P
VElGWV9CQUQsIE5PVElGWV9TVE9Q5Lit55qE5LiA5Liq5YC844CCDQo+ID4gKw0KPiA+ICtOT1RJ
RllfRE9OReWSjE5PVElGWV9PS+Wvuei/m+S4gOatpeWkhOeQhuayoeacieW9seWTjeOAgg0KPiA+
ICsNCj4gPiArTk9USUZZX0JBROaYr+S9nOS4uuWvuU1FTV9HT0lOR19PTkxJTkXjgIFNRU1fR09J
TkdfT0ZGTElOReOAgU1FTV9PTkxJTkXmiJZNRU1fT0ZGTElORQ0KPiA+ICvliqjkvZznmoTlm57l
upTvvIznlKjkuo7lj5bmtojng63mj5Lmi5TjgILlroPlgZzmraLlr7npgJrnn6XpmJ/liJfnmoTo
v5vkuIDmraXlpITnkIbjgIINCj4gPiArDQo+ID4gK05PVElGWV9TVE9Q5YGc5q2i5a+56YCa55+l
6Zif5YiX55qE6L+b5LiA5q2l5aSE55CG44CCDQo+ID4gKw0KPiA+ICvlhoXpg6jplIENCj4gPiAr
PT09PT09DQo+ID4gKw0KPiA+ICvlvZPmt7vliqAv5Yig6Zmk5L2/55So5YaF5a2Y5Z2X6K6+5aSH
77yI5Y2z5pmu6YCaUkFN77yJ55qE5YaF5a2Y5pe277yMZGV2aWNlX2hvdHBsdWdfbG9ja+W6lOiv
peiiq+S/neaMgQ0KPiA+ICvkuLo6DQo+ID4gKw0KPiA+ICstIOmSiOWvueWcqOe6vy/nprvnur/o
r7fmsYLov5vooYzlkIzmraXvvIjkvovlpoLvvIzpgJrov4dzeXNmc++8ieOAgui/meagt+S4gOad
pe+8jOWGheWtmOWdl+iuvuWkh+WPquacieWcqOWGheWtmA0KPiA+ICsgIOiiq+WujOWFqOa3u+WK
oOWQjuaJjeiDveiiq+eUqOaIt+epuumXtOiuv+mXru+8iC5vbmxpbmUvLnN0YXRl5bGe5oCn77yJ
44CC6ICM5Zyo5Yig6Zmk5YaF5a2Y5pe277yM5oiR5Lus55+lDQo+ID4gKyAg6YGT5rKh5pyJ5Lq6
5Zyo5YWz6ZSu6YOo5YiG44CCDQo+DQo+IHMv5YWz6ZSu6YOo5YiGL+S4tOeVjOWMui8NCm9rIQ0K
Pg0KPiA+ICsNCj4gPiArLSDkuI5DUFXng63mj5Lmi5TlkoznsbvkvLznmoTlkIzmraXvvIjkvovl
poLvvIzkuI5BQ1BJ5ZKMUFBD5pyJ5YWz77yJDQo+DQo+IOS4jkNQVeeDreaLlOaPkuaIluexu+S8
vOaTjeS9nOWQjOatpe+8iOS+i+WmgkFDUEnlkoxQUEPnm7jlhbPmk43kvZzvvIkNCm9rIQ0KPg0K
PiA+ICsNCj4gPiAr54m55Yir5piv77yM5Zyo5re75Yqg5YaF5a2Y5ZKM55So5oi356m66Ze06K+V
5Zu+5Lul5q+U6aKE5pyf5pu05b+r55qE6YCf5bqm6IGU5py66K+l5YaF5a2Y5pe277yM5pyJ5Y+v
6IO95Ye6546w6ZSB5Y+N6L2s77yMDQrkuIrnur8NCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eDQo+DQo+ID4gK+S9v+eUqGRldmljZV9o
b3RwbHVnX2xvY2vlj6/ku6Xpgb/lhY3jgII6DQo+DQo+IHJlbW92ZSDjgIINCj4g5Y+v5Lul6YG/
5YWN5q2k5oOF5Ya1DQo+DQo+ID4gKw0KPiA+ICstIGRldmljZV9vbmxpbmUoKeWwhummluWFiOaO
peWPl2RldmljZV9sb2NrKCnvvIznhLblkI7mmK9tZW1faG90cGx1Z19sb2Nr44CCDQo+ID4gKw0K
PiA+ICstIGFkZF9tZW1vcnlfcmVzb3VyY2UoKeWwhummluWFiOS9v+eUqG1lbV9ob3RwbHVnX2xv
Y2vvvIznhLblkI7mmK9kZXZpY2VfbG9jaygp77yI5Zyo5YibDQo+ID4gKyAg5bu66K6+5aSH5pe2
77yM5ZyoYnVzX2FkZF9kZXZpY2UoKeacn+mXtO+8ieOAgg0KPiA+ICsNCj4gPiAr55Sx5LqO5Zyo
5L2/55SoZGV2aWNlX2xvY2soKeS5i+WJje+8jOiuvuWkh+WvueeUqOaIt+epuumXtOaYr+WPr+in
geeahO+8jOi/meWPr+iDveWvvOiHtOmUgeeahOWPjei9rOOAgg0KPiA+ICsNCj4gPiAr5YaF5a2Y
55qE5LiK57q/L+S4i+e6v+W6lOivpemAmui/h2RldmljZV9vbmxpbmUoKS9kZXZpY2Vfb2ZmbGlu
ZSgp5a6M5oiQLS3ku6Xnoa7kv53lroPkuI7pgJrov4cNCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXg0KPiDigJTigJQNCm9r
IQ0KPg0KPiA+ICtzeXNmc+i/m+ihjOeahOaTjeS9nOato+ehruWQjOatpeOAguW7uuiuruaMgeac
iWRldmljZV9ob3RwbHVnX2xvY2vvvIjkvovlpoLvvIzkv53miqRvbmxpbmVfdHlwZe+8ieOAgg0K
PiA+ICsNCj4gPiAr5b2T5re75YqgL+WIoOmZpC/kuIrnur8v5LiL57q/5YaF5a2Y5oiW5re75Yqg
L+WIoOmZpOW8guaehC/orr7lpIflhoXlrZjml7bvvIzmiJHku6zlupTor6Xlp4vnu4jmjIHmnInl
hpnmqKHlvI/nmoQNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAgICB8ICAg
ICAgICB8DQo+IOaIluiAhea3u+WKoC/liKDpmaTlvILmnoTmiJborr7lpIflhoXlrZgNCmdyZWF0
IQ0KPg0KPiA+ICttZW1faG90cGx1Z19sb2Nr77yM5Lul5bqP5YiX5YyW5YaF5a2Y54Ot5o+S5ouU
77yI5L6L5aaC6K6/6Zeu5YWo5bGAL+WMuuWfn+WPmOmHj++8ieOAgg0KPiA+ICsNCj4gPiAr5q2k
5aSW77yMbWVtX2hvdHBsdWdfbG9ja++8iOS4jmRldmljZV9ob3RwbHVnX2xvY2vnm7jlj43vvInl
nKjor7vlj5bmqKHlvI/kuIvlhYHorrjkuIDkuKrnm7jlvZMNCj4gPiAr5pyJ5pWI55qEZ2V0X29u
bGluZV9tZW1zL3B1dF9vbmxpbmVfbWVtc+WunueOsO+8jOaJgOS7peiuv+mXruWGheWtmOeahOS7
o+eggeWPr+S7pemYsuatouivpeWGheWtmA0KPiA+ICvmtojlpLHjgIINCj4gPiAtLQ0KPiA+IDIu
MjcuMA0KPg0KPiBUaGFua3MsDQo+ICAgICAgICAgV3UgWC5DLg0KDQpUaGFua3MgeW91IGZvciB5
b3VyIHJldmlldyENCg0KVGhhbmtzLA0KDQpZYW50ZW5nDQo=

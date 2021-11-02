Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71F0C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  2 Nov 2021 08:52:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB07760E9B
	for <linux-doc@archiver.kernel.org>; Tue,  2 Nov 2021 08:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhKBIzB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 2 Nov 2021 04:55:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhKBIzA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Nov 2021 04:55:00 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3C6C061714
        for <linux-doc@vger.kernel.org>; Tue,  2 Nov 2021 01:52:25 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id bn12so990283oib.2
        for <linux-doc@vger.kernel.org>; Tue, 02 Nov 2021 01:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VEXoywNE6pb/POL6Uugil+AZNJjYuebGY+BLvSwHE/A=;
        b=l7rgfqpMXYLSZ+vGYDxl3amZFk4WLTlq2MLHxDqlqCClF1w2dZQg/8xqpwHMr3y72i
         FMymPphiOVsipdkdBaE9XSW0iUTpgFtvEDEJ7fLGdR3pgNY11M7rwP1lQaD1980qpmJk
         S+qbSyaJwc4AcYTvXGnPkRpGj3ab9Wu+7/YXyjkiVwc9/Km4LILO0sEKun37YANHmyUk
         3nW/BiH3Pm9h+Ju/n5/o1PHbaPYA7G/OVphMuJ1rs5mgVA7bXkEv+gj+PaocLJrjcrDJ
         9PSwggNyNicKQKC9dJezaWrW03U1ooLVtcSYE60zvZs8rg/r39advWvKN6UpXtR9L35U
         di6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VEXoywNE6pb/POL6Uugil+AZNJjYuebGY+BLvSwHE/A=;
        b=JxuJKlXi35zvWns6J8NhX0hWq2L4So8sKufCyLAtDrdEr5fR5MlHeC2Rdsy5N61VGR
         RzLLr68WYy5wQE48yhQOX98QpMRShcePy8Y0Ju8NoYGm4NIXYXjhX8fFEf8otNc81pq+
         ojBLSuXrxHxXBmZHZGZM+Yg8yCIH759RB6Ki2Q12hMfLvB4SzFBKe4kqS9Qh5ucwOIHG
         fpIVH0RCmeRo9pfinBKjgtUG2KbAiE/YUynJB3DU671ngk2OoAbSRcL5hNBZFLI5N4GR
         RWDsDM74GXTbOrB8X3lU/rQAo+13y5vSgjd90ccSIarc3ccKCJ+GTiFC0te3VR0E8BwW
         3aew==
X-Gm-Message-State: AOAM533GYlPekc6DcIyvOZtb5SGlWFgmPQg5mTCQ/T6KpPdiZ5ed6zXy
        sIwCvrJNCFaf8pgZc3LkEgQtN2R8w+ECcXw7ML0=
X-Google-Smtp-Source: ABdhPJyj/7nSXInawdDmV6jdPyphgbZ0XdchAAEvNq+kDRRfqMy2qVTXZT3FDTIflnA/hcZT0ECpghc0fuDlDKhMbCQ=
X-Received: by 2002:a05:6808:1809:: with SMTP id bh9mr3868131oib.37.1635843145201;
 Tue, 02 Nov 2021 01:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635752631.git.siyanteng@loongson.cn> <d975a715c010c7ddb26bad8377de5f18a617bd78.1635752631.git.siyanteng@loongson.cn>
 <AS8PR04MB8946BFA628F876B63DD9D80B8F8A9@AS8PR04MB8946.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB8946BFA628F876B63DD9D80B8F8A9@AS8PR04MB8946.eurprd04.prod.outlook.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 2 Nov 2021 16:52:11 +0800
Message-ID: <CAEensMwks67zyjUxUjoBQPNgMduwiQzyJjT=ubwNrO5==v5W5g@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/zh_CN: update sparse translation
To:     Leo Li <leoyang.li@nxp.com>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "alexs@kernel.org" <alexs@kernel.org>,
        "bobwxc@email.cn" <bobwxc@email.cn>,
        "seakeel@gmail.com" <seakeel@gmail.com>,
        Yanteng Si <siyanteng@loongson.cn>,
        "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
        "jiaxun.yang@flygoat.com" <jiaxun.yang@flygoat.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "realpuyuwang@gmail.com" <realpuyuwang@gmail.com>,
        "src.res@email.cn" <src.res@email.cn>,
        "wanjiabing@vivo.com" <wanjiabing@vivo.com>,
        "bernard@vivo.com" <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

TGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+IOS6jjIwMjHlubQxMeaciDLml6Xlkajkuowg5LiK
5Y2INTowMuWGmemBk++8mg0KPg0KPg0KPg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPg0KPiA+IFNlbnQ6
IE1vbmRheSwgTm92ZW1iZXIgMSwgMjAyMSAyOjUwIEFNDQo+ID4gVG86IGNvcmJldEBsd24ubmV0
OyBhbGV4c0BrZXJuZWwub3JnOyBib2J3eGNAZW1haWwuY247DQo+ID4gc2Vha2VlbEBnbWFpbC5j
b207IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPg0KPiA+IENjOiBZYW50ZW5nIFNpIDxzaXlh
bnRlbmdAbG9vbmdzb24uY24+OyBjaGVuaHVhY2FpQGtlcm5lbC5vcmc7DQo+ID4gamlheHVuLnlh
bmdAZmx5Z29hdC5jb207IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gcmVhbHB1eXV3
YW5nQGdtYWlsLmNvbTsgc2l5YW50ZW5nMDFAZ21haWwuY29tOyBzcmMucmVzQGVtYWlsLmNuOw0K
PiA+IHdhbmppYWJpbmdAdml2by5jb207IGJlcm5hcmRAdml2by5jb20NCj4gPiBTdWJqZWN0OiBb
UEFUQ0ggMi8yXSBkb2NzL3poX0NOOiB1cGRhdGUgc3BhcnNlIHRyYW5zbGF0aW9uDQo+ID4NCj4g
PiBTcGFyc2UgZG9jdW1lbnRzIGFyZSB0b28gb3V0ZGF0ZWQsbGV0J3MgdXBkYXRlIHNwYXJzZS5y
c3QgdG8gdGhlIGxhdGVzdA0KPiA+IHZlcnNpb24uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
YW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4gIC4uLi90cmFu
c2xhdGlvbnMvemhfQ04vZGV2LXRvb2xzL3NwYXJzZS5yc3QgICB8IDEwMyArKysrKysrKysrLS0t
LS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9u
cygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2Rldi10b29scy9zcGFyc2UucnN0DQo+ID4gYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi9kZXYtdG9vbHMvc3BhcnNlLnJzdA0KPiA+IGluZGV4IDBmNDQ0YjgzZDYzOS4uNDA1
NjUzZDE1NmQ5IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2Rldi10b29scy9zcGFyc2UucnN0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vZGV2LXRvb2xzL3NwYXJzZS5yc3QNCj4gPiBAQCAtMSwzNCArMSwzNCBAQA0K
PiA+IC3vu79DaGluZXNlIHRyYW5zbGF0ZWQgdmVyc2lvbiBvZiBEb2N1bWVudGF0aW9uL2Rldi10
b29scy9zcGFyc2UucnN0DQo+ID4gK++7v0NvcHlyaWdodCAyMDA0IExpbnVzIFRvcnZhbGRzDQo+
ID4gK0NvcHlyaWdodCAyMDA0IFBhdmVsIE1hY2hlayA8cGF2ZWxAdWN3LmN6Pg0KPiA+ICtDb3B5
cmlnaHQgMjAwNiBCb2IgQ29wZWxhbmQgPG1lQGJvYmNvcGVsYW5kLmNvbT4NCj4gPg0KPiA+IC1J
ZiB5b3UgaGF2ZSBhbnkgY29tbWVudCBvciB1cGRhdGUgdG8gdGhlIGNvbnRlbnQsIHBsZWFzZSBj
b250YWN0IHRoZQ0KPiA+IC1vcmlnaW5hbCBkb2N1bWVudCBtYWludGFpbmVyIGRpcmVjdGx5LiAg
SG93ZXZlciwgaWYgeW91IGhhdmUgYSBwcm9ibGVtDQo+ID4gLWNvbW11bmljYXRpbmcgaW4gRW5n
bGlzaCB5b3UgY2FuIGFsc28gYXNrIHRoZSBDaGluZXNlIG1haW50YWluZXIgZm9yDQo+ID4gLWhl
bHAuICBDb250YWN0IHRoZSBDaGluZXNlIG1haW50YWluZXIgaWYgdGhpcyB0cmFuc2xhdGlvbiBp
cyBvdXRkYXRlZA0KPiA+IC1vciBpZiB0aGVyZSBpcyBhIHByb2JsZW0gd2l0aCB0aGUgdHJhbnNs
YXRpb24uDQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+DQo+
ID4gLUNoaW5lc2UgbWFpbnRhaW5lcjogTGkgWWFuZyA8bGVveWFuZy5saUBueHAuY29tPg0KPiA+
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCj4gPiAtRG9jdW1lbnRhdGlvbi9kZXYtdG9vbHMvc3BhcnNlLnJzdCDn
moTkuK3mlofnv7vor5ENCj4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2Rldi10b29scy9z
cGFyc2UucnN0DQo+ID4NCj4gPiAt5aaC5p6c5oOz6K+E6K665oiW5pu05paw5pys5paH55qE5YaF
5a6577yM6K+355u05o6l6IGU57O75Y6f5paH5qGj55qE57u05oqk6ICF44CC5aaC5p6c5L2g5L2/
DQo+ID4g55So6Iux5paHDQo+ID4gLeS6pOa1geacieWbsOmavueahOivne+8jOS5n+WPr+S7peWQ
keS4reaWh+eJiOe7tOaKpOiAheaxguWKqeOAguWmguaenOacrOe/u+ivkeabtOaWsOS4jeWPiuaX
tg0KPiA+IOaIluiAhee/uw0KPiA+IC3or5HlrZjlnKjpl67popjvvIzor7fogZTns7vkuK3mlofn
iYjnu7TmiqTogIXjgIINCj4gPiArOue/u+ivkToNCj4gPg0KPiA+IC3kuK3mlofniYjnu7TmiqTo
gIXvvJog5p2O6ZizICBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gLeS4reaWh+eJ
iOe/u+ivkeiAhe+8miDmnY7pmLMgIExpIFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gPiAr
IExpIFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gPg0KPiA+ICs65qCh6K+ROg0KPiA+DQo+
ID4gLeS7peS4i+S4uuato+aWhw0KPiA+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiArIOWPuOW7tuiFviBZ
YW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4NCj4gPiAtQ29weXJpZ2h0IDIw
MDQgTGludXMgVG9ydmFsZHMNCj4gPiAtQ29weXJpZ2h0IDIwMDQgUGF2ZWwgTWFjaGVrIDxwYXZl
bEB1Y3cuY3o+DQo+ID4gLUNvcHlyaWdodCAyMDA2IEJvYiBDb3BlbGFuZCA8bWVAYm9iY29wZWxh
bmQuY29tPg0KPiA+ICsuLiBfY25fc3BhcnNlOg0KPiA+ICsNCj4gPiArU3BhcnNlDQo+ID4gKz09
PT09PQ0KPiA+ICsNCj4gPiArU3BhcnNl5piv5LiA5LiqQ+eoi+W6j+eahOivreS5ieajgOafpeWZ
qO+8m+Wug+WPr+S7peeUqOadpeWPkeeOsOWGheaguOS7o+eggeeahOS4gOS6mw0KPiA+IOa9nOWc
qOmXrumimOOAgiDlhbMNCj4gPiAr5LqOc3BhcnNl55qE5qaC6L+w77yM6K+35Y+C6KeBDQo+ID4g
aHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbHduLm4NCj4gPiBldCUyRkFydGljbGVzJTJGNjg5OTA3JTJGJmFtcDtkYXRhPTA0
JTdDMDElN0NsZW95YW5nLmxpJTQwbnhwLmNvbQ0KPiA+ICU3QzIzM2IyNTY2ZTJmNzQ5MjgxNjVj
MDhkOTlkMGM2NDRjJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMA0KPiA+IDE2MzUlN0Mw
JTdDMCU3QzYzNzcxMzQ5ODgxNDkyMTA0NiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleQ0KPiA+
IEpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZD
STZNbjAlM0QlDQo+ID4gN0MxMDAwJmFtcDtzZGF0YT02cDJGR0ljZlduJTJCU3JDbUphVVJvUGEx
SzBOc0dpMGFEN3BzZEpXREFiDQo+ID4gTW8lM0QmYW1wO3Jlc2VydmVkPTDvvJvmnKzmlofmoaPl
jIXlkKsNCj4gPiAr5LiA5Lqb6ZKI5a+55YaF5qC455qEc3BhcnNl5L+h5oGv44CCDQo+ID4gK+WF
s+S6jnNwYXJzZeeahOabtOWkmuS/oeaBr++8jOS4u+imgeaYr+WFs+S6juWug+eahOWGhemDqOe7
k+aehO+8jOWPr+S7peWcqOWug+eahOWumOaWuQ0KPiA+IOe9kemhteS4iuaJvuWIsO+8mg0KPiA+
ICtodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZzcGFyDQo+ID4gc2UuZG9jcy5rZXJuZWwub3JnJTJGJmFtcDtkYXRhPTA0JTdD
MDElN0NsZW95YW5nLmxpJTQwbnhwLmNvbSU3QzIzDQo+ID4gM2IyNTY2ZTJmNzQ5MjgxNjVjMDhk
OTlkMGM2NDRjJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlDQo+ID4gN0MwJTdD
MCU3QzYzNzcxMzQ5ODgxNDkyMTA0NiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaQ0K
PiA+IE1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZN
bjAlM0QlN0MxMDANCj4gPiAwJmFtcDtzZGF0YT1IR2ZMek5MYUZPQUtpUjI4OG4yRyUyRkxyZGFx
ZURPOVQ2SWNKZ2I5bzBWUHclM0QmYQ0KPiA+IG1wO3Jlc2VydmVkPTDjgIINCj4gPg0KPiA+ICDk
vb/nlKggc3BhcnNlIOW3peWFt+WBmuexu+Wei+ajgOafpQ0KPiA+ICB+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fg0KPiA+DQo+ID4gLSJfX2JpdHdpc2UiIOaYr+S4gOenjeexu+Wei+WxnuaAp++8
jOaJgOS7peS9oOW6lOivpei/meagt+S9v+eUqOWug++8mg0KPiA+ICtgYF9fYml0d2lzYGAg5piv
5LiA56eN57G75Z6L5bGe5oCn77yM5omA5Lul5L2g5bqU6K+l6L+Z5qC35L2/55So5a6DOjoNCj4N
Cj4gVHlwby4gIF9fYml0d2lzZS4NCk9L77yMVGhhbmtzIQ0KPg0KPiBCdHcsIG5vdCBzdXJlIHdo
eSB5b3UgYXJlIGNoYW5naW5nIGFsbCB0aGUgIiBpbiBvcmlnaW5hbCBkb2N1bWVudCB0byBgYC4N
CnNvcnJ5LEkgd2lsbCByZWNvdmVyIGJhY2shDQo+DQo+ID4NCj4gPiAgICAgICAgICB0eXBlZGVm
IGludCBfX2JpdHdpc2UgcG1fcmVxdWVzdF90Ow0KPiA+DQo+ID4gQEAgLTM3LDE2ICszNywxNiBA
QCBDb3B5cmlnaHQgMjAwNiBCb2IgQ29wZWxhbmQNCj4gPiA8bWVAYm9iY29wZWxhbmQuY29tPg0K
PiA+ICAgICAgICAgICAgICAgICAgUE1fUkVTVU1FID0gKF9fZm9yY2UgcG1fcmVxdWVzdF90KSAy
DQo+ID4gICAgICAgICAgfTsNCj4gPg0KPiA+IC3ov5nmoLfkvJrkvb8gUE1fU1VTUEVORCDlkowg
UE1fUkVTVU1FIOaIkOS4uuS9jeaWueW8jyhiaXR3aXNlKeaVtOaVsO+8iOS9v+eUqA0KPiA+ICJf
X2ZvcmNlIg0KPiA+IC3mmK/lm6DkuLogc3BhcnNlIOS8muaKseaAqOaUueWPmOS9jeaWueW8j+ea
hOexu+Wei+i9rOaNou+8jOS9huaYr+i/memHjOaIkeS7rOehruWunumcgOimgQ0KPiA+IOW8uuWI
tui/m+ihjOi9rA0KPiA+IC3mjaLvvInjgILogIzkuJTlm6DkuLrmiYDmnInmnprkuL7lgLzpg73k
vb/nlKjkuobnm7jlkIznmoTnsbvlnovvvIzov5nph4znmoQiZW51bQ0KPiA+IHBtX3JlcXVlc3Qi
5Lmf5bCGDQo+ID4gLeS8muS9v+eUqOmCo+S4quexu+Wei+WBmuS4uuW6leWxguWunueOsOOAgg0K
PiA+ICvov5nmoLfkvJrkvb9QTV9TVVNQRU5E5ZKMUE1fUkVTVU1F5oiQ5Li65L2N5pa55byPIGBg
Yml0d2lzZWBgIOaVtOaVsO+8iOS9vw0KPiA+IOeUqA0KPiA+ICtgYF9fZm9yY2VgYCDmmK/lm6Dk
uLpzcGFyc2XkvJrmirHmgKjmlLnlj5jkvY3mlrnlvI/nmoTnsbvlnovovazmjaLvvIzkvYbmmK/o
v5nph4zmiJHku6wNCj4gPiDnoa7lrp4NCj4gPiAr6ZyA6KaB5by65Yi26L+b6KGM6L2s5o2i77yJ
44CC6ICM5LiU5Zug5Li65omA5pyJ5p6a5Li+5YC86YO95L2/55So5LqG55u45ZCM55qE57G75Z6L
77yM6L+ZDQo+ID4g6YeM55qEDQo+ID4gK2BgZW51bSBwbV9yZXF1ZXN0YGAg5Lmf5bCG5Lya5L2/
55So6YKj5Liq57G75Z6L5YGa5Li65bqV5bGC5a6e546w44CCDQo+ID4NCj4gPiAt6ICM5LiU5L2/
55SoIGdjYyDnvJbor5HnmoTml7blgJnvvIzmiYDmnInnmoQgX19iaXR3aXNlL19fZm9yY2Ug6YO9
5Lya5raI5aSx77yM5pyA5ZCO5ZyoDQo+ID4gZ2NjDQo+ID4gLeeci+adpeWug+S7rOWPquS4jei/
h+aYr+aZrumAmueahOaVtOaVsOOAgg0KPiA+ICvogIzkuJTkvb/nlKhnY2PnvJbor5HnmoTml7bl
gJnvvIzmiYDmnInnmoQgYGBfX2JpdHdpc2VgYCAvIGBgX19mb3JjZWBgIOmDveS8mua2iOWkse+8
jA0KPiA+ICvmnIDlkI7lnKhnY2PnnIvmnaXlroPku6zlj6rkuI3ov4fmmK/mma7pgJrnmoTmlbTm
lbDjgIINCj4gPg0KPiA+IC3lnabnmb3mnaXor7TvvIzkvaDlubbkuI3pnIDopoHkvb/nlKjmnprk
uL7nsbvlnovjgILkuIrpnaLpgqPkupvlrp7pmYXpg73lj6/ku6XmtZPnvKnmiJDkuIDkuKoNCj4g
PiDnibnmrornmoQiaW50DQo+ID4gLV9fYml0d2lzZSLnsbvlnovjgIINCj4gPiAr5Z2m55m95p2l
6K+077yM5L2g5bm25LiN6ZyA6KaB5L2/55So5p6a5Li+57G75Z6L44CC5LiK6Z2i6YKj5Lqb5a6e
6ZmF6YO95Y+v5Lul5rWT57yp5oiQ5LiADQo+ID4g5Liq54m55q6K55qEDQo+ID4gK2BgaW50X19i
aXR3aXNlYGAg57G75Z6L44CCDQo+ID4NCj4gPiAg5omA5Lul5pu0566A5Y2V55qE5Yqe5rOV5Y+q
6KaB6L+Z5qC35YGa77yaDQo+ID4NCj4gPiBAQCAtNTcsMzUgKzU3LDUyIEBAIF9fYml0d2lzZSLn
sbvlnovjgIINCj4gPg0KPiA+ICDnjrDlnKjkvaDlsLHmnInkuobkuKXmoLznmoTnsbvlnovmo4Dm
n6XmiYDpnIDopoHnmoTmiYDmnInln7rnoYDmnrbmnoTjgIINCj4gPg0KPiA+IC3kuIDkuKrlsI/m
j5DphpLvvJrluLjmlbDmlbTmlbAiMCLmmK/nibnmrornmoTjgILkvaDlj6/ku6Xnm7TmjqXmiorl
uLjmlbDpm7blvZPkvZzkvY3mlrnlvI8NCj4gPiDmlbTmlbDkvb/nlKjogIwNCj4gPiAt5LiN55So
5ouF5b+DIHNwYXJzZSDkvJrmirHmgKjjgILov5nmmK/lm6DkuLoiYml0d2lzZSLvvIjmgbDlpoLl
hbblkI3vvInmmK/nlKjmnaXnoa7kv53kuI0NCj4gPiDlkIzkvY3mlrkNCj4gPiAt5byP57G75Z6L
5LiN5Lya6KKr5byE5re377yI5bCP5bC+5qih5byP77yM5aSn5bC+5qih5byP77yMY3B15bC+5qih
5byP77yM5oiW6ICF5YW25LuW77yJ77yMDQo+ID4g5a+55LuW5Lus5p2l6K+0DQo+ID4gLeW4uOaV
sCIwIuehruWunuaYr+eJueauiueahOOAgg0KPiA+ICvkuIDkuKrlsI/mj5DphpLvvJrluLjmlbDm
lbTmlbAgYGAwYGAg5piv54m55q6K55qE44CC5L2g5Y+v5Lul55u05o6l5oqK5bi45pWw6Zu25b2T
5L2c5L2N5pa5DQo+ID4g5byP5pW05pWw5L2/55So6ICMDQo+ID4gK+S4jeeUqOaLheW/g3NwYXJz
ZeS8muaKseaAqOOAgui/meaYr+WboOS4uiBgYGJpdHdpc2VgYCDvvIjmgbDlpoLlhbblkI3vvInm
mK/nlKjmnaXnoa7kv50NCj4gPiDkuI3lkIzkvY3mlrkNCj4gPiAr5byP57G75Z6L5LiN5Lya6KKr
5byE5re377yI5bCP5bC+5qih5byP77yM5aSn5bC+5qih5byP77yMY3B15bC+5qih5byP77yM5oiW
6ICF5YW25LuW77yJ77yMDQo+ID4g5a+55LuW5Lus5p2l6K+05bi45pWwDQo+ID4gK2BgMGBgIOeh
ruWuniAq5pivKiDnibnmrornmoTjgIINCj4NCj4gTm90IHN1cmUgaWYgdGhlIGl0YWxpYyBpcyBh
IHN0YW5kYXJkIHdheSB0byBlbXBoYXNpcyBpbiBDaGluZXNlLCBtYXliZSBib2xkIG1vcmUgY29t
bW9uLg0KeWVzLCAiKuaYryoiIGlzIGJvbGQsVGhhbmtzLg0KDQpUaGFua3MsDQpZYW50ZW5nDQo=

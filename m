Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ED7CC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01C5160E90
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:07:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhKECJ7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 22:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhKECJ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 22:09:59 -0400
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92945C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 19:07:20 -0700 (PDT)
Received: by mail-ot1-x332.google.com with SMTP id r10-20020a056830448a00b0055ac7767f5eso10983630otv.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 19:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M8MQayOSU6Sox/b63kTBRWK4gF1BRFHLy44ASC6ZbVk=;
        b=HPVMzyLp0B4bFsCd4+1TnMgk+N8CgF+LhuC16pCou0J0pi+K8oKarw3tac9oZx2mIu
         pBvWzd3wx8sIPFFPOM6a0N3KcCner5C+X9zvB3mR1yIadcpchEfyQnZvjASyxElpUyn3
         7dHod9VU7rjq4MJtWgUs9MSUO26CUw3lcWirhM6lEGEtd8zCezeqVun9Uu0SGcTjppk9
         jaAOm7tyqac4PYJ/xjnZLZModCGvut8Vs2N/b2uru6+tdwZgpNQIACzFiHZoHtaUWt2F
         /gYg0pmIvaIDfbJIQmSLd4xojoelbvEgRAoVJhWN1/1an/sIrozeQnJ2YVHG9dCts3Aa
         2NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M8MQayOSU6Sox/b63kTBRWK4gF1BRFHLy44ASC6ZbVk=;
        b=vLbzR7zK/X1l8xoXaQqE1/oWys1AQhtr/KWFP0iq4ITZbmPiYYFAasGU3vmF64Yrlz
         oM4vxyyU0+V2qSUnxbSfruwuNH9gbPTJ6288RkWLOSwhPzfCbU3VdcOkNJvW6yaBwvrU
         irDeQkiaGV6pM5tf1V5q1uLfx2Dwxx59guXK8zmRHnNxboK5Z6P72JqocWTo/9w10+5I
         0Ed1zGP/v/cP6CFirxS16FLvWYpx+uJGi94qNudCXhwXQcgnjQneEEMlWNh/nKGCMXlD
         4lFrMtoQ0N65kUyUgbpwLwcr/RqLbMCJmWBUL6q0LVxBm3fL9i5Vb1wgaqZhZwncD1ds
         U/qQ==
X-Gm-Message-State: AOAM531ZEHjK0nBCTlnTa3ShsBDXnLXAb+nHLIzoVcN0mUjlazZ27A+9
        1fWy407S9A2V2KwG1PvV5AhqZfiQmyJwPCTVk7U=
X-Google-Smtp-Source: ABdhPJxgBIiPA4jhdCJTOitBkMc+583egYhlMvRnGQ7NIO3qKrCaDaqivWHrdMchH24+FRVBhJMoYHGPBvTyzvaLE7Q=
X-Received: by 2002:a05:6830:1b65:: with SMTP id d5mr26912663ote.151.1636078039882;
 Thu, 04 Nov 2021 19:07:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635752631.git.siyanteng@loongson.cn> <d975a715c010c7ddb26bad8377de5f18a617bd78.1635752631.git.siyanteng@loongson.cn>
 <AS8PR04MB8946BFA628F876B63DD9D80B8F8A9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <CAEensMwks67zyjUxUjoBQPNgMduwiQzyJjT=ubwNrO5==v5W5g@mail.gmail.com> <AS8PR04MB89468C71C5A853C7515A6FA38F8E9@AS8PR04MB8946.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB89468C71C5A853C7515A6FA38F8E9@AS8PR04MB8946.eurprd04.prod.outlook.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 5 Nov 2021 10:07:08 +0800
Message-ID: <CAEensMwUKOqB82vwZZ2zO7ALnrRqtqOJ5M6bqa6D3Mo6ZzPMfg@mail.gmail.com>
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

TGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+IOS6jjIwMjHlubQxMeaciDXml6XlkajkupQg5LiK
5Y2IOTo1NuWGmemBk++8mg0KPg0KPg0KPg0KPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gRnJvbTogeWFudGVuZyBzaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPg0KPiA+IFNlbnQ6
IFR1ZXNkYXksIE5vdmVtYmVyIDIsIDIwMjEgMzo1MiBBTQ0KPiA+IFRvOiBMZW8gTGkgPGxlb3lh
bmcubGlAbnhwLmNvbT4NCj4gPiBDYzogY29yYmV0QGx3bi5uZXQ7IGFsZXhzQGtlcm5lbC5vcmc7
IGJvYnd4Y0BlbWFpbC5jbjsNCj4gPiBzZWFrZWVsQGdtYWlsLmNvbTsgWWFudGVuZyBTaSA8c2l5
YW50ZW5nQGxvb25nc29uLmNuPjsNCj4gPiBjaGVuaHVhY2FpQGtlcm5lbC5vcmc7IGppYXh1bi55
YW5nQGZseWdvYXQuY29tOyBsaW51eC0NCj4gPiBkb2NAdmdlci5rZXJuZWwub3JnOyByZWFscHV5
dXdhbmdAZ21haWwuY29tOyBzcmMucmVzQGVtYWlsLmNuOw0KPiA+IHdhbmppYWJpbmdAdml2by5j
b207IGJlcm5hcmRAdml2by5jb20NCj4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIvMl0gZG9jcy96
aF9DTjogdXBkYXRlIHNwYXJzZSB0cmFuc2xhdGlvbg0KPiA+DQo+ID4gTGVvIExpIDxsZW95YW5n
LmxpQG54cC5jb20+IOS6jjIwMjHlubQxMeaciDLml6Xlkajkuowg5LiK5Y2INTowMuWGmemBk++8
mg0KPiA+ID4NCj4gPiA+DQo+ID4gPg0KPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KPiA+ID4gPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFpbC5jb20+DQo+ID4g
PiA+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMSwgMjAyMSAyOjUwIEFNDQo+ID4gPiA+IFRvOiBj
b3JiZXRAbHduLm5ldDsgYWxleHNAa2VybmVsLm9yZzsgYm9id3hjQGVtYWlsLmNuOw0KPiA+ID4g
PiBzZWFrZWVsQGdtYWlsLmNvbTsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gPiA+
IENjOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+OyBjaGVuaHVhY2FpQGtlcm5l
bC5vcmc7DQo+ID4gPiA+IGppYXh1bi55YW5nQGZseWdvYXQuY29tOyBsaW51eC1kb2NAdmdlci5r
ZXJuZWwub3JnOw0KPiA+ID4gPiByZWFscHV5dXdhbmdAZ21haWwuY29tOyBzaXlhbnRlbmcwMUBn
bWFpbC5jb207IHNyYy5yZXNAZW1haWwuY247DQo+ID4gPiA+IHdhbmppYWJpbmdAdml2by5jb207
IGJlcm5hcmRAdml2by5jb20NCj4gPiA+ID4gU3ViamVjdDogW1BBVENIIDIvMl0gZG9jcy96aF9D
TjogdXBkYXRlIHNwYXJzZSB0cmFuc2xhdGlvbg0KPiA+ID4gPg0KPiA+ID4gPiBTcGFyc2UgZG9j
dW1lbnRzIGFyZSB0b28gb3V0ZGF0ZWQsbGV0J3MgdXBkYXRlIHNwYXJzZS5yc3QgdG8gdGhlDQo+
ID4gPiA+IGxhdGVzdCB2ZXJzaW9uLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBZ
YW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAg
Li4uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXYtdG9vbHMvc3BhcnNlLnJzdCAgIHwgMTAzICsrKysr
KysrKystLS0tLS0tLQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyks
IDQzIGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2LXRvb2xzL3NwYXJzZS5yc3QNCj4gPiA+ID4gYi9E
b2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9kZXYtdG9vbHMvc3BhcnNlLnJzdA0KPiA+
ID4gPiBpbmRleCAwZjQ0NGI4M2Q2MzkuLjQwNTY1M2QxNTZkOSAxMDA2NDQNCj4gPiA+ID4gLS0t
IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2LXRvb2xzL3NwYXJzZS5yc3QN
Cj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vZGV2LXRvb2xz
L3NwYXJzZS5yc3QNCj4gPiA+ID4gQEAgLTEsMzQgKzEsMzQgQEANCj4gPiA+ID4gLe+7v0NoaW5l
c2UgdHJhbnNsYXRlZCB2ZXJzaW9uIG9mIERvY3VtZW50YXRpb24vZGV2LXRvb2xzL3NwYXJzZS5y
c3QNCj4gPiA+ID4gK++7v0NvcHlyaWdodCAyMDA0IExpbnVzIFRvcnZhbGRzDQo+ID4gPiA+ICtD
b3B5cmlnaHQgMjAwNCBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4gQ29weXJpZ2h0IDIwMDYg
Qm9iDQo+ID4gPiA+ICtDb3BlbGFuZCA8bWVAYm9iY29wZWxhbmQuY29tPg0KPiA+ID4gPg0KPiA+
ID4gPiAtSWYgeW91IGhhdmUgYW55IGNvbW1lbnQgb3IgdXBkYXRlIHRvIHRoZSBjb250ZW50LCBw
bGVhc2UgY29udGFjdA0KPiA+ID4gPiB0aGUgLW9yaWdpbmFsIGRvY3VtZW50IG1haW50YWluZXIg
ZGlyZWN0bHkuICBIb3dldmVyLCBpZiB5b3UgaGF2ZSBhDQo+ID4gPiA+IHByb2JsZW0gLWNvbW11
bmljYXRpbmcgaW4gRW5nbGlzaCB5b3UgY2FuIGFsc28gYXNrIHRoZSBDaGluZXNlDQo+ID4gPiA+
IG1haW50YWluZXIgZm9yIC1oZWxwLiAgQ29udGFjdCB0aGUgQ2hpbmVzZSBtYWludGFpbmVyIGlm
IHRoaXMNCj4gPiA+ID4gdHJhbnNsYXRpb24gaXMgb3V0ZGF0ZWQgLW9yIGlmIHRoZXJlIGlzIGEg
cHJvYmxlbSB3aXRoIHRoZSB0cmFuc2xhdGlvbi4NCj4gPiA+ID4gKy4uIGluY2x1ZGU6OiAuLi9k
aXNjbGFpbWVyLXpoX0NOLnJzdA0KPiA+ID4gPg0KPiA+ID4gPiAtQ2hpbmVzZSBtYWludGFpbmVy
OiBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gPiA+IC0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4g
PiA+IC0tIC1Eb2N1bWVudGF0aW9uL2Rldi10b29scy9zcGFyc2UucnN0IOeahOS4reaWh+e/u+iv
kQ0KPiA+ID4gPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL2Rldi10b29scy9zcGFyc2UucnN0
DQo+ID4gPiA+DQo+ID4gPiA+IC3lpoLmnpzmg7Por4TorrrmiJbmm7TmlrDmnKzmlofnmoTlhoXl
rrnvvIzor7fnm7TmjqXogZTns7vljp/mlofmoaPnmoTnu7TmiqTogIXjgILlpoLmnpwNCj4gPiDk
vaDkvb8NCj4gPiA+ID4g55So6Iux5paHDQo+ID4gPiA+IC3kuqTmtYHmnInlm7Dpmr7nmoTor53v
vIzkuZ/lj6/ku6XlkJHkuK3mlofniYjnu7TmiqTogIXmsYLliqnjgILlpoLmnpzmnKznv7vor5Hm
m7TmlrDkuI0NCj4gPiDlj4rml7YNCj4gPiA+ID4g5oiW6ICF57+7DQo+ID4gPiA+IC3or5HlrZjl
nKjpl67popjvvIzor7fogZTns7vkuK3mlofniYjnu7TmiqTogIXjgIINCj4gPiA+ID4gKzrnv7vo
r5E6DQo+ID4gPiA+DQo+ID4gPiA+IC3kuK3mlofniYjnu7TmiqTogIXvvJog5p2O6ZizICBMaSBZ
YW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gPiA+IC3kuK3mlofniYjnv7vor5HogIXvvJog
5p2O6ZizICBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gPiA+ICsgTGkgWWFuZyA8
bGVveWFuZy5saUBueHAuY29tPg0KPiA+ID4gPg0KPiA+ID4gPiArOuagoeivkToNCj4gPiA+ID4N
Cj4gPiA+ID4gLeS7peS4i+S4uuato+aWhw0KPiA+ID4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ID4gPiAt
LQ0KPiA+ID4gPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+
DQo+ID4gPiA+DQo+ID4gPiA+IC1Db3B5cmlnaHQgMjAwNCBMaW51cyBUb3J2YWxkcw0KPiA+ID4g
PiAtQ29weXJpZ2h0IDIwMDQgUGF2ZWwgTWFjaGVrIDxwYXZlbEB1Y3cuY3o+IC1Db3B5cmlnaHQg
MjAwNiBCb2INCj4gPiA+ID4gQ29wZWxhbmQgPG1lQGJvYmNvcGVsYW5kLmNvbT4NCj4gPiA+ID4g
Ky4uIF9jbl9zcGFyc2U6DQo+ID4gPiA+ICsNCj4gPiA+ID4gK1NwYXJzZQ0KPiA+ID4gPiArPT09
PT09DQo+ID4gPiA+ICsNCj4gPiA+ID4gK1NwYXJzZeaYr+S4gOS4qkPnqIvluo/nmoTor63kuYnm
o4Dmn6XlmajvvJvlroPlj6/ku6XnlKjmnaXlj5HnjrDlhoXmoLjku6PnoIHnmoTkuIANCj4gPiDk
upsNCj4gPiA+ID4g5r2c5Zyo6Zeu6aKY44CCIOWFsw0KPiA+ID4gPiAr5LqOc3BhcnNl55qE5qaC
6L+w77yM6K+35Y+C6KeBDQo+ID4gPiA+DQo+ID4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJv
dGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbHcNCj4gPiA+ID4NCj4gPiBu
Lm4lMkYmYW1wO2RhdGE9MDQlN0MwMSU3Q2xlb3lhbmcubGklNDBueHAuY29tJTdDNzc5YjExOWNi
Nzg1NDg2DQo+ID4gODA1NA0KPiA+ID4gPg0KPiA+IDcwOGQ5OWRkZTE4OGYlN0M2ODZlYTFkM2Jj
MmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MwJTdDNjM3NzENCj4gPiA0Mzk5DQo+ID4gPiA+
DQo+ID4gNDk2MDgxNjQ2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdN
REFpTENKUUlqDQo+ID4gb2lWMmx1TXoNCj4gPiA+ID4NCj4gPiBJaUxDSkJUaUk2SWsxaGFXd2lM
Q0pYVkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPW9oU1B5S09UWkZpd0IyDQo+ID4gJTJGJQ0K
PiA+ID4gPiAyQkRYUjIlMkJESmsxYXZvOU1KWFVWTFA3cSUyRnclMkZJMCUzRCZhbXA7cmVzZXJ2
ZWQ9MA0KPiA+ID4gPg0KPiA+IGV0JTJGQXJ0aWNsZXMlMkY2ODk5MDclMkYmYW1wO2RhdGE9MDQl
N0MwMSU3Q2xlb3lhbmcubGklNDBueHAuY29tDQo+ID4gPiA+ICU3QzIzM2IyNTY2ZTJmNzQ5Mjgx
NjVjMDhkOTlkMGM2NDRjJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljDQo+ID4gNWMzMA0KPiA+
ID4gPg0KPiA+IDE2MzUlN0MwJTdDMCU3QzYzNzcxMzQ5ODgxNDkyMTA0NiU3Q1Vua25vd24lN0NU
V0ZwYkdac2IzZDhleQ0KPiA+ID4gPg0KPiA+IEpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJs
dU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlDQo+ID4gPiA+DQo+ID4gN0MxMDAw
JmFtcDtzZGF0YT02cDJGR0ljZlduJTJCU3JDbUphVVJvUGExSzBOc0dpMGFEN3BzZEpXREFiDQo+
ID4gPiA+IE1vJTNEJmFtcDtyZXNlcnZlZD0w77yb5pys5paH5qGj5YyF5ZCrDQo+ID4gPiA+ICvk
uIDkupvpkojlr7nlhoXmoLjnmoRzcGFyc2Xkv6Hmga/jgIINCj4gPiA+ID4gK+WFs+S6jnNwYXJz
ZeeahOabtOWkmuS/oeaBr++8jOS4u+imgeaYr+WFs+S6juWug+eahOWGhemDqOe7k+aehO+8jOWP
r+S7peWcqOWug+eahOWumA0KPiA+IOaWuQ0KPiA+ID4gPiDnvZHpobXkuIrmib7liLDvvJoNCj4g
PiA+ID4NCj4gPiAraHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHBzJTNBJTJGJTJGcw0KPiA+ID4gPiArcGFyDQo+ID4gPiA+DQo+ID4gc2UuZG9j
cy5rZXJuZWwub3JnJTJGJmFtcDtkYXRhPTA0JTdDMDElN0NsZW95YW5nLmxpJTQwbnhwLmNvbSU3
QzIzDQo+ID4gPiA+DQo+ID4gM2IyNTY2ZTJmNzQ5MjgxNjVjMDhkOTlkMGM2NDRjJTdDNjg2ZWEx
ZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlDQo+ID4gPiA+DQo+ID4gN0MwJTdDMCU3QzYzNzcx
MzQ5ODgxNDkyMTA0NiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaQ0KPiA+ID4gPg0K
PiA+IE1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZN
bjAlM0QlN0MxMDANCj4gPiA+ID4NCj4gPiAwJmFtcDtzZGF0YT1IR2ZMek5MYUZPQUtpUjI4OG4y
RyUyRkxyZGFxZURPOVQ2SWNKZ2I5bzBWUHclM0QmYQ0KPiA+ID4gPiBtcDtyZXNlcnZlZD0w44CC
DQo+ID4gPiA+DQo+ID4gPiA+ICDkvb/nlKggc3BhcnNlIOW3peWFt+WBmuexu+Wei+ajgOafpQ0K
PiA+ID4gPiAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4NCj4gPiA+ID4NCj4gPiA+ID4gLSJf
X2JpdHdpc2UiIOaYr+S4gOenjeexu+Wei+WxnuaAp++8jOaJgOS7peS9oOW6lOivpei/meagt+S9
v+eUqOWug++8mg0KPiA+ID4gPiArYGBfX2JpdHdpc2BgIOaYr+S4gOenjeexu+Wei+WxnuaAp++8
jOaJgOS7peS9oOW6lOivpei/meagt+S9v+eUqOWugzo6DQo+ID4gPg0KPiA+ID4gVHlwby4gIF9f
Yml0d2lzZS4NCj4gPiBPS++8jFRoYW5rcyENCj4gPiA+DQo+ID4gPiBCdHcsIG5vdCBzdXJlIHdo
eSB5b3UgYXJlIGNoYW5naW5nIGFsbCB0aGUgIiBpbiBvcmlnaW5hbCBkb2N1bWVudCB0byBgYC4N
Cj4gPiBzb3JyeSxJIHdpbGwgcmVjb3ZlciBiYWNrIQ0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4g
ICAgICAgICAgdHlwZWRlZiBpbnQgX19iaXR3aXNlIHBtX3JlcXVlc3RfdDsNCj4gPiA+ID4NCj4g
PiA+ID4gQEAgLTM3LDE2ICszNywxNiBAQCBDb3B5cmlnaHQgMjAwNiBCb2IgQ29wZWxhbmQNCj4g
PiA8bWVAYm9iY29wZWxhbmQuY29tPg0KPiA+ID4gPiAgICAgICAgICAgICAgICAgIFBNX1JFU1VN
RSA9IChfX2ZvcmNlIHBtX3JlcXVlc3RfdCkgMg0KPiA+ID4gPiAgICAgICAgICB9Ow0KPiA+ID4g
Pg0KPiA+ID4gPiAt6L+Z5qC35Lya5L2/IFBNX1NVU1BFTkQg5ZKMIFBNX1JFU1VNRSDmiJDkuLrk
vY3mlrnlvI8oYml0d2lzZSnmlbTmlbANCj4gPiDvvIjkvb/nlKgNCj4gPiA+ID4gIl9fZm9yY2Ui
DQo+ID4gPiA+IC3mmK/lm6DkuLogc3BhcnNlIOS8muaKseaAqOaUueWPmOS9jeaWueW8j+eahOex
u+Wei+i9rOaNou+8jOS9huaYr+i/memHjOaIkeS7rOehruWunumcgA0KPiA+IOimgQ0KPiA+ID4g
PiDlvLrliLbov5vooYzovawNCj4gPiA+ID4gLeaNou+8ieOAguiAjOS4lOWboOS4uuaJgOacieae
muS4vuWAvOmDveS9v+eUqOS6huebuOWQjOeahOexu+Wei++8jOi/memHjOeahCJlbnVtDQo+ID4g
PiA+IHBtX3JlcXVlc3Qi5Lmf5bCGDQo+ID4gPiA+IC3kvJrkvb/nlKjpgqPkuKrnsbvlnovlgZrk
uLrlupXlsYLlrp7njrDjgIINCj4gPiA+ID4gK+i/meagt+S8muS9v1BNX1NVU1BFTkTlkoxQTV9S
RVNVTUXmiJDkuLrkvY3mlrnlvI8gYGBiaXR3aXNlYGAg5pW05pWwDQo+ID4g77yI5L2/DQo+ID4g
PiA+IOeUqA0KPiA+ID4gPiArYGBfX2ZvcmNlYGAg5piv5Zug5Li6c3BhcnNl5Lya5oqx5oCo5pS5
5Y+Y5L2N5pa55byP55qE57G75Z6L6L2s5o2i77yM5L2G5piv6L+Z6YeMDQo+ID4g5oiR5LusDQo+
ID4gPiA+IOehruWung0KPiA+ID4gPiAr6ZyA6KaB5by65Yi26L+b6KGM6L2s5o2i77yJ44CC6ICM
5LiU5Zug5Li65omA5pyJ5p6a5Li+5YC86YO95L2/55So5LqG55u45ZCM55qE57G75Z6L77yMDQo+
ID4g6L+ZDQo+ID4gPiA+IOmHjOeahA0KPiA+ID4gPiArYGBlbnVtIHBtX3JlcXVlc3RgYCDkuZ/l
sIbkvJrkvb/nlKjpgqPkuKrnsbvlnovlgZrkuLrlupXlsYLlrp7njrDjgIINCj4gPiA+ID4NCj4g
PiA+ID4gLeiAjOS4lOS9v+eUqCBnY2Mg57yW6K+R55qE5pe25YCZ77yM5omA5pyJ55qEIF9fYml0
d2lzZS9fX2ZvcmNlIOmDveS8mua2iOWkse+8jOacgA0KPiA+IOWQjuWcqA0KPiA+ID4gPiBnY2MN
Cj4gPiA+ID4gLeeci+adpeWug+S7rOWPquS4jei/h+aYr+aZrumAmueahOaVtOaVsOOAgg0KPiA+
ID4gPiAr6ICM5LiU5L2/55SoZ2Nj57yW6K+R55qE5pe25YCZ77yM5omA5pyJ55qEIGBgX19iaXR3
aXNlYGAgLyBgYF9fZm9yY2VgYCDpg73kvJrmtojlpLHvvIwNCj4gPiA+ID4gK+acgOWQjuWcqGdj
Y+eci+adpeWug+S7rOWPquS4jei/h+aYr+aZrumAmueahOaVtOaVsOOAgg0KPiA+ID4gPg0KPiA+
ID4gPiAt5Z2m55m95p2l6K+077yM5L2g5bm25LiN6ZyA6KaB5L2/55So5p6a5Li+57G75Z6L44CC
5LiK6Z2i6YKj5Lqb5a6e6ZmF6YO95Y+v5Lul5rWT57yp5oiQDQo+ID4g5LiA5LiqDQo+ID4gPiA+
IOeJueauiueahCJpbnQNCj4gPiA+ID4gLV9fYml0d2lzZSLnsbvlnovjgIINCj4gPiA+ID4gK+Wd
pueZveadpeivtO+8jOS9oOW5tuS4jemcgOimgeS9v+eUqOaemuS4vuexu+Wei+OAguS4iumdoumC
o+S6m+WunumZhemDveWPr+S7pea1k+e8qeaIkA0KPiA+IOS4gA0KPiA+ID4gPiDkuKrnibnmrorn
moQNCj4gPiA+ID4gK2BgaW50X19iaXR3aXNlYGAg57G75Z6L44CCDQo+ID4gPiA+DQo+ID4gPiA+
ICDmiYDku6Xmm7TnroDljZXnmoTlip7ms5Xlj6ropoHov5nmoLflgZrvvJoNCj4gPiA+ID4NCj4g
PiA+ID4gQEAgLTU3LDM1ICs1Nyw1MiBAQCBfX2JpdHdpc2Ui57G75Z6L44CCDQo+ID4gPiA+DQo+
ID4gPiA+ICDnjrDlnKjkvaDlsLHmnInkuobkuKXmoLznmoTnsbvlnovmo4Dmn6XmiYDpnIDopoHn
moTmiYDmnInln7rnoYDmnrbmnoTjgIINCj4gPiA+ID4NCj4gPiA+ID4gLeS4gOS4quWwj+aPkOmG
ku+8muW4uOaVsOaVtOaVsCIwIuaYr+eJueauiueahOOAguS9oOWPr+S7peebtOaOpeaKiuW4uOaV
sOmbtuW9k+S9nOS9jeaWuQ0KPiA+IOW8jw0KPiA+ID4gPiDmlbTmlbDkvb/nlKjogIwNCj4gPiA+
ID4gLeS4jeeUqOaLheW/gyBzcGFyc2Ug5Lya5oqx5oCo44CC6L+Z5piv5Zug5Li6ImJpdHdpc2Ui
77yI5oGw5aaC5YW25ZCN77yJ5piv55So5p2l56GuDQo+ID4g5L+d5LiNDQo+ID4gPiA+IOWQjOS9
jeaWuQ0KPiA+ID4gPiAt5byP57G75Z6L5LiN5Lya6KKr5byE5re377yI5bCP5bC+5qih5byP77yM
5aSn5bC+5qih5byP77yMY3B15bC+5qih5byP77yM5oiW6ICF5YW2DQo+ID4g5LuW77yJ77yMDQo+
ID4gPiA+IOWvueS7luS7rOadpeivtA0KPiA+ID4gPiAt5bi45pWwIjAi56Gu5a6e5piv54m55q6K
55qE44CCDQo+ID4gPiA+ICvkuIDkuKrlsI/mj5DphpLvvJrluLjmlbDmlbTmlbAgYGAwYGAg5piv
54m55q6K55qE44CC5L2g5Y+v5Lul55u05o6l5oqK5bi45pWw6Zu25b2T5L2c5L2NDQo+ID4g5pa5
DQo+ID4gPiA+IOW8j+aVtOaVsOS9v+eUqOiAjA0KPiA+ID4gPiAr5LiN55So5ouF5b+Dc3BhcnNl
5Lya5oqx5oCo44CC6L+Z5piv5Zug5Li6IGBgYml0d2lzZWBgIO+8iOaBsOWmguWFtuWQje+8ieaY
r+eUqOadpQ0KPiA+IOehruS/nQ0KPiA+ID4gPiDkuI3lkIzkvY3mlrkNCj4gPiA+ID4gK+W8j+ex
u+Wei+S4jeS8muiiq+W8hOa3t++8iOWwj+WwvuaooeW8j++8jOWkp+WwvuaooeW8j++8jGNwdeWw
vuaooeW8j++8jOaIluiAheWFtg0KPiA+IOS7lu+8ie+8jA0KPiA+ID4gPiDlr7nku5bku6zmnaXo
r7TluLjmlbANCj4gPiA+ID4gK2BgMGBgIOehruWuniAq5pivKiDnibnmrornmoTjgIINCj4gPiA+
DQo+ID4gPiBOb3Qgc3VyZSBpZiB0aGUgaXRhbGljIGlzIGEgc3RhbmRhcmQgd2F5IHRvIGVtcGhh
c2lzIGluIENoaW5lc2UsIG1heWJlIGJvbGQNCj4gPiBtb3JlIGNvbW1vbi4NCj4gPiB5ZXMsICIq
5pivKiIgaXMgYm9sZCxUaGFua3MuDQpTb3JyeSwgSSBnb3QgdGhlIHN5bWJvbHMgbWl4ZWQgdXAu
IFRfVA0KDQpUaGFua3MsDQpZYW50ZW5nDQo=

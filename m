Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA145C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 07:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbiCVHuB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 03:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiCVHt7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 03:49:59 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C28B290
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:48:31 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id l18so19327895ioj.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 00:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h0vps8nIj5QMiexkQnF+U2o53EiTlng4YFz5VzRB4Rw=;
        b=iwesP+7g8eRj8eBhC8jO/D+Gs2ubi2dd/oTCzN21+vmcUhLkBJmgY5LZiI+laWcp5D
         n2kttPKa0kCsIFQmUAdIVV2UWwj8WiY+f8HpwALDVPCDyKnJSpqPLncd/iibOn2EssDs
         qwcYpVuWig+ssHnfxFd5pdfLk4r1obGQ9Pd0Cy4rww3iCeTkR3wjFKfYGuXjXGduje1G
         Q488eTMWowNdhKwPyoRwPSy7SVvLu5iuThg32vPLjVbjEX17gsbJAKT31iLFHBrJH8TB
         GmCQLGx+gT9FljffMbWl3d0NhZEhAt3hY/UwOZVm5hqlpP3TU5R7HTjjwh2+1D77OO8r
         SSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h0vps8nIj5QMiexkQnF+U2o53EiTlng4YFz5VzRB4Rw=;
        b=OdI16Keru09zUsOJ6SE5QDyZO31hlJIrgZQD5nGL4mdwGTWCKtPmccH+INlgk8TzYz
         Pj6dv+MAeYiSaGxYbB01ujkVzcUibaieaRFJKNLjN8+XPoV0bGzBP8c45yXZ00hlM9Fo
         FNvKPJGLEbER4FfVqyNeW/lm5YckO5UR9d3PlgU+16n6zILlThug/jZ6flwo7RPSm0rf
         zVEfTLnkGnjhjWwxHFZBcMWEG5vO6WzBlkJEN0DrfsGHsSPqDl/3RRl80kulghxz/Y7U
         vB7fd4eIqNUngFyOYKYZlLQF2MmrOQYn43kXKnc048ThLiKeNwmu/FiDYC6H274SDwX1
         djww==
X-Gm-Message-State: AOAM533Hr3mY6eg5pqwi3KtrFZBhbZtDeNZVWQKLEg0GuGW/QzEOAVp4
        3JqTnt9ZHRsssnSs/1MOeGHQW23IEDEl5VHYn+bTL2dYP/5ms2u/
X-Google-Smtp-Source: ABdhPJyP1AUcPnFscsKm4WPvP6cwjQ+5GJL9TEOJZGNFLJZjD3HEyezMpHC1h4/04VWdARMxgmvKAoJ+pXFFKlSOtc4=
X-Received: by 2002:a05:6638:13cf:b0:319:e4eb:ac0 with SMTP id
 i15-20020a05663813cf00b00319e4eb0ac0mr12492863jaj.209.1647935310748; Tue, 22
 Mar 2022 00:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <1506219c6153c3f47966feee8948ccd646e16157.1647498763.git.siyanteng@loongson.cn>
In-Reply-To: <1506219c6153c3f47966feee8948ccd646e16157.1647498763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Tue, 22 Mar 2022 15:47:54 +0800
Message-ID: <CAJy-Amm-J7hnesc-muVdY86kSk4idYve=FNcg3ssH2KvQgW6Jg@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] docs/zh_CN: add vm remap_file_pages translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBNYXIgMTcsIDIwMjIgYXQgMjo1MSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBn
bWFpbC5jb20+IHdyb3RlOg0KPg0KPiBGcm9tOiBZYW50ZW5nIFNpIDxzaXlhbnRlbmcwMUBnbWFp
bC5jb20+DQo+DQo+IFRyYW5zbGF0ZSAuLi4vdm0vcmVtYXBfZmlsZV9wYWdlcy5yc3QgaW50byBD
aGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdz
b24uY24+DQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vaW5k
ZXgucnN0IHwgIDIgKy0NCj4gIC4uLi96aF9DTi92bS9yZW1hcF9maWxlX3BhZ2VzLnJzdCAgICAg
ICAgICAgICB8IDMyICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL3JlbWFwX2ZpbGVfcGFnZXMucnN0DQo+DQo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5y
c3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gaW5k
ZXggYTJkZWE4YjYxOGFkLi4zZTRmNGNhYzUwOWMgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL2luZGV4LnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9u
L3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gQEAgLTM1LDYgKzM1LDcgQEAgVE9E
TzrlvoXlvJXnlKjmlofmoaPpm4booqvnv7vor5Hlrozmr5XlkI7or7flj4rml7bkv67mlLnmraTl
pITvvIkNCj4gICAgIHBhZ2VfZnJhZ3MNCj4gICAgIHBhZ2Vfb3duZXINCj4gICAgIHBhZ2VfdGFi
bGVfY2hlY2sNCj4gKyAgIHJlbWFwX2ZpbGVfcGFnZXMNCj4NCj4gIFRPRE9MSVNUOg0KPiAgKiBh
cmNoX3BndGFibGVfaGVscGVycw0KPiBAQCAtNDMsNyArNDQsNiBAQCBUT0RPTElTVDoNCj4gICog
aHVnZXRsYmZzX3Jlc2Vydg0KPiAgKiBudW1hDQo+ICAqIHBhZ2VfbWlncmF0aW9uDQo+IC0qIHJl
bWFwX2ZpbGVfcGFnZXMNCj4gICogc2x1Yg0KPiAgKiBzcGxpdF9wYWdlX3RhYmxlX2xvY2sNCj4g
ICogdHJhbnNodWdlDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi92bS9yZW1hcF9maWxlX3BhZ2VzLnJzdCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3ZtL3JlbWFwX2ZpbGVfcGFnZXMucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
IGluZGV4IDAwMDAwMDAwMDAwMC4uM2UwZTQ5YjNkZmZiDQo+IC0tLSAvZGV2L251bGwNCj4gKysr
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vcmVtYXBfZmlsZV9wYWdlcy5y
c3QNCj4gQEAgLTAsMCArMSwzMiBAQA0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0aW9uL3ZtL3Jl
bWFwX2ZpbGVfcGFnZXMucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+ICsNCj4gKyDlj7jlu7bohb4g
WWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiArDQo+ICs65qCh6K+ROg0KPiAr
DQo+ICsNCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiArcmVtYXBfZmlsZV9w
YWdlcygp57O757uf6LCD55SoDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4g
Kw0KPiArcmVtYXBfZmlsZV9wYWdlcygp57O757uf6LCD55So6KKr55So5p2l5Yib5bu65LiA5Liq
6Z2e57q/5oCn5pig5bCE77yM5Lmf5bCx5piv6K+077yM5Zyo6L+Z5Liq5pig5bCE5Lit77yMDQo+
ICvmlofku7bnmoTpobXpnaLooqvml6Dluo/mmKDlsITliLDlhoXlrZjkuK3jgILkvb/nlKhyZW1h
cF9maWxlX3BhZ2VzKCnmr5Tph43lpI3osIPnlKhtbWFwKDIp55qE5aW9DQo+ICvlpITmmK/vvIzl
iY3ogIXkuI3pnIDopoHlhoXmoLjliJvlu7rpop3lpJbnmoRWTUHvvIjomZrmi5/lhoXlrZjljLrv
vInmlbDmja7nu5PmnoTjgIINCj4gKw0KPiAr5pSv5oyB6Z2e57q/5oCn5pig5bCE6ZyA6KaB5Zyo
5YaF5qC46Jma5ouf5YaF5a2Y5a2Q57O757uf5Lit57yW5YaZ5aSn6YeP55qEbm9uLXRyaXZpYWzn
moTku6PnoIHvvIzljIXmi6zng60NCj4gK+i3r+W+hOOAguWPpuWklu+8jOS4uuS6huS9v+mdnue6
v+aAp+aYoOWwhOW3peS9nO+8jOWGheaguOmcgOimgeS4gOenjeaWueazleadpeWMuuWIhuato+W4
uOeahOmhteihqOmhueWSjOW4puacieaWh+S7tg0KPiAr5YGP56e755qE6aG577yIcHRlX2ZpbGXv
vInjgILlhoXmoLjkuLrovr7liLDov5nkuKrnm67nmoTlnKhQVEXkuK3kv53nlZnkuobmoIflv5fj
gIJQVEXmoIflv5fmmK/nqIDnvLrotYQNCj4gK+a6kO+8jOeJueWIq+aYr+WcqOafkOS6m0NQVeae
tuaehOS4iuOAguWmguaenOiDveiFvuWHuui/meS4quagh+W/l+eUqOS6juWFtuS7lueUqOmAlOWw
seabtOWlveS6huOAgg0KPiArDQo+ICvlubjov5DnmoTmmK/vvIzlnKjnlJ/mtLvkuK3lubbmsqHm
nInlvojlpJpyZW1hcF9maWxlX3BhZ2VzKCnnmoTnlKjmiLfjgILlj6rnn6XpgZPmnInkuIDkuKrk
vIHkuJrnmoRSREJNUw0KPiAr5a6e546w5ZyoMzLkvY3ns7vnu5/kuIrkvb/nlKjov5nkuKrns7vn
u5/osIPnlKjmnaXmmKDlsITmr5QzMuS9jeiZmuaLn+WcsOWdgOepuumXtOe6v+aAp+WwuuWvuOab
tOWkp+eahOaWh+S7tuOAgg0KPiAr55Sx5LqONjTkvY3ns7vnu5/nmoTlub/ms5vkvb/nlKjvvIzo
v5nnp43kvb/nlKjmg4XlhrXlt7Lnu4/kuI3ph43opoHkuobjgIINCj4gKw0KPiArc3lzY2FsbOii
q+W6n+W8g+S6hu+8jOeOsOWcqOeUqOS4gOS4quaooeaLn+adpeS7o+abv+Wug+OAguS7v+ecn+S8
muWIm+W7uuaWsOeahFZNQe+8jOiAjOS4jeaYr+mdnue6v+aAp+aYoOWwhOOAgg0KPiAr5a+55LqO
cmVtYXBfZmlsZV9wYWdlcygp55qE5bCR5pWw55So5oi35p2l6K+077yM5a6D55qE5bel5L2c6YCf
5bqm5Lya5Y+Y5oWi77yM5L2GQUJJ6KKr5L+d55WZ5LqG44CCDQo+ICsNCj4gK+S7v+ecn+eahOS4
gOS4quWJr+S9nOeUqO+8iOmZpOS6huaAp+iDveS5i+Wklu+8ieaYr++8jOeUseS6jumineWkluea
hFZNQe+8jOeUqOaIt+WPr+S7peabtOWuueaYk+i+vuWIsA0KPiArdm0ubWF4X21hcF9jb3VudOea
hOmZkOWItuOAguWFs+S6jumZkOWItueahOabtOWkmue7huiKgu+8jOivt+WPguingURFRkFVTFRf
TUFYX01BUF9DT1VOVA0KPiAr55qE5rOo6YeK44CCDQo+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2Yg
ZmlsZQ0KDQpkbyB3ZSBuZWVkIHRvIHB1dCB0aGlzIGxpbmUgaGVyZT8gOikgbWF5YmUgZHJvcCBp
dCBzaW5jZSBubyBwb2ludHMuDQoNClJldmlld2VkLWJ5OiBBbGV4IFNoaSA8YWxleHNAa2VybmVs
Lm9yZz4NCg0KPiAtLQ0KPiAyLjI3LjANCj4NCg==

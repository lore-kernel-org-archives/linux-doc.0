Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616D5C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 08:30:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233720AbiC1IcL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 04:32:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239375AbiC1IcJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 04:32:09 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5E913F7A
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 01:30:28 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id o5so24733663ybe.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 01:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7ye9i2dyZsxV8F0ECafMC/UPuEisvRuuytxXWcnqpxs=;
        b=WKtp33me9akOJT1V+Z3HGOTiMrRoNRabs78GhGj2Gzla6u0EQR21r4lpNe/3TgHxTS
         SD2c+aN6CoZ+38zC0RDDfucijMGFvPDJKSMxwh9E9NKI1ldBG6OlGOav4OSLpOldKcHJ
         Wv7GSEnAvzaJsR+f01cX9htrFe/9yzaJGkUmFc92AR9xkxJcJJqp64/qNzYifSxFN6nw
         vxHRTdiKDgqZfA1G3z0TGIMWOzWmcTom/w+GPk/46hlIZYCk3nxe+3w5K263PlJGOvrV
         iMx9BpjNoUKZ/Q5V6zGeIzr+JiVrzjZ+mKrW7cdouxQA3am2PDIXt5lmrY8VQS5frlrl
         BVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7ye9i2dyZsxV8F0ECafMC/UPuEisvRuuytxXWcnqpxs=;
        b=fSbhf3HgkHcSoPEJaCex83Oem+Uwj2Wv9QM04uOQ+O28pOFYzAXW+TZvrH/FiWWvIY
         bCMPDXMohQ7BmNS4eTNRKt9Zf6d42pF19yt53piWwvWyAuUzwbG1xOfH592CT2oQ+5XU
         cJucsUJu/cbquR+URaCPLmN/esNO+elrb5WD1UUg7DzGpLevHOedxdSRtQh2gl9z0vCw
         gu4J8sLhI3k1pqCRNsuvQFk8vr7ap+lXPnURWZn3737bLw94QfEvVY1Pho5eSjwDsKBm
         ZtSzUqYibmxiGwhkMbHUoeH9myhTlieuWuTEsg9wPGi6aTnMvZAsKeuwOS3RAkif+LAq
         59Ug==
X-Gm-Message-State: AOAM533ouMYWWO23nwCa4LNP/ZfiPGIHrYCyhbadPXNbWcxgj/FqqC4R
        MXfPMPkl18MzK/v60Ge3zIt9fECiguXY5VBYywQ=
X-Google-Smtp-Source: ABdhPJx4WyIDaXMesl/YnGV3KW2GjNDkgDPP2Vf4F8URENrN7JFdlmzkrf6HomGX7Uld8moJIgqAIttyaYdmIYzKTEs=
X-Received: by 2002:a25:9a43:0:b0:628:672c:e471 with SMTP id
 r3-20020a259a43000000b00628672ce471mr20748948ybo.73.1648456228030; Mon, 28
 Mar 2022 01:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647498763.git.siyanteng@loongson.cn> <1506219c6153c3f47966feee8948ccd646e16157.1647498763.git.siyanteng@loongson.cn>
 <CAJy-Amm-J7hnesc-muVdY86kSk4idYve=FNcg3ssH2KvQgW6Jg@mail.gmail.com>
In-Reply-To: <CAJy-Amm-J7hnesc-muVdY86kSk4idYve=FNcg3ssH2KvQgW6Jg@mail.gmail.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Mon, 28 Mar 2022 16:30:04 +0800
Message-ID: <CAEensMzWkbs8B=p0jyJ8d1O-Rr-qEFXXuHMEAnt0Pwq7XEb87g@mail.gmail.com>
Subject: Re: [PATCH v2 09/12] docs/zh_CN: add vm remap_file_pages translation
To:     Alex Shi <seakeel@gmail.com>
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

QWxleCBTaGkgPHNlYWtlZWxAZ21haWwuY29tPiDkuo4yMDIy5bm0M+aciDIy5pel5ZGo5LqMIDE1
OjQ45YaZ6YGT77yaDQo+DQo+IE9uIFRodSwgTWFyIDE3LCAyMDIyIGF0IDI6NTEgUE0gWWFudGVu
ZyBTaSA8c2l5YW50ZW5nMDFAZ21haWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IFlhbnRl
bmcgU2kgPHNpeWFudGVuZzAxQGdtYWlsLmNvbT4NCj4gPg0KPiA+IFRyYW5zbGF0ZSAuLi4vdm0v
cmVtYXBfZmlsZV9wYWdlcy5yc3QgaW50byBDaGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+IC0tLQ0KPiA+ICBEb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAgMiArLQ0KPiA+ICAu
Li4vemhfQ04vdm0vcmVtYXBfZmlsZV9wYWdlcy5yc3QgICAgICAgICAgICAgfCAzMiArKysrKysr
KysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vdm0vcmVtYXBfZmlsZV9wYWdlcy5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQg
YS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgYi9Eb2N1bWVu
dGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiBpbmRleCBhMmRlYThi
NjE4YWQuLjNlNGY0Y2FjNTA5YyAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5z
bGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiBAQCAtMzUsNiArMzUsNyBAQCBUT0RPOuW+
heW8leeUqOaWh+aho+mbhuiiq+e/u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaUueatpOWkhO+8
iQ0KPiA+ICAgICBwYWdlX2ZyYWdzDQo+ID4gICAgIHBhZ2Vfb3duZXINCj4gPiAgICAgcGFnZV90
YWJsZV9jaGVjaw0KPiA+ICsgICByZW1hcF9maWxlX3BhZ2VzDQo+ID4NCj4gPiAgVE9ET0xJU1Q6
DQo+ID4gICogYXJjaF9wZ3RhYmxlX2hlbHBlcnMNCj4gPiBAQCAtNDMsNyArNDQsNiBAQCBUT0RP
TElTVDoNCj4gPiAgKiBodWdldGxiZnNfcmVzZXJ2DQo+ID4gICogbnVtYQ0KPiA+ICAqIHBhZ2Vf
bWlncmF0aW9uDQo+ID4gLSogcmVtYXBfZmlsZV9wYWdlcw0KPiA+ICAqIHNsdWINCj4gPiAgKiBz
cGxpdF9wYWdlX3RhYmxlX2xvY2sNCj4gPiAgKiB0cmFuc2h1Z2UNCj4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vdm0vcmVtYXBfZmlsZV9wYWdlcy5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9yZW1hcF9maWxlX3BhZ2VzLnJz
dA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4zZTBl
NDliM2RmZmINCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vdm0vcmVtYXBfZmlsZV9wYWdlcy5yc3QNCj4gPiBAQCAtMCwwICsxLDMy
IEBADQo+ID4gKzpPcmlnaW5hbDogRG9jdW1lbnRhdGlvbi92bS9yZW1hcF9maWxlX3BhZ2VzLnJz
dA0KPiA+ICsNCj4gPiArOue/u+ivkToNCj4gPiArDQo+ID4gKyDlj7jlu7bohb4gWWFudGVuZyBT
aSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ICsNCj4gPiArOuagoeivkToNCj4gPiArDQo+
ID4gKw0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gPiArcmVtYXBfZmls
ZV9wYWdlcygp57O757uf6LCD55SoDQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiA+ICsNCj4gPiArcmVtYXBfZmlsZV9wYWdlcygp57O757uf6LCD55So6KKr55So5p2l5Yib
5bu65LiA5Liq6Z2e57q/5oCn5pig5bCE77yM5Lmf5bCx5piv6K+077yM5Zyo6L+Z5Liq5pig5bCE
5Lit77yMDQo+ID4gK+aWh+S7tueahOmhtemdouiiq+aXoOW6j+aYoOWwhOWIsOWGheWtmOS4reOA
guS9v+eUqHJlbWFwX2ZpbGVfcGFnZXMoKeavlOmHjeWkjeiwg+eUqG1tYXAoMinnmoTlpb0NCj4g
PiAr5aSE5piv77yM5YmN6ICF5LiN6ZyA6KaB5YaF5qC45Yib5bu66aKd5aSW55qEVk1B77yI6Jma
5ouf5YaF5a2Y5Yy677yJ5pWw5o2u57uT5p6E44CCDQo+ID4gKw0KPiA+ICvmlK/mjIHpnZ7nur/m
gKfmmKDlsITpnIDopoHlnKjlhoXmoLjomZrmi5/lhoXlrZjlrZDns7vnu5/kuK3nvJblhpnlpKfp
h4/nmoRub24tdHJpdmlhbOeahOS7o+egge+8jOWMheaLrOeDrQ0KPiA+ICvot6/lvoTjgILlj6bl
pJbvvIzkuLrkuobkvb/pnZ7nur/mgKfmmKDlsITlt6XkvZzvvIzlhoXmoLjpnIDopoHkuIDnp43m
lrnms5XmnaXljLrliIbmraPluLjnmoTpobXooajpobnlkozluKbmnInmlofku7YNCj4gPiAr5YGP
56e755qE6aG577yIcHRlX2ZpbGXvvInjgILlhoXmoLjkuLrovr7liLDov5nkuKrnm67nmoTlnKhQ
VEXkuK3kv53nlZnkuobmoIflv5fjgIJQVEXmoIflv5fmmK/nqIDnvLrotYQNCj4gPiAr5rqQ77yM
54m55Yir5piv5Zyo5p+Q5LqbQ1BV5p625p6E5LiK44CC5aaC5p6c6IO96IW+5Ye66L+Z5Liq5qCH
5b+X55So5LqO5YW25LuW55So6YCU5bCx5pu05aW95LqG44CCDQo+ID4gKw0KPiA+ICvlubjov5Dn
moTmmK/vvIzlnKjnlJ/mtLvkuK3lubbmsqHmnInlvojlpJpyZW1hcF9maWxlX3BhZ2VzKCnnmoTn
lKjmiLfjgILlj6rnn6XpgZPmnInkuIDkuKrkvIHkuJrnmoRSREJNUw0KPiA+ICvlrp7njrDlnKgz
MuS9jeezu+e7n+S4iuS9v+eUqOi/meS4quezu+e7n+iwg+eUqOadpeaYoOWwhOavlDMy5L2N6Jma
5ouf5Zyw5Z2A56m66Ze057q/5oCn5bC65a+45pu05aSn55qE5paH5Lu244CCDQo+ID4gK+eUseS6
jjY05L2N57O757uf55qE5bm/5rOb5L2/55So77yM6L+Z56eN5L2/55So5oOF5Ya15bey57uP5LiN
6YeN6KaB5LqG44CCDQo+ID4gKw0KPiA+ICtzeXNjYWxs6KKr5bqf5byD5LqG77yM546w5Zyo55So
5LiA5Liq5qih5ouf5p2l5Luj5pu/5a6D44CC5Lu/55yf5Lya5Yib5bu65paw55qEVk1B77yM6ICM
5LiN5piv6Z2e57q/5oCn5pig5bCE44CCDQo+ID4gK+WvueS6jnJlbWFwX2ZpbGVfcGFnZXMoKeea
hOWwkeaVsOeUqOaIt+adpeivtO+8jOWug+eahOW3peS9nOmAn+W6puS8muWPmOaFou+8jOS9hkFC
Seiiq+S/neeVmeS6huOAgg0KPiA+ICsNCj4gPiAr5Lu/55yf55qE5LiA5Liq5Ymv5L2c55So77yI
6Zmk5LqG5oCn6IO95LmL5aSW77yJ5piv77yM55Sx5LqO6aKd5aSW55qEVk1B77yM55So5oi35Y+v
5Lul5pu05a655piT6L6+5YiwDQo+ID4gK3ZtLm1heF9tYXBfY291bnTnmoTpmZDliLbjgILlhbPk
uo7pmZDliLbnmoTmm7TlpJrnu4boioLvvIzor7flj4Lop4FERUZBVUxUX01BWF9NQVBfQ09VTlQN
Cj4gPiAr55qE5rOo6YeK44CCDQo+ID4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+DQo+
IGRvIHdlIG5lZWQgdG8gcHV0IHRoaXMgbGluZSBoZXJlPyA6KSBtYXliZSBkcm9wIGl0IHNpbmNl
IG5vIHBvaW50cy4NCndpbGwgZHJvcCBpdCwNCg0KSW4gZmFjdCB0aGlzIGlzIGluc2VydGVkIGF1
dG9tYXRpY2FsbHkgYnkgdnNjb2RlLCBiZWNhdXNlIEkgZGlkbid0DQppbnNlcnQgYSBsaW5lIGJy
ZWFrIGF0IHRoZSBlbmQgb2YgdGhlIGxhc3QgbGluZSwgYW5kIHRoaXMgbGluZSBkb2Vzbid0DQph
cHBlYXIgaW4gY29udGV4dCBhZnRlciBhcHBseWluZyB0aGUgcGF0Y2guDQoNClRoYW5rcywNCllh
bnRlbmcNCj4NCj4gUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KPg0K
PiA+IC0tDQo+ID4gMi4yNy4wDQo+ID4NCg==

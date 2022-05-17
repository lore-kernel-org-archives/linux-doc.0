Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93EF6C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 17 May 2022 04:00:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231331AbiEQEAa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 May 2022 00:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiEQEA3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 May 2022 00:00:29 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17CA45070
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 21:00:28 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id o130so14838048ybc.8
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 21:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dwTAXS78pYnOlXuDbtKAG3T1yWfngYWkL6ZzLmsn0Ro=;
        b=JWSGug+XZX67ByUw12tmsddIq1B6g1W2Q53YOwippq800chjouVf2gO1fB/rTw7CnA
         9Rq06L0sHtzQi15Jgx5mOVrcyi4qc8LeIAmLith7tSeHgCgb8ts7cSPzo4RhIKrjYiG+
         Up5Za5+rFkJj7U2/frlUBiHR9daAPB+GoQTjRuzsU4NUIUnFcgB8jOhEeOlNDpQwXGm1
         fv8lN8pzlG5QsIGO8jejDYkuGfXQ2e00j6OLK+Y2ddUMS2FQYl+zKX5w1/opcjrmMNI+
         /F8+uJDR1qIB9LzOGgL233hOwGy62HGOD1a+X5RIfMWAyieyauZ4CZOWzJuOHcDHbdNq
         SQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dwTAXS78pYnOlXuDbtKAG3T1yWfngYWkL6ZzLmsn0Ro=;
        b=lDhsHPPNxb/LqUiYBarIBu/ACTaasLl3BcLswnVEyetsnaA6JE5/RTL7udSYwBKCNe
         yksY8Xotqry55ep45Q4fvOtykxCAa4n1aKVJ4eH6Yzele2X7jedDmoEr1P1S4mvLw+g/
         WA8rE0Uz8olheJVmcC7ODQJ28RK++CQShMYENRSHgDnsTXX1gvVbkXl71dW6WL2FJD8q
         Nxfo6QtHrA6cMBJeEoWamYaCY2LywRs3dO6+wGGKD+HyRjTCkurmGsm0+fwFxrG9xyZY
         R58YR85mNJW9+zimxJd68trpuVmCla2G6Vqv2YMNHbmJB9xTf+Q/oJD7Wfh1nv3zxguK
         VwAQ==
X-Gm-Message-State: AOAM530Xmw0b8vsqMfcWeOPGKuepi0R2qIOfXrL9K3MV4L0AvhxtLau/
        H/7WQjmCkdX+kXQF3ua/GZk8o6D2rKLRGYNm4ac=
X-Google-Smtp-Source: ABdhPJzz4hbBrigiG6eDnDLqKsgfKEckD+sZ1MDS1F9XXWnWBezImz7/oVJ6HmfUqqtAHWCuz6C81ph9tRD3vVrmd88=
X-Received: by 2002:a5b:481:0:b0:649:d872:d521 with SMTP id
 n1-20020a5b0481000000b00649d872d521mr20726369ybp.73.1652760027878; Mon, 16
 May 2022 21:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1652713779.git.siyanteng@loongson.cn> <2c85bf903171b61d69aea0345913c89a740f1a86.1652713779.git.siyanteng@loongson.cn>
 <YoMVgfGXMSyLdCPK@bobwxc.mipc>
In-Reply-To: <YoMVgfGXMSyLdCPK@bobwxc.mipc>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 17 May 2022 12:00:16 +0800
Message-ID: <CAEensMxPx2LswcW8UGg0JdufgaJLpCd2urJVWAXo=JB03dxtbQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] docs/zh_CN: add vm page_migration translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIy5bm0NeaciDE35pel5ZGo5LqMIDExOjI1
5YaZ6YGT77yaDQo+DQo+IE9uIE1vbiwgTWF5IDE2LCAyMDIyIGF0IDExOjU2OjMxUE0gKzA4MDAs
IFlhbnRlbmcgU2kgd3JvdGU6DQo+ID4gVHJhbnNsYXRlIC4uLi92bS9wYWdlX21pZ3JhdGlvbi5y
c3QgaW50byBDaGluZXNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5
YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+IC0tLQ0KPiA+ICBEb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi92bS9pbmRleC5yc3QgfCAgIDIgKy0NCj4gPiAgLi4uL3RyYW5zbGF0aW9ucy96
aF9DTi92bS9wYWdlX21pZ3JhdGlvbi5yc3QgIHwgMjI4ICsrKysrKysrKysrKysrKysrKw0KPiA+
ICAyIGZpbGVzIGNoYW5nZWQsIDIyOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9w
YWdlX21pZ3JhdGlvbi5yc3QNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Ry
YW5zbGF0aW9ucy96aF9DTi92bS9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9u
cy96aF9DTi92bS9pbmRleC5yc3QNCj4gPiBpbmRleCBhMWM2ZDUyOWI2ZmYuLjU1MWY1OGJmN2I1
NSAxMDA2NDQNCj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9p
bmRleC5yc3QNCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9p
bmRleC5yc3QNCj4gPiBAQCAtMzYsNiArMzYsNyBAQCBUT0RPOuW+heW8leeUqOaWh+aho+mbhuii
q+e/u+ivkeWujOavleWQjuivt+WPiuaXtuS/ruaUueatpOWkhO+8iQ0KPiA+ICAgICBudW1hDQo+
ID4gICAgIG92ZXJjb21taXQtYWNjb3VudGluZw0KPiA+ICAgICBwYWdlX2ZyYWdzDQo+ID4gKyAg
IHBhZ2VfbWlncmF0aW9uDQo+ID4gICAgIHBhZ2Vfb3duZXINCj4gPiAgICAgcGFnZV90YWJsZV9j
aGVjaw0KPiA+ICAgICByZW1hcF9maWxlX3BhZ2VzDQo+ID4gQEAgLTQ3LDcgKzQ4LDYgQEAgVE9E
T0xJU1Q6DQo+ID4gICogYXJjaF9wZ3RhYmxlX2hlbHBlcnMNCj4gPiAgKiBmcmVlX3BhZ2VfcmVw
b3J0aW5nDQo+ID4gICogaHVnZXRsYmZzX3Jlc2Vydg0KPiA+IC0qIHBhZ2VfbWlncmF0aW9uDQo+
ID4gICogc2x1Yg0KPiA+ICAqIHRyYW5zaHVnZQ0KPiA+ICAqIHVuZXZpY3RhYmxlLWxydQ0KPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9wYWdlX21p
Z3JhdGlvbi5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi92bS9wYWdlX21p
Z3JhdGlvbi5yc3QNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4IDAwMDAwMDAw
MDAwMC4uNDE3ODYxZmJjM2UwDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3ZtL3BhZ2VfbWlncmF0aW9uLnJzdA0KPiBbLi4uXQ0K
PiA+ICsNCj4gPiAr6Z2eTFJV6aG16Z2i6L+B56e7DQo+ID4gKz09PT09PT09PT09PT0NCj4gPiAr
DQo+ID4gK+Wwveeuoei/geenu+acgOWIneeahOebrueahOaYr+S4uuS6huWHj+WwkU5VTUHnmoTl
hoXlrZjorr/pl67lu7bov5/vvIzkvYbljovnvKnkuZ/kvb/nlKjov4Hnp7vmnaXliJvlu7rpq5jp
mLbpobXpnaLjgIINCj4gPiArDQo+ID4gK+ebruWJjeWunueOsOeahOmXrumimOaYr++8jOWug+ii
q+iuvuiuoeS4uuWPqui/geenuypMUlUq6aG144CC54S26ICM77yM5pyJ5LiA5Lqb5r2c5Zyo55qE
6Z2eTFJV6aG16Z2i5Y+v5Lul5Zyo6amx5Yqo5LitDQo+ID4gK+iiq+i/geenu++8jOS+i+Wmgu+8
jHpzbWFsbG9j77yMdmlydGlvLWJhbGxvb27pobXpnaLjgIINCj4gPiArDQo+ID4gK+WvueS6jnZp
cnRpby1iYWxsb29u6aG16Z2i77yM6L+B56e75Luj56CB6Lev5b6E55qE5p+Q5Lqb6YOo5YiG5bey
57uP6KKr6ZKp5L2P77yM5bm25re75Yqg5LqGdmlydGlvLWJhbGxvb24NCj4gPiAr55qE54m55a6a
5Ye95pWw5p2l5oum5oiq6L+B56e76YC76L6R44CC6L+Z5a+55LiA5Liq6amx5Yqo5p2l6K+05aSq
54m55q6K5LqG77yM5omA5Lul5YW25LuW5oOz6K6p6Ieq5bex55qE6aG16Z2i5Y+v56e75Yqo55qE
6amxDQo+ID4gK+WKqOWwseW/hemhu+WcqOi/geenu+i3r+W+hOS4rea3u+WKoOiHquW3seeahOeJ
ueWumumSqeWtkOOAgg0KPiA+ICsNCj4gPiAr5Li65LqG5YWL5pyN6L+Z5Liq6Zeu6aKY77yMVk3m
lK/mjIHpnZ5MUlXpobXpnaLov4Hnp7vvvIzlroPkuLrpnZ5MUlXlj6/np7vliqjpobXpnaLmj5Dk
vpvkuobpgJrnlKjlh73mlbDvvIzogIzlnKjov4Hnp7sNCj4gPiAr6Lev5b6E5Lit5rKh5pyJ54m5
5a6a55qE6amx5Yqo56iL5bqP6ZKp5a2Q44CCDQo+ID4gKw0KPiA+ICvlpoLmnpzkuIDkuKrpqbHl
iqjnqIvluo/mg7PorqnlroPnmoTpobXpnaLlj6/np7vliqjvvIzlroPlupTor6XlrprkuYnkuInk
uKrlh73mlbDvvIzov5nkupvlh73mlbDmmK8NCj4gPiArc3RydWN0IGFkZHJlc3Nfc3BhY2Vfb3Bl
cmF0aW9uc+eahOWHveaVsOaMh+mSiOOAgg0KPiA+ICsNCj4gPiArMS4gYGBib29sICgqaXNvbGF0
ZV9wYWdlKSAoc3RydWN0IHBhZ2UgKnBhZ2UsIGlzb2xhdGVfbW9kZV90IG1vZGUpO2BgDQo+ID4g
Kw0KPiA+ICsgICBWTeWvuempseWKqOeahGlzb2xhdGVfcGFnZSgp5Ye95pWw55qE5pyf5pyb5piv
77yM5aaC5p6c6amx5Yqo5oiQ5Yqf6ZqU56a75LqG6K+l6aG177yM5YiZ6L+U5Zuew5d0cnVlw5fj
gIINCj4NCj4gKnRydWUqDQpPSyENCj4NCj4gPiArICAg6L+U5ZuedHJ1ZeWQju+8jFZN5Lya5bCG
6K+l6aG15qCH6K6w5Li6UEdfaXNvbGF0ZWTvvIzov5nmoLflpJrkuKpDUFXnmoTlubblj5HpmpTn
prvlsLHkvJrot7Pov4for6UNCj4gPiArICAg6aG16L+b6KGM6ZqU56a744CC5aaC5p6c6amx5Yqo
56iL5bqP5LiN6IO96ZqU56a76K+l6aG177yM5a6D5bqU6K+l6L+U5ZueKmZhbHNlKuOAgg0KPiA+
ICsNCj4gPiBbLi4uXQ0KPiA+ICsNCj4gPiArICAgKiBQR19pc29sYXRlZA0KPiA+ICsNCj4gPiAr
ICAgICDkuLrkuobpmLLmraLlh6DkuKpDUFXlkIzml7bov5vooYzpmpTnprvvvIxWTeWcqGxvY2tf
cGFnZSgp5LiL5bCG6ZqU56a755qE6aG16Z2i5qCH6K6w5Li6UEdfaXNvbGF0ZWTjgIINCj4gPiAr
ICAgICDlm6DmraTvvIzlpoLmnpzkuIDkuKpDUFXpgYfliLBQR19pc29sYXRlZOmdnkxSVeWPr+en
u+WKqOmhtemdou+8jOWug+WPr+S7pei3s+i/h+Wug+OAgumpseWKqOeoi+W6j+S4jemcgOimgQ0K
PiA+ICsgICAgIOaTjeS9nOi/meS4quagh+W/l++8jOWboOS4ulZN5Lya6Ieq5Yqo6K6+572uL+a4
hemZpOWug+OAguivt+iusOS9j++8jOWmguaenOmpseWKqOeoi+W6j+eci+WIsFBHX2lzb2xhdGVk
6aG177yMDQo+ID4gKyAgICAg6L+Z5oSP5ZGz552AVk3lt7Lnu4/ooqvomZrmi5/mnLrpmpTnprvv
vIzmiYDku6XlroPkuI3lupTor6XnorBwYWdlLmxydeWtl+auteOAglBHX2lzb2xhdGVk5qCH5b+X
5LiODQo+DQo+IEVtbW0sIEkgbWVhbiDomZrmi5/mnLogLT4gVk0NCk9LIQ0KDQpUaGFua3MsDQpZ
YW50ZW5nDQo+IFNvcnJ5IGZvciB0aGUgbWlzcyBsZWFkaW5nLCBzZWVtaXMgb25seSBzdHJpY3Qg
bW9ubyBmb250IGNvdWxkIHVuZGVyc3RhbmQNCj4gaXQuDQo+DQo+IFBsZWFzZSBmaXggdGhlc2Ug
dHdvLCBhbmQgcGljayBteSByZXZpZXctYnkgOikNCj4NCj4gVGhhbmtzLA0KPiAgICAgICAgIFd1
DQo+DQo+ID4gKyAgICAgUEdfcmVjbGFpbeagh+W/l+aYr+WQjOS5ieeahO+8jOaJgOS7pempseWK
qOeoi+W6j+S4jeW6lOivpeS4uuiHquW3seeahOebrueahOS9v+eUqFBHX2lzb2xhdGVk44CCDQo+
ID4gKw0KPiA+IFsuLi5dDQo+DQo=

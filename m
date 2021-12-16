Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D64CC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 16 Dec 2021 11:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbhLPLlT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Dec 2021 06:41:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbhLPLlT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Dec 2021 06:41:19 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D837C061574
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 03:41:19 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id q72so34709524iod.12
        for <linux-doc@vger.kernel.org>; Thu, 16 Dec 2021 03:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Pk1yIlUz4BFvJlErwg2+I4AYarDDi3FIDY4cOeoo5s0=;
        b=Ee1/dwgjYv/lyAiolAVW4/c5Zt6PtAh1Ljum5vYKzGyHNdrlE3yZQIa21XvSVheXKN
         oPEyxHG1OPOrdWOjjeQxJW2cqmpK7OO4J7u8kHu5ufXq7dnCgJzlGEgZc0BJRhasx5Er
         YJ9HE1HOlL8ebZmmDHmIFP/AYJLx/qIksGrSx9DWO6Mhxdf7Sw816M9PGbfCtSbQ16F0
         VP5401o5VIn9A9WxOI8YO1uj/qTd+KELF/HKJ+cyzVAuEMbasp8GsirH0zfRbZglYAbB
         tEnI9neO8PIyH3Q95mFDHQP31CrBqiUs/nC0khSP+g81VtNvq+HAqjJT/mQq4M2IQt+X
         cmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Pk1yIlUz4BFvJlErwg2+I4AYarDDi3FIDY4cOeoo5s0=;
        b=KBVxT1qliisF39uw7fmAH2FyBMJgB9MVLllcmXIxlciRfhyp2bvVsG3o1tMwT4jfdi
         2fndc4oUZUFHzXbIL4y+fIjuh1JFR4QbmRYSEZDKVSae8mI7IMa3Dx5Y0YrBuPAfzKgt
         iOdLm/XFhTWO7G+w/3UDOSqIg8zpnZw+8bjWPWVyy7Vf9v4JpbZZ9WX/fkKG6Kmk9LcA
         Pe7WHUmvTroIp+SO30q+BqzYmZTDeOeDZZC1gK/ra7Ej2CA33UoPlCyyksma3yCww4Wi
         Ys1LOA42tgBSfDTNOlltShrnMXuRQZdjkzz7Pc+xctBoWBWlWukwusgi0M9iliH0Wg9M
         vofQ==
X-Gm-Message-State: AOAM532uHPLyKQ4/8HzWjjr+ObtYbfaL9X3HbpgW1HnrwVrwOJnBFchW
        jKVATQRPxKQFhUU1m0sCw2rVf9/Piw+LXDibzfs=
X-Google-Smtp-Source: ABdhPJxg3YRY8dyfiuTAXW635oz4S1SfRD6fuD4VUpcLeuH4U9tdk4jBpGQVx9ZdSE8NuBJRVal0mOsm44w0/kjkC2A=
X-Received: by 2002:a5d:9d92:: with SMTP id ay18mr9257123iob.130.1639654878630;
 Thu, 16 Dec 2021 03:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20211216023407.10976-1-tangyizhou@huawei.com>
In-Reply-To: <20211216023407.10976-1-tangyizhou@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 16 Dec 2021 19:40:42 +0800
Message-ID: <CAJy-Amk2p-830UTqxX1p1wnDJLFHbXf1TnmPE4ij4g0eR9teLQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add cputopology Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gVGh1LCBEZWMgMTYsIDIwMjEgYXQgMTA6MDYgQU0gVGFuZyBZaXpob3UgPHRhbmd5aXpob3VA
aHVhd2VpLmNvbT4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBhZG1pbi1ndWlkZS9jcHV0b3BvbG9n
eS5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBUYW5nIFlpemhvdSA8dGFu
Z3lpemhvdUBodWF3ZWkuY29tPg0KDQpSZXZpZXdlZC1ieTogQWxleCBTaGkgPGFsZXhzQGtlcm5l
bC5vcmc+DQoNCj4gLS0tDQo+IHYyOg0KPiBBZGp1c3QgdGFibGUgZm9ybWF0Lg0KPg0KPiAgLi4u
L3poX0NOL2FkbWluLWd1aWRlL2NwdXRvcG9sb2d5LnJzdCAgICAgICAgIHwgOTYgKysrKysrKysr
KysrKysrKysrKw0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9hZG1pbi1ndWlkZS9pbmRleC5y
c3QgIHwgIDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2FkbWluLWd1aWRlL2NwdXRvcG9sb2d5LnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvY3B1dG9wb2xvZ3kucnN0
IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvY3B1dG9wb2xv
Z3kucnN0DQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uNTQ0
ZDQyZjhmM2ZhDQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xh
dGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvY3B1dG9wb2xvZ3kucnN0DQo+IEBAIC0wLDAgKzEsOTYg
QEANCj4gKy4uIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICsuLiBpbmNsdWRl
OjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2NwdXRvcG9sb2d5LnJzdA0KPiArDQo+ICs657+76K+ROg0KPiArDQo+
ICsgIOWUkOiJuuiInyBUYW5nIFlpemhvdSA8dGFuZ3llZWNob3VAZ21haWwuY29tPg0KPiArDQo+
ICs9PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAr5aaC5L2V6YCa6L+Hc3lzZnPlsIZDUFXm
i5PmiZHlr7zlh7oNCj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK0NQVeaL
k+aJkeS/oeaBr+mAmui/h3N5c2Zz5a+85Ye644CC5pi+56S655qE6aG577yI5bGe5oCn77yJ5ZKM
5p+Q5Lqb5p625p6E55qEL3Byb2MvY3B1aW5mb+i+k+WHuuebuOS8vOOAguWug+S7rOS9jeS6jg0K
PiArL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHUvY3B1WC90b3BvbG9neS/jgILor7fpmIXor7tBQknm
lofku7bvvJoNCj4gK0RvY3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1kZXZpY2VzLXN5c3Rl
bS1jcHXjgIINCj4gKw0KPiArZHJpdmVycy9iYXNlL3RvcG9sb2d5LmPmmK/kvZPns7vnu5PmnoTk
uK3mgKfnmoTvvIzlroPlr7zlh7rkuobov5nkupvlsZ7mgKfjgILnhLbogIzvvIxkaWXjgIFjbHVz
dGVy44CBYm9va+OAgQ0KPiArZHJhd+i/meS6m+Wxguasoee7k+aehOebuOWFs+eahOaWh+S7tuS7
heWcqOS9k+ezu+e7k+aehOaPkOS+m+S6huS4i+aWh+aPj+i/sOeahOWuj+eahOadoeS7tuS4i+ii
q+WIm+W7uuOAgg0KPiArDQo+ICvlr7nkuo7mlK/mjIHov5nkuKrnibnmgKfnmoTkvZPns7vnu5Pm
noTvvIzlroPlv4XpobvlnKhpbmNsdWRlL2FzbS1YWFgvdG9wb2xvZ3kuaOS4reWumuS5iei/meS6
m+Wuj+S4reeahOS4gOmDqOWIhjo6DQo+ICsNCj4gKyAgICAgICAjZGVmaW5lIHRvcG9sb2d5X3Bo
eXNpY2FsX3BhY2thZ2VfaWQoY3B1KQ0KPiArICAgICAgICNkZWZpbmUgdG9wb2xvZ3lfZGllX2lk
KGNwdSkNCj4gKyAgICAgICAjZGVmaW5lIHRvcG9sb2d5X2NsdXN0ZXJfaWQoY3B1KQ0KPiArICAg
ICAgICNkZWZpbmUgdG9wb2xvZ3lfY29yZV9pZChjcHUpDQo+ICsgICAgICAgI2RlZmluZSB0b3Bv
bG9neV9ib29rX2lkKGNwdSkNCj4gKyAgICAgICAjZGVmaW5lIHRvcG9sb2d5X2RyYXdlcl9pZChj
cHUpDQo+ICsgICAgICAgI2RlZmluZSB0b3BvbG9neV9zaWJsaW5nX2NwdW1hc2soY3B1KQ0KPiAr
ICAgICAgICNkZWZpbmUgdG9wb2xvZ3lfY29yZV9jcHVtYXNrKGNwdSkNCj4gKyAgICAgICAjZGVm
aW5lIHRvcG9sb2d5X2NsdXN0ZXJfY3B1bWFzayhjcHUpDQo+ICsgICAgICAgI2RlZmluZSB0b3Bv
bG9neV9kaWVfY3B1bWFzayhjcHUpDQo+ICsgICAgICAgI2RlZmluZSB0b3BvbG9neV9ib29rX2Nw
dW1hc2soY3B1KQ0KPiArICAgICAgICNkZWZpbmUgdG9wb2xvZ3lfZHJhd2VyX2NwdW1hc2soY3B1
KQ0KPiArDQo+ICtgYCoqX2lkIG1hY3Jvc2BgIOeahOexu+Wei+aYr2ludOOAgg0KPiArYGAqKl9j
cHVtYXNrIG1hY3Jvc2BgIOeahOexu+Wei+aYryBgYChjb25zdCkgc3RydWN0IGNwdW1hc2sgKmBg
IOOAguWQjuiAheWSjOaBsOW9k+eahA0KPiArYGAqKl9zaWJsaW5nc2BgIHN5c2Zz5bGe5oCn5a+5
5bqU77yI6Zmk5LqGdG9wb2xvZ3lfc2libGluZ19jcHVtYXNrKCnvvIzlroPlkox0aHJlYWRfc2li
bGluZ3MNCj4gK+WvueW6lO+8ieOAgg0KPiArDQo+ICvkuLrkuoblnKjmiYDmnInkvZPns7vnu5Pm
noTkuIrkv53mjIHkuIDoh7TvvIxpbmNsdWRlL2xpbnV4L3RvcG9sb2d5Lmjmj5DkvpvkuobkuIro
v7DmiYDmnInlro/nmoTpu5jorqTlrprkuYnvvIzku6XpmLINCj4gK+Wug+S7rOacquWcqGluY2x1
ZGUvYXNtLVhYWC90b3BvbG9neS5o5Lit5a6a5LmJOg0KPiArDQo+ICsxKSB0b3BvbG9neV9waHlz
aWNhbF9wYWNrYWdlX2lkOiAtMQ0KPiArMikgdG9wb2xvZ3lfZGllX2lkOiAtMQ0KPiArMykgdG9w
b2xvZ3lfY2x1c3Rlcl9pZDogLTENCj4gKzQpIHRvcG9sb2d5X2NvcmVfaWQ6IDANCj4gKzUpIHRv
cG9sb2d5X2Jvb2tfaWQ6IC0xDQo+ICs2KSB0b3BvbG9neV9kcmF3ZXJfaWQ6IC0xDQo+ICs3KSB0
b3BvbG9neV9zaWJsaW5nX2NwdW1hc2s6IOS7heWFpeWPgkNQVQ0KPiArOCkgdG9wb2xvZ3lfY29y
ZV9jcHVtYXNrOiDku4XlhaXlj4JDUFUNCj4gKzkpIHRvcG9sb2d5X2NsdXN0ZXJfY3B1bWFzazog
5LuF5YWl5Y+CQ1BVDQo+ICsxMCkgdG9wb2xvZ3lfZGllX2NwdW1hc2s6IOS7heWFpeWPgkNQVQ0K
PiArMTEpIHRvcG9sb2d5X2Jvb2tfY3B1bWFzazogIOS7heWFpeWPgkNQVQ0KPiArMTIpIHRvcG9s
b2d5X2RyYXdlcl9jcHVtYXNrOiDku4XlhaXlj4JDUFUNCj4gKw0KPiAr5q2k5aSW77yMQ1BV5ouT
5omR5L+h5oGv55SxL3N5cy9kZXZpY2VzL3N5c3RlbS9jcHXmj5DkvpvvvIzljIXlkKvkuIvov7Dm
lofku7bjgILovpPlh7rlr7nlupTnmoTlhoXpg6jmlbDmja7mupDmlL7lnKgNCj4gK+aWueaLrOWP
t++8iCJbXSLvvInkuK3jgIINCj4gKw0KPiArICAgID09PT09PT09PT09ID09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAr
ICAgIGtlcm5lbF9tYXg6IOWGheaguOmFjee9ruWFgeiuuOeahOacgOWkp0NQVeS4i+agh+WAvOOA
gltOUl9DUFVTLTFdDQo+ICsNCj4gKyAgICBvZmZsaW5lOiAgICDnlLHkuo7ng63mj5Lmi5Tnp7vp
maTmiJbogIXotoXov4flhoXmoLjlhYHorrjnmoRDUFXkuIrpmZDvvIjkuIrmlofmj4/ov7DnmoRr
ZXJuZWxfbWF477yJDQo+ICsgICAgICAgICAgICAgICAg5a+86Ie05pyq5LiK57q/55qEQ1BV44CC
W35jcHVfb25saW5lX21hc2sgKyBjcHVzID49IE5SX0NQVVNdDQo+ICsNCj4gKyAgICBvbmxpbmU6
ICAgICDlnKjnur/nmoRDUFXvvIzlj6/kvpvosIPluqbkvb/nlKjjgIJbY3B1X29ubGluZV9tYXNr
XQ0KPiArDQo+ICsgICAgcG9zc2libGU6ICAg5bey6KKr5YiG6YWN6LWE5rqQ55qEQ1BV77yM5aaC
5p6c5a6D5LusQ1BV5a6e6ZmF5a2Y5Zyo77yM5Y+v5Lul5LiK57q/44CCDQo+ICsgICAgICAgICAg
ICAgICAgW2NwdV9wb3NzaWJsZV9tYXNrXQ0KPiArDQo+ICsgICAgcHJlc2VudDogICAg6KKr57O7
57uf6K+G5Yir5a6e6ZmF5a2Y5Zyo55qEQ1BV44CCW2NwdV9wcmVzZW50X21hc2tdDQo+ICsgICAg
PT09PT09PT09PT0gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09DQo+ICsNCj4gK+S4iui/sOi+k+WHuueahOagvOW8j+WSjGNw
dWxpc3RfcGFyc2UoKeWFvOWuuVvlj4Lop4EgPGxpbnV4L2NwdW1hc2suaD5d44CC5LiL6Z2i57uZ
5Lqb5L6L5a2Q44CCDQo+ICsNCj4gK+WcqOacrOS+i+S4re+8jOezu+e7n+S4reaciTY05LiqQ1BV
77yM5L2G5pivQ1BVIDMyLTYz6LaF6L+H5LqGa2VybmVsX21heOWAvO+8jOWboOS4uk5SX0NQVVPp
hY3nva7pobnmmK8zMu+8jA0KPiAr5Y+W5YC86IyD5Zu06KKr6ZmQ5Yi25Li6MC4uMzHjgILmraTl
pJbms6jmhI9DUFUy5ZKMNC0zMeacquS4iue6v++8jOS9huaYr+WPr+S7peS4iue6v++8jOWboOS4
uuWug+S7rOWQjOaXtuWtmOWcqOS6jg0KPiArcHJlc2VudOWSjHBvc3NpYmxlOjoNCj4gKw0KPiAr
ICAgICBrZXJuZWxfbWF4OiAzMQ0KPiArICAgICAgICBvZmZsaW5lOiAyLDQtMzEsMzItNjMNCj4g
KyAgICAgICAgIG9ubGluZTogMC0xLDMNCj4gKyAgICAgICBwb3NzaWJsZTogMC0zMQ0KPiArICAg
ICAgICBwcmVzZW50OiAwLTMxDQo+ICsNCj4gK+WcqOacrOS+i+S4re+8jE5SX0NQVVPphY3nva7p
obnmmK8xMjjvvIzkvYblhoXmoLjlkK/liqjml7borr7nva5wb3NzaWJsZV9jcHVzPTE0NOOAguez
u+e7n+S4reaciTTkuKpDUFXvvIwNCj4gK0NQVTLooqvmiYvliqjorr7nva7kuIvnur/vvIjkuZ/m
mK/llK/kuIDkuIDkuKrlj6/ku6XkuIrnur/nmoRDUFXvvIk6Og0KPiArDQo+ICsgICAgIGtlcm5l
bF9tYXg6IDEyNw0KPiArICAgICAgICBvZmZsaW5lOiAyLDQtMTI3LDEyOC0xNDMNCj4gKyAgICAg
ICAgIG9ubGluZTogMC0xLDMNCj4gKyAgICAgICBwb3NzaWJsZTogMC0xMjcNCj4gKyAgICAgICAg
cHJlc2VudDogMC0zDQo+ICsNCj4gK+mYheivu0RvY3VtZW50YXRpb24vY29yZS1hcGkvY3B1X2hv
dHBsdWcucnN05Y+v5LqG6Kej5byA5py65Y+C5pWwcG9zc2libGVfY3B1cz1OVU3vvIzlkIzml7bo
v5gNCj4gK+WPr+S7peS6huino+WQhOenjWNwdW1hc2vnmoTkv6Hmga/jgIINCj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJz
dCBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJz
dA0KPiBpbmRleCA4M2RiODQyODI1NjIuLjU0OGU1N2Y0YjNmMSAxMDA2NDQNCj4gLS0tIGEvRG9j
dW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vYWRtaW4tZ3VpZGUvaW5kZXgucnN0DQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2FkbWluLWd1aWRlL2luZGV4LnJz
dA0KPiBAQCAtNjUsNiArNjUsNyBAQCBUb2RvbGlzdDoNCj4NCj4gICAgIGNsZWFyaW5nLXdhcm4t
b25jZQ0KPiAgICAgY3B1LWxvYWQNCj4gKyAgIGNwdXRvcG9sb2d5DQo+ICAgICBsb2NrdXAtd2F0
Y2hkb2dzDQo+ICAgICB1bmljb2RlDQo+ICAgICBzeXNycQ0KPiBAQCAtODQsNyArODUsNiBAQCBU
b2RvbGlzdDoNCj4gICAgIGNncm91cC12MS9pbmRleA0KPiAgICAgY2dyb3VwLXYyDQo+ICAgICBj
aWZzL2luZGV4DQo+IC0gICBjcHV0b3BvbG9neQ0KPiAgICAgZGVsbF9yYnUNCj4gICAgIGRldmlj
ZS1tYXBwZXIvaW5kZXgNCj4gICAgIGVkaWQNCj4gLS0NCj4gMi4xNy4xDQo+DQo=

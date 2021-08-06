Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D83C4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:29:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2CB361186
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:29:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235548AbhHFC3a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235436AbhHFC33 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 22:29:29 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4B43C061798
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 19:29:13 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y7so9805494ljp.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 19:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wV1R0Zqu02lXg+5/LsK9dfwK+lnNllKeL5xWssAsSnw=;
        b=I62CfjWEiDRSoLrNGTj/A3FwjTs0wP87ZMUU/riZGIlraQP5vhLoLrIlPI3qRUEo3y
         OV+JoJSrSxQ/M2443Ucz6ftiFQlqWzFRqME8R4mP0QWGLxHuwDGD80A0jkT5QeTph1HD
         Zg2BlCskyJGkjGftXw1knyrc9LKKq0+a4DXOUJTKiWpuXd0HQ/ZavyfpCc17Yvt/2MpN
         iqxEJ4it/VlMLNkS4wIePpbBXT8lAjdpVM0T+74k6floBC/fDwOSlIr7MK5QHDdTHQdl
         gTtrJSOYvvMQkZxqnw6cD92OdK1pdpOx8vbsra/d8dwT3Ytj9nBlfkbR5TyoGxnfH5mQ
         aXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wV1R0Zqu02lXg+5/LsK9dfwK+lnNllKeL5xWssAsSnw=;
        b=dxSdycMM9i/6sHTPDM1qT+tee++NAZkDt1HbQFRAuP1SWvzEQVrGw4kLCHiSXdDaws
         ++0OQvXrcSDjlaoL8p4Dh98YN8zpx5r1OD9TVGRK4ylVJElUuma0exkfgOJ42+B0Avei
         00sa8tbVO07lf3g6CLQJPsO2CI4SZjxUjESG1EhNx6MXXgEbTzZwRZPxC7LyrlI8su6g
         P59u22EbfBYPTH9+ymDlpq9Vh4S5hM6Ng2Ob5U77eBBzsgvAfzIKiAGd0OHCOR6rOxO7
         WfUSkDuzi23eG5QqLlSUKkMbgqVBqTnk96BlcMPnDezOvAQFBd+kPqy3OR+NwwxMSLvs
         4FRA==
X-Gm-Message-State: AOAM533Nfs6+h95cHqUTh+NLjKtyCypb4ZESpcAhGjl1fPy/w27azpwD
        HPBWKYUnRkgS6shHPAdvcUuRXC5ve1EisXp34lg=
X-Google-Smtp-Source: ABdhPJxsniXDkmUIXshIY05GjPtNT5I7f83bcGyO6jYB6wACRb2kAiC5VXlFu1NQ89zyDEHWfJM/+V3Octr0/H47tTI=
X-Received: by 2002:a2e:a90b:: with SMTP id j11mr4996819ljq.475.1628216952142;
 Thu, 05 Aug 2021 19:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <b25147d5c53daf4d4faaa0a33c068dbd6013459a.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <b25147d5c53daf4d4faaa0a33c068dbd6013459a.1627820210.git.siyanteng@loongson.cn>
From:   Puyu Wang <realpuyuwang@gmail.com>
Date:   Fri, 6 Aug 2021 02:29:00 +0000
Message-ID: <CADQR0QgROPTwPMsGcYv9S3hCPD5V7Ym-jZE_SW7gcVSn8bbNjg@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] docs/zh_CN: add infiniband user_verbs translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, chenweiguang82@126.com,
        Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBdWcgMSwgMjAyMSBhdCAxMjoyNSBQTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9v
bmdzb24uY24+IHdyb3RlOg0KPg0KPiBUcmFuc2xhdGUgRG9jdW1lbnRhdGlvbi9pbmZpbmliYW5k
L3VzZXJfdmVyYnMucnN0IGludG8gQ2hpbmVzZS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVu
ZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KUmV2aWV3ZWQtYnk6IFB1eXUgV2FuZyA8cmVh
bHB1eXV3YW5nQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAuLi4vdHJhbnNsYXRpb25zL3poX0NOL2lu
ZmluaWJhbmQvaW5kZXgucnN0ICAgfCAgMyArLQ0KPiAgLi4uL3poX0NOL2luZmluaWJhbmQvdXNl
cl92ZXJicy5yc3QgICAgICAgICAgIHwgNzIgKysrKysrKysrKysrKysrKysrKw0KPiAgMiBmaWxl
cyBjaGFuZ2VkLCA3MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJhbmQvdXNl
cl92ZXJicy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2luZmluaWJhbmQvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vaW5maW5pYmFuZC9pbmRleC5yc3QNCj4gaW5kZXggNTU2NDUxNzFhNjc1Li41NjM0Y2M0
ODM3OWYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2lu
ZmluaWJhbmQvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2luZmluaWJhbmQvaW5kZXgucnN0DQo+IEBAIC0yOCwxMCArMjgsOSBAQCBpbmZpbmliYW5k
DQo+ICAgICBzeXNmcw0KPiAgICAgdGFnX21hdGNoaW5nDQo+ICAgICB1c2VyX21hZA0KPiArICAg
dXNlcl92ZXJicw0KPg0KPiAtVE9ET0xJU1Q6DQo+DQo+IC0gICB1c2VyX3ZlcmJzDQo+DQo+ICAu
LiBvbmx5OjogIHN1YnByb2plY3QgYW5kIGh0bWwNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJhbmQvdXNlcl92ZXJicy5yc3QgYi9Eb2N1
bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL3VzZXJfdmVyYnMucnN0DQo+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uYmE1ZGI4NWFlNzIy
DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vaW5maW5pYmFuZC91c2VyX3ZlcmJzLnJzdA0KPiBAQCAtMCwwICsxLDcyIEBADQo+ICsuLiBp
bmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBEb2N1
bWVudGF0aW9uL2luZmluaWJhbmQvdXNlcl92ZXJicy5yc3QNCj4gKw0KPiArOue/u+ivkToNCj4g
Kw0KPiArIOWPuOW7tuiFviBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ICsN
Cj4gKzrmoKHor5E6DQo+ICsNCj4gKyDnjovmma7lrocgUHV5dSBXYW5nIDxyZWFscHV5dXdhbmdA
Z21haWwuY29tPg0KPiArIOaXtuWljuS6riBBbGV4IFNoaSA8YWxleHNAa2VybmVsLm9yZz4NCj4g
Kw0KPiArLi4gX2NuX2luZmluaWJhbmRfdXNlcl92ZXJiczoNCj4gKw0KPiArPT09PT09PT09PT09
PT09PT0NCj4gK+eUqOaIt+epuumXtHZlcmJz6K6/6ZeuDQo+ICs9PT09PT09PT09PT09PT09PQ0K
PiArDQo+ICsgIGliX3V2ZXJic+aooeWdl++8jOmAmui/h+WQr+eUqENPTkZJR19JTkZJTklCQU5E
X1VTRVJfVkVSQlPmnoTlu7rvvIzkvb/nlKjmiLfnqbrpl7QNCj4gKyAg6YCa6L+H4oCcdmVyYnPi
gJ3nm7TmjqXorr/pl65JQuehrOS7tu+8jOWmgkluZmluaUJhbmTmnrbmnoTop4TojIPnrKwxMeer
oOaJgOi/sOOAgg0KPiArDQo+ICsgIOimgeS9v+eUqHZlcmJz77yM6ZyA6KaBbGliaWJ2ZXJic+W6
k++8jOWPr+S7jmh0dHBzOi8vZ2l0aHViLmNvbS9saW51eC1yZG1hL3JkbWEtY29yZeOAgg0KPiAr
ICBsaWJpYnZlcmJz5YyF5ZCr5LiA5Liq54us56uL5LqO6K6+5aSH55qEQVBJ77yM55So5LqO5L2/
55SoaWJfdXZlcmJz5o6l5Y+j44CCbGliaWJ2ZXJicw0KPiArICDov5jpnIDopoHkuLrkvaDnmoRJ
bmZpbmlCYW5k56Gs5Lu25o+Q5L6b6YCC5b2T55qE54us56uL5LqO6K6+5aSH55qE5YaF5qC45ZKM
55So5oi356m66Ze06amx5Yqo44CC5L6L5aaC77yMDQo+ICsgIOimgeS9v+eUqE1lbGxhbm94IEhD
Qe+8jOS9oOmcgOimgeWuieijhWliX210aGNh5YaF5qC45qih5Z2X5ZKMbGlibXRoY2HnlKjmiLfn
qbrpl7TpqbHliqjjgIINCj4gKw0KPiAr55So5oi3LeWGheaguOmAmuS/oQ0KPiArPT09PT09PT09
PT09PQ0KPiArDQo+ICsgIOeUqOaIt+epuumXtOmAmui/hy9kZXYvaW5maW5pYmFuZC91dmVyYnNO
5a2X56ym6K6+5aSH5LiO5YaF5qC46L+b6KGM5oWi6YCf6Lev5b6E44CB6LWE5rqQ566h55CGDQo+
ICsgIOaTjeS9nOeahOmAmuS/oeOAguW/q+mAn+i3r+W+hOaTjeS9nOmAmuW4uOaYr+mAmui/h+eb
tOaOpeWGmeWFpeehrOS7tuWvhOWtmOWZqG1tYXAoKeWIsOeUqOaIt+epuumXtOadpeWujOaIkA0K
PiArICDnmoTvvIzmsqHmnInns7vnu5/osIPnlKjmiJbkuIrkuIvmlofliIfmjaLliLDlhoXmoLjj
gIINCj4gKw0KPiArICDlkb3ku6TmmK/pgJrov4flnKjov5nkupvorr7lpIfmlofku7bkuIrnmoR3
cml0ZSgpc+WPkemAgee7meWGheaguOeahOOAgkFCSeWcqA0KPiArICBkcml2ZXJzL2luZmluaWJh
bmQvaW5jbHVkZS9pYl91c2VyX3ZlcmJzLmjkuK3lrprkuYnjgILpnIDopoHlhoXmoLjlk43lupTn
moTlkb3ku6TnmoTnu5MNCj4gKyAg5p6E5YyF5ZCr5LiA5LiqNjTkvY3lrZfmrrXvvIznlKjmnaXk
vKDpgJLkuIDkuKrmjIflkJHovpPlh7rnvJPlhrLljLrnmoTmjIfpkojjgILnirbmgIHkvZzkuLp3
cml0ZSgp57O757uf6LCDDQo+ICsgIOeUqOeahOi/lOWbnuWAvOiiq+i/lOWbnuWIsOeUqOaIt+ep
uumXtOOAgg0KPiArDQo+ICvotYTmupDnrqHnkIYNCj4gKz09PT09PT09DQo+ICsNCj4gKyAg55Sx
5LqO5omA5pyJSULotYTmupDnmoTliJvlu7rlkozplIDmr4Hpg73mmK/pgJrov4fmlofku7bmj4/o
v7DnrKbkvKDpgJLnmoTlkb3ku6TlrozmiJDnmoTvvIzmiYDku6XlhoXmoLjlj6/ku6Xot58NCj4g
KyAg6Liq5ZOq5Lqb6LWE5rqQ6KKr6ZmE5Yqg5Yiw5LiA5Liq57uZ5a6a55qE55So5oi356m66Ze0
5LiK5LiL5paH44CCaWJfdXZlcmJz5qih5Z2X57u05oqk552AaWRy6KGo77yM55So5p2l5ZyoDQpJ
IHRoaW5rIGl0IHNob3VsZCBiZSAn6Lef6Liq6YKj5Lqb6KKr6ZmE5Yqg5Yiw57uZ5a6a55So5oi3
56m66Ze05LiK5LiL5paH55qE6LWE5rqQJywgaW5zdGVhZCBvZg0K4oCY6Lef6Liq5ZOq5Lqb6LWE
5rqQ6KKr6ZmE5Yqg5Yiw5LiA5Liq57uZ5a6a55qE55So5oi356m66Ze05LiK5LiL5paH4oCZLg0K
PiArICDlhoXmoLjmjIfpkojlkozkuI3pgI/mmI7nmoTnlKjmiLfnqbrpl7Tlj6Xmn4TkuYvpl7To
v5vooYzovazmjaLvvIzov5nmoLflhoXmoLjmjIfpkojlsLHkuI3kvJrmmrTpnLLnu5nnlKjmiLfn
qbrpl7TvvIwNCj4gKyAg6ICM55So5oi356m66Ze05Lmf5peg5rOV5qy66aqX5YaF5qC45Y676Lef
6Liq5LiA5Liq5YGH55qE5oyH6ZKI44CCDQo+ICsNCj4gKyAg6L+Z5Lmf5YWB6K645YaF5qC45Zyo
5LiA5Liq6L+b56iL6YCA5Ye65pe26L+b6KGM5riF55CG77yM5bm26Ziy5q2i5LiA5Liq6L+b56iL
6Kem5Y+K5Y+m5LiA5Liq6L+b56iL55qE6LWE5rqQ44CCDQo+ICsNCj4gK+WGheWtmOW8leiEmg0K
PiArPT09PT09PT0NCj4gKw0KPiArICDnm7TmjqXnmoTnlKjmiLfnqbrpl7RJL0/opoHmsYLkuI7k
vZzkuLrmvZzlnKhJL0/nm67moIfnmoTlhoXlrZjljLrln5/kv53mjIHlnKjlkIzkuIDniannkIbl
nLDlnYDkuIrjgIJpYl91dmVyYnMNCj4gKyAg5qih5Z2X6YCa6L+HZ2V0X3VzZXJfcGFnZXMoKeWS
jHB1dF9wYWdlKCnosIPnlKjmnaXnrqHnkIblhoXlrZjljLrln5/nmoTlm7rlrprlkozop6PpmaTl
m7rlrprjgILlroPov5jmoLgNCj4gKyAg566X6L+b56iL55qEcGlubmVkX3Zt5Lit6KKr5Zu65a6a
55qE5YaF5a2Y6YeP77yM5bm25qOA5p+l6Z2e54m55p2D6L+b56iL5piv5ZCm6LaF6L+H5YW2UkxJ
TUlUX01FTUxPQ0vpmZDliLbjgIINCj4gKw0KPiArICDooqvlpJrmrKHlm7rlrprnmoTpobXpnaLl
nKjmr4/mrKHooqvlm7rlrprml7bpg73kvJrooqvorqHmlbDvvIzmiYDku6VwaW5uZWRfdm3nmoTl
gLzlj6/og73kvJrpq5jkvLDkuIDkuKrov5vnqIvmiYANCj4gKyAg5Zu65a6a55qE6aG16Z2i5pWw
6YeP44CCDQo+ICsNCj4gKy9kZXbmlofku7YNCj4gKz09PT09PT09DQo+ICsNCj4gKyAg6KaB5oOz
55SodWRlduiHquWKqOWIm+W7uumAguW9k+eahOWtl+espuiuvuWkh+aWh+S7tu+8jOWPr+S7pemH
h+eUqOWmguS4i+inhOWImTo6DQo+ICsNCj4gKyAgICBLRVJORUw9PSJ1dmVyYnMqIiwgTkFNRT0i
aW5maW5pYmFuZC8layINCj4gKw0KPiArICDlj6/ku6Xkvb/nlKjjgIIg6L+Z5bCG5Yib5bu66K6+
5aSH6IqC54K577yM5ZCN5Li6OjoNCj4gKw0KPiArICAgIC9kZXYvaW5maW5pYmFuZC91dmVyYnMw
DQo+ICsNCj4gKyAg562J562J44CC55Sx5LqOSW5maW5pQmFuZOeahOeUqOaIt+epuumXtHZlcmJz
5a+55LqO6Z2e54m55p2D6L+b56iL5p2l6K+05bqU6K+l5piv5a6J5YWo55qE77yM5Zug5q2k5Zyo
dWRlduinhA0KPiArICDliJnkuK3liqDlhaXpgILlvZPnmoRNT0RF5oiWR1JPVVDlj6/og73mmK/m
nInnlKjnmoTjgIINCj4gLS0NCj4gMi4yNy4wDQo+DQo=

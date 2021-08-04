Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0D5AC4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7901761029
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhHDCax (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:30:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhHDCaw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:30:52 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E332C06175F
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:30:40 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id d22so727851ioy.11
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9TeGYeesq7qNHrRK+XEkT3/4GyGTR7P83qZwqkAWYIw=;
        b=AlBTcAMadL7QDYXr9YtNCJqC+nKHgHQyB9CDh/eI5ZQAnMRou+I1zcjs3HHd/F0DhO
         aR0FhjQUZyxFIkih6jMSPwRIePtSmtaCFUn92IzMSS+35cDJTtyXsXLMchk69uAOtlpL
         Gshop+SfBMef2qicKZV+fPSwBYwxKkgnX6UoHZe8z5JrwQ+NHvc1pvmBj2Ohx28h3UqT
         Lbv2lSEFoXolqdLvg+GX3sfImHWe2c/mprjcPW+ip3IqUQbR7wLfohHh2FtjzwlAl8GF
         QVWW+GJGTCrRYuHRry8eKRUPXDeUivvdV3lxL7YSrqYNmnBRzy84qPUyXQX5at4t9y4O
         Y3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9TeGYeesq7qNHrRK+XEkT3/4GyGTR7P83qZwqkAWYIw=;
        b=imx/CLLK8SJf88IkE2/1ubUbGw1y7nEhMCa9CB8qwq1Ov+VSB+flw61JAf618Zk9SO
         2l2pSeyJBNcyxQxv1BB/mYMF/rMiRUprrkI6rXbajs8ZCGS+5mfSfp3JZrfgDh8bRf42
         lt4D7GnzVCkjfRHmSQgiS2jfDBDegeb3jDWXL/45HhBaZRgiPLgvN6NwolgMLHPtSEVt
         ZfxlzxLU2E+yY7i+TsbQ3SKY5B7Qe4w6A9aLhMOWM0uKybmqUUhq8/Nt+4t/+TorDeef
         udT0zFTkWYVEkbxRyEftC8zelT0l1DJFoW8pkqzaCe5XJ1xa3XoXV7MIc73Ll+cyzwUA
         CQVQ==
X-Gm-Message-State: AOAM531JuGc9o/Mq6cVCzW67RRggpo+tXcDFJwTe+p9eOC+67q0Mrpfe
        PRRvaB+G583i/ASZQK3XX2QPE13M9l9dKJZ0Q6o=
X-Google-Smtp-Source: ABdhPJzh64e0TnDDFVgiEpOW6ksqLLJioMPUgUv0EF3G7WW7sLATmkYmAIQM2bs6PYAXh6U98Y36DmY8Vdj/Mn1MQOc=
X-Received: by 2002:a5d:9d42:: with SMTP id k2mr459174iok.124.1628044239780;
 Tue, 03 Aug 2021 19:30:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <04210728e9adb679e94fa974f219d2c92db22233.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <04210728e9adb679e94fa974f219d2c92db22233.1627820210.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:30:03 +0800
Message-ID: <CAJy-Am=0Xh6wB9ZoSgEgepC8T_AfAM4q45_KEGa+fJq1DpCTyw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] docs/zh_CN: add infiniband tag_matching translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenweiguang82@126.com, yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

T24gU3VuLCBBdWcgMSwgMjAyMSBhdCA4OjI1IFBNIFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29u
Z3Nvbi5jbj4gd3JvdGU6DQo+DQo+IFRyYW5zbGF0ZSBEb2N1bWVudGF0aW9uL2luZmluaWJhbmQv
dGFnX21hdGNoaW5nLnJzdCBpbnRvIENoaW5lc2UuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFlhbnRl
bmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4NCg0KUmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxh
bGV4c0BrZXJuZWwub3JnPg0KDQo+IC0tLQ0KPiAgLi4uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZp
bmliYW5kL2luZGV4LnJzdCAgIHwgIDIgKy0NCj4gIC4uLi96aF9DTi9pbmZpbmliYW5kL3RhZ19t
YXRjaGluZy5yc3QgICAgICAgICB8IDYzICsrKysrKysrKysrKysrKysrKysNCj4gIDIgZmlsZXMg
Y2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJhbmQvdGFnX21h
dGNoaW5nLnJzdA0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMv
emhfQ04vaW5maW5pYmFuZC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96
aF9DTi9pbmZpbmliYW5kL2luZGV4LnJzdA0KPiBpbmRleCAxZDIwOGQ1MGIwYzIuLmMyNzMwODhi
ODY4NiAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5m
aW5pYmFuZC9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhf
Q04vaW5maW5pYmFuZC9pbmRleC5yc3QNCj4gQEAgLTI2LDEwICsyNiwxMCBAQCBpbmZpbmliYW5k
DQo+ICAgICBpcG9pYg0KPiAgICAgb3BhX3ZuaWMNCj4gICAgIHN5c2ZzDQo+ICsgICB0YWdfbWF0
Y2hpbmcNCj4NCj4gIFRPRE9MSVNUOg0KPg0KPiAtICAgdGFnX21hdGNoaW5nDQo+ICAgICB1c2Vy
X21hZA0KPiAgICAgdXNlcl92ZXJicw0KPg0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90
cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC90YWdfbWF0Y2hpbmcucnN0IGIvRG9jdW1lbnRh
dGlvbi90cmFuc2xhdGlvbnMvemhfQ04vaW5maW5pYmFuZC90YWdfbWF0Y2hpbmcucnN0DQo+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAwMC4uMTliOTk1ODdiODYyDQo+
IC0tLSAvZGV2L251bGwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04v
aW5maW5pYmFuZC90YWdfbWF0Y2hpbmcucnN0DQo+IEBAIC0wLDAgKzEsNjMgQEANCj4gKy4uIGlu
Y2x1ZGU6OiAuLi9kaXNjbGFpbWVyLXpoX0NOLnJzdA0KPiArDQo+ICs6T3JpZ2luYWw6IERvY3Vt
ZW50YXRpb24vaW5maW5pYmFuZC90YWdfbWF0Y2hpbmcucnN0DQo+ICsNCj4gKzrnv7vor5E6DQo+
ICsNCj4gKyDlj7jlu7bohb4gWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiAr
DQo+ICs65qCh6K+ROg0KPiArDQo+ICsg546L5pmu5a6HIFB1eXUgV2FuZyA8cmVhbHB1eXV3YW5n
QGdtYWlsLmNvbT4NCj4gKyDml7blpY7kuq4gQWxleCBTaGkgPGFsZXhzQGtlcm5lbC5vcmc+DQo+
ICsNCj4gKy4uIF9jbl9pbmZpbmliYW5kX3RhZ19tYXRjaGluZzoNCj4gKw0KPiArPT09PT09PT09
PT09DQo+ICvmoIfnrb7ljLnphY3pgLvovpENCj4gKz09PT09PT09PT09PQ0KPiArDQo+ICtNUEnm
oIflh4blrprkuYnkuobkuIDlpZfop4TliJnvvIznp7DkuLrmoIfnrb7ljLnphY3vvIznlKjkuo7l
sIbmupDlj5HpgIHmk43kvZzkuI7nm67nmoTmjqXmlLbljLnphY3jgILku6XkuIvlj4LmlbDlv4UN
Cj4gK+mhu+S4juS7peS4i+a6kOWSjOebrueahOWPguaVsOebuOWMuemFjToNCj4gKw0KPiArKiAg
ICAgIOayn+mAmuiAhQ0KPiArKiAgICAgIOeUqOaIt+agh+etvi0t6YCa6YWN56ymKHdpbGQgY2Fy
ZCnlj6/nlLHmjqXmlLbmlrnmjIflrpoNCj4gKyogICAgICDmnaXmupDnrYnnuqctLemAmumFjees
puWPr+eUseaOpeaUtuaWueaMh+Wumg0KPiArKiAgICAgIOebrueahOWcsOetiee6pyDigJMgd2ls
ZA0KPiArDQo+ICvmjpLluo/op4TliJnopoHmsYLvvIzlvZPkuIDlr7nku6XkuIrnmoTlj5HpgIHl
kozmjqXmlLbmtojmga/kv6HlsIHlj6/og73ljLnphY3ml7bvvIzljIXmi6zmnIDml6nlj5HluIMt
5Y+R6YCB5ZKM5pyA5pepDQo+ICvlj5HluIMt5o6l5pS255qE5LiA5a+55piv5b+F6aG755So5p2l
5ruh6Laz5Yy56YWN5pON5L2c55qE5LiA5a+544CC54S26ICM77yM6L+Z5bm25LiN5oSP5ZGz552A
5qCH562+5piv5oyJ54Wn5a6D5Lus6KKrDQo+ICvliJvlu7rnmoTpobrluo/mtojogJfnmoTvvIzk
vovlpoLvvIzlpoLmnpzml6nmnJ/nmoTmoIfnrb7kuI3og73nlKjmnaXmu6HotrPljLnphY3op4Tl
iJnvvIzpgqPkuYjlkI7mnaXnlJ/miJDnmoTmoIfnrb4NCj4gK+WPr+iDveiiq+a2iOiAl+OAgg0K
PiArDQo+ICvlvZPmtojmga/ku47lj5HpgIHmlrnlj5HpgIHliLDmjqXmlLbmlrnml7bvvIzpgJrk
v6HlupPlj6/og73or5Xlm77lnKjnm7jlupTnmoTljLnphY3mjqXmlLbooqvlj5HluIPkuYvlkI7m
iJbkuYvliY3lpIQNCj4gK+eQhuivpeaTjeS9nOOAguWmguaenOWMuemFjeeahOaOpeaUtuiiq+WP
keW4g++8jOi/meWwseaYr+S4gOS4qumihOacn+eahOa2iOaBr++8jOWQpuWImeWwseiiq+ensOS4
uuS4gOS4quaEj+WklueahOa2iA0KPiAr5oGv44CC5a6e546w5pe257uP5bi45Li66L+Z5Lik56eN
5LiN5ZCM55qE5Yy56YWN5a6e5L6L5L2/55So5LiN5ZCM55qE5Yy56YWN5pa55qGI44CCDQo+ICsN
Cj4gK+S4uuS6huWHj+WwkU1QSeW6k+eahOWGheWtmOWNoOeUqO+8jE1QSeWunueOsOmAmuW4uOS9
v+eUqOS4pOenjeS4jeWQjOeahOWNj+iuruadpeWunueOsOi/meS4gOebrueahDoNCj4gKw0KPiAr
MS4gICAgIEVhZ2Vy5Y2P6K6uLS3lvZPlj5HpgIHmlrnlpITnkIblrozlj5HpgIHml7bvvIzlrozm
lbTnmoTkv6Hmga/lsLHkvJrooqvlj5HpgIHjgILlnKhzZW5kX2Nx5Lit5Lya5pS25YiwDQo+ICvk
uIDkuKrlrozmiJDlj5HpgIHnmoTpgJrnn6XvvIzpgJrnn6XnvJPlhrLljLrlj6/ku6Xooqvph43m
lrDkvb/nlKjjgIINCj4gKw0KPiArMi4gICAgIFJlbmRlenZvdXPljY/orq4tLeWPkemAgeaWueWc
qOesrOS4gOasoemAmuefpeaOpeaUtuaWueaXtuWPkemAgeagh+etvuWMuemFjeWktO+8jOS5n+iu
uOi/mOacieS4gOmDqOWIhg0KPiAr5pWw5o2u44CC5b2T55u45bqU55qE57yT5Yay5Yy66KKr5Y+R
5biD5pe277yM5ZON5bqU6ICF5bCG5L2/55So5aS05Lit55qE5L+h5oGv77yM55u05o6l5ZCR5Yy5
6YWN55qE57yT5Yay5Yy65Y+R6LW3DQo+ICtSRE1B6K+75Y+W5pON5L2c44CC5Li65LqG5L2/57yT
5Yay5Yy65b6X5Yiw6YeN55So77yM6ZyA6KaB5pS25Yiw5LiA5LiqZmlu5raI5oGv44CCDQo+ICsN
Cj4gK+agh+etvuWMuemFjeeahOWunueOsA0KPiArPT09PT09PT09PT09PT0NCj4gKw0KPiAr5L2/
55So55qE5Yy56YWN5a+56LGh5pyJ5Lik56eN57G75Z6L77yM5Y2z5Y+R5biD55qE5o6l5pS25YiX
6KGo5ZKM5oSP5aSW5raI5oGv5YiX6KGo44CC5bqU55So56iL5bqP6YCa6L+H6LCD55So5Y+R5biD
DQo+ICvnmoTmjqXmlLbliJfooajkuK3nmoRNUEnmjqXmlLbkvovnqIvlj5HluIPmjqXmlLbnvJPl
hrLljLrvvIzlubbkvb/nlKhNUEnlj5HpgIHkvovnqIvlj5HluIPlj5HpgIHmtojmga/jgILlj5Hl
uIPnmoQNCj4gK+aOpeaUtuWIl+ihqOeahOWktOmDqOWPr+S7peeUseehrOS7tuadpee7tOaKpO+8
jOiAjOi9r+S7tuWImeimgeWvuei/meS4quWIl+ihqOi/m+ihjOi3n+i4quOAgg0KPiArDQo+ICvl
vZPlj5HpgIHlvIDlp4vlubbliLDovr7mjqXmlLbnq6/ml7bvvIzlpoLmnpzmsqHmnInkuLrov5nk
uKrliLDovr7nmoTmtojmga/pooTlhYjlj5HluIPmjqXmlLbvvIzlroPlsIbooqvkvKDpgJLnu5no
va8NCj4gK+S7tuW5tuiiq+aUvuWcqOaEj+Wklu+8iHVuZXhwZWN077yJ5raI5oGv5YiX6KGo5Lit
44CC5ZCm5YiZ77yM5bCG5a+56K+l5Yy56YWN6L+b6KGM5aSE55CG77yM5YyF5ous5Lqk5Lya5aSE
55CG77yMDQo+ICvlpoLmnpzlkIjpgILnmoTor53vvIzlsIbmlbDmja7kvKDpgIHliLDmjIflrprn
moTmjqXmlLbnvJPlhrLljLrjgILov5nlhYHorrjmjqXmlLbmlrlNUEnmoIfnrb7ljLnphY3kuI7o
rqHnrpfph43lj6DjgIINCj4gKw0KPiAr5b2T5LiA5Liq5o6l5pS25L+h5oGv6KKr5Y+R5biD5pe2
77yM6YCa5L+h5bqT5bCG6aaW5YWI5qOA5p+l6L2v5Lu255qE5oSP5aSW5L+h5oGv5YiX6KGo77yM
5Lul5a+75om+5LiA5Liq5Yy56YWN55qE5o6lDQo+ICvmlLbkv6Hmga/jgILlpoLmnpzmib7liLDk
uIDkuKrljLnphY3nmoTvvIzmlbDmja7lsLHkvJrooqvpgIHliLDnlKjmiLfnvJPlhrLljLrvvIzk
vb/nlKjkuIDkuKrova/ku7bmjqfliLbnmoTljY/orq7jgIINCj4gK1VDWOeahOWunueOsOagueaN
ruaVsOaNruWkp+Wwj++8jOS9v+eUqOaApeWIh+aIluS6pOS8muWNj+iuruOAguWmguaenOayoeac
ieaJvuWIsOWMuemFje+8jOaVtOS4qumihOe9rueahOaOpeaUtuWIlw0KPiAr6KGo55Sx56Gs5Lu2
57u05oqk77yM5bm25LiU5pyJ56m66Ze05Zyo6L+Z5Liq5YiX6KGo5Lit5aKe5Yqg5LiA5Liq6aKE
572u55qE5o6l5pS277yM6L+Z5Liq5o6l5pS26KKr5Lyg6YCS57uZ56Gs5Lu244CCDQo+ICvova/k
u7bopoHlr7nov5nkuKrliJfooajov5vooYzot5/ouKrvvIzku6XluK7liqnlpITnkIZNUEnlj5bm
tojmk43kvZzjgILmraTlpJbvvIznlLHkuo7noazku7blkozova/ku7blnKjmoIfnrb7ljLkNCj4g
K+mFjeaTjeS9nOaWuemdoumihOiuoeS4jeS8mue0p+WvhuWQjOatpe+8jOi/meS4quW9seWtkOWI
l+ihqOiiq+eUqOadpeajgOa1i+mihOWFiOWPkeW4g+eahOaOpeaUtuiiq+S8oOmAkuWIsOehrOS7
tueahA0KPiAr5oOF5Ya177yM5Zug5Li65Yy56YWN55qE5oSP5aSW5raI5oGv5q2j5Zyo5LuO56Gs
5Lu25Lyg6YCS5Yiw6L2v5Lu244CCDQo+IC0tDQo+IDIuMjcuMA0KPg0K

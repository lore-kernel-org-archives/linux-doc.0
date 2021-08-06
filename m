Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1508BC4338F
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:18:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8BA4611C3
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235971AbhHFCSZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:18:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234112AbhHFCSY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 22:18:24 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F24BC061798
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 19:18:09 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id n17so12257432lft.13
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 19:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WknrZBJvLbSGyIjUFnbAsAXovVefpTrg+EvGC6TdpJA=;
        b=XLxproxLCx87QpAHPoJuONb7HVXHophs36SYOgWoVvxoj7W7SUgyU499CJFl/FxbsY
         bocwoJrjfOTRSHHmJhbim6vP7E/pJZCkzKYnu7QqcY42OyMg12ckDHd5+YWd64Mwp827
         bNTcrM/5816OuMQWFrkqv0P09E03TJnYxGQQQ3fJHxZyAEHuab1439t7sV9Nf9GREplH
         yssIxQk9toPQnDihLbJPTxgVyndk0rnBWX7hXzuJgeA5/5ogRYZmXcPciDwLsziA1cXW
         rN6j86issb0zVkFJ4aE0qcdtworHMsdCdwxmTY6prBWZYidH1bEhUbZKOEYcc4PhxXIQ
         RNiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WknrZBJvLbSGyIjUFnbAsAXovVefpTrg+EvGC6TdpJA=;
        b=Gsoc1s6rfQr7RGiiq4NjHfUoYpGO9JyvbKsMnFL32xFuB6Zr6dqa5jpDW9gZhAV/My
         7izCJgBkxSESp/R7U4eZBwrb51cDcvOcPFc5yKcaQifY4I36k0a22FYnlO6uEhu0qRgQ
         ZsedC5KrA83E8iUMbe2RZT7tFrzF1r5X1VGgyuy/1Jja2HNvcqvqr5GCX28sU4/c8DrD
         35Bs2i4HwJptGtp1XQMtMQ7jFQLuBir+f2LecLhgsJvY18Fic1afPFu6kzLfsrZijm9c
         apPaQcNKGqzKLK5uLlGNan3j+7em6rr1qNb8PzAyeh3zF05ML4iPltEbND/PheLMiuvk
         CXUw==
X-Gm-Message-State: AOAM5302nOK0YtPNN7X1eGKURoOCrtEDzQHsHd0SdZ3EbVXzTT2teZ8/
        SM9HSsknAVOGEt0REfbANOr7kvfg4UYVTwSdZqU=
X-Google-Smtp-Source: ABdhPJy5utrp5pXst+xCd4ATE8XIqvJCga4ZPH6CGINp1nMSs4Anvi9GnLK7BxPllQgYxMS2reL49VIDuPDNPxAAPpw=
X-Received: by 2002:a19:5f04:: with SMTP id t4mr5773720lfb.297.1628216287896;
 Thu, 05 Aug 2021 19:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <04210728e9adb679e94fa974f219d2c92db22233.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <04210728e9adb679e94fa974f219d2c92db22233.1627820210.git.siyanteng@loongson.cn>
From:   Puyu Wang <realpuyuwang@gmail.com>
Date:   Fri, 6 Aug 2021 02:17:56 +0000
Message-ID: <CADQR0Qj76kvJh1Hr5_-nC_OCt7MCMb8wuSraO=mE-EzqTi5TCg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] docs/zh_CN: add infiniband tag_matching translation
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
L3RhZ19tYXRjaGluZy5yc3QgaW50byBDaGluZXNlLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBZYW50
ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQpSZXZpZXdlZC1ieTogUHV5dSBXYW5nIDxy
ZWFscHV5dXdhbmdAZ21haWwuY29tPg0KPiAtLS0NCj4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04v
aW5maW5pYmFuZC9pbmRleC5yc3QgICB8ICAyICstDQo+ICAuLi4vemhfQ04vaW5maW5pYmFuZC90
YWdfbWF0Y2hpbmcucnN0ICAgICAgICAgfCA2MyArKysrKysrKysrKysrKysrKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDY0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9pbmZpbmliYW5kL3Rh
Z19tYXRjaGluZy5yc3QNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRp
b25zL3poX0NOL2luZmluaWJhbmQvaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlv
bnMvemhfQ04vaW5maW5pYmFuZC9pbmRleC5yc3QNCj4gaW5kZXggMWQyMDhkNTBiMGMyLi5jMjcz
MDg4Yjg2ODYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L2luZmluaWJhbmQvaW5kZXgucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL2luZmluaWJhbmQvaW5kZXgucnN0DQo+IEBAIC0yNiwxMCArMjYsMTAgQEAgaW5maW5p
YmFuZA0KPiAgICAgaXBvaWINCj4gICAgIG9wYV92bmljDQo+ICAgICBzeXNmcw0KPiArICAgdGFn
X21hdGNoaW5nDQo+DQo+ICBUT0RPTElTVDoNCj4NCj4gLSAgIHRhZ19tYXRjaGluZw0KPiAgICAg
dXNlcl9tYWQNCj4gICAgIHVzZXJfdmVyYnMNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJhbmQvdGFnX21hdGNoaW5nLnJzdCBiL0RvY3Vt
ZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL2luZmluaWJhbmQvdGFnX21hdGNoaW5nLnJzdA0K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLjE5Yjk5NTg3Yjg2
Mg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL2luZmluaWJhbmQvdGFnX21hdGNoaW5nLnJzdA0KPiBAQCAtMCwwICsxLDYzIEBADQo+ICsu
LiBpbmNsdWRlOjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gKw0KPiArOk9yaWdpbmFsOiBE
b2N1bWVudGF0aW9uL2luZmluaWJhbmQvdGFnX21hdGNoaW5nLnJzdA0KPiArDQo+ICs657+76K+R
Og0KPiArDQo+ICsg5Y+45bu26IW+IFlhbnRlbmcgU2kgPHNpeWFudGVuZ0Bsb29uZ3Nvbi5jbj4N
Cj4gKw0KPiArOuagoeivkToNCj4gKw0KPiArIOeOi+aZruWuhyBQdXl1IFdhbmcgPHJlYWxwdXl1
d2FuZ0BnbWFpbC5jb20+DQo+ICsg5pe25aWO5LquIEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3Jn
Pg0KPiArDQo+ICsuLiBfY25faW5maW5pYmFuZF90YWdfbWF0Y2hpbmc6DQo+ICsNCj4gKz09PT09
PT09PT09PQ0KPiAr5qCH562+5Yy56YWN6YC76L6RDQo+ICs9PT09PT09PT09PT0NCj4gKw0KPiAr
TVBJ5qCH5YeG5a6a5LmJ5LqG5LiA5aWX6KeE5YiZ77yM56ew5Li65qCH562+5Yy56YWN77yM55So
5LqO5bCG5rqQ5Y+R6YCB5pON5L2c5LiO55uu55qE5o6l5pS25Yy56YWN44CC5Lul5LiL5Y+C5pWw
5b+FDQo+ICvpobvkuI7ku6XkuIvmupDlkoznm67nmoTlj4LmlbDnm7jljLnphY06DQo+ICsNCj4g
KyogICAgICDmsp/pgJrogIUNCj4gKyogICAgICDnlKjmiLfmoIfnrb4tLemAmumFjeespih3aWxk
IGNhcmQp5Y+v55Sx5o6l5pS25pa55oyH5a6aDQo+ICsqICAgICAg5p2l5rqQ562J57qnLS3pgJrp
hY3nrKblj6/nlLHmjqXmlLbmlrnmjIflrpoNCj4gKyogICAgICDnm67nmoTlnLDnrYnnuqcg4oCT
IHdpbGQNCj4gKw0KPiAr5o6S5bqP6KeE5YiZ6KaB5rGC77yM5b2T5LiA5a+55Lul5LiK55qE5Y+R
6YCB5ZKM5o6l5pS25raI5oGv5L+h5bCB5Y+v6IO95Yy56YWN5pe277yM5YyF5ous5pyA5pep5Y+R
5biDLeWPkemAgeWSjOacgOaXqQ0KPiAr5Y+R5biDLeaOpeaUtueahOS4gOWvueaYr+W/hemhu+eU
qOadpea7oei2s+WMuemFjeaTjeS9nOeahOS4gOWvueOAgueEtuiAjO+8jOi/meW5tuS4jeaEj+WR
s+edgOagh+etvuaYr+aMieeFp+Wug+S7rOiiqw0KPiAr5Yib5bu655qE6aG65bqP5raI6ICX55qE
77yM5L6L5aaC77yM5aaC5p6c5pep5pyf55qE5qCH562+5LiN6IO955So5p2l5ruh6Laz5Yy56YWN
6KeE5YiZ77yM6YKj5LmI5ZCO5p2l55Sf5oiQ55qE5qCH562+DQo+ICvlj6/og73ooqvmtojogJfj
gIINCj4gKw0KPiAr5b2T5raI5oGv5LuO5Y+R6YCB5pa55Y+R6YCB5Yiw5o6l5pS25pa55pe277yM
6YCa5L+h5bqT5Y+v6IO96K+V5Zu+5Zyo55u45bqU55qE5Yy56YWN5o6l5pS26KKr5Y+R5biD5LmL
5ZCO5oiW5LmL5YmN5aSEDQo+ICvnkIbor6Xmk43kvZzjgILlpoLmnpzljLnphY3nmoTmjqXmlLbo
oqvlj5HluIPvvIzov5nlsLHmmK/kuIDkuKrpooTmnJ/nmoTmtojmga/vvIzlkKbliJnlsLHooqvn
p7DkuLrkuIDkuKrmhI/lpJbnmoTmtogNCj4gK+aBr+OAguWunueOsOaXtue7j+W4uOS4uui/meS4
pOenjeS4jeWQjOeahOWMuemFjeWunuS+i+S9v+eUqOS4jeWQjOeahOWMuemFjeaWueahiOOAgg0K
PiArDQo+ICvkuLrkuoblh4/lsJFNUEnlupPnmoTlhoXlrZjljaDnlKjvvIxNUEnlrp7njrDpgJrl
uLjkvb/nlKjkuKTnp43kuI3lkIznmoTljY/orq7mnaXlrp7njrDov5nkuIDnm67nmoQ6DQo+ICsN
Cj4gKzEuICAgICBFYWdlcuWNj+iuri0t5b2T5Y+R6YCB5pa55aSE55CG5a6M5Y+R6YCB5pe277yM
5a6M5pW055qE5L+h5oGv5bCx5Lya6KKr5Y+R6YCB44CC5Zyoc2VuZF9jceS4reS8muaUtuWIsA0K
PiAr5LiA5Liq5a6M5oiQ5Y+R6YCB55qE6YCa55+l77yM6YCa55+l57yT5Yay5Yy65Y+v5Lul6KKr
6YeN5paw5L2/55So44CCDQo+ICsNCj4gKzIuICAgICBSZW5kZXp2b3Vz5Y2P6K6uLS3lj5HpgIHm
lrnlnKjnrKzkuIDmrKHpgJrnn6XmjqXmlLbmlrnml7blj5HpgIHmoIfnrb7ljLnphY3lpLTvvIzk
uZ/orrjov5jmnInkuIDpg6jliIYNCj4gK+aVsOaNruOAguW9k+ebuOW6lOeahOe8k+WGsuWMuuii
q+WPkeW4g+aXtu+8jOWTjeW6lOiAheWwhuS9v+eUqOWktOS4reeahOS/oeaBr++8jOebtOaOpeWQ
keWMuemFjeeahOe8k+WGsuWMuuWPkei1tw0KPiArUkRNQeivu+WPluaTjeS9nOOAguS4uuS6huS9
v+e8k+WGsuWMuuW+l+WIsOmHjeeUqO+8jOmcgOimgeaUtuWIsOS4gOS4qmZpbua2iOaBr+OAgg0K
PiArDQo+ICvmoIfnrb7ljLnphY3nmoTlrp7njrANCj4gKz09PT09PT09PT09PT09DQo+ICsNCj4g
K+S9v+eUqOeahOWMuemFjeWvueixoeacieS4pOenjeexu+Wei++8jOWNs+WPkeW4g+eahOaOpeaU
tuWIl+ihqOWSjOaEj+Wklua2iOaBr+WIl+ihqOOAguW6lOeUqOeoi+W6j+mAmui/h+iwg+eUqOWP
keW4gw0KPiAr55qE5o6l5pS25YiX6KGo5Lit55qETVBJ5o6l5pS25L6L56iL5Y+R5biD5o6l5pS2
57yT5Yay5Yy677yM5bm25L2/55SoTVBJ5Y+R6YCB5L6L56iL5Y+R5biD5Y+R6YCB5raI5oGv44CC
5Y+R5biD55qEDQo+ICvmjqXmlLbliJfooajnmoTlpLTpg6jlj6/ku6XnlLHnoazku7bmnaXnu7Tm
iqTvvIzogIzova/ku7bliJnopoHlr7nov5nkuKrliJfooajov5vooYzot5/ouKrjgIINCj4gKw0K
PiAr5b2T5Y+R6YCB5byA5aeL5bm25Yiw6L6+5o6l5pS256uv5pe277yM5aaC5p6c5rKh5pyJ5Li6
6L+Z5Liq5Yiw6L6+55qE5raI5oGv6aKE5YWI5Y+R5biD5o6l5pS277yM5a6D5bCG6KKr5Lyg6YCS
57uZ6L2vDQo+ICvku7blubbooqvmlL7lnKjmhI/lpJbvvIh1bmV4cGVjdO+8iea2iOaBr+WIl+ih
qOS4reOAguWQpuWIme+8jOWwhuWvueivpeWMuemFjei/m+ihjOWkhOeQhu+8jOWMheaLrOS6pOS8
muWkhOeQhu+8jA0KPiAr5aaC5p6c5ZCI6YCC55qE6K+d77yM5bCG5pWw5o2u5Lyg6YCB5Yiw5oyH
5a6a55qE5o6l5pS257yT5Yay5Yy644CC6L+Z5YWB6K645o6l5pS25pa5TVBJ5qCH562+5Yy56YWN
5LiO6K6h566X6YeN5Y+g44CCDQo+ICsNCj4gK+W9k+S4gOS4quaOpeaUtuS/oeaBr+iiq+WPkeW4
g+aXtu+8jOmAmuS/oeW6k+WwhummluWFiOajgOafpei9r+S7tueahOaEj+WkluS/oeaBr+WIl+ih
qO+8jOS7peWvu+aJvuS4gOS4quWMuemFjeeahOaOpQ0KPiAr5pS25L+h5oGv44CC5aaC5p6c5om+
5Yiw5LiA5Liq5Yy56YWN55qE77yM5pWw5o2u5bCx5Lya6KKr6YCB5Yiw55So5oi357yT5Yay5Yy6
77yM5L2/55So5LiA5Liq6L2v5Lu25o6n5Yi255qE5Y2P6K6u44CCDQo+ICtVQ1jnmoTlrp7njrDm
oLnmja7mlbDmja7lpKflsI/vvIzkvb/nlKjmgKXliIfmiJbkuqTkvJrljY/orq7jgILlpoLmnpzm
sqHmnInmib7liLDljLnphY3vvIzmlbTkuKrpooTnva7nmoTmjqXmlLbliJcNCj4gK+ihqOeUseeh
rOS7tue7tOaKpO+8jOW5tuS4lOacieepuumXtOWcqOi/meS4quWIl+ihqOS4reWinuWKoOS4gOS4
qumihOe9rueahOaOpeaUtu+8jOi/meS4quaOpeaUtuiiq+S8oOmAkue7meehrOS7tuOAgg0KPiAr
6L2v5Lu26KaB5a+56L+Z5Liq5YiX6KGo6L+b6KGM6Lef6Liq77yM5Lul5biu5Yqp5aSE55CGTVBJ
5Y+W5raI5pON5L2c44CC5q2k5aSW77yM55Sx5LqO56Gs5Lu25ZKM6L2v5Lu25Zyo5qCH562+5Yy5
DQo+ICvphY3mk43kvZzmlrnpnaLpooTorqHkuI3kvJrntKflr4blkIzmraXvvIzov5nkuKrlvbHl
rZDliJfooajooqvnlKjmnaXmo4DmtYvpooTlhYjlj5HluIPnmoTmjqXmlLbooqvkvKDpgJLliLDn
oazku7bnmoQNCj4gK+aDheWGte+8jOWboOS4uuWMuemFjeeahOaEj+Wklua2iOaBr+ato+WcqOS7
juehrOS7tuS8oOmAkuWIsOi9r+S7tuOAgg0KPiAtLQ0KPiAyLjI3LjANCj4NCg==

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 568C6C433B4
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 06:09:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 394BE611AD
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 06:09:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhEFGKl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 02:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbhEFGKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 02:10:40 -0400
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83351C061574
        for <linux-doc@vger.kernel.org>; Wed,  5 May 2021 23:09:42 -0700 (PDT)
Received: by mail-ot1-x32e.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so3932663otp.11
        for <linux-doc@vger.kernel.org>; Wed, 05 May 2021 23:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=bj01kjcONAhONgb0Yvk0uOnZg5qgtKVXHSSwz4zSpL8=;
        b=hCyinqMO13C5skXASzUXRFy0CedMD99vEPr/dkRBfEWJ/ecLzBhX7aMZdSBVhStUoI
         MY6fPgITxveXeE2eYb5nwUFH0jiYj+0g+PW9uPtaubR68TMYIX262o+4FAdCuf9JflZc
         MFHoJkTZSNq1B9HsrLkBBrMZsktHjv0sj2FzPmhFjXD1KfFYQcKL0Qe6Jolfin40IHlN
         zLPi0mhdAZ8LhwW0AQmk2MMd5syp80F9dlRm/RMhtGaFmqhLoE8sU9uAS6LM5TVfE6fz
         wo3prgy1ov+y3UK4UBH8SiTf4vsRbfCtOTNs+Tku+uxa+3jcCoU5PsWy2Uo4QrghLitd
         lP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=bj01kjcONAhONgb0Yvk0uOnZg5qgtKVXHSSwz4zSpL8=;
        b=Juqjq20goNZi6SdCdt/IG009AGONN8E3zGjXPQKoCJF12M2YhsT9wk9Zm7sCFq65JC
         vD2MF8yX3QmO+pFrwqhkttlly6cosq9LorhcYcv9HdJMQco66+0E8RswugqwJVGRklNt
         3jm8jaEQm8DyGAwPiXlofBvrAw587RQk/mQ3lL6C1vV7gSH2ifua0qfe/LzKlVKa/pMb
         0hn2YxloJM8hJdkDhjSZZUZct2VvB5/md//1VQq+3nASQikhclQcaO9rzTtrWJ8Jz9Nm
         1nu7FChbswrcrgFBlr5TXAYG+tseOWYRi4jt3uzAX+Qju6U38SVKGaiSxB8eMn9X0Xb8
         wMOQ==
X-Gm-Message-State: AOAM531lwT+ckpVQZrApeV2GRrUByvjYP5CQqGKKkbUbjphFCdEFKtB9
        8qIxu1PabSxLVa2/sXECgfa6jEvgrZH9pTjbnaXMqvz+yjM=
X-Google-Smtp-Source: ABdhPJypY3hYeCp5BCI06uuQMl74Sl9lfHaJWhf6g3E+4NIdweFe0ljzoVFSkFMWB6nStzgFa4TTG1uNsOS56I5+bQY=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr2088873otc.302.1620281381851;
 Wed, 05 May 2021 23:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619665430.git.siyanteng@loongson.cn> <17f17ca148a9fd315340294f19cefbc80732336c.1619665430.git.siyanteng@loongson.cn>
 <20210429151318.GB23087@bobwxc.top> <CAEensMx5AQh_e4pA9vSny_LDV-D=DHvjAKnoVvHS9Lb5-BRU7Q@mail.gmail.com>
 <20210504082458.GA28320@bobwxc.top>
In-Reply-To: <20210504082458.GA28320@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Thu, 6 May 2021 14:09:32 +0800
Message-ID: <CAEensMyVYjean0x9r-5QgBQtTSo2bPp3G8pWUWD=Q+O=45gB_w@mail.gmail.com>
Subject: Re: [PATCH 2/3] docs/zh_CN: add parisc debugging.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NeaciDTml6Xlkajkuowg5LiL5Y2I
NDoyNeWGmemBk++8mg0KPg0KPiBPbiBUdWUsIE1heSAwNCwgMjAyMSBhdCAwMjo1Njo0N1BNICsw
ODAwLCB5YW50ZW5nIHNpIHdyb3RlOg0KPiA+IFd1IFguQy4gPGJvYnd4Y0BlbWFpbC5jbj4g5LqO
MjAyMeW5tDTmnIgyOeaXpeWRqOWbmyDkuIvljYgxMToxM+WGmemBk++8mg0KPiA+ID4NCj4gPiA+
IE9uIFRodSwgQXByIDI5LCAyMDIxIGF0IDExOjMzOjM0QU0gKzA4MDAsIFlhbnRlbmcgU2kgd3Jv
dGU6DQo+ID4gPiA+IFRoaXMgdHJhbnNsYXRlcyBEb2N1bWVudGF0aW9uL3BhcmlzYy9kZWJ1Z2dp
bmcucnN0IGludG8gQ2hpbmVzZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWWFu
dGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIC4u
Li90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL2RlYnVnZ2luZy5yc3QgICB8IDQxICsrKysrKysr
KysrKysrKysrKysNCj4gPiA+ID4gIC4uLi90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL2luZGV4
LnJzdCAgICAgICB8ICA2ICsrLQ0KPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcGFyaXNjL2RlYnVnZ2luZy5yc3QNCj4gPiA+ID4N
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Bh
cmlzYy9kZWJ1Z2dpbmcucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vcGFy
aXNjL2RlYnVnZ2luZy5yc3QNCj4gPiA+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiA+ID4g
aW5kZXggMDAwMDAwMDAwMDAwLi45OWFmMzAzZmQzZDgNCj4gPiA+ID4gLS0tIC9kZXYvbnVsbA0K
PiA+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wYXJpc2MvZGVi
dWdnaW5nLnJzdA0KPiA+ID4gPiBAQCAtMCwwICsxLDQxIEBADQo+ID4gPiA+ICsuLiBpbmNsdWRl
OjogLi4vZGlzY2xhaW1lci16aF9DTi5yc3QNCj4gPiA+ID4gKw0KPiA+ID4gPiArOk9yaWdpbmFs
OiBEb2N1bWVudGF0aW9uL3BhcmlzYy9kZWJ1Z2dpbmcucnN0DQo+ID4gPiA+ICs6VHJhbnNsYXRv
cjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29uLmNuPg0KPiA+ID4gPiArDQo+ID4gPiA+
ICsuLiBfY25fcGFyaXNjX2RlYnVnZ2luZzoNCj4gPiA+ID4gKw0KPiA+ID4gPiArPT09PT09PT09
PT09PT09PT0NCj4gPiA+ID4gK+iwg+ivlVBBLVJJU0MNCj4gPiA+ID4gKz09PT09PT09PT09PT09
PT09DQo+ID4gPiA+ICsNCj4gPiA+ID4gK+WlveWQp++8jOi/memHjOacieS4gOS6m+WFs+S6juiw
g+ivlWxpbnV4L3BhcmlzY+eahOS9jue6p++8iOWBj+ehrOS7tu+8iemDqOWIhueahOaPkOekuuOA
gg0KPiA+ID4NCj4gPiA+IG1heWJlDQo+ID4gPiDovoPlupXlsYLpg6jliIbnmoTkv6Hmga/jgIIN
Cj4gPiA+IGRlcGVuZCBvbiB5b3VyIGNob2ljZQ0KPiA+IE9LISB1c2Ug6L6D5bqV5bGC6YOo5YiG
55qE5L+h5oGv44CCDQo+ID4gPg0KPiA+ID4gPiArDQo+ID4gPiA+ICsNCj4gPiA+ID4gKzEuIOe7
neWvueWcsOWdgA0KPiA+ID4gPiArPT09PT09PT09PT09PT09PT09PT09DQo+ID4gPiA+ICsNCj4g
PiA+ID4gK+W+iOWkmuaxh+e8luS7o+eggeebruWJjeaYr+S7peWunuaooeW8j+i/kOihjOeahO+8
jOi/meaEj+WRs+edgOe7neWvueWcsOWdgOiiq+S9v+eUqO+8jOiAjOS4jeaYr+WDj+WGheaguOWF
tuS7lg0KPiA+ID4NCj4gPiA+IOW+iOWkmuaxh+e8luS7o+eggeebruWJjei/kOihjOWcqOWunuao
oeW8j+S4i++8jOi/meaEj+WRs+edgOS8muS9v+eUqOe7neWvueWcsOWdgO+8jOiAjOS4jeaYr+WD
j+WGheaguOWFtuS7lg0KPiA+IG9rIQ0KPiA+ID4NCj4gPiA+ID4gK+mDqOWIhumCo+agt+S9v+eU
qOiZmuaLn+WcsOWdgOOAguimgeWwhue7neWvueWcsOWdgOi9rOaNouS4uuiZmuaLn+WcsOWdgO+8
jOS9oOWPr+S7peWcqFN5c3RlbS5tYXDkuK3mn6UNCj4gPiA+ID4gK+aJvu+8jOa3u+WKoF9fUEFH
RV9PRkZTRVTvvIjnm67liY3mmK8weDEwMDAwMDAw77yJ44CCDQo+ID4gPiA+ICsNCj4gPiA+ID4g
Kw0KPiA+ID4gPiArMi4gSFBNQ3MNCj4gPiA+ID4gKz09PT09PT09DQo+ID4gPiA+ICsNCj4gPiA+
DQo+ID4gPiBoaWdoIHByaW9yaXR5IG1hY2hpbmUgY2hlY2sNCj4gPiBPSyENCj4NCj4g6L+Z5Liq
5L2c5LiA5Liq6K+R5rOoIOaIluiAhSDlnKjkuIvkuIDlj6XnmoRIUE1D5ZCO6Z2i5ous5rOoDQo+
DQpPS++8gXVzZSDkvaDkvJrlvpfliLDkuIDkuKogSFBNQ++8iGhpZ2ggcHJpb3JpdHkgbWFjaGlu
ZSBjaGVja++8iQ0KPiA+ID4NCj4gPiA+ID4gK+W9k+WunuaooeW8j+eahOS7o+eggeivleWbvuiu
v+mXruS4jeWtmOWcqOeahOWGheWtmOaXtu+8jOS9oOS8muW+l+WIsOS4gOS4qkhQTUPvvIzogIzk
uI3mmK/kuIDkuKrlhoXmoLhvcHBz44CCDQo+ID4gPg0KPiA+ID4g5Lya5Ye6546wSFBNQ+iAjOS4
jeaYr+WGheaguG9vcHPjgIINCj4gPiBIb3cgYWJvdXQg5Lya5omT5Y2wSFBNQ+iAjOS4jeaYr+WG
heaguG9vcHPvvJ8NCj4NCj4gV2lsbCBpdCBqdXN0IGJlICdwcmludCcgPyBJJ20gbm90IHN1cmUu
DQpPS++8gXVzZSDkvJrlh7rnjrBIUE1D6ICM5LiN5piv5YaF5qC4b29wc+OAgg0KPg0KPiA+ID4N
Cj4gPiA+ID4gK+S4uuS6huiwg+ivlUhQTUPvvIzlsJ3or5Xmib7liLDns7vnu5/lk43lupTogIUv
6K+35rGC6ICF5Zyw5Z2A44CC57O757uf6K+35rGC6ICF5Zyw5Z2A5bqU6K+l5LiO5aSE55CG5Zmo
55qEDQo+ID4gPg0KPiA+ID4g6KaB6LCD6K+VSFBNQ++8jOivt+WwneivleKApuKApg0KPiA+IG1h
eWJlIOiLpeimgeiwg+ivlUhQTUPvvIzor7flsJ3or5XigKbigKbvvJ8NCj4NCj4gT0suDQo+DQo+
ID4gPg0KPiA+ID4g77yI5p+Q77yJ5aSE55CG5ZmoDQo+ID4gdXNlIOivpeWkhOeQhuWZqCDvvJ8N
Cj4NCj4gKG9uZSBvZiB0aGUpDQo+IG9yIHVzZQ0KPiDlpITnkIblmajvvIjkuYvkuIDvvIkNCk9L
77yBdXNlIO+8iOafkO+8ieWkhOeQhuWZqA0KPiA+ID4NCj4gPiA+IHMv5ZON5bqU6ICFL+WTjeW6
lOeoi+W6jy9nDQo+ID4gPiBzL+ivt+axguiAhS/or7fmsYLnqIvluo8vZw0KPiA+ID4gcmVwbGFj
ZSBhbGwNCj4gPiBPSyENCj4gPiA+DQo+ID4gPiA+ICtIUEHvvIhJL0/ojIPlm7TlhoXnmoTpq5jl
nLDlnYDvvInnm7jljLnphY3vvJvns7vnu5/lk43lupTogIXlnLDlnYDmmK/lrp7mqKHlvI/ku6Pn
oIHor5Xlm77orr/pl67nmoTlnLDlnYDjgIINCj4gPiA+ID4gKw0KPiA+ID4gPiAr57O757uf5ZON
5bqU6ICF5Zyw5Z2A55qE5YW45Z6L5YC85piv5aSn5LqOX19QQUdFX09GRlNFVCDvvIgweDEwMDAw
MDAw77yJ55qE5Zyw5Z2A77yM6L+Z5oSP5ZGz552ADQo+ID4gPiA+ICvlnKjlrp7pmYXmqKHlvI/k
u6PnoIHor5Xlm77orr/pl67lroPkuYvliY3vvIzkuIDkuKromZrmi5/lnLDlnYDmsqHmnInooqvn
v7vor5HmiJDkuIDkuKrniannkIblnLDlnYDjgIINCj4gPiA+DQo+ID4gPiDlnKjlrp7mqKHlvI/o
r5Xlm77orr/pl67lroPkuYvliY3vvIzomZrmi5/lnLDlnYDmsqHmnInooqvnv7vor5HmiJDniann
kIblnLDlnYDjgIINCj4gPiBPSyENCj4gPiA+DQo+ID4gPiA+ICsNCj4gPiA+ID4gKw0KPiA+ID4g
PiArMy4g5pyJ6Laj55qEUeS9jQ0KPiA+ID4gPiArPT09PT09PT09PT09DQo+ID4gPiA+ICsNCj4g
PiA+ID4gK+afkOS6m+mdnuW4uOWFs+mUrueahOS7o+eggeW/hemhu+a4hemZpFBTV+S4reeahFHk
vY3jgILlvZNR5L2N6KKr5riF6Zmk5pe277yMQ1BV5LiN5Lya5pu05paw5Lit5pat5aSE55CGDQo+
ID4gPiA+ICvnqIvluo/miYDor7vlj5bnmoTlr4TlrZjlmajvvIzku6Xmib7lh7rmnLrlmajooqvk
uK3mlq3nmoTkvY3nva7igJTigJTmiYDku6XlpoLmnpzkvaDlnKjmuIXpmaRR5L2N55qE5oyH5Luk
5ZKM5YaNDQo+ID4gPiA+ICvmrKHorr7nva5R5L2N55qEUkZJ5LmL6Ze06YGH5Yiw5Lit5pat77yM
5L2g5LiN55+l6YGT5a6D5Yiw5bqV5Y+R55Sf5Zyo5ZOq6YeM44CC5aaC5p6c5L2g5bm46L+Q55qE
6K+d77yMSUFPUQ0KPiA+ID4gPiAr5Lya5oyH5ZCR5riF6ZmkUeS9jeeahOaMh+S7pO+8jOWmguae
nOS9oOS4jeW5uOi/kOeahOivne+8jOWug+S8muaMh+WQkeS7u+S9leWcsOaWueOAgumAmuW4uFHk
vY3nmoTpl67popjkvJoNCj4gPiA+ID4gK+ihqOeOsOWcqOaXoOazleino+mHiueahOezu+e7n+aM
gui1t+aIlui/kOihjOWIsOeJqeeQhuWGheWtmOeahOacq+err+OAgg0KPiA+ID4NCj4gPiA+IEhv
dyBhYm91dCDooajnjrDkuLrml6Dms5Xop6Pph4rnmoTns7vnu5/mjILotbfmiJbniannkIblhoXl
rZjotornlYzjgIINCj4gPiBBbmQgaG93IGFib3V0IOWHuueOsOWcqOaXoOazleino+mHiueahOez
u+e7n+aMgui1t+aIlueJqeeQhuWGheWtmOi2iueVjOOAgu+8nw0KPiA+IOWHuueOsCAtLS0tPiDp
l67popggOi0pDQo+DQo+IOihqOeOsOS4uiArIOafkOaDheaZr+OAgeeKtuaAgQ0KPg0KPiDlh7rn
jrDlnKggKyDmn5DlpITjgIHpg6jliIbjgIHmlrnkvY3jgIHmn5Dml7YNCk9L77yBdXNlIOihqOeO
sOS4uuaXoOazleino+mHiueahOezu+e7n+aMgui1t+aIlueJqeeQhuWGheWtmOi2iueVjOOAgg0K
Pg0KPiBUaGFua3MNCj4NCj4gV3UgWC5DDQoNClRoYW5rcywNCg0KWWFudGVuZw0KPg0KPiA+ID4N
Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Bh
cmlzYy9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wYXJpc2Mv
aW5kZXgucnN0DQo+ID4gPiA+IGluZGV4IGVmMjMyZDQ2YjFiYS4uYjkxM2Q2NjRlNzM1IDEwMDY0
NA0KPiA+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0aW9ucy96aF9DTi9wYXJpc2Mv
aW5kZXgucnN0DQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NO
L3BhcmlzYy9pbmRleC5yc3QNCj4gPiA+ID4gQEAgLTEwLDkgKzEwLDEzIEBADQo+ID4gPiA+ICBQ
QS1SSVND5L2T57O75p625p6EDQo+ID4gPiA+ICA9PT09PT09PT09PT09PT09PT09PQ0KPiA+ID4g
Pg0KPiA+ID4gPiAtVG9kb2xpc3Q6DQo+ID4gPiA+ICsuLiB0b2N0cmVlOjoNCj4gPiA+ID4gKyAg
IDptYXhkZXB0aDogMg0KPiA+ID4gPg0KPiA+ID4gPiAgICAgZGVidWdnaW5nDQo+ID4gPiA+ICsN
Cj4gPiA+ID4gK1RvZG9saXN0Og0KPiA+ID4gPiArDQo+ID4gPiA+ICAgICByZWdpc3RlcnMNCj4g
PiA+ID4gICAgIGZlYXR1cmVzDQo+ID4gPiA+DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMjcuMA0K
PiA+ID4NCj4gPiA+IFRoYW5rcw0KPiA+ID4NCj4gPiA+IFd1IFguQy4NCj4gPiA+DQo+ID4gVGhh
bmtzIHlvdSByZXZpZXchDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4NCj4gPiBZYW50ZW5nDQo+DQo=

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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129B4C433B4
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 06:30:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC8E3610A6
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 06:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235007AbhDGGaw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 02:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243284AbhDGGau (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Apr 2021 02:30:50 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C59E0C06174A
        for <linux-doc@vger.kernel.org>; Tue,  6 Apr 2021 23:30:41 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id x207so17748283oif.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Apr 2021 23:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=PAlOE7UayaL+FZQ0x0DVBXyN1JXzT3mZo2veG6GFQR8=;
        b=JJhtTOHm+W5ut5rZnNv5XVLGGii2MuNIxlOVIRSxQ8q+tOQ71V2VWEZ8aFDa4sBRgM
         +ZbME4gSWp7zhe/XJp6FZRvhIl7ezjx6QShEghi0ODlcylV2mKhV3j+8x6gkJTc0wYeh
         toDtWVhXVRcUKhcM6I08i5HXMCFZVFMonnJH08e8g2YKR5Nanm/GUFTstSTJHpWb7Ks4
         ib7ELgnkeEZevAtGaXmFBnnzFRKkG3dGc0GayLLMsKiNcVxWKCZpM4TphSGYNvIAkLdF
         cZZfXqypo/SKg0+vIJm1RSC8K426CHpnUF51FvitYAX2gr+GcPz+4NR+m06LhH89wOyl
         QPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=PAlOE7UayaL+FZQ0x0DVBXyN1JXzT3mZo2veG6GFQR8=;
        b=aj0l/7GrnYALLFKgWEw6mBBbby1xOQ8AplyKzJny3xDls92J1BddIHfgWWsXE+qmB0
         7C806+LvXmUCKuRJWpIfmzhidizi+EIpD7pDyHya7our7DAPfNhbeQiVLI7B0vOol8J3
         r4IEWV0LnfABY7rW80vFNt0lFT3Nx0lwhTvSI/JC/N9nXErWgqJahdDm02de2jS8Hb1x
         bWJg3YhK+h+2ucC66bD13WtUKVCVJdEQaqK+F4/JsQLrFcmZiY8GTQuiSqUGYmpBx1gT
         lyPM/orr6wdz/JajThu4qD9d89SNKCaMaE5b6mFdQjhOYZLXC0EGnILYPcZc84SJBz2v
         SV+g==
X-Gm-Message-State: AOAM530uw3fotGCbAm8s985WBK4tswetSbtpKvkw1zUP1eY4dddQc9CZ
        PegnLpqqvF8G4boz4Y533dcJg+NlVoAwMtF/Xyk=
X-Google-Smtp-Source: ABdhPJwOWIgwGFFWte1EOCuYkbwEeKeVDYWn/SPapb64pVcAIttWLm4Zui06t07xw4nNMVVnjL5j2NYTmxdUjKIhyUc=
X-Received: by 2002:aca:2219:: with SMTP id b25mr1180296oic.112.1617777041114;
 Tue, 06 Apr 2021 23:30:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-10-siyanteng@loongson.cn> <20210406165023.GC17278@bobwxc.top>
In-Reply-To: <20210406165023.GC17278@bobwxc.top>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Wed, 7 Apr 2021 14:30:29 +0800
Message-ID: <CAEensMzA0hEKLJ0FbbkDHtGkwcp0fvi6SsaJsOx+oA_syrmpkA@mail.gmail.com>
Subject: Re: [PATCH 09/11] docs/zh_CN: add openrisc/todo.rst translation
To:     "Wu X.C." <bobwxc@email.cn>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

V3UgWC5DLiA8Ym9id3hjQGVtYWlsLmNuPiDkuo4yMDIx5bm0NOaciDfml6XlkajkuIkg5LiK5Y2I
MTI6NTDlhpnpgZPvvJoNCj4NCj4gT24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDk6MDI6MDhQTSAr
MDgwMCwgWWFudGVuZyBTaSB3cm90ZToNCj4gPiBUaGlzIHBhdGNoIHRyYW5zbGF0ZXMgRG9jdW1l
bnRhdGlvbi9vcGVucmlzYy90b2RvLnJzdCBpbnRvIENoaW5lc2UuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBZYW50ZW5nIFNpIDxzaXlhbnRlbmdAbG9vbmdzb24uY24+DQo+ID4gLS0tDQo+ID4g
IC4uLi90cmFuc2xhdGlvbnMvemhfQ04vb3BlbnJpc2MvdG9kby5yc3QgICAgICB8IDIwICsrKysr
KysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykNCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL29w
ZW5yaXNjL3RvZG8ucnN0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vb3BlbnJpc2MvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL3RyYW5zbGF0
aW9ucy96aF9DTi9vcGVucmlzYy90b2RvLnJzdA0KPiA+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+
ID4gaW5kZXggMDAwMDAwMDAwMDAwLi4wZTVkMWM5MTIyZjgNCj4gPiAtLS0gL2Rldi9udWxsDQo+
ID4gKysrIGIvRG9jdW1lbnRhdGlvbi90cmFuc2xhdGlvbnMvemhfQ04vb3BlbnJpc2MvdG9kby5y
c3QNCj4gPiBAQCAtMCwwICsxLDIwIEBADQo+ID4gKy4uIGluY2x1ZGU6OiAuLi9kaXNjbGFpbWVy
LXpoX0NOLnJzdA0KPiA+ICsNCj4gPiArOk9yaWdpbmFsOiA6ZG9jOmAuLi8uLi8uLi9vcGVucmlz
Yy90b2RvYA0KPiA+ICs6VHJhbnNsYXRvcjogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25nc29u
LmNuPg0KPiA+ICsNCj4gPiArLi4gX2NuX29wZW5yaXNjX3RvZG8ucnN0Og0KPiA+ICsNCj4gPiAr
PT09PT09PT09PT0NCj4gPiAr5Luj5Yqe5LqL6aG5DQo+DQo+IO+8n++8nw0KPiDlvoXlip4NCk9L
77yBDQo+DQo+ID4gKz09PT09PT09PT09DQo+ID4gKw0KPiA+ICtPcGVuUklTQyBMaW51eOeahOen
u+akjeW3sue7j+WujOWFqOaKleWFpeS9v+eUqO+8jOW5tuS4lOS7jiAyLjYuMzUg5byA5aeL5bCx
5LiA55u05Zyo5LiK5ri45ZCM5q2l44CCDQo+ID4gK+eEtuiAjO+8jOi/mOacieS4gOS6m+WJqeS9
meeahOmhueebrumcgOimgeWcqOacquadpeWHoOS4quaciOWGheWujOaIkOOAgiDkuIvpnaLmmK/k
uIDkuKrlt7Lnn6XnmoTkuI3lpoLmhI/nmoQNCj4NCj4g5LiN5aaC5oSPIC0+IOS4jeWwveWujOe+
jiA/IGRlY2lkZSBpdCBieSB5b3Vyc2VsZg0KPg0KPiA+ICvpobnnm67liJfooajvvIzljbPmiJHk
u6znmoTlvoXlip7kuovpobnliJfooajjgIINCj4NCj4gbWlzc2luZyAidGhhdCBhcmUgZHVlIGZv
ciBpbnZlc3RpZ2F0aW9uIHNob3J0bHkiDQpPSyENCj4NCj4gPiArDQo+ID4gKy0gICDlrp7njrDl
hbbkvZnnmoRETUEgQVBJLi4uLi4uZG1hX21hcF9zZ+etieOAgg0KPg0KPiBDaGluc2VzIGVsbGlw
c2lzIFUrMjAyNg0KPiDigKbigKYNCk9LIQ0KPg0KPiA+ICsNCj4gPiArLSAgIOWujOaIkOmHjeWR
veWQjea4heeQhuW3peS9nC4uLi4uLuS7o+eggeS4reaPkOWIsOS6hm9yMzLvvIzov5nmmK/mnrbm
noTnmoTkuIDkuKrogIHlkI3lrZfjgIIg5oiR5LusDQo+DQo+IOKApuKApg0KT0shDQo+DQo+ID4g
KyAgICDlt7Lnu4/noa7lrprnmoTlkI3lrZfmmK9vcjFr77yM6L+Z5Liq5pS55Y+Y5q2j5Zyo5Lul
57yT5oWi56ev57Sv55qE5pa55byP6L+b6KGM44CCIOebruWJje+8jG9yMzLnm7jlvZMNCj4gPiAr
ICAgIOS6jm9yMWvjgIINCj4gPiAtLQ0KPiA+IDIuMjcuMA0KPg0KDQpUaGFua3MNCg0KWWFudGVu
Zw0K

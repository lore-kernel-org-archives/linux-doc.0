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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAF3BC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 04:04:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9038B61038
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 04:04:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229504AbhIWEGL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 00:06:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbhIWEGL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 00:06:11 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC3AC061574
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 21:04:40 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id h20so5141126ilj.13
        for <linux-doc@vger.kernel.org>; Wed, 22 Sep 2021 21:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZyZ4f8RYmXftyOwHl+4wQJZMk3Llo2/q2E3m+anNLMI=;
        b=B8Ht4Dbp0+Q9DZGxlQCkWRpr/GykKJJQDdTXctdSWOxp2YtU4mOiSFoX1ctLOM1RZP
         iqcaDro2N+54/Yk5SGyhHFrhdsWJzNgItzwIKGxiOQWp7FmCAxTowzyYBSZqKxlPU0MF
         gT+u/jvn8QgNtFPOkyxHre01WCo5UHj1caU9oCExMnbVXXkwKj4qYhBumSkSnYhftsm7
         TuxLMdT/QATAX9RVq6zcYQs9wbbNcPXfUpECHIcNjfpCCOdBWMDpSQ/uaoFpLWGzZxfu
         yOtCdplAhuns8pWVOAFdxuYMe7NUcOQVsZ8SoFi5QE8mkD0GdvglfohS0SEnvE/ZuKlg
         0Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZyZ4f8RYmXftyOwHl+4wQJZMk3Llo2/q2E3m+anNLMI=;
        b=Leuo9qaa/7x8OFZmoZzamB5HQG9Tei1h7LInsqdeajMk07N+l06TeN/Etal6Op1kf7
         SvUDlnHe0UztcUDsMm6CyYMP71PQbiUjbqYkmnFU24dwc8DtefpCG9ax+9Hm5+aOzVw+
         RMsf+B/cHPHpy0XEfFgHqLdqjnWFuMscgSKLMl0/V69PkSQZYZcVs6c00N1IZoCTUdeN
         bnOzfhsMa0/fqj/mjoKSGgf4j4NBBCcKZtWVUWP5WIcdH2Brrmi6QL3/cqNuDeQ+E5VE
         7ktE0Oj33log0E3jjoe2/rDdRJzAzREXJj7f3NHa5XXVboxNW6Gug3mfy/PHfaM7n60F
         tU0Q==
X-Gm-Message-State: AOAM530RDuB99eXvPFJSS+64gRqSjaHedl35YNJZSXEi9QY31MO5KDk8
        +EFd6d/X0Nj5tVYh5+WDQsr8PrlBxyX1JTcgA31o04cS/LI=
X-Google-Smtp-Source: ABdhPJzAzmz0zpkIjFL8SXyln5/FHfL5/BBS9hITcdRKatoCtGVzXU07h2T47Xi0OMIGKOMTOCvW+yLgC685C0WVc90=
X-Received: by 2002:a05:6e02:20c2:: with SMTP id 2mr2181789ilq.97.1632369880007;
 Wed, 22 Sep 2021 21:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631605791.git.siyanteng@loongson.cn> <6790175c0419d5d140f17d9c078c8538136e8190.1631605791.git.siyanteng@loongson.cn>
In-Reply-To: <6790175c0419d5d140f17d9c078c8538136e8190.1631605791.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 23 Sep 2021 12:04:04 +0800
Message-ID: <CAJy-AmmDwR71Nno8S-ej3u7Op72Jzf+LHc8Z_HEbW8mW868vgg@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/zh_CN: Improve zh_CN/process/howto.rst
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

UmV2aWV3ZWQtYnk6IEFsZXggU2hpIDxhbGV4c0BrZXJuZWwub3JnPg0KDQpUaGFua3MhDQoNCk9u
IFR1ZSwgU2VwIDE0LCAyMDIxIGF0IDQ6MDAgUE0gWWFudGVuZyBTaSA8c2l5YW50ZW5nMDFAZ21h
aWwuY29tPiB3cm90ZToNCj4NCj4gICAgLSBJbXByb3ZlIGdyYW1tYXIgb2YgemhfQ04vcHJvY2Vz
cy9ob3d0by5yc3QuDQo+ICAgIC0gUmVzb2x2ZSBwb3RlbnRpYWwgcHJvYmxlbXMgaW4gZG9jdW1l
bnRhdGlvbi4NCj4NCj4gU2lnbmVkLW9mZi1ieTogWWFudGVuZyBTaSA8c2l5YW50ZW5nQGxvb25n
c29uLmNuPg0KPiAtLS0NCj4gIERvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3poX0NOL3Byb2Nl
c3MvaG93dG8ucnN0IHwgMTAgKysrKystLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
dHJhbnNsYXRpb25zL3poX0NOL3Byb2Nlc3MvaG93dG8ucnN0IGIvRG9jdW1lbnRhdGlvbi90cmFu
c2xhdGlvbnMvemhfQ04vcHJvY2Vzcy9ob3d0by5yc3QNCj4gaW5kZXggZWUzZGVlNDc2ZDU3Li4y
OTAzZDcxNjFiYzggMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25zL3po
X0NOL3Byb2Nlc3MvaG93dG8ucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vdHJhbnNsYXRpb25z
L3poX0NOL3Byb2Nlc3MvaG93dG8ucnN0DQo+IEBAIC0zODEsNyArMzgxLDcgQEAgTUFJTlRBSU5F
UlPmlofku7bkuK3lj6/ku6Xmib7liLDkuI3lkIzor53popjlr7nlupTnmoTpgq7ku7bliJfooajj
gIINCj4NCj4gIOWGheaguOekvuWMuueahOW3peS9nOaooeW8j+WQjOWkp+WkmuaVsOS8oOe7n+WF
rOWPuOW8gOWPkemYn+S8jeeahOW3peS9nOaooeW8j+W5tuS4jeebuOWQjOOAguS4i+mdoui/meS6
m+S+iw0KPiAg5a2Q77yM5Y+v5Lul5biu5Yqp5L2g6YG/5YWN5p+Q5Lqb5Y+v6IO95Y+R55Sf6Zeu
6aKY77yaDQo+IC3nlKjov5nkupvor53ku4vnu43kvaDnmoTkv67mlLnmj5DmoYjkvJrmnInlpb3l
pITvvJoNCj4gK+eUqOi/meS6m+ivneS7i+e7jeS9oOeahOS/ruaUueaPkOahiOS8muacieWlveWk
hO+8mu+8iOWcqOS7u+S9leaXtuWAmeS9oOmDveS4jeW6lOivpeeUqOS4reaWh+WGmeaPkOahiO+8
iQ0KPg0KPiAgICAgIC0g5a6D5ZCM5pe26Kej5Yaz5LqG5aSa5Liq6Zeu6aKYDQo+ICAgICAgLSDl
roPliKDpmaTkuoYyMDAw6KGM5Luj56CBDQo+IEBAIC00NDgsOCArNDQ4LDggQEAgTGludXjlhoXm
oLjnpL7ljLrlubbkuI3llpzmrKLkuIDkuIvmjqXmlLblpKfmrrXnmoTku6PnoIHjgILkv67mlLnp
nIDopoHooqvmgbDlvZMNCj4gIOS/neivgeS/ruaUueWIhuaIkOW+iOWkmuWwj+Wdl++8jOi/meag
t+WcqOaVtOS4qumhueebrumDveWHhuWkh+Wlveiiq+WMheWQq+i/m+WGheaguOS5i+WJje+8jOWF
tuS4reeahOS4gOmDqA0KPiAg5YiG5Y+v6IO95Lya5YWI6KKr5o6l5pS244CCDQo+DQo+IC3lv4Xp
obvkuobop6Pov5nmoLflgZrmmK/kuI3lj6/mjqXlj5fnmoTvvJror5Xlm77lsIbmnKrlrozmiJDn
moTlt6XkvZzmj5DkuqTov5vlhoXmoLjvvIznhLblkI7lho3mib7ml7bpl7Tkv64NCj4gLeWkjeOA
gg0KPiAr5L2g5b+F6aG75piO55m96L+Z5LmI5YGa5piv5peg5rOV5Luk5Lq65o6l5Y+X55qE77ya
6K+V5Zu+5bCG5LiN5a6M5pW055qE5Luj56CB5o+Q5Lqk6L+b5YaF5qC477yM54S25ZCO5YaN5om+
DQo+ICvml7bpl7Tkv67lpI3jgIINCj4NCj4NCj4gIOivgeaYjuS/ruaUueeahOW/heimgeaApw0K
PiBAQCAtNDc1LDggKzQ3NSw4IEBAIExpbnV45YaF5qC456S+5Yy65bm25LiN5Zac5qyi5LiA5LiL
5o6l5pS25aSn5q6155qE5Luj56CB44CC5L+u5pS56ZyA6KaB6KKr5oGw5b2TDQo+ICAgICAgICAg
IGh0dHBzOi8vd3d3Lm96bGFicy5vcmcvfmFrcG0vc3R1ZmYvdHBwLnR4dA0KPg0KPg0KPiAt6L+Z
5Lqb5LqL5oOF5pyJ5pe25YCZ5YGa6LW35p2l5b6I6Zq+44CC6KaB5Zyo5Lu75L2V5pa56Z2i6YO9
5YGa5Yiw5a6M576O5Y+v6IO96ZyA6KaB5aW95Yeg5bm05pe26Ze044CC6L+Z5pivDQo+IC3kuIDk
uKrmjIHnu63mj5Dpq5jnmoTov4fnqIvvvIzlroPpnIDopoHlpKfph4/nmoTogJDlv4PlkozlhrPl
v4PjgILlj6ropoHkuI3mlL7lvIPvvIzkvaDkuIDlrprlj6/ku6XlgZrliLDjgIINCj4gK+i/meS6
m+S6i+aDheacieaXtuWAmeWBmui1t+adpeW+iOmavuOAguaDs+imgeWcqOS7u+S9leaWuemdoumD
veWBmuWIsOWujOe+juWPr+iDvemcgOimgeWlveWHoOW5tOaXtumXtOOAgui/mQ0KPiAr5piv5LiA
5Liq5oyB57ut5o+Q6auY55qE6L+H56iL77yM5a6D6ZyA6KaB5aSn6YeP55qE6ICQ5b+D5ZKM5Yaz
5b+D44CC5Y+q6KaB5LiN5pS+5byD77yM5L2g5LiA5a6a5Y+v5Lul5YGa5Yiw44CCDQo+ICDlvojl
pJrkurrlt7Lnu4/lgZrliLDkuobvvIzogIzku5bku6zpg73mm77nu4/lkoznjrDlnKjnmoTkvaDn
q5nlnKjlkIzmoLfnmoTotbfngrnkuIrjgIINCj4NCj4NCj4gLS0NCj4gMi4yNy4wDQo+DQo=

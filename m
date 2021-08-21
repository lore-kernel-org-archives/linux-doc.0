Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A4EC4338F
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 06:34:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2920D611C9
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 06:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhHUGfg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 Aug 2021 02:35:36 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:36173 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230375AbhHUGff (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Aug 2021 02:35:35 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7406C5803E5;
        Sat, 21 Aug 2021 02:34:56 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Sat, 21 Aug 2021 02:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=Lor52
        0YwbwX238QHKnZqSuw70Y+9yVKwFUIDXkDQWYE=; b=jHvnQipcwAcr59UxERBTB
        VzPIex5FMn04arVZ3JtxjJQG4AzxlZXk39qw0Ue0d5BLvxDfOoBdkjOnGFjzzc9a
        Dwb2ldtsikhbhO2bhIHCPSn9MTBrvKbYrKRcM5puqsMgGxuFDr7ioEl3ihS3vtHk
        QSTmCM6pOFY9hhA6WOgiiQJXzh5khcoDy0wXLAH6BG9HspAyP3tdNXkKQVqPvkC3
        MqLS61zi64SrEmlTkxs0tOZKGvUQPcmG1+r9f+QYG8rCKiy55pM3jDmfkirRKh9J
        IwEGFyPzwVQ+DkSYLV/frd5i2+caFi/Nl9pTQQfAJTwwdj9TlA4kGFPsxW8vSdl5
        w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=Lor520YwbwX238QHKnZqSuw70Y+9yVKwFUIDXkDQW
        YE=; b=uKitq8GJPttUQ/us1IJYfRVgnxMAXG4OyUoeJwc0CeKuwBzEg9neSiWVG
        facbHJjw3MlQLXOpzy3lL3w8G4X8KQD1hyOjWQQ6hWrLpJwmP20DKtSMT1bnrIGI
        AkY+97iVJT+6iWf6ov42iDFw0a86q4HPtdu2ClZWIImi9QIyLG3HQW6oFRbkt4Sk
        pckf2E8vxcP1kvi90mmEXxT6r0lDXyvDnoK3w6xzxndunS/o08zzRtUpxAzBSKTv
        E+Wi7U1AoXG+lIuCdRgekvYsJlz1gJ+Z7cyjNKoJ/23p1AbYQNGqA/5RWwu8nhlN
        6yKi3FTc34iJ8EzQTXdxE1gC8iaDg==
X-ME-Sender: <xms:jZ4gYfT-xRxYfVgPqDGgVxTVMzaarPy0uaJqH_eai1Qxmy75DaWzyQ>
    <xme:jZ4gYQziQgwHCk5MWqp5zWNAQIP9ESmsgbm0MhPauxZZepbrW-xer9PbIMkTSq5v4
    M868pdI2zaQcYs_O4U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddttddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdel
    hfefheekteefueektdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:jZ4gYU1fARLPPix3fYUs0nnMDE2-5eepRHtU7sWzyf-jk_P905af4w>
    <xmx:jZ4gYfAtFMxCQPbA-ko5OEnDwpAN0iiyGKQhhS1n0x57jX88tp0plQ>
    <xmx:jZ4gYYjzYLu5oO_rEY6OUeeGw9mL-sCinNy9CKklIIMRJ1T7U7j3ZQ>
    <xmx:kJ4gYRW1qtvKtLVWT0-Xno2831JygCaZBoI6LxoqW-ZaRebs-jrWLA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id A6D4EFA0AA4; Sat, 21 Aug 2021 02:34:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <2e839a16-93d0-4fa7-b610-2e614f1fbbd3@www.fastmail.com>
In-Reply-To: <950ef53a971ff4b5b7d961eb7c97a31165a866ed.1629274856.git.siyanteng@loongson.cn>
References: <cover.1629274856.git.siyanteng@loongson.cn>
 <950ef53a971ff4b5b7d961eb7c97a31165a866ed.1629274856.git.siyanteng@loongson.cn>
Date:   Sat, 21 Aug 2021 14:34:32 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Yanteng Si" <siyanteng@loongson.cn>,
        "Jonathan Corbet" <corbet@lwn.net>, alexs@kernel.org,
        "Wu XiangCheng" <bobwxc@email.cn>, seakeel@gmail.com
Cc:     "Huacai Chen" <chenhuacai@kernel.org>, linux-doc@vger.kernel.org,
        "Puyu Wang" <realpuyuwang@gmail.com>, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, "yanteng si" <siyanteng01@gmail.com>
Subject: Re: [PATCH v3 5/6] docs/zh_CN: add core-api boot-time-mm translation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



=E5=9C=A82021=E5=B9=B48=E6=9C=8818=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=884:32=EF=BC=8CYanteng Si=E5=86=99=E9=81=93=EF=BC=9A
> Translate Documentation/core-api/boot-time-mm.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks!


> ---
>  .../zh_CN/core-api/boot-time-mm.rst           | 49 +++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |  2 +-
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/boot-tim=
e-mm.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rs=
t=20
> b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> new file mode 100644
> index 000000000000..db09efb83684
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
> @@ -0,0 +1,49 @@
> +.. include:: ../disclaimer-zh_CN.rst

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E37C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 22:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234434AbhK2Wlq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Nov 2021 17:41:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232363AbhK2Wks (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Nov 2021 17:40:48 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23EC5C201452
        for <linux-doc@vger.kernel.org>; Mon, 29 Nov 2021 13:17:03 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 20C332CD;
        Mon, 29 Nov 2021 21:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 20C332CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638220622; bh=glE+rWEyPSkXK6pg/6fWmsGU1/sNzhgk5h7ZYGO+99w=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=MC8IQm04EI6C8B8Ak6klaSMqa9/vBMj5J5ABDTVCTNuE/JypVbKBTCsirve/OHRAb
         QFeXD8UaLoiz94dV2C7t9eEvL77z4c4ylUDwasExRxaFXBfXjsRdLKLYiFw/pZU40D
         Tva3NB9Zj142J+X2HAjckmt2tOW1iTbArM59xFwd4Yxz3e7HNder2ovUyAnjqCOj69
         eC48enpHUzz0ygChrSvRpE53HyigFhORhUPpoo1cGwc1l3IXi2n4esy36lL4UhFdeW
         KrS5hqhYzAD4WjOXsQrg6mdR+XzwLgLLgoV3esFTQInp77mglXH2eN9Y8ddkDrBTfZ
         H5RMSBa2txtyA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v2 2/3] docs/zh_CN: add scheduler sched-bwc translation
In-Reply-To: <92dbb08d26e108b1677aa6cdb3f7a74a9733429b.1638154485.git.siyanteng@loongson.cn>
References: <cover.1638154485.git.siyanteng@loongson.cn>
 <92dbb08d26e108b1677aa6cdb3f7a74a9733429b.1638154485.git.siyanteng@loongson.cn>
Date:   Mon, 29 Nov 2021 14:17:01 -0700
Message-ID: <871r2yu0fm.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> From: Yanteng Si <siyanteng01@gmail.com>
>
> Translate .../scheduler/sched-bwc.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>  .../translations/zh_CN/scheduler/index.rst    |   1 +
>  .../zh_CN/scheduler/sched-bwc.rst             | 206 ++++++++++++++++++
>  2 files changed, 207 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-bwc.=
rst

One quick question:

> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Docum=
entation/translations/zh_CN/scheduler/index.rst
> index 797df3a9c66f..aba11e561ec3 100644
> --- a/Documentation/translations/zh_CN/scheduler/index.rst
> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
> @@ -21,6 +21,7 @@ Linux=E8=B0=83=E5=BA=A6=E5=99=A8
>=20=20
>      completion
>      sched-arch
> +    sched-bwc
>=20=20
>=20=20
>  TODOList:
> diff --git a/Documentation/translations/zh_CN/scheduler/sched-bwc.rst b/D=
ocumentation/translations/zh_CN/scheduler/sched-bwc.rst
> new file mode 100644
> index 000000000000..4fb18db54655
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/scheduler/sched-bwc.rst
> @@ -0,0 +1,206 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/scheduler/sched-bwc.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +
> +.. _cn_scheduler_sched-bwc.rst:

Is there a reason for adding all of these labels?  They are generally
not used and just clutter up the documents.  I think I would prefer to
not see them unless they are needed, but if there's a reason to have
them that I'm not seeing ... ?

Otherwise this set seems about ready to go.

Thanks,

jon

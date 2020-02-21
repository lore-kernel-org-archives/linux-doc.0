Return-Path: <SRS0=i7Ry=4J=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00856C35641
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 07:21:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C650320722
	for <linux-doc@archiver.kernel.org>; Fri, 21 Feb 2020 07:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582269697;
	bh=CPb5OW0JlKsE8ViERc40V89U9i1HGaI8WCaHwOzkRN8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=nIroF9qfYdxioldwQ+kOd7UlaM00Ki4i8oOicalJrwnK9cPKsB2Wmby0uRdsXj/F0
	 gB14C0IrSsVz+wmqb0tM8AjF8PafRpyxtyzCu9Rn7ZQzj5yl8iAj97L35m14tTP3DA
	 WXuoR0rlLLpxfaz+c567dmNF4IF/glVJtRidkdic=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgBUHVh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Feb 2020 02:21:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:33858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgBUHVh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 Feb 2020 02:21:37 -0500
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95F6720722
        for <linux-doc@vger.kernel.org>; Fri, 21 Feb 2020 07:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582269696;
        bh=CPb5OW0JlKsE8ViERc40V89U9i1HGaI8WCaHwOzkRN8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=z0xU6r7/XI5dzq6cWq2ZxvdSMH5ToWPtpQVvbHxsUBSugo5b1F7TdXAIk+3aqsT8z
         +YA3SQtWn7QxIhY4OLnfGtzORDKjR7ZSdyTBCTPZzf4ivsAN+1tENhoiK3NOITAbe8
         CJ394Pzu8XqBDqo4YpByURoiUnkwkyuN2JqikuW4=
Received: by mail-wm1-f42.google.com with SMTP id s144so4483814wme.1
        for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2020 23:21:36 -0800 (PST)
X-Gm-Message-State: APjAAAWq72u1TjBzScNK0WCWwGHTVPwt2tr1OgIX+sPWt4xWpcT8g2Y5
        AjbatmZzcN8d/t4mT8Tt+JOJTQfPp7s1Ffidw+G70g==
X-Google-Smtp-Source: APXvYqwqrTtiwQIzqjuxHFCEFgbFvBdqK+b56BiKaasesQf/GaxUoNGf/h6pB6njcQrt4bymWg6VsUpMzXXteQQgr0U=
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr1911428wmj.1.1582269694990;
 Thu, 20 Feb 2020 23:21:34 -0800 (PST)
MIME-Version: 1.0
References: <20200221035832.144960-1-xypron.glpk@gmx.de>
In-Reply-To: <20200221035832.144960-1-xypron.glpk@gmx.de>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Fri, 21 Feb 2020 08:21:23 +0100
X-Gmail-Original-Message-ID: <CAKv+Gu_9T3fVSRiJg5DnWb83pjbVRHK21DCOxQCww4bd_NgxAg@mail.gmail.com>
Message-ID: <CAKv+Gu_9T3fVSRiJg5DnWb83pjbVRHK21DCOxQCww4bd_NgxAg@mail.gmail.com>
Subject: Re: [PATCH 1/1] efi/libstub: add libstub/mem.c to documentation tree
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 21 Feb 2020 at 04:58, Heinrich Schuchardt <xypron.glpk@gmx.de> wrot=
e:
>
> Let the description of the efi/libstub/mem.c functions appear in the Kern=
el
> API documentation in chapter
>
>     The Linux driver implementer=E2=80=99s API guide
>         Linux Firmware API
>             UEFI Support
>                 UEFI stub library functions
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
> The corresponding source patches are still in efi/next.
>
> https://lkml.org/lkml/2020/2/20/115
> https://lkml.org/lkml/2020/2/18/37
> https://lkml.org/lkml/2020/2/16/154
> ---
>  Documentation/driver-api/firmware/efi/index.rst | 11 +++++++++++
>  Documentation/driver-api/firmware/index.rst     |  1 +
>  2 files changed, 12 insertions(+)
>  create mode 100644 Documentation/driver-api/firmware/efi/index.rst
>
> diff --git a/Documentation/driver-api/firmware/efi/index.rst b/Documentat=
ion/driver-api/firmware/efi/index.rst
> new file mode 100644
> index 000000000000..4fe8abba9fc6
> --- /dev/null
> +++ b/Documentation/driver-api/firmware/efi/index.rst
> @@ -0,0 +1,11 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +UEFI Support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +UEFI stub library functions
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +.. kernel-doc:: drivers/firmware/efi/libstub/mem.c
> +   :internal:
> diff --git a/Documentation/driver-api/firmware/index.rst b/Documentation/=
driver-api/firmware/index.rst
> index 29da39ec4b8a..57415d657173 100644
> --- a/Documentation/driver-api/firmware/index.rst
> +++ b/Documentation/driver-api/firmware/index.rst
> @@ -6,6 +6,7 @@ Linux Firmware API
>
>     introduction
>     core
> +   efi/index
>     request_firmware
>     other_interfaces
>
> --
> 2.25.0
>

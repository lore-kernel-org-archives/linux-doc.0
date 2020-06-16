Return-Path: <SRS0=G1XG=75=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEF2C433E1
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 08:57:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0AEDC2074D
	for <linux-doc@archiver.kernel.org>; Tue, 16 Jun 2020 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1592297820;
	bh=krP7gKe+MHwab1VcIRScXJOGCE+MKe9KH7U31oT4Lyw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=v1duf+al5OJ+VxNuoodfvBl1hl5CRZfWdxoJ64x80cAkqFcoaRfFxcPGVxBg3R9Zd
	 nqURTxxOzsj1PXnUQ4UBcvXalTkAY0lhFm92a7uqOPCst0gIDDE0V9OF+hQSZS1WT3
	 z8Oh1RV0PHGO2x4LaEIGMYWPFWiINjn6jLCFvnx0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgFPI47 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Jun 2020 04:56:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:37470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727091AbgFPI47 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Jun 2020 04:56:59 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D1E6420786;
        Tue, 16 Jun 2020 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592297818;
        bh=krP7gKe+MHwab1VcIRScXJOGCE+MKe9KH7U31oT4Lyw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IqfRsQqVmU5Ie0GYmb2DxtHdA0AaxN/YPZRHahX/drWO5P24WQsVpyZGX7pbZoxM1
         yv3KrzlrKVfjxUUu+aCbAo5wbhi8TJFztfXuJMzk0QqCk5tUngEcHBqjGB2mm7UkxJ
         QkOCbCEjWLoQyjEgkcUjvt8aEBdUAXKk18j7dp0c=
Received: by mail-ot1-f49.google.com with SMTP id k15so15372983otp.8;
        Tue, 16 Jun 2020 01:56:58 -0700 (PDT)
X-Gm-Message-State: AOAM533bmFQhRrSuyJlI8jZAHCq/3xO9BWVjO6QCB4zWA1zKe8R2xYzb
        E9evak0CJ8Ru+hsyOP9x/ZqvBGii6zRRkQs+Zb0=
X-Google-Smtp-Source: ABdhPJztfZ3Sn/u7Ko/lutTXyCkDkk4FVJ9sTvFLCbnOOi1nv/T5npChMWD8vzSU+LsXsesBlSV09O6gCjtrIWj+n54=
X-Received: by 2002:a9d:5a12:: with SMTP id v18mr1548614oth.90.1592297818179;
 Tue, 16 Jun 2020 01:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200615203951.11705-1-xypron.glpk@gmx.de>
In-Reply-To: <20200615203951.11705-1-xypron.glpk@gmx.de>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 16 Jun 2020 10:56:47 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFpuPsp2+9a4Raab32UUwLySvT+k-ZpKZFs4dxapQxyRQ@mail.gmail.com>
Message-ID: <CAMj1kXFpuPsp2+9a4Raab32UUwLySvT+k-ZpKZFs4dxapQxyRQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] efi/libstub: Add libstub/random.c to the
 documentation tree
To:     Heinrich Schuchardt <xypron.glpk@gmx.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 15 Jun 2020 at 22:40, Heinrich Schuchardt <xypron.glpk@gmx.de> wrot=
e:
>
> Let the description of the efi/libstub/random.c functions appear in the
> kernel API documentation in the following chapters:
>
>     The Linux driver implementer=E2=80=99s API guide
>         Linux Firmware API
>             UEFI Support
>                 UEFI stub library functions
>
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

> ---
>  Documentation/driver-api/firmware/efi/index.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/driver-api/firmware/efi/index.rst b/Documentat=
ion/driver-api/firmware/efi/index.rst
> index 4fe8abba9fc6..08679962ae3b 100644
> --- a/Documentation/driver-api/firmware/efi/index.rst
> +++ b/Documentation/driver-api/firmware/efi/index.rst
> @@ -9,3 +9,7 @@ UEFI stub library functions
>
>  .. kernel-doc:: drivers/firmware/efi/libstub/mem.c
>     :internal:
> +
> +.. kernel-doc:: drivers/firmware/efi/libstub/random.c
> +   :internal:
> +
> --
> 2.27.0
>

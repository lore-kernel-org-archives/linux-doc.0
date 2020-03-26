Return-Path: <SRS0=jv2Y=5L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLACK autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B52FC2D0EA
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 03:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E85FA20737
	for <linux-doc@archiver.kernel.org>; Thu, 26 Mar 2020 03:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1585194280;
	bh=VkmY0zQuX833GQpUGXaOUmvjdZ0nnkB4ejNGiO5v5uU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=LOdu6LlLWe0vBk3S2hteRO+6QCv0H2VwLGlTJ5PgaI44ubv1zKMtAv65KoDysb0LK
	 ne8iPER6XzLhXxCTWKVAhhM9YkdVBgEo4uuxIgbW4ZGGY6hf5MffJLmJCyQTEjMy9R
	 czlbdblzbpczAhLa3j5N57SCmWGLDBX2+zp27j+E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbgCZDoj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Mar 2020 23:44:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:59586 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727652AbgCZDoj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 25 Mar 2020 23:44:39 -0400
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A5CBB20848
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2020 03:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585194278;
        bh=VkmY0zQuX833GQpUGXaOUmvjdZ0nnkB4ejNGiO5v5uU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=OdeBbNi0UFE6Xf5r9lnfVQhuzp+a/BFXy/IQWDQURZ4DuY9gq+dbEoACf45IaIlCz
         Iq/SLbxgvTZZrQjifMGcmOZ5WJ1yxvDZoqcPVk/JTIHOdDqwzt0TWnKwG9FErPLnjv
         0BMWgiPP8VxMl+NAz3cpZWsYBpwjnBXYv+1nyUTQ=
Received: by mail-wr1-f42.google.com with SMTP id a25so6128562wrd.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Mar 2020 20:44:38 -0700 (PDT)
X-Gm-Message-State: ANhLgQ0YMEIvV/jpLWxIlGi1/bonob7BQA9td+cwGbV1bewgok8KvHBM
        kBhMp2oPTjmeLrFmbgsN4qSXsyut5CeuraarQZbTUg==
X-Google-Smtp-Source: ADFU+vv0yft2oB0j81+Zpu1bdr8nwdQ3WjfpxQeoXpDnIznLh+VXYsHbOtp609GnoW6l+6LfrrAvNy4IRPTIME3mY5k=
X-Received: by 2002:adf:9dc6:: with SMTP id q6mr6773133wre.70.1585194276996;
 Wed, 25 Mar 2020 20:44:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200325194317.526492-1-ross.philipson@oracle.com> <20200325194317.526492-4-ross.philipson@oracle.com>
In-Reply-To: <20200325194317.526492-4-ross.philipson@oracle.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Wed, 25 Mar 2020 20:44:25 -0700
X-Gmail-Original-Message-ID: <CALCETrUoA9dgi2omjePtzjL9=5AqHKhy57UksnxbohZVdLo_pQ@mail.gmail.com>
Message-ID: <CALCETrUoA9dgi2omjePtzjL9=5AqHKhy57UksnxbohZVdLo_pQ@mail.gmail.com>
Subject: Re: [RFC PATCH 03/12] x86: Add early SHA support for Secure Launch
 early measurements
To:     Ross Philipson <ross.philipson@oracle.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        dpsmith@apertussolutions.com, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 25, 2020 at 12:43 PM Ross Philipson
<ross.philipson@oracle.com> wrote:
>
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
>
> The SHA algorithms are necessary to measure configuration information into
> the TPM as early as possible before using the values. This implementation
> uses the established approach of #including the SHA libraries directly in
> the code since the compressed kernel is not uncompressed at this point.
>
> The SHA1 code here has its origins in the code in
> include/crypto/sha1_base.h. That code could not be pulled directly into
> the setup portion of the compressed kernel because of other dependencies
> it pulls in. So this is a modified copy of that code that still leverages
> the core SHA1 algorithm.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  arch/x86/Kconfig                        |  24 +++
>  arch/x86/boot/compressed/Makefile       |   4 +
>  arch/x86/boot/compressed/early_sha1.c   | 104 ++++++++++++
>  arch/x86/boot/compressed/early_sha1.h   |  17 ++
>  arch/x86/boot/compressed/early_sha256.c |   6 +
>  arch/x86/boot/compressed/early_sha512.c |   6 +
>  include/linux/sha512.h                  |  21 +++
>  lib/sha1.c                              |   4 +
>  lib/sha512.c                            | 209 ++++++++++++++++++++++++
>  9 files changed, 395 insertions(+)
>  create mode 100644 arch/x86/boot/compressed/early_sha1.c
>  create mode 100644 arch/x86/boot/compressed/early_sha1.h
>  create mode 100644 arch/x86/boot/compressed/early_sha256.c
>  create mode 100644 arch/x86/boot/compressed/early_sha512.c
>  create mode 100644 include/linux/sha512.h
>  create mode 100644 lib/sha512.c
>
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 7f3406a9948b..f37057d3ce9f 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -2025,6 +2025,30 @@ config SECURE_LAUNCH
>           of all the modules and configuration information used for
>           boooting the operating system.
>
> +choice
> +       prompt "Select Secure Launch Algorithm for TPM2"
> +       depends on SECURE_LAUNCH
> +
> +config SECURE_LAUNCH_SHA1
> +       bool "Secure Launch TPM2 SHA1"
> +       help
> +         When using Secure Launch and TPM2 is present, use SHA1 hash
> +         algorithm for measurements.
> +

I'm surprised this is supported at all.  Why allow SHA1?

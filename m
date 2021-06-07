Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ADA2C47094
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 15:21:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2397961107
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 15:21:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhFGPXG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 11:23:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbhFGPXG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 11:23:06 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFCFCC061766;
        Mon,  7 Jun 2021 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xDfMmzkgE4oicX9GKUDK/cB62yDMHaARJNzpe95Fk2s=; b=M0sRWbQ9V94MDav6oLnh+xmab/
        ZockgW5GGy2xXt6R92HPUuuRGZC4ayxM4yfH1fk58L6HrNkTP8IZNUmqny4lepPygv0N+r8F0O/2r
        f5ly0XNi0S4C9I43l8nDJsP4ps/oWSzqu8ged0cG4HHoPYas+jAE1ax6mnheM4cuokCSuxdvp5lQq
        d/M9HKnC/BLhYpSf7SqWNoN0WBZadQvfBuYGb+/mnI9fyFDHxusp0tqQN3AeLzkLXWyZC0Iqx6ICF
        /WJs3d9b0WzptZeQtR/z1QPONNdteM1R0KyiH4d6OvmiFZ/OWIMZ+mY+f4R/sTQjJuBaSLzDIer5R
        tVMjDuQA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lqH3g-004RXH-97; Mon, 07 Jun 2021 15:21:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3C6723001E3;
        Mon,  7 Jun 2021 17:21:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 292BF2D6A7341; Mon,  7 Jun 2021 17:21:01 +0200 (CEST)
Date:   Mon, 7 Jun 2021 17:21:01 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 34/34] docs: x86: avoid using ReSt :doc:`foo` markup
Message-ID: <YL45XRsvI5ZGY1Kq@hirez.programming.kicks-ass.net>
References: <cover.1622898327.git.mchehab+huawei@kernel.org>
 <65a78bd39b0d317de9623976449e273e92a1e1c0.1622898327.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65a78bd39b0d317de9623976449e273e92a1e1c0.1622898327.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jun 05, 2021 at 03:18:33PM +0200, Mauro Carvalho Chehab wrote:
> The :doc:`foo` tag is auto-generated via automarkup.py.
> So, use the filename at the sources, instead of :doc:`foo`.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Thanks!

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

> ---
>  Documentation/x86/boot.rst | 4 ++--
>  Documentation/x86/mtrr.rst | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
> index fc844913dece..894a19897005 100644
> --- a/Documentation/x86/boot.rst
> +++ b/Documentation/x86/boot.rst
> @@ -1343,7 +1343,7 @@ follow::
>  In addition to read/modify/write the setup header of the struct
>  boot_params as that of 16-bit boot protocol, the boot loader should
>  also fill the additional fields of the struct boot_params as
> -described in chapter :doc:`zero-page`.
> +described in chapter Documentation/x86/zero-page.rst.
>  
>  After setting up the struct boot_params, the boot loader can load the
>  32/64-bit kernel in the same way as that of 16-bit boot protocol.
> @@ -1379,7 +1379,7 @@ can be calculated as follows::
>  In addition to read/modify/write the setup header of the struct
>  boot_params as that of 16-bit boot protocol, the boot loader should
>  also fill the additional fields of the struct boot_params as described
> -in chapter :doc:`zero-page`.
> +in chapter Documentation/x86/zero-page.rst.
>  
>  After setting up the struct boot_params, the boot loader can load
>  64-bit kernel in the same way as that of 16-bit boot protocol, but
> diff --git a/Documentation/x86/mtrr.rst b/Documentation/x86/mtrr.rst
> index c5b695d75349..9f0b1851771a 100644
> --- a/Documentation/x86/mtrr.rst
> +++ b/Documentation/x86/mtrr.rst
> @@ -28,7 +28,7 @@ are aligned with platform MTRR setup. If MTRRs are only set up by the platform
>  firmware code though and the OS does not make any specific MTRR mapping
>  requests mtrr_type_lookup() should always return MTRR_TYPE_INVALID.
>  
> -For details refer to :doc:`pat`.
> +For details refer to Documentation/x86/pat.rst.
>  
>  .. tip::
>    On Intel P6 family processors (Pentium Pro, Pentium II and later)
> -- 
> 2.31.1
> 

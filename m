Return-Path: <SRS0=VNB8=6S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE00C47254
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 14:40:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C14C2087E
	for <linux-doc@archiver.kernel.org>; Mon,  4 May 2020 14:40:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M7/KxBZ5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728486AbgEDOk0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 May 2020 10:40:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbgEDOkZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 May 2020 10:40:25 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FED7C061A10
        for <linux-doc@vger.kernel.org>; Mon,  4 May 2020 07:40:25 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id u127so9384536wmg.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2020 07:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UMNcIlbSFVLU3Wa4ZdiVbcd/h1/cMb1IhxbYjcynbwI=;
        b=M7/KxBZ5XzimbtUhN6RRKrjEVlCkEj4NzUOP9Kc444ElO6wJDueL/eN76CHLf8294X
         9NADHFTz9JoVaee6qN40eOAiZ+YmOx2inS4dyl7U7AsqqjLglLYTY4eOzD2c+vsAx25h
         YzEJxwrRCBMLuVQjLTLBYqP3LzCAEWNuYarVKR2h8gHZrHLA1exVW0nsY5ioTZS/oLVa
         XiP8GwhViqmttqnOAf78uUD0kgTETqerlTBPYSO5mALlho6MP6V4RAiPd3+NRmwUm/Yx
         ToYFwH7jBF2GEoWMDpckgTAJDlgPtR9Gg2YqgH3cpNLd29+669owb4ijnRwfivk/Kc/G
         NZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UMNcIlbSFVLU3Wa4ZdiVbcd/h1/cMb1IhxbYjcynbwI=;
        b=OF+HcME98UVv+gEqxeWHdcstMm3S+a6fov9+cK2u7hqFhmJb9jnK7RHZpDthz0vjlS
         PBgv3RXc2VYqIdU0S5GhS6B2EFiBmXB4JJyG92ivS8y2rSl1xHSHNJLwMJ0okg6TzE4N
         ttSuc5bm5jm6Xtc201A8QbRAppTRxytiYSLduc3a3At8XIqyco1BiBDRk4DR8puWvbN2
         Z4DjqtK7LKMgGbNFohnO4UZ41qbpC8Fn/FeZlSNALLLsbxKBDHR4AAVq2WZ0daKX2nSq
         ESMAkjK918MmZPL9RG03l93Am424THIqqb56VVWDbnFOzMcozr2V14Ia+15fykmusbzI
         rcDg==
X-Gm-Message-State: AGi0PuaXaLRyGKI01NM5uJhiA1rNcbHHci1X5Jl1443YF8efoxJb+F6R
        UFxghZLQ22c27jPUr6a+PW5GrQ==
X-Google-Smtp-Source: APiQypLONXW6Th2YSXt1LejwYNd0se4jOgnWg3t4puqftZujkExEtw4mF7AOlVMsxoMeaiIjwkbBFA==
X-Received: by 2002:a05:600c:2c0f:: with SMTP id q15mr16461206wmg.185.1588603223998;
        Mon, 04 May 2020 07:40:23 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id u188sm14313631wmg.37.2020.05.04.07.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 07:40:23 -0700 (PDT)
Date:   Mon, 4 May 2020 15:40:21 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     jason.wessel@windriver.com, gregkh@linuxfoundation.org,
        agross@kernel.org, kgdb-bugreport@lists.sourceforge.net,
        catalin.marinas@arm.com, linux-serial@vger.kernel.org,
        sumit.garg@linaro.org, corbet@lwn.net, mingo@redhat.com,
        will@kernel.org, hpa@zytor.com, tglx@linutronix.de,
        frowand.list@gmail.com, bp@alien8.de, bjorn.andersson@linaro.org,
        jslaby@suse.com, Andrew Morton <akpm@linux-foundation.org>,
        Juergen Gross <jgross@suse.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/11] Documentation: kgdboc: Document new
 kgdboc_earlycon parameter
Message-ID: <20200504144021.kdr3zwvpqh2pj3cs@holly.lan>
References: <20200428211351.85055-1-dianders@chromium.org>
 <20200428141218.v3.8.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428141218.v3.8.I7d5eb42c6180c831d47aef1af44d0b8be3fac559@changeid>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 28, 2020 at 02:13:48PM -0700, Douglas Anderson wrote:
> The recent patch ("kgdboc: Add kgdboc_earlycon to support early kgdb
> using boot consoles") adds a new kernel command line parameter.
> Document it.
> 
> Note that the patch adding the feature does some comparing/contrasting
> of "kgdboc_earlycon" vs. the existing "ekgdboc".  See that patch for
> more details, but briefly "ekgdboc" can be used _instead_ of "kgdboc"
> and just makes "kgdboc" do its normal initialization early (only works
> if your tty driver is already ready).  The new "kgdboc_earlycon" works
> in combination with "kgdboc" and is backed by boot consoles.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> 
> Changes in v3:
> - Added example in kgdb.rst
> - Removed unneeded sentence in kerenel-parameters doc.
> - Renamed earlycon_kgdboc to kgdboc_earlycon.
> - Suggest people use kgdboc_earlycon instead of ekgdboc.
> 
> Changes in v2: None
> 
>  .../admin-guide/kernel-parameters.txt         | 20 ++++++++++++++++
>  Documentation/dev-tools/kgdb.rst              | 24 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7bc83f3d9bdf..3b5ae06a98aa 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1190,6 +1190,11 @@
>  			This is designed to be used in conjunction with
>  			the boot argument: earlyprintk=vga
>  
> +			This parameter works in place of the kgdboc parameter
> +			but can only be used if the backing tty is available
> +			very early in the boot process. For early debugging
> +			via a serial port see kgdboc_earlycon instead.
> +
>  	edd=		[EDD]
>  			Format: {"off" | "on" | "skip[mbr]"}
>  
> @@ -2105,6 +2110,21 @@
>  			 kms, kbd format: kms,kbd
>  			 kms, kbd and serial format: kms,kbd,<ser_dev>[,baud]
>  
> +	kgdboc_earlycon=	[KGDB,HW]
> +			If the boot console provides the ability to read
> +			characters and can work in polling mode, you can use
> +			this parameter to tell kgdb to use it as a backend
> +			until the normal console is registered. Intended to
> +			be used together with the kgdboc parameter which
> +			specifies the normal console to transition to.
> +
> +			The the name of the early console should be specified

s/The the/The/

Other than that:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

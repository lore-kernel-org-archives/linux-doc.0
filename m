Return-Path: <SRS0=ITMb=BY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C629CC433DF
	for <linux-doc@archiver.kernel.org>; Fri, 14 Aug 2020 22:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85B0320768
	for <linux-doc@archiver.kernel.org>; Fri, 14 Aug 2020 22:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="qX/gU7Xo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726971AbgHNWiy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Aug 2020 18:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726919AbgHNWix (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Aug 2020 18:38:53 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CAEC061385
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2020 15:38:53 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id v15so5197595pgh.6
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2020 15:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=kL5n12ePtcvvUroFRzudNinNlHLnJCdYH1ARxqbbr4E=;
        b=qX/gU7Xo60JX46P0E12reWeabUoE7BULrX9T76F5L0LiGO+jwIk0+5TrRq1+ErafIN
         JY3stz+WftSExNQFpVKu2ShSnuZfaWn+yjB3qbT5dadACzEVItoZhctLuM2CV+XUqvYO
         g+ZiXGnom2klOzW8jITzGPV94/GxrAu/EdHg3kvKFpkNLR7TFcQ8nDfNKfKI3M3HIo39
         4i95wh1EETZV4nzjW91vMdSFr0h7gLOxaW8KObtMGZwdnW0ViTzuiNpKygn+HvZ5cCFZ
         ZEGdjH7thDNaVDF6TU6nXjQ9drahGTJ/nAf37WPIFwhnPwtgRIxHV8k5JtQ88Z4h8h/C
         XC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=kL5n12ePtcvvUroFRzudNinNlHLnJCdYH1ARxqbbr4E=;
        b=uIcL4rNVNWGn0lgdXa0q1YrQz9WLIHQEhDRrYSk76dFwn8nhVOAQey68YduolJcMkT
         XpMcONtQkA1bRO6z+K2Z/uFfRX4x+CUW63IO2z9icc9FgCwzWnGcw4cu61PFittgf9hQ
         yFDLNX4m9ICEQ2HhUvUsg2GNTGAXAsEnP7QXLtDsgmiQQlwSv3VBuy9WiKQ/0hevlosG
         DIxujSvBrHCVd2CnzsTCwsbcNuUKpf4uJywEmRSL+zRgIsmmsgAfMSEGU86pilK6DIlq
         ZvHCVXBlDs/AB7yJ35UUu66dPEyLfWSgtWOVpi3AP5oNnF15de+gAIm5C/yG+em7qoA3
         X68A==
X-Gm-Message-State: AOAM531nU5RmuMmbbLC0OY8/wCFaTGe6IyF0YunGk6c5PinqHnMvWOUr
        w4caV26rIOrJJtGSW8ArAZ7u4A==
X-Google-Smtp-Source: ABdhPJyUWKai0g2QrbS+Kka8E+ZrIxKx1yZG37WRdArPL1R3DwDv5COnURwPPZTtpC5p20pRF1OyEA==
X-Received: by 2002:a63:ef0c:: with SMTP id u12mr3055188pgh.327.1597444732855;
        Fri, 14 Aug 2020 15:38:52 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id kb2sm9071044pjb.34.2020.08.14.15.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 15:38:52 -0700 (PDT)
Date:   Fri, 14 Aug 2020 15:38:52 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Aug 2020 15:38:01 PDT (-0700)
Subject:     Re: [PATCH]  Documentation/features: refresh RISC-V arch support files
In-Reply-To: <20200810095000.32092-1-tklauser@distanz.ch>
CC:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        aou@eecs.berkeley.edu, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     tklauser@distanz.ch
Message-ID: <mhng-3c3382c2-de41-4ccc-aeb7-7663915b2889@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 10 Aug 2020 02:50:00 PDT (-0700), tklauser@distanz.ch wrote:
> Support for these was added by the following commits:
>
>   f2c9699f6555 ("riscv: Add STACKPROTECTOR supported")
>   3c4697982982 ("riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT").
>   ed48b297fe21 ("riscv: Enable context tracking")
>   cbb3d91d3bcf ("riscv: Add kmemleak support")
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> ---
>  Documentation/features/debug/kmemleak/arch-support.txt        | 2 +-
>  Documentation/features/debug/stackprotector/arch-support.txt  | 2 +-
>  Documentation/features/locking/lockdep/arch-support.txt       | 2 +-
>  Documentation/features/time/context-tracking/arch-support.txt | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/features/debug/kmemleak/arch-support.txt b/Documentation/features/debug/kmemleak/arch-support.txt
> index b7e4f3608838..2db76807ec6f 100644
> --- a/Documentation/features/debug/kmemleak/arch-support.txt
> +++ b/Documentation/features/debug/kmemleak/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/debug/stackprotector/arch-support.txt b/Documentation/features/debug/stackprotector/arch-support.txt
> index 3db4763aa3f5..3329559c8207 100644
> --- a/Documentation/features/debug/stackprotector/arch-support.txt
> +++ b/Documentation/features/debug/stackprotector/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: | TODO |
>      |          sh: |  ok  |
>      |       sparc: | TODO |
> diff --git a/Documentation/features/locking/lockdep/arch-support.txt b/Documentation/features/locking/lockdep/arch-support.txt
> index 4f844ecd0680..940b0bd02957 100644
> --- a/Documentation/features/locking/lockdep/arch-support.txt
> +++ b/Documentation/features/locking/lockdep/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: |  ok  |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ok  |
>      |       sparc: |  ok  |
> diff --git a/Documentation/features/time/context-tracking/arch-support.txt b/Documentation/features/time/context-tracking/arch-support.txt
> index a71f3a945285..266c81e8a721 100644
> --- a/Documentation/features/time/context-tracking/arch-support.txt
> +++ b/Documentation/features/time/context-tracking/arch-support.txt
> @@ -23,7 +23,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: | TODO |
>      |          sh: | TODO |
>      |       sparc: |  ok  |

Thanks.  I've put this on fixes.  Unless there are any issues I'll be sending
out a PR tomorrow.

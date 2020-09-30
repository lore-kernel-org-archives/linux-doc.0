Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86711C47425
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:43:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59F1D20754
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 13:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbgI3Nno (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 09:43:44 -0400
Received: from foss.arm.com ([217.140.110.172]:36532 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728235AbgI3Nno (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 Sep 2020 09:43:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4DE430E;
        Wed, 30 Sep 2020 06:43:43 -0700 (PDT)
Received: from [10.37.12.68] (unknown [10.37.12.68])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E67053F6CF;
        Wed, 30 Sep 2020 06:43:41 -0700 (PDT)
Subject: Re: [PATCH v4 18/52] math64.h: kernel-docs: Convert some markups into
 normal comments
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
 <97e7afe71713d70c2399a7277a114c071e54a8e0.1601467849.git.mchehab+huawei@kernel.org>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <31fd707b-7122-21bc-2656-d4fc5f50a7ac@arm.com>
Date:   Wed, 30 Sep 2020 14:46:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <97e7afe71713d70c2399a7277a114c071e54a8e0.1601467849.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 9/30/20 2:24 PM, Mauro Carvalho Chehab wrote:
> There are several functions at math64.h that are also
> defined at div64.c. As both are included at kernel-api.rst,
> Sphinx 3.x complains about symbol duplication:
> 
> 	./lib/math/div64.c:73: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
> 	Declaration is 'div_s64_rem'.
> 	./lib/math/div64.c:104: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
> 	Declaration is 'div64_u64_rem'.
> 	./lib/math/div64.c:144: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
> 	Declaration is 'div64_u64'.
> 	./lib/math/div64.c:172: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
> 	Declaration is 'div64_s64'.
> 
> In order to avoid Sphinx warnings about duplication, change the kernel-doc
> markups to just comments at math64.h.
>

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  include/linux/math64.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/math64.h b/include/linux/math64.h
> index 3381d9e33c4e..66deb1fdc2ef 100644
> --- a/include/linux/math64.h
> +++ b/include/linux/math64.h
> @@ -28,7 +28,7 @@ static inline u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
>  	return dividend / divisor;
>  }
>  
> -/**
> +/*
>   * div_s64_rem - signed 64bit divide with 32bit divisor with remainder
>   * @dividend: signed 64bit dividend
>   * @divisor: signed 32bit divisor
> @@ -42,7 +42,7 @@ static inline s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder)
>  	return dividend / divisor;
>  }
>  
> -/**
> +/*
>   * div64_u64_rem - unsigned 64bit divide with 64bit divisor and remainder
>   * @dividend: unsigned 64bit dividend
>   * @divisor: unsigned 64bit divisor
> @@ -56,7 +56,7 @@ static inline u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
>  	return dividend / divisor;
>  }
>  
> -/**
> +/*
>   * div64_u64 - unsigned 64bit divide with 64bit divisor
>   * @dividend: unsigned 64bit dividend
>   * @divisor: unsigned 64bit divisor
> @@ -68,7 +68,7 @@ static inline u64 div64_u64(u64 dividend, u64 divisor)
>  	return dividend / divisor;
>  }
>  
> -/**
> +/*
>   * div64_s64 - signed 64bit divide with 64bit divisor
>   * @dividend: signed 64bit dividend
>   * @divisor: signed 64bit divisor
> 

-- 
Regards,
Vincenzo

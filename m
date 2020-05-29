Return-Path: <SRS0=OG4P=7L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8309CC433DF
	for <linux-doc@archiver.kernel.org>; Fri, 29 May 2020 14:42:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59813207F5
	for <linux-doc@archiver.kernel.org>; Fri, 29 May 2020 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590763340;
	bh=yROXLlCMLv+sOW0wbFIyIu+dEz5r2mBCipSPwcN18dw=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=k+quc5zutnuY9vQvEqJaKBmRfJuTPaVD5phfwT6P5ygC2S2culcPcVJe6U6pyLeOv
	 lteIgZR2KjpWlcb1q4pznY2JkU/Dd1qrtw9VNUILlUnLF04OV4NATmdyOwsRJjeXQb
	 w3i3KLbHSwzYbIiECEMiypy5JtTM3Bu71bQ4qFR4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbgE2OmU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 May 2020 10:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgE2OmT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 May 2020 10:42:19 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 405EAC08C5C6
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2020 07:42:19 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id r24so2083829ota.8
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2020 07:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UVh1wWR/DjeVa+n2Yl0/3Yn24xlDJaPDKYgL0WddAm4=;
        b=G8N0uur1m61O3mamR+hb4TsSXS3hF/3ShqBe7V7tEliLJlUc4kahzOlZmmhFxfKHGG
         4fYHT9FxHwGhE1xpermoQXlrk3/URjzoazklnz/CeRAljnAJ4KgepvvHXhbNHpX1LlQO
         SJkQYGQX+1Ea7ekF31osINpOoS0ck3uowitr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UVh1wWR/DjeVa+n2Yl0/3Yn24xlDJaPDKYgL0WddAm4=;
        b=m/KpPTa2+QJt20wQPkrY4HYxTh90tf2OyJ//FiME0+mmchaZfhNiRXG9jmAZa9PXPY
         drNG4+soYrY2O0QE3NWz/lJtQoEK4fO0s8w7gwROSpwkX9OFsNXuItG4nBrT7TCr1mzV
         tpbuRzzzvhGM0tXcEPqNeyC5XbcDGKkEbsxrv+p/44asyh6qji0ESJgz1ZfQ8XqbFdFp
         tqNNkKfvwcj6L0KJrbGlgkRee5e3jmSI7qqvApPTsEgvr+s5DtkGIIihp695B90Oxgvh
         awNC5GKJrygCSla1cyyBamZ0KAL6mu4b+1u7dl8v2dHSzWsRZh62iJ4nqQx+Uo7eRYlm
         YF8w==
X-Gm-Message-State: AOAM532r8xxfLPCbo2AxgxgMqPs4wWJcTjLd62GBpmYsze9pRKNsWu/c
        8/Fgauqd0Hp5yTbYRW0KWIKuIg==
X-Google-Smtp-Source: ABdhPJy/ZY/ChiBwAlX4ASJn0XDIM6BygbwnQls2DZCmVsAqRJASYNEQHZh4iXC02Ru7IE4lX+wVMw==
X-Received: by 2002:a05:6830:1c1:: with SMTP id r1mr6642949ota.170.1590763338637;
        Fri, 29 May 2020 07:42:18 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id a7sm2491827otf.38.2020.05.29.07.42.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 07:42:18 -0700 (PDT)
Subject: Re: [PATCH v13 16/16] selftests/x86/fsgsbase: Test ptracer-induced GS
 base write with FSGSBASE
To:     Sasha Levin <sashal@kernel.org>, tglx@linutronix.de,
        luto@kernel.org, ak@linux.intel.com
Cc:     corbet@lwn.net, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        shuah@kernel.org, gregkh@linuxfoundation.org, tony.luck@intel.com,
        chang.seok.bae@intel.com, dave.hansen@linux.intel.com,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko.sakkinen@linux.intel.com,
        "H . Peter Anvin" <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20200528201402.1708239-1-sashal@kernel.org>
 <20200528201402.1708239-17-sashal@kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <de05c6c8-1139-cc40-8908-86c0dd645417@linuxfoundation.org>
Date:   Fri, 29 May 2020 08:42:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200528201402.1708239-17-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/28/20 2:14 PM, Sasha Levin wrote:
> From: "Chang S. Bae" <chang.seok.bae@intel.com>
> 
> This validates that GS selector and base are independently preserved in
> ptrace commands.
> 
> Suggested-by: Andy Lutomirski <luto@kernel.org>
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Dave Hansen <dave.hansen@intel.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   tools/testing/selftests/x86/fsgsbase.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/x86/fsgsbase.c b/tools/testing/selftests/x86/fsgsbase.c
> index 950a48b2e366..9a4349813a30 100644
> --- a/tools/testing/selftests/x86/fsgsbase.c
> +++ b/tools/testing/selftests/x86/fsgsbase.c
> @@ -465,7 +465,7 @@ static void test_ptrace_write_gsbase(void)
>   	wait(&status);
>   
>   	if (WSTOPSIG(status) == SIGTRAP) {
> -		unsigned long gs;
> +		unsigned long gs, base;
>   		unsigned long gs_offset = USER_REGS_OFFSET(gs);
>   		unsigned long base_offset = USER_REGS_OFFSET(gs_base);
>   
> @@ -481,6 +481,7 @@ static void test_ptrace_write_gsbase(void)
>   			err(1, "PTRACE_POKEUSER");
>   
>   		gs = ptrace(PTRACE_PEEKUSER, child, gs_offset, NULL);
> +		base = ptrace(PTRACE_PEEKUSER, child, base_offset, NULL);
>   
>   		/*
>   		 * In a non-FSGSBASE system, the nonzero selector will load
> @@ -501,8 +502,14 @@ static void test_ptrace_write_gsbase(void)
>   			 */
>   			if (gs == 0)
>   				printf("\tNote: this is expected behavior on older kernels.\n");

I know this hasn't changed. Please clarify what is "this" in this
message.

> +		} else if (have_fsgsbase && (base != 0xFF)) {
> +			nerrs++;
> +			printf("[FAIL]\tGSBASE changed to %lx\n", base);
>   		} else {
> -			printf("[OK]\tGS remained 0x%hx\n", *shared_scratch);
> +			printf("[OK]\tGS remained 0x%hx", *shared_scratch);
> +			if (have_fsgsbase)
> +				printf(" and GSBASE changed to 0xFF");
> +			printf("\n");
>   		}
>   	}
>   
> 

thanks,
-- Shuah

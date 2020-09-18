Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0E2C43463
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 15:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 40A232388B
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 15:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kD02tB58"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgIRPqh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:46:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgIRPqg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Sep 2020 11:46:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C23C0613CE
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2020 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=L1ZzemiGADkBoppUy/deoUGSv6uon/UG81YPwidx9tE=; b=kD02tB58dEY4L4X+AzbFsQhTfv
        4efiyXp/JaOMd89fA0CytkrxuAX+9PxbIKd44ll5KBRJJwzpfE2fdfJZIKFJsqrzSPGWUFGdckKIJ
        rjQwLai3Cbqxkzp99NIHi3arxnoDvAlE5HXYCEf2dBJ5wzLpb9Kca8BGEB+ZICMKd9y7OLVo4yZ0k
        oA8A84shYp7Zu373eCD4/De/Q7A9cgjTB1qC/j2sCf7bZoSrApESdzqZdsDKN9CGsOYTULvpsq5jS
        LIOLPgk6Pm9e7x7kj1l5kebiOerd7d4AiA24FbSw2ql1kPrcH7PzpkVJ3kkLbzjsAso9mUG7MPU80
        9R0jWCYA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJIaR-0003MF-Ss; Fri, 18 Sep 2020 15:46:14 +0000
Subject: Re: [PATCH v2] Documentation: Remove CMA's dependency on architecture
To:     Tian Tao <tiantao6@hisilicon.com>, corbet@lwn.net,
        keescook@chromium.org, anton@enomsg.org, ccross@android.com,
        tony.luck@intel.com, paulmck@kernel.org, tglx@linutronix.de,
        akpm@linux-foundation.org, bp@suse.de, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, mike.kravetz@oracle.com,
        oneukum@suse.com, gpiccoli@canonical.com, linux-doc@vger.kernel.org
Cc:     linuxarm@huawei.com
References: <1600412758-60545-1-git-send-email-tiantao6@hisilicon.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <cf472fd4-4645-8454-396b-a1a9a9f78172@infradead.org>
Date:   Fri, 18 Sep 2020 08:46:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600412758-60545-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/18/20 12:05 AM, Tian Tao wrote:
> CMA only depends on MMU. It doesn't depend on arch too much. such as ARM,
> ARM64, X86, MIPS etc. so We remove the dependency of cma about the
> architecture in kernel-parameters.txt.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> v2:
> rewrite the patch, patch name, commit messages.
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 7ebe3be..7fbfc1a 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -591,7 +591,7 @@
>  			some critical bits.
>  
>  	cma=nn[MG]@[start[MG][-end[MG]]]
> -			[ARM,X86,KNL]
> +			[KNL,CMA]
>  			Sets the size of kernel global memory area for
>  			contiguous memory allocations and optionally the
>  			placement constraint by the physical address range of
> 


-- 
~Randy

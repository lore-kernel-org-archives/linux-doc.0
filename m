Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08939C43463
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 04:00:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B43E23600
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 04:00:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="WBx/tVhI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726149AbgIREAm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 00:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIREAm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Sep 2020 00:00:42 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0070C06174A
        for <linux-doc@vger.kernel.org>; Thu, 17 Sep 2020 21:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=w9/Izh3uMbpc/Hl82AD7yjLIwLXTUqgJb8pEA/hJzVM=; b=WBx/tVhIBGiJN79BUq5+gyR9c3
        PKjdOukIsJ+tOYYvyw+Uwzk8QGB1unsSetScpto/4PPHvgQQ3iNDLXVLJAKiA9Oe7apr4DnrN2ZYC
        zBoLQNI6wZMn1IqF67HJtaxMvSuM0S4ONr3DDeT53tA+1sk4Vs/vdBV/nCzOeIIv2nT52nDUNt2k0
        6cHquNG8BtlSh9y7Mze4KIn2fZ/uWgRP6RX3D+dQElIF6AAMYBKsg4M6UO7Ur/9ZMzwcueg72SLCU
        EWZwYMGDhEp+JOO/x1+Vm910aZguY8Y6keIt4s1D0bkgMTJKdTb1sL09WYJiIaBD2y2Z68b3AE7e9
        iz/l4Lag==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJ7Za-0001NZ-3q; Fri, 18 Sep 2020 04:00:34 +0000
Subject: Re: [PATCH] Documentation: arm64 supports cma
To:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "tiantao (H)" <tiantao6@hisilicon.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "anton@enomsg.org" <anton@enomsg.org>,
        "ccross@android.com" <ccross@android.com>,
        "tony.luck@intel.com" <tony.luck@intel.com>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "bp@suse.de" <bp@suse.de>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "pawan.kumar.gupta@linux.intel.com" 
        <pawan.kumar.gupta@linux.intel.com>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "gpiccoli@canonical.com" <gpiccoli@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc:     Linuxarm <linuxarm@huawei.com>
References: <1600398953-55893-1-git-send-email-tiantao6@hisilicon.com>
 <ba0827edbdb54d4da445107afa80f3de@hisilicon.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <bfecb650-aa00-27bc-9859-d6b1ed168f7a@infradead.org>
Date:   Thu, 17 Sep 2020 21:00:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ba0827edbdb54d4da445107afa80f3de@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 9/17/20 8:28 PM, Song Bao Hua (Barry Song) wrote:
> 
> 
>> -----Original Message-----
>> From: Tian Tao [mailto:tiantao6@hisilicon.com]
>> Sent: Friday, September 18, 2020 3:16 PM
>> To: corbet@lwn.net; keescook@chromium.org; anton@enomsg.org;
>> ccross@android.com; tony.luck@intel.com; paulmck@kernel.org;
>> tglx@linutronix.de; akpm@linux-foundation.org; bp@suse.de;
>> mchehab+huawei@kernel.org; pawan.kumar.gupta@linux.intel.com;
>> rdunlap@infradead.org; mike.kravetz@oracle.com; oneukum@suse.com;
>> gpiccoli@canonical.com; linux-doc@vger.kernel.org
>> Cc: Linuxarm <linuxarm@huawei.com>
>> Subject: [PATCH] Documentation: arm64 supports cma
>>
>> arm64 also supports cma, updated documentation.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt
>> b/Documentation/admin-guide/kernel-parameters.txt
>> index 7ebe3be..38a1602 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -591,7 +591,7 @@
>>  			some critical bits.
>>
>>  	cma=nn[MG]@[start[MG][-end[MG]]]
>> -			[ARM,X86,KNL]
>> +			[ARM,ARM64,X86,KNL]
> 
> Yes. It supports ARM64. On the other hand, it also supports other architectures like
> MIPS
> S390
> MICROBLAZE
> ...
> So I am not sure if it is a completely correct fix.
> 
> CMA only depends on MMU. It probably doesn't depend on arch too much.
> 
> Is it better to just move to [KNL]?

How about [KNL,CMA]?  CMA is already listed as a build option/restriction
in Documentation/admin-guide/kernel-parameters.rst.

> 
>>  			Sets the size of kernel global memory area for
>>  			contiguous memory allocations and optionally the
>>  			placement constraint by the physical address range of
>> --

thanks.
-- 
~Randy


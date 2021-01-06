Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CE7C433E6
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 01:17:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 20A0022D04
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 01:17:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbhAFBQu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 5 Jan 2021 20:16:50 -0500
Received: from mail.cn.fujitsu.com ([183.91.158.132]:9310 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725843AbhAFBQu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Jan 2021 20:16:50 -0500
X-IronPort-AV: E=Sophos;i="5.78,478,1599494400"; 
   d="scan'208";a="103219147"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Jan 2021 09:16:01 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
        by cn.fujitsu.com (Postfix) with ESMTP id 71F5B4CE6D6F;
        Wed,  6 Jan 2021 09:15:55 +0800 (CST)
Received: from [10.167.225.206] (10.167.225.206) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 6 Jan 2021 09:15:54 +0800
Subject: Re: [PATCH] Documentation/dax: Update description of DAX policy
 changing
To:     Ira Weiny <ira.weiny@intel.com>
CC:     <corbet@lwn.net>, <davem@davemloft.net>,
        <gregkh@linuxfoundation.org>, <alexander.deucher@amd.com>,
        <mchehab+huawei@kernel.org>, <lee.jones@linaro.org>,
        <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20210104024040.5381-1-lihao2018.fnst@cn.fujitsu.com>
 <20210104163653.GG3097896@iweiny-DESK2.sc.intel.com>
From:   "Li, Hao" <lihao2018.fnst@cn.fujitsu.com>
Message-ID: <1a4dc84b-56ee-bf77-cf0d-dd9e0637b90c@cn.fujitsu.com>
Date:   Wed, 6 Jan 2021 09:15:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210104163653.GG3097896@iweiny-DESK2.sc.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.167.225.206]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 71F5B4CE6D6F.AFE1B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lihao2018.fnst@cn.fujitsu.com
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/1/5 0:36, Ira Weiny wrote:
> On Mon, Jan 04, 2021 at 10:40:40AM +0800, Hao Li wrote:
>> After commit 77573fa310d9 ("fs: Kill DCACHE_DONTCACHE dentry even if
>> DCACHE_REFERENCED is set"), changes to DAX policy will take effect
>> as soon as all references to this file are gone.
>>
>> Update the documentation accordingly.
>>
>> Signed-off-by: Hao Li <lihao2018.fnst@cn.fujitsu.com>
>> ---
>>  Documentation/filesystems/dax.txt | 15 ++-------------
>>  1 file changed, 2 insertions(+), 13 deletions(-)
>>
>> diff --git a/Documentation/filesystems/dax.txt b/Documentation/filesystems/dax.txt
>> index 8fdb78f3c6c9..a5af22831087 100644
>> --- a/Documentation/filesystems/dax.txt
>> +++ b/Documentation/filesystems/dax.txt
>> @@ -84,19 +84,8 @@ Summary
>>         described in 6) below.
>>  
>>   6. When changing the S_DAX policy via toggling the persistent FS_XFLAG_DAX flag,
>                                                                                   ^^
>                                                   I would delete this '.' as well.
>
>> -    the change in behaviour for existing regular files may not occur
>> -    immediately.  If the change must take effect immediately, the administrator
>> -    needs to:
>> -
>> -    a) stop the application so there are no active references to the data set
>> -       the policy change will affect
>> -
>> -    b) evict the data set from kernel caches so it will be re-instantiated when
>> -       the application is restarted. This can be achieved by:
>> -
>> -       i. drop-caches
>> -       ii. a filesystem unmount and mount cycle
>> -       iii. a system reboot
>> +    the change to existing regular file won't take effect until the file is closed
>                                                                       ^^^^^
>                                                                       files
>
>> +    by all processes or all processes referencing the file are stopped.
>
> So how about:
>
>    6. When changing the S_DAX policy via toggling the persistent FS_XFLAG_DAX
>       flag the change to existing regular files won't take effect until the file
>       is closed by all processes or all processes referencing the file are
>       stopped.
>
> I also feel like mentioning the stoppage of process' is redundant as users
> should know that will result in the closing of those FDs but I'm ok leaving it
> if others like it.

Thanks, it's much better than before.

Regards,
Hao Li

>
>
> Ira
>
>>  
>>  
>>  Details
>> --
>> 2.29.2
>>
>>
>>
>
>




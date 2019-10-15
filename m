Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F2D707D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 15 Oct 2019 21:28:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729654AbfJOV25 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 15 Oct 2019 17:28:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33724 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbfJOV25 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Oct 2019 17:28:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Ztb2ipo3B5cIJ+wpPazXOKrJvQbbnlxOT/jJrgBijX4=; b=p6lOJZcTXou9vb+oG5Gp9S/Tv
        pVtt8wYmq0MILdxQdGrzhw8qAarDw912zwa060NWLoLWDFWB876NdCqmrxKK5OPk2CyPROl2iiHiZ
        XRkML2uG1NUNWXZQGc6OV8k2Lrk4YbM/H5Egs53oao4PlFUARW+yuPTOK/uF5hmNXossM8Ri3sKl3
        Cg1INlsHUE4WRwQ3OtRF0grRK1jvcT4j4eFemYUnuWWI01ygKF3AeUm+kuqHJoj363Lp9Tp1uhlT9
        d3aX7P0PlPfGRW0Q8mCAjDmvRefW9gvw6IQW0wJhujJB7DfzfEWth2kYx9hjz8J3hZBNhtDgi5od0
        F4LPq8fFA==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iKUNE-0007sm-Ph; Tue, 15 Oct 2019 21:28:56 +0000
Subject: Re: [PATCH] docs: admin-guide: Extend short title underline in sysctl
To:     Jonathan Corbet <corbet@lwn.net>,
        Adam Zerella <adam.zerella@gmail.com>
Cc:     gor@linux.ibm.com, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org
References: <20191014110008.GA3814@gmail.com>
 <20191015123222.46527701@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <67b31b20-baca-57f4-909d-76483a5a753c@infradead.org>
Date:   Tue, 15 Oct 2019 14:28:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191015123222.46527701@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/15/19 11:32 AM, Jonathan Corbet wrote:
> On Mon, 14 Oct 2019 22:00:08 +1100
> Adam Zerella <adam.zerella@gmail.com> wrote:
> 
>> Title underlines should extend the full length of a title,
>> Sphinx is currently displaying the following warning when
>> building the htmldocs:
>>
>> sysctl/kernel.rst:397: WARNING: Title underline too short.
>>
>> hung_task_interval_warnings:
>> ===================
>>
>> Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
>> ---
>>  Documentation/admin-guide/sysctl/kernel.rst | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
>> index 614179dc79a9..383eda89f411 100644
>> --- a/Documentation/admin-guide/sysctl/kernel.rst
>> +++ b/Documentation/admin-guide/sysctl/kernel.rst
>> @@ -394,7 +394,7 @@ This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.
>>  
>>  
>>  hung_task_interval_warnings:
>> -===================
>> +============================
>>  
>>  The same as hung_task_warnings, but set the number of interval
>>  warnings to be issued about detected hung tasks during check
> 
> So this is a good fix, but it's not an actual patch that I can apply.
> Randy meanwhile says he fixed it, but the patch wasn't sent to me.  I
> guess this warning will live a little longer...:(

AFAIK, it's a patch to linux-next, not mainline.
Can you take such a patch?

thnx.
-- 
~Randy

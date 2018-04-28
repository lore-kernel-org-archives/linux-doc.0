Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 612427DE79
	for <lwn-linux-doc@archive.lwn.net>; Sat, 28 Apr 2018 02:04:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1759307AbeD1CE1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 22:04:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48608 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759215AbeD1CE1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 22:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=CpGGmE9QT4KNzz9bcUM7INwkXlIU4LWwbkgZQz1DvMY=; b=jIKoy3c15oXLLBVwwz8PSMKNO
        4cH3JAxI3tL4enXr6R/wKiMzwFZ5Mq6hMeTxl6ZiLp2/7VDYYzpuj4duYyeroNhCr1F3p0UQD095D
        JOh+lRNs/hu0KAf0yqOkWiOMBaSWGokLHk9+V6bOfobOMQJVIk5qlRZyLjpZJBcjCE9IafTEhlTxj
        EdJFNUQCrIEVQ6NvwaQNT7gkYN4N3BBvwPfM4OKsSp5gRoO0Jwvc0LLHCNyYei37FyYVYgDZwg9yc
        mdSXTsox71OBVk7uFCfKT2xBL2UcP4oONoy/yj3TlJb+KbbhhJTuUKde2nPa7ZOY35RdA4BieoT6b
        gb6PR9Pwg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fCFDu-0008RV-FL; Sat, 28 Apr 2018 02:04:26 +0000
Subject: Re: [PATCH] documentation: core-api: rearrange a few kernel-api
 chapters and sections
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <f05c8785-e9e1-0a5e-b362-50669b75d80b@infradead.org>
 <20180427171712.4e09233a@lwn.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3b6a2a91-2921-0e34-6f80-2f2726d96977@infradead.org>
Date:   Fri, 27 Apr 2018 19:04:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180427171712.4e09233a@lwn.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/27/2018 04:17 PM, Jonathan Corbet wrote:
> On Thu, 26 Apr 2018 18:11:02 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> Rearrange some kernel-api chapters and sections to group them
>> together better.
>>
>> - move Bit Operations from Basic C Library Functions to Basic
>>   Kernel Library Functions (now adjacent to Bitmap Operations since
>>   they are not typical C library functions)
>>
>> - move Sorting from Math Functions to Basic Kernel Library Functions
>>   since sort functions are more Basic than Math Functions
>>
>> - move Text Searching from Math Functions to Basic Kernel Library
>>   Functions (keep Sorting and Searching close to each other)
>>
>> - combine CRC and Math functions together into the (newly named)
>>   CRC and Math Functions chapter
> 
> The changes look good.  But ... grr... some of the stuff you are moving
> around was introduced in -rc2 via the networking tree.  That kind of thing
> makes life harder than it needs to be.  I've sorted it out and applied the
> patch, thanks.

Sorry, I thought that making the patch on linux-next 20180426 (which is based
on -rc2 and a few hundred git trees) would help with that.

Thanks for fixing.
-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

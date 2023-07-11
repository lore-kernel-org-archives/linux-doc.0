Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11BB1EB64DD
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jul 2023 07:16:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjGKHQD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jul 2023 03:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbjGKHQC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jul 2023 03:16:02 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4123DD1
        for <linux-doc@vger.kernel.org>; Tue, 11 Jul 2023 00:15:34 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-262c42d3fafso3443487a91.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Jul 2023 00:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1689059734; x=1691651734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4BQ4wTcz2ZUTX5UO6CgJKEdU05ydslf2Dnv0DUxPe8=;
        b=Nqfdvl7rXarXx+hZfpG6gu3DaOZtr8ERFL/iz/q+5ZOnwjRv2vO+lUgGYjkeEV1D7D
         rhCygc/2UeqXwLAY4Bq8PfD6tza1+OYAHTIvvKnneJ44witfk2s2atQUuGRBkisCnQTH
         8K0ljpxZCGkrM9G5vrTTz0edHZPJLBirz1zxAYT6+DXmMcISelmzr/TeaBrvDz6Pyq0A
         19XGHWmQroCxVK8FPf4WR5clZJ1iu/TWwug0tZpNgQNX9r0zg2D5nVFpG6pJzGLv5ECX
         /jbeXHLPp8f2R3bYfnjrRhQepi/qlRXK5iV4ws/eu0oWFPsqXo5OaFKr3gKNPUiVuS/A
         Uplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689059734; x=1691651734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4BQ4wTcz2ZUTX5UO6CgJKEdU05ydslf2Dnv0DUxPe8=;
        b=fIVc6jm7bT+2X/eEiSRygQvD4Qry1ZfeF8NmBke9xEOC0UsMY5BnUNCn6gw4dxMTZ+
         UyPt9m36rkQ5YqyJKYTsHdRmfqpiVlVfuBwrztbddE9Mx7ISkexA/myzHqA3hX4END02
         foG5tCHModQyyXngvb2IzET9jo/MU8+j49GBaX7mh9lQ8WH518wrvmy9GR9lkLUBJnwL
         WsHjqdybMq5+3mgK5XuYkGr4tR4npZ9S+sWXWYArha3r3DOSWWMUuFlpUOUwo1CSCgY1
         UbldsX0A/i//NywfbeF+2cCxRfmYc+09NRL4/4JnobWR1lugTDsoOfVB0dI6L3igDE6h
         3XkA==
X-Gm-Message-State: ABy/qLZ/I1LRz8YcAWw9HMZUh3x2uDBiWfFdICuxu+GJa0cE49LswNw3
        Rp0FnVUEKb35buge9ZduGK+RrMWSELCaGAyDDZnh+Q==
X-Google-Smtp-Source: APBJJlF2jvPM9/iA5YdftgyiGiVvbJOJoIELEmWsn9DVn+t41v1OItFyJxn0J8NH4eG7HU45wkS+RQ==
X-Received: by 2002:a17:90a:d80d:b0:263:161c:9e9c with SMTP id a13-20020a17090ad80d00b00263161c9e9cmr26706553pjv.12.1689059733720;
        Tue, 11 Jul 2023 00:15:33 -0700 (PDT)
Received: from [10.3.208.155] ([61.213.176.14])
        by smtp.gmail.com with ESMTPSA id u11-20020a17090a890b00b00263987a50fcsm7319231pjn.22.2023.07.11.00.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 00:15:33 -0700 (PDT)
Message-ID: <5a2d4d3f-9d9d-0ce9-c5a0-fb9bd64b9f48@bytedance.com>
Date:   Tue, 11 Jul 2023 15:15:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 5/5] docs: fuse: improve FUSE consistency explanation
To:     Randy Dunlap <rdunlap@infradead.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     me@jcix.top
References: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
 <20230711043405.66256-6-zhangjiachen.jaycee@bytedance.com>
 <36b37893-c297-dab0-df2d-eeacfa1e06c0@infradead.org>
From:   Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
In-Reply-To: <36b37893-c297-dab0-df2d-eeacfa1e06c0@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2023/7/11 12:42, Randy Dunlap wrote:
> Hi--
> 
> On 7/10/23 21:34, Jiachen Zhang wrote:
>> Signed-off-by: Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
>> ---
>>   Documentation/filesystems/fuse-io.rst | 32 +++++++++++++++++++++++++--
>>   1 file changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/filesystems/fuse-io.rst b/Documentation/filesystems/fuse-io.rst
>> index 255a368fe534..cdd292dd2e9c 100644
>> --- a/Documentation/filesystems/fuse-io.rst
>> +++ b/Documentation/filesystems/fuse-io.rst
> 
>> @@ -24,7 +31,8 @@ after any writes to the file.  All mmap modes are supported.
>>   The cached mode has two sub modes controlling how writes are handled.  The
>>   write-through mode is the default and is supported on all kernels.  The
>>   writeback-cache mode may be selected by the FUSE_WRITEBACK_CACHE flag in the
>> -FUSE_INIT reply.
>> +FUSE_INIT reply. In either modes, if the FOPEN_KEEP_CACHE flag is not set in
> 
>                         either mode,
> 
>> +the FUSE_OPEN, cached pages of the file will be invalidated immediatedly.
> 
>                                                                 immediately.
> 
>>   
>>   In write-through mode each write is immediately sent to userspace as one or more
>>   WRITE requests, as well as updating any cached pages (and caching previously
>> @@ -38,7 +46,27 @@ reclaim on memory pressure) or explicitly (invoked by close(2), fsync(2) and
>>   when the last ref to the file is being released on munmap(2)).  This mode
>>   assumes that all changes to the filesystem go through the FUSE kernel module
>>   (size and atime/ctime/mtime attributes are kept up-to-date by the kernel), so
>> -it's generally not suitable for network filesystems.  If a partial page is
>> +it's generally not suitable for network filesystems (you can consider the
>> +writeback-cache-v2 mode mentioned latter for them).  If a partial page is
> 
>                                       later
> 
>>   written, then the page needs to be first read from userspace.  This means, that
>>   even for files opened for O_WRONLY it is possible that READ requests will be
>>   generated by the kernel.
> 
> 


Thanks, Randy. I will fix them in the next version.

Jiachen

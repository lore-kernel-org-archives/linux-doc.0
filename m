Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF7927D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 09:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbeLEJXW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 04:23:22 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:36841 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbeLEJXW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 04:23:22 -0500
Received: by mail-ed1-f67.google.com with SMTP id f23so16407851edb.3
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 01:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5q1oZVZpYPB3NsqaDhCCopTXyMPqA8oVCDT24i5FlOU=;
        b=KbB58PkGcPozuhWBOj2v8tsKIqnb+XzPQql7OBnBvbkVGzjgaLwS077K73kQXO/Lqx
         tceUXP5Ytd+pYbHSeASRYL3Cw4pocZbKvmwW0bj0opTaB0aYY77tLSJ5Zxnfp3DStGU3
         +IfaXUVMlSAK3NUBaoOQBffpVKsgVhPQt7ydGxKMsflQeoT07Ak1lSgbbkTF6HdM39Wk
         UNH0Ucw+xUeI2wEWLJ15yUGM0oqhhXM3/tirZFnIyeBZIAl3PB5d0MCWNikvLU2p3HAs
         9QheXEx0Th2hwUHT5PPmT4G5wNzo5UBFo/kk+Y03nzqLbME/g5qrlbieEcQ71FigvIau
         48XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=5q1oZVZpYPB3NsqaDhCCopTXyMPqA8oVCDT24i5FlOU=;
        b=s0saUecYYBaWb+OjYiHTVMMVluW+NsfZg24BcXaFV62wjO70a6mvvUGHjANw3ZnVrs
         4Vhk5OZs6k0E7+LuoHw4tATbhMH5go5bybaexAgpYWEDLEVO+cXGzDVIwnbciNPg9uD/
         mKaW+FwB4ou2FTJKXlb/Pia4bOV/u46y3LgJMaoG4fR6FHexq7SPpNmhLmn4Tc8bhSor
         +gp3v6dNwlfISczw2vBy568Vn4dqnsEdZnk4fSrOxTRatQh4rAC1m+O3oYgycIDhfaJX
         Epu9Zku+47+7EhZirz9Ed9A236uO1I049St90kaOELQeyUe3wFgG7K9zKdsz8v4mbX1g
         VKMw==
X-Gm-Message-State: AA+aEWYDitRdiX5TtWcxPSAthGI9GN9pdvQuS6tOM7mExbEaowLrBqS/
        MyMucs8Et9IDmaH4PRNfOrh1xRzx
X-Google-Smtp-Source: AFSGD/Xxh1oYqA81XSfLiGEMl4ZVRKs++oxVm6dEDEb1s/CcxU/eZvuqy5ottiwRKLCqRAq3LMjL0g==
X-Received: by 2002:a50:ce0f:: with SMTP id y15mr19773171edi.207.1544001800404;
        Wed, 05 Dec 2018 01:23:20 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id x38sm5509898edx.24.2018.12.05.01.23.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Dec 2018 01:23:19 -0800 (PST)
Date:   Wed, 5 Dec 2018 09:23:19 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     Wei Yang <richard.weiyang@gmail.com>, mhocko@suse.com,
        osalvador@suse.de, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] core-api/memory-hotplug.rst: divide Locking Internal
 section by different locks
Message-ID: <20181205092319.nl772drzhpezcgt2@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
 <20181205023426.24029-2-richard.weiyang@gmail.com>
 <570e4080-8c35-3de4-9ee6-8a508a2a4649@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <570e4080-8c35-3de4-9ee6-8a508a2a4649@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 05, 2018 at 09:08:47AM +0100, David Hildenbrand wrote:
>On 05.12.18 03:34, Wei Yang wrote:
>> Currently locking for memory hotplug is a little complicated.
>> 
>> Generally speaking, we leverage the two global lock:
>> 
>>   * device_hotplug_lock
>>   * mem_hotplug_lock
>> 
>> to serialise the process.
>> 
>> While for the long term, we are willing to have more fine-grained lock
>> to provide higher scalability.
>> 
>> This patch divides Locking Internal section based on these two global
>> locks to help readers to understand it. Also it adds some new finding to
>> enrich it.
>> 
>> [David: words arrangement]
>> 
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  Documentation/core-api/memory-hotplug.rst | 27 ++++++++++++++++++++++++---
>>  1 file changed, 24 insertions(+), 3 deletions(-)
>> 
>> diff --git a/Documentation/core-api/memory-hotplug.rst b/Documentation/core-api/memory-hotplug.rst
>> index de7467e48067..95662b283328 100644
>> --- a/Documentation/core-api/memory-hotplug.rst
>> +++ b/Documentation/core-api/memory-hotplug.rst
>> @@ -89,6 +89,20 @@ NOTIFY_STOP stops further processing of the notification queue.
>>  Locking Internals
>>  =================
>>  
>> +There are three locks involved in memory-hotplug, two global lock and one local
>> +lock:
>> +
>> +- device_hotplug_lock
>> +- mem_hotplug_lock
>> +- device_lock
>> +
>
>Do we really only ever use these three and not anything else when
>adding/removing/onlining/offlining memory?
>
>(I am thinking e.g. about pgdat_resize_lock)

Yes there are more than those three, pgdat_resize_lock is one of them.

>
>If so, you should phrase that maybe more generally Or add more details :)

Yep, while I don't get a whole picture about the pgdat_resize_lock. The
usage of this lock scatter in many places.

>
>"In addition to fine grained locks like pgdat_resize_lock, there are
>three locks involved ..."
>

Sounds better :-)

-- 
Wei Yang
Help you, Help me

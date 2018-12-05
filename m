Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 114707D089
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 09:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbeLEJYa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 04:24:30 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44833 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbeLEJYa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 04:24:30 -0500
Received: by mail-ed1-f66.google.com with SMTP id y56so16355067edd.11
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 01:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3LtDrRVOLH3NuxAxrILhsAyGH0iOXHMcwOEpKBYTr9E=;
        b=DqafEesBPLpzzrbXhNs21FeSLK7tfoHZsaIpYy0FR6peD+F39avTOrZ23+ZGlclwJ3
         jpqcxi3okya+IyC1xVmXX2yX8l/015mG1FQboVDW+xJs37WXv2p59e6wDDHW/mDyu3Qh
         QGrXfeXh4/eggqAEsKH05DW9bVx4uLTe0jvkFaf3d32VBarcTjPSgCG6R6UQzTonM0Io
         3t976JaiTeIYqrONJRcfpg4uXDJpC88qjMVl9UKSVlxK3Z/guOn/bDSPaxw+TP8w73PV
         KptPp3xegP3dmDdJqfXQ7bdv2fHmHW4Ltll1NyJoAFU8mab8+f3KHOJZLg2OksWV1Ppc
         4+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=3LtDrRVOLH3NuxAxrILhsAyGH0iOXHMcwOEpKBYTr9E=;
        b=kFIpywKIW/++cpcATTAePDXouTVXabACuIMPzAokfZeAZGzk5yhnpvUJleNmpaJ2yv
         37xk9HYdGBT0sg3uDN/+F7IoPOln80Ro/LGrrJmXOK2I3CP7BKVIRoZ3Q6pMmngkMQZS
         gqTj4G4lPWPNEAfI1kp32QRUfPQUOev64tuxOyE9Z8fnrTDGOwRwqZQ6VByLUDtmmDPS
         WfhdN9IvtvGfDz4UCF379oBoTKCoib+SDI5EUXvXIR4gIZiRTahYBG1IABCLZCcGUOuV
         SoFsMgLyVBVmm+iHnMhkvOSj3BjLmmU78yWbY4qFK+N8kHiQY30ijFxklkdTB+NF4UUv
         g6Hg==
X-Gm-Message-State: AA+aEWaBWO44Z16Or+GIdR9ul1vWvE8o03+gFuUN2Hy4rcywJLxRbc2b
        b9MtAByjQwMh8n+piHfSIoM=
X-Google-Smtp-Source: AFSGD/X/McN+dzXYDYL2N2T6zGbK+Q/0eg9VILiqcuP1GrPxwhLTLK/JyQPMsdpVgd8TZYS4RCVQug==
X-Received: by 2002:a17:906:3105:: with SMTP id 5-v6mr18573003ejx.122.1544001868045;
        Wed, 05 Dec 2018 01:24:28 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id k32sm5534117edb.42.2018.12.05.01.24.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Dec 2018 01:24:27 -0800 (PST)
Date:   Wed, 5 Dec 2018 09:24:26 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
To:     Mike Rapoport <rppt@linux.ibm.com>
Cc:     Wei Yang <richard.weiyang@gmail.com>, david@redhat.com,
        mhocko@suse.com, osalvador@suse.de, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] core-api/memory-hotplug.rst: divide Locking Internal
 section by different locks
Message-ID: <20181205092426.6i7rrhcackavpdys@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
 <20181205023426.24029-2-richard.weiyang@gmail.com>
 <20181205084044.GB19181@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181205084044.GB19181@rapoport-lnx>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 05, 2018 at 10:40:45AM +0200, Mike Rapoport wrote:
>On Wed, Dec 05, 2018 at 10:34:26AM +0800, Wei Yang wrote:
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
>
>typo:                                                          ^locks
>

Thanks :-)

>> +lock:
>> +
>> +- device_hotplug_lock
>> +- mem_hotplug_lock
>> +- device_lock
>> +
>> +Currently, they are twisted together for all kinds of reasons. The following
>> +part is divided into device_hotplug_lock and mem_hotplug_lock parts
>> +respectively to describe those tricky situations.
>> +
>> +device_hotplug_lock
>> +---------------------
>> +
>>  When adding/removing memory that uses memory block devices (i.e. ordinary RAM),
>>  the device_hotplug_lock should be held to:
>> 
>> @@ -111,13 +125,20 @@ As the device is visible to user space before taking the device_lock(), this
>>  can result in a lock inversion.
>> 
>>  onlining/offlining of memory should be done via device_online()/
>> -device_offline() - to make sure it is properly synchronized to actions
>> -via sysfs. Holding device_hotplug_lock is advised (to e.g. protect online_type)
>> +device_offline() - to make sure it is properly synchronized to actions via
>> +sysfs. Even mem_hotplug_lock is used to protect the process, because of the
>
>I think it should be "Even if mem_hotplug_lock ..."
>

Ah, my poor English, will fix it in next version. :-)

>> +lock inversion described above, holding device_hotplug_lock is still advised
>> +(to e.g. protect online_type)
>> +
>> +mem_hotplug_lock
>> +---------------------
>> 
>>  When adding/removing/onlining/offlining memory or adding/removing
>>  heterogeneous/device memory, we should always hold the mem_hotplug_lock in
>>  write mode to serialise memory hotplug (e.g. access to global/zone
>> -variables).
>> +variables). Currently, we take advantage of this to serialise sparsemem's
>> +mem_section handling in sparse_add_one_section() and
>> +sparse_remove_one_section().
>> 
>>  In addition, mem_hotplug_lock (in contrast to device_hotplug_lock) in read
>>  mode allows for a quite efficient get_online_mems/put_online_mems
>> -- 
>> 2.15.1
>> 
>
>-- 
>Sincerely yours,
>Mike.

-- 
Wei Yang
Help you, Help me

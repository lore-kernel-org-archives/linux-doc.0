Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B97677D8AA
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Dec 2018 12:20:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbeLEMUX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Dec 2018 07:20:23 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45698 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726918AbeLEMUW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Dec 2018 07:20:22 -0500
Received: by mail-ed1-f66.google.com with SMTP id d39so16792338edb.12
        for <linux-doc@vger.kernel.org>; Wed, 05 Dec 2018 04:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DPFDSTq7Zb4k0o211CF1NP2PwdlMen7B3GqdvKV+J0w=;
        b=WIAMabHvbOapNaVhlCQvAfQw8qh1KylZ8+AZZp66F0VRQ0lhgU0TjhQA3W9jSlB68R
         F7auAOpB65an0hX2RN2DfsVTPiaUbFG7zLqudLtezV8TC34+QRK5jGml+ji4vK7Su9x+
         CzLv6yilDTLzQL09QOT+nMqCTBvLbEq+qKbYO9z5oJMh/0Xn/rNYxd2Lx11aM4Zays/X
         Fmx6F5ZrvRpknDhtreOgFMhthDOnv4GgeYJBVUs9ANGly6SKVOpDO/mCMYgqt4FOHk50
         qHniERaD6OT9gPMjXuSkFcdzrzdPsIRSao337z09i/Zr52ZhU6RN2yfORLVAszl2eJDf
         LQDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=DPFDSTq7Zb4k0o211CF1NP2PwdlMen7B3GqdvKV+J0w=;
        b=fCZ2ZEukmCgpP8teVLY/e01dc7sWfqEYPr+uqHc7TY4Foup17Eas79GLEJK34oFpG4
         aQ6WPUgTwrtlh/Xc358vbcuSe78c4fM4Ao0LyAAUTYEAjiD6mlnuklXgof0ByZBqxSvX
         qVLVbCjmxIbUKgLOOqm7GlWcFHn5++dzkV5xMbmgvh6ZkhqD5tULLwHfxj7GLdDvFJWR
         rbeFSgupdZEzxTSMUgWKq6JTObBRgwll7bEDsBqF8b4pM8o0OqnDG4ArVQHAkvd8VQ+c
         Qm6EPyJEx/v/OuBRuhdewpPrFcWKufQc3Gh884REO4dWub/7w0HMQlPXxq0C0Ep2lw8c
         o1ng==
X-Gm-Message-State: AA+aEWYLCYhMPms5BQyDiF8ijNs6TPezMc+BsB51Wj3taaqbBynBFYB8
        YzmjjuSM/JIM8XWL2/Z/nFs=
X-Google-Smtp-Source: AFSGD/X2yAjOWYAsl2VCcCJNnHz4QXUgCHe9F6m1JVpxMXbVHc6Js5id0pi1mJsRJe+Lw3u2VwS/Pg==
X-Received: by 2002:a50:d085:: with SMTP id v5mr21028313edd.61.1544012419820;
        Wed, 05 Dec 2018 04:20:19 -0800 (PST)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id b46sm5414209edc.57.2018.12.05.04.20.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Dec 2018 04:20:19 -0800 (PST)
Date:   Wed, 5 Dec 2018 12:20:18 +0000
From:   Wei Yang <richard.weiyang@gmail.com>
To:     Michal Hocko <mhocko@kernel.org>
Cc:     Wei Yang <richard.weiyang@gmail.com>, david@redhat.com,
        osalvador@suse.de, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 2/2] core-api/memory-hotplug.rst: divide Locking Internal
 section by different locks
Message-ID: <20181205122018.uog4r2pgpa2vmvaq@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20181205023426.24029-1-richard.weiyang@gmail.com>
 <20181205023426.24029-2-richard.weiyang@gmail.com>
 <20181205121310.GK1286@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181205121310.GK1286@dhcp22.suse.cz>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 05, 2018 at 01:13:10PM +0100, Michal Hocko wrote:
>On Wed 05-12-18 10:34:26, Wei Yang wrote:
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
>
>For a love of mine I cannot find the locking description by Oscar. Maybe
>it never existed and I just made it up ;) But if it is not imaginary
>then my recollection is that it was much more comprehensive. If not then
>even this is a good start.

Thanks.

If Oscar has already has some work on it, this could be a complement to
his work :-)

>
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
>Michal Hocko
>SUSE Labs

-- 
Wei Yang
Help you, Help me

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F12BC2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 16:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6FB7611EE
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 16:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234765AbhFNQeQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 12:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59832 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234561AbhFNQeJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 12:34:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623688326;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DISslyfLGhpMa3WyA2T18Pg0TsQiGkTpC7aVUBeR5IM=;
        b=dKdMLoGjSmR0Adm2DSdyJzQunyIysRnhLtepuL5cTxScG8+oLBSRGTLyT+BETCy4AyPz2A
        e28RS67c0CX9WwHr4a/YTTpzHqBhVOhtIZ4+scF05Ori91iXsxWDLQ7oT8TaL7VpyvC5Eq
        E7B7FSy2fprVtDv+u6x4G5CwdaIe8tE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-8-HrKLM9PXqRs4A2M4Ly_g-1; Mon, 14 Jun 2021 12:32:04 -0400
X-MC-Unique: 8-HrKLM9PXqRs4A2M4Ly_g-1
Received: by mail-qk1-f198.google.com with SMTP id t131-20020a37aa890000b02903a9f6c1e8bfso23700157qke.10
        for <linux-doc@vger.kernel.org>; Mon, 14 Jun 2021 09:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DISslyfLGhpMa3WyA2T18Pg0TsQiGkTpC7aVUBeR5IM=;
        b=mNl5C1+DKkvaemCDgBXdUuejpHCPhT1bZ3qrTVuScTB2iJCAbRUHtMsH+vo6soleis
         9K/TbfUxNrbEfIHJRx5hFDiSPj2WDKaKWFEIDxNJvwB5ZZXqGMnvZUCB2p1x9wwuOQLq
         uaeL9C7TB8mVIAOGslMgYSg+NVWcnag2sqMxAnsj4Y7CzfoFLIvLF6XtK/TNQek9fnk/
         uw+PmOeA9tZuAcOsPZkjjk6iVV+8AlRSekWFONFBqpSUOY9EoUsbRuO7iqNxJ1Y2bVUq
         C+BJfIhl9CQ7YT/BgpxhNvQ/TlNAk2Px6vhQDlE0Zr+EqjSnXTwEC7bKMoOE1aE2O4R3
         N2Ww==
X-Gm-Message-State: AOAM532EwLc7CWNIdSJyn3Bioh2OQe+0y2hPDVNrMRWbi23Blx+T4lep
        2bHt4dLGI4gE3S5KrOA1K2Mv9QGDFAOe9nGW0p6e6qw5FfmKY5b/+ZbcoouttO+I2LkkQB/YEYk
        OG1hkIlM6FpABtAV3/bEi
X-Received: by 2002:a37:a2d6:: with SMTP id l205mr17105993qke.326.1623688324320;
        Mon, 14 Jun 2021 09:32:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCvxn+ltzjQlfYVUxjQ+5bHloF+7JsMElf+UL5szMp3AVyCsKA+9NhZBjoT78OZ0Xt7flNDw==
X-Received: by 2002:a37:a2d6:: with SMTP id l205mr17105966qke.326.1623688324062;
        Mon, 14 Jun 2021 09:32:04 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id j14sm8455892qtq.56.2021.06.14.09.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jun 2021 09:32:03 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 4/4] driver core: Allow showing cpu as offline if not
 valid in cpuset context
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>, x86@kernel.org,
        cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org
References: <20210614152306.25668-1-longman@redhat.com>
 <20210614152306.25668-5-longman@redhat.com> <YMd7PEU0KPulsgMz@kroah.com>
Message-ID: <ad33a662-7ebe-fb92-4459-5dd85a013501@redhat.com>
Date:   Mon, 14 Jun 2021 12:32:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMd7PEU0KPulsgMz@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/14/21 11:52 AM, Greg KH wrote:
> On Mon, Jun 14, 2021 at 11:23:06AM -0400, Waiman Long wrote:
>> Make /sys/devices/system/cpu/cpu<n>/online file to show a cpu as
>> offline if it is not a valid cpu in a proper cpuset context when the
>> cpuset_bound_cpuinfo sysctl parameter is turned on.
> This says _what_ you are doing, but I do not understand _why_ you want
> to do this.
>
> What is going to use this information?  And now you are showing more
> files than you previously did, so what userspace tool is now going to
> break?

One reason that is provided by the customer asking for this 
functionality is because some applications use the number of cpu cores 
for licensing purpose. Even though the applications are running in a 
container with a smaller set of cpus, they may still charge as if all 
the cpus are available. They ended up using a bind mount to mount over 
the cpuX/online file.

I should have included this information in the patchset.


>
>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   drivers/base/core.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/base/core.c b/drivers/base/core.c
>> index 54ba506e5a89..176b927fade2 100644
>> --- a/drivers/base/core.c
>> +++ b/drivers/base/core.c
>> @@ -29,6 +29,7 @@
>>   #include <linux/sched/mm.h>
>>   #include <linux/sysfs.h>
>>   #include <linux/dma-map-ops.h> /* for dma_default_coherent */
>> +#include <linux/cpuset.h>
>>   
>>   #include "base.h"
>>   #include "power/power.h"
>> @@ -2378,11 +2379,24 @@ static ssize_t uevent_store(struct device *dev, struct device_attribute *attr,
>>   }
>>   static DEVICE_ATTR_RW(uevent);
>>   
>> +static bool is_device_cpu(struct device *dev)
>> +{
>> +	return dev->bus && dev->bus->dev_name
>> +			&& !strcmp(dev->bus->dev_name, "cpu");
>> +}
> No, this is not ok, there is a reason we did not put RTTI in struct
> devices, so don't try to fake one here please.
>
>> +
>>   static ssize_t online_show(struct device *dev, struct device_attribute *attr,
>>   			   char *buf)
>>   {
>>   	bool val;
>>   
>> +	/*
>> +	 * Show a cpu as offline if the cpu number is not valid in a
>> +	 * proper cpuset bounding cpuinfo context.
>> +	 */
>> +	if (is_device_cpu(dev) && !cpuset_current_cpu_valid(dev->id))
>> +		return sysfs_emit(buf, "0\n");
> Why are you changing the driver core for a single random, tiny set of
> devices?  The device code for those devices can handle this just fine,
> do NOT modify the driver core for each individual driver type, that way
> lies madness.
>
> This change is not ok, sorry.

OK, thanks for the comments. I will see if there is alternative way of 
doing it.

Cheers,
Longman


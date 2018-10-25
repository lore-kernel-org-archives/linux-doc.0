Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE9137D082
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Oct 2018 17:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727538AbeJZB5j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Oct 2018 21:57:39 -0400
Received: from mail-pf1-f172.google.com ([209.85.210.172]:42146 "EHLO
        mail-pf1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727441AbeJZB5j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Oct 2018 21:57:39 -0400
Received: by mail-pf1-f172.google.com with SMTP id f26-v6so4510082pfn.9
        for <linux-doc@vger.kernel.org>; Thu, 25 Oct 2018 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2GaJcUD57yp+xu643Er+nu4mLQXxAUd07WpnXZTcdmw=;
        b=AzjfKKN/yJlXtNf4bdvcUrcnc6DTeP6PT1kw1vxxIllV81kdSkkWM7qpOsZqtJa+V5
         NjyqC0QJ/ialFTpJZeaGLrbf40sOEZLoXiuTjBZn3L+jzH7bIUkGPg42BJTfy/DBrkvY
         mk1CdJItNX5XMicqtJPIAfoJYdefa3dhv2d/EZHAEoAAVomcV4+sH3g53OTj+yM49A+V
         YAMNBuv6dwhk/rVL99dPOYaOKOqjvnwKeQW9Ax6MBPrjfj+6k0d6l3n86l97JawxpBPR
         ayEGJiudqz6pUIpo5j09LPKkwadZgo1QjPcZFSjlXtRhOi0kzpLEolRR2OVnWAZgNe5a
         Q9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2GaJcUD57yp+xu643Er+nu4mLQXxAUd07WpnXZTcdmw=;
        b=YBWs0r0OILV4sancTowuG8mfnmBsi0JPDl8nXSfxQ3j8p9M2wQnm+AZAbrXsCQ+Xyo
         kCG99yg6XIhUP8zeMSxlCtzyiIhQ14CD2NmnW1fHwDhV2xt0QQKfRe+FIEOxINKKp2Rr
         s3WUBY1HazHqJxHlacWPG84PWHoH6DfhVsMh2ibRt0271gJw+Ts4eaiJK0Ni84GIeumP
         Ob0MS7L7s4J9b9oXzPb0A+OK97p7NcxcUNelyOnCgsKO+U9yBuQuOx2dNWkO6h9M2s1l
         gDwRolucGb7UtHi3mw032vO6ya9Mp9uc4jrhxZE97bSLcYLbe4wK/dE/EzjAcxZfM0Ek
         rvLg==
X-Gm-Message-State: AGRZ1gJUDNeUHVUq23FiKUvmftvJGxcxxK+ggrhYjs3kQR9+J6VJ+ULn
        Ri2MDWqZLHbI1dPmsD/m9enwYA==
X-Google-Smtp-Source: AJdET5eXM0ScZTeuKatwbUR8B1KdYpPLxvstL1/2wymkwgmGKddBoilabMczvIfGqnKMmmmT2vaPCw==
X-Received: by 2002:aa7:8252:: with SMTP id e18-v6mr123224pfn.164.1540488235349;
        Thu, 25 Oct 2018 10:23:55 -0700 (PDT)
Received: from paullawrence.mtv.corp.google.com ([2620:0:1000:1601:da51:dc8c:708a:5253])
        by smtp.gmail.com with ESMTPSA id x15-v6sm11822391pfd.27.2018.10.25.10.23.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Oct 2018 10:23:54 -0700 (PDT)
Subject: Re: [dm-devel] [RFC] dm-bow working prototype
To:     Mikulas Patocka <mpatocka@redhat.com>
Cc:     Alasdair Kergon <agk@redhat.com>,
        Mike Snitzer <snitzer@redhat.com>, linux-doc@vger.kernel.org,
        kernel-team@android.com, Jonathan Corbet <corbet@lwn.net>,
        linux-kernel@vger.kernel.org, linux-raid@vger.kernel.org,
        dm-devel@redhat.com, Shaohua Li <shli@kernel.org>
References: <20181023212358.60292-1-paullawrence@google.com>
 <20181023221819.GB17552@agk-dp.fab.redhat.com>
 <296148c2-f2d9-5818-ea76-d71a0d6f5cd4@google.com>
 <alpine.LRH.2.02.1810241514310.4080@file01.intranet.prod.int.rdu2.redhat.com>
From:   Paul Lawrence <paullawrence@google.com>
Message-ID: <4a934593-1bd1-be5f-35c0-945c42762627@google.com>
Date:   Thu, 25 Oct 2018 10:23:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1810241514310.4080@file01.intranet.prod.int.rdu2.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thank you for the suggestion. I spent part of yesterday experimenting 
with this idea, and it is certainly very promising. However, it does 
have some disadvantages as compared to dm-bow, if I am understanding the 
setup correctly:

1) Since dm-snap has no concept of the free space on the underlying file 
system any write into the free space will trigger a backup, so using 
twice the space of dm-bow. Changing existing data will create a backup 
with both drivers, but since we have to reserve the space for the 
backups up-front with dm-snap, we would likely only have half the space 
for that. Either way, it seems that dm-bow is likely to double the 
amount of changes we could make.

(Might it be possible to dynamically resize the backup file if it is 
mostly used up? This would fix the problem of only having half the space 
for changing existing data. The documentation seems to indicate that you 
can increase the size of the snapshot partition, and it seems like it 
should be possible to grow the underlying file without triggering a lot 
of writes. OTOH this would have to happen in userspace which creates 
other issues.)

2) Similarly, since writes into free space do not trigger a backup in 
dm-bow, dm-bow is likely to have a lower performance overhead in many 
circumstances. On the flip side, dm-bow's backup is in free space and 
will collide with other writes, so this advantage will reduce as free 
space fills up. But by choosing a suitable algorithm for how we use free 
space we might be able to retain most of this advantage.

I intend to put together a fully working prototype of your suggestion 
next to better compare with dm-bow. But I do believe there is value in 
tracking free space and utilizing it in any such solution.


On 10/24/2018 12:24 PM, Mikulas Patocka wrote:
>
> On Wed, 24 Oct 2018, Paul Lawrence wrote:
>
>> Android has had the concept of A/B updates for since Android N, which means
>> that if an update is unable to boot for any reason three times, we revert to
>> the older system. However, if the failure occurs after the new system has
>> started modifying userdata, we will be attempting to start an older system
>> with a newer userdata, which is an unsupported state. Thus to make A/B able to
>> fully deliver on its promise of safe updates, we need to be able to revert
>> userdata in the event of a failure.
>>
>> For those cases where the file system on userdata supports
>> snapshots/checkpoints, we should clearly use them. However, there are many
>> Android devices using filesystems that do not support checkpoints, so we need
>> a generic solution. Here we had two options. One was to use overlayfs to
>> manage the changes, then on merge have a script that copies the files to the
>> underlying fs. This was rejected on the grounds of compatibility concerns and
>> managing the merge through reboots, though it is definitely a plausible
>> strategy. The second was to work at the block layer.
>>
>> At the block layer, dm-snap would have given us a ready-made solution, except
>> that there is no sufficiently large spare partition on Android devices. But in
>> general there is free space on userdata, just scattered over the device, and
>> of course likely to get modified as soon as userdata is written to. We also
>> decided that the merge phase was a high risk component of any design. Since
>> the normal path is that the update succeeds, we anticipate merges happening
>> 99% of the time, and we want to guarantee their success even in the event of
>> unexpected failure during the merge. Thus we decided we preferred a strategy
>> where the device is in the committed state at all times, and rollback requires
>> work, to one where the device remains in the original state but the merge is
>> complex.
> What about allocating a big file, using the FIEMAP ioctl to find the
> physical locations of the file, creating a dm device with many linear
> targets to map the big file and using it as a snapshot store? I think it
> would be way easier than re-implementing the snapshot functionality in a
> new target.
>
> You can mount the whole filesystem using the "origin" target and you can
> attach a "snapshot" target that uses the mapped big file as its snapshot
> store - all writes will be placed directly to the device and the old data
> will be copied to the snapshot store in the big file.
>
> If you decide that rollback is no longer needed, you just unload the
> snapshot target and delete the big file. If you decide that you want to
> rollback, you can use the snapshot merge functionality (or you can write a
> userspace utility that does offline merge).
>
> Mikulas


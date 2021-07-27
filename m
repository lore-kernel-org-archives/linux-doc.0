Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6FEC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 21:14:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4EBA060F90
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 21:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232664AbhG0VOc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 17:14:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39188 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232255AbhG0VOb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 17:14:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627420471;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HTTYyPAE0g/if8d0gvKRc9AYw/duV58RDsVIEQdGHsg=;
        b=MmkBaBOuV1AUKpXcAGXaLo/TeoW4gQqCDymf0l637stY7WqPGA86SYbuh+wtcQ7hpYt7MT
        hUTp6iLOSanU7p/9clCUsJ64XRMc4aaHAO4uHlGU6ffxKiELIorxd9ypOLe7sYtp8sfOpx
        n04zqWTT+p13i3Tbjb2ksU5G5lD4PYQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-nAWj-hVBPy2YWE-pO-q-qg-1; Tue, 27 Jul 2021 17:14:29 -0400
X-MC-Unique: nAWj-hVBPy2YWE-pO-q-qg-1
Received: by mail-qv1-f71.google.com with SMTP id w10-20020a0cfc4a0000b0290335dd22451dso536108qvp.5
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 14:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=HTTYyPAE0g/if8d0gvKRc9AYw/duV58RDsVIEQdGHsg=;
        b=h4Tgs622cRWJH8ipHJNBSZqG6hFrSXVZc3bT6t9pxBlnqAI6JCV6k1Uf9E5s90IWO0
         O08O40nz9KAkZuW13SwU9sW5+pGY5K+QPxG06R4oQafhg7vmgTvLNpHWFmj1xaTmp6p6
         /FdZ0WMlt9XmNVLjm6kjaQt0hDoYD9UF4eazmw1BK+3Gq4MXirVmg5olstDR24Wp2g7t
         XAxyVFlcLZL+hQRqshPZAwQk32T3YDeNQacCSLeeyonT7QmOgsRIUxZOJqX2Qx8AQW0W
         8da81vZpgkACgB1AmnQ2XK+wOnGpnaMXuKmfEpEpx98xK9aM6DpL+rSa7Tgk0GKYa2cD
         Pm7w==
X-Gm-Message-State: AOAM531U+/k6KFCAIRIaZEBO7VXyYOGk5XL2j4hC2o09JsWYL0rkGMI0
        f3w+4crenRoh3iXbOJihvbDK51T5o2ICzzsYV1qYuxq78/4AVQe/1pxyJSQnyxd1BEF109izn5d
        0SGwMmD3KMeuj5lWJPGD2
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr4710208qkg.412.1627420469422;
        Tue, 27 Jul 2021 14:14:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz21PRLExOooxNoN1eIO3l2I/Tqj7X6DVLfqcyC+i2GacI9azNipKAbtqXgsR/XOpGArUqZBQ==
X-Received: by 2002:ae9:f30e:: with SMTP id p14mr4710180qkg.412.1627420469234;
        Tue, 27 Jul 2021 14:14:29 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id p22sm1908465qtq.64.2021.07.27.14.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 14:14:28 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 0/9] cgroup/cpuset: Add new cpuset partition type &
 empty effecitve cpus
To:     Tejun Heo <tj@kernel.org>
Cc:     Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Frederic Weisbecker <frederic@kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
References: <20210720141834.10624-1-longman@redhat.com>
 <YP9ChFvrGrDMGzbe@slm.duckdns.org>
Message-ID: <b2f49b2e-d5a4-1504-bd0c-0bd82943d855@redhat.com>
Date:   Tue, 27 Jul 2021 17:14:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP9ChFvrGrDMGzbe@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/26/21 7:17 PM, Tejun Heo wrote:
> Hello,
>
> On Tue, Jul 20, 2021 at 10:18:25AM -0400, Waiman Long wrote:
>> v3:
>>   - Add two new patches (patches 2 & 3) to fix bugs found during the
>>     testing process.
>>   - Add a new patch to enable inotify event notification when partition
>>     become invalid.
>>   - Add a test to test event notification when partition become invalid.
> I applied parts of the series. I think there was a bit of miscommunication.
> I meant that we should use the invalid state as the only way to indicate
> errors as long as the error state is something which can be reached through
> hot unplug or other uncontrollable changes, and require users to monitor the
> state transitions for confirmation and error handling.

Yes, that is the point of adding the event notification patch.

In the current code, direct write to cpuset.cpus.partition are strictly 
controlled and invalid transitions are rejected. However, changes to 
cpuset.cpus that do not break the cpu exclusivity rule or cpu hot plug 
may cause a partition to changed to invalid. What is currently done in 
this patchset is to add extra guards to reject those cpuset.cpus change 
that cause the partition to become invalid since changes that break cpu 
exclusivity rule will be rejected anyway. I can leave out those extra 
guards and allow those invalid cpuset.cpus change to go forward and 
change the partition to invalid instead if this is what you want.

However, if we have a complicated partition setup with multiple child 
partitions. Invalid cpuset.cpus change in a parent partition will cause 
all the child partitions to become invalid too. That is the scenario 
that I don't want to happen inadvertently. Alternatively, we can 
restrict those invalid changes if a child partition exist and let it 
pass through and make it invalid if it is a standalone partition.

Please let me know which approach do you want me to take.

Cheers,
Longman




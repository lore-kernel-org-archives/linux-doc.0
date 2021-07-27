Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64192C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 20:26:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4BDE360F9C
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 20:26:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhG0U0h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 16:26:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38381 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231916AbhG0U0g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 16:26:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627417595;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=14yyXo490T12NnJQD+zcubFFrNkcCdNPIIlyx7xSn8U=;
        b=FCeyBepd1lOeuzAS3lfmeLiw6vUCHYpymxLQIJRGKoGdZRC+P/wdFTMWyQFSQLZL4QuBos
        bIxtlX+CsfaKDdDWm0qalDSV2VEb8h6ojYEdwmmx0gzRRIX4W0N1FtB9pktukfZt1LKzbL
        beCL4sCBxo7yF+6jLgG1MV26bS6MFPg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-578-rIva9giUO02d0PnpKBJ1OQ-1; Tue, 27 Jul 2021 16:26:34 -0400
X-MC-Unique: rIva9giUO02d0PnpKBJ1OQ-1
Received: by mail-qk1-f197.google.com with SMTP id i15-20020a05620a150fb02903b960837cbfso15303qkk.10
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 13:26:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=14yyXo490T12NnJQD+zcubFFrNkcCdNPIIlyx7xSn8U=;
        b=moaDCZNNaJ2GLmap7Z14akt8ZRsBqD5ZDCr+7VNu9rE8SioIOyqHcBQyw44/84A/Mu
         xopnc8B5CGQfUAs+sFqlsEH6XtWn4BdU1IrODmhF+CE2+qt4qRD4ZXRSZCuiNiXi3fr2
         nATeTL6RBeS4Slr+GIeT9cKYSY/i643jqihegkLIxtUUiEE7aaKP6g+asKu7NC8z78Gn
         DKSJGumVvwl8RsLTF8xrIYNPZWeXdxbWnkCActCQzjwtAoZva/dVK5v3tcwOIJ1pLn7g
         CJlXA2aH05NsjiEa/+iYr9MEoZMPPDH+AK4XbsJszqAqn3qfISLv+msCVj+w6b36xn6q
         fcWQ==
X-Gm-Message-State: AOAM532ws5H744d4LjL4eSDjCBMyyjzn13djkSVqC8sLInN8X6jboY2A
        IlXc/rkpqbc/xwEPCSo0Gsq5v3NK6sBFMfjIG9TdPQTavCYZVePHf3oyLEZmdIbadRZVsSPlKvN
        zmXtmvZVKrMJ3q7JahAKz
X-Received: by 2002:a05:620a:22ad:: with SMTP id p13mr11842325qkh.378.1627417593659;
        Tue, 27 Jul 2021 13:26:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz0X7Wdw9Hoe/zftts1a4c+yW5GwWyHLqUOZDdF2Y/H8a1gqvebbvx75yzB1cm4Lc+fjTLBg==
X-Received: by 2002:a05:620a:22ad:: with SMTP id p13mr11842310qkh.378.1627417593498;
        Tue, 27 Jul 2021 13:26:33 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id b132sm2226831qkg.122.2021.07.27.13.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 13:26:32 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 4/9] cgroup/cpuset: Enable event notification when
 partition become invalid
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
 <20210720141834.10624-5-longman@redhat.com>
 <YP9BxKXfhaoTE+LO@slm.duckdns.org>
Message-ID: <8bed1ac2-f5f4-6d17-d539-4cd274b0f39e@redhat.com>
Date:   Tue, 27 Jul 2021 16:26:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YP9BxKXfhaoTE+LO@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/26/21 7:14 PM, Tejun Heo wrote:
> On Tue, Jul 20, 2021 at 10:18:29AM -0400, Waiman Long wrote:
>> +static inline void notify_partition_change(struct cpuset *cs,
>> +					   int old_prs, int new_prs)
>> +{
>> +	if ((old_prs == new_prs) ||
>> +	   ((old_prs != PRS_ERROR) && (new_prs != PRS_ERROR)))
>> +		return;
>> +	cgroup_file_notify(&cs->partition_file);
> I'd generate an event on any state changes. The user have to read the file
> to find out what happened anyway.
>
> Thanks.

 From my own testing with "inotify_add_watch(fd, file, IN_MODIFY)", 
poll() will return with a event whenever a user write to 
cpuset.cpus.partition control file. I haven't really look into the sysfs 
code yet, but I believe event generation will be automatic in this case. 
So I don't think I need to explicitly add a cgroup_file_notify() when 
users modify the control file directly. Other indirect modification may 
cause the partition value to change to/from PRS_ERROR and I should have 
captured all those changes in this patchset. I will update the patch to 
note this point to make it more clear.

Cheers,
Longman



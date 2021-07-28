Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C0DC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 16:28:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 615C76101B
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 16:28:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhG1Q2E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jul 2021 12:28:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27937 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229797AbhG1Q2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 12:28:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627489681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oVx/5yrmyZbbRVeN3LD+d66Q2FozCvKMMwaCU5JpwKA=;
        b=C8TkkbLtJNQFJzm7vuOth01N1hoMg0o0Hs8+2dm7BpdaI8dOJqXNDhrEA3SBMadh7Jwh/W
        lPwIwRsPDZSA32snFj1Bcb9EEFYnZKf0h78flfT2UnWWzerOSoKlOUmmgKM5TXw/JDZkc8
        RwAXJ7aDIw2Oj6fYt/TdD2tgTxNPJqE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-Qjr6vh4WMi-2RnJoceuHUw-1; Wed, 28 Jul 2021 12:28:00 -0400
X-MC-Unique: Qjr6vh4WMi-2RnJoceuHUw-1
Received: by mail-qt1-f199.google.com with SMTP id l24-20020ac872580000b029024e988e8277so1284387qtp.23
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 09:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oVx/5yrmyZbbRVeN3LD+d66Q2FozCvKMMwaCU5JpwKA=;
        b=um6UOvwIOwfG2aQXka9kE+an+/0MvGWYbKR3TLW1JDWD47SKuDJtMA/PxiAgW+U1PJ
         BhBMBSgRrfw9R66Eaa9QnIxtE7tqWmoTeGPBY/baXMwgpqYWWzF2KV7FeccmqxdVIUw7
         iC3Fbcie5G+rIn+IygN1QHCOyv10RwV1cTABCGSuBBJvq6QAh9DF7sKOlISboVhISxG2
         WZ00m/85tnmf4MHYZGVTkZCeug1jS2M16CcGg4wtVGsVlk683mlvJVLWSaznP3IeJYTd
         de6qFXisbk7IRbPyVsFO/PydJNRyAKlAEcu03Ism3opjktuADpOEiHhY4hoTARRktuRK
         Nk3g==
X-Gm-Message-State: AOAM531+qsQ1piBXqk91piTJCviFrc5ZqVpvmrzrUFV2/dfPjSzGwRfI
        R7R/UD7+ldB66YXJVnTchKynRu7fyx7Fp5v51HV+qnTHTT4T26rWwcKTG7/TVBT2qL/GrWZ6HBH
        uBRDP6gqHVAhfn+xprXam
X-Received: by 2002:a37:9244:: with SMTP id u65mr520011qkd.46.1627489680044;
        Wed, 28 Jul 2021 09:28:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZRqP37sqJcrPzK/iLTHBFFo1TykeaKOBzeN4NCV6nY6od2hic7g0uzGrV0SdRcBpcBj9h2w==
X-Received: by 2002:a37:9244:: with SMTP id u65mr519993qkd.46.1627489679827;
        Wed, 28 Jul 2021 09:27:59 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id p13sm236018qkk.87.2021.07.28.09.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 09:27:59 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 6/9] cgroup/cpuset: Add a new isolated cpus.partition
 type
To:     =?UTF-8?Q?Michal_Koutn=c3=bd?= <mkoutny@suse.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
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
        Marcelo Tosatti <mtosatti@redhat.com>
References: <20210720141834.10624-1-longman@redhat.com>
 <20210720141834.10624-7-longman@redhat.com>
 <20210728160900.GA8905@blackbody.suse.cz>
Message-ID: <f1afbd9e-d16b-c972-c3c0-022a05cec2a6@redhat.com>
Date:   Wed, 28 Jul 2021 12:27:58 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210728160900.GA8905@blackbody.suse.cz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 7/28/21 12:09 PM, Michal Koutný wrote:
> Hello Waiman.
>
> On Tue, Jul 20, 2021 at 10:18:31AM -0400, Waiman Long <longman@redhat.com> wrote:
>> @@ -2026,6 +2036,22 @@ static int update_prstate(struct cpuset *cs, int new_prs)
>> [...]
>> +	} else if (old_prs && new_prs) {
> If an isolated root partition becomes invalid (new_prs == PRS_ERROR)...
>
>> +		/*
>> +		 * A change in load balance state only, no change in cpumasks.
>> +		 */
>> +		update_flag(CS_SCHED_LOAD_BALANCE, cs, (new_prs != PRS_ISOLATED));
> ...this seems to erase information about CS_SCHED_LOAD_BALANCE zeroness.
>
> IOW, if there's an isolated partition that becomes invalid and later
> valid again (a cpu is (re)added), it will be a normal root partition
> without the requested isolation, which is IMO undesired.
>
> I may have overlooked something in broader context but it seems to me
> the invalidity should be saved independently of the root/isolated type.

PRS_ERROR cannot be passed to update_prstate(). For this patchset, 
PRS_ERROR can only be set by changes in hotplug. The current design will 
maintain the set flag (CS_SCHED_LOAD_BALANCE) and use it to decide to 
switch back to PRS_ENABLED or PRS_ISOLATED when the cpus are available 
again.

Cheers,
Longman


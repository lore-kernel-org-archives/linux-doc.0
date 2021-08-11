Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14775C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 18:46:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E31CE60E97
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 18:46:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhHKSqx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 14:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32036 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229802AbhHKSqw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 14:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628707588;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BOILZBJ0R4YxSBlomh5xiyJL3tlxmw5VR/2YYVBHfVY=;
        b=EwW1Lt7iXin0ZAb0YDhwtWWbqICvcow1T6t8TIqgeW3Ycfjhdzi922VTdJiwbiHaW0D6lo
        KiPxSoeE3+2kQIULIqK1c0ZlGxHafOYUwdeTAlxaUWRfdYSfAH699RDYx822sQBQX+OBvH
        pPP5DqI00Tuhdr0k0VS6u5M5lpUaEw0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-Efq3a9kDMKGp6f_8f21uCw-1; Wed, 11 Aug 2021 14:46:27 -0400
X-MC-Unique: Efq3a9kDMKGp6f_8f21uCw-1
Received: by mail-qt1-f198.google.com with SMTP id o19-20020a05622a0093b029029624b5db4fso1777136qtw.23
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 11:46:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=BOILZBJ0R4YxSBlomh5xiyJL3tlxmw5VR/2YYVBHfVY=;
        b=s9GVLLB1amjPklQjPQelj+OKkNEvwUBvh+Xhgs+0qWqydu5SuiTKrm5kXHWLei//QS
         0LXl/hlOz+UX5fkddPrzOEgyVc1AJ8VIetTv7qn4i3UDbVP2G4PfrQ3hRJg7LJ8somIA
         DAmpFa84RCpyBSJM1EYxNIX8Xn7TNqWnnmTBp8FRdJMh+3iS6YlTZ5g55NZ2NjiGt8Na
         VrTRBVI+g0t8EQOW44Vg2f1jLUg5z+YsNWCJQvPTOJXn7lsjAkd3K7+tjeZX8cLtwUPD
         ikO1ScXCsK2y/RTp75CXwvkmgnkdiYBHuqi4jEspaOBk566WlFYN8jKat+cKiElkWiWv
         /wXQ==
X-Gm-Message-State: AOAM5321aMCTr5VLnsoUt1QxJz2Rm7quwe7oGTP564/wMDLJPBASopg2
        Gg4mToJPIPsWXPav9odEY4GNVsvg5QczJ2ghZugnngG6yEmjMBU5QBJCsy9rAStphQe/o3gjGFV
        6eAe0I2GSFP1LHxqb/hz6
X-Received: by 2002:ac8:47d9:: with SMTP id d25mr123622qtr.247.1628707586781;
        Wed, 11 Aug 2021 11:46:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc+HweGCSjMpjaJcpagiM7+c0ZCQmmIkZOMJU7you99awb+4aUS28VxuYA6K2SQkpFfVwoCg==
X-Received: by 2002:ac8:47d9:: with SMTP id d25mr123604qtr.247.1628707586605;
        Wed, 11 Aug 2021 11:46:26 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id s69sm12744271qka.102.2021.08.11.11.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 11:46:25 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 4/6] cgroup/cpuset: Allow non-top parent partition root
 to distribute out all CPUs
To:     Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>
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
References: <20210811030607.13824-1-longman@redhat.com>
 <20210811030607.13824-5-longman@redhat.com>
 <YRQTTf+bJZ8f3O3+@slm.duckdns.org>
 <abfa6f2f-aa13-f18e-5a16-f568082d07bc@redhat.com>
 <YRQVFkNX5DcKixzy@slm.duckdns.org>
Message-ID: <ef02d96b-325c-87f6-a6a3-d840feefef24@redhat.com>
Date:   Wed, 11 Aug 2021 14:46:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRQVFkNX5DcKixzy@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/11/21 2:21 PM, Tejun Heo wrote:
> On Wed, Aug 11, 2021 at 02:18:17PM -0400, Waiman Long wrote:
>> I don't think that is true. A task can reside anywhere in the cgroup
>> hierarchy. I have encountered no problem moving tasks around.
> Oh, that shouldn't be happening with controllers enabled. Can you please
> share a repro?

I have done further testing. Enabling controllers won't prohibit moving 
a task into a parent cgroup as long as the child cgroups have no tasks. 
Once the child cgroup has task, moving another task to the parent is not 
allowed (-EBUSY). Similarly if a parent cgroup has tasks, you can't put 
new tasks into the child cgroup. I don't realize that we have such 
constraints as I usually do my testing with a cgroup hierarchy with no 
tasks initially. Anyway, a new lesson learned.

I will try to see how to address that in the patch, but the additional 
check added is still valid in some special case.

Cheers,
Longman






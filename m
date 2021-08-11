Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34259C432BE
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 18:19:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19B2361077
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 18:19:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbhHKSTd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 14:19:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41820 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229946AbhHKSTc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 14:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628705948;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ANzdLIOaIJbxnr8pVh5jQkoQ6kMweZt9tE4el1kTVKE=;
        b=Bz/Go6X0ygVjsyOErv3mQMjBt0xevFutupCoiTowmt3wlFRFFeVGEx/hELvR8hCS1XuTGv
        Goon8oRvFKb4laJZXCbr18qUYzbiYt7e5pxjkfycX0edbVYrHMchbOZiMCKuqJISpTZSe4
        J905Ip3gyZlMkoYakXj24FLeB5x0X20=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-SDfOPdpmOl2G_gvya-h4yA-1; Wed, 11 Aug 2021 14:19:07 -0400
X-MC-Unique: SDfOPdpmOl2G_gvya-h4yA-1
Received: by mail-qk1-f197.google.com with SMTP id s206-20020a3745d70000b02903b9207abc7bso1885657qka.4
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 11:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ANzdLIOaIJbxnr8pVh5jQkoQ6kMweZt9tE4el1kTVKE=;
        b=VzREYuUu+Q6ROD2lGI63WbkI7fAPpEy2ped+xGd2Cstszj+pvMsG7oHKll4oHtoTp1
         oZVzm4/g9YQNXTzkTWkbfvQldfb1MtoYE/qX/tsP6bLyI2eiEE80l9lpXqxG+ibRXQyC
         wlA2Pqe3CyIXVBVoSUBzuAW4tSUJaNeafBfyXYYnYfQ8fd1majRH8BOcJJFVkYocuNLu
         gEY7wRrr8ZpCaTmK+ByMDxWhAMiS8hP2VshIRjcK2+0Jxs17IHwNnGlJEpbA0nY6adtm
         PTvKdDF0Zr2q4DeiNRCJ6ZDc1B/jkVT4YBDChnxlhMQZTf1LAAuVDS1fR2Ttsu+6Bx0k
         LF7A==
X-Gm-Message-State: AOAM533nib3nZl4h28DqHKgmTDmpQv8WmRQK+I1IYMbVWD7LDh0q9KBA
        XZXQ8fRJlXi+j7XxzalmLS6Ck4H0u420fRvlvMIy5stBoNt6qX4GLn/PEvVbNqFSlnVrfcg7qE0
        K6O8qYkxbWIkEHb/EMzfE
X-Received: by 2002:a05:620a:b4f:: with SMTP id x15mr326535qkg.436.1628705946987;
        Wed, 11 Aug 2021 11:19:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyItQRa+ugH8/MfKjbw8BhyNTooZz1XicdSsFFEontpDk1YQ4tO1FOw+vSvhWCsxBi7gnVOSQ==
X-Received: by 2002:a05:620a:b4f:: with SMTP id x15mr326513qkg.436.1628705946825;
        Wed, 11 Aug 2021 11:19:06 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id m197sm13035877qke.54.2021.08.11.11.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 11:19:06 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v4 5/6] cgroup/cpuset: Update description of
 cpuset.cpus.partition in cgroup-v2.rst
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
References: <20210811030607.13824-1-longman@redhat.com>
 <20210811030607.13824-6-longman@redhat.com>
 <YRQTy7eo5jOlHTc6@slm.duckdns.org>
Message-ID: <26180e1d-1fa9-f175-66f8-297cf0685a11@redhat.com>
Date:   Wed, 11 Aug 2021 14:19:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YRQTy7eo5jOlHTc6@slm.duckdns.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 8/11/21 2:15 PM, Tejun Heo wrote:
> Hello,
>
> On Tue, Aug 10, 2021 at 11:06:06PM -0400, Waiman Long wrote:
>> +	Poll and inotify events are triggered whenever the state
>> +	of "cpuset.cpus.partition" changes.  That includes changes
>> +	caused by write to "cpuset.cpus.partition" and cpu hotplug.
>> +	This will allow a user space agent to monitor changes caused
>> +	by hotplug events.
> It might be useful to emphasize that this is the primary mechanism to
> signify errors and thus should always be monitored.

Sure, will do that in the next version.

Cheers,
Longman


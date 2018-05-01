Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BBE3E7E6A8
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 May 2018 20:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751029AbeEAU6d (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 May 2018 16:58:33 -0400
Received: from mail-yb0-f194.google.com ([209.85.213.194]:42843 "EHLO
        mail-yb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750780AbeEAU6c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 May 2018 16:58:32 -0400
Received: by mail-yb0-f194.google.com with SMTP id 140-v6so4566295ybc.9;
        Tue, 01 May 2018 13:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WvhHY4fPhryLktWbybz763iqvA13BRrsRv4zb9q1pvo=;
        b=lD0D5OR/d91PrZMHD8zAp5N6a0z5HHjHB91JxDSnEQmZxaacCcqdH2HKO5IU7W7FQO
         jc84LP+D/0qjCn/BPpQwL18B3ApvtjHgQuDT/oZiUl5EtidhgePdkEttSLB9UiETkju2
         8VnsH8MQ3jwIQwxaPAC3aW8sndN7hOGAR59dJrAp/p6agzK5YvHP/E0U8Jy/cn5QOAeP
         H8+cFB5zoMKGccs4lc/LtoKNmG4+2P4tsWRr/WL6Hf8hPgMBP0HXSyDYu7Q7gQIOkjmT
         4hWGx5h+7GoD5pxiwvJgFFrOD0Vl2z2nT3zqLLMzcHl7dpok2uHxtnyN/z2ZgYGKQbZw
         OTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=WvhHY4fPhryLktWbybz763iqvA13BRrsRv4zb9q1pvo=;
        b=C7kav3O4x/zxjxC66KMfWqA1i0tYNQ3A/iFlC1jk2NMt1R2fda4smvV+XLsWp7s008
         bDbVPd/xQPrqSVdvjXh0OItv45KQNYIqWzigFw/eHqV5hbdYdLEYlnCYnNkXqzECWDOW
         bXrZW7ziIuGC0VQdiKrvIaDCBIu7LCfif5MyyUb37+4TcZytJGFFhVf1IyEeefDrB+dG
         4NR7qX7DryiVwkaMHwb5W9lU7anD/fa1Wnz/tes/047kZnnzr5djccFHhYUtJRweYOWC
         5L5g1O3Dxy2gU2Wh+75Elm3kIDPtzOhYUBzpv/J5+4LqspLXxTA7YaAvGGOmDwzoNUww
         hW9g==
X-Gm-Message-State: ALQs6tCTcJTzH0yALfxCiw7RrlrDQprTOQBTMkxo2p8Ir+L9xDX/4prn
        P5OU4e1W4ca32n0oITYQ7B4=
X-Google-Smtp-Source: AB8JxZprzz5pAV/qOlXBTG1S3jyKEikDu+GL2h6AK9t0wKDHKVZpOMXWi/HU2/yckiqDljxaeQSCBg==
X-Received: by 2002:a25:844a:: with SMTP id r10-v6mr10781164ybm.359.1525208311358;
        Tue, 01 May 2018 13:58:31 -0700 (PDT)
Received: from localhost ([2620:10d:c091:180::1:8270])
        by smtp.gmail.com with ESMTPSA id n125-v6sm4750563ywc.78.2018.05.01.13.58.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 May 2018 13:58:30 -0700 (PDT)
Date:   Tue, 1 May 2018 13:58:28 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>
Subject: Re: [PATCH v7 4/5] cpuset: Restrict load balancing off cpus to
 subset of cpus.isolated
Message-ID: <20180501205828.GD2368884@devbig577.frc2.facebook.com>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <1524145624-23655-5-git-send-email-longman@redhat.com>
 <20180501195148.GC2368884@devbig577.frc2.facebook.com>
 <9eb2c45e-e71e-61ef-aa6d-b8124b739cdf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9eb2c45e-e71e-61ef-aa6d-b8124b739cdf@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Tue, May 01, 2018 at 04:33:45PM -0400, Waiman Long wrote:
> I think that will work too. We currently don't have a flag to make a
> file visible on first-level children only, but it shouldn't be hard to
> make one.

I think it'd be fine to make the flag file exist on all !root cgroups
but only writable on the first level children.

> Putting CPUs into an isolated child cpuset means removing it from the
> root's effective CPUs. So I would probably like to expose the read-only
> cpus.effective in the root cgroup so that we can check changes in the
> effective cpu list.

Ah, yeah, that makes sense.

> I will renew the patchset will your suggestion.

Thank you very much.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

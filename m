Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 088567D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 15:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755507AbeEaP6M (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 11:58:12 -0400
Received: from mail-yb0-f195.google.com ([209.85.213.195]:46357 "EHLO
        mail-yb0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755482AbeEaP6L (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 11:58:11 -0400
Received: by mail-yb0-f195.google.com with SMTP id p22-v6so7743822yba.13;
        Thu, 31 May 2018 08:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PeHIUM/NvwMmnt5Vl7G4HiWmr/MfhgxiD46i1pzuC0s=;
        b=h3bXsE/EpbqVMBY3OJ61srzo3zWOM6kIw/fyCt6EKGaGyqMhif69oPLYN1HV/a2L0+
         IkescC+VZ03nPVa93+BXZ4pBsjxDfmi0ONxw01nDbhcJcZfjo/Ah3yYS18CjK4cRdIaR
         MmE3yZX4ipykdwB96v1089WJHJQ7RCmp2lk6vflPjASkAZVJ7mYj7Lt0D8gEetuYy0UZ
         4BYEoVzdpd40n1q00YdlsOvDu6D6zYR2+FzVjCXf6dL8AofbMnHx9Kfkr58/UkPaaxuM
         Pj1mTmkdhYUi2BXMLyHd9AyOxukMZYajNz5qX/dT6kW5tJhxlsDbi0pkxaP4bp0/dLN8
         WJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=PeHIUM/NvwMmnt5Vl7G4HiWmr/MfhgxiD46i1pzuC0s=;
        b=uhzNV1cgAMSLdbcy4FZhyAZu84vnFswHJnZRdK9LRlFywySGzr4ICk0YO1ItWs5yY9
         +v6EmHnmBJMkfq0Sfz25IGOzLHqpJYY64AHceWAzsqtXa3MIEA5vMXdNJimsaoIBoZ+w
         TjM0E7Dc+fon2Zu/1PBBr2VIz/BfvVTFDDRMkTOv3h3j0XyaWyAb8mA5gJAQD2B90c0p
         ySANru+BolI1JHdhI2JTmKEG0LyeRrqmcUgYGqgNO+iPOH6kDeh5AG2/9Vz68C1SpQIC
         rrJPegpu5zDyPrNxVfYueKi15FzAWTIEycEdATGPzvovTB309AAA6P4dYJk+kimS0obI
         8aJQ==
X-Gm-Message-State: ALKqPwdcZDCbXeupivCFmrZBMaJGLCwDjTjweBonkR5sF7aSyPraRdPF
        JNNl4TzwiCiVEvINnUkTeU8=
X-Google-Smtp-Source: ADUXVKL1YNC5cZ9o8cDVjAPgtN22pTU3n/4dusHsZvUaSWl2/rj2l8VJHYAuc0NSS7TRoVKrj7mTmg==
X-Received: by 2002:a25:3108:: with SMTP id x8-v6mr4291067ybx.519.1527782290239;
        Thu, 31 May 2018 08:58:10 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::3:bd3d])
        by smtp.gmail.com with ESMTPSA id h5-v6sm8250832ywe.28.2018.05.31.08.58.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 May 2018 08:58:08 -0700 (PDT)
Date:   Thu, 31 May 2018 08:58:07 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Zefan Li <lizefan@huawei.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH] cpuset: Enforce that a child's cpus must be a subset of
 the parent
Message-ID: <20180531155807.GU1351649@devbig577.frc2.facebook.com>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
 <5B0F4F09.9050100@huawei.com>
 <5B0FAE72.1090204@huawei.com>
 <20180531082613.GF12180@hirez.programming.kicks-ass.net>
 <5B0FB58C.9030705@huawei.com>
 <4dc718bc-4bd5-4998-853b-9c6ba67b89a0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4dc718bc-4bd5-4998-853b-9c6ba67b89a0@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Thu, May 31, 2018 at 09:22:23AM -0400, Waiman Long wrote:
> >>>>> As the intersection of g11's cpus and that of g1 is empty, the effective
> >>>>> cpus of g11 is just that of g1. The check in update_cpumask() is now
> >>>>> corrected to make sure that cpus in a child cpus must be a subset of
> >>>>> its parent's cpus. The error "write error: Invalid argument" will now
> >>>>> be reported in the above case.
> >>>>>
> >>>> We made the distinction between user-configured CPUs and effective CPUs
> >>>> in commit 7e88291beefbb758, so actually it's not a bug.
> >>>>
> >>> I remember the original reason is to support restoration of the original
> >>> cpu after cpu offline->online. We use user-configured CPUs to remember
> >>> if the cpu should be restored in the cpuset after it's onlined.
> >> AFAICT you can do that and still have the child a subset of the parent,
> >> no?
> >> .
> > Sure. IIRC this was suggested by Tejun as he had done something similar to devcgroup.
> >
> OK, let wait until Tejun has time to chime in. For me, it just look
> weird to be able to do that.
> 
> Another corner case that is not handled is when cpus_allowed is empty.
> In this case, it falls back to the parent's effective cpus. On the other
> hand, it can also be argued that an empty cpus_allowed is a transient
> state and a cpuset shouldn't have cpus undefined while creating children.

Tying together what's configured and what's applied may feel
attractive on the surface but it's a long term headache.

* It's inconsistent with what other controllers are doing.  All the
  limit resource configs declare the upper bound the specific cgroup
  can consume regardless of what's actually available to it.  They
  limit but don't guarantee access.

* Which decouples a given cgroup's configurations from its ancestors',
  which allows an ancestor to take away resources that it granted
  before and then also giving it back later.  No matter what you do,
  if you couple configs of cgroup hierarchy, you end up restricting
  what an ancestor can do to its sub-hierarchy, which can quickly
  become a difficult operational headache.

So, let's please stay away from it even if that means a bit of
overhead in terms of interface.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

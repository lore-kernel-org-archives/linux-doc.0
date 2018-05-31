Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5FAD97D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 16:19:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932714AbeEaQTq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 12:19:46 -0400
Received: from mail-yw0-f195.google.com ([209.85.161.195]:33808 "EHLO
        mail-yw0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932710AbeEaQTp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 12:19:45 -0400
Received: by mail-yw0-f195.google.com with SMTP id b125-v6so4390667ywe.1;
        Thu, 31 May 2018 09:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=iXsud8AO/VqPMP/AUI6IhoSYiSKrR2rIe4R3EMYxks8=;
        b=I1wD6JR/fg78umobxEsQSa/wh4sKp9DwYzSCEkFiLV7TUTM0UhIn0CsfOcXpPXyryj
         ITajAI2mLRooBLku3CeTLiw0hpuDwmgs+pjbWU8CyS7JsVAT2po2UNVLD0n+OIgdn59J
         nYma4et5+pklxkZzMS9paLVAoU6NkHp+F5owp1nEruNJdfDxhIv0ToDYzpPjI807v6Qw
         IVQT4D9KxLWXrPA8EF/cI73kQODdarKAQwf2UFB4oRV46+TMc0bCs87iIjfZSu8Ipd9r
         BKo98jyPQlkVuhBBghHuqTvhxa48Ncl1EBrwutTj9v6JxEC7MiJ6ejrhzlVJMk6Uk7nK
         q4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=iXsud8AO/VqPMP/AUI6IhoSYiSKrR2rIe4R3EMYxks8=;
        b=iHMYrbcyDIdt768BHH+1N2SaR6aGAGmTiUK/vWnG7eqlYg6rw6BqF4XnDHvvN+Djr2
         JHZ+2ZRBdPnj+xNh5V/23U53au56an7gBpo78zhjyI5yjEz1NmrMJqD3cvEs17X8GMZN
         2Rm1OZFX6j5ldPPxD5671UnrmS6zmuFn7QkteMPA3XcQHMeZHAYXx85QNKvkpTBu7uGH
         UCCM0nlZdNZTJp9AqZfWFyvUruLsuUNtF6zwp1o8zlRybrVeS9uxPiKRAx5LmAref/ct
         acmhTLuaWz88R7LsWVcv6dbVC/WS/6Y+lDH1ng7nTdWZoVsqBol2tOjvXvaYmo3hNLJR
         NVgw==
X-Gm-Message-State: ALKqPwfOOw0jwRjdwdsRW5pVwCnPdL1lroaaY15UWgEiX6JwaicOHzd/
        vOtFDl6FlxcLnPtzz+Ze60Y=
X-Google-Smtp-Source: ADUXVKJTMohDSqvMI8SwfRnPqYYitonBefnZ7ZlvIFfMsh/H4l15uZ2/1Okdui90kEykr/FN8mtomQ==
X-Received: by 2002:a81:7b0a:: with SMTP id w10-v6mr4057231ywc.70.1527783584749;
        Thu, 31 May 2018 09:19:44 -0700 (PDT)
Received: from localhost ([2620:10d:c091:200::3:bd3d])
        by smtp.gmail.com with ESMTPSA id v141-v6sm7527435ywc.65.2018.05.31.09.19.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 May 2018 09:19:43 -0700 (PDT)
Date:   Thu, 31 May 2018 09:19:42 -0700
From:   Tejun Heo <tj@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Waiman Long <longman@redhat.com>, Zefan Li <lizefan@huawei.com>,
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
Message-ID: <20180531161942.GW1351649@devbig577.frc2.facebook.com>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
 <5B0F4F09.9050100@huawei.com>
 <5B0FAE72.1090204@huawei.com>
 <20180531082613.GF12180@hirez.programming.kicks-ass.net>
 <5B0FB58C.9030705@huawei.com>
 <4dc718bc-4bd5-4998-853b-9c6ba67b89a0@redhat.com>
 <20180531155807.GU1351649@devbig577.frc2.facebook.com>
 <20180531161645.GN12180@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180531161645.GN12180@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Thu, May 31, 2018 at 06:16:45PM +0200, Peter Zijlstra wrote:
> > So, let's please stay away from it even if that means a bit of
> > overhead in terms of interface.
> 
> Urgh, that again :/

Yeah, well, it's pretty important.

> I'm still not convinced by your arguments though. The root container can
> access all the sub-groups anyway and can grub around in them to take
> away resources if it really wants to.

That's really messy and if you delegated away a subtree, you can't
walk the subtree in a race free way, not easily anyway.

> For cpuset in particular randomly restricting on the ancestor level can
> create an unrecoverable trainwreck inside a container. Affinities are
> not recoverable. Once a runnable task ends up with an empty set, its
> affinities are reset and the smaller (empty) set is lost.

Yeah, for cpuset, it's messier, but it isn't different from hotunplug
scenario, right?  I think the best we can do there is putting ancestor
operation on an equal footing as hotplug ops.

Thanks.

-- 
tejun
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

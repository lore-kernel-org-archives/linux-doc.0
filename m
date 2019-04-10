Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 198207D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 21:38:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfDJVi2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 17:38:28 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:43526 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbfDJVi2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 17:38:28 -0400
Received: by mail-wr1-f67.google.com with SMTP id k17so4624297wrx.10
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2019 14:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=LOxvXqKFPj3MVMl61HzHsAJfIq2rKeT4Ruwa8q/szlk=;
        b=IuGLqpYW78+nQWkej9wKStxCq8RIIrHjSMDS6OyqdFFNNxekxJhF89osk20TuKhrEO
         MElGo2FWORrNdRRerXLqjoT6MJkaWwt2JRoVTuFYipzOQEPGknG5meN37wEVLWBVLpAF
         x5IlPyQE3C1AOSQ8B1VRa/tpNetbiGbUNZFEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LOxvXqKFPj3MVMl61HzHsAJfIq2rKeT4Ruwa8q/szlk=;
        b=PJcDduSVd/H7msfRj3YsNtUs2Gst3Q92G9TuCSXhJyQv4/QNIF5DVwGXcK+Elz1qju
         0IHraENApCKKljCPQ/UkGOXXX0sWqGWl1X4YFkrMfItSzAe6Gu1jQcoCFA7xmDJlTlKI
         sN9NP3GCseBba4wP/L9g6BSyjsQ5hRCY571PSko2oYUqcRA1KdSfjZI0CefduZFO5y2I
         wZ+qfQ04oBf1kYMucqhwakdRWhn9BmsYs8CtTr492ERdN3yvtd87sSfWe3ixQ9Y3vNov
         OQ4oDmuD6wzdkROY19qC3RuQbX3fayogCXRo85+WosM9Q6JaNqKVm8W7j1PEQVKVUIbL
         tSkg==
X-Gm-Message-State: APjAAAVipxWCcDFMZuA2u83jYnegI1IQyoF8xji/lCXLa7id6QWQApc7
        g7I2tEwffhktcd47OYdUSzCNig==
X-Google-Smtp-Source: APXvYqzYK41wa+yBABjfRn4lLJk4EEpjyQYNII3AdqhtAf0gjYSQko7bu1DksvIQIi7STAbWZb8KZw==
X-Received: by 2002:adf:ea81:: with SMTP id s1mr7852347wrm.277.1554932306536;
        Wed, 10 Apr 2019 14:38:26 -0700 (PDT)
Received: from localhost ([2a01:4b00:8432:8a00:56e1:adff:fe3f:49ed])
        by smtp.gmail.com with ESMTPSA id j11sm49008948wrw.85.2019.04.10.14.38.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Apr 2019 14:38:25 -0700 (PDT)
Date:   Wed, 10 Apr 2019 22:38:24 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>,
        Shakeel Butt <shakeelb@google.com>,
        Kirill Tkhai <ktkhai@virtuozzo.com>,
        Aaron Lu <aaron.lu@intel.com>
Subject: Re: [RFC PATCH 0/2] mm/memcontrol: Finer-grained memory control
Message-ID: <20190410213824.GA13638@chrisdown.name>
References: <20190410191321.9527-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190410191321.9527-1-longman@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Waiman,

Waiman Long writes:
>The current control mechanism for memory cgroup v2 lumps all the memory
>together irrespective of the type of memory objects. However, there
>are cases where users may have more concern about one type of memory
>usage than the others.

I have concerns about this implementation, and the overall idea in general. We 
had per-class memory limiting in the cgroup v1 API, and it ended up really 
poorly, and resulted in a situation where it's really hard to compose a usable 
system out of it any more.

A major part of the restructure in cgroup v2 has been to simplify things so 
that it's more easy to understand for service owners and sysadmins. This was 
intentional, because otherwise the system overall is hard to make into 
something that does what users *really* want, and users end up with a lot of 
confusion, misconfiguration, and generally an inability to produce a coherent 
system, because we've made things too hard to piece together.

In general, for purposes of resource control, I'm not convinced that it makes 
sense to limit only one kind of memory based on prior experience with v1. Can 
you give a production use case where this would be a clear benefit, traded off 
against the increase in complexity to the API?

>For simplicity, the limit is not hierarchical and applies to only tasks
>in the local memory cgroup.

We've made an explicit effort to make all things hierarchical -- this confuses 
things further. Even if we did have something like this, it would have to 
respect the hierarchy, we really don't want to return to the use_hierarchy 
days where users, sysadmins, and even ourselves are confused by the resource 
control semantics that are supposed to be achieved.

>We have customer request to limit memory consumption on anonymous memory
>only as they said the feature was available in other OSes like Solaris.

What's the production use case where this is demonstrably providing clear 
benefits in terms of resource control? How can it compose as part of an easy to 
understand, resource controlling system? I'd like to see a lot more information 
on why this is needed, and the usability and technical tradeoffs considered.

Thanks,

Chris

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D6EF87D071
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Jul 2018 03:59:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726357AbeGQEaC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Jul 2018 00:30:02 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:46073 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727600AbeGQEaB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Jul 2018 00:30:01 -0400
Received: by mail-pf0-f194.google.com with SMTP id i26-v6so15930578pfo.12
        for <linux-doc@vger.kernel.org>; Mon, 16 Jul 2018 20:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:in-reply-to:message-id:references
         :user-agent:mime-version;
        bh=jHrn07gzUHpPm2gCNFENX79CHktkBI6qepWDsVP0Uus=;
        b=XoPJvAq+l///furXh85SaohAqcdI78JfNcRHBgsKmPsXPUbpxyI+x3AAxYNwBA1AJs
         tvRatX9Kb8QbqcQKXZr/+J31ePgM+9ge+yJvTqQcN31AI2Dk8yBgeWUcMykpaB8hqeje
         C1uGNlJ/Z/SAT5CLwddSvb4ucdXjdYucR9+x/ssV4VSUY0CiVf3hEWrUoLUMJbKyddj1
         ulc45SpFASY+c9J4DcUABAcpl52kdalJXtugAivpZVY+ohh5JJsbA1C3R7h85cf5B0SL
         5F3OkkpwdHocoZ26+amAybJzyr7HsaiZV0iTNJiQtARQ/TAjcuxQh7ZUOC0cIkFHuBZX
         fCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
         :references:user-agent:mime-version;
        bh=jHrn07gzUHpPm2gCNFENX79CHktkBI6qepWDsVP0Uus=;
        b=AwV8B/IQatu+IQjk/9mAKIQtNNeY4O4i7cjGlX4T7taET3qMV585p14Ncslm+6lhgQ
         /4HdDVTMxLKqwSa2Rg7qhRgst6ghBS/o6HN06OBxBh4Dtijegn2FKnc/598eKaP+I9W5
         wLL8AvnJRZP2gc123005/Clc5SkdEHii99TOv+WHkVlzK80y1zbkbjKIzwbEm+qL9Pis
         kFVDXLsaq0TCwL/5ljvnzWOSuz0bdF+9tEbTYGFxsswDl7zxJLGHJIg+FcATSEYE6vN3
         6UTz8mC2hbbbu/G4HITfNh1L8wFBH0ApX6MP89xWkzFpaC0aHNHUY213e2HsPEPehg8v
         auxA==
X-Gm-Message-State: AOUpUlGH5fIqTQfpak0gvG1myWlw1/xvojAyJEpDTj7diBYU/H/CltE+
        yN83QEq/S2fRszK/7xJJaSJGaA==
X-Google-Smtp-Source: AAOMgpc5wGqRnoOTW5yTndz6rsv0E8KWGbFM33XbwbO1oakrsHHKCiLxOh02fGjroebT99x7jAZUEQ==
X-Received: by 2002:a62:a312:: with SMTP id s18-v6mr20364092pfe.13.1531799971029;
        Mon, 16 Jul 2018 20:59:31 -0700 (PDT)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598] ([2620:15c:17:3:3a5:23a7:5e32:4598])
        by smtp.gmail.com with ESMTPSA id x2-v6sm70440085pfi.166.2018.07.16.20.59.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jul 2018 20:59:30 -0700 (PDT)
Date:   Mon, 16 Jul 2018 20:59:29 -0700 (PDT)
From:   David Rientjes <rientjes@google.com>
X-X-Sender: rientjes@chino.kir.corp.google.com
To:     Michal Hocko <mhocko@kernel.org>
cc:     Roman Gushchin <guro@fb.com>, linux-mm@vger.kernel.org,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tejun Heo <tj@kernel.org>, kernel-team@fb.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v13 0/7] cgroup-aware OOM killer
In-Reply-To: <20180716093630.GJ17280@dhcp22.suse.cz>
Message-ID: <alpine.DEB.2.21.1807162053190.157949@chino.kir.corp.google.com>
References: <20171130152824.1591-1-guro@fb.com> <20180605114729.GB19202@dhcp22.suse.cz> <alpine.DEB.2.21.1807131438380.194789@chino.kir.corp.google.com> <20180716093630.GJ17280@dhcp22.suse.cz>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Jul 2018, Michal Hocko wrote:

> Well, I didn't really get to your patches yet. The last time I've
> checked I had some pretty serious concerns about the consistency of your
> proposal. Those might have been fixed in the lastest version of your
> patchset I haven't seen. But I still strongly suspect that you are
> largerly underestimating the complexity of more generic oom policies
> which you are heading to.
> 

I don't believe it's underestimated since it's used.  It's perfectly valid 
the lock an entire hierarchy or individual subtrees into a single policy 
if that's what is preferred.  Any use of a different policy at a subtree 
root is a conscious decision made by the owner of that subtree.  If they 
prefer to kill the largest process, the largest descendant cgroup, or the 
largest subtree, it is up to them.  All three have valid usecases, the 
goal is not to lock the entire hierarchy into a single policy: this 
introduces the ability for users to subvert the selection policy either 
intentionally or unintentionally because they are using a unified single 
hierarchy with cgroup v2 and they are using controllers other than mem 
cgroup.

> Considering user API failures from the past (oom_*adj fiasco for
> example) suggests that we should start with smaller steps and only
> provide a clear and simple API. oom_group is such a simple and
> semantically consistent thing which is the reason I am OK with it much
> more than your "we can be more generic" approach. I simply do not trust
> we can agree on sane and consistent api in a reasonable time.
> 
> And it is quite mind boggling that a simpler approach has been basically
> blocked for months because there are some concerns for workloads which
> are not really asking for the feature. Sure your usecase might need to
> handle root memcg differently. That is a fair point but that shouldn't
> really block containers users who can use the proposed solution without
> any further changes. If we ever decide to handle root memcg differently
> we are free to do so because the oom selection policy is not carved in
> stone by any api.
>  

Please respond directly to the patchset which clearly enumerates the 
problems with the current implementation in -mm.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

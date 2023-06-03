Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4272FC77B7A
	for <linux-doc@archiver.kernel.org>; Sat,  3 Jun 2023 21:33:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbjFCVdz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Jun 2023 17:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjFCVdy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Jun 2023 17:33:54 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23F4CF5
        for <linux-doc@vger.kernel.org>; Sat,  3 Jun 2023 14:33:53 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5149c76f4dbso5083977a12.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Jun 2023 14:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1685828031; x=1688420031;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPgdBuOb3Mk3v1wiPzP0vcApMpycUA28Au999GkAKxA=;
        b=D3Y8+UlBvD28MImoMBw8EQN27ymlp+CpIHs8DUTXSuWC/2z4HjNVGgQw6xlaEWYl7y
         tBzUH8yq2WdHoBJBJCMkaXOabLKHqgpvAvXB+x2Lq/oldMQ6qb87FFv3ro42Gx3wP4+p
         Sf398UgV54hGA+VSakDaldq+PoP4qE3KtkEIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685828031; x=1688420031;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPgdBuOb3Mk3v1wiPzP0vcApMpycUA28Au999GkAKxA=;
        b=b2ngFl6PAv48OmerpBNZU64NAPBNukpXD4AgjjNgGCVTuPERGFXnjIZQMfZ/LCIsoF
         VXwSCJpOPhK3EoJUTyGCb7wuP4VQWC27tpxaGO3JBRZ7zHbiHPt/20GuF66xHy69RY1K
         pCwRA4ugrWlo620lRTgEpA4QfNWtViF1L5XnRjvtUH0IFcO8Fe6AP2KTtytbOvqIgLhC
         01QAVm4hek8FkhG80FCRvqakH1lAU7neUrZ6c+DTc0CaXkl8hjr1S/V38i1F6jo3Ik13
         lmlirLS9Bn5LiYiDETs6Cj/TVM2NABmS8G4SwVnfnqQqhinryuzOJGRane+8U/82lHfH
         pkJg==
X-Gm-Message-State: AC+VfDzmjUbJphBBz75wMUz6DPRtF1qcf6ShXvENy6zEje1YaUQLCo3B
        qxXJZ90KWY+K9+GNITwZ3OxJsQ==
X-Google-Smtp-Source: ACHHUZ5y3yykg+lrBCZQvW4yT2LQtHpNr5xtiobRPF0s2Bej/Y7sXvG/PgJPVtTVV9nqI5u4ZB3cDg==
X-Received: by 2002:aa7:d6d1:0:b0:514:9c7c:8a30 with SMTP id x17-20020aa7d6d1000000b005149c7c8a30mr4587074edr.30.1685828031461;
        Sat, 03 Jun 2023 14:33:51 -0700 (PDT)
Received: from localhost ([2620:10d:c092:400::5:1bec])
        by smtp.gmail.com with ESMTPSA id n8-20020a05640204c800b005106975c7a1sm2170030edw.23.2023.06.03.14.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 14:33:51 -0700 (PDT)
Date:   Sat, 3 Jun 2023 22:33:50 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Dan Schatzberg <schatzberg.dan@gmail.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:CONTROL GROUP (CGROUP)" <cgroups@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation: Clarify usage of memory limits
Message-ID: <ZHuxvjP4QlsT1saH@chrisdown.name>
References: <20230601183820.3839891-1-schatzberg.dan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20230601183820.3839891-1-schatzberg.dan@gmail.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dan Schatzberg writes:
>The existing documentation refers to memory.high as the "main mechanism
>to control memory usage." This seems incorrect to me - memory.high can
>result in reclaim pressure which simply leads to stalls unless some
>external component observes and actions on it (e.g. systemd-oomd can be
>used for this purpose). While this is feasible, users are unaware of
>this interaction and are led to believe that memory.high alone is an
>effective mechanism for limiting memory.
>
>The documentation should recommend the use of memory.max as the
>effective way to enforce memory limits - it triggers reclaim and results
>in OOM kills by itself.
>
>Signed-off-by: Dan Schatzberg <schatzberg.dan@gmail.com>

Oof, the documentation is very out of date indeed -- no wonder people were 
confused by other advice to only use memory.high with something external 
monitoring the cgroup.

Thanks!

Acked-by: Chris Down <chris@chrisdown.name>

>---
> Documentation/admin-guide/cgroup-v2.rst | 22 ++++++++++------------
> 1 file changed, 10 insertions(+), 12 deletions(-)
>
>diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>index f67c0829350b..e592a9364473 100644
>--- a/Documentation/admin-guide/cgroup-v2.rst
>+++ b/Documentation/admin-guide/cgroup-v2.rst
>@@ -1213,23 +1213,25 @@ PAGE_SIZE multiple when read back.
> 	A read-write single value file which exists on non-root
> 	cgroups.  The default is "max".
>
>-	Memory usage throttle limit.  This is the main mechanism to
>-	control memory usage of a cgroup.  If a cgroup's usage goes
>+	Memory usage throttle limit.  If a cgroup's usage goes
> 	over the high boundary, the processes of the cgroup are
> 	throttled and put under heavy reclaim pressure.
>
> 	Going over the high limit never invokes the OOM killer and
>-	under extreme conditions the limit may be breached.
>+	under extreme conditions the limit may be breached. The high
>+	limit should be used in scenarios where an external process
>+	monitors the limited cgroup to alleviate heavy reclaim
>+	pressure.
>
>   memory.max
> 	A read-write single value file which exists on non-root
> 	cgroups.  The default is "max".
>
>-	Memory usage hard limit.  This is the final protection
>-	mechanism.  If a cgroup's memory usage reaches this limit and
>-	can't be reduced, the OOM killer is invoked in the cgroup.
>-	Under certain circumstances, the usage may go over the limit
>-	temporarily.
>+	Memory usage hard limit.  This is the main mechanism to limit
>+	memory usage of a cgroup.  If a cgroup's memory usage reaches
>+	this limit and can't be reduced, the OOM killer is invoked in
>+	the cgroup. Under certain circumstances, the usage may go
>+	over the limit temporarily.
>
> 	In default configuration regular 0-order allocations always
> 	succeed unless OOM killer chooses current task as a victim.
>@@ -1238,10 +1240,6 @@ PAGE_SIZE multiple when read back.
> 	Caller could retry them differently, return into userspace
> 	as -ENOMEM or silently ignore in cases like disk readahead.
>
>-	This is the ultimate protection mechanism.  As long as the
>-	high limit is used and monitored properly, this limit's
>-	utility is limited to providing the final safety net.
>-
>   memory.reclaim
> 	A write-only nested-keyed file which exists for all cgroups.
>
>-- 
>2.34.1
>

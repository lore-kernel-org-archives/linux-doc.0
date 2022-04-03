Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8585C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  3 Apr 2022 06:46:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353446AbiDCGsf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Apr 2022 02:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235038AbiDCGse (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Apr 2022 02:48:34 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD6537BC3
        for <linux-doc@vger.kernel.org>; Sat,  2 Apr 2022 23:46:41 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id y16so4736243ilq.6
        for <linux-doc@vger.kernel.org>; Sat, 02 Apr 2022 23:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t6+k/4Om7VsqLidja8hb8+QMIWaL5Tmj1wC2cL00ays=;
        b=nOlAijP5ZZ9vsdwJxJUZqAvchhR2fSeQGoSus10DZCtVRxLYXfh3CaMWft73tMME1m
         t8EEPpLhVAmbmIitm4y9QYf8gD29WnqYP9IPk0DbsJRQ306l1QfJlfZBvwV0n6/apy1q
         kE/dBq22AAuWR+VBcGZKlXr/FEVoU2mgB22M1LxnKoR+KLx+gi822+ieZ9bQV5DPkPDX
         rv0cbX0UhZ/st6FHWyCx4nSEY24sHkWVOJgCK96qcxkxAp+J+AvawMuPwG3FbWM+qvsh
         z1YzQW9HvQJnNjv85bt720LiaBD3IDsndMwp3VULMTwSwWfSyKEqFX+sUpd6E8sAOFuU
         nD8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t6+k/4Om7VsqLidja8hb8+QMIWaL5Tmj1wC2cL00ays=;
        b=jzcAXlSfgMW/4jNcTKsv50BngcVv/iUYwiQdSACHrQED7MUQukkiKO8bNdW7n1v9DJ
         hU9Q/02YIdCLTXaPf+xRINqCxW/M5Yi1B0wpDRBGkTMU5lnqDhAnulRmiG4nfau+t3sw
         7FNxRGfxSgARfwvsEOqnpD+f0SIdz6WguN4QnqGOd4c73mEKBpVMctmPMA6IA0y/IOGL
         mwEGhrtCRheq0PSJz39JbQMLhtnqmVujllRJOWRRehfZke5C8TZGOB5R9EhaevHdORpn
         3Z7MhLpTdhqAxAgnMUjhyntLXyMZTGNW7RrDn13becy5hbobIJR/0TUiF9rodzaPPvbX
         Vhwg==
X-Gm-Message-State: AOAM530NAjXEu+07ELtL0BwOxZcx0hJcpvtLO67SK8QdBZwUX/qNw+QI
        IoFfIfwxeUrKaoHWtxcFirvM5b4l687yR95DC/rzUg==
X-Google-Smtp-Source: ABdhPJzFIevVMEisQ9Pwvrh3Lhxnl9EwRG1TSPfzOF/+7Ua2Imr8RieK1XhYkaSWk0BECbaP9FsQ3vwbj4/V5Fwy9OA=
X-Received: by 2002:a92:d94d:0:b0:2c8:45a5:926b with SMTP id
 l13-20020a92d94d000000b002c845a5926bmr3208155ilq.310.1648968400437; Sat, 02
 Apr 2022 23:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220331084151.2600229-1-yosryahmed@google.com>
 <YkcEMdsi9G5y8mX4@dhcp22.suse.cz> <CAAPL-u_i-Mp-Bo7LtP_4aJscY=1JHG_y1H_-A7N_HRAgtz+arg@mail.gmail.com>
 <87y20nzyw4.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <87y20nzyw4.fsf@yhuang6-desk2.ccr.corp.intel.com>
From:   Wei Xu <weixugc@google.com>
Date:   Sat, 2 Apr 2022 23:46:29 -0700
Message-ID: <CAAPL-u_zLTs6cMSN8sOtktCHKncfSWo+qWxXU7_iL3hhwhL8QA@mail.gmail.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     Michal Hocko <mhocko@suse.com>,
        Yosry Ahmed <yosryahmed@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 2, 2022 at 1:13 AM Huang, Ying <ying.huang@intel.com> wrote:
>
> Wei Xu <weixugc@google.com> writes:
>
> > On Fri, Apr 1, 2022 at 6:54 AM Michal Hocko <mhocko@suse.com> wrote:
> >>
> >> On Thu 31-03-22 08:41:51, Yosry Ahmed wrote:
> >> > From: Shakeel Butt <shakeelb@google.com>
> >> >
>
> [snip]
>
> >> > Possible Extensions:
> >> > --------------------
> >> >
> >> > - This interface can be extended with an additional parameter or flags
> >> >   to allow specifying one or more types of memory to reclaim from (e.g.
> >> >   file, anon, ..).
> >> >
> >> > - The interface can also be extended with a node mask to reclaim from
> >> >   specific nodes. This has use cases for reclaim-based demotion in memory
> >> >   tiering systens.
> >> >
> >> > - A similar per-node interface can also be added to support proactive
> >> >   reclaim and reclaim-based demotion in systems without memcg.
> >> >
> >> > For now, let's keep things simple by adding the basic functionality.
> >>
> >> Yes, I am for the simplicity and this really looks like a bare minumum
> >> interface. But it is not really clear who do you want to add flags on
> >> top of it?
> >>
> >> I am not really sure we really need a node aware interface for memcg.
> >> The global reclaim interface will likely need a different node because
> >> we do not want to make this CONFIG_MEMCG constrained.
> >
> > A nodemask argument for memory.reclaim can be useful for memory
> > tiering between NUMA nodes with different performance.  Similar to
> > proactive reclaim, it can allow a userspace daemon to drive
> > memcg-based proactive demotion via the reclaim-based demotion
> > mechanism in the kernel.
>
> I am not sure whether nodemask is a good way for demoting pages between
> different types of memory.  For example, for a system with DRAM and
> PMEM, if specifying DRAM node in nodemask means demoting to PMEM, what
> is the meaning of specifying PMEM node? reclaiming to disk?
>
> In general, I have no objection to the idea in general.  But we should
> have a clear and consistent interface.  Per my understanding the default
> memcg interface is for memory, regardless of memory types.  The memory
> reclaiming means reduce the memory usage, regardless of memory types.
> We need to either extending the semantics of memory reclaiming (to
> include memory demoting too), or add another interface for memory
> demoting.

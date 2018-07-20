Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BD7E27D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 11:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbeGTMRM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 08:17:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43408 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbeGTMRM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jul 2018 08:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fbNmvEDLIK+g3GEv1sutNSGTnwK5E+Gm5XObJe2ygJQ=; b=Xvdqqi6TSGt1QsEd8ZpXdabjO
        /5nKGJhOOMRgTSQKqH9fYXiIzobuMUo+lHTH1nFbQV6Z3SwPRLdoNPFArTJwQCi18glhnaCceZBrp
        82R+GtbVSvsNL5Ymsg3HDSwjPji5qNHnZ7VWt/bQx7mR7Tnx+R7Ev0woOs/Ls+8fLeW9RRagvQD6M
        eeWAs66WsJQqeod5dN03WNq4gUF4oZLm4JSiClNy698TljGZQzJaywH12Lja5Sq3e/T3PvFzphHdL
        bM07T0tDUTsfot8mJl+58Qlcq+48SuRdPU9kgW6ywhboBn1JTa3p5HoXzfkeAUrnGE37HT74DgxKI
        WkRk5KqXQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fgTay-0007lP-C3; Fri, 20 Jul 2018 11:29:12 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id CFF0B20289335; Fri, 20 Jul 2018 13:29:10 +0200 (CEST)
Date:   Fri, 20 Jul 2018 13:29:10 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Tejun Heo <tj@kernel.org>
Cc:     Waiman Long <longman@redhat.com>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH v11 7/9] cpuset: Expose cpus.effective and mems.effective
 on cgroup v2 root
Message-ID: <20180720112910.GI2476@hirez.programming.kicks-ass.net>
References: <1529825440-9574-1-git-send-email-longman@redhat.com>
 <1529825440-9574-8-git-send-email-longman@redhat.com>
 <20180702165322.GI533219@devbig577.frc2.facebook.com>
 <bc59aa0a-70fd-583f-452d-9a947757cb69@redhat.com>
 <20180703155823.GS533219@devbig577.frc2.facebook.com>
 <20180719135224.GE2494@hirez.programming.kicks-ass.net>
 <1107494a-9667-df58-dcac-9366e969dc3a@redhat.com>
 <20180719153045.GT72677@devbig577.frc2.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180719153045.GT72677@devbig577.frc2.facebook.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 19, 2018 at 08:30:45AM -0700, Tejun Heo wrote:
> On Thu, Jul 19, 2018 at 10:04:54AM -0400, Waiman Long wrote:
> > > Why would a container not be allowed to create partitions for its
> > > various RT workloads?
> > 
> > As far as I understand, Tejun has some concern about the way that
> > partitioning works is inconsistent with how other resources are being
> > managed by cgroup v2 controllers. I adds an incremental patch to
> > temporarily disable the creation of partition below the first level
> > children to buy us time so that we can reach a compromise later on what
> > to do. We can always add features, but taking away features after they
> > are made available will be hard.
> > 
> > I am fine either way. It is up to you and Tejun to figure out what
> > should be made available to the users.
> 
> So, the main thing is that putting a cpu into a partition locks away
> the cpu from its ancestors.  That's a system level operation which
> isn't delegatable. 

If I understood things right, the partition file is actually owned by
the parent. So only the parent can flip that flag. In case of a
container, the filesystem namespace capturing the cgroup would cause
that file to be effectively r/o.

So effectively the partition flag if part of the parent control. The
parent takes the CPUs away to give them to the child cgroup. The child
itself cannot take or give here.

This is perhaps a little unorthodox, but it delegates just fine. Because
if a container finds .partition == 1, it knows it too can create (sub)
partitions.

> If we want to allow partitioning in subtrees, the
> parent still be able to take away partitioned cpus too even if that
> means ignoring descendants' configurations, which btw is exactly what
> cpuset does for non-partition configs.

I don't see why it would not be able to take away CPUs. But in case of
partitions this really is henous behaviour of the parent.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

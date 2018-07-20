Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 33BCB7D072
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Jul 2018 11:32:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbeGTMUR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Jul 2018 08:20:17 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43458 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbeGTMUR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Jul 2018 08:20:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=LFKEgGNKGYlBzIjx7OFkg2ppIE+/ozpZvzoWPn6vY+c=; b=iIA/PHJTzRAIh4fdoabJgWFD1
        jrNiqglElPUhxMTN1n7UJmZ2xlmhIEsMMPY3SjY/dCbeg9kxdGgt8iJSAuU4j5e3H43yxWlEretBt
        Jy71FRXqCjnnISPd+xEy7Sy8G9tYW0G3DyO/1TSLtOdHB/+Od/VhHx2299uV8YrmFEllwuwZHslPM
        Tqi6jCo1LCcO71U4OlOCpOAbrSkMPnsTeXHsx43u7cFoezgGBCXJeEh8nboMKUS96aS9gWFG8Mza9
        tUUpmqm3jciUQJKbSMVMBjA+eDPTgids5PP5NoX3vese0Trq55ta6oaqST77HKiu0zu5Fd66I2WE8
        HNwmwKcAw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fgTdz-0001PF-P6; Fri, 20 Jul 2018 11:32:19 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4006220275F47; Fri, 20 Jul 2018 13:32:18 +0200 (CEST)
Date:   Fri, 20 Jul 2018 13:32:18 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
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
Message-ID: <20180720113218.GK2476@hirez.programming.kicks-ass.net>
References: <1529825440-9574-8-git-send-email-longman@redhat.com>
 <20180702165322.GI533219@devbig577.frc2.facebook.com>
 <bc59aa0a-70fd-583f-452d-9a947757cb69@redhat.com>
 <20180703155823.GS533219@devbig577.frc2.facebook.com>
 <20180719135224.GE2494@hirez.programming.kicks-ass.net>
 <1107494a-9667-df58-dcac-9366e969dc3a@redhat.com>
 <20180719153045.GT72677@devbig577.frc2.facebook.com>
 <de6f931d-613a-3e6a-2a4d-0e49b3bfe2e5@redhat.com>
 <20180719165201.GU72677@devbig577.frc2.facebook.com>
 <69903192-8711-6a1e-0cd0-fbb249a4204b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69903192-8711-6a1e-0cd0-fbb249a4204b@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 19, 2018 at 01:22:36PM -0400, Waiman Long wrote:
> > 1. control which cpus are moved into a partition in all of its
> >    subtree.
> 
> Not at the moment. I do have another idea of adding a "cpus.subpart"
> file, for example, to indicate what CPUs a child sub-partition can use
> in its partition.

ARGH, why more files; this is turning into a right mess to use.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

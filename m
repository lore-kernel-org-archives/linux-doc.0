Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370C7217F31;
	Fri, 19 Dec 2025 00:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766105740; cv=none; b=EED62pEXEKJGj/glivqjA2ovQZhd38fBSPU9zCBrUx6TgfZp6AJnzNBGizMUhxdcV+oiGkEbzMMfvueTAhYCAN9aXGCRCvGs7I2UFp31SXjzPnI7sluvvBTsb09Ii/UAPg3PE3M3O/Q6E5nbjwvbfBmqhYMwgqTUcs3gK2nT85A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766105740; c=relaxed/simple;
	bh=O1LcidgndLzEkC1OJf94E8Uc/cfbHzpboI4JrAyy2AY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NG8Kb5BpDVuf0VCK7MJFA+xR4kzwiIaU9DFnr1F8lshAwn4aAGnoJcYwzwo236xSYjwBooQPvxNJB08gpAGJ/IJsLn3WYt1ZIWyrC4cuNoIXOFQ7mwHBLgA53A0E/5r/91Gwc0XX/2R/ZgcZEQAnrjgaG7sg0xbadaQnZkiOkGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hmeJRar8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hmeJRar8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA9FC4CEFB;
	Fri, 19 Dec 2025 00:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1766105739;
	bh=O1LcidgndLzEkC1OJf94E8Uc/cfbHzpboI4JrAyy2AY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hmeJRar8IjmjTQao9wLarnCCJ7+qmVNA+7IK8+9GCoK/Cfn2vtG3zIWfHX9+2z69+
	 XcfO4JPSyyVRepDDywNNF8b5U54xff441uDr/bQSsNkCy/pdZZP2U2pRFWVtxLB/w8
	 JQbSl0o+fiWPpk13dF4zKGKLLVF7tMs/mcO5RF8w=
Date: Thu, 18 Dec 2025 16:55:38 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, david@kernel.org,
 osalvador@suse.de, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 corbet@lwn.net, muchun.song@linux.dev, laoar.shao@gmail.com,
 brauner@kernel.org, jack@suse.cz, hannes@cmpxchg.org,
 mclapinski@google.com, joel.granados@kernel.org, David Hildenbrand
 <david@redhat.com>, Mel Gorman <mgorman@suse.de>, David Rientjes
 <rientjes@google.com>
Subject: Re: [PATCH v4] mm, hugetlb: implement movable_gigantic_pages sysctl
Message-Id: <20251218165538.b299508aacdaf7d941035ec3@linux-foundation.org>
In-Reply-To: <20251218151211.1237411-1-gourry@gourry.net>
References: <20251218151211.1237411-1-gourry@gourry.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 10:12:11 -0500 Gregory Price <gourry@gourry.net> wrote:

> This reintroduces a concept removed by:
> commit d6cb41cc44c6 ("mm, hugetlb: remove hugepages_treat_as_movable sysctl")
> 
> This sysctl provides flexibility between ZONE_MOVABLE use cases:
> 1) onlining memory in ZONE_MOVABLE to maintain hotplug compatibility
> 2) onlining memory in ZONE_MOVABLE to make hugepage allocate reliable

My x86_64 allmodconfig blew up.

> ...
>
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -49,7 +49,6 @@
>  #include "internal.h"
>  #include "hugetlb_vmemmap.h"
>  #include "hugetlb_cma.h"
> -#include "hugetlb_internal.h"
>  #include <linux/page-isolation.h>

What's that doing there?  I put it back.  Helped!

But the build still failed because the patch refers to

	extern int movable_gigantic_pages __read_mostly;

but forgot to define it.  v5, please ;)



mm/hugetlb.c:497:56: error: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
  497 | static void record_hugetlb_cgroup_uncharge_info(struct hugetlb_cgroup *h_cg,
      |                                                        ^~~~~~~~~~~~~~
mm/hugetlb.c: In function 'record_hugetlb_cgroup_uncharge_info':
mm/hugetlb.c:505:30: error: invalid use of undefined type 'struct hugetlb_cgroup'
  505 |                         &h_cg->rsvd_hugepage[hstate_index(h)];
      |                              ^~
mm/hugetlb.c:506:33: error: invalid use of undefined type 'struct hugetlb_cgroup'
  506 |                 nrg->css = &h_cg->css;
      |                                 ^~
mm/hugetlb.c:517:30: error: invalid use of undefined type 'struct hugetlb_cgroup'
  517 |                 css_get(&h_cg->css);
      |                              ^~
mm/hugetlb.c: At top level:
mm/hugetlb.c:580:56: error: 'struct hugetlb_cgroup' declared inside parameter list will not be visible outside of this definition or declaration [-Werror]

<and much more>

Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2726C1EB2F;
	Thu, 23 Jan 2025 03:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737604023; cv=none; b=YwQimM6CFHMypLyQuPfIk515FvbfLOW/ComOvo3NeYQj8l94J9OWDbw8VFLOXQhMO0XkD/y4VUWMmAmVHeuHZyAKcd5cs2mufayGZix/b8eyCQtOY+iQPUyvZVsuQiUZYNPVMkkeOa9AoHInOErMLHzg94d/olEhSpVa3M+DjhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737604023; c=relaxed/simple;
	bh=4/j+vIKTx7hFTxpQdoThEtG13lxZNYtEilRDsHid1co=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XskEdMWILZ8Q5TvGCIFSviORzEnGQ/6iwP4zeYZhfHdQm0jUCw5SAlIZGrX0BUhpBxfwScC1L+EIQBlWZ2c6TrYYu2TLgIEOZxp3zWq5rXIWUY8j9Mjc7b4QCLiWTpODteS24omYWsXUF6MjvAh67/WvB579K5CZE7wCcofFBX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=QpfjlUFh; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="QpfjlUFh"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737604011; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=VG+1ZI6pqjAQY5R0EBu0W5Afy8dC3H4uZylNEGDHZfo=;
	b=QpfjlUFhjcz/+owV7IhC+SY72L3fw75nBl3ajxOzvwWZil0CBxNv6C+aQfaJM1KNGBWsoyGEbx8OPXqQrSTBWXOUuycEM5LT8Y31uDAva8VNfNIKu1p4lOgm+zTAYM37UBqOHFkhrX3sUDuXpwnqOGhyTPY2/UP8l48HmGQHoeU=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WOAGnVM_1737604009 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 23 Jan 2025 11:46:50 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  kernel-team@meta.com,
  nehagholkar@meta.com,  abhishekd@meta.com,  david@redhat.com,
  nphamcs@gmail.com,  akpm@linux-foundation.org,  hannes@cmpxchg.org,
  kbusch@meta.com,  feng.tang@intel.com,  donettom@linux.ibm.com
Subject: Re: [RFC v3 PATCH 0/5] Promotion of Unmapped Page Cache Folios.
In-Reply-To: <Z5EhcQERseKShtGY@gourry-fedora-PF4VCD3F> (Gregory Price's
	message of "Wed, 22 Jan 2025 11:48:49 -0500")
References: <20250107000346.1338481-1-gourry@gourry.net>
	<87v7u7gkuk.fsf@DESKTOP-5N7EMDA>
	<Z5EhcQERseKShtGY@gourry-fedora-PF4VCD3F>
Date: Thu, 23 Jan 2025 11:46:49 +0800
Message-ID: <87y0z2jiom.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Gregory Price <gourry@gourry.net> writes:

> On Wed, Jan 22, 2025 at 07:16:03PM +0800, Huang, Ying wrote:
>> Hi, Gregory,
>> > Test process:
>> >    In each test, we do a linear read of a 128GB file into a buffer
>> >    in a loop.
>> 
>> IMHO, the linear reading isn't a very good test case for promotion.  You
>> cannot test the hot-page selection algorithm.  I think that it's better
>> to use something like normal accessing pattern.  IIRC, it is available
>> in fio test suite.
>>
>
> Oh yes, I don't plan to drop RFC until I can get a real workload and
> probably fio running under this.  This patch set is varying priority for
> me at the moment so the versions will take some time.  My goal is to
> have something a bit more solid by LSF/MM, but not before.

No problem.

>> >    1) file allocated in DRAM with mechanisms off
>> >    2) file allocated in DRAM with balancing on but promotion off
>> >    3) file allocated in DRAM with balancing and promotion on
>> >       (promotion check is negative because all pages are top tier)
>> >    4) file allocated in CXL with mechanisms off
>> >    5) file allocated in CXL with mechanisms on
>> >
>> > |     1     |    2     |     3       |    4     |      5         |
>> > | DRAM Base | Promo On | TopTier Chk | CXL Base | Post-Promotion |
>> > |  7.5804   |  7.7586  |   7.9726    |   9.75   |    7.8941      |
>> 
>> For 3, we can check whether the folio is in top-tier as the first step.
>> Will that introduce measurable overhead?
>>
>
> That is basically what 2 vs 3 is doing.
>
> Test 2 shows overhead of TPP on + pagecache promo off
> Test 3 shows overhead of TPP+Promo on, but all the memory is on top tier
>
> This shows the check as to whether the folio is in the top tier is
> actually somewhat expensive (~5% compared to baseline, ~2.7% compared to
> TPP-on Promo-off).

This is unexpected.  Can we try to optimize it?  For example, via using
a nodemask?  node_is_toptier() is used in the mapped pages promotion
too (1 vs. 2 above).  I guess that the optimization can reduce the
overhead there with measurable difference too.

> The goal of this linear, simple test is to isolate test behavior from
> the overhead - that makes it easy to test each individual variable (TPP,
> promo, top tier, etc) and see relative overheads.
>
> This basically gives us a reasonable floor/ceiling of expected overhead.
> If we see something wildly different than this during something like FIO
> or a real workload, then we'll know we missed something.
>
>> >
>> > This could be further limited by limiting the promotion rate via the
>> > existing knob, or by implementing a new knob detached from the existing
>> > promotion rate.  There are merits to both approach.
>> 
>> Have you tested with the existing knob?  Whether does it help?
>>
>
> Not yet, this fell off my priority list before I could do additional
> testing.  I will add that to my backlog.

No problem.

---
Best Regards,
Huang, Ying

Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D9A214A9B
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971089; cv=none; b=I8eoWhXDosNDRL67DvV2sHn/nZ6ZResm3c6YKBZV8Hy5j5HSfkn9sT3T5EtSsTySma9pnMgxf6CrfOzbkhx7tqLCK12iQaS7SSL/7AH8CiIx6r+WY5Us0xyh9SGuoQiGX8nl/OSf0YRIPv4y0kQHHaEvbjcd/FfRqaaI9v1qWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971089; c=relaxed/simple;
	bh=kwNN8h2rJ+7ieoAKpxhUBTLUlLyNeZ0xhIRLUJXZzlU=;
	h=Subject:Date:Mime-Version:Cc:Message-Id:To:From:Content-Type; b=qU4C93MUiC8fmGKCV804A63QbIkR5j/ZbDBFEEWPf3SD/VT8HjZd9i5TXjmocgwPF+PyHlPsUNAf+NB8eJC0AaY9mq9+3eTN9kYfU0c8XrZghL6kwX2OVaAFvnbmJC2FSE1zLjLETk3TjbcSMmyXMpcsd/jHTMdSS29ZeHclPsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=iX+8PH/I; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="iX+8PH/I"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1791971069; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=I26JrSuCzA83CNBVA69JTeJPLnyTlk8cgX1YDR6KSNY=;
 b=iX+8PH/IjUV4qmB6BGd3VL1Lqw6bzkOoASL+EyeTFBOOww1VZFQqdJ9ZnNHAWUb0DFCZ+2
 kdy0ScnYGfIS7bUfhvD2MYj3xJm2yKIZEaLaZjnhspOXbs5H2+Wnwu7ErnoV6cxUTf+7Gx
 wM/b/f6f4It2XcCoBuNpYWLto2ttGB/hUIrYav4PQZNV23AYNsMZh1mj53MEaXTO/sAiOc
 4UgnuI2SqwERzafJkvYQUZ/Z+EVTZpJwv8mhL5DriUV6SUlxcOIHrOPpHIEExDbcwMZbM3
 +YJONXw4G07N1mv53zXC1CBw5lZSrJraxgHrDryoKCXiCVq7iWzQtY3U2rCYOg==
Subject: [PATCH 0/6] sched/numa: fix several NUMA balancing issues
Date: Wed, 14 Oct 2026 17:43:41 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2
X-Lms-Return-Path: <lba+26acf4efb+33b577+vger.kernel.org+lizhe.67@bytedance.com>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>, "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <20261014094347.99157-1-lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
To: <akpm@linux-foundation.org>, <david@kernel.org>, <ljs@kernel.org>, 
	<gourry@gourry.net>, <joshua.hahnjy@gmail.com>, <ziy@nvidia.com>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <mgorman@suse.de>, 
	<riel@redhat.com>, <juri.lelli@redhat.com>, <vincent.guittot@linaro.org>, 
	<dietmar.eggemann@arm.com>, <rostedt@goodmis.org>, <bsegall@google.com>, 
	<vschneid@redhat.com>, <kprateek.nayak@amd.com>
From: "Li Zhe" <lizhe.67@bytedance.com>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

This series fixes several NUMA balancing issues around scan-period
adjustment, memory-tiering promotion feedback, and stale task-placement
state.

Patch 1 clears retained NUMA fault-window and locality state across
execve(), so the new image does not inherit feedback from the old one.

Patch 2 fixes the scan-period ratio denominator checks. The existing code
checks a different sum than the one later used as the divisor.

Patch 3 fixes scan-period adjustment for shared faults. Shared or local
faults should slow scanning down, while speeding up should require enough
faults that are both private and remote.

Patch 4 makes the free-space memory-tiering promotion bypass configurable.
The default behavior is preserved, but users can require the normal hotness
and rate-limit checks even when the top tier has enough free space.

Patch 5 prevents memory-tiering-only promotion faults from feeding normal
AutoNUMA task-placement statistics.

Patch 6 ignores stale preferred-node placement state while normal NUMA
balancing is disabled, so memory-tiering-only mode does not consume old
task-placement decisions.

Li Zhe (6):
  sched/numa: clear fault locality state on execve
  sched/numa: fix scan-period ratio denominator checks
  sched/numa: fix scan-period adjustment for shared faults
  sched/numa: make free-space tiering promotion bypass configurable
  sched/numa: do not feed tiering promotions into task placement stats
  sched/numa: ignore preferred nodes without normal balancing

 Documentation/admin-guide/sysctl/kernel.rst |  16 ++
 include/linux/mm.h                          |   5 +-
 include/linux/mmzone.h                      |   5 +-
 include/linux/sched.h                       |  17 +-
 kernel/sched/fair.c                         | 181 ++++++++++++++------
 mm/memory.c                                 |   2 +-
 6 files changed, 163 insertions(+), 63 deletions(-)

-- 
2.20.1

Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CE52FE0F
	for <linux-doc@vger.kernel.org>; Sun, 21 Jun 2026 04:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782015702; cv=none; b=RmlslJlCD2hAth0YG908HSungHURjF/bqLVdWu0XVSwDvbQ6WoR0SqBUFeV7ARIqBrQiCR3Xi6sVXU70yKjE7IyvThTsaw5X4EOzjwgCorFftM4sxgxuBF/lYrmTSnenNK7vrr1F+FB/2ALsP+udGoo3G002UQyAxczO2NffUpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782015702; c=relaxed/simple;
	bh=Qm1xJ7eE7SxDxFFbhbERZFz54hUH7EFA3JS4Q4+HLSU=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=RyUd17I0SG55tYvAOWYLHrdZ/xEIQ3bJ4TT7dQxIp78/KKjO6WwSPaz60hsirB0eWyoTtThIjk8r3Kr3JoQfJjgbNXWSuBmely7f46ZvZStVIwj7mcpDvfnD93GU1n4/OMjDuorzhdTYw0l/Q/UesXHBFF8Vmnk+sFgWc6b3A6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Jhq+3MKD; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Jhq+3MKD"
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782015689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dkuMvT1iZbZrtYLWgyC9GkvIWTgGmRGV8kOxOiB5+Q=;
	b=Jhq+3MKDM5IK7ruQ9JcD0RGhLAJ2fdo0kybKyrFOZpyIO3SWOFBhPAK9SUj4+Ks2Xi+dUD
	cMRlMGjvYM3iQZkVSkUkoLJrRKZe0BMIA3FbjmwyMQzEdPIZdKkIdPaIVmnB+zKdGUF4wr
	oAgSjlXfGH3ztENGpidwkxPzWsMxQtc=
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v4 0/5] mm/zswap: Implement per-cgroup proactive writeback
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260618044857.69439-1-jiahao.kernel@gmail.com>
Date: Sun, 21 Jun 2026 12:20:51 +0800
Cc: akpm@linux-foundation.org,
 tj@kernel.org,
 hannes@cmpxchg.org,
 shakeel.butt@linux.dev,
 mhocko@kernel.org,
 yosry@kernel.org,
 mkoutny@suse.com,
 nphamcs@gmail.com,
 chengming.zhou@linux.dev,
 roman.gushchin@linux.dev,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 Hao Jia <jiahao1@lixiang.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <CAAAF57B-7DE9-45EA-8AB6-DE6CFAF60F47@linux.dev>
References: <20260618044857.69439-1-jiahao.kernel@gmail.com>
To: Hao Jia <jiahao.kernel@gmail.com>
X-Migadu-Flow: FLOW_OUT



> On Jun 18, 2026, at 12:48, Hao Jia <jiahao.kernel@gmail.com> wrote:
>=20
> From: Hao Jia <jiahao1@lixiang.com>
>=20
> Zswap currently writes back pages to backing swap reactively, =
triggered
> either by the shrinker or by the pool reaching its size limit. =
Although
> proactive memory reclaim can automatically write back a portion of =
zswap
> pages via the shrinker, it cannot explicitly control the amount of
> writeback for a specific memory cgroup. Moreover, proactive memory =
reclaim
> may not always be triggered during a steady state.
>=20
> In certain scenarios, it is desirable to trigger writeback in advance =
to
> free up memory. For example, users may want to prepare for an upcoming
> memory-intensive workload by flushing cold memory to the backing =
storage
> when the system is relatively idle.
>=20
> This patch series introduces a "zswap_writeback_only" key to =
memory.reclaim
> cgroup interface, allowing users to proactively write back cold =
compressed
> data from zswap to the backing swap device. When specified, this key
> bypasses standard memory reclaim and exclusively performs proactive =
zswap
> writeback up to the requested budget. If omitted, the default reclaim
> behavior remains unchanged.
>=20
> Example usage:
>  # Write back 10MB of compressed data from zswap to the backing swap
>  echo "10M zswap_writeback_only" > memory.reclaim

I=E2=80=99m not entirely sure if other candidate names were already =
brought up
in previous discussions, so my apologies if I'm repeating something =
here!
I do think expanding memory.reclaim is a great approach. That said, I
was wondering if we could make the interface a bit more concise while
keeping it flexible for future extensions.

Essentially, what we want is to control the specific targets of the =
reclaim
process=E2=80=94such as file, anon, or zswap. What do you think about =
using
something like "source=3Dzswap"? For instance, if we want to reclaim 10M =
from
zswap, the command would look like this:

	echo "10M source=3Dzswap" > memory.reclaim

If we only want to reclaim 10M from file pages, we could easily extend =
the
syntax:

	echo "10M source=3Dfile" > memory.reclaim

And of course, we could even combine them down the road:

	echo "10M source=3Danon,file" > memory.reclaim

to only reclaim anon and file but bypass zswap.

Just some thoughts of mine.

Muchun,
Thanks

>=20
> Patch 1: Extend shrink_memcg() to support batch writeback based on a
>  compressed-size budget and update its return value semantics, thereby
>  improving the writeback efficiency in the shrink_worker() path.
> Patch 2: Extract the memcg iteration and writeback loop into helper
>  functions to prepare for proactive writeback.
> Patch 3: Extend the memory.reclaim cgroup v2 interface with a new
>  "zswap_writeback_only" key, allowing users to trigger proactive zswap
>  writeback up to a requested budget.
> Patch 4: Add the zswpwb_proactive_b stat to track the compressed bytes
>  of proactive writeback for better monitoring and tuning.
> Patch 5:
>  Add tests for zswap proactive writeback.
>=20
> v3->v4:
>  - Drop the per-memcg cursor and keep the root cgroup cursor
>    (zswap_next_shrink) logic intact.
>  - Stick to using the zswap_writeback_only key, and change the =
proactive
>    writeback size to use the compressed size.
>  - Consolidate and reuse the logic between shrink_worker() and
>    shrink_memcg(). Enable batch writeback in the shrink_worker() path,
>    while maintaining a low writeback budget in the zswap_store() path.
>=20
> v2->v3:
>    - Align the return value of zswap_proactive_writeback() with
>      memory.reclaim and update the corresponding documentation =
accordingly.
>    - Resolve conflicts in test_zswap.c on the mm-unstable branch.
>    - Enhance the zswap proactive writeback selftests to guard against =
potential
>      future regressions.
>=20
> v1->v2:
>    - As suggested by Yosry and Nhat, extend the memory.reclaim cgroup =
v2
>      interface with a "zswap_writeback_only" key instead of adding a =
new
>      dedicated cgroup interface.
>    - Update the zswap documentation and add selftests for proactive =
writeback.
>=20
> [v3] =
https://lore.kernel.org/all/20260526114601.67041-1-jiahao.kernel@gmail.com=

> [v2] =
https://lore.kernel.org/all/20260525122242.36127-1-jiahao.kernel@gmail.com=

> [v1] =
https://lore.kernel.org/all/20260511105149.75584-1-jiahao.kernel@gmail.com=

>=20
> Hao Jia (5):
>  mm/zswap: Extend shrink_memcg() writeback capability
>  mm/zswap: Factor writeback loop out of shrink_worker()
>  mm/zswap: Implement proactive writeback
>  mm/zswap: Add per-memcg stat for proactive writeback
>  selftests/cgroup: Add tests for zswap proactive writeback
>=20
> Documentation/admin-guide/cgroup-v2.rst     |  22 +-
> Documentation/admin-guide/mm/zswap.rst      |  11 +-
> include/linux/memcontrol.h                  |   1 +
> include/linux/zswap.h                       |   7 +
> mm/memcontrol.c                             |   3 +
> mm/vmscan.c                                 |  14 +
> mm/zswap.c                                  | 322 +++++++++++++++-----
> tools/testing/selftests/cgroup/test_zswap.c | 153 +++++++++-
> 8 files changed, 456 insertions(+), 77 deletions(-)
>=20
> --=20
> 2.34.1
>=20


Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543903D413B
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 12:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999223; cv=none; b=MI+AGSi746fi1WcQ2WXPZFEjJr4aYDa6pWeSlPq7gh5XEmXpu2EuaPJ3k9iJ0DXvZeZb1NCHGJERFBT/Kqu5bcQe+snwR5IdK3tF/HMEYrD2bdUk8bKHHyloyUqOB5oK1jIV9KB+MhrXDL9ccgccAcKnF0K/eSrzO22ShXhpEX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999223; c=relaxed/simple;
	bh=Z6XMoEdXmH4BcMhS0u/DWzfS/DQabH2lrLBwqiOvaPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gnYYNn043dUU5z24Nr1AvfUNU1FpwGJuFP1PDCtUfurr7xxZ6uXZYB2UMrxgMgSia7ZkijOtqPzEKUpxk69v1bWCWM6bcCFeMhqzqL+p5NvG1t8dubyzbn+hpewebT+wcLbHcY9s8ApXiTxnBQWGYkZM8JzGG4ROKU+cyD5L2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pztY8jU8; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pztY8jU8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1768999206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AIgd4bOr0S+D4kFtBOGP07QN+SUDLqIaIGdlYZNzuKM=;
	b=pztY8jU84lPxHm5uxMRAKZomPFuvZe4E4WGRA0qyOTw9jwZV8Fz9G66Mz2MGFPKiY6tLbQ
	SI8WQuh3FITgIhhFTDqiLpsO/W1A2WGihUT6s9LvWvIG0V3/fjr6sWZsFJWcxk/gfemQCk
	l4jQZF2Pc7qvkMbK9S5qnz4OMuJESRk=
From: Jiayuan Chen <jiayuan.chen@linux.dev>
To: linux-mm@kvack.org
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] mm/lru_gen: add memory.lru_gen interface for cgroup v2
Date: Wed, 21 Jan 2026 20:39:46 +0800
Message-ID: <20260121123955.84806-1-jiayuan.chen@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

This patchset adds a memory.lru_gen interface to cgroup v2, allowing users
to interact with MGLRU directly on a specific cgroup without needing to
know the internal memcg_id.

Motivation
==========
Currently, the only way to perform aging or eviction on a specific memcg
is through the debugfs interface (/sys/kernel/debug/lru_gen), which
requires the memcg_id. However, there's no straightforward way to get the
memcg_id for a given cgroup path. This makes it difficult for users to
leverage MGLRU's proactive reclaim capabilities on specific cgroups.

Solution
========
The new memory.lru_gen interface operates directly on the cgroup:

  # Show lru_gen info for this cgroup
  cat /sys/fs/cgroup/mygroup/memory.lru_gen

  # Run aging on node 0
  echo '+ 0 <seq>' > /sys/fs/cgroup/mygroup/memory.lru_gen

  # Evict cold pages on node 0
  echo '- 0 <seq> <swappiness> <nr_to_reclaim>' > \
       /sys/fs/cgroup/mygroup/memory.lru_gen

This interface is available on all cgroups including root, providing the
same functionality as the debugfs lru_gen interface.

Testing
=======
Create 1GB page cache, loop access 200MB as hot pages.
After aging twice, 200MB hot pages are in young generation,
800MB cold pages remain in oldest generation.
Eviction with seq=min_seq only reclaims cold pages, hot pages preserved.

Patches
=======
Patch 1 refactors the existing debugfs code to extract helper functions.
Patch 2 adds the memory.lru_gen interface using these helpers.
Patch 3 adds documentation for the new interface.


Jiayuan Chen (3):
  mm/lru_gen: refactor to extract helper functions
  mm/lru_gen: add memory.lru_gen interface for cgroup v2
  docs/cgroup: document memory.lru_gen interface

 Documentation/admin-guide/cgroup-v2.rst |  17 +++
 include/linux/mmzone.h                  |  16 +++
 mm/memcontrol.c                         |  31 +++++
 mm/vmscan.c                             | 176 +++++++++++++++++++-----
 4 files changed, 206 insertions(+), 34 deletions(-)

-- 
2.43.0


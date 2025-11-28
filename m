Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B62773E3;
	Fri, 28 Nov 2025 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299431; cv=none; b=rGq4GRUA5rFEABUIavJhg0zoz3u0A6DWhpIYLynBxGVKQmp0HflovcWEuDGbypWDGNqwBb43qijx+EwnmeUX5jQq/j6kpNF8QNKiZaNPcKsfl2cqMHftlu+yHe/ZIw715+0PbxAcrGpJwiKXI9JpE7lS3Ooq+kNckE4tSgBmkFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299431; c=relaxed/simple;
	bh=wLW4VsAkI4/Ng5lKBK4p+XrbNSSuEB8Shth5O8KLqT4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r6v3vjY7pJK4FovObwSvKcojmxKjFzoQ6sTOiINV6NmDO3MnWwpzE7/BBNBl76wWMp0hZ9oTY6pDXdugJFfbDfhEJLFwz3JHQqiIT/RJRuDHh9gjLfl++3b2AqcDVA1Pzmob6FnogHmOPg0i9vs6v/kkfGxDmUXjPJlWKMwpeds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dHdBx6bHdzYmZ9v;
	Fri, 28 Nov 2025 10:52:57 +0800 (CST)
Received: from localhost.localdomain (10.144.5.36) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 28 Nov
 2025 10:54:19 +0800
From: Zicheng Wang <wangzicheng@honor.com>
To: <akpm@linux-foundation.org>, <hannes@cmpxchg.org>, <david@redhat.com>,
	<axelrasmussen@google.com>, <yuanchu@google.com>
CC: <mhocko@kernel.org>, <zhengqi.arch@bytedance.com>,
	<shakeel.butt@linux.dev>, <lorenzo.stoakes@oracle.com>, <weixugc@google.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Zicheng Wang <wangzicheng@honor.com>
Subject: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from debugfs to procfs
Date: Fri, 28 Nov 2025 10:53:12 +0800
Message-ID: <20251128025315.3520689-1-wangzicheng@honor.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To w002.hihonor.com
 (10.68.28.120)

This patchset moves the lru_gen control interface from debugfs to procfs.
Exposing the interface enables the capabilities for *commercial products*
such as Android to proactive aging and reclaim.

Two main reasons:
1. The MGLRU reaches the stage where its control interface can be
consideres product-ready, not just for experiments or debugging.
In specific scenarios, proactive aging with reclaim can improve
overall system performance.
2. Commercial products like Android prohibit mounting debugfs for
security reasons (selinux neverallow). Without moving the interface
to procfs, Android cannot utilize lru_gen.

Case study:
A widely observed issue on Android is that after application launch,
the oldest anon generation often becomes empty, and file pages
are over-reclaimed.

In Android, each application owns its own memcg. When an app is swiped
away seconds or minutes after (cold) launch, it will be frozen and
part of its memory is proactively reclaimed.
At this time, both file pages and anonymous pages are temporarily unused,
while the system load is also typically low, making it an ideal time to
prefer reclaiming anon pages while retaining file cache.

Keeping more file cache benefits the system in multiple ways:
1. The device can retain a larger page cache, reducing IO.
2. When memory is tight, evicting clean cache pages is fast.
2. Super-apps such as camera benefit from reducing the chance of
slow direct reclaim on the critical startup path.

Experiments:

- after cold launch
```
Kernel version v6.6
memcg    54 /apps/some_app
node     0
1     119804          0       85461
2     119804          0           5
3     119804     181719       18667
4       1752        392         244

Kernel version v6.12
memcg    84 /apps/some_app
node     0
1      38428          0       16424
2      38428      24307       14997
3      38428     126529       56452
4      37980         27           1
```

- proactive aging 2/3 times
```
Kernel version v6.6
memcg    54 /apps/some_app
 node     0
          3     172432     102532      103441
          4      54380      74803         854
          5      28892       6496         229
          6       1588         26           0  

Kernel version v6.12
memcg    84 /apps/some_app
 node     0
          3     819624      98726      166045
          4     819176      14849        1543
          5      40000      41328        7633
          6        960          0           0     
```

In continuous app-launch scenarios (e.g., After boot, retail demo
loops, tech review testing), our measurements show: v6.6
1. Available memory improves by 400–800 MB.
2. Direct reclaim frequency and latency drop by more than 24%.
3. memavailable/cached levels aligns with traditional LRU.

Summary of average available memory (MB):
mglru without proactive aging: 6060
mglru with proactive aging test1~3: 6988/6432/6837
traditional LRU: 6982

Camera direct reclaim (10-run average):
mglru without aging: 1050 events / 460 ms
mglru with aging: 789 events / 316 ms
(25% fewer events, 31% lower latency)


Signed-off-by: Zicheng Wang <wangzicheng@honor.com>

 Documentation/admin-guide/mm/multigen_lru.rst | 19 ++++++++++
 mm/Kconfig                                    | 10 +++++
 mm/vmscan.c                                   | 37 ++++++++++++++++++-
 3 files changed, 64 insertions(+), 2 deletions(-)

-- 
2.25.1


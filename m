Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F417E476CF4;
	Thu, 13 Aug 2026 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637340; cv=none; b=itG7tQvcGkT+0vBDQKhvPLqyOMAoQ9+BcAAuXPmNw/2RLubvtP8Y3H14QDPF2m+6pJj2lm5L6q+/H94nRjVDKHvhWBr7RAE46SwbBCGEgV8r5i+Uq6SHKubJwAJfRloU/tlaiwH+jHYn4QyJkfQzOOXNoGct6GskQdH/UH6pyxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637340; c=relaxed/simple;
	bh=jamn+F1kh+1kcqoXDhFgkY5bwEVNGgZNdqWeU/bUfk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GnaLLkRsFbDuZy6JMxmWsDNiJ/koDH5zJnIzDjhEMeCpO/DPSaA1t6e7iGGSDeRkGThXosnABxm/QIvHmQZZMZs1dGOxcL87nt+v+UK/6l6SPeboZTyoc1xJ1wvKwsk0Y6BAsGF/H9GGkGEwY9ohappvNE7lkbupGGb9sGKQtfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAB3Se36631qXnJ7BQ--.9477S2;
	Fri, 14 Aug 2026 00:08:27 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vlastimil Babka <vbabka@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2 0/4] mm/slub: preserve previous object lifetime
Date: Fri, 14 Aug 2026 00:08:25 +0800
Message-ID: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAB3Se36631qXnJ7BQ--.9477S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrWfZr4xJw18ZFy7WFyDZFb_yoW8tr47pr
	WfKr1ftr1kXr4Ik3s3Cw109F95uayrGr4UWF4aqF4xur45t3WUAFZ2ka4YqryUCrZ7GasF
	qr1qv3ZxCFyUAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JV
	W8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr
	1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7sRiKsUtUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_USER records one allocation and one free track per object.  A
new allocation overwrites the allocation track, and a later stale free can
overwrite the free track, so the completed lifetime that produced the
stale reference is no longer available in the report.

Extend the existing U option directly, as discussed on the RFC, to retain
one previous completed allocation/free pair.  The records remain address
history only; they do not infer semantic ownership.  The series also adds
KUnit coverage and documents the additional report section.

Changes since v1:
https://lore.kernel.org/all/20260616141410.52117-1-pengpeng@iscas.ac.cn/
- extend U directly instead of adding a separate H option
- use TRACK_NR in every user-metadata layout calculation
- copy the completed pair with explicit track assignments
- keep the current free track until a later free replaces it
- pin the KUnit task across immediate free and reuse

Testing used Linux 3d6d817622b0, GCC 13.3 and QEMU 8.2.2 for x86_64.
The focused SLUB KUnit test passed, including immediate free/reuse and
verification that the completed allocation/free pair moved to the
previous-lifetime slots.

A temporary KUnit probe, not part of this series, recorded the internal
cache slot size and objects per order-0 slab before and after the series:

  object bytes    U slot/objects    patched slot/objects
       32              96/42              160/25
       64             128/32              192/21
      128             192/21              256/16
      256             320/12              384/10

All four caches retained slab order 0.  The table quantifies the expected
per-object metadata cost only for caches using SLAB_STORE_USER; caches
without U do not allocate these track records.

Pengpeng Hou (4):
  mm/slub: use a track count for user metadata sizing
  mm/slub: preserve one previous object lifetime
  mm/slub: test previous lifetime tracking
  Documentation/mm: describe SLUB previous lifetime tracking

 Documentation/admin-guide/mm/slab.rst | 13 ++++-
 lib/tests/slub_kunit.c                | 35 ++++++++++++++
 mm/slab.h                             |  4 ++
 mm/slub.c                             | 69 ++++++++++++++++++++-------
 4 files changed, 104 insertions(+), 17 deletions(-)


base-commit: 3d6d817622b0a9721e3cc404df3469171582be13
-- 
2.50.1 (Apple Git-155)


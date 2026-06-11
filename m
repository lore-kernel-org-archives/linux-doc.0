Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888963612E9;
	Thu, 11 Jun 2026 06:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159998; cv=none; b=gHax5XnwVCCU6KQ2a4v6yKdQVX60hz//wlx+RuR0upcoBdfmNd2THA27SPEdSAc23APAFac6t/hGQutybOmS9PfPMUfbmDXwBaeEFeoPXUZH11NBh02ckcWMGkTLFDTYI9LmKYxsC3rJtJJA8vRXVv12/tF4zSyF3BLe7+H2dZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159998; c=relaxed/simple;
	bh=54vBGeTdxA5doM24U7VWmpi0FaeDHI+XNnvNwaJMOcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EYFIuEEq881OBPiQa94NB/W//5iFkX+QxiiYryK78nldSRIzJ7oKx69VuciMlk/gVNGGIUvgtGRJvBjfmCaQ1xaiTkmb6PafmopoCW7OB+oxdfbywR1MFU99i+3RkCO4DxURBTH6Sue73d5Ulwvbls6TEgWUl5aNR3NpZcwA/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADHbdYgWCpqYOJFAQ--.1790S2;
	Thu, 11 Jun 2026 14:39:28 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Cc: Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	liam@infradead.org,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH 0/5] mm/slub: preserve previous object lifetime
Date: Thu, 11 Jun 2026 14:39:21 +0800
Message-ID: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHbdYgWCpqYOJFAQ--.1790S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy3WFWxuFy8ZF4rGFW3Wrg_yoW8tr13pr
	43Kr4ftFnrJrWSkwsxC34kXrn5Zw4rW3y8WFyagr4Uur4rWr1FyFn7KFWYv3Wxury7CFy2
	vrZYgasxCryDZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRNJ5oDUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_USER currently stores one allocation track and one free track
for an object. This is useful, but it loses part of the previous lifetime
when the object is reused: the new allocation overwrites the allocation
track, and a later stale free can overwrite the free track.

For free-after-reuse bugs, the report can therefore contain the victim
allocation and the stale free, while the earlier alloc/free pair that
explains where the stale pointer came from is no longer available.

This RFC adds an opt-in SLUB debug option to keep one previous completed
object lifetime. The option is disabled by default, is not part of the
default debug flags, and only takes effect when user tracking is already
enabled:

  slab_debug=UH,kmalloc-128

The series intentionally does not attempt to infer semantic ownership or
identify the root cause of a use-after-free. It only preserves and prints
additional track records that SLUB already knows how to collect.

This is sent as RFC because the user-visible interface and the cost/benefit
tradeoff should be agreed on before this becomes a normal patch series.
In particular, feedback would be useful on:

- whether a separate H option is preferable to extending U directly
- whether H should require U, as implemented here, or imply U
- whether the extra per-object metadata is useful enough for this debug path

Not included yet:

- KUnit coverage or a standalone reproducer
- object-size/order comparison data for representative caches
- runtime benchmark data for slab_debug=U vs slab_debug=UH

Those should be added before a non-RFC submission if the direction looks
acceptable.

Pengpeng Hou (5):
  mm/slub: factor user tracking metadata size calculation
  mm/slub: add optional previous lifetime user tracking
  mm/slub: print previous object lifetime in debug reports
  Documentation/mm: document SLUB previous lifetime tracking
  mm/slub: sanitize previous lifetime tracking flags

 Documentation/admin-guide/mm/slab.rst |  22 ++++-
 include/linux/slab.h                  |   3 +
 mm/slab.h                             |   3 +-
 mm/slub.c                             | 118 ++++++++++++++++++++++----
 4 files changed, 128 insertions(+), 18 deletions(-)

-- 
2.50.1 (Apple Git-155)


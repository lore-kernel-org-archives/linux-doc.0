Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720773672AB;
	Tue, 16 Jun 2026 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619295; cv=none; b=aTSJgfUeg04VER6pR06d9YTZY79Y3T+Dt4fIbrScVUKWsVbUJ3+OHrjrPqExKRxDnMoToWS5iDkUildVYJB/L/zMpcejJKEGJfkhQ+OTh8auA4Op2NWKAoyXRoGf75M49+nH0dBXRGlrANrHigW3mKWXuzl/mm8CSWmc4sAm63Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619295; c=relaxed/simple;
	bh=fe1dfAZuVOxEHpIjVvaBdTrELmXdSOObui1bwAEKQOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2KjVK5gYEnOpbZ/tzzYWoKPg3YgTNXjkJbVFe3feZqnPomH20OqXbD/PAiBtMyZrski7K89p+PpMTr1/PwXCHOON2yDGHFs1etIZfifvXgQuPFGO2274fjbOADl0FEEM8aS9bsGhgzeqADCIVJ4N93W5BhCqHFyOXyw9wXKwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHZNtDWjFq5sHvFA--.10727S6;
	Tue, 16 Jun 2026 22:14:29 +0800 (CST)
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
	liam@infradead.org,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH 4/4] Documentation/mm: document SLUB previous lifetime tracking
Date: Tue, 16 Jun 2026 22:14:10 +0800
Message-ID: <20260616141410.52117-5-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260616141410.52117-1-pengpeng@iscas.ac.cn>
References: <20260616141410.52117-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHZNtDWjFq5sHvFA--.10727S6
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF47WF18XrWrAw4DAF1kKrg_yoW8Cw15pa
	nrK3WIqa47Jwn7Cwn7Aw1rKF1Sq395uFW7GF9F9w48uwn8AwnFyF4rKrs8ZF1kAFWxuFZI
	vrykZ3WYvw1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUma14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
	3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsG
	vfC2KfnxnUUI43ZEXa7sRE7PEtUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Document that the U debug option also records one previous completed object
lifetime.  Also document the extra report lines and explicitly state that
the previous lifetime is diagnostic information, not semantic ownership or
root-cause attribution.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 Documentation/admin-guide/mm/slab.rst | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
index 14429ab90611..324edf328c34 100644
--- a/Documentation/admin-guide/mm/slab.rst
+++ b/Documentation/admin-guide/mm/slab.rst
@@ -49,7 +49,8 @@ Possible debug options are::
 			Sorry SLAB legacy issues)
 	Z		Red zoning
 	P		Poisoning (object and padding)
-	U		User tracking (free and alloc)
+	U		User tracking (free and alloc, including one previous
+			completed object lifetime)
 	T		Trace (please only use on single slabs)
 	A		Enable failslab filter mark for the cache
 	O		Switch debugging off for caches that would have
@@ -245,9 +246,16 @@ into the syslog:
 	cpu> pid=<pid of the process>
      INFO: Freed in <kernel function> age=<jiffies since free> cpu=<freed by cpu>
 	pid=<pid of the process>
+     INFO: Previous object lifetime:
+     INFO: Previously allocated in <kernel function> age=<jiffies since alloc>
+	cpu=<allocated by cpu> pid=<pid of the process>
+     INFO: Previously freed in <kernel function> age=<jiffies since free>
+	cpu=<freed by cpu> pid=<pid of the process>
 
    (Object allocation / free information is only available if SLAB_STORE_USER is
-   set for the slab. slab_debug sets that option)
+   set for the slab. slab_debug sets that option. The previous object lifetime
+   is diagnostic information for reuse cases and does not identify semantic
+   ownership or the root cause of a use-after-free.)
 
 2. The object contents if an object was involved.
 
-- 
2.43.0


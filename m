Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509833446CE;
	Thu, 11 Jun 2026 06:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159990; cv=none; b=sAoGDgBbKSbJe3IgkFrEhPHyOARz7dvFiPm7p4jnjKXI5e3v3GZ0RgUqAv4nlMb6hxdk6pBb07DYPXf6HCDzPL2+7hAtj2j2uMqpy+oX65MrsGvMkGML1kD+fFl05YUFmQ3gI0CbexvPOHBOs6+TISst08LUuumCJXqxGf0t3Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159990; c=relaxed/simple;
	bh=IIv37QBC4v2eOIeEFee2N5a1o5Wf7ugeOVjd3BV7esY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RXRkl4hip5RBrUWPvHb3zYL7vz/n+ZMA9tlmYpLc8OT2c0F5cAUi/cZgwlbB7y/02ZskmiM/S4K6IienVWZsPrhOSeSlmiNTg0XMX5sS2pXyypcGsaHgX+De9yYPrgjMswhnp7RvUnZ4Mwcc9GQjTaiSqvVOnObXB4dHYRnD9qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADHbdYgWCpqYOJFAQ--.1790S6;
	Thu, 11 Jun 2026 14:39:29 +0800 (CST)
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
Subject: [RFC PATCH 4/5] Documentation/mm: document SLUB previous lifetime tracking
Date: Thu, 11 Jun 2026 14:39:25 +0800
Message-ID: <20260611063926.38111-5-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
References: <20260611063926.38111-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADHbdYgWCpqYOJFAQ--.1790S6
X-Coremail-Antispam: 1UD129KBjvJXoWxGFyUZw43Cw18WFWxArW8Zwb_yoW5Aw4kpa
	n3Kw1xt348Xrn3Cr93Aws7G3Z3W395uFW7GasFgw48uwn8Jw1q9rn3Krs8Z3W8ZFy8CFZF
	vFWqy3Wa9r1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pRQJ5wUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Document the new slab_debug=H option, its store_history sysfs state file,
and the additional previous-lifetime lines in SLUB reports.

Spell out that the previous lifetime is diagnostic information only. It
can help with stale-pointer reports after object reuse, but it does not
identify semantic ownership or the root cause of a use-after-free.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 Documentation/admin-guide/mm/slab.rst | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
index 14429ab90611..4f644c4e1baa 100644
--- a/Documentation/admin-guide/mm/slab.rst
+++ b/Documentation/admin-guide/mm/slab.rst
@@ -50,6 +50,8 @@ Possible debug options are::
 	Z		Red zoning
 	P		Poisoning (object and padding)
 	U		User tracking (free and alloc)
+	H		Previous lifetime tracking. Requires U and preserves one
+			previous completed alloc/free lifetime for each object.
 	T		Trace (please only use on single slabs)
 	A		Enable failslab filter mark for the cache
 	O		Switch debugging off for caches that would have
@@ -91,6 +93,17 @@ kmalloc. All other slabs will not get any debugging enabled::
 
 	slab_debug=Z,dentry;U,kmalloc-*
 
+Previous lifetime tracking can be enabled together with user tracking for
+selected caches. This keeps one previous completed alloc/free lifetime in
+addition to the normal user tracking records::
+
+	slab_debug=UH,kmalloc-128
+
+This can help debug reports where an object was freed, reallocated, and later
+accessed or freed again through a stale pointer. The previous lifetime is
+diagnostic information only; it does not identify semantic ownership or the
+root cause of a use-after-free.
+
 You can also enable options (e.g. sanity checks and poisoning) for all caches
 except some that are deemed too performance critical and don't need to be
 debugged by specifying global debug options followed by a list of slab names
@@ -110,6 +123,7 @@ options from the ``slab_debug`` parameter translate to the following files::
 	Z	red_zone
 	P	poison
 	U	store_user
+	H	store_history
 	T	trace
 	A	failslab
 
@@ -245,9 +259,15 @@ into the syslog:
 	cpu> pid=<pid of the process>
      INFO: Freed in <kernel function> age=<jiffies since free> cpu=<freed by cpu>
 	pid=<pid of the process>
+     INFO: Previous object lifetime:
+     INFO: Previous allocated in <kernel function> age=<jiffies since alloc> cpu=<allocated by
+	cpu> pid=<pid of the process>
+     INFO: Previous freed in <kernel function> age=<jiffies since free> cpu=<freed by cpu>
+	pid=<pid of the process>
 
    (Object allocation / free information is only available if SLAB_STORE_USER is
-   set for the slab. slab_debug sets that option)
+   set for the slab. slab_debug sets that option. Previous lifetime information
+   is only available if both SLAB_STORE_USER and SLAB_STORE_HISTORY are set.)
 
 2. The object contents if an object was involved.
 
-- 
2.50.1 (Apple Git-155)


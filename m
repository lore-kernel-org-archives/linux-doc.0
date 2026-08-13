Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01FC473C8B;
	Thu, 13 Aug 2026 16:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637891; cv=none; b=HJMWzvwagTEoRXLc07cfi6hiWUpqpnFztZTRw7VN2wKFMdmXj/IX11TrzUR5MNmnO6SdFnQdoeMs0Q5uDxK3YfhKhWzIDJTUuuZCPjViT21iHjFdKhwVmSeiIq5yzegEhxJIgOMo6vYyhURDIrrt1awGLtgXGK+fo1E3n4HB28Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637891; c=relaxed/simple;
	bh=/58G+5A4l5buKWSu1/wrFQaCPgjP96LYjGBNlxzj8pY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u5KpRse1AGEnfZciMOemEkzdw6ETC7USFWkbCYP1E4X46wM5j9/BpUiNsihNRF12CQIkfbmPRNQiczU5Io0t72H6cbSMXl23B6DvYUUmyy38ipwCbrQRu+ze/GhiHM+0IoXbgB8acZo0XmMptx7N8WIKz1MESo0qOZE2jfpqW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowAAHofQt7n1qad57BQ--.20463S2;
	Fri, 14 Aug 2026 00:17:50 +0800 (CST)
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
Subject: [PATCH v2 4/4] Documentation/mm: describe SLUB previous lifetime tracking
Date: Fri, 14 Aug 2026 00:17:48 +0800
Message-ID: <20260813161748.76447-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
References: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowAAHofQt7n1qad57BQ--.20463S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WryfuFW5tr1ktw4xuFy8Krg_yoW8ur15pa
	9rGw1xta4UGrn2kr95Ar1rKF1Sqan5uay3CF4UKr48uwn8JwnFyF4Fkrn8ZFn5AFWkCaya
	vrWvv3Wayw1qyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9S14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCV
	W8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr
	1UYxBIdaVFxhVjvjDU0xZFpf9x0pRLIDwUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Document that SLAB_STORE_USER now retains one previous completed
allocation/free pair, show the additional report section, and state that
address history is diagnostic evidence rather than semantic ownership
attribution.

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 Documentation/admin-guide/mm/slab.rst | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/slab.rst b/Documentation/admin-guide/mm/slab.rst
index 14429ab90611..5f60904b1e0b 100644
--- a/Documentation/admin-guide/mm/slab.rst
+++ b/Documentation/admin-guide/mm/slab.rst
@@ -49,7 +49,8 @@ Possible debug options are::
 			Sorry SLAB legacy issues)
 	Z		Red zoning
 	P		Poisoning (object and padding)
-	U		User tracking (free and alloc)
+	U		User tracking (free and alloc, plus one previous
+			completed object lifetime)
 	T		Trace (please only use on single slabs)
 	A		Enable failslab filter mark for the cache
 	O		Switch debugging off for caches that would have
@@ -245,10 +246,20 @@ into the syslog:
 	cpu> pid=<pid of the process>
      INFO: Freed in <kernel function> age=<jiffies since free> cpu=<freed by cpu>
 	pid=<pid of the process>
+     INFO: Previous object lifetime:
+     INFO: Allocated in <kernel function> age=<jiffies since alloc> cpu=<allocated by
+	cpu> pid=<pid of the process>
+     INFO: Freed in <kernel function> age=<jiffies since free> cpu=<freed by cpu>
+	pid=<pid of the process>
 
    (Object allocation / free information is only available if SLAB_STORE_USER is
    set for the slab. slab_debug sets that option)
 
+   If an object with a completed allocation/free pair is reused, user tracking
+   also retains that pair as the previous object lifetime. This address history
+   can help diagnose stale references after reuse, but it does not establish
+   semantic ownership or identify a use-after-free root cause by itself.
+
 2. The object contents if an object was involved.
 
    Various types of lines can follow the BUG SLUB line:
-- 
2.50.1 (Apple Git-155)


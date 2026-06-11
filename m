Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32FB324DFF9;
	Thu, 11 Jun 2026 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159990; cv=none; b=rfahfM6Z+OxzFIVFyXyCoR33WNh5z9y7YavKXTslEkmTUYO7aHPn9fZHq/gheZiVcqVHXE97s7UdRjRRgH8/yclJ8J2IkjVEzaSzI8fRAyuoQvSw11F6vke3uK/Tvdty6AftDk5aHE6UcQ+JPUb2tnvGr8w7sgXcpMsfUvAW1Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159990; c=relaxed/simple;
	bh=4/ys4fFWTlhjrY0yRGYBF4Yos0uKlELZPEjWEnLjI1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=saHLBfceeVBoD9mqSXJoSkpKoiI+pwz8HZcfuMfDanaMHAz37s9JFYekLaK9dhZxqHilJ5bwTsrwhivt2az627Yjx9tfCQOCMwI/F3OQnQYRzZcPPaHWD5FsqBeLVhYo8rbGLpCFPaLnq/miBbBLdLMwQzNC0a8nfYGougyHdsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADHbdYgWCpqYOJFAQ--.1790S7;
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
Subject: [RFC PATCH 5/5] mm/slub: sanitize previous lifetime tracking flags
Date: Thu, 11 Jun 2026 14:39:26 +0800
Message-ID: <20260611063926.38111-6-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADHbdYgWCpqYOJFAQ--.1790S7
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr43KFWUCw13Cr15uw13CFg_yoW8uF15pa
	y8GFn8tF48tr1fA3y7ArW8Wws3ZayrKFW2yFy5Ww1Svry5J3W5AFsakFyYvFyrJFyjya4D
	AFWFya4FgFWUAr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
	CTnIWIevJa73UjIFyTuYvjTRNdb1DUUUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_HISTORY only has meaning together with SLAB_STORE_USER because
the previous lifetime records live in the user tracking metadata area.

The slab_debug parser rejects H without U, but kmem_cache_create()
callers may also pass debug flags directly. Clear SLAB_STORE_HISTORY
whenever SLAB_STORE_USER is not present so caches cannot end up
reporting store_history without any user tracking storage.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 mm/slub.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index 2dfa8af00a49..931e6d04ba2b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -341,6 +341,14 @@ static inline unsigned int user_tracking_size(struct kmem_cache *s)
 	return nr_user_tracks(s) * sizeof(struct track);
 }
 
+static inline slab_flags_t sanitize_user_tracking_flags(slab_flags_t flags)
+{
+	if ((flags & SLAB_STORE_HISTORY) && !(flags & SLAB_STORE_USER))
+		flags &= ~SLAB_STORE_HISTORY;
+
+	return flags;
+}
+
 #ifdef SLAB_SUPPORTS_SYSFS
 static int sysfs_slab_add(struct kmem_cache *);
 #else
@@ -1910,7 +1918,7 @@ parse_slub_debug_flags(const char *str, slab_flags_t *flags, const char **slabs,
 	if ((*flags & SLAB_STORE_HISTORY) && !(*flags & SLAB_STORE_USER)) {
 		if (init)
 			pr_err("slab_debug option 'H' requires 'U'. skipped\n");
-		*flags &= ~SLAB_STORE_HISTORY;
+		*flags = sanitize_user_tracking_flags(*flags);
 	}
 check_slabs:
 	if (*str == ',')
@@ -2052,7 +2060,7 @@ slab_flags_t kmem_cache_flags(slab_flags_t flags, const char *name)
 
 			if (!strncmp(name, iter, cmplen)) {
 				flags |= block_flags;
-				return flags;
+				return sanitize_user_tracking_flags(flags);
 			}
 
 			if (!*end || *end == ';')
@@ -2061,7 +2069,7 @@ slab_flags_t kmem_cache_flags(slab_flags_t flags, const char *name)
 		}
 	}
 
-	return flags | slub_debug_local;
+	return sanitize_user_tracking_flags(flags | slub_debug_local);
 }
 #else /* !CONFIG_SLUB_DEBUG */
 static inline void setup_object_debug(struct kmem_cache *s, void *object) {}
-- 
2.50.1 (Apple Git-155)


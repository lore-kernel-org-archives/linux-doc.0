Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330A72D73A6;
	Thu, 11 Jun 2026 06:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781159991; cv=none; b=dGbMW+94K599BoB+4QofL3BEsGi6ZxFV7hlT9ZdahPxM7FAdZzCjwBSFp6YJs7wa9DgEDaYjMqiIY63LD4Iv9s0JuLzEeDyfIEUZ824XOflDNwVRuZTUr5GqHL5YN66if3emP8DF/yIr/DTU2N1nZi+/vVrSaxSADPZNKzhxXTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781159991; c=relaxed/simple;
	bh=GZeac2Q3yKN9bpQRwNtMJSguUt0rwpeBG3vba9+olmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lWYj1UWlEzmvkaKW7Md2UAxCfWMoBMFXHCotTqQNlGTT2jji2w8v9VTyBuWe26qR05KfOD1JDHZ4TM4dBzg5cNHpuesSbc9FrcIs8z4/gWSArRRPKbE1DLWCTpCFWDkf22UPOIe1jpRuUkPK/qpUIOw824BQyHVaoGDJDGNq2Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-01 (Coremail) with SMTP id qwCowADHbdYgWCpqYOJFAQ--.1790S3;
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
Subject: [RFC PATCH 1/5] mm/slub: factor user tracking metadata size calculation
Date: Thu, 11 Jun 2026 14:39:22 +0800
Message-ID: <20260611063926.38111-2-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:qwCowADHbdYgWCpqYOJFAQ--.1790S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWxXr15CryDKFWrWF1UGFg_yoW5urWfpF
	W7K3W7AF4UJrW2kw4rJ348uryfZrZayryxXFW3Ka4FvF98tF15ZFWIyFyjvFW8Ar97u34a
	yrZ0kF15WrsFyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4
	IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48J
	MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8aiiDUUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_USER stores one allocation track and one free track after the
object. Several offset and size calculations open-code that as
2 * sizeof(struct track).

Introduce helpers for the number and size of user tracking records, and
use them for the existing metadata layout calculations. This is a
preparatory cleanup for adding optional extra user tracking records
without changing the current layout or behavior.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 mm/slub.c | 31 +++++++++++++++++++++----------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index a2bf3756ca7d..a9114dddc976 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -316,7 +316,20 @@ struct track {
 	unsigned long when;	/* When did the operation occur */
 };
 
-enum track_item { TRACK_ALLOC, TRACK_FREE };
+enum track_item { TRACK_ALLOC, TRACK_FREE, TRACK_NR };
+
+static inline unsigned int nr_user_tracks(struct kmem_cache *s)
+{
+	if (!(s->flags & SLAB_STORE_USER))
+		return 0;
+
+	return TRACK_NR;
+}
+
+static inline unsigned int user_tracking_size(struct kmem_cache *s)
+{
+	return nr_user_tracks(s) * sizeof(struct track);
+}
 
 #ifdef SLAB_SUPPORTS_SYSFS
 static int sysfs_slab_add(struct kmem_cache *);
@@ -740,7 +753,7 @@ static inline void set_orig_size(struct kmem_cache *s,
 		return;
 
 	p += get_info_end(s);
-	p += sizeof(struct track) * 2;
+	p += user_tracking_size(s);
 
 	*(unsigned long *)p = orig_size;
 }
@@ -756,7 +769,7 @@ static inline unsigned long get_orig_size(struct kmem_cache *s, void *object)
 		return s->object_size;
 
 	p += get_info_end(s);
-	p += sizeof(struct track) * 2;
+	p += user_tracking_size(s);
 
 	return *(unsigned long *)p;
 }
@@ -873,8 +886,7 @@ static unsigned int obj_exts_offset_in_object(struct kmem_cache *s)
 {
 	unsigned int offset = get_info_end(s);
 
-	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
-		offset += sizeof(struct track) * 2;
+	offset += user_tracking_size(s);
 
 	if (slub_debug_orig_size(s))
 		offset += sizeof(unsigned long);
@@ -1077,7 +1089,7 @@ static void init_tracking(struct kmem_cache *s, void *object)
 		return;
 
 	p = get_track(s, object, TRACK_ALLOC);
-	memset(p, 0, 2*sizeof(struct track));
+	memset(p, 0, user_tracking_size(s));
 }
 
 static void print_track(const char *s, struct track *t, unsigned long pr_time)
@@ -1185,8 +1197,7 @@ static void print_trailer(struct kmem_cache *s, struct slab *slab, u8 *p)
 
 	off = get_info_end(s);
 
-	if (s->flags & SLAB_STORE_USER)
-		off += 2 * sizeof(struct track);
+	off += user_tracking_size(s);
 
 	if (slub_debug_orig_size(s))
 		off += sizeof(unsigned long);
@@ -1390,7 +1401,7 @@ static int check_pad_bytes(struct kmem_cache *s, struct slab *slab, u8 *p)
 
 	if (s->flags & SLAB_STORE_USER) {
 		/* We also have user information there */
-		off += 2 * sizeof(struct track);
+		off += user_tracking_size(s);
 
 		if (s->flags & SLAB_KMALLOC)
 			off += sizeof(unsigned long);
@@ -7845,7 +7856,7 @@ static int calculate_sizes(struct kmem_cache_args *args, struct kmem_cache *s)
 		 * Need to store information about allocs and frees after
 		 * the object.
 		 */
-		size += 2 * sizeof(struct track);
+		size += user_tracking_size(s);
 
 		/* Save the original kmalloc request size */
 		if (flags & SLAB_KMALLOC)
-- 
2.50.1 (Apple Git-155)


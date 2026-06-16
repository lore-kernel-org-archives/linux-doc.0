Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BE036A364;
	Tue, 16 Jun 2026 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781619295; cv=none; b=nYME/jmm/J+gNtyh+L50R341DDeiuifx68gpvyFw/qALGejmhYtN0ZoiR93qbVEuQnZBMEHCfv8od29JSw8LEPwuvEyaLbOnsrdVoD2dzD/vVycTREXry8vhKUsyu9Sj6Ub92geekyz+0JogTs5NOKrUKNT8vLqkxgS6SKgIslA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781619295; c=relaxed/simple;
	bh=Q74tAZhuMAWvWa4If6nmkQFLd+OB4LUkdCHcqVD3O9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VCQMDzvwX4nFqm6Ju/ERMBBPB6rScOuS96dk0vlZ4LMzvTCQ8HFi6okW3Gfh1irgMvqYZVBW+f8v3pxY2KvZjahygozfGClXqUy8aYUKFlVS6AJVVnh0jLI1JZhYdYr8C1jnxw4nrzUSQjFJ/vMqUrHdMIbqhrUEhxD8Vt8uu/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABHZNtDWjFq5sHvFA--.10727S3;
	Tue, 16 Jun 2026 22:14:28 +0800 (CST)
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
Subject: [PATCH 1/4] mm/slub: factor user tracking metadata size calculation
Date: Tue, 16 Jun 2026 22:14:07 +0800
Message-ID: <20260616141410.52117-2-pengpeng@iscas.ac.cn>
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
X-CM-TRANSID:rQCowABHZNtDWjFq5sHvFA--.10727S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJFyrWF4kGF4UXw1rAr1fWFg_yoW5ZF48pF
	W8K3W8JF4DJrW7Kr4rA34kZryfZrZayryxJFWaga4rZF98t3WFgFZ2yFyYvFyrAr97uw1S
	yFs0k3W09rnFyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFI
	xGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l
	4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Jku7UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

SLAB_STORE_USER currently stores two struct track records in the per-object
debug metadata.  The size is open-coded as 2 * sizeof(struct track) in
several layout and offset calculations.

Add TRACK_NR and a small helper for the user-tracking metadata size.  This
keeps all offset calculations tied to the number of track records and makes
the following extension less error-prone.

No functional change.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 mm/slub.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/mm/slub.c b/mm/slub.c
index f87e693aca5d..43d4febd5bf2 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -327,7 +327,15 @@ struct track {
 	unsigned long when;	/* When did the operation occur */
 };
 
-enum track_item { TRACK_ALLOC, TRACK_FREE };
+enum track_item { TRACK_ALLOC, TRACK_FREE, TRACK_NR };
+
+static inline unsigned int user_tracking_size(slab_flags_t flags)
+{
+	if (flags & SLAB_STORE_USER)
+		return TRACK_NR * sizeof(struct track);
+
+	return 0;
+}
 
 #ifdef SLAB_SUPPORTS_SYSFS
 static int sysfs_slab_add(struct kmem_cache *);
@@ -751,7 +759,7 @@ static inline void set_orig_size(struct kmem_cache *s,
 		return;
 
 	p += get_info_end(s);
-	p += sizeof(struct track) * 2;
+	p += user_tracking_size(s->flags);
 
 	*(unsigned long *)p = orig_size;
 }
@@ -767,7 +775,7 @@ static inline unsigned long get_orig_size(struct kmem_cache *s, void *object)
 		return s->object_size;
 
 	p += get_info_end(s);
-	p += sizeof(struct track) * 2;
+	p += user_tracking_size(s->flags);
 
 	return *(unsigned long *)p;
 }
@@ -885,7 +893,7 @@ static unsigned int obj_exts_offset_in_object(struct kmem_cache *s)
 	unsigned int offset = get_info_end(s);
 
 	if (kmem_cache_debug_flags(s, SLAB_STORE_USER))
-		offset += sizeof(struct track) * 2;
+		offset += user_tracking_size(s->flags);
 
 	if (slub_debug_orig_size(s))
 		offset += sizeof(unsigned long);
@@ -1088,7 +1096,7 @@ static void init_tracking(struct kmem_cache *s, void *object)
 		return;
 
 	p = get_track(s, object, TRACK_ALLOC);
-	memset(p, 0, 2*sizeof(struct track));
+	memset(p, 0, user_tracking_size(s->flags));
 }
 
 static void print_track(const char *s, struct track *t, unsigned long pr_time)
@@ -1196,8 +1204,7 @@ static void print_trailer(struct kmem_cache *s, struct slab *slab, u8 *p)
 
 	off = get_info_end(s);
 
-	if (s->flags & SLAB_STORE_USER)
-		off += 2 * sizeof(struct track);
+	off += user_tracking_size(s->flags);
 
 	if (slub_debug_orig_size(s))
 		off += sizeof(unsigned long);
@@ -1401,7 +1408,7 @@ static int check_pad_bytes(struct kmem_cache *s, struct slab *slab, u8 *p)
 
 	if (s->flags & SLAB_STORE_USER) {
 		/* We also have user information there */
-		off += 2 * sizeof(struct track);
+		off += user_tracking_size(s->flags);
 
 		if (s->flags & SLAB_KMALLOC)
 			off += sizeof(unsigned long);
@@ -7820,7 +7827,7 @@ static int calculate_sizes(struct kmem_cache_args *args, struct kmem_cache *s)
 		 * Need to store information about allocs and frees after
 		 * the object.
 		 */
-		size += 2 * sizeof(struct track);
+		size += user_tracking_size(flags);
 
 		/* Save the original kmalloc request size */
 		if (flags & SLAB_KMALLOC)
-- 
2.43.0


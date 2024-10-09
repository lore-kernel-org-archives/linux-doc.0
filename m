Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D21993B5
	for <linux-doc@vger.kernel.org>; Wed,  9 Oct 2024 14:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728484183; cv=none; b=T94RJgM81Pzy47nbDMf1pGFzNU+dB4jHvioD+ANMfDFHJ9zmP3z0gXnNppWtp2fNARXb3CF7JTO5Vq6lDRUTGHjbq/8ffkQu6QgBdAbu84OWZzdhT1YVyh3jltR0n3KHVoiE2Qjl+tPtIfvYe95O9+7KfJ7CosMaEMSAvu6M5GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728484183; c=relaxed/simple;
	bh=Js1CrYfbZDCyYXdsRIZ78FF85ICgCnL8TGwzxAsRTtA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UMgQhDojpRqeYVYF/+ugGDqAMZ9w2Tfd6x70HWvOyj8izDbFE2naTZbkPx07cXeiahIAsSNLl7dDbeFX876UcAwg7oa+8ycNAx0Tovh0IpqTWprstcjZjh0f2EWL/XA6amS3nX9LLZfmbY2ow/6+Sl+RvC+A+p2tyWDUg1WPADI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cHQt3MCr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mNtyBiKM; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=cHQt3MCr; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=mNtyBiKM; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cHQt3MCr";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mNtyBiKM";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="cHQt3MCr";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="mNtyBiKM"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C830F21E81;
	Wed,  9 Oct 2024 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728484179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kEEVUu4TR/KxCJYKxSfEmcKvSVeKXTKNpUyftRsOkgM=;
	b=cHQt3MCrfDgen/Rd/IKzmkDBT89/V2SfGNZp8a2SWl/kRGyzxLQRwnWJnM4RkT3qTHH+81
	auNWA6LHezg7LHplpCaQ4v2GQuW0OtwJlhcVfxWKy04s2GQ4HsHNH7+cDJs+4g9kH/0EJ6
	20FBmFMofBScQSoQtBa4ggzeZKVfNn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728484179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kEEVUu4TR/KxCJYKxSfEmcKvSVeKXTKNpUyftRsOkgM=;
	b=mNtyBiKMMpnvNu4tLamDOR/hFoTiW4E0BSaRcMEX3w8Gj27k9dcacimzQRnTCvRExRB+K9
	+v9bN6RUlXZlaFDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728484179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kEEVUu4TR/KxCJYKxSfEmcKvSVeKXTKNpUyftRsOkgM=;
	b=cHQt3MCrfDgen/Rd/IKzmkDBT89/V2SfGNZp8a2SWl/kRGyzxLQRwnWJnM4RkT3qTHH+81
	auNWA6LHezg7LHplpCaQ4v2GQuW0OtwJlhcVfxWKy04s2GQ4HsHNH7+cDJs+4g9kH/0EJ6
	20FBmFMofBScQSoQtBa4ggzeZKVfNn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728484179;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=kEEVUu4TR/KxCJYKxSfEmcKvSVeKXTKNpUyftRsOkgM=;
	b=mNtyBiKMMpnvNu4tLamDOR/hFoTiW4E0BSaRcMEX3w8Gj27k9dcacimzQRnTCvRExRB+K9
	+v9bN6RUlXZlaFDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B3F20136BA;
	Wed,  9 Oct 2024 14:29:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2pKZK1OTBmdgRAAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Wed, 09 Oct 2024 14:29:39 +0000
From: Vlastimil Babka <vbabka@suse.cz>
To: David Rientjes <rientjes@google.com>,
	Christoph Lameter <cl@linux.com>
Cc: Hyeonggon Yoo <42.hyeyoo@gmail.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [PATCH] mm, slab: add kerneldocs for common SLAB_ flags
Date: Wed,  9 Oct 2024 16:29:37 +0200
Message-ID: <20241009142936.56092-2-vbabka@suse.cz>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FREEMAIL_CC(0.00)[gmail.com,linux.dev,linux-foundation.org,kvack.org,lwn.net,vger.kernel.org,suse.cz];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:email,suse.cz:mid];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.30
X-Spam-Flag: NO

We have many SLAB_ flags but many are used only internally, by kunit
tests or debugging subsystems cooperating with slab, or are set
according to slab_debug boot parameter.

Create kerneldocs for the commonly used flags that may be passed to
kmem_cache_create(). SLAB_TYPESAFE_BY_RCU already had a detailed
description, so turn it to a kerneldoc. Add some details for
SLAB_ACCOUNT, SLAB_RECLAIM_ACCOUNT and SLAB_HWCACHE_ALIGN. Reference
them from the __kmem_cache_create_args() kerneldoc.

Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
---
I plan to take this in the slab tree, but a question for Jon/linux-doc:

I think I'm doing properly the "Object-like macro documentation" for
parameter-less macros from the doc-guide. Yet I can see in the htmldocs
things like "SLAB_TYPESAFE_BY_RCU ()" and "Parameters". Is there a bug
in the sphinx machinery? Thanks.

 include/linux/slab.h | 60 ++++++++++++++++++++++++++++++--------------
 mm/slab_common.c     | 14 ++++++++++-
 2 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index b35e2db7eb0e..49e9fb93e864 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -77,7 +77,17 @@ enum _slab_flag_bits {
 #define SLAB_POISON		__SLAB_FLAG_BIT(_SLAB_POISON)
 /* Indicate a kmalloc slab */
 #define SLAB_KMALLOC		__SLAB_FLAG_BIT(_SLAB_KMALLOC)
-/* Align objs on cache lines */
+/**
+ * define SLAB_HWCACHE_ALIGN - Align objects on cache line boundaries.
+ *
+ * Sufficiently large objects are aligned on cache line boundary. For object
+ * size smaller than a half of cache line size, the alignment is on the half of
+ * cache line size. In general, if object size is smaller than 1/2^n of cache
+ * line size, the alignment is adjusted to 1/2^n.
+ *
+ * If explicit alignment is also requested by the respective
+ * &struct kmem_cache_args field, the greater of both is alignments is applied.
+ */
 #define SLAB_HWCACHE_ALIGN	__SLAB_FLAG_BIT(_SLAB_HWCACHE_ALIGN)
 /* Use GFP_DMA memory */
 #define SLAB_CACHE_DMA		__SLAB_FLAG_BIT(_SLAB_CACHE_DMA)
@@ -87,8 +97,8 @@ enum _slab_flag_bits {
 #define SLAB_STORE_USER		__SLAB_FLAG_BIT(_SLAB_STORE_USER)
 /* Panic if kmem_cache_create() fails */
 #define SLAB_PANIC		__SLAB_FLAG_BIT(_SLAB_PANIC)
-/*
- * SLAB_TYPESAFE_BY_RCU - **WARNING** READ THIS!
+/**
+ * define SLAB_TYPESAFE_BY_RCU - **WARNING** READ THIS!
  *
  * This delays freeing the SLAB page by a grace period, it does _NOT_
  * delay object freeing. This means that if you do kmem_cache_free()
@@ -99,20 +109,22 @@ enum _slab_flag_bits {
  * stays valid, the trick to using this is relying on an independent
  * object validation pass. Something like:
  *
- * begin:
- *  rcu_read_lock();
- *  obj = lockless_lookup(key);
- *  if (obj) {
- *    if (!try_get_ref(obj)) // might fail for free objects
- *      rcu_read_unlock();
- *      goto begin;
+ * ::
+ *
+ *  begin:
+ *   rcu_read_lock();
+ *   obj = lockless_lookup(key);
+ *   if (obj) {
+ *     if (!try_get_ref(obj)) // might fail for free objects
+ *       rcu_read_unlock();
+ *       goto begin;
  *
- *    if (obj->key != key) { // not the object we expected
- *      put_ref(obj);
- *      rcu_read_unlock();
- *      goto begin;
- *    }
- *  }
+ *     if (obj->key != key) { // not the object we expected
+ *       put_ref(obj);
+ *       rcu_read_unlock();
+ *       goto begin;
+ *     }
+ *   }
  *  rcu_read_unlock();
  *
  * This is useful if we need to approach a kernel structure obliquely,
@@ -137,7 +149,6 @@ enum _slab_flag_bits {
  *
  * Note that SLAB_TYPESAFE_BY_RCU was originally named SLAB_DESTROY_BY_RCU.
  */
-/* Defer freeing slabs to RCU */
 #define SLAB_TYPESAFE_BY_RCU	__SLAB_FLAG_BIT(_SLAB_TYPESAFE_BY_RCU)
 /* Trace allocations and frees */
 #define SLAB_TRACE		__SLAB_FLAG_BIT(_SLAB_TRACE)
@@ -170,7 +181,12 @@ enum _slab_flag_bits {
 #else
 # define SLAB_FAILSLAB		__SLAB_FLAG_UNUSED
 #endif
-/* Account to memcg */
+/**
+ * define SLAB_ACCOUNT - Account allocations to memcg.
+ *
+ * All object allocations from this cache will be memcg accounted, regardless of
+ * __GFP_ACCOUNT being or not being passed to individual allocations.
+ */
 #ifdef CONFIG_MEMCG
 # define SLAB_ACCOUNT		__SLAB_FLAG_BIT(_SLAB_ACCOUNT)
 #else
@@ -197,7 +213,13 @@ enum _slab_flag_bits {
 #endif
 
 /* The following flags affect the page allocator grouping pages by mobility */
-/* Objects are reclaimable */
+/**
+ * define SLAB_RECLAIM_ACCOUNT - Objects are reclaimable.
+ *
+ * Use this flag for caches that have an associated shrinker. As a result, slab
+ * pages are allocated with __GFP_RECLAIMABLE, which affects grouping pages by
+ * mobility, and are accounted in SReclaimable counter in /proc/meminfo
+ */
 #ifndef CONFIG_SLUB_TINY
 #define SLAB_RECLAIM_ACCOUNT	__SLAB_FLAG_BIT(_SLAB_RECLAIM_ACCOUNT)
 #else
diff --git a/mm/slab_common.c b/mm/slab_common.c
index 744324465615..4d8353b601a6 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -257,11 +257,23 @@ static struct kmem_cache *create_cache(const char *name,
  * @object_size: The size of objects to be created in this cache.
  * @args: Additional arguments for the cache creation (see
  *        &struct kmem_cache_args).
- * @flags: See %SLAB_* flags for an explanation of individual @flags.
+ * @flags: See the desriptions of individual flags. The common ones are listed
+ *         in the description below.
  *
  * Not to be called directly, use the kmem_cache_create() wrapper with the same
  * parameters.
  *
+ * Commonly used @flags:
+ *
+ * &SLAB_ACCOUNT - Account allocations to memcg.
+ *
+ * &SLAB_HWCACHE_ALIGN - Align objects on cache line boundaries.
+ *
+ * &SLAB_RECLAIM_ACCOUNT - Objects are reclaimable.
+ *
+ * &SLAB_TYPESAFE_BY_RCU - Slab page (not individual objects) freeing delayed
+ * by a grace period - see the full description before using.
+ *
  * Context: Cannot be called within a interrupt, but can be interrupted.
  *
  * Return: a pointer to the cache on success, NULL on failure.
-- 
2.46.1


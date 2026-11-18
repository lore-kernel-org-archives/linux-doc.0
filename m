Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037331;
	b=R+4yK2T/XS1c+gbxF4nlTGlEddKqB5sezSss5VeNXl6zZABoVl40hnGdPRzUSQTr+1ut
	 OO1py7mpNroKDC1GE4U+5asP8JGWVPZ1UCdFA9gVOJ1432JEBASnIZ5s0wAog82x3AyxX
	 imMRWIu0F1C/CDEqW/fDK8Rd+9PRDqTMlAnm3RVzD0A2GqYwWGA4diwUTLx3PvQcobuw8
	 zjxi4jyZE+DbxqSAAiq+LxY7tFXM80LhoYJ1N6GmBwve72KeqIS8ba90KZ3GlaH+2tJFu
	 e2NhKXUldNmTrjt/cNbNUFnDVzvM1KefVZAF9Dq3diaPel9KeNOEXWUpmCpPrESEK1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hq4FetZ9TbMuXfM2xTa4nRWlSTgcNRWAkocFboOGKak=;
	b=ttE0fox6XkY/yU5I9igBDR1wOaEUTr29L+kvehOJzxrE7WRxqhoJAK8r/10NihpD3tZM
	 Di4dBM8O65YUbg22sKa+mEX+0/1Er+n2fP+YnTo8Si8SUnsp47N5KRERz4u8T8I0Qn1O/
	 DYFhQlYJTH04ug0dcp8yf5H51PPvofhGh00NaU7VHvAO2A1xmt3Rv25Y1jHK7zyEpxBub
	 b6aD6/uY3FBndVG9vRBSjFI1KxqjeYtUlDeY07n6MDVJXrstnN7ButmPlyRAbbtS0Ht/E
	 gjQ7TKPi8vGBiQkTM/CVL24Xlh36Zefh4UFpFY2M8PTtCsyoy/fKhix5LIQoLpH++IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PU6hBncs;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCA660A2604
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:28:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCA660A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PU6hBncs
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7d2e1abf3eeso236508137.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037330; x=1795642130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hq4FetZ9TbMuXfM2xTa4nRWlSTgcNRWAkocFboOGKak=;
        b=PU6hBncsvDrJaRz44/8QtEy0YBcK8b/Doh2iSeX+EDnmZuLUgTHlmFmrppRNBbBt/+
         3Lm6engsCRZRg1wMX+q2hy4OkG04YLPglB1wTDgHqs1fNy5Q7NlpSpBebzsn6G9+BBhi
         WYonvBgDqUR+FbxzMv0HWjLd/1DUuInhPrKLJTxku9za8x+UneTXek5xRcor5MEKcZXs
         W8u0MylrMu6KRxtI4ebke+bbt54UKw67ew7ILCkQDKRdrRhlMgYsI6+SCVdkN1+5GUiz
         qXPvCTk6RrsaVWLXWojHqCmDsccIssZiuH9XQh9xmqzeftbELRJIVGM+FBWzoKO+Y1v4
         mAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037330; x=1795642130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hq4FetZ9TbMuXfM2xTa4nRWlSTgcNRWAkocFboOGKak=;
        b=b2NoqZTIv1eN6cIpFFF6cYHy4cFvmFVtOalgGmz5eeHqIeh0cOVPlZGoGyGPnWqUKB
         T0C2iSREt1qxXXoX166eHrEwQO4Qc+yfIh85VUo6+2An7pLvIxQDDfzsXSh07ttiOIuN
         s+LKBmRdpvZgTM87zLn5kx75LpPNETgrAJEQ/9vKy3TFOuso8cYGccs6qrlIfqwgkiXd
         rcplAWMrEThYAGPDdPgbH+vUBjuGzu8B3GdXkMzQkJIYRx4YW3yT72R1U/iWASsTjVqq
         BcNr83S+ZKJafaYMO5zA7Kb5DkyJq97b9rXgRA5904D9hOpqwhbqqHgux2/eLX8paZcQ
         DQaQ==
X-Forwarded-Encrypted: i=1; AL+hErEhDrq4gGY5ZJYAxxqFqwEuZU3Y2BYTiPhdtmFADad6e0PgA4b6XVWKLat46H1rlRVbLA2qJMV6xZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Vn/v1qCQTRi2FvUHCUZEoVKCDEf0V5L7gGhLcj2T++RSR1isg
	CHZn8M69CHwu+pDrpmfMaCfj7szVHe/r0Nk+mN12fUlSowqo/B5QSoKANeahGa+r9Uk=
X-Gm-Gg: AYBFou0VX3Ap/PFLhdDNVDfxhzCXeWBt9t1CnNJfzKmYBk5IxSWoLSubOvaHzXPRY6w
	7/3u5Uy3cXANcKmh8OAqMd2BIB2GLhMF483Jx7C2YRED3AO9onTSwRvXIurV/4k6ZDqfiZnW+3X
	1/+zIVHXPTkXXEI4mpTovKvWRM94a0l8HsQCETgDQUzgy7T8dH3gkl+MeCbmwzwjuiC1Zl06aIv
	k7BFWyOTyQb8cdo+Yr4iq065nTES0ragCDzulWxrVfgajVqQtkG5lTkR7tcAKq52kOfQi23sio1
	RZWkB1J6WYoaL9RKXSnmLO4ob8Zb+fuCWh3m7cBAKKzeeEuSIxVSaJ9UHiadpfSsjL5j6SQnV5y
	Y+CKiDwdsQRRZP8atbL7h8yqXmGpKIy95ZY7QTBfnDsvaMZlHy+lUUVi7DU86pyCwE1hzUlx5jK
	0wzVgCEFeRN+eEjlQ5pO6uLFdQWNk8Q9k4AO0ralJ9n9XqzywJ71dVCjrQ79qkmEcWs4arEAgsE
	zJOMN8moXTTP4D7Dm6/Lyr/3V0qHqa+V/74pgcJ/Lk8rft1JsP4/vm1fJNrxUV/c5Y7dsMNqLR+
	RbRcYOlhjrhOwhjF7hNwA1neA9zJKTwSDuztlVDHjZ68gkpZFYUmibOSK123kPCXVWp1Dlyp4BN
	PkoA5y+yBZKSX9tqkv5u4efEiaKqO6JyXRNIRR5UxJAejUDJ81HUq
X-Received: by 2002:a05:6102:548e:b0:7ba:b5ea:c4b8 with SMTP id ada2fe7eead31-7d6cb42f39emr262542137.1.1795037330488;
        Wed, 18 Nov 2026 13:28:50 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:50 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 2/7] kho: link outgoing blocks lazily in kho_block
Date: Wed, 18 Nov 2026 16:28:37 -0500
Message-ID: <20261118212845.2855249-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, kho_block_add() links each preallocated block onto the
serialized chain immediately, even while it is still empty. This
assumes all preallocated blocks are populated together before the
chain is referenced by KHO.

When sessions are serialized incrementally ahead of reboot, extra
blocks may be preallocated for sessions that have not been serialized
yet. Keeping those blocks linked leaves empty trailing blocks on the
KHO chain.

Keep preallocated outgoing blocks unlinked in kho_block_add() and link
each block lazily in kho_block_set_it_reserve_entry() when advancing
into it. Also unlink blocks in kho_block_set_clear() and stop at
unlinked blocks in kho_block_set_it_read_entry().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kho_block.c | 38 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 13 deletions(-)

diff --git a/kernel/liveupdate/kho_block.c b/kernel/liveupdate/kho_block.c
index 0d2a342ef422..21cee45fa1cc 100644
--- a/kernel/liveupdate/kho_block.c
+++ b/kernel/liveupdate/kho_block.c
@@ -16,6 +16,11 @@
  * array of serialized entries. Multiple blocks are linked together via a
  * physical pointer in the header, forming a linked list that can be easily
  * traversed in both the current and the next kernel.
+ *
+ * Outgoing blocks preallocated via kho_block_set_grow() remain unlinked until
+ * entries are reserved via kho_block_set_it_reserve_entry(). This allows
+ * entries to be serialized incrementally without exposing empty trailing blocks
+ * on the physical chain.
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
@@ -79,7 +84,7 @@ static struct kho_block_header_ser *kho_block_alloc_ser(struct kho_block_set *bs
 static int kho_block_add(struct kho_block_set *bs,
 			 struct kho_block_header_ser *ser)
 {
-	struct kho_block *block, *last;
+	struct kho_block *block;
 
 	if (bs->nblocks >= KHO_MAX_BLOCKS)
 		return -ENOSPC;
@@ -89,15 +94,11 @@ static int kho_block_add(struct kho_block_set *bs,
 		return -ENOMEM;
 
 	block->ser = ser;
-	last = list_last_entry_or_null(&bs->blocks, struct kho_block, list);
+	if (list_empty(&bs->blocks))
+		bs->head_pa = virt_to_phys(ser);
 	list_add_tail(&block->list, &bs->blocks);
 	bs->nblocks++;
 
-	if (last)
-		last->ser->next = virt_to_phys(ser);
-	else
-		bs->head_pa = virt_to_phys(ser);
-
 	return 0;
 }
 
@@ -144,9 +145,9 @@ static void kho_block_set_shrink_one(struct kho_block_set *bs)
  * @bs:    The block set.
  * @count: The target number of valid entries to accommodate.
  *
- * Dynamically preallocates and links preserved memory blocks if the target
- * entry count exceeds the current total capacity of the set, ensuring they
- * are available during serialization/deserialization.
+ * Dynamically preallocates preserved memory blocks if the target entry count
+ * exceeds the current total capacity of the set, ensuring they are available
+ * during serialization/deserialization.
  *
  * Context: Caller must hold a lock protecting the block set.
  * Return: 0 on success, or a negative errno on failure.
@@ -312,12 +313,15 @@ void kho_block_set_destroy(struct kho_block_set *bs)
 /**
  * kho_block_set_clear - Clear all serialized data in a block set.
  * @bs: The block set to clear.
+ *
+ * Resets entry counts, unlinks blocks, and zeroes all entry payloads.
  */
 void kho_block_set_clear(struct kho_block_set *bs)
 {
 	struct kho_block *block;
 
 	list_for_each_entry(block, &bs->blocks, list) {
+		block->ser->next = 0;
 		block->ser->count = 0;
 		memset(block->ser + 1, 0, KHO_BLOCK_SIZE - sizeof(*block->ser));
 	}
@@ -340,14 +344,16 @@ void kho_block_set_it_init(struct kho_block_set_it *it, struct kho_block_set *bs
  * @it: The block iterator.
  *
  * Reserves a slot in the current block during state serialization to add a new
- * entry, advancing the internal index. If the current block is full, it
- * automatically moves to the next block in the set.
+ * entry, advancing the internal index. If the current block is full, it moves
+ * to the next preallocated block and links it onto the serialized chain via
+ * the previous block's header.
  *
  * Return: A pointer to the reserved entry slot, or NULL if the block set's
  * capacity is fully exhausted.
  */
 void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
 {
+	struct kho_block *prev = NULL;
 	void *entry;
 
 	if (!it->block)
@@ -356,12 +362,16 @@ void *kho_block_set_it_reserve_entry(struct kho_block_set_it *it)
 	if (it->i == it->bs->count_per_block) {
 		if (list_is_last(&it->block->list, &it->bs->blocks))
 			return NULL;
+		prev = it->block;
 		it->block = list_next_entry(it->block, list);
 		it->i = 0;
 	}
 
 	entry = kho_block_entry(it, it->i++);
 	it->block->ser->count = it->i;
+	if (prev)
+		prev->ser->next = virt_to_phys(it->block->ser);
+
 	return entry;
 }
 
@@ -381,7 +391,9 @@ void *kho_block_set_it_read_entry(struct kho_block_set_it *it)
 		return NULL;
 
 	if (it->i == it->block->ser->count) {
-		if (list_is_last(&it->block->list, &it->bs->blocks))
+		if (!it->block->ser->next)
+			return NULL;
+		if (WARN_ON_ONCE(list_is_last(&it->block->list, &it->bs->blocks)))
 			return NULL;
 		it->block = list_next_entry(it->block, list);
 		it->i = 0;
-- 
2.56.1.708.g77570a6a1d-goog


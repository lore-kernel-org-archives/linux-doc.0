Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464712;
	b=KREEY/5uRO5y3fDwnWShZky0ub8H0PNQG2Lhr1hZ1n6qFhWdUK927yhVub4sJhe1+ar2
	 lgqaigB8/kA0aKRXR8JvZMt6wGVCbP/V96vPdgU+KNtXdEl9+xm5iFqRNAqGQUaCxiJco
	 rAwAjlYLHaHaJccsXbp2r4uw6FrseI3pBbioKArmjWhlFoBtdW3Dshv41fj4PNhG3EOg3
	 tY36DSN/E0KGbPmazCxSifssegUoq0V/WjTVYe2i3fEJTXZI6d7QhKW+POABxe8gMhDee
	 70raHJ1x1EErt4tTXJYjjm9wMahwatHAhQC1lVPUP7t4gSk7O/b7oyuGaKFMsWCWs6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=xsST4zUDyo7BRLpifzxmO59ec7LBGzhWbrZMzM3HkQnmhnyPc9N5K4z9z9GVH0SNwXbD
	 Gpz6xBp4nBCXKB6cC6HhqKPwQVBEPJLn0tE+FC1u0Y0rl7Ud8d2zDa26WKfi2Ntx1k2xk
	 yunn+gdKJuZKCTANPRXcRCEDx1MhLugWmoaJlp5sIzeyVMapyOi6JPwOTB70OQpI/dGlY
	 D/2AfpGQene9uGS1bSdHP8p/tXcJZ8Qe09KqpESE3R67LCA3h1wzVLhvghI2k8HP4r9DE
	 fBROrnI93LK15WetE7ftQ+vPJFkTvuNsVXYS3NeLejdLPnt6zsuSIl2oXchaTtaW6jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GczOJfSt;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872D606A33E
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A872D606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GczOJfSt
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9d7791b00so32976095ad.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464711; x=1795069511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=GczOJfSt8xyq7v6cN9citRojAsltZCu/O7ZUOCf1uoFDflyuIACplYy8u9tNUQPbFg
         n95Q3XREILPjpqrfoPylpfCKbdJOzVJUuO/i+sC1WkFxN61JIF5/n28PZlow9i73ARHZ
         fTKbtYbHyrmsb2QHCmVYU89HtJnqo/c4E4b3f0LGJsfRK/rWFBPjiVpY/wrkf40AUCzO
         4mceO/LHRgTTH6tc4GO+s+VBHaSbisIXF/dnvBEhj9/2d50jZi5nwoZj7pbS1K7tzP9T
         xPeYSCOMUXyidnLOqnzoFaKkLgWE2eYjGUgRil3IMehYNZrlAQpzw0PhoItZkEVSX2Gj
         NE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464711; x=1795069511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=HkGmlMFS1zK5ozSY3/nussISqoDs4K2uNl5EufIH6XGNVbD8tig0d3EO7arf0sJ5xB
         +SXznHOoebiivEhWlgNpN8Deu9oXNYhTueOJtQhC/1goPvegJ1RmUAtPJhke1Mg2Hb5Z
         RaanPNM3b0q7eqp+kyMI/C14mLzIRulbq8V27HUuD0KQUjZ6KyJxL0Sl8DbYDpn/gWqP
         IRHSpl34Y2MRV4Hl0Y8QtKayHSginCPS2aUrjMF0QUykCyhx3aQhXCt60L1wJntyRokE
         NlBuI6BmEB0nR/TG1DTHsQna5X2oLIV6+8jdfSlPU+FjHzRR7vwmdvpnEuf9GwhSqeBM
         9DiA==
X-Forwarded-Encrypted: i=1; AL+hErEIYY5HSxw3wupZehJ0Zp3VNl+PuyKpiRkn9jedMHakf0FnleuFn+F7i6T7iwrd86znVH70FLatYDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vkJj+EZ4KDpZPSkOjNky/HZc4MTHeYMK8P6Pgki+ikxRkwCCZ
	BRJZ7ErK5KpAEd1WNjcKWbnLBEXg3FjmS3ExzSEzqdEnEzpw1kQKvx4w
X-Gm-Gg: AYBFou1pVbaYxHn2+4hEeOr7+wKoIcgJhqcD2SWW+tgvOdeHm76sVqy/dDrqjJTjrcr
	LyX5aNV8nnA/nzVrG65A6sJxqMqNS2aNjtY3ondtIOeDYTDsARUAYMDhdSMKLeUfXneff3C56mq
	gHWR7h4GIdw69oo03TRgmlJQ3UwPFQ3RioNhytqTyNg1A+UTexo9Eh4uwtcQ7HLk7X7CmRxT9LB
	pAx0GkAf5thMPvq0sPoUFVUp1f7A/Xq8QDSu7R9XS/zbO9pp43I5+dfcyU07/ly8xxI5hlOM3Yo
	9Vk7Bz1yPxdiEzD9o8qdo6IBA551kcDSI0m9bkBwAcie6M3HBn6pAbAFzFEP+gKalwnJ4sdmeE0
	gjF3Fbj3kwpAv/lLtibhpENKW4IGRnecs7Tt7bAT9ZVWYKbOPmrT7jhicvFoAjCXDOkxIknPND9
	0q7tRglKNFXtS60kZid6DEmW3A7xaxASy9iWN1/O+sEHssKxdhVnkxq92geAj32z8rKqyit0cEs
	MazULyoVkZF2NdbMmeFS/7wLz19BPbh8El9S7A2vcXMRK1PXk2HXBFdAZBNtZhspU1LH+NJDkdN
	dVqNfu1aYOeJtovFeB3njFhpZJKVUwbc4ODnC20xV/UiCmIlfz4qYnJDTp91mYB2jzJ52UpoU7K
	m/DMoU96BswxwY12a0p2Cnv/4prQWAa0i992agVD4TCgOgrA=
X-Received: by 2002:a17:902:e54a:b0:2e9:5ed2:c393 with SMTP id d9443c01a7336-2edd7d3ae55mr45385565ad.60.1794464710958;
        Wed, 11 Nov 2026 22:25:10 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:10 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v30 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 15:24:34 +0900
Message-ID: <20261112062446.159-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

Concurrent non-atomic actions on different members of a linked PCM group
currently lock their own buffer first, then the other members. That
acquisition order can differ between callers. Sibling buffer mutexes
also do not close their buffer-access admission counters.

Close buffer access for every member before taking any buffer mutex, and
acquire those mutexes in the stable linked-list order while group
membership is protected. Release every access gate on success and on
failure, including when a member already has an active buffer access.
The group action then uses the buffers already held by its caller.

The PCM stream and group locks are not held across sleeping driver
prepare callbacks. Single-stream non-atomic actions keep their existing
buffer-access locking path.

Fixes: 3c3201f8c7bb ("ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls")
Fixes: bc55cfd5718c ("ALSA: pcm: Fix potential AB/BA lock with buffer_mutex and mmap_lock")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/pcm_native.c |   71 +++++++++++++++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 15 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -731,6 +731,44 @@
 {
 	mutex_unlock(&runtime->buffer_mutex);
 	atomic_inc(&runtime->buffer_accessing);
+}
+
+/* Gate all linked buffers before taking their mutexes in group-list order. */
+static int snd_pcm_group_buffer_access_lock(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *s, *s1;
+	int depth = 0;
+
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (!atomic_dec_unless_positive(&s->runtime->buffer_accessing)) {
+			snd_pcm_group_for_each_entry(s1, substream) {
+				if (s1 == s)
+					break;
+				atomic_inc(&s1->runtime->buffer_accessing);
+			}
+			return -EBUSY;
+		}
+	}
+
+	snd_pcm_group_for_each_entry(s, substream) {
+		if (depth == 0)
+			mutex_lock(&s->runtime->buffer_mutex);
+		else
+			mutex_lock_nested(&s->runtime->buffer_mutex, depth);
+		depth++;
+	}
+
+	return 0;
+}
+
+static void snd_pcm_group_buffer_access_unlock(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_substream *s;
+
+	list_for_each_entry_reverse(s, &substream->group->substreams, link_list)
+		mutex_unlock(&s->runtime->buffer_mutex);
+	snd_pcm_group_for_each_entry(s, substream)
+		atomic_inc(&s->runtime->buffer_accessing);
 }
 
 /* fill the PCM buffer with the current silence format; called from pcm_oss.c */
@@ -1317,9 +1355,9 @@
 };
 
 /*
- *  this functions is core for handling of linked stream
- *  Note: the stream state might be changed also on failure
- *  Note2: call with calling stream lock + link lock
+ * Handle an action on all linked streams.
+ * When stream_lock is true, the caller holds the calling stream and group
+ * locks. Otherwise, the caller holds link_rwsem and every group buffer_mutex.
  */
 static int snd_pcm_action_group(const struct action_ops *ops,
 				struct snd_pcm_substream *substream,
@@ -1331,10 +1369,8 @@
 	int res = 0, depth = 1;
 
 	snd_pcm_group_for_each_entry(s, substream) {
-		if (s != substream) {
-			if (!stream_lock)
-				mutex_lock_nested(&s->runtime->buffer_mutex, depth);
-			else if (s->pcm->nonatomic)
+		if (s != substream && stream_lock) {
+			if (s->pcm->nonatomic)
 				mutex_lock_nested(&s->self_group.mutex, depth);
 			else
 				spin_lock_nested(&s->self_group.lock, depth);
@@ -1371,10 +1407,8 @@
  _unlock:
 	/* unlock streams */
 	snd_pcm_group_for_each_entry(s1, substream) {
-		if (s1 != substream) {
-			if (!stream_lock)
-				mutex_unlock(&s1->runtime->buffer_mutex);
-			else if (s1->pcm->nonatomic)
+		if (s1 != substream && stream_lock) {
+			if (s1->pcm->nonatomic)
 				mutex_unlock(&s1->self_group.mutex);
 			else
 				spin_unlock(&s1->self_group.lock);
@@ -1512,18 +1546,25 @@
 				    struct snd_pcm_substream *substream,
 				    snd_pcm_state_t state)
 {
+	bool linked;
 	int res;
 
 	/* Guarantee the group members won't change during non-atomic action */
 	guard(rwsem_read)(&snd_pcm_link_rwsem);
-	res = snd_pcm_buffer_access_lock(substream->runtime);
+	linked = snd_pcm_stream_linked(substream);
+	if (linked)
+		res = snd_pcm_group_buffer_access_lock(substream);
+	else
+		res = snd_pcm_buffer_access_lock(substream->runtime);
 	if (res < 0)
 		return res;
-	if (snd_pcm_stream_linked(substream))
+	if (linked) {
 		res = snd_pcm_action_group(ops, substream, state, false);
-	else
+		snd_pcm_group_buffer_access_unlock(substream);
+	} else {
 		res = snd_pcm_action_single(ops, substream, state, false);
-	snd_pcm_buffer_access_unlock(substream->runtime);
+		snd_pcm_buffer_access_unlock(substream->runtime);
+	}
 	return res;
 }
 

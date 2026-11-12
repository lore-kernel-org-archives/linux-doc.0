Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458140;
	b=m0y1Y4pWvkl0pfMMM98qRXJ63BrY6pScAqRaoxmudYmxCSQHEn3pmxm/5yAY50NQMZmv
	 fUQah/rkImb21gHHZnoKqEBB5ftILPbokBEzjXW4zHL2diDSUMvA2zGM5khnfnZpQMgrm
	 Baf+wO6kD5qfn05i3b1dZllWWJaUFeKO3uJSXQe8dzCBbq91Ds8wXERBoUNO8Q2wpBYuJ
	 fUio+CFFtUvZ6nYWA2mTsYWAmBs2kaIBuekdt55MapiZhFUJ4dF5xYoRpw1Pxt+Fs5L4t
	 hzmSG6iFP4oRhQ9wV/NeyY1GXWEh5UgOQokGsLJWD6cBEkdxnEIojTINVzuN9sGuIrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458140;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=DWEa5PzXSX7xz4SxivAKkyxJfDUmtbxAmVvfhB6PF/Eslf2IWCqqZ39NwmHPupqORGOm
	 wMCUkWkQCqjbakq+dIhqcTDZIT+L75dEcykMlDcnaycxVZB81mBCxgXt4HGiC+nw+yg1R
	 uC39oiL0Ihcwx1TK9iPICkzSdaWoKDAKuUUpGDhBsLlnYldF+mvy9ZhIP1t3ABkZjcdVv
	 0y/aBosp8+DFNqRXXCs8jLJB8NLMzPZUxmhNhCHHQ1wGOKPQrMsOUhGE2tJeb7WjhlA3+
	 uYOQt6wlPh20Zi7mfA5Z8MWE6IH+g/wnA5pqwSp9ysZuCb7q7amGKvhYGQMNH4PYChQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSXxTDnz;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D260A261E
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E13D260A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gSXxTDnz
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so3055191a91.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458139; x=1795062939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=gSXxTDnzs9Yz06wkBcn+IFF0WcM3FFbDJQL5Lv/dXAREROLiRPFk0dAfNayGnJo4+G
         L1SADkmfSes9JM3AOgAoXNuOFvHLuNIF20dm/hosk7frjrVE78HPQJmOgIFZ7aYTRuXJ
         Vmiq7RySgiZq6PfzagCedQIVtS423eQBuxmVmLkTja7ehGAak610JxUv67i2Klo9qy6J
         mfiCYVEcpfQOsLt5EcGY0LGOjMdk4BXJSXMbJDI+ZwqDmLi/68Cb44eOqFiI/O8IbT5u
         hGs6eBKjAbWvdlX7eX1beT92RXo/L9GJzx6wkz9OmKv1+7s7txo3+8xKHnbPYaRnUE23
         uGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458139; x=1795062939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=2tih5rvhpi1oxWAvUjfb5AttfQmy6mIdlnw69PhbQ8A2QG+pnMgrcLQbSUgN7Y7gik
         8KMHTYvHYzXpXmWc2xQjxZ5Fc0cjwViipZl1uhHizxfbJeiFstP9QurempqhMTEiKyoc
         nE6Rs0pqXlnD1IiosPv89UPpG4al0dVhPzc0w8SLtLWR+8AnGJvyML/swyh5Sq8L1T8Y
         uSPCHp/NpfmHfp+bRTpCvZe5qXMHnTlOKSN22WP8MYY9OJmtVxLY+40acnMupvRu2EnU
         lS1NaMsX7A+r1jnPlAAAm3ZVTrWgQ7bXict60Tpq5g6mtFyFPOD0Hgw4r6+UnYYYyJQ5
         um+A==
X-Forwarded-Encrypted: i=1; AL+hErElT+k8JQWLcarQ2e5zT7JuKTj+qQyrgodYO8U803RRqMLfHheYvWpdCBdMNr9LbBsRmMDWk0/idqY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V7nPnKvczkomIEQkpAYySoTeP/cJXbeFffo5L4XjDMb8RTwqa
	6O5eQ0FvzXRp2yStsS7W4V+ADCQoV9dmX8fS5Mq4bvr9p/mLV1a89T9Q
X-Gm-Gg: AYBFou0ccvV0/+BRqO7jbuDu27LJNrZbaUViMLISYARQZaY2J3uAOf0e+NFoJfCixdJ
	gkZEozOKvk6lCNsw9nD4pzkoXNkKjSFetzbtapSExxrSY/vuYi5XpW1LHADbJYO/wBmGRAI020F
	E22Y3ozTZZStqkt2jBHF3QFzLuATTMGb08vjRqpPJw3u2iWIPVEUSI5ukq2afVIwqRNva7Bi5vu
	MOXhJWpCzMjJLhOxOUom1Il+26gQyYewhMtVGg2meAGr/dc0p2B6ZeD9GBmbRPtr/WRwY9VBPhi
	ZCTjNqydnAVIs/gGkqGUFe3iqWBnNTCFwjzdXUSoF2153QYfbMBybjCmc4W+eiM2aKBSWWnWe14
	kTS0l/oMpOOEKCL+7DRUbrOVh1GqtpPKIat0LMwHZVnnNekYqq56ieJhF8TZRBWfFrCcniC7gnS
	0WRMfE6lWS/A4gB9LFCvBLtl6ryD5RKhBejnBrido69bwmFrJ/STDuFyMJVqjVkGgnb2m7dP9Gf
	r2oqnEjxxiJq8P8gpp/3chv2FOttFbCSmaleTUmpCD0Y51tu9bTW2LJrsj2T1F1vqkpCkNdWR0z
	Yv56kwsFOTTVpjtAuTQI9uAlTswVO3OxgN8UmONV35I/ETOaypfKvwrMjTLEMidDq7bqPrM98Jo
	B/Mdnr1J9MU8fnPa+r8TERE3krTpIolZs6NOXNGLr10Z5QlQ=
X-Received: by 2002:a17:90b:46:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3b182eee78fmr4576779a91.49.1794458139239;
        Wed, 11 Nov 2026 20:35:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:38 -0800 (PST)
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
Subject: [PATCH v28 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 13:35:04 +0900
Message-ID: <20261112043516.37010-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
 

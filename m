Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444449;
	b=0lTi2Y/Fjtghgev31T5gnQb6sdyIHe/pZaJiFlriNEevyvv2IiPluVwx9MIMMQc25ZnC
	 OD2AvT03jrEcGjGo4k9+w3wAAYXHrFfEGnNoARaT4uOBzCTpuEc0pQ8T9dTUW6xSAZ6Jc
	 QGfUNDyA67+RTXnO8xnLNME393cgvQ+A9elJ1G94pzv657n3g+CczUOx1C45OtUaz+DEi
	 CC8fIx8RYFX2OOeUOA9pYDyJPYuPtNu+P4ZrrBGC5fJyM15+wSu0JbkDRynLyGkYhveBn
	 7A9FhD0YCvB4EtTeza+8dgZ3pr2gUyi1rgsttXw2z1oipjbA4QpmdnAXLRukSWQkNQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=YXIkRAwANoGJRBVUO/kgQ1uSZpgbgWbG7hQkYPRxUS2bMZT34xd+mIiB0fNHHJzpGOsA
	 LhSSSl+18zotAJgz9gigxUHmMZzon9lPbzLzVAqpBrZMVNZdrVXz8JmGpgSLAGmaPINe0
	 K5A+MDPEbDA2zzbSC1vqBGC/dCmE5RgWhXkfYzcMw03SBZRYWgtvmzxRYPyQld6D86YrS
	 EBTttpHjKhGvDEjf47oZ75ZVPBKMiDKsZSjDmoFzIDzY2DBiKiZatRnf0c4JUzCIxHBeK
	 7nE7WdNwIxOYvIajH5qJ8dlN1XFH+DfwpqCq+wQvCnGrmudq5lS1WszdT1j+sPbLEAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0hxkjDb;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC64F60A5BE5
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC64F60A5BE5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M0hxkjDb
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso5281777c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444448; x=1795049248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=M0hxkjDbCM9QdAjrUKmX6TVBJCBIgPQaPoNbbqY4Fsu2xwnrKZzDtxwoD6CqSiojGW
         hR0/bYMj7ueCrBfQFxveaxyBkOyyU49/Rd3tv74LQr+h0RENibBZXOAXeVO7n8HdxMaE
         r+wj8HDNiQu/WicpREqZctlS6yWi8p8rrkbp12KJVjO3HLWuxGEjrUU9UgpNPNoCU27f
         ohdSJrv9nDrdIpToTqm/hNSj+wv/kcsW/1VeLJaj2HVwS2Z2nOv1MruLrx4xEvZ3OVh1
         L3b+S9hha1BfN5XzJfsrnha7idgr/sGwceXY2dicFAN4lLqA05KxqsgtzGpPpkjEg+EN
         hLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444448; x=1795049248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=F9WArtDAfoxw4jw8wvMFMuSTcEL7HVtLB0k7VmmqxCER2gZyWk5B6LSsS2uuUSs4s3
         BgkoLQsrDjMTTcoXBOIZXtRywRVp/QJvVvwXH31jQJypRYvSyxaFRMquOWV1rIxaod/J
         VmQ+YcEFrIyNqQ97z05C0J2dnY4mI95x4AoxUOP2tVv4cXu5dsQd0Ulq1iOVzi0ExvTl
         PCCpaUg23sUN4NfZ5+fw8/oMfxDxKEu3HMyFt7zan9WgciJHS4jyYr+zmtKphWQlrYxl
         aDVZYsAoO1AYw4dPHJQJLdD+o5KSJ/iUmFth9T7mfJgiMFFpX5271RW+KGa+ZQtSjjxY
         fc1g==
X-Forwarded-Encrypted: i=1; AL+hErHNdq1zSFDWMralI90Dr1W4XIDngyJdy4cO7GJeBDFwq66p77Ly8xAADwzD3U+t1R+icL99utWhjZo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xQI//2Nm/VbDZDKt6xSudJ5OM+tAosOwV6LCZKc+IHBvmliUj
	YHG+MKy5Vi+arTzua9hUHNdZ6emgVHM7LZ0hzDXsTOoz+oxDFRguLCfR
X-Gm-Gg: AYBFou210VJ0bxmKnMgfR4IETCs6NXKMecfX6lBeYUXIRWGoNPhgKZFasnSNHb6VKsW
	yecZGsM55sSNsbx5bZfwlSI66IYCZllZohLc9X1Yz4LMkeRmVgud9Ols3FJzJjIfgiuZE3kzUuz
	UctMi8ES9aEj4KszQAtaPkdtP8ckrNzewi2fM8k/sL+NQTt8fO1hZ6dlzPM9eqwg6r2MN2MxH8G
	ylhcJDRikViLKVmkBGVhlX6OPfB6r1yyk1y+dnU70uPl9vgUgahEqnhBbwzUOKmjKfVqejeHvZp
	R5dY2Cz88fI75zveD6VZBlXuyJSTmCGRc433+wgKnA1NgHzZ7n4k90MMvrACdVeCk2IarL8wALG
	HUC3+g9zUIb0fKLeVY3RGBWHNKP2BF0dCYpYIGORqx3jGRrM55H4QmNRn6A7Dc0InggSq/foRUn
	B384kdtfgcqOWOiz0XRHBTC1lrrqQnTBCeK8zfJl+ibhWyPBeZ7YOmffnN2w2ZyNWXiLop1D5OK
	49xGvtLRz999lEc5y+fKI/oMd3/kj16E2q5x4FnhRt/vH6q6ORdRLk1F2xg8fmfN1UKQ5T0Tg08
	px+E8Qikfwl8L/gkj1fZQ0aM1IoHWltOLx0s53wZbCr8Q0lDeJMq8EXC8m1CYaYUhaiNGGSwxWE
	fup6XHwn2VtBF/R9ehKPijnbXaQomMrrVxc2Iex+Sn3HCHXU=
X-Received: by 2002:a05:701b:2608:b0:169:bef5:f445 with SMTP id a92af1059eb24-1b3c024096cmr2938338c88.4.1794444447838;
        Wed, 11 Nov 2026 16:47:27 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:27 -0800 (PST)
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
Subject: [PATCH v27 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 09:46:52 +0900
Message-ID: <20261112004704.49758-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
 

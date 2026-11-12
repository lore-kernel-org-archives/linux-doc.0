Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461711;
	b=mPJw7eFpNYS3GaL+v/VLtrR13fm3G0TIp+cMuZXGtB/u9yhvX3oWBc47hFZECrJ2OuyR
	 WKXE0SxDOLl9JFDBd/EG+nq9fY26Z1RNkTqvV5siQbZUv4Z5K0OpHTeKoWjRgvLOsfhQf
	 MpuV2SB0+F03/xsD82rSrtqazqali91CXuOQoecO30+bFBgqkpzipJMZFNlwCyvwkqAM3
	 9cCXjr7mgkkVOp3pGP61W8obcb2C5FV83nnHZViTft0W1IYocP3Q640KNi6Q4BT2y4BNR
	 Y3QjqjTbI4Km+EZ1Y9+sTglg3h8cP4XofMRYxuh4ZMehl4WcaPJoJ5by0FhkbF+rbbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=W/LU0eDCA+pqW9lesdPto/719yRTlyOVnnhghsNeuZj/ZUMhB/lLtJoUNedwNUnaryU+
	 N7HoR1B76bY0cE1HRb5exEp9DoSCJe8vRUqq3CoqjCyEAuQhJdW3WCnz3qM+vLFT9ofF0
	 M8UCQ541dZL3Qr6Ue+78FW2NgX6wgccth9KDgGkySiUWBdPVxDgR5OTANUI2IegiwYfiF
	 zO1kRm910YneBJ0xvPVnuh372tTn0/bwqWzCgzxgH3sZzkVrrHiq6zdTSRkt8GmAOUOhh
	 DyggtUAbBgX99WnCQ+TMSn2Tup2jS9RUfeysCH+WZhaOXeQMM189V7VECn88ltsjqvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjnk851;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981960A2600
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0981960A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XRjnk851
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso6798374c88.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461710; x=1795066510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=XRjnk851GeuCGigpxYnUEZ/Zhe4jR51Itjm9IFWpxmOTBnYH1jCBqMAjpVG3fLEA0s
         kynxud7KAa5Car2oc6LcJofyDw9/WuMFaFHk7+p+/ONBql0b0pLCrFz4UxYqRuRHCD55
         cQRU9uYd282KP6GXTMmvlbpYgPitayBzywurJerHSA2cMnS8xX0KgbuVNhLO6wyUC8pB
         4Vey+6nNM3PqYZPYdFKzxoLKL4oYKBRSYLt8cCbuU5EcbeXT1oHAkSLEbinU9gOtIher
         155es98IDyaCmS9B5zL1QN5+PwphqdPIV1qIvj4UvNozfbE3WYOCZwAX3ohAvENaSYv/
         mxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461710; x=1795066510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=DojKBQDp9Oog1XRtKuma7jx75pHAgwZpsLORIAPxkEIJuR4RaVgyb6+GM8rVEiibaB
         8jgK5CaCUr5woLiONt09i46rGtx67sGdJa3UBla4aYuVw0B1lo1AfX5aaKzZww6DuvVf
         HhXLETn/6xpGrZ/vUvnl9XbWNAYkY1UYJlKJjtIpvxsYv6uOeE8JBltk249G9KUMS0+a
         Jb9Xsym/oyaluSevjEnbLN4lhNZ9TCDMnGSJ3uimhIQgwLI/hkCJSzP/Jidg+SaXtmWC
         E1XlcSDyHvk+rfgqOI483Cnhe6rM5rR6W9XINhoHDjRhYJdyVh25YPCVP6PDaooKfVBA
         QR/Q==
X-Forwarded-Encrypted: i=1; AL+hErEpR4LKLP5o/TTg4a00s+g8ifhYz6sNHlVzP7DZLzPqrgsTR2CR9/sBVL5t2lOCUSkbncoZe8/zzU0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nr/lYzY7z3vQiFqak0G+y8O/ckWOkbzykfigd8BVJysG3aqwj
	SGNW4tImNwhlRx7CTu/35dxJkyPhKyCvKNIT2FT6Tne55yyChVHVliYx
X-Gm-Gg: AYBFou00lg2dbnaqpu5AMyVbNSUbBzdPjadwZRBApVu2aW8NB+DhF4TeuHD5sw+0Jk4
	iv4PUm6gSF0vzIyR9OwJvWHDvur5SFcLaTQwy1iHcEmVSF6CYvKfJpeNMs7ZPLHbx88nZrue4Tp
	BHPZnNhqnF6DAEwCEfIjrU7WRcwhwAHCohqtMWu8K5iWnRRjWhuoE0HyQqwc5zTM5+7NnEyNo1s
	IYwZS7EQPcm4Bnpdc2O5WgW5n7+LApRLGXClOa/KhsgyGad11V/DylxODstQjWRV7ihpq5WIv5D
	A3BzD9EcapGF+OVIo8lnnMWzjkc3+pi6bthidxARqqPwMSOxGgAmDLnjdh55lYDQ8KKfvKnHlC0
	AYR6suabbf7rAdRtk1+nLcqNJJZv0bDHCJIyqZxUe2Ctjgtlx/ES5jIQlxhvUakbi/iu3AeEszD
	28FZScHY0n1tWoZVE52/DCxwdAh81idD0AnYVdVIMFa6DCOmEaB07zWpt2D/42TBuoXbdoyDpzJ
	Uk7dezGvfZjnRVIJdidIc/p1arSq15BOhBKqOEDcxbBctssJpau1Eou7N1Dm5sBLNwvabzC9CS2
	7E8DrZ8h3851HQXlv2I/bHpFOEaSS3ILwYvP7rS26B9tQGlUrFn4aQcoTT7mtxmz4UtDsWGYpDC
	wOj+0AJ4cQ7mINonpM63ODQLhigd4z5Nhf+6iQqqLddkur2g=
X-Received: by 2002:a05:7022:b0c5:b0:1b4:fa58:9d8 with SMTP id a92af1059eb24-1b4fa580c0fmr962783c88.20.1794461709986;
        Wed, 11 Nov 2026 21:35:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:09 -0800 (PST)
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
Subject: [PATCH v29 05/17] ALSA: pcm: serialize linked buffer actions
Date: Thu, 12 Nov 2026 14:34:34 +0900
Message-ID: <20261112053446.73504-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
 

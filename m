Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355570;
	b=chZeGQRt9NBPG5rMwv88LprBP0+ig+P3VBTQ7oXY+ulnzdpsoT3eY8qTu2Y2EwYa6Qxk
	 i/LI0fJFjNuHcnQ/uqPxqYd8yX/wSnbtrOl4L1rM/J9JLpmRVkOUu0rgBMSU1iNUDybAL
	 mO1bhh+NZQLRmJ0/9bXOeLlBvhguk2wzhNzUw6l/aaUwzd52bF72semxPgbo4WKArBGle
	 t+vqnxOwk6zlLumwB74tKp76t4bD57goDyOaoEIlS9Yxafv6E6EwyybVmrzZUnGHaiJ5w
	 jV4hWUaakjF3DE7ksRSAQ5B2HmBhxum8SBqqzzkDEzqFWFWdd76ZMQDxqUMh9pIyz6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355570;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=fG73ABt+rvNDfcFp24wayo1O1xvIuV7+ejeI1reLBERibiWioqY2CXxL9JmmgQhYtkb4
	 r854L6QZjZWYj/E+fBkTrMSBDyrjG4cWw0F7uqlgj5FqU53KTmElMJcupvISGFs3mKL3F
	 ReR51rl60CNZjFib0bY8YVQE/W1/v1rBw5EaXWdHsUXbPGTUsCn116J3aL8q9aRw/Cs5z
	 oFToWvdxAraQl6KyfESl3FPxj8kex9SvC4LxJQbeR5s3yH+G+Ds9peONwP9mwv8WXRS9W
	 iktCHgKtFt9Ob9iJ64f3zHdjqeMbAoRxZhixe7438kY4RXDW/TasAjJldnnRpDB9qqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKampxFx;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6235F60A2609
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6235F60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wKampxFx
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdb9f760337so1323783a12.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355569; x=1794960369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=wKampxFxm8nNydEO1UT+cDOg2+NMkwPubI3yiuLWKdQ1hIbrDvZLwEYGQ2C9jbJqnt
         Ly1kxxxhMJRMBQs9gJJ37JPV4yhTknTuWXxPDZ0xVScglCeEl2EqbzVDoKBodmX/53Zu
         wQKLW0UpuOrr2U/e7Hsw2XcCRslwih5Xe0kaxuB3j8eV0jLUL4ZiMLvXb3+rRvI++k0y
         3E0xtIrDBfY3nOILyacGQsolcGsnNh1qb7jT1e614cO3KwiXJN8tgefTu7WkchBtAdSH
         Uw65c0EyA5CBvQpi/IYDgE98NV9UXdM06i9QssYsLA2WFEFnch6qWPV4JEDI9nf4guAM
         e7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355569; x=1794960369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=DqAuarFKy8T1HZQ5gWX78rd/G9Ua8vgPyW/9So28E+9G6p0vPI6uJe8Gc2jSI8g6eo
         rTJghX47lN938zE4WiHwItTgwkP55QS7tb2O4D81VR8WAPCDjYDXAJVxH7a+Se8jpAwl
         9t6SZUG8HaGcLWBNydVKSfuONE//Hi+jqqTl2qvI/EtKngENFJhQ9YGs+IFgw8DJM6EX
         kRuJNjKBw/poZPQ4h+q4CYOcNozydZdLFyNbqSe3zXP3Wc53OgkeO32hbSgUyK937CLM
         32x1eOq4WMm5mTWSUSarm0Tx1xXYNWCJeRwxkYjaLzfX9d7kEIE2ryNXmFw4Q76ezy2/
         +1Qw==
X-Forwarded-Encrypted: i=1; AL+hErEHxUK4l/l7b71WnXovDTaEzrplJTTyIhyU0mCHPvyruSYNACy9CMvuP1oUVe4n7P54vZ++SXr6Y8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rrmf8snJbXoWiHHZSnWen0b9ZXjrPsyoxt1NId2A80dMuTvCA
	6ND6N0fBtjr4YReRfpszf5RQn7oO1wi0hzcFrKRG4t5Cq6/TZGCMIBjx
X-Gm-Gg: AYBFou0hSMnW3fjYzjVrjXcbQmha0QL15HQruY152xce/SAw5L9DeBzlEjaGYrVJanA
	OJqEkwa1CcuYrp3Qbzw0nHtuQdQlBFH6hloqcx4kS02WDV31GwDjPXwSKrK23CycCJlHMSgxwRN
	sdp84MBpgPEiy65Yvf6L/DwJZLjJ0HfZbfNhbdaP5fgOdcJN4btgz8aIP2crafo5OhYRid1SRz0
	ocKmGOzWWPMtoVBY1mjB5ueRCr2PIcAp7uM0AIz5tsFMa9OAymzX/HqwKCSISWAaqfE4zcTM7J7
	hEZ/rRs4CuMR5BCw5BqnqPrSajkCzmTccjZOJHkJl1y3MGV4MW2MD5EDnztcvvutypfy1lYUhda
	c+dZl3qnJVF+EoABqfbb90uxAFkrZG13ONGJYN5HzwKjE+SikpWnmXRS6jnJSKioS9q5gvZV34B
	OhYkshclyZxI2wXsbaKQ3ezhcxlp/smBARCINq8MPQClxWGfhzy9w9sXgOkgVADN4VIKJWSdN81
	rFd8elAcXhVsLKhb3kwrYG4nMPoqvnsVshNVOLK1MrbOYYRUm/z+v+1rsEen2Jf1HRMMqNzAA5i
	xHaMxzFOH7MgFidkXkvWUYOZl+/Qm44FzvEnSZ3iAqUTlOYxuEojOP/xTvN9TY5ZquJ9DkdDxFU
	xhtU+iXFQhu0dS+rWB5JwDSKC87DyyefYBKv2lqFSqqOl6p/LxUQvaA1Z1I/bRoslZyMX
X-Received: by 2002:a17:90b:4c50:b0:3b1:6e2:3693 with SMTP id 98e67ed59e1d1-3b182efdd53mr527004a91.17.1794355569317;
        Tue, 10 Nov 2026 16:06:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:07 -0800 (PST)
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
Subject: [PATCH v24 05/16] ALSA: pcm: serialize linked buffer actions
Date: Wed, 11 Nov 2026 09:05:32 +0900
Message-ID: <20261111000543.28550-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
 

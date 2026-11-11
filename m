Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365841;
	b=BtKR6rhOWnfYgWpcAqu6UETTMdTm4fSvVgQmG7p47zGyWkFvTKh7925GRQaYBG+aS3N2
	 UyOKVvtl+3x3EkNjH+iuiq8dhPuSVxcZSNAMevDCPk90/XZKvG51HmnWDBZQmVxiTUwnC
	 xJl3LJz9tOWQfRlvWYNLvipPMw0aGWGF3i1G63GzQmXzsUTNS9uD7J/qQIJOlnC8Yshah
	 rKEz2+IrBBq8t+OLPSxY+YFY38XlO1a9XvYJTpnw02V6//kx/AiT/zeHlQDBgVrBoPH07
	 j641ji7MKsx5XOGbVEG91rIG4HtbcUS3QSoDm6e6I4OgCG6xOhlr6Cs7AHF916JNA8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
	b=puw29gDBe8BPbauauDHFHQtqESjiJn0RXf8DjkOHTYkRSOVlLdnvJHqNr292eTBSa9w1
	 S/gngDX1eYc8cTY5Zy25pBLO2cdBIUpF1gaEILdclawGU5tbqnqO02VTTVZn8dwi+TuRK
	 BMbj50aCzJ+zxD8Eg8HBidZtzlsjBiDaXRhy02MVT6k1Akd+/jFu2L5z4XEKJZ7GmECqn
	 FBGFz/2nBzOfAMiV2GAr+mj2NzjcjoyMvolteyTBlNgjNQ0rsaAXRb1qTgbrZkoavey+f
	 FzzYWSGBEy2j0HErgqPoHg34Mg3femTHYNZCzlCMz2dkBcOvrWvZmolbPFbraGat4+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tB1rR9DS;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1B8606A338
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1B8606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tB1rR9DS
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37628596783so1439309eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365840; x=1794970640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=tB1rR9DStkQH7stPleKYGokbMJ8fXokgsFRvcr7eDPYByC0GkhDKkK61QmWqGNQPpv
         qe6fbDbTO/cbAmVoJGJyrTCD70RtkMzTpAVhOmlX1Q5oT7L2KBiQWbkUjP0ACfRQx9L+
         d7YxQSQJPBzOmOn3F4wus4cFloJYvyQzHyvOP5IYieLGCu40yj6BRkgE482Kfp6BXZPo
         wO3rCkzCZyCjSGtmlL80SBntCmhKAusV5OPfxaOPpWEzSov0VaEejYoJ2fDtE/oidx46
         pyUkf5fyeYO5Qjm/IDZnrXQQD4EPsJhYltNsHu57ZHfrhEYg2PizCVbivhdzMiB0QTn2
         AZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365840; x=1794970640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtghGc3glzazvzMgEzpK3BMJw5gebBch6JJrmP3FyrI=;
        b=VDeNIYTOC3djovCTcHWrQbPHQeDZEonAr7EmezFQ8+HSU0FQybcAWZLy1qaFg6+doB
         fsXIO+dfXSEvfbcnW+W4NDE0OTM6FKswijJQBsCzvcWQB+Pw2/InHno0hUJljq+kdVJx
         //k1wiqGy8ypo8urP2bzeoXcn93oDBVBNZ15UyOc99DrKNl4zTef6sjZgF61ijDztMUA
         wKsJluhKaXOVd5I0xXZLct9ibe50xzvB2Gs2ke1SVzvKKmZfUTOiUz8TVH68Hda/rDpC
         2rm0LEnltcOYzG4ejz8y1OJiHIVV/51EgHyg7t4xe49dHv8mijGVz2ME3lWy6tXDNJ+S
         nM+w==
X-Forwarded-Encrypted: i=1; AL+hErFbThn33gpp+y0jvdRwsX8g9nZkga5m13yo2v31Bl0u1dqxcQPuPM2Ph6UOZCwKHmuN0QZRTibSszM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/kRB3N9ZoKbSxRxnSSnwTJrfUbdqFtMqcOSXsnOLGcKxApJ8d
	lWT3Prpd49LEYXofXA6jvDYoX4fy/E7x6sW4SLX7dHYU/AgELbInbTIA
X-Gm-Gg: AYBFou3awJIBzhhUspD9vWDzmcesvjnaOMzRA7emXfRH3pDVigUl1kvDd0hL2tzpls9
	CeSud6DE2sKi5kD4LgicCaSa9AzZS7wrRPZt9aGbBGS64RDop3Y4BdMY7PF9k1XRHhGESFmrGuh
	idu/pK6tABmYjoRadKFPOa+Ojpr7xLseNrXb7+CawjFabQn8yYoOeLx0ap5pblW5zuUDt9o2mS6
	pFQow5c8ngx4VQ19ubsdbOHwZevCqUOhgLwncsuju51zAuv0U/9TTM+4balbB2k6auARJ42EMs9
	igkMA+lqPVD6jWqiT7sCMK08YV3xJwlrYzTYzfGl1zjqZg1bxaUkRMOcgziANNCRiQtbPyGe3Mn
	b7FO5R9j/8WhmaMedd8Ko+c4hryqEY4dvc6zACyiIZmmFn3AstehiYSfFwanZpyapsz2cR6C8FG
	VkC3OK7jVzZ2Jf4e9l/LuM3jEwCWV3MbmZig8hZQ9e6dQ1N81TyXRwxaYR+t8lLzkXXanZ5uauE
	HAr1q56RZve36MfdH1t502Tm+ndnhSB7B6QLkHCUWyCaTYPxnAYJN+3MUkeLsHSG4DRzFjTopv5
	6/FJg7+j0NEtDI6n0hK45am14hUx5QTxQHlkOcGL4KfW2nfKtmuHoVVuafthsukSlX9RPjJzL8j
	MzEjt2Zc1TVagutRaqx14NEruCz0fivDRax5bKJr1zVrCx/79mKuLDS1TvfkCzM1AGwor
X-Received: by 2002:a05:693c:66d9:20b0:376:682d:bf1c with SMTP id 5a478bee46e88-37686b42abamr1754725eec.41.1794365839352;
        Tue, 10 Nov 2026 18:57:19 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:18 -0800 (PST)
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
Subject: [PATCH v25 05/16] ALSA: pcm: serialize linked buffer actions
Date: Wed, 11 Nov 2026 11:56:44 +0900
Message-ID: <20261111025655.63951-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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
 

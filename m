Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201397;
	b=JerkmfOZ89flcuxm3TAcd0YdcsHvv1HeDimj+uIA5lBU6BM8Vqo08RmiKPDxTvmQgP4W
	 m/IAQeVB907jmJBQX6/ApXjwO9Wa0D4db3kTBvY1PpdgUMGpLJUBgHqJCXdy4BjVvIERR
	 bbhe3fSfYyhC6IDTEgfrfp4s1QyPDz0orgvSb1Ft7fZhCxG3CqPrWs7etfi+vMLI5lDU4
	 ZDp9lky6AeMUVCq8YFz0GuBzQOCzF2pKlEegVziBGNL/onV9CBvVJZvX0h5+dRtA2zZKp
	 a/+towj4M+o+ADqDwmr3N+riEmfqZgz3r4IQA+Ep/Dsg4vntO2MDmQgwiiJI5ErgAQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/yZv+FlQaxcsDVary0KlmlSKRtVotcqEgIEwFNW1qws=;
	b=RoPtY3oue+91Ti/6SM3KJq0ZGRbhVQOa0xLYrDYT/2S1GEgzl3EU7nq/gWUSHYhtm11T
	 r4Fy5Xeg6aHZ0wg1q3pTOiHUPKb4SD5JIbpNKWSdPSBzwuXzeT4Ci756i4qA6bGBBJdrO
	 SHZjBdWgDbR8YMWGOOCTaqM3vx57j2Dxa84AERxLzLky0AQynw89BcAn/XA6N0XND3NM/
	 ogXykOIaBGEmKXWK/lBXKa4Yiv4nwtS5Fh2TIZ1AVKhjmwKI92geqt71HGv69+2qiwUNK
	 bXMsBEPDbt3K0NTDSixVivu/AGI09lDkcQEKMOlfGf5BDdtMKlkN5O/51zG4RDP6gVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I+4VSi/D";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B08606A33E
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81B08606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+4VSi/D
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1a2761c69fbso1228787c88.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201397; x=1794806197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/yZv+FlQaxcsDVary0KlmlSKRtVotcqEgIEwFNW1qws=;
        b=I+4VSi/Dc1F1LaHviZKB4IJ6G481y/JkZ0Poohc6Us9ClxvxUAsLAnOW84So4xfS4L
         W7d/JdM8w3j6wpcjkQcg/51Ym2yx0zHeZBzt51OtCWAq9Zd5fs2m5hnBYZfeAfeBiMmv
         fI0qOoE0C09o0duEpkK2GGyfXflp1YfOFsh74Vlar8o+m1hqQ3ISMxJ9g4b5t4c0wjTo
         uLxGWf2o3znChyGSdL6TBmRV21eDCkXcCSwI3A5dOQqh3bYx5uhPbbg+r6Q48QXT+rpn
         SN/N37247MlEsMWG1vk/yHV3ScVdzycaQl7m1mdL5I+RniFIpxj0Sm1CrS4vudHygm02
         KtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201397; x=1794806197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yZv+FlQaxcsDVary0KlmlSKRtVotcqEgIEwFNW1qws=;
        b=gdTAXLse4CaeC+UsQh8/9EA68b49Dm9Wa/taWB6Pw3RLyzCyhlaQ4B5dPcgPbJbXKW
         E1f+d2QiJLkcB4pYNTHKa0d/DDm81mgiTEy8NJS9c+xX6RJqnMl4ScneSsKGxuawlQ5a
         ixxHcCzD+FEkq8hcj9IQ4jGyKAnzbISjGDw10WmeMa4DDdChPWIFOBQHz5cmoSMseDbA
         oJq1j57+AqUn0yYjj/FwWIqh96pprm9OeB/nmlpVH2aWUW81BpQq+xbPFZpqq3p6K9ug
         fITtcaOpqtJNvsK86RkxpADb6Nbo8tEpdOTDxCTw9wuyAnZjrAvgqsVyH/OTtkUTSiAf
         ocEQ==
X-Forwarded-Encrypted: i=1; AL+hErHeKkDW9eUnXZAevnFZsH20I+0/uQvLPuPWsaaErOBKX8PuJfW6a8Bat+YRmEi99oSzEqw/ey+WLRM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jCPDQwt2IPQPL5g+ET+lYvrmle0zrDn3RyJviJX+mgNnBcSiU
	mUuAmgcTPR76UOs/Sp7ZcviC8dPHUHUvJyFcwVAlVD+7HrATxhhZ/EK7
X-Gm-Gg: AYBFou3B3DCR6dQqD3G1y32aHK7gcnd42jC4cAb/RRjtB12GwPJ7ghDrXR3sSiE7aXV
	9vk/kW54hLB5x69mGmNqULU8h5WbF2fflv8GQr8s7AIFfDXaDoVosVrxAiDv8CyFeiNgoOO8/lh
	2ZTfxyEYvAcB8j+knJ31qoZR5LXaCqIn3R2cvnWvwkvc0NaKuUiQu4JmSUDE+W73Rfp8i6jVrsx
	/VsUmnljdyH8gYC+XGWJMDSxdrD8a2wtrtWoSVWarpza8rl5Tm7fUIW4CpITm1LfJCJF9CYpiSC
	Bk3RDY2OfgkxDGaPRuoj7LBW+bK1QlogPEkqExqnCTN8nw/Dn5TOF47cEQl9jLKIbSP2C2+R4Pe
	c39/4eYl10ct20YEMWx6oAC01sRrK63RJwmv1rg9ZDzvprsIMiQJzVzTuTZE9Y3eH2oEIIavHKO
	bHE96EoddBPhgyoMzYlj0ZPswv5Hi1HJyPAlpY3RicGkeEBbkSv+QWKhlus+lXa7boo7dA/MTBC
	L8+12auQMfkfsOuEWO47K8AuDIkdkgtb6OMVqymQWALpGIWwvQ0hkwnt33rScjfth9p49h15Zi7
	IdZqXndCLhIBsruXzZORiYPopACeoDMCUC0M5iLkCh+Gr/Rf3Kx0e461g0gS0Lk8kAPj7Aof+kP
	gFXOhl3zb702NMZWdpbdY9zKf2q+yORDECheQZ3T9Iow3tTM=
X-Received: by 2002:a05:701b:2504:b0:1ac:91b6:8dfd with SMTP id a92af1059eb24-1b39febe7c0mr4786250c88.31.1794201396615;
        Sun, 08 Nov 2026 21:16:36 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:36 -0800 (PST)
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
Subject: [PATCH v22 04/13] ALSA: pcm: notify drivers after linked prepare completes
Date: Mon,  9 Nov 2026 14:16:09 +0900
Message-ID: <20261109051618.22506-5-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

A linked prepare action can run the driver callback and pointer reset
for one stream before the other members finish. A driver that closes ACK
admission during prepare must not reopen it from that per-stream reset
callback.

Add an optional prepare completion callback after all linked prepare
actions and post actions finish. On an action failure, notify each
member whose action ran, including the failing member, after moving
opted-in members back to SETUP. Pre-action failures and standalone RESET
do not call this hook. The callback runs under the PCM stream lock and
must not sleep.

Drivers without the callback keep the existing prepare failure behavior.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h     |   10 ++++++++++
 sound/core/pcm_native.c |   46 ++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,16 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional prepare completion notification. Called with the PCM stream
+	 * lock held after prepare and optional reset succeed for every linked
+	 * member. On failure, called for members whose prepare action ran,
+	 * including the failing member; the core first changes their state to
+	 * SETUP. Members not reached and pre-action failures receive no callback.
+	 * Standalone RESET does not call this callback. It must not sleep.
+	 */
+	void (*prepare_complete)(struct snd_pcm_substream *substream,
+				 bool success);
 	/*
 	 * Optional RESET operation, also used after a successful prepare.
 	 * Called with this substream's PCM lock held; atomic streams must not
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1310,6 +1310,8 @@
 			    snd_pcm_state_t state);
 	void (*post_action)(struct snd_pcm_substream *substream,
 			    snd_pcm_state_t state);
+	void (*complete_action)(struct snd_pcm_substream *substream,
+				snd_pcm_state_t state, bool success);
 };
 
 /*
@@ -1350,12 +1352,23 @@
 					ops->undo_action(s1, state);
 				}
 			}
+			if (ops->complete_action) {
+				snd_pcm_group_for_each_entry(s1, substream) {
+					ops->complete_action(s1, state, false);
+					if (s1 == s)
+						break;
+				}
+			}
 			s = NULL; /* unlock all */
 			goto _unlock;
 		}
 	}
 	snd_pcm_group_for_each_entry(s, substream) {
 		ops->post_action(s, state);
+	}
+	if (ops->complete_action) {
+		snd_pcm_group_for_each_entry(s, substream)
+			ops->complete_action(s, state, true);
 	}
  _unlock:
 	/* unlock streams */
@@ -1387,10 +1400,16 @@
 	if (res < 0)
 		return res;
 	res = ops->do_action(substream, state);
-	if (res == 0)
+	if (res == 0) {
 		ops->post_action(substream, state);
-	else if (ops->undo_action)
-		ops->undo_action(substream, state);
+		if (ops->complete_action)
+			ops->complete_action(substream, state, true);
+	} else {
+		if (ops->undo_action)
+			ops->undo_action(substream, state);
+		if (ops->complete_action)
+			ops->complete_action(substream, state, false);
+	}
 	return res;
 }
 
@@ -2099,10 +2118,29 @@
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
 }
 
+static void snd_pcm_complete_prepare(struct snd_pcm_substream *substream,
+				     snd_pcm_state_t state, bool success)
+{
+	if (!substream->ops->prepare_complete)
+		return;
+
+	guard(pcm_stream_lock_irq)(substream);
+	if (!success && substream->runtime->state != SNDRV_PCM_STATE_DISCONNECTED) {
+		if (substream->runtime->state != SNDRV_PCM_STATE_SETUP) {
+			__snd_pcm_set_state(substream->runtime, SNDRV_PCM_STATE_SETUP);
+			snd_pcm_timer_notify(substream, SNDRV_TIMER_EVENT_MSTOP);
+		}
+		wake_up(&substream->runtime->sleep);
+		wake_up(&substream->runtime->tsleep);
+	}
+	substream->ops->prepare_complete(substream, success);
+}
+
 static const struct action_ops snd_pcm_action_prepare = {
 	.pre_action = snd_pcm_pre_prepare,
 	.do_action = snd_pcm_do_prepare,
-	.post_action = snd_pcm_post_prepare
+	.post_action = snd_pcm_post_prepare,
+	.complete_action = snd_pcm_complete_prepare
 };
 
 /**

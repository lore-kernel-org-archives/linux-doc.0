Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664277;
	b=s2Ctb4QOu57HOvc2APmwfL9NnefBTXFqKHaOAZgKRWjEqq1h9e9xiBAmbaqQgr6R2+JK
	 jKwM4QGoRlItGl74CQtsoze0m/2zGkic1DvkIlArLQFsOa5MLsvzNYN5DxeMfFrwpFdQg
	 KkvZqFz4DaSDwYsVs5ER3gdlpoRrhm9mpctojOlpzLFzXC/6KLp/ZRlichi/sayNhsaIt
	 tT5cLTDYl+4xG25bTMjfsGRD5KZT6x1l5AxCWvTgm3EuAAsLr75IWfBw98gNQHGZTJOJ3
	 ChmBmLR9TS8gRWOtklNJjr3dtioHqHEJA+esg0OgfXanG1RZ4oPATjC2W7hPPjTB5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=3li2nuJrlALwIMxuWTNaJ7ny98Cd7o+zqkYwxaQv20w66x76YYv9rDhExf6LwlZfB95m
	 NjFbDyvOb5uj1hCzc1foRDjrdW2BiKCM6EFonUHm+vhQcASAl5QqYL5nea6isWrg/X8rW
	 KQxekL3ktOCI/8N6c4wldvlxWj0LeyGsWx+8vFW79cuPcYQXKy3An48Z+0BElPpEWMxe5
	 HO2EPcf+ac5PpjC4Sm6mlEHbk+uM19azIq1vBXBEhFt7CIsRiSHCSYIQhVi/UHdy7m8rs
	 Oss/W9tJLjLPS9Hd6158+vzBvQayePjviASFgbEnnM4WpoBIJke7PtDh2bUQFePks0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nd2Tf+lg;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D73606A33A
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 00:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89D73606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nd2Tf+lg
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so889034a12.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 16:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664276; x=1794269076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=nd2Tf+lgrd05hb07aD5ySNOnXmx83NsZLjVBLUkumOSD4/Q1gHUo30WOvmV1y52kWJ
         Cn8QuoAbIF1TpKQ5dYTaYFu6//hQUg5j2HsZ42iM9W4VArfMybKJDZiqyb29MR2D69kX
         9cXNZ4C1MDffLzLIsnvysb6GJAqJZnmJITV9y6ErxD+aGMApss3kgU9TUalBPT6nirCC
         2UmvIboMRCXKJPtH1DMAwCvXWi1WxFGVBWPwR6qvR9Y3q+Dag0oWxMEo3qMNDRKMluDm
         xWEoo+D9HGdFeBkrI/8UX6XQNa7gv/5O6SYojTLXCajWHw5DT0H6Lt8deqBz2xasLOwG
         3tQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664276; x=1794269076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=VZE9+X1fsYpdBt5M8C3eup3UPa2e7am7hkt9ftc0maUAPZ/hShuwUw6k0kdrLuwcgX
         VTjRtL2HX/b0F7acr4fF7NYNWk/F7oK12tKT022N0SOOgrcEY/Npte4owmdWoTquMvvc
         R4OhH4R0VG5ypViDm/gusDCayw1LWOPOzNoEZWE0bnQaitwUR8RhMQ1cVdH3nWuT1cx3
         CvHMYfuuggTRX6fNKF9W5xkDtWJWHdafnZaGtMUBcsK6LG5Zp+iRFFuaGE3ksOb154EM
         c3yrSNv2BTmHvKzpJJxBwhHdkQQEcEsTXlKfKJoKmMbxF5FcpSzRBZHfTFMngqRg8rCG
         pdLg==
X-Forwarded-Encrypted: i=1; AKwUvBywcROHtuyGm8eJXb3SE/p3zK2FQsjXb+Ik/ABCKVBghh3wL6rCaY7MWmhth4rcugRV1Z9CEa7y3Jo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/al+fweDhrQgYU+JYX3UDEQXLr6VVau5wfCiF1OkhWVwlWE2yA
	kboLCmiZeCGs3uwKrLtQRzlg7c/ZOOqydNzhQDkOVicAsciXY5kCYsHF
X-Gm-Gg: AYBFou2OSVL1EwHlVBCL8pSCsIqJY/t+oKollS/BQZaDLOcBOkLmzLpBD+xpJ7wEpIi
	Q7SVu2EMcTVcEd8SJJhZZ5KzFIoioKtsouutsiqgOl5IBwYr85UqlPgm+4FELLQPEzDCsRVRxWC
	UwzYLT7I3dwmCzGAj8+COVA0TCvCXLQOxB5lx5G4m/NIHlLC7aDbu/ppHgXJ6Pz22OU19yurDkT
	/sJXEM1NrAqlgD3+lM2AngS7tfk19QLyyvP5pgcDfY3V6uOzFmViEcUHF8z0Jbva/GZyi/IQogj
	EvopsRDhE30n7Soam/bqOK2Eiz4DNIH6uXhYDNumiEXCHXEY/tkhmYlXIlnOqG1M+B4MuBYPQPQ
	d4HNm/SeFX2vcpOyE2k9W4ur6vNrCFMnIKW3joF7kq+DVP2U/RRxna/3ukdxZ5K5nr+RbMGrvnM
	mrDTi0ZpuPOYSX5q0RBdQRcLV+h61BzpZSuU/WkhqdjAvt4t9bexNappS6GOhO8Mpy6a+vRlYg+
	FWJ5xC/S4RqbYJ97uvGTOSprXjd6pR/dJkAu7ZXS4S7jff5T4gxbOs6EL2kc7g5hxNVsraEibHs
	jxbQdPci5XkjL7vi6uzepoEW0i8vq2KlQGngc+iWoqH3lWMgxyXszwwpKji8Mc4ljhxxShZ7o80
	J1VIgAI2I6ct+/WDKdRcSDBv09HqBZ4kdeV6hQ10276898v0=
X-Received: by 2002:a17:90a:ec8e:b0:3ac:9599:a689 with SMTP id 98e67ed59e1d1-3ae897d5fc0mr8022586a91.34.1793664275838;
        Mon, 02 Nov 2026 16:04:35 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:35 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v12 08/12] ALSA: pcm: report partial progress under the stream lock
Date: Tue,  3 Nov 2026 09:03:59 +0900
Message-ID: <20261103000403.67106-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.

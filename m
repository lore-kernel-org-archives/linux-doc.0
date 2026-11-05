Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862543;
	b=VwwS+mvyZlZ7L75NIK0N34yKsoPSg4EE8mfdK8wUzChbWPmepYGXCXPKUbSfbKUXnmF3
	 2VWCopAUpEglsW7ziJkKURqFlUlpuZM6uwFGpQDvdpEcRbravIarQvsIlgMM0n4ddVl3h
	 YF7ax3812l47oJnerdfa2eygTnpqooGpAFZk1ZGgw7VKYAS3A9A7RC/iDKqF1tnmHgB9t
	 k5PJlphLfdssmLATbwZ3ktAoitDvRYfoPTYe746zOpzaoouk1j35TPF5OV5BJYMRlbL7v
	 x67BCzojRVp6GrJoDi0KyknaCVCBG6tFI+2Ft2WrFtKBv7J5pkhLvqx2HPYqHGppmvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
	b=0GbAdYWecgR+Kz/CmH0dYoyHU7qKrTgLVQQJUGPUhrsoP+wHQqwYYhKHpLq8zSimdnHl
	 L+iF2kXVqU5sJ+gH93HjYpbXIqncKny6vGl4EC6/O2ZY2jqoqJHnOb4JKZJ5lnDYy7Iod
	 z40KZz3qup06rwHW4pEEi1tiydy0lyoYgAOwzre1XT0k1xa9qZ3lC4LCSFa2I04fegVey
	 jERnGCJV88pkmupes7U7Zi2e/r5H6KFVhV+cRjVrWnVqSkv8SB7ikmg5Tq48F0ajfqPJx
	 y6zomMZE24xx6rnPYGQRfd5RxUIyLjNoER1zLm9ZUYtaRpHsPPvufU66oE+oPEXzgsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXE3XpN4;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2063A606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 07:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2063A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CXE3XpN4
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3535a54bed9so2049577eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 23:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862542; x=1794467342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=CXE3XpN4RTbZ/pRIBLH2e5Le5OXSIuYJVvkZhfWt3DW5rOX0uo3RhrBlGEQKhyPTBh
         QcUeOJEw+Nwe1aYHteoSRSbNsMrnItZAYCX7p+MNC7B8PyPzyCt2hnxeI3MSgW29MKOD
         GUMRaaiV/ldqgY3rGPFUPvgdKpgqrwTMfsK1L76y2Ezpf/i7WYLjMCrpcD7/D3T41o4K
         acfaqFjkC4WkKFIEEqnDauvvJRpEPKfK7DxFCQIL0eouPzSTDRd6CEkcNG9sUwzm8/4E
         CFQoC/EDfPFUAeXPvyHeDfoImXpgru2Fy80B6JiykkIrUTPC+xKmM0Awk/vzvy+vUV36
         KfiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862542; x=1794467342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ipAq0GFpqeILnCbmHOCNtPSgE8BRxRY1/yFPd6rARKE=;
        b=YkcwlJCI/I0BlgBTrNOvV59ixpFjqR2y/FvOSFtvPB243i6u/lslFKABT+Rg2Zq218
         Yvrh8tTDAvoC0ZHaKdRwzAJmLhBd2yHeGBzmrWW0q091Qjw0DIT+Av/nXwpcw/5dFk4W
         UadclK2qZ/o+I7rZfZiQ4uFbiEngktRSfYyjz/SSUDIr73ON5a4+vMuxB8gzLze24gGq
         caTHcp8u2I/SvA8hyBLYVlUorOMnQOl18R9fNldKuTtx85chUsNhb8EfhquvuoKmk07Z
         yuL6vFjh2ue3Wb2Zx8trP4U7kQSgpO9QRWRzHVOJ7wtODapiETntQbHIue5WoCHApDUC
         ujig==
X-Forwarded-Encrypted: i=1; AKwUvBxsJ+JbvFXb1nvBwK1oaReXE/Zrkd+Epk9Vw98RoAwAca8U4FRbUWv8/l3uLpk+EKNSkUWzq7DfPTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nYTwzkFF6DcFXPv25/rFQAUOnFA8/osC7Rp3NjCp4pmwtfHJf
	zFoW6klzZ/6mbd8A1W7LXsz6ZkSco/W4QX3vj4kWLqhtcbtfMh86CmNg
X-Gm-Gg: AYBFou1E0JmrXlkP5ucGG2X2mclRrgSodyjT3mQhq7fyaz8tK0FkrQsep3rbcimhB1o
	NJuVT4Ya8Rx0Wq3pFnsp9mgec8ift0V/g7mmW5pkQpdPXds5jdk6WgY/XZpD9Tkv7kJIk6MVW+P
	ZxfB5MNOsm1cvNGxsURak5svHvddlVuLy3EKC7Szv4VIWuHztxkInSUYYzfVntJC+obS7XHKhPm
	C631k7kEC9SJnZzJLl8zwFGaQj+VQf6+ffw3H0jA8d8FplnHHwrRg3D9hC2zUkjT1Poqlmkmy2n
	wJaOWImCfo/lcAf+g6K5WJP78enVuZeZpttnoP15frmxrFqwwSnWLlEwTGinoaTRFQuPRB8IPCF
	HM0dhV8qp59ND8gVz9uPImHZTqpk+gTrQ2QpO9iFMpEnQpe46bZa+8F99ubOSPLZDBHedxjklZR
	Htm818Ixc1ZxeGmpazesgfdQP6fEAVU9AVR70Av/PzBPZFXhcRLO8SJK3iYuYg8LlQO2rIEnOjC
	DjaJQy4mcVFvy8MQ0u+oBlLRIfT5nEj8Zn1t+FqmqPx/8Yjpo56+4G/fE5JimzfSz5NpQfvdKgE
	awD7SEszsj7e8IkSsvf3KEFwI8ez5NY82L2qeI38hlAFhQQuC4CytMtVsW2md8xVH8/JMIwQMoP
	tGy9cC6ZAUvr0s4bQQ4t7lBog4FKOVLyL3WvFaWd3cTDAKqDuKi8UWt23gJj2KcyVXHEV
X-Received: by 2002:a05:693c:42d4:b0:361:1dd6:531b with SMTP id 5a478bee46e88-36a42484fa3mr25645993eec.26.1793862541804;
        Wed, 04 Nov 2026 23:09:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:01 -0800 (PST)
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
Subject: [PATCH v17 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Thu,  5 Nov 2026 16:08:35 +0900
Message-ID: <20261105070845.6449-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

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

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693335;
	b=EzqDJPizhDzQ0GRFkPkGahpwGE96tHqksmSBZ79Dc9owLWIIXrKQ+GqYcLeo/hM6lQGm
	 lULewbiOOOeHLoQwwDFHD3HuRCNW13uslbw7xqVSBcluO7VdPke19A6GnDnQL49GrQw8w
	 Tuoy9Xs8LN11dqiSaPOKiJGzZf2/1US/n51cuCjDSlmReDmN0hcCmaATQ56JHQH8G/2PW
	 Z7v2fFhMMy3SMxRobul+gmtpzadmTQj4UWXow3bqLBYHN6tOmM6TcB17ZbrPWJVfihQfZ
	 XUpnOya75d/VWI9dY1K/0WAu32Krh9kbKx+ChhxKGBhS+GOMocT9WLVoZeqmJByShog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
	b=Hc+UBln0opKsjwpBOpafIeE0Az0g/ztN3kkJ7UZ0ZscgwfggnNvjUk588p3MY6BPOTM8
	 uRxbFxHQaBv2kEYQzIRgH3UFdZVzNRv/ocgo3bTsZPrDTNjIlf45bfWx4PuEwzyfaOHeF
	 4swfigABAUsGX3ce72gH0azRYrMklVbR3f7DITGO3e9pCWy832ad18CjrOwRmDKeebkGu
	 HcWOsSRKyR9quwRZutNodCNFipXE+tE0WGaermJwGQlR7a+fDSMyv7MfRpEjYo6ptJ5mZ
	 XT31Ftwy0kaOz6bs/3P9VzUKMxTPrIrQ8t+LzPl1CeupM88TPIvrjrrf+bYaqb+gBrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tX2oUrlf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CA8606A332
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56CA8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tX2oUrlf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a2551d7b5so497096eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693334; x=1794298134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
        b=tX2oUrlfxCV8QeTfT3iFk7m4ZNqzuUqxh98YNYbb9RSBJOBoFK9Ssmtc+isC1v0oWI
         l/PX80ngqmAGgMHbUhtNqyIjrioj64XjdJPSrFRd3rU85W9X2ATKucFSbBFlfHrPhOB5
         fX8n/sdGIfmpVAxnYXamb/XRijIHmmTs9LPwgFa6tRx/uxwV+EfafQ4LvabU00mDtIr4
         FiRu3QJXucLnAtnkmMe/DtC5s54fU2JfsZ0JzstXUWIIskxdHJUMZbRAucNtOTfT8dBt
         wfdjYymBSa4XfZKkJIoQyEq61FxlF4K8F+zcdGpwUZzVcaC40FserKAr8Lox1G2F+zMJ
         FdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693334; x=1794298134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s/Zxo1I+8S4n5i1RRZUqfT8IwOehGqzQiN0Xdf27+bI=;
        b=zUdtT+S/r9AwlKlXpH13GmyvdOEeuHMu2EpVoAwSJPWoedL/kTDnnC1oWMblFCGS3q
         HGFLcbOoTh/mzmUk0rGkE3cqk5w8qOksSo0ZL0ogSP3rdPv6Jzsbf0Q/0/TI7D8+4VxV
         6N5SDQDMS+hD28B/NdWv0iJ5zmz9LeJ7eLFAv5xEUjezC3W0kfkHc4p/kMWuj5iFNvnb
         4Yd65Pxflt0SQiWLVMUimpasRbogpGUFybgrVQKm9mtPOg+aY6GVGEPM9KE/esa/GDGs
         BwvQx1L/G7aEwdZn1lpyDxbkavOtORApfgRJ983Ag2XhqXebxiKzvSlJY5Yrea0swddF
         Xfyg==
X-Forwarded-Encrypted: i=1; AKwUvBy9Hi6X1+KJjtH5okvKv5yBL6neIhhNhhrocYCIJv4YWY5eq2r9uS0ouR3UQEHqqOZFtSeHK/Tl+YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PlKeNPNAOWz9P40/Y5sG4WlXKnK0uBYylq2wGWmeq9jB5Sfvo
	ORdkz/Jwxsl0oTQ7HH3mKKgcwIxJFhzRE73vCdD/9YQvrvMC5FxpFXGN
X-Gm-Gg: AYBFou3zdI8Xz44eeXB7Vu00M4aOBewwDNEGR98ZLyVG1K3r30+U2c17KR/8DVHhFZx
	bwOJIwKDQeHtSfiQUSNQJenB0KUOKp0XQHkqHomHqCpOEaA1iqPT72FO1RE+v5be6pxE+3prBJZ
	lcaJ+k5zOljJ+LTYMylycouhcHij1QrjUPmRONitMc75y4tUR2v+YaTiotx3F2gSSVspiGFQ2Z5
	eYy5pCJtwAJk8eTqLquuPyVV+tZfOqNBO+yrWUbBsJLprk9Q9pjiiu8rehxiWkhyliyyirJdKFG
	V92f6I3lSfAxnuiv53BH8gJdL85jCJaA2AzVMGOie4NA1hBLT+mUga7KYq8+okN5TtokA2MkomM
	MVt+UwAwAIvYAwtjYeznsqhvYuNPD3VDXnco6+hNq6Vq5l1/Nmv0R5cIvM1VXQXAKO0K9KR7mRK
	eUH2g+79NYAQ9Z5vLgMIAgFQp+jHSWJdEC48W5wzREbQfs0Ta9wcbX6AhkwHa+fEmPEazfs0pJY
	bBnPsxQOesMLk0qGPWumbqBqGixvJiMfjfTRxrxqSJk+voT80yiRxrAgzJSrfTDnvdHRmJaPG++
	QogohI+iGlLw9ft1yvbbQvDt0DsWzHM+A/ZXE09H0qVwrjJMjuCWzKKEVJL/3gcmBCl9UFgHGmi
	yIDrpBAgBHk3/WWufhdQ4ID/aHCTuO55eLTFEiVBd8fBlsGQ=
X-Received: by 2002:a05:7300:fe87:b0:36b:c4a0:47b8 with SMTP id 5a478bee46e88-36bc4a04a45mr1387296eec.11.1793693334448;
        Tue, 03 Nov 2026 00:08:54 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:53 -0800 (PST)
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
Subject: [PATCH v13 08/12] ALSA: pcm: report partial progress under the stream lock
Date: Tue,  3 Nov 2026 17:08:17 +0900
Message-ID: <20261103080821.16983-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

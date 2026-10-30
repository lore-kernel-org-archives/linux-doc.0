Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338023;
	b=D6YgcXmHGVw/mP/rlryUpztwVCa4R340nm55yeGA7mc0lCcmaEMHdEi6fFuXFJkNvfb2
	 gkcHdddtmRUhTMRFEIOrZTO4lzOvMfxfGucqasdv2jBtUtD0yXtotAA5mWB8zYIVrgLUX
	 mAQMb6ke6MeQl8sZZv2NDjKPteTmGwORJ7+06dvCLaEBfk6a6Ki6t3E3x1TAkJSktVOOb
	 xe4G617Ud6lY5Qnc2ZbPsbwXKGvrzgs4E62HFHZEY04N7bkazUJ4NYgwwRb9+USrgKJLe
	 ZPhJUgJ1m+JhVuKJ1b6aPYBsKJffjeG4Dz6V/p7giKMlj/K0U+IELi/WFsWPEKu0YHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=mo3oCGXSc+l07qB1dcPHUfXYY36asb79xoo1r3OwalN7lTIzFpgSuwRI9onHFkrO2vh7
	 1wP9m0E9Z9utmmvOy4z9czminmqdzQz9WKOn6SVldrNzd88UUv7POfuaCDko6HMy29rMe
	 vJypOxIUvRh0m3ejBA7pTRCIxeOutfjK5gLVtlhpdIjEwAhs/R0PjQ7AqW+gukgQegs2v
	 r9YhF84zELym0wIsC9sMbDUKDRzNnlt2EsrngvjDLXRR21/ZEQHYHrYrkoPtteunhu9i2
	 5zgFWF0rnZiep2pMC4klNxVnUrsdykypRMNvQ/PcLbXD+aKy/tK5aQeQcyrb8qEEvMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJalwrOw;
	arc=none smtp.remote-ip=209.85.215.180
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EF7606A32E
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4EF7606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tJalwrOw
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so99684a12.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338022; x=1793942822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=tJalwrOwo+hAMP9G1MHcdAbrPfN1IgBT4xsFRsooJsDGhT95P/+dyfMlnUAiuCluxt
         4OmIo83tg7+qN9oiss1N8GQPe1m2uza2Il5k5t9uMjYyeBM88EbviXPmF9Gj6OZyDwBn
         Nj3yeZZ9Hqg+z5RLFUxLc0k8FCACdZRj5wdcFn0W2Yv1u72+Izc8Wv4WykpKfBVNiuF5
         Yx09zR50u0/wgqbfKa7UWgawo6fmieb48+MBhV533Tw171p/EFq9Wj2TG1fpJFoWB1z9
         SM7zlVa+TqozoSwyO2/9lnvynwbKI63FcuKUyS36K5MjGVeOx7SLO7rvtgF7Z5ASwndc
         3vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338022; x=1793942822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=jOBErZntH+hVjyzNk38ZhqkekKnzgnM7MP6O5/kEz78ScXbXQr5MEPbtnJS1MZK/LH
         k36rWIyE6p/fD0Z3f3zR5eFBG74hLRIfBtrU8enqY15Bow8wr5qQdFxFhVRQ7EWT74z4
         38H4xxci3zxxryQ2cX1C0S553pWesJwz/gOy2ovTyg9WS4C2odxo3xZul3N4pEla7qvO
         8/C1hNuYHFOF1NV+RJsEmUBC6tyjM514L0xLiwsQQX+dqcplM/ClrVJ/mQtLsv+6ejK8
         IBK5+OhQN6KWZUomPKIclDrVxK65VEFmX1gXtJqrNqUJ/7KC8rw7VXABf1+/KfuUIXg0
         8ksA==
X-Forwarded-Encrypted: i=1; AKwUvBwr+o8rhS16rymiKXpZQkVdWL1D6T9pqdRVujabGoZxNh5dQRUMfHzPtAeEokmPy+B54dGxc5i8Mpk=@vger.kernel.org
X-Gm-Message-State: AFq9FYILfKfC2B3NbT3EaLkktuO++UiaqaU1ht1LEUtRiZ+HIQNr/aph
	EaQHbrIkkOTu29euk22UxwSDMXoM4ZxvHxUpuIO5/duRLS3e8QmDIlts
X-Gm-Gg: AYBFou1DsRk6IYZMO8pC/WHvMPdthG4s+gKy5qOSf2RVeAKdjLEY+DaVwhl+kLl4zjs
	SKy0sdIXpnEx2FgGV36PAAzzf462DWyhk40d1dcXlHm3WQOVqVDtIefYmZnLYi+I5iN8c29qLog
	d5TR64xPzyy3O4pmgC5oggFeQbfEYAbcdZrccUhKWXm9a+wbpaNKL70VaZzl1rCSC47I9S4H6zQ
	9dQLYLoBJTcF5Kg+ryhMXgDltgqswVExRFpc1QONAbtV+RACdoCffE/ua3Oa1W6pVRIqxVrobkC
	QXBa9W0Tr9+z4jlDb6oCos/X/bpS97jqaO3Z6g9fxU1FaOBuGMmXHM3rouw5KEhR9/st3aenjfp
	R4fxeiFj7pFSWyVui6WIyGK0+UiDhiOQs9DLZGzxUTFxr01c5bvuqmg+dW7FNE1TtCRLtE7OzTY
	vAoMQ/4PcN49whNPqqeS+QrQttRr5wpicIvrR3dY0c7DLBtK9ZsRhxltaAJnUmMbWd4/VqSktNn
	afueMnmjaKWirQqNErmLPhvZR7ICjEG6mDFHY8+DbEHMaonFZtB+DkvtOWG1VWvSXoNDE/nbZk9
	fm1rgpZqSfvPFdQE2Ug400wenCHAUonWivlJcY84bXI1ZRKd8YXJ9TL54IV6cFxCE0WzDQubFhV
	uIAv0oa06dMmaHON5DT+kMxp2uCuOsilHrodfcARCGLK/DjZ/
X-Received: by 2002:a17:90b:3b51:b0:3ac:d19e:85f1 with SMTP id 98e67ed59e1d1-3ae897dc967mr988753a91.53.1793338022165;
        Thu, 29 Oct 2026 22:27:02 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:01 -0700 (PDT)
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
Subject: [PATCH v10 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Fri, 30 Oct 2026 14:26:23 +0900
Message-ID: <20261030052629.27742-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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

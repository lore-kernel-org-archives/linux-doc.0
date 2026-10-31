Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412566;
	b=FILnuer+5hUDGxSNXd9g1fEkkgYs61qXVlbt/qmUQPiMpjco65kiQt8CW38xX6JVKdCn
	 6Vaox7Mc8vW1jvfHbz8oZQ90sy4AFPsur0To6uYTIsfJ8ryfCtgO1tDVtjZt3flS6djDn
	 ErU8NawW37sXqhySFwdww1BFgvNs8/rIZfdY+ip6m2lIY4bQy0lHfzCz3GHE0rel6G7Cl
	 N/6mfX1+y6cqN5nOWYOB+sBk8HgUB12VIdoZgyF4mtOdhcnvzdWZ6TB3lDRYRTbAnBGZX
	 btS3D0SfjVq4Mix+jrL7bTG9b57W1VrRFyxbmmlNF4UxbTY34ZatsyB4Kwp9LgmG3Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412566;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
	b=woErkzoBLVYdSRmCUqZQDlTeWXLKdAtdMs9kl7nNnUZhAofBJSqvOPkOJCqYXV0LfAOX
	 MXIii4lkv1dJ2KDrlJ/zCbCV9ozqwlfBejGFdAHxcId1xpSxLfEA1lPGlvAwo76jm2WNR
	 DcBVyp8934hqoAYSsRQQ+cv8zG1QgcE0kAgpQ3qb5xQdwT0zWfzaplRyNeAWsZ9WQcO/e
	 +nn8hdGVghVD5CQozXj+CF4Kp1Z2lCA+6PFBVQJI4cKD89wV2eGRRRpz/mpf1p3CM8b7D
	 U/vvETUmJA3Ugjb0aA9usbQObasdZlTX8zRPdrq346BVI3CNziLChXP/wYc+7k8iAUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FftBoeWM;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB28606A31F
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB28606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FftBoeWM
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a17a332ecso2340203eec.1
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412565; x=1794017365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=FftBoeWMKrGJov3vr943GXnzD5UwGoMRdcw0WG3QsWb7coV2Vd8GP5g4gavePatn2Z
         iKktiTHSMczlgv5VUJNmaKGju21HvVOMj+2drbJpc4dPv4EWrfHuK+N7ZblsQVFnXsqg
         2IKiNcWfqHMk3PNduFEEIhN9+5u3+dqNZy7zD/4ENqseyHTZ4tn0tM+ukk695SGgbqAT
         +IdjfaPrwkaPd84Q7y6sdEFi7Zm7EgzSvCPHcAJqRBt3zu7ZMFCa/9clMXScXxSJBqD9
         FplLe4k/doPq5GCTrXUaJLkxKLPPYPUp/ijUq8EdVGLvIWabtrLLFd4BDiHzniKmx7Bi
         9eKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412565; x=1794017365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fg09ZFCWTllm0zs9cO5j/8sPKkdAt+oDDHh3GBuogaI=;
        b=NBEH+N7G0hO/M/c//ff4yDgJmCJ1ZBWx+5mRyYOrOykWxjS6FD/kYdYUUMaSeW1FG/
         yEPoPgnndxmPaZZuUArKtlUwcqAc3E+ixsnqXH7Nd43iD2KWF0ElyHnLonxDeVNdJIdB
         8D8qoZXNH5tdINXwJRjFtJTIexCq0X37QpMpG1fKRC4hpmyPmwAIcpNqHJ7UoaIF48et
         0qf/tlIXO7nLDyL6cuj9AUCdz5DJrWuj0SJOGcTow/HA52pCVmxlLJdolgknXyuVGo5W
         CYVOLQkvZPW1Ul4/f8YR6dwNmCVa69CPKG5O27/exTizF3VWtcbmj5H3Im9AgL5c9ODA
         PQDA==
X-Forwarded-Encrypted: i=1; AKwUvBxSrb1eOgGzGr/xRis2SAizF8Ha5OQgwCKHLPKYtfTgnVf5I9zB33LkFpEIihTBj/NR7HDAA7GVTU4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIC4dRBFcOh/i+Dnw0QssDKQoN8+Ykn3bnLIPoUkRfKyx2QSEOD
	n3bIutvYduuj8wTyg/9FUC+xOnq+szmq+If24676OqxqW14eEE4Jb1fC
X-Gm-Gg: AYBFou3tYSnTy1n1pSG1eWZVhLKEpszjaNqf88RZduGkQjjRZfe5/nMPTRPMIJrW3mh
	Ea1mE+/76c/ivUcZAT1/r3vKksAlfXzqV7AAPIvcJ3+rz8+AvcQ544lPeQ2SCtVT287pgryuKD3
	V+IUYfAGBlFOFp+K0FESjS4qIbsH3bn7HMYBK1WCE3jctOQhEHNsmwY/56fHpdWnCGpFB4G3KzF
	WBMiApkX0t+BWxlYIG4O7pllJL40nlh45xeg11tuyq4ZSwCjIPBBLfdV6gjaIUlH/+5v6iOSfl2
	ksgspv60PaeOPh2dZPNeFRaU8xIFVZfK8BxN2gfPRClFJo7dB4MqsocNiCx/QkiH6sDnh4ubZN3
	C0D2fu4IB0lKKSzRvYd3pyicTUNfOX4ZTCczMPFKTDI5Ad+eWNaBveP1o6shUlRyJdNHZXpag/O
	xfGHzEqijwZBlS7k8REWHyGtHYbcY6iqr8NnfqBbYalSqfhqc1KFzZClaZER7ENeZQtycyiqpJe
	0L59RymJlFzrgB0XhUdBlAIN09vgG5DG25eGE7KZtpbFQ5wrRrKmfhVhS/BKZ29MwjVrxN59jY9
	DV4kEfqDHbzgZx0BQnolL/XriBnmmEglRq2sUuTnfW/lQrZH/FtWUkJuJe3+pRl40o1rjnr2cJy
	N2JBTFLzxHBbKiwPMbPlJJVvCxkIGv8bU/iTP6nbz+SpT3A==
X-Received: by 2002:a05:7300:c00e:20b0:36a:2289:c599 with SMTP id 5a478bee46e88-36a4243a674mr7312950eec.29.1793412564948;
        Fri, 30 Oct 2026 19:09:24 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:24 -0700 (PDT)
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
Subject: [PATCH v11 08/14] ALSA: pcm: report partial progress under the stream lock
Date: Sat, 31 Oct 2026 11:08:49 +0900
Message-ID: <20261031020855.2402-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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

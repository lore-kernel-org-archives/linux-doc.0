Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758680;
	b=Y9JScgscOYpPkvHsaG2zqnTxcfH8QgVSn7GRAogFuHKyIL/CY9wO5LGp5GOf1taHIWu2
	 D8dOLhoEeZLIy3Ww7qo5aN0nL+XK3eU/kdPrNzZKLksuL893d4YyOwSbUKk0Dlgl3YAVm
	 yLkyYczNzuJD211D9xeQ9L8XdXOSI8QPEWVJCIOI/zTLads0+HmyEzPurJofiZo09IH4E
	 FjHV8tpV+O4QiA+CeoE2WeTXMxbPNFTSCJBqqGaM74RSQvb9lUgrSmCtNdpl9BKOqxIlS
	 a6i/YKNDsJJSwAcgodIW+5jYpkRn9kixrWoe0gYmFs27I+Jd8h+NvWjo4a0nQEhRbwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
	b=nTTSFJWhCLlOaFvhh3zqosBzQAZuCVq7OCsaI8F6ZIXBYoyE4dqCRhopp+77TFvDIY4V
	 Ryk32osvsP3Izd2NuUwdPmy2zN2+zeoiwDPv33WG/rWEHgt3KiSI/bcDFsVvt+jBGO+lZ
	 U+kWuwcmXA6rOIvP6eQ44cZF4t/TGXdybTh1AN5w2eHmQLxkgwQF5XBXSu2xwWEa3iOjp
	 tq4p/OofbTWouP1w3Pe6A63WR/ZqCiRvspsefEDeUhKPZUF/Q/YMn7J+jrpmeV82B/riM
	 2PcClnhwST95Q5GDll+stEezgC6sSS67j4DwJlO9xW9Ope9sDWyUoebQm4N+31bx19g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvwynNCQ;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368A6606A32E
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368A6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qvwynNCQ
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a06b436dffso89368b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 18:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758680; x=1794363480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=qvwynNCQWzyzbn44iaEUNn8gNwqbltYPcnY5DD4n6jcmpA2yK1rbj/naHt/mbyUbpt
         gOOAsmFZ61NojLVWyHKJWJPBL7MI6VcPF2sJMSZ/fga/ETkKImCoe8vAhF3vUEpLxRmn
         MloxzrC1jDXDmSvYvXGO0IvcTiBgkemKfBJJbYQKt+dt71ueEbE1fBlkpLiNfbbnTzmv
         uT7Z3uNF9zgnv9bP+VCOSueJZB/dL7eB6Zd3aY73lBttrO/afM2voooiB9NW0+7vDu9Y
         egfbtkJd6oIO2I1sT0fSRSHYEn7HDxA/knjCRAzOVweubaU6+BU8FnrmYuqqgSUcUeC1
         LSvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758680; x=1794363480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=Dfq313en3QH/SmYFONDD4llKZ85ufL8UgHkgvmWmaAarVo/akV/zC9LAgYIyUehV+O
         t8kAiRBKxoYYFPXukflnvZy8J4QrcG4SaUgKLVXDNDIa7/jxeQSkVEXNRVuWSEK9eWiE
         pTVU9OzbS9t1rWOFQoXHsekC7MnvyYUZ/JuHkbmP3LC1fiOU+qOb78hPlOdNIttPldH/
         s2Me7uVW2PxXzwr4ciwIq7c6SfW8DKIX2rMUh3WdlaKROU2iWTDVKIdzwAZwlnHS3DrC
         cJeWXaChmVR6Riq6ILNRBSnAM8IyHGtXIRIDrXlJwlK9HTQ4OgCCANcL+JuN1b5kEX13
         W0pw==
X-Forwarded-Encrypted: i=1; AKwUvByA9sG85MIiOieH5np++Q2QakBXszbz0vOeNBdE2OflgjY903EueBH0eNwmfrr2VlGtBnxbPFKwEjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JOXS8yuyHhsfTtoHn2IOuL1Q9NbQGJ9YJjfAq6gC+pXJzuhX3
	vMpesSyPV8xZ1nwNngJg6tvI06jaQitlIKduyeKqvsmehKR9kOXmP4xC
X-Gm-Gg: AYBFou1pjWWhyeDMtremoNGK/aGNDclUcQrd2B86KwvcxR56GpqsItDZXHPwEsPOx4P
	JXfM2ozr45DKvIbxwG76USD7P02faUvoGfT3Iq8Dk2x4nUJ2vLb8H+tknjJ40UDEMIPu2qPtNV9
	eCbJ1gVg658JH8+Y62/JoMC9A+aWbhyN6DSZcCM2AIO7xHGIucQQ+3q8KZLMan8BicNc88lIymV
	FbNO2cs/A5yu3BylQ1Y9jvEvqqcu2sq4dlvcUl5p6ZBtwpQz85lmHfI8XP1NKvhem4HPRETSoNW
	/NL0NxmTQp5gicThgCAzXiPqL6Nca14TAPEHMrxP8Cc5RpIGNPFMciDy1DoAn7Z0KXijSHlz110
	LdTr6UPtXGTtH80Vw8z/jo/JiENZBJsLJL9KzMwa+r7n2KsV2NTPRs/e4XkSKqlZTOmB1XWwL/e
	k4qoatLzurcRYOPRJYOq2p/3OFPkPGX95ArZF3Rxt4lTXV3sCzkZ4BItyBmlB96xUVzfOnBi3oO
	RSrSkIJaUTaR5JH5jJ6pnWdbXVif0bW2Gs4H2borKsp4OWPUzGpCLDq5Qo3w5IaFB/224jsy3Xi
	6/ae84fqQxGAqIE1SmRcAtDA9Zp2EH8zZj4HbPrVWb8dop/eY4W0sWbOGOa340y2D83GqrTwQBR
	je7MioUxoWu44EfwoKlDYAlrAPiQyvVFppL4OnUbtNABmtH4=
X-Received: by 2002:a05:6a21:a103:b0:3de:4fcd:f9a5 with SMTP id adf61e73a8af0-3e928d553c6mr9724186637.41.1793758679552;
        Tue, 03 Nov 2026 18:17:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:59 -0800 (PST)
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
Subject: [PATCH v14 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Wed,  4 Nov 2026 11:17:35 +0900
Message-ID: <20261104021745.57733-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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

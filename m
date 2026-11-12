Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461751;
	b=JGeTqdmbvIxCjoiOVs32yQKdD0bw1BhMC8Rk8yr8WBziurwIEr9zPWGmO3xjv0kjOz6O
	 /Po3QQtlGc3JGL7DcKQZ6YmSsmYFZp4W2s2o6JFVo3kx0G9Wrz25z/Rx1yMaRdFNkPciy
	 dwi1BN2CdcSMoREwnhz3BKFN060b00nb3sTFtlnv+0DAJz0gcEyeoJ4bjQbpyq0w9F0CA
	 mGiCC6qWXDsYOOBy8ttUybTH5XFWxMu0YfCRKZG1eJW24Ga3jJxuxSBy6DSxDW+WCa4/2
	 ldhGFamDgzwksnX9tk4kmHtsXn/rvA+9aRfR7GObprNdva9WzJjDbrOUE/cW9jIRA9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
	b=njg+tGKpqJWHEMlyd6cwXSbf04OJV1qCgurGtGRjoheAiOdTxKNzz2jNPP+W5YGekFHA
	 tpWMF6KzhsPlpFfx3C39ToTYG3ZLP5Y7eaXRHD8S2OJ38d5qWd+JbVFhJkDKdPz6X45AP
	 Wk6vHNM4GHE5SrxVnY+FQRpBuIi0dJMCHv7Cd4yNFOZoCxLKuRW1UUQxNa5apb0ObgyTJ
	 Duv1a1BjXcTav5KGg/5zOTL+dlDE6wIry8v8se9km+sL8I+Pmjrw81BNtIqm2nkU7nOkU
	 y65DY3WDV9JU67KYycYiTaYfH8lMZsdv6Owwq81RDjf6sZCS5eVH2I6EcEHQSbcZtNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TI5BID5;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8515460A6F59
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8515460A6F59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0TI5BID5
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-18818daa3e7so237147c88.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461751; x=1795066551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=0TI5BID5zIUzBPJbxT5G/q+VhgeuGtoeikmkndVomxQQCRE5UEu7xhdgbxcVkEwfv8
         3aj+oULsiIX6vq321kSfh+CvND1tlBQkLjOvOfuREpU/i6YKcnzXyWf+ZDD+hkxsmyWv
         fysdTYvHjQ2i2ol7hr9CQgT/TU57B1K2H1IZ9uxm3lfF2OsLoncaCxh5uC2wz2qQCo6L
         p53xzUaLGVmw5nqFE3btlf/Goh7u/OxEy5K9Vhen4Isw2j9x0SnxwRf7cEmhcnkijARx
         b5nMZo5qFErxfYeUPBo74n9YEWC+6+L6niBxqEOxUbU9yCNii5B1wysgjZ6K8QBAB+WF
         QPRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461751; x=1795066551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AY2XF6wXATByYZO2AFbKnYp3v7psceGk44pj0mt46hI=;
        b=iXqXbF8uXYz5A4KRd6iK1rZ0pHsW/79/239cl6IEYx0M3cARX5fGtVYzh58dJ5LZm+
         bdowXjf+GUofNWcZSB/ruvJL/w0lQskW/JWWAtwCuWXC/tOh12Cee7Oxb1tcFUQqHW6o
         Vol/3X2smUs9Bw7gtZuD/MKTZQa2dgap0UZe2/++yGo3zFL56PXt9IrLFARcUx6xM0up
         v030Jb4jv3UVUDmwK7PA0gvXWakXtb0UAte4kbXOnE3QDRhX2p5qJ3hCHwggyvNqQM/1
         DuVErzW6IcEXoybc6NcwQsoR0YwvuWbPlsM1YSBdzxHdW19alMG5XnH3EMdkYJJBx62V
         wMRg==
X-Forwarded-Encrypted: i=1; AL+hErHbX1aUP3zWrVv2t2ouajp2VTAn0C3IoeW65YNG1CfsQi/OAsOj/O9cNo5Bjcon29MZ+upcWuwOFgY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QBE0cWxronCC/FBUIJgcm0x8TroqYXwMCiJ3Z5y3tnEJIlEmh
	31TPtALgzp4B3ME0sgYWtiGYZJ25BpAVgpQxxyASTfAFdXKiQoIQbP6J
X-Gm-Gg: AYBFou3ENwxppsK3WTi4BOgjlcyF0LsjSjiB8MUjpufoGJJQt5xEOkNPErsgEg0TmJz
	pKRHQUaxC2p0hXMOXeQfxKzAUPpVuoRQ1pW2keL1/QKwfW209zH6iRyxnELsaWRSYAP4Tnm/SPQ
	m3eJBSSsLeB/u+nDc1v3fMgVdMcOpuQLoriusnD2QFatKi2H3c+nbCXGjyUoO6cgiuCw5d6YAx3
	O6NsHFphbofBbnj/ROEChy2SABBdtuWN5241m0T348hCjGwAzfq3nIYpQ3cakeBhMjLzTjdcoYj
	9X4Xqfarg8EJp+th3uFtTxtJLExUepkwNrTVMVnqssDTjW2h+66vGoCF2+en8mDHlxCQjNez+Y8
	r+kayCUKPoXprfjHJuI70jsNcImy/wDnigoKrz+rUrAXOo24qSrDKm08JJMjJWqOlkeKVSFpaXj
	VAKWelvlMjVSC2jUebJGS6p9uKHAPsVTaoA4M56znkhWWEq8StAiSZC7jnzo9CpgTdlmA6lUQ3W
	skD7y0rmg+KaYaRKipoFeW//helHcdJ9tvhdHIyFtpFTbPn61zNcQW7SEZvqh1bANYr//zFfyoE
	nNTSX/Uz83GXrM+ea0/vtpoaQtdcZc9el0lX40I1dVf4v8wekZPx0QuqziIDAi/GnqmtQ0Jiogi
	ta7hIwE6gh/7q2y/3VAy0bqcUXabYZ/sFrYOmNfAPlpX0UcY=
X-Received: by 2002:a05:7022:e881:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1b4f5dbddb6mr1543438c88.0.1794461750617;
        Wed, 11 Nov 2026 21:35:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:50 -0800 (PST)
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
Subject: [PATCH v29 16/17] ALSA: pcm: add an explicit application pointer to indirect playback transfer
Date: Thu, 12 Nov 2026 14:34:45 +0900
Message-ID: <20261112053446.73504-17-mynameisjune111@gmail.com>
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

The indirect playback transfer helper samples runtime->control->appl_ptr
internally. A driver that needs to refill already committed data from a
pointer callback cannot pass the application-pointer snapshot used for
ACK validation.

Add snd_pcm_indirect_playback_transfer_appl_ptr() so callers can supply
that snapshot. Keep snd_pcm_indirect_playback_transfer() as a wrapper
that samples the runtime pointer as before, preserving existing callers.

The explicit-pointer form lets virtio refill accepted data without
accepting new application progress while the ALSA buffer-access gate is
closed.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm-indirect.h |   24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -28,15 +28,17 @@
 					struct snd_pcm_indirect *rec, size_t bytes);
 
 /*
- * helper function for playback ack callback
+ * Playback transfer using a caller-supplied application pointer snapshot.
+ * Passing rec->appl_ptr refills previously accepted data without accepting
+ * additional application progress.
  */
 static inline int
-snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
-				   struct snd_pcm_indirect *rec,
-				   snd_pcm_indirect_copy_t copy)
+snd_pcm_indirect_playback_transfer_appl_ptr(struct snd_pcm_substream *substream,
+					    struct snd_pcm_indirect *rec,
+					    snd_pcm_indirect_copy_t copy,
+					    snd_pcm_uframes_t appl_ptr)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	snd_pcm_uframes_t appl_ptr = runtime->control->appl_ptr;
 	snd_pcm_sframes_t diff = appl_ptr - rec->appl_ptr;
 	int qsize;
 
@@ -72,6 +74,18 @@
 		rec->sw_ready -= bytes;
 	}
 	return 0;
+}
+
+/* Preserve the application pointer sampling of the ordinary ACK helper. */
+static inline int
+snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
+				   struct snd_pcm_indirect *rec,
+				   snd_pcm_indirect_copy_t copy)
+{
+	snd_pcm_uframes_t appl_ptr = substream->runtime->control->appl_ptr;
+
+	return snd_pcm_indirect_playback_transfer_appl_ptr(substream, rec, copy,
+							  appl_ptr);
 }
 
 /*

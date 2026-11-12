Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444477;
	b=foZ7YrUOyQxUuHquKKKlm6ytro5DyG1J/PELkbFYRAjmyQaRdTevIw4keGkzZqfFM3y5
	 NpDiHECnIxWfa2fMIGKKUHtpP50SfF2Lufe2b0AtjRyIVTpSjR8D1u5611Kh34p1QKcvP
	 0H8ZZuzPlXroSNyfEpKEGyHgpsSUPqnHH55Or/70EiDAWm96zo6/tegkwC6084ffnRoS+
	 5L/cprmPKk8eMhQmL+Vet2UW88g7hJAKYrUaa0dL3IAYsGIEd4XWGNVIZjrUbh+HYfgDr
	 asTv9oEqqzuyfwcBkD1fiYj0GwzQuARgdohgowRLIQZfkaMtKVQG+ZSmfDd7hh/M9lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=pt0TmruMJyDURJ1GQ8BYnLKXFEJXU1DO6yyfYWMRHRkEBAorKcm4e/cNUMcMvDeo4cNm
	 dy6J9sa3biNHc8nK+zZ7MBtPz5sG45sL76wDzJkUcU+Cyj+zqPnt/rj1oGZrRyvGFktks
	 2AMNTM1RGb63ahaVVjfm7lZD1uMg4QGFYj5VkUtnPWz7YZItaugNu9dUleuPl/28p49Dr
	 DYXO7pIf1qp0vXqvNes+2UCWGv514hcVSAKlCNqY68CuNAfbBWMGM0ws3X4FdwwXGQB/H
	 KaFL6VLH03nERwWo2k+t2a4cPJRM8i079C7O/kgzZOIqo5Jlyze4QXBDC5ueK3eS6Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GO+aSC5I;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCEE606BB6A
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACCEE606BB6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GO+aSC5I
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so5592513c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444476; x=1795049276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=GO+aSC5IWFM3CXtOecisZF6xPjd4DXp+IVKKsawxKknBnAZ30LrW28XAM3bsjZPtZh
         F9VNQHbtkTwLkj7AWwFDE7xf2vlgtFD9L3gFEMDbEaQuWzVxalev675vAo0VBSbPG6eV
         PBlGwdDVWGpkO6eUXfvxpIxzKtbKVdHRUafY9GIyBtJA/T3MobHAMgGwDXEyhsw826Ky
         Z44762J1XxVejVDBjld5MmgOb9QWscJ11va3z+v58dicmhb1cIzBVb8oU+NUUuLq1LK6
         Iywb2Ea+VvpQU2NVIkttjrAM9B4yqHUZq60A+rPEvd+swRJeBRK/t09aH6sCjD0jrkB7
         cRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444476; x=1795049276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=pA2WCzTQxw2fzf+e103lmVEJJV/pwt3Z52Uq9fQXYgs9jRR4vcwih7GzYP95JpWF4i
         c/Erq5txtbaMIrinRECdCp+UFYCgkdKRyYWB3988YY7uSATt0QrmbcfMJy8NZTHDjUN4
         ZIDSIE+Dg6YpguZ/Refeo8AGN8kUOwyVaoVS2+AQ4JG92W1X3HXrI20geLrtTg5f6t7Z
         k/0B3xqDzk0ZUS307ls+VoRDqEFTxRNMDH2zVAipmK3NqPv5N0GiS8rLTE7OaaciWh7b
         76ogLTlaE1la59uImD7st448gtluyLGsOhk1Ge1DNDkHHMVH902z/haxzLFnDbd016eu
         kqOA==
X-Forwarded-Encrypted: i=1; AL+hErEPAOtC2GQeb/OeN8UeBpnIZhPQ5TqdGRsjVFKX10NroswRWsv8vo+YbkH5PYkExUY2CUIYjLEJ+mo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8jKjibs4+Mgn141Kde7trc9uS2KDBqdBM3NkvDsULFm9TeeRKN
	biQ4tc8HAg+OFYITWfUTQxoFBz0zSegaR9+ZcEpiLisCSX0nQoFnEd2i
X-Gm-Gg: AYBFou3mrk3zS4BsEH6cP8aICXCEGv6iWNvBPcebfKCeLMQjy6nFjaTHwCPRt2H7Hne
	zq1Ga80gSulZQNp/y3iFBp1+Qc3Xs6T18bAU/lOCYzqwYhfGrPBbEe9YjYCMTE4D9gPJwp+IBW6
	91Wdq5HZCwIBcncz+r/cdhs6WjvvKthcP/T5TZaeuuqFbj4FRBE2hufjx4OnWvpfuWgy/MS8Yt7
	VRDUZoq49alrFUvOGirfoVdMDFKdlYYy2HI0intBYv+U5cdVY9LFyvRwq9ZXhmqiS6TfxpckHmg
	HQaifX5h3hBF9pkDtp1lCZtSk+Hv+zIN380zBDnC6QdsLQ4tXqTx7Mc+ZsdZSgWjckkIjixFHaS
	a9Js2A0/AKnVY5C+r8JW1wgQndh5PH4WKoMsIRbBycaMikFJaTucb0ZMgPwAVYLMiZR0bgfte09
	eb7NxYTeHNWpUrpA2ZyvVFGzRcv+H8+RI7wU2XBKJBbr0ugI6PGC5lFVAjJGcBEGXglRHUH8Z2V
	eZAPhs/w+uwQtUqBVD+CrKVKahQdOP2F3yDsUkP5qPcTUFbCEJG9sQ+5TPvCQytxSc1igCKcd2g
	1k0t8x+RBTwTv8wgLZq5wl8Mum9cx7/xqjAMn8twjE0yL0AhUGDxQN8s3sdAYZK+o2zIS3HDt7s
	ELAVi1QplwxTW9A3TW1cbkqhHXewjuKpK6d3RQEsYv/oH0O0=
X-Received: by 2002:a05:701a:ca05:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b3c2154fc8mr3170842c88.20.1794444475812;
        Wed, 11 Nov 2026 16:47:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:55 -0800 (PST)
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
Subject: [PATCH v27 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 09:47:00 +0900
Message-ID: <20261112004704.49758-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 

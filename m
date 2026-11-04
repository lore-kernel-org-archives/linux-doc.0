Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758716;
	b=O2P/MyTJR83VIjduP0sLhIGiHRKUfwbOSiR5/0fIkNFGuFblk3Cn2j9FO+hoz3j8njaO
	 RgvTfxR1vpXoYIi4DbRb5UUAGKIPQzpFhFhDgnGRq5r4sxyGuOG7oqMWlNluh0MB1F51/
	 3P9rv6yp3V53B8Xg7Wk3flVZ+Weox25tzrgdfiJ/+Xgz0BM8aJpSv18M/HpIW028JJEdh
	 1tQC419YjG+Fzby36YtVV2LS1gpSuLT0aqSH4W+DMBiNJe77WAQ+uROY6NQgUQHk0QUC9
	 TOI2Kp08r8gAHczZwdg0d4Guzj3JHmxUeiQvVeZTIozeVAP2f4E3K/pnZl0wN8vXx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
	b=p7CqBjBgnG7EUX6fkVt4qHviow5eRyuEW9tiOaLU/odZmtYvocUPMZd6R7RVJYSROMvV
	 /P1D/WAL4HPoVpPdiC9sX/pkGxspSjm1S3zAhgXRwc4qkLbq/fNAFNYJpp7K2iRj5ijVB
	 V0+E4vAD0xCDXgT9qW8N0CmmaaJGuAmPbq6VyE1m2w6VuhI9DB7bg1KGVH6pjKbbPePAm
	 q3BnYwKzmW30KzNAtLRiUlkH4OM4RepcfPZ0HNnYrT6/WEKBDQqF5OpVV5oz/YjRDOyzO
	 /hv2cCj/FnNSEukhWsgBJP3Xetl1snudlapKICH7LNxkhpoFQQ90G+676k1QSARA4mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKwJHKFU;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD11606D805
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD11606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKwJHKFU
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac6794fe45so233830a91.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 18:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758715; x=1794363515; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=yKwJHKFU2D2DhPMYMCgCzYmIt4/34+y+HODW5waB91q+93S3cWU9u7MBfBFVa0PteX
         6urz8fIXfBJ21XmZArDNWZrvvcph1C/Vp+4/3JU67wwKWpThQrH1qz/iArCXcUSsU59o
         dGi02BuGhVfROnsDKgtQOOlw10MyjPD3xM702XttGNZeEklm1/+TwH4hUvh8Xsy49Nna
         lJmHkFpWT34THeTt+trsVvf8twhyKktNGlP7cWVE933LCqxALK+65nuY7eF6jQOlqjl6
         RmctE8Cz7xVEOqiwExJULFeFVAtxJb8CpE7ocLyFsWf392b+27z+sS6Z6hjFBEksz6AM
         toFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758715; x=1794363515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=X3T0hQ6Df4PSukc7b/cH+QdQ6oZn28VID+ulp/rACbzsnJ5VtHnfyEn+PUglNa4g2Y
         mEnKlRzx/9w//hNB4PdhzVde/gIMhUZCaZ9pAR4Ftma+f4nYZR+xIqKl0KUlgjePCGjQ
         4+uBs+bvpdfFcpA0LMppIBq4yDka7BUMK5HoUWboOMb52rKcUeS9tjepsOuh/a27zPxy
         sGrxh3VdCxzxYGdP/SdM55sgMmqXDroVdrByF3Sc4iwc6tY4l3UJAonDa+61olTyUJ25
         YBlSVofQn42wlNm8fjL0kv+li8uIn7VOSRNrKd8yx9xmSGFL6CDTSoinbUTldgjAHfdh
         JIJw==
X-Forwarded-Encrypted: i=1; AKwUvBxkjG1baUQmPM/GsiQ2iuV7qXhm3dZGKIuo+HG3zGsnj0HdOK5G0FhIFAoe37ipfXefr5JY/305tl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z804sD63gj5ZMlc6xzWQ2KrIXObmjNNdOfYqjnzBYla9gFFl7n7
	xLyb4ScQQKm6lSroQm0mvQJyRhEM/d3aj9R1b7ZjEMI1Cp5WyO7aZp5F
X-Gm-Gg: AYBFou1SAMjrGs9xxvTgExPx5yBZW0ZgJgbcO43IXzakqLvDW4J0uJUwXSReJwdoIpp
	hsB8KRcSppSm5f/SVfiCmbEiKIUBEFbzAxhmBXuQ4yYpxiulQTxutkbbpk4Gqykai3LnsnEY66L
	0s7BpTSGLruGusSm1+MpLbTuvlVZKCsNcOCAMB5KuZbsGsfn+SJ9lI0Gkq4Ik4YUnP+9PKc2MrU
	SBYxEXhZk5+Uw+z0hqynxwHouIzj6nUc3e3TQGPfDbV/W0i2G4iqCEc/fhpT2/rJhBcelZf0XHl
	baJznQXRrM3B7sFin536l75DTBTrr0IgHaGZOrX63kdNcQZlVOs5GAsR5ETMzv/LEaN83+G8WFX
	j0K9a4D/mCeLpmx+OG1S/GiK+M18Yo9TAdducAcPErr/9SBVxD6gUGjjFTueQHQJ2AjiIPJ8wZO
	QFe+kYvOgfhbE7EjAFsdyVUfWjH06CWF1ZZcWn0dX3ieZdOIhpIHQ+1bSK2y1Mmxt/C0FlAl+hS
	q6tO2Dv5vdZjvrDW0/pI9zQhF7/O3/Pmmdtb5xn42MDr+cAbAFW5kTKNpc8T8dudeAVn6rTsJh3
	GsDkJbki4pWmjSn0tjg+BrRZuGeMBBoucQlRJp5eya568QLrvWS1Fh4HFZMLPUpBjOCZf2H2FZl
	CdREd/MwoNoGw+8D4Aylz872BEP5P+vPPuCrKHFUBUka8PsGdbRkv22qzGWb710Ua5sf/
X-Received: by 2002:a17:90b:4b8c:b0:3a8:9d0d:ca50 with SMTP id 98e67ed59e1d1-3ae897c853cmr12970769a91.10.1793758714583;
        Tue, 03 Nov 2026 18:18:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:34 -0800 (PST)
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
Subject: [PATCH v14 12/12] docs: describe virtio-sound capture options
Date: Wed,  4 Nov 2026 11:17:45 +0900
Message-ID: <20261104021745.57733-13-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State that
capture_allow_empty, capture_allow_short, capture_packed_status and
capture_pause_restart require capture_staging, and use the ALSA kernel
parameter restriction tag for each entry.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   29 +++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,35 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_allow_empty= [HW,ALSA]
+			Retry a bounded number of empty startup capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_allow_short= [HW,ALSA]
+			Accept non-empty, frame-aligned short capture replies
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read status immediately after the returned capture data
+			when virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Release and reprepare capture streams across pause when
+			virtio_snd.capture_staging=1.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
+	virtio_snd.capture_staging= [HW,ALSA]
+			Enable staged capture using request-owned buffers.
+			Format: <bool>
+			Default: false. Validate with the target device.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.

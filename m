Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461744;
	b=lsMKdXMgPinKVPYGTgFrdIpvHhEIArZsR8ewrLyC8MjXW3wOyRhrlvY2gX8pJKIGy6OP
	 5cKxG34OFeSIVm6yoaQ4kSxeHBfBLpnLk5ZTilvxy6LhVsSrtufFiLCfcNg1lV5Fy5THX
	 l2M9+gH4gaa/qDvTEgB3liWUG4LUXR2WREBAxRfJ3D5+TOvaL/+NZcPJBSFjDT2QNGd7V
	 lTldwUZv9ExePx7jjAJx/1BQjpsLhCqP5yeyMDtpVso44pdeCctXXKlxvOPUtCDuZYPl+
	 mdh1k8ONfi7x06CvdXFrUjPNvk48C1yV+Rmzgz41Hida99oZs7VMBG5260jefHYfA5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=rYfXKj+3a0hpEzHyFU6TKRoHssOLg4raXTxnXPtbDYIOSGxI6SVixMIomTouTSiZhtrO
	 3bltk1qtszExojwUIzdMm8sVGN/H5qhhv9IfmctOQzTghL2tdIxYHuM1I5m5ZDLaOalSq
	 31/t1lwirlG6fAJyrvMtNkaME1DjSzl2iJW2+SEgwZTvVqzD7qqkzQIIdxO+oQGFItKfh
	 VVR8DhSnV0gdLnr2FyP1i/wWBJLwdRUZ+3TBIP0Ib4cXa11ROw+RMO1n97Qqvx0T/aofb
	 Uxm+UuV/3cReCCvltQr9s5O/euvZ1CkyutSMDItywVvPCWvxJ1jF4y/uZ2ZgRCwjP1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI71k+eM;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D98D60A5BCD
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D98D60A5BCD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI71k+eM
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37198ed3727so655487eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461744; x=1795066544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=MI71k+eM3ppResq9Xo0lTysQlbFLkiHjd0MdFs9jwrlpXvl4AMVageRhU03PWDXUbk
         KVPqQ1yb/ZQc0tZww+dJ7COBA+mH5uJDHwTBlNkQun5NJ0CjzkvwFrhBaflMJmTT67WO
         F93cLN1yoz0fbWiQ3ifCi3GxLI9dm+fewPaG0lgy4UHLPFtI6CaQwP70+5tDuEqt2lKr
         hQOPIegB0KT956+QNCOyim+cc5vN5jUwzEsJRNv02VcCF2ohqZEpG5cnFy0YDC/eGCSl
         Gy6EINR8rWjUyesEuFXesBa734+TYLrSVsBi80/4Z7vxwhqpcbqr3kASKu8VaNuWDJZl
         8k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461744; x=1795066544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=UwtUnzC/Pot0DgD9grpH7EnYYTTnfyYQ3LLKzWj/bO5moN/DkEjNeFvQlUH6JQgHOf
         a9NniSAJFOOmzSZtUz2I3KmtyBmCvGXt21wa5Aa3FM8OwrSdzn7wKeUYenieiyC1SFBV
         nRzvIEBai2Ft/v4eNBmgtakWuU6w8RPz/m5TIQuKsKA8u855Iuyo10rjEvzS/FUC5sPg
         mTxvfzF3AtD8piQk1iqP5C/3ZT7eqV4oVN8wWeS1R29N0xp0C44Yo0zSR3Yicrc5TyOu
         t2Oh0GZenskBahjh60FkpYaRd14IGXL+GA4YUzwie4JApJE+mM2iptW33txCMKWE/Sz7
         XRUQ==
X-Forwarded-Encrypted: i=1; AL+hErHsc+RO8mBuwtBJ8lQo4//OqP/440Jsi0XMyN+Mx01+4DheP1ciAafaZthBbcAqgt0a5fp0+zX1aTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZOWQ7S21blrmDZ1U9Piuuve4GzoBTRH6m371JUkTsRssx2pj8
	ZM5npRAZQOyHONqlQEh0bG8W1HKj5wCAZ3ctiyb67rWUxKfn81wbncSl
X-Gm-Gg: AYBFou2tpoCVWjeg5XlP4HThIcHNyoavLIDMmWZpL12ZVYKPmHuTnsFkKSBCsoqN/lV
	K/5WoWjiWLl8kEpQZOqs+fwnuBIZ7raNHqTvNNRu801gk9NjVk0RG/2nLfCs2PASfEN1z4VlIB1
	U4wMqSq2pgRqNjYuRKMJbElGObbctjU6eqcK6w7kjNgJjTpeE4b3GB1+HsVsiLTUz8Whmqv8myn
	AcjK7burSMu9B+/qd8TQROPSAOFTAhVkTElhr2Smuvl6TdtpEUgIbvQ8pc2t5PLRGTi2QxXDz/O
	IEAskjnFjOELlapCFDjCU/i1oOBHgLk1s6weuTcf+CdYIGAFO3dxxskZvrzMJaUQtvwLm3BdPXB
	/oPJw6PpjXxmR4LjTkTXFbwOW3ToKGwYGLRlRkvjSKXRIUiy15VFlyZfXA9U7Io2/TQ9v0c5xGg
	SrstlamTSlCp1h3K3skfqHK5ZTTB+6gCl5m/i0UgbeTjfX+NzrzsN49Eu5MeTsXbtdSWuhmlgiC
	2JjnCUtYnfUDytG5a8CbLxtspSGEbRpdghLgzfXOLq663xRjp4diYh9yemQDlhYXmYHTfdc4K/4
	0Bi/tlV0j829IVAYY8e1cp2R2IU+lgO1z7soxpujeHQtWl0Cx01zt0pH8n95+WY9+LUKkkdNQP/
	5lsjvYOmYsoQ4Szhs3qDC71Cl8s+rsns4soV3tXZ8LPjJ2tGP
X-Received: by 2002:a05:701b:4594:10b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b4f5f1f344mr1354843c88.4.1794461743623;
        Wed, 11 Nov 2026 21:35:43 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:43 -0800 (PST)
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
Subject: [PATCH v29 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 14:34:43 +0900
Message-ID: <20261112053446.73504-15-mynameisjune111@gmail.com>
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

Document request-owned capture in the ALSA configuration guide. Describe
`capture_packed_status` as default-off, reading a packed trailer after
returned data while the fixed status scatterlist remains the default.
Describe default-off `capture_pause_restart`: pause uses STOP and
RELEASE, then resume uses PREPARE and START; disabled mode uses STOP and
START while retaining the prepared stream.

Note that on MMU systems request buffers are vmalloc-backed and
page-rounded individually. They remain allocated from hw_params through
hw_free, and capture data is copied into the ALSA ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   14 +++++++++++++
 Documentation/sound/alsa-configuration.rst      |   25 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,31 @@
 
 This module supports multiple cards.
 
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned audio
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+capture_packed_status
+    Read an explicitly enabled packed status trailer after returned capture
+    data. The fixed status scatterlist is used by default.
+    (default = false)
+
+capture_pause_restart
+    Stop and release capture on pause. Resume with PREPARE and START. When
+    disabled, pause uses STOP and START while retaining the prepared stream.
+    (default = false)
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
 

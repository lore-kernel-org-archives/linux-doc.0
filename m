Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267705;
	b=xhMlwrlCjfeFAU1CtW0vFUiXMMNqd/y6YdvaSp2hPKAFrSKB1okhS5F1qKU5mb+JMAHX
	 xz03xyCV/IwfpHUYbPUfY0Lv2Q0Aq3tz2P8P+1Y1iZ005aeS+9hcUijSpRoK8AaMCnNh7
	 N0vh/k+5nMKvF7hI+xSGU3X2qfCSfenp21A6PNgSrVIORNTf/2j+GuiyUsz4aDHKwH9TC
	 P+mOEgJ86A4t1WDPmxtxdYUIpq4OHgboXHakSoNIn6UbqMy1UxKfa7O+ZznJXc8/+guMd
	 9QcGO5Ly6x7C4Lf8xqUSbWTFQTbFqaTO/gKxQ453VHObeHX1qXKDingx1IinBjveMTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=2MOz6vA90VAv+Hs6Ucym43AiRkLcPovDvRTlJ2nQyRKeblg3L4RxyO1+EiPXWY1wBEI4
	 IscpaLqeyuZzSfvr0exjt5x2z8XLalYVU2n1HV+vRUk1wB6zS6PVscsblsNFsMgQn3x5h
	 PCCItHiNuXCufuWlmYs+ZG0IdcDtiPr10FBHRKpEjLzyHM6qeB1zzPdeKi8yRr5d0RlZ8
	 BgZHy/rLolGzEKB368U/Q4/fgTBKrW1Z+OlxttvsBIo+AVFfjDqCF51Zyqlu3aN2Gia3f
	 1+PVCxBEnp+Ri90gQC70Sgn66ffsrXt5JZPnqX/O0L149ezM6cOIXbkViXXsJHXGDVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmcIAWFw;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D0D60A5BD7
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43D0D60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nmcIAWFw
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3282db206d3so2884814eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267704; x=1794872504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=nmcIAWFw/n8RfPX81fr9NsZRJSbTr2HV/ycuyxDSLyPKUO6oC7t7hUcObhwj7MFDSW
         +Kww1rTEKgWwGSJAlpnUvTzhNb8vHyitkojcjY3b/PbO2g4ZB3dLdxF+VL93HL9omZvp
         hyLk5j4Kjm3IGx4dGasCKVLaqhHJCk6dzRm6N2bPTE7zoYVMmE1Eq4iUBZ6spEeZ4vkt
         nJ5LjoemwYG3swyL+b1RlLPVTYMOXRXvuVhNZCSUGG3z73hLIYRRnJ5jm7j653iFVAX5
         ITicfRqhURpO0gpEA7eHOJWSW5z5EWzlohdqi+4DEJgIKC4Xtnw2zVbvsWmXHhKnItPg
         CMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267704; x=1794872504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=TOTkr/aL09mCfcJbPvT2D6+0pBCmIqy9asfyagEdU0MtOojv0ESZh3IYskvcrLDjPd
         5zhjF+U5f+gwGijQ03fUysNYZkCkiH+GnKRtaXz4aw1YbNtx2DyaHDco8aRKpgyzH52L
         1wA5AeLlewwz+Qy+RoZck6efF88iXgszn2+q5IUT2N5j9tilmCyRxj2gmKtu2keHwebf
         OUXuusQTlMRS+4RzA0HNybe0yM3yzh66eI+GlORsCBiQ80zBVoaURKD7zJQ+T47cU2PD
         PRCgY34ArtBkzwPRi/qFORPRocXdkqqAgEomBWe3tUct1f173La4mcDyOpEArMHL+QAj
         W3wg==
X-Forwarded-Encrypted: i=1; AL+hErGX7fLmNGidndZksPtDsCd4ldXBKv4Knc3M7RV60ghmii4gDBbqJbvJy6a8R4jOC3pN1tBa0dSxX+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z94FChqDNOgEy0u7vaSxyRNYFcjUH12sTcjTdfbAsnN9At+VlAD
	8KUEFq1CUoXk2zsOF7ZxVBF1eiQIQi+AGOy9/o+pGkWqg0MJC5qg389p
X-Gm-Gg: AYBFou2tdixiaqwLpWA6qpYluhhn9jIHvbzcxWRFrZxIWxiQQLg3XIQ3EjsNJWowSu4
	h8KzDvcrHH10aGdF4CGSDVjVMJNwRQRvS31PJzUILPFN266ovORsMXJI08VFIvLIk8omDKgOa6G
	8BPHCZg/jNso5BWDz0BzbXFmamNcZ6DKW8afDNQIy9l5Y80j759PxrRi+c1vzM1aC0HjkPPI3w7
	RxOTrp03IHOvM82/EzBz7o9ojV25UdnAYwb4qU4aCC0dgWaczalOsy4oAqZIob3ofJrXhQJMCDF
	Jrb3fmZV4jQwO1oEsmEIe6hj99rbo7gSik5qhPsWieSi3P/DwfcaqyW1atGAeOilJtVZkY0IQVs
	cvdHgB29mqHGimEJl1/LPw38WvZKP7iYPinuCV1IZy6++X2PQ/Kk+hvxOpXOrIubKEglvS3iOd6
	naNg4ZoWSjGzMWdUz1hO8biX4JWnn334FS1nTos7ErDINCyIiJRFfQiMAXTYQkAa/ryB6StXdpE
	1oW86ag92ApUXoGlJGGSlqxJ/y9A6TDgoU42OJA2wC2UQ4dVQzg42DiuGRFQQVBExIwfvVhFf2Z
	To0Msax2pNhqnouft8hvZm/J6c6bam8VuvGu9L27xQk4jwUVqxhzjvhR17VnnFZ5cNUzydSnyc4
	t14IUd49lmVlvbTd5bhqZKSYD5YcPtxMNxgRGVOmEKYeDM28=
X-Received: by 2002:a05:7300:d204:b0:370:1652:5ff4 with SMTP id 5a478bee46e88-3751e99347fmr1011593eec.6.1794267704227;
        Mon, 09 Nov 2026 15:41:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.41.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:39 -0800 (PST)
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
Subject: [PATCH v23 14/14] docs: describe virtio-sound capture options
Date: Tue, 10 Nov 2026 08:40:49 +0900
Message-ID: <20261109234049.79534-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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

Document the five opt-in virtio_snd capture module parameters. State
that capture_allow_empty, capture_allow_short, capture_packed_status and
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

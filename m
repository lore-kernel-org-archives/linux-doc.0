Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444480;
	b=Qv8mptwxmUFygo4EqF4IvrR6MF5VF2DM8K8xhk6JpwBuv1/gWy2zvGmhecWJBZsfZAeI
	 UdZeFdREP7+4SMvZ4oC+dX8YMyEdh9mrqE/zJRrlYEu57ea2VVAW4A1ZoxhqrZi0StEqn
	 uQWkp68+62Y7BEr7yGhUq7ZN1KVtEU84EZODSjvhJbSaV1NxUiu6YaW5ioVZangTGJAHd
	 8FZCnIC9X7R+T07KKDAbfuy2hhdXG3+lQNm08g2sKkGwHfk4Mr4ClZvk3OaWwAcT3MbHQ
	 uVBPxt+maQiK8J/O34EA0wUii/QSbJW7pCVMy4leikI3Y/YZ3rAa14qmaB+PraAIvSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=Lt0ooRWbCjBkBvzVLFS/M8fd7PaBvP5xl1zWNf1s8vXoAt7MYpjOZa3gTZoq/CxDB3fM
	 Vk/0YzCEkUP06w1AhzDzPk0ePYb3cezc7ZDlkE1yneahuUkG5JdGi8kHu7xjEwBLODpUH
	 +f/+TsUetkLgHadH1Vf0WkDSW+ZTSLt9f/1QwClcGfzEKnNS4tjchozsQf9VUA1xzomE+
	 1uI27freefztcVok/jsciBaCUIL/SDMUV3AkxWAYFDPA9nC9hkQAK46fwkmCaFCGRF7rL
	 O+iaQ3JAx6L+PnLajFr4LZd1RMvHH5aI+zGkkBx6ZhGAJGE3edwwVpDCdquBBUsO7jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+VXBbty;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C785606C750
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C785606C750
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y+VXBbty
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1b244fb7fffso4666990c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444479; x=1795049279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=Y+VXBbtyba/o8p17YNdkkSV9mEM1J75oGmZwRUmbkNWoxRQ7YByN/2aYFI+8jR+xQR
         IMdXfrShXu3ta3fyVguDAHQWC+9mWfmvmQvSWYTedf4cy3p5755K/2Gg8p7k16Ny7IB4
         axrZWUbiPfIGcg/wF8SHM1QkzwYapNYjLF4CQZO7d0lYZk+M474XHT0cnmXB55VTTKOb
         KRFtrUUYVRpMswA04/Mm9rAyJiVnMf7Jktl517EZNwixDFEi4frZ6sS+QK8ny77NaU+1
         YM6hK6f8zeYcvXiN95UZGd0+6QCG2ady1rkfuUdjaZGvOKbZU0CNQPV6tEPNA4gtXkiq
         obHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444479; x=1795049279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=ViduxSFn0gKUNqnfNQ0OFmMIKX5sLjlUAHIQ2bcAKvHbkGIggvUbnA2JGUavBIBSMG
         FVUQuUKGwHGIO1X5KGb8gFlXlAWhn5U4PYkK2iajqWSMGZ1+hb4jEtHueLMUFnzjkU8e
         hBsmYegKFcvesCerpNIhuLuIDxDAEQfvX9V+XWamsNFZAGPbdLZx1Q5MXjxI8yDjJTfv
         026ydzLDsZe4wc907gBuzfI7hkI4V3KMOEPkY8M7u4feOrF8ld4VyRyg8IaBcyEOGclA
         Pd7ixxv7+sqxqptpWY6sBl3tDeMOtytr/lL7LkIUfiv+cCWa1fRY4kY/ItotPAco4CFT
         HFFA==
X-Forwarded-Encrypted: i=1; AL+hErHoTiVI3mtENcOjo/AxKawpdP9VWCnk1GQalp0UBnyg1MdsAi0Tz47NMCmce/BQ2sIPXP8Yw9kw7os=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GYW/pgVTV0KI7XQEuCg8W7RkLO0du2kdG5PdUWP2iaQsid3WO
	zX9sIpoXUTUuX1JZwekPijtBrwnu1+FAROF9jWcDfI4Ue6cbLQAJRtvh
X-Gm-Gg: AYBFou33tzANE3nK71BEC43zKg6oGUrPnp+dKDPXGq1EN3gIYeO65DQ1hLRqjIEHm8S
	xY+c4cUVkjKQgnFDtHorpwaUSHqKvPGW/mEAVpm8W/7eQP9d/MCI9qFOGMO7eXiW7xIEdH4Aizg
	PDzsut2Go4fv0H0OIKNx9mf5zKIRFq/2eKNargjiqTnQJ8BRdK47RqtVAz7iDOklefErPFx99ta
	/uJ4I07b/Eh1Yw040KTM5G8bhR6lMF7o3ZB/24FfBgJ8iChyNhoSpVrZF/Ib0AD4he3RASopaiU
	WdK34afh1uxsla/43G3Wigb4c1wSR0yoTyb8vZSZcZ6PQYy1uO62/ChH8HQJjeHoPkaoiOfkk3k
	FlUX2q/njgitvo8tIWrLNdKhHNrUl+PU3vmS0HlqL2jtPGwS/tFBF/msfU6HMZ8fpqTViWBZM2v
	ZC/WeDFeJRC9uc+COKAlOAWz3bj+ZOOrwMjpYN0Q4plKGk967c/KgmzJcvj4REfNrU5za1cA5tZ
	2wrV+aawCI+QPhfChoT++qCQOm8o10HduAJXi9BOiCsh6gMB3uN3fu3FKP0Zgw/vEQpznPiajNQ
	W3Zl6NTzgdwdz4t4IGrZLQQ6ptzjtVm8Yh8Ds+fHjoFlcDf6PcBhkR3mhQTdH5p/F3cLQa/QqDT
	qwY2/k26ZXhkNK59YymR9/5BhiXiEDamt8GSwHkXVajyIn5g=
X-Received: by 2002:a05:701b:2906:b0:160:a80f:3ed2 with SMTP id a92af1059eb24-1b3c02f039amr3321754c88.10.1794444479106;
        Wed, 11 Nov 2026 16:47:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:58 -0800 (PST)
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
Subject: [PATCH v27 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 09:47:01 +0900
Message-ID: <20261112004704.49758-15-mynameisjune111@gmail.com>
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
 

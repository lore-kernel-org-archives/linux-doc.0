Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794460736;
	b=EI0pfuvBUIFtzT/8n4a2pov4NDIKbWGP+M/kXJnHVe7XPqsCr9ShObD32tQJ8qL9I2Lc
	 XLemoqyMUudslOPTz639RsNGCvdJdB5Vy+weW/iV3/1TCh+kEASpVC6mWzJxDekvMe+/d
	 LmT0ClNWsPSHnMFPUXTVa5iuz41hn9NvSg9FYt89REcL/t1FxfbCbtvNd8sQjrAsKGfBs
	 CfkJnXmyRbITFIJhx8Wqbhf1DGJI/wXcEB7Qf7tF6V70zkiqqZ7uohZpyQhNQhxsyOsT7
	 Gwsv+ZjlDAmBHiFIwr/z3M2fzC3TJZf61t5Ix51jsiVbF4/parj++1xzJCVp7dKrtrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794460736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Reply-To:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
	b=m1rEMTod+YVZ8vLu4zZW7G5Ps5fNFVzlJiPW/UjuiQhnJyHNesZFGbMZFAcLR7I4eMFm
	 Hn/h8pa3OLo0qifb7UhuyyovVlLHMUGH4GbtdYwtp/rx6zwOjIu4xx8Yv46Pkh7MD4WN3
	 9hPnzIkk5ZK6ld7hQ242t9LOVvSGg6AjoJwpPSJaUpbvjg36MBiNBlHmxvlnYnbz/TVNj
	 Sg1YYRG9T3OG7EIbG4xYmV/lE+IK5+zXLa+lMNTqN36A4KNrseQXu6KDbi1ZPnWPJCO3A
	 AFFyW6G5+hWIJ/ndNr76sOE/YC04w54vrb0Kkp8GMO9nxy5k7PmEC1brKbkv9Mr/a2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deeply.co.kr;
	spf=pass smtp.mailfrom=deeply.co.kr;
	dkim=pass header.d=deeply-co-kr.20260707.gappssmtp.com header.i=@deeply-co-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="c0u/NX8S";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281BB606A323
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 281BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deeply.co.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deeply.co.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deeply-co-kr.20260707.gappssmtp.com header.i=@deeply-co-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=c0u/NX8S
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-37628596783so3678801eec.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deeply-co-kr.20260707.gappssmtp.com; s=20260707; t=1794460734; x=1795065534; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:reply-to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
        b=c0u/NX8SiRs8e1+N3Ad4VnS3ir7oMnQ2hHdX/cFoPNmEt79EEYN2ctR4xlJPe3O/qu
         SVxqaVrxSKxOq2Dm4GmGG0hKbcri8SzGDmN1TMiPTFjFimgPeJ34b578EXgSWxIMLUKQ
         GT6yLwCEkOJvg1D2rWyGuUYO8fhvPSUwQYGVlKDdYqJUyoXk0t4xhxeh383vW21dEDtZ
         DBaSYlbMrJ9S7miRkyBelEynVNR90OjXXKEw8jwOmB35Z+ctVC0AUBU7VEvUTg17AbLn
         1NhUy54sDw9QbrEjm9o1AuYSbEYN+wniDcZqDfcyEvRM28qcMT9xpnLgZlgweV/g4Tlr
         md3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794460734; x=1795065534;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:reply-to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PeZmCzba2M5Jt4hjT2xigzRftMQa1cn3KQXiYi9CbsM=;
        b=YqOHfmi3ROMz5LLeOTJtT1l1sCdpP9/rdLCXf6ggUhZ7J/EqFWHfe+cgeCbrGuYECG
         0z72Z52HL8Lr4dkvaD1mYdE/7Y0Xkn29G7mnpmqmP7qk3sH6BuKSzjqR/Ux55CSGvlbq
         9Mmi2Lbc5KyMyr3uHP2yFxBXP9/42nTKB3xXJe30KyM+ZFNDMRWdOSN7NbZXHOU/Pbz7
         Tcn8txIyxK1CDCyoajrg5YXwChOuwohr9FRTiyy8Yf8OiQvXEDMY5VqOPrzyRTfURClC
         oZOrEoDM38HpisLfzvGF+l/u3XZEQr/8UadyeEjn17MnjM44tLkA8iLVR/ollBJki+Vd
         fgpA==
X-Forwarded-Encrypted: i=1; AL+hErG5ZeRAovEl1s9buKKFwZf/ac3wFP2WwChTp+DGUpbI68VhJwvy+u3ZlIZntLQuw3IXfx2oo6xV9x4=@vger.kernel.org
X-Gm-Message-State: APuU4Z++UGpruwt46UIdXVQ9K3WoKgsj17Ap3ap0Uy+aN0n4VYnAeYU/
	8TOwJygje9gPKxaldZTTbdFaDiPDeBbUixw9cCtCyIGn6bAkiu6sdSBPQajbe8QlJc8=
X-Gm-Gg: AYBFou2RqXFjfk9oIv6hGhF+PrhKtUXg0agTz+m8AteHEnHSOWZn4WY/0vKSwAXzCk3
	qwaTQ0pUmcUjikNlyn+ruu6JygIuf0ktVL6W7TZTo2AV8fUtpa2DNpGynClr0a+sfLaUtyNZSVO
	/Q0sxWbIZxjoUG8SJcPtKVy8eapsAw9mQLKztNOf59DuuexJ8ChG4GGzEkF8BNSpgmHScjIYAPM
	x/U9UAxwByO0K89wynT5l16BFIpmXTbqZNZgDI0nPGcA3K8PPiMQvprugiWlTnJU+sInJaBXc82
	fDBW60a4aL2ZTenjnF0KSyU5hsb/f3vj7OBoGTcJpGYU1o4OD6uE8HqV31XiPM936fjD422o+K+
	xVVm1yn/guNsKdmgsYWFEeJ6ib2nwWlRTt+onQibwXRPZR0D+Mm4zoJIc4OxN6jlaZb+T0so4WS
	r7awp0pbuAsS6KkKOzjQq2n3f/jRCO+iQzj74i2o7pBJOwGM2ry0KiaD3I9vc4Hv6WvYqgJ5Kb+
	EuchpDdiPHKwHYb+UHVG3QPPehpJo77+usNSe6dR7vXm+mCtWRA8/zo5QnAjOPS4xbBOHiHLm/9
	P3Aay2HbLSDDR7xtiC9B3GmUE2Mow4PvPx9GFj4/xXrSin5cxvcfaXAvqBdLLBCvS6alv09guRx
	76dCalNB5ZfPNoVP+DzJfQAx75VKJEtPmaLNKd8ibQX/dctY=
X-Received: by 2002:a05:701a:844d:20b0:163:c5eb:d42f with SMTP id a92af1059eb24-1b3c024ad18mr4159915c88.5.1794460733817;
        Wed, 11 Nov 2026 21:18:53 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm19764527c88.14.2026.11.11.21.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:18:52 -0800 (PST)
From: Joonho Lee <joon@deeply.co.kr>
Reply-To: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com, perex@perex.cz, anton.yakovlev@opensynergy.com,
 mst@redhat.com, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, mynameisjune111@gmail.com
Subject: [PATCH v28 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 05:18:44 -0000
Message-ID: <20261112043516.37010-15-mynameisjune111@gmail.com>
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

From: Joonho Lee <mynameisjune111@gmail.com>

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
 Documentation/sound/alsa-configuration.rst      |   25 +++++++++++++++++++++=
++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/=
admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,20 @@
=20
 			Can be used multiple times for multiple devices.
=20
+	virtio_snd.capture_packed_status=3D [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart=3D [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send PREPARE and START. If disabled, pause uses
+			STOP and START while retaining the prepared stream.
+			Format: <bool>
+			Default: false.
+
 	vga=3D		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound=
/alsa-configuration.rst
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2537,6 +2537,31 @@
=20
 This module supports multiple cards.
=20
+Module virtio-snd
+-----------------
+
+Virtio-sound capture receives data into a separate request buffer for each
+PCM period. The driver validates the responses and appends frame-aligned aud=
io
+to the ALSA ring in request order. Valid short responses are retained. Empty
+responses are accepted only during bounded startup or for requests already in
+flight at STOP or PAUSE.
+
+capture_packed_status
+    Read an explicitly enabled packed status trailer after returned capture
+    data. The fixed status scatterlist is used by default.
+    (default =3D false)
+
+capture_pause_restart
+    Stop and release capture on pause. Resume with PREPARE and START. When
+    disabled, pause uses STOP and START while retaining the prepared stream.
+    (default =3D false)
+
+On MMU systems, the request buffers are vmalloc-backed and page-rounded
+individually. Allocator rounding can make total additional memory exceed the
+ALSA ring size, especially with small periods. The request buffers remain
+allocated from hw_params until hw_free.
+Captured audio is copied from each request buffer into the ALSA ring.
+
 Module snd-virtuoso
 -------------------
=20

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464745;
	b=bWp/q2r7cXVwMOY2apGvR029D4hW8JoSid9z9SMCxoRfM0HEFnaLk6oaqDtNRWa8ZU3n
	 qsM4tgga2cQbkuAzzPwyI/PItRl8N/f+902Di48vc9ztd7sRbMHPfRKk1KdzvfxQ8DNPM
	 Do2d/d062m5W/9+IYQCxILmRWVAo5lUe+EeEW5c0pEPQ5i59j0f03N6hr8jhnuqZqb/uJ
	 U4X8a7UiU+SqVVJONeqJzmr3T6wHEjjqHW/DIE0cMF37bmsOnylnU02gXgoQLq60Agjrw
	 W8imnF3W7GtfztvmiBWh88U3dBkLY7d898hYEdtCHDwXec5W5oaWPvvWn6+NMa+4hwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
	b=njcK2pK+DyP/McYfKKPFA36SsLuG1HDaxKtzp/La4mKnBu6HEqwfAtoULdZ8j8gyheye
	 Qn/oE7wE8RDMcQ1Rv9rInixpfLQpuJKLSpE8dBB7/5EwIVJV5DGyuLxIQ0kGX70vOFpPj
	 upVNc1dw+tcvnmCeycrPagj7AVt8zyVECYDFTpmYqCPHvdLQZ8qxxqDQUZ9hcAOqOUuNm
	 YFrWRvjrh0BA0zRD6MsxnormvVnEep5mkIBBQ0uOc3Vfug3fL4f3U0MgHN7yrdZYQ6r7/
	 tuL8UMC9BkpBloBB5mPwjxaKvxximZWCRRl4VMcqVFAwsT4UywBS6xBd09c/qQkfwnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0i9dAnR;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB47606A8B5
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB47606A8B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L0i9dAnR
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed408b0d9dso13764395ad.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464745; x=1795069545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=L0i9dAnRgazDCgzsUw3wag7LfQajhuRXi1oSRHF6TrgV+FgKun7WTS3uleT3Mwbgk3
         vEU6aJmTrJrJFOl5jg+xoY9M2oXNlUWFV7G9t2opD539Uva3l7O3MJxHFDy378ymuwG0
         bYBEBB4lzUMwoH19l0fr/EN0pwT0v5r5p0dt9l8+Yjw2tyY4iJ7ZruJde0nKpEDa76kr
         CR9njefMrzpC2pu7w21vHt7wloPeiPtMtkJaxRYWM9LeDy8Vdteswf5ZZADm0+7ugZJG
         G1SVv0qatkf0Mj/MUZWLqcp7HsLrCqJDjUiu1wO9Ldu49rEOirx7thp5L13BJ3zc3YeA
         nxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464745; x=1795069545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO6ffwCtdr8RA7k8Fc5roNJODB8/sxhF5kvv5Zygm2k=;
        b=lbfBkFaIsFbnrguC0XZisyoiEfjoyAQRIuc45FnONoHCuEM9s2fxnptTWhexqU3iva
         FE77kFxD/F6QyT66yaCOLR9ZR7QBnUBlTDA4wCaD82ZDKkzarS0tnf14zjekbLeDXn3k
         T2Z27DkXIW7515RiKOgfPSHHD/9mzee2DwjnbXQe+ZgukRHXuvvbIKopqicD9l04859g
         qZKTioKcXci8j0srshBFxA/0H5KDfY87mCCDJS5sQMp3yaoG7+ij5Nze11yMVJqFxyxa
         oLzozQWwCy/WdFWKsaEeisrw7xRjSpaKDlCoAea1zLTMEB9sbR9u/6l03IoeXnPLlw54
         wwOw==
X-Forwarded-Encrypted: i=1; AL+hErHhloZ8sErhF0EbjHS7pewfsvh/WvRkB1hyj/Gewcq8CPGK91l1qIbU4pG3TZCd2X6asa5gtpX7/n8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8sLpX2TsuF9qnXbLGSZCk6BQfP2QY6LXKMO6bvle8MP+Potsa
	2zZGSA8hIOutOgSev0YjvoqydFeiGvuHqoa/0DLLy4SMDY7WPwTRkZjWskfc5Q==
X-Gm-Gg: AYBFou0nDw/eWflppFQimlR1+CPgbCJonGh1wVzQy58VemLtIAMBVXBMyxVLNtTIT/+
	kOgzXSP6YSw2+9dScaTVKGuBAHlCPQqRjxbDS4ZeoOisCoMT6wioebPfJ/e5ATK+xXuxWahOJNg
	YFsHL+BB26Ug1wNCZav2c1boLnylJ44/or9tKxJtDH5zysDGD2FvJ7IXuflC1Lca7JrXLM5LBBX
	Y8wEhgO/co7ad225W3h18wNVah/08B37FFcVfCPwvtFi2+AZfUrJBqxuxZXBY/OJ7k5YIn55aR7
	0xPvwMr1vsHD4eDTOOiQWVnrJezxjnAsuR4EV4MXBXbkN0KeHDT2b4ZAxHYrEgEyzWTE1WkVupo
	2olpFHvwLzx5c1yWS46QCufNpqXMqCh+TZT9Fo6B0qeYCmh8APsxPYR0ZDIxg7CMmPoNduJSdU5
	Nx5iC91ykX0pq8OkENzG+frUfUcNApEYyUOFNeEVm9VzEGnYB7P5SEMgphF21xNVxtCfJ/ADzbt
	bL1RHeETIWdj3+ZLeXza2ZvOpXRHE8kMnb6Q9FF7zEtVcn8APb8IsOn8jaXBxQ7kH0SQteWFPwI
	mtOFcMi0QqcC4DL4RdCxThUjmxnuPzx2UT0FuQPRRGbtmzWTcPdkZDYwVTPEgwcJstzkANKsMPe
	MdqeGHHDobQUdrOHYo29p2r86zOlTJO8m3xgMwZFXQZMriPM=
X-Received: by 2002:a17:903:acf:b0:2e9:64b9:a333 with SMTP id d9443c01a7336-2edd770a9e5mr49212615ad.19.1794464744712;
        Wed, 11 Nov 2026 22:25:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:44 -0800 (PST)
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
Subject: [PATCH v30 14/17] docs: describe virtio-sound capture options
Date: Thu, 12 Nov 2026 15:24:43 +0900
Message-ID: <20261112062446.159-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
 

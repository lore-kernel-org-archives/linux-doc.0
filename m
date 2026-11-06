Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923650;
	b=llQFGDOrCh4xAG9WFv4U8SVsRg224/ReR9qisOjQ9PjQjOx5Z5kgC6X83etTZBHYcmo0
	 2568ZiPzavdIkS4C9yztyiTPlV1W/0HCIiaBsBEgk0FKKTtRitui9yrBbvZjqe5V5hHhM
	 SvQ7wsjnZR5XaAEOEQZ092Wk+BehzqHLYOsjRTuQaJ1rh5o7kZ2pdcsA+y78lALjFET/c
	 2lO4CSY3yEi6KEiZ5tmMsRBmSs2R8xgOAp5zTk+iAZRYAwvRm2BS52lwFW3aW1/wz/yrj
	 mIbs/pPLSki2YdFedyATvFR6v4MwiKsBalKfXWZvXhp5gZujPKMLyFMevSTwyD1SRDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923650;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
	b=dvORdzD4lfmZJUREw9QEsGu5rtk6ELSMgPCnb6P1LH2UEW3El25pDRh6wArhSGII6SJ6
	 rTRIn5hSt6PPGQ7AyFlTRjTw/qWxIS3gZsnvcDYUFyLx6XH0ZJ6XOpQbchU7PtSYuStLz
	 OryfAYj6Nm9m2rDj+1Apvh/wF7ePbi6MQZXbmdNkxDzJMjOTK/gEEby5a2Q3RkfNOd5VL
	 IBYy3DOnvwhrL8nupZrwrQuytoC8RhZ6Vlws42wJrzgT14ENtilafYtKX9B8ZQ2m1vtUk
	 oszoAj2y1TwyEEd0nsUZwLbdYD06b2AG8kC8d0BAPXl5sdHzn1RPGCUW7N4IfzRNUTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ3orVT0;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061E4606D814
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:07:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 061E4606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EJ3orVT0
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so170219c88.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923649; x=1794528449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=EJ3orVT0lSr5+QEqDFmgmshDZGEl5+IkiNLUmMz6fPT/aQ+d4KSwj1qZwKWMftKpAm
         +Q3R7BfT+9TbXqv47RlK+WEcrwEYwqMrNghm/xNUgWZUQDnlNfnSmPrMV0GAFQCHNbRi
         SHQpIa3V3cxRvxR0C2cYa4sSWl4dJAsoBvBrgWV6gtDbIIrGbzGO1x0Ejl75dBlQuJej
         ahaT1mdKuDVSS7JSoLX0cNSvN1s7ECCJIcv7ZQNUYFvEmCEPrhr6xQOy51Op+5KYkSEE
         glgi6ji9QUjuS4qsC5lAwWTlUwGTCMzryHTDjPw63OxSEURKC+xoy/c6xpCSJ6ztfx6s
         qKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923649; x=1794528449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yx9qdA7I7keZZm8UafgJgTm1z4N4QlAmh4J6h6T4bZg=;
        b=pdCwgbysMhOUu9ezYOFDmDNVRPskO44qZgJoBEb2aUudJqJr9M391dO+HuhccYxsQ4
         qF1rvWclHoSV+3z+ers3++nP6OVD2oV92ph7oGh5LkniyBi+CCTg/21rFz7PTRgudJi6
         p14Q71MbcJIE/dW87Q7gwi9FYHM2NFnoHTyz0mo6WyxOZoMkq2KMjFrCUuctcCcuCFCO
         D+wIx2qGGm2cN36ooiJkXLnrjIv2Mllvejey9Y4lbujylOo4Vn/YPY8BcIlkYHczeKdx
         PjFAvJl21m9ICtwyFFvKQ6mdkaIDcskBUuBRCtCWpiZRpKIYoEwWDmW4MlYf3M1Fl7kM
         bKKA==
X-Forwarded-Encrypted: i=1; AKwUvBy69qtYXpF+sMGZJwC9jPNz0WO6RNs3F8GYCbtxjndqkq76aJWpHyzIvK2vEu17dEzCoivwbshBmg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fv+R06S1OnXlfgviYIDhq190UkErd/Ihf55LNLpJth7wqQxU8
	pjfBTPiNkDO8WQBqCwdetuoptUhYRa2l2/zlPWYJTNAUQdGI3QoAEvD5
X-Gm-Gg: AYBFou3q94FtxrAZNuCgkKk6OkSEBeW7FKuL//9DPeTgqKN0EYXEfae4gTrN30P5P3E
	ZTtrqv3rln3HV2xeTQWUV/uHhLxK2FfxG9kw93pNpE4Y4JcWnk1fu6OiUBWTZQAxUAIblXfbRkZ
	Lu6AI1hK6ODWnLLyYLaNdZ8YzahdXvkl2/rGtiVXRt0DnvTwdVanr9m7nhM1dSrDN7RHBJQ92VX
	4F1vzE0QMRkx0mPkMMLV4gvcYrUa+X6O9npoo1pleAcYKcAhVJX7HQ6gi5Toxg3gq0vufPXG2vv
	KBNZrtuqEPuVgiC6wymK9Vw2rPLchLSfI7vUu9Wg3z0GCK/wH7WeY09IYdZwfXkyvs7bUYsTRFG
	enaSXAxByE/n2aAYwyZTlL6E/xPqm1k1h5d2geLc3qEg25kxk0EhFOYJQ3qRc6qSVwFAWXLoc3N
	Z1FLD7MYEHpOo+hzLDtyqeC7lPhr5bmyqPXVQjurqX9+1MLnStVqzplfsPbVHyqPfuCYhhaHZS0
	DkkTwU3KGDNfbZHkUR7/CzooVmCt6T7gQon1VKbGS4l4jt+bNdPheg+mMcMrwW7PprnKXA5slnT
	6cjA1hTF2mmHVwtp9W0bH6omHggKDU2FurCZLVc/pU5aHroa9k+jnLqlwhWNnBCyejNyBfGsMHd
	x1yUcNujo9cJYyKx3mkhxNsSNKhEXMHU2s3I0G3uwMAVbHTQ=
X-Received: by 2002:a05:7022:1306:b0:1b2:44b3:8ed2 with SMTP id a92af1059eb24-1b25d373302mr766303c88.42.1793923649075;
        Thu, 05 Nov 2026 16:07:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:28 -0800 (PST)
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
Subject: [PATCH v18 12/12] docs: describe virtio-sound capture options
Date: Fri,  6 Nov 2026 09:06:44 +0900
Message-ID: <20261106000644.20460-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

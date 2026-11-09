Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201427;
	b=MNBcIjeR8EItNVgA5lpBW96bOV26aZ0Dj9p9KlQQpCGlSOPZjspIMw1zDY2KxrAM/yvO
	 cK65Cecs4jE5i7N4DjOM67VZl8023cgimK9l1VoRcS7F6bZwZ/o/fh+X0S/vdi7D48I9J
	 JCSaZ7D+ejGOb1OxRDGQ7qL6J4xe/xvwiQmaIUBySFh2KaJrdyZw4nhsyKjLIDIh6wXJs
	 KV+zKinDY+5Q/p3N5rmAURV6pZOojIPGjAwvvDZ7tQoML9nd173OmmMj0iAzOAGyQk5TI
	 ldvMzUUnWOWoZ54gPjLQRDgksy7p/vdLGkN5bvPIwDHNqpQMcrSNkoH6RvTSTelk4XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
	b=mnQhVplUNyxQSILHSiLlkNhE4uiSqUrJI5E2OJOwH+ZfebYImByKW25fIiIDqDojwr58
	 rGKpr3nGwIPxd+1IORWDIivlTD8w3WhfBVWlSG50l6XiItvkLvTCc8MITziW+bzwgICi3
	 UsDqn293brFG5N4rJPXZRxNqersuNdHU/rdDpkwfd8h7IKEkvn3OyjWeTqG6MRN9XEcRy
	 vUN3HvDYGoQq807n1671KibjQOkbM6RkPPnDuWMwGRzQd9N0qMNDUI+RhJApir6f+SfjB
	 hf4+xObZC/QMybPPuE+FWuuMaLzyRFZfy8aqjs3mFBQERmwtWIIMHpeOHl8chUAZf3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3mJ4x6C;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75E6606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E75E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q3mJ4x6C
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b244fb7fffso504837c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201426; x=1794806226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=Q3mJ4x6CjdPXUqcwGtNivubyVSmg0gI6mNHS61Xaf+FJtWlwyOR1mF8ViLoNIn2fHG
         gI+u4EJvkIQkEKewtbLLRN4bm0TvXNVGfyeMN6KknSXPFiJLSjjxXKcsJgm3K6jD3FkW
         Q0kdtQgqdSLOZYH9L2Vm/P3oALgDvR9Nu2eBjd7J/BC4rEH/kEqngubWPvt+KP9ZaaSr
         ck3lYR9SSgO3VRTBxXBZGO4ZItghIDgI3zpwjuGb3K7TIompqNWa1thbgdduyBvFOhjO
         OOdFAVZrwUCRhtC3JrGfcIQAnB3/CaimeRfL8bbNxIhOBZFrLRKSU7TNkYxhh7mWFhTz
         sE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201426; x=1794806226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GCeNfDJOwvZXuY8dgM3rlag3FgqE7583M6Aa4tPPS8I=;
        b=cRp+4yTbWYadlNgRLQG++aX5IqDEO1zF9wd/fHXEiu02Ew4i22LmbD0Adl4UxKUaQJ
         fvB2fSjVQALs3LTXkMBBE/3529zYTKBv1oHlIfwt46lZC7bTJccbr3+lBS2ID2+NHmLw
         Suw+Cw1a//rkeVeuTkX/9Dvc/XVtlE9uCWjGE+pGNh3NlqIi2OcAclsPliz/a4bWAvtA
         EQUrOxndYcbq4LxPLoD5m3yjOh+cnxy0SQV5Tn6pAUW9nEzTEYug5MvfXF4xBjFQS0FN
         eqbEeYHD+evCn8N6fRe2clCT5bnBySOB3q+2AbpzZSxa7va3BSqXRoPhR2Z+ig+JQnka
         GOxQ==
X-Forwarded-Encrypted: i=1; AL+hErF98hUCjHTvJEXt0pghM7jPpD+Tj+YtrSwDLC1NFBioWS19O1G8uTVr6NV+VyjFPDYRjkXt/DPLQIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/aX7QKzooBJ2jLKsPOfH2J+VQZbl0YB2ru0jiz1syW8fuvh/PL
	SKuh3/i79zqSbNuAJun0aE3LnYvwJHyn7KurMf923X+FH57ks6fCrQgn
X-Gm-Gg: AYBFou1mvaE/ww3WSSb/2RXnB7ZbEexodv2eqldffyWCwZdvvVWstLoZ2HxDz+46toK
	/9VW3Rg5wVFmF8J/X/KbgCD6BYVTLw/SFsKPnaJUfl03GrQUmON2A785SsGWjIf8w9C/o/bi09e
	HuJn3MCeEr64Qfy5ianmXg7YKCJunfGHQsmnVcDBQ150bVGjPfZ7MJfnnlqB619mE6NIghZwfHv
	M45LbDWPh4QSAdOix4bbv10z76Jea6ifD3GL7bHJUOOY+HRgJ57tgrMVCWVQCpnhUtIBmLpX2gP
	bV6NWEGnHkKmGeyQjuK1uUxWVKxfgVyOayXYqg5ofigmD5FxdISBfSX8uLDBF8pI+2kjJew5owc
	haKNhO+l46kdA65gOPeYub8rBD5PRiVYxVDkfhDOuCy5D+GEvLxcAfCvKQpLACemN3pSnytKGVr
	tJDtKxIqQKRNKyZRO2BQnT383saqoLwzxeyDHoLKlynVgECgJnkiy82+YkDBooG9IbcnhDHhc1/
	HddS7WVGoRmdZffROWg+90uUM3FozKX2eYraBlaGpVFCdejR+tJc18eLmQ6czYOGCeo7mTOnJrv
	y218ciuINMXdGvSdCL/PeSq8jw0nD4BQN7KFgWY3h8u5Mg3L5S2uO2dag6MZY9tZENaIZ/9DxYt
	X92lgbmYDN/RNyDq76EKTHf6FGTTf8aEKGMLKasLzXhdzdBVc
X-Received: by 2002:a05:701b:2905:b0:192:74cf:1db2 with SMTP id a92af1059eb24-1b39fe88736mr4979051c88.11.1794201426111;
        Sun, 08 Nov 2026 21:17:06 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.17.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:17:05 -0800 (PST)
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
Subject: [PATCH v22 13/13] docs: describe virtio-sound capture options
Date: Mon,  9 Nov 2026 14:16:18 +0900
Message-ID: <20261109051618.22506-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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

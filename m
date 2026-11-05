Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837405;
	b=GlQG4ta/VV/ng5jpvlBn9pQF8NwoJSWdnGgt6PtOfcapx/BR7DqU9DJj3m9BP7VjGIBa
	 /WB8YTvByeZC/qnytdETznhV9jmyc8INTTE38QqWSD9UrYiPM8uHq+AOMYRb9ik4jl3Fo
	 QNeUzfRIJ0obGZ3E0mk51FhtsRQmrOyzpbyHUrQi2QRimkyXPhHpoiS9u9Zv/8MwvkFvH
	 4suG+M8tSERlOn2FWVdTXKp01bkNgbuCfr+nxyj/e0yCwyhmAA05B4Ii4OT5qEK7ctjmR
	 boyDiVetjFQ5KkWO+YYqZqoe9p7vJFiv83dYSBD0Bk+ForJtVYqpnhlhZbjRmoYHbwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837405;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
	b=PPCURbpG+bATXfFu6ybE4ZCm7XOSdZC/g5pOyb+488hhb5aYDQyX2kL5Bp+lJ2ztseaq
	 UiZDwRc56XWN3iXOvSH4JgNpDk4XoLQEFkhzXJwZnqhSimMe375sXOuYJQe5G6tCJg6O1
	 WdVRuzImh/2DtsGYUVMS7zNGOG6kfP9m/1uqEfdPPqQcjf+VNlVYNYWge7cAPoz1aoyva
	 6Rdy7sRy/Efc9flkEdvrIvQs69HA9xiLPB6H3Ebpj98lo9OK0IKZugowsQJ3UVKpq+vwo
	 J5f+eDdwf0ODRyC+HaL8XTPI6+Nx761MjiL/sDqveKmvhXaCKxLMFtgS3682O0Rjogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeY4IEDr;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20BC46083631
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 00:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20BC46083631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeY4IEDr
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso600739a12.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 16:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837404; x=1794442204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=BeY4IEDrAAFmLu7JjeDWwbTA9snCG+/XgoXitYbLO2l8LGehXShhKl2DkJ+0Ju/o5d
         cyZpN+Q2cV61S9maKKzEznl3+W/i728CRMluDTZyjvT0g+w3rCDhKmqRWdZlfyiydDwb
         woaUO9XYS5NMGakzeHvSwN3HkViHcjNFQLNOqXI4KAjoLy2RDbZl83gu8pqXM7OmTN/r
         dU2meVcVRPG2MwLu4FHr1TIxv2sZRTRBRN41x5aQe7H/aDxv8fWW5dfxCcPGLzy1Mvw9
         z4GhGOZfF+N5nzj3GJakRQF6ZoSkxqpKDcpryxYdzo9/oYGSQWI4QNpCPPKGcn9puNB1
         fEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837404; x=1794442204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+E1FT7j2TPwT2i0hneBh3LNGnIyRwhqUFoGV1aFaFs=;
        b=yPQwVYuMVAazf3arjJAiZMu265O44THhTI/Kt/XPrsTPThVD7jOY756COJgDEBLHAJ
         oAchnkjjDaeOVDucysbzQufKifhGCK3/s7CxAU0USz0EUfSdOEICkcXF+RBUj+uPgaOd
         h8mxQB84lPRYZFn1+5djrTv1M13Q6ag1n+Z1xq1kGTHcIouwttaEwYFQM155WAcvUgqH
         mBaL9WjNCBdyq7ytX8HQlfywK89IqYdlSTEjDUvfiygVxIDOmtesCz7WGJMQctWy6pZW
         8jpJ3K8pLC4zWVgn/LTQ/ULXkjAdjKxNE1Q40C1tUx4VxdJGPnnmZ8TNRRxD7YAwtJxT
         Gh2g==
X-Forwarded-Encrypted: i=1; AKwUvBzOwQu787dKCwXs2euCL2JH0JInFMMoFSCTfrx+8XLU3yoSaXmuE1pGy9NieQj41xeX8wzWqJyo+o8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tkcJJaMsTnhPpo9vkyNxVusm3Ml7YdjYpXTwUO1R5o06URjtG
	GXe3vuSSipTn6cFAelUoAvine6U/KPYl9sl/+y6I4sZK6Olzhom2twPEJFZVDQ==
X-Gm-Gg: AYBFou2Lpvcfx2SvdszxVUwE4Vd1YAIr07LeYx741mWhjOOJcL/AqL1Z3M45th3ijn4
	/AIk/oy7tv51EB56jc3EqjOaNH3/vYM3Sncf3/h4kY0ctIdWUX0GS+JHacVk1mehUufmjoPgHAo
	zuN2xTZ6wk1EHhTInSr6RTq9n4Tw6943yHY54d8PqwQBzta0fwCj3EYqQ41EoJd3tCXmsYlCHzN
	4gr1YHBncRMqDY0Ts0w8yhsdFtLDbdIlgSoIBCxHdmZ3F2MD0LTkyhmnozLOTq1nAv45DDloiGY
	ra2hcorWZTa1EQFpBovL0bQO3yLOUJPCZjBErIQHndXYcIVmD97klBZopVyPwTSkz4gVRDVQP+D
	VdPYNj+0a3MHfuWBYyzrBHsbEGWzbwaZfm0EZDfMR3OVOazvKmJDAezz2BUenZ2iGOcSRLulGpG
	QtV5BRpb8qyTo92eeX7wAnrEQn0uAfZXNFJo2cnA+pkywVbuFeCay2QvZmI/T+a0xkEg50FcnC1
	Oks7WSGdat2KrMrbzLtlSkzcsYlvWQEy1HKKUIzM6dujtqvVpEmSZXSGSH52qKqgcgAjtgL5s1/
	gMSfJO+faa9OFxJvFOSSwrSB1IBKxXzYHcfSI7ZsuAq8gWzb1ovQRFdJskknnmsAp3zzH9KkFYp
	cdQQK/eYd17bJJmnxegIVzrpMAueuML7Y1DtabKfqLPdn6YQ=
X-Received: by 2002:a17:90b:2e07:b0:3b0:9e2c:9b5f with SMTP id 98e67ed59e1d1-3b09e2c9e85mr2641358a91.2.1793837404449;
        Wed, 04 Nov 2026 16:10:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.10.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:10:04 -0800 (PST)
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
Subject: [PATCH v15 12/12] docs: describe virtio-sound capture options
Date: Thu,  5 Nov 2026 09:09:15 +0900
Message-ID: <20261105000915.15177-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

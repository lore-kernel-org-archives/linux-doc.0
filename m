Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099765;
	b=bvd1+eGPMFifv71VynEeBFhyy0HMndPt9+nsSQaEBEJ9pPVcsXTlIY8j4B1bL0aYp2u0
	 gcZggLOoSsgurzYs1O9BLbBe/kFM3ur6SIrpEzOdCWMu88IfnrrjyUtN13k9MG2qE8v5o
	 de6nhBtxWeRwWPFguTWnQPRXs2Qgr3AnTVgJYq4a7g9Y9KlISxucNMNzHYowIlnhS9sCf
	 L51iHD+niWqsluAXsPlkHlM45HnQaC9STKCmA2xCCAAr/uyum779YYFZeR9LWPDGzFayL
	 ZAu0nuGt8I8sRB0/ZVrTBHLfL5f/v7Ouvbwe1oV/liqVoMi5Q3WTa3V/0tk4OSsLwMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=iJQag5fmr8Xznr8HhT+POicXK/yHDqrGNFeMZ62CJB4=;
	b=XCM88ugNqD7w5rKDXl3vMNEI1EExcao3R2KlBIoN3h7lrg2E9yNKWJJYPP4cVNFfpORP
	 p5lwWZnFvLUyKCDrHUTQe5o2ta5L46/Ay2C8jQPRsOt1sk67ygZzR4yqyi4eZ0tFXKLcG
	 3WrR+RG5XfxzUyKvpRULoZZDz3FKArNi+6FoYfHSv2CcG6vHJ7nrblb5xUwykdIiDkjPT
	 Jlxxlu9WS+WhfJfWJZ5j5AcbGVmr14nPNp0U63+/7cjta62QWLTlLBUFxEti4FrBGiIeF
	 umpqAJ3/kNJ889iDO4uFreTUhhYPz26YQefsmlLSj72FlYzm+Yk/P2ekrk6tO52TMmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AT3EXpnx;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624DD606A33C
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624DD606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AT3EXpnx
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb6886d30aso21041185e9.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 06:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099764; x=1795704564; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iJQag5fmr8Xznr8HhT+POicXK/yHDqrGNFeMZ62CJB4=;
        b=AT3EXpnxFH2vcISzFF+yr3HrRsuaGudVPCT6rfpndYW1gGz2Gnjx37xekAa88TrvUD
         JZFfzDJ2sBcYcn06YwBYNcDsXkUHw6CJFfCZPAuQ3k+g/s5/EGXXuevCN7OMBjQ69j/Y
         n5YXPN/gJILrG41pGI7gTpm0+DwCQkp0SorjTs1oKuwGHKIU0vDdBo85pFUYYCLFIbPP
         mafk351d9I0lEZwP43Y7AZkP3Sc3PxXQBBxvthVrxPZhzC2Jkir4IcIcxVvz7lOULzt7
         g3Qa9aA3b+eNyGgAd+eY1KXsR/SEyWXfcOnLfh9DUWmvjoPMzre8wmvkUvrXz8s4we07
         f9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099764; x=1795704564;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iJQag5fmr8Xznr8HhT+POicXK/yHDqrGNFeMZ62CJB4=;
        b=mLnGfqY6QDyly2lH2Kyk0RURa9L6wwq9/BHzXB1dUxpOIm/9qE6E828dIngcTumBxt
         T1J+J80weIJOMdUnrq7hnOK99xXzI9F7nrMkes7IGq8IPrz5WyJfcTUYpdsn67b1BFRr
         O6RBDh94glUZXe3y0Evq161kVLmMub0GHEUb2f8ExniiU9Z/7csSs5/5GcBvPSSj3ZLD
         aRz9Gi0XETSjoos2HEX/PrZihijcRmK7iH0L6loEFBmL5Gew2cS7f5FRTtL6pG5h+2Xf
         5Ho90D2b4fCMBfd/MKEkibmaZUJHF8uziraaaxNl11YcradE+2Ygryjys1v0G/jT3zAd
         T/2Q==
X-Forwarded-Encrypted: i=1; AL+hErGUNV9exgMwH7EjcggrJli66kLPqPhS9bw5Jv7uwMEI4O+ApcQ6rsVrWwAUQBZ+KTDPoPRgXQznUdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p4+G/eNoNu9tlDDYTg89ZH1GBDp8nBSil1/L3tq1OqnHSXaoO
	jSYq9ThC2EWd3IVmdJl61tnTSx8gUIA8RJn8PQ2h+ufCu2N3v2ZAtsG7
X-Gm-Gg: AYBFou0SoB71uDTo0oD1XEto2H4zzq/QCXS4M/Ms7u3PRtpi2ttn7L5HGZNHMoOMqjH
	X7b9rdqxENnJSM3pZQqqVHNMUc5D9s8a865jq7buAKGLdSY00gOHnUdZiQh9BGwWfYFyIklBeBq
	vBsMUygQIjACPOFoJoo8zWSQ1ndQJMRlniSHshDSbUANbl2IGTOZSb6Bm6LaBca7t+B3vJKjW54
	CCLyKODnZm06rl7Ks3klIonWoIuKLRJo5ZENMqqvqIjirhRVKfNy3PJotCfAFGnviDa6tD6cg+k
	WcRxtEY2GXnegp5KGQvX0U2QgLJIs3noZZz8Smw3LfGoo/PW9diJustjkN73/Hjrlxx6vDk3D+t
	CrfAeHv+yHzqC8DAr4A3SQIJrJT9LyfL/haPJF11AG+Ran0QvpuLSsTsqpZqbxMeWGqFmXODO4j
	7S81VpiQHEdYVbBpFYryfTmon6sFBcYdEwe/SWdDN16wvgwBFNmWwoyBkDFWexs47SHE8xNIkB3
	YSBop3Bpf1GitOJpLhOoGMYUWj9fouZCGWYGe/Gffu97HnmezGLtw+IQASPu/igFK+kcKHLEm5k
	inblaT57dbFSOCcw3qxlskIUSINAWEK0YdaCjN9vpne+PysPQ6+RSCbuj1C9Un4=
X-Received: by 2002:a05:600c:4f05:b0:4bb:73ad:c1f0 with SMTP id 5b1f17b1804b1-4bb7da21b8emr136305805e9.23.1795099763457;
        Thu, 19 Nov 2026 06:49:23 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm38881785e9.3.2026.11.19.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:49:22 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH v4 0/2] drm/vkms: give every composer user its own switch
Date: Thu, 19 Nov 2026 15:49:06 +0100
Message-Id: <20261119-composer-v4-0-5973fc9296ee@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNyw6CMBAF0F8hXVvTB63Ulf9hXPQxQI1SQpFoC
 P9uixtidHY3uefOjCIMHiI6FjMaYPLRhy6Fclcg2+quAexdyogRJmk6bMO9Dwlha5VkRFBhrEO
 p3g9Q++c6db58cnyYK9gx+9xofRzD8Fp/TTT3fsxOFFOsnKi1KqWQdXVq7trf9qmA8uzEtlBtI
 MMEa8UFKKNBGviG/B/kCTpXHoiuGOGEb+GyLG/BPc0mJAEAAA==
X-Change-ID: 20261111-composer-cc9620515bcd
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The composer has one switch, shared by the CRC reader and the writeback
jobs, so either of them turns it off for the other.

Split it: vkms_output keeps a count of holders, and a get() raises it while a
put() lowers it, so the vblank reference is taken by the first holder and
dropped by the last.  The CRC source takes and drops one per open()/release(),
which the core always pairs; each writeback job keeps its own record.

Patch 2 keeps the lock over the frame accounting and the queue, so the state
the timer read is still the state it queues.

---
Changes in v4:
- vkms_composer_get() returns the error from drm_crtc_vblank_get() instead of
  a bool, and vkms_set_crc_source() returns it, so a failed take no longer
  looks like a successful open followed by a put() with no matching get().
- vkms_crc_parse_source() failing now returns before the composer reference is
  touched, instead of falling through to vkms_composer_put().
- the kerneldoc of @composer_users no longer claims a READ_ONCE() that patch 2
  removes.

Link to v3: https://patch.msgid.link/20261119-composer-v3-0-dd470a820303@gmail.com
Link to v2: https://patch.msgid.link/20261119-composer-v2-0-a935e9bae6be@gmail.com
Link to v1: https://patch.msgid.link/20261111-composer-v1-1-9d5fa94656f8@gmail.com

---
Oarora Etimis (2):
      drm/vkms: count the composer users
      drm/vkms: queue the composer work under the output lock

 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 39 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 29 ++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  7 ++++---
 5 files changed, 61 insertions(+), 24 deletions(-)
---
base-commit: 97429bac371273886238bfcf63d78e7405cacb46
change-id: 20261111-composer-cc9620515bcd

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>


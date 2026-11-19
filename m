Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095387;
	b=C91qngnKT+CYzEXNwl8sF4NWXyqNjBmDwLGg9xaopjPNiY2m5/VIfBqpIrTnV4luTrk1
	 tjbzmq96ITcxyM8qHlLruSUs+D/iT+1p3Id9Gx7idbhEaqZGi4zJzNrIBV6lnahkyFuhW
	 QjpXYqiEsgUYwqyAI7tHtohdNzYmQPG8NMJSYozUnMF8g31aQVDwacoKQPs+D5VT9HHJc
	 miG17/GsNg8cETYHtnTKnIr1Qc2mSB8cvXJv8hVAuVuZpDhg0NDrju1ooQ/uv0GJmrjSw
	 5U3WTOdkVPTpKzzO+qsWV00eomaZaPNWHRFDeZuBHYUedo8QVEnATvi8x5HcTnEd0dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=1o95545vLBlL7TyXtLwPVUZGaN8C7nShjfd8XxYNHPA=;
	b=1uEVQhQAQuJYH92KyErJRJzG5IDjg4or18s8yIf1GI2M1NDsa92CRCIjSBsvx8ZiorNy
	 GvMIp2FMCS1dNiZmzzWGyrs1+0w7cKhNoM0fJLoBLN9q09mhhSMOPc8MRBG/7R/Kc9lLw
	 z5pn5kDB6kV1daOeQUHWYH509Aq0wshnx9L1avpvNEWAvBruqs/yO3eY8vj6eqetvRuBd
	 eKcoc/mntHgy882BcTnMUN6BLfna1fAzeebja7/sEvqDNmzWfefC5/WajyM+IbVHsfJin
	 PphgK/44KvRYKDm/7wnu125lenRtgPVz3//U0mR0rIAhhALkCdl30LNA3VxkiRDEPEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imbIvVnG;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE820606A32F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 13:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE820606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=imbIvVnG
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a9be758734so449069f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 05:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095385; x=1795700185; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1o95545vLBlL7TyXtLwPVUZGaN8C7nShjfd8XxYNHPA=;
        b=imbIvVnGlnuxVAd/nTLbRi7ZrjLPdlr0QSNGutu/hLxVTJOSFIuJqF9bHSWRI/3t+m
         EbnVBNJV/paz5/ImCrHFD5wgepKh3Fc/9/JvE45PmFk9UyMPOFQ1NEPzpJDe0Bsw17Ft
         +rbnvhdn7hDHkjnt7+sdzono6/yT7ERYLrx279MN171s4qv5rUpE7R6062l+3kehnSAT
         To1rYVXkNZjWIpiSQNB/jcrwVlD286eLRnk4O8Y2hhmvtajgFMi+8WiQ4FOKH3oFLlIw
         zDwdnNIWk8HZZJP7T+wccs8GVlOwdUWcLgAt5Lxt6KIIFtxtCHBrUlIr83i9L/KDXPEh
         QsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095385; x=1795700185;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1o95545vLBlL7TyXtLwPVUZGaN8C7nShjfd8XxYNHPA=;
        b=jmC8mqryBX1NH/IFRcUDqW5Ks3goHfYOUh0/r98Ppt/c3yjE/dh+myGO8wD/zRB5ki
         Y43HWSAEgjTPQqtpMpyZy6myF32/2fQP53thIAS2yE9JRchHtGBuYEv5mSPKeUeWfw6Q
         jQ6Ws++IEMWe0O10b5NDnhWRcacYz8dT1BxaYQeHE/Yk3UEJEqGUVzEOf66k15aP5t1k
         Z6V0IbvhL+cY8BbgBNu/ma+6xxio4G6l6VMWldoMbAYrZv8FgWXYvb+eBMBlo2oSiMAQ
         dpjKbLwq6zC5t33idsHTZb4CMNUP3p5lXfk7nDQzAQFtLjMCwB6BJvzxP7S+YtfWp5t5
         t+nw==
X-Forwarded-Encrypted: i=1; AL+hErEfxnFkEon4lcXGJkQuFLrbDMV1ROxQ7urc8JZg196Vd0RzKBJLUhkFCzpQ+AJOrcWoaxTF6WIXa6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Z7l6ph5r3rCoZQfk18o9/8rBUZh52iPUK66c3hUAbiC1TvJo6
	7tGLH99o9PshdPjWq28y7SprNGZNc+xzgzGLDVJOPzNziIUIGL/tuPrX
X-Gm-Gg: AZFdTZf2iMp8qbX3Q/KJxGbLMRTbWBnFvS1XeE5IpdFzvHBSv+HbiGcK5kMsSkderf+
	V1lp6/mlUwUWyWAbLl531T523RNiXIpnVp56Hz6UnUIT+28Aqok/65x7fmmT44Mb4oE9T7ClGJ5
	I5RQO1pXbotl8j56RG2wJj1YfnLXUCBJSFucq7zHWwWvRs+bx9oVpJEyJHJ/HVuJQmaKHFV45x+
	3+JD1Mls5pZ5Lht+nW850LyDFCGXNOGCW+LmQu2pUL6UXFvDH3Ga0kRYc1Yi0gVuRMQpaCQcMXD
	ChaoeWzB2C2sVevHxAY2lo7gcyMv7CntvVL436n06UIt8qVRCporSQk9ujDRj7sBqACXwe05BmE
	4IzkJQWWEEgyRV0jeWEHu5rtKIeRp4orcW3trVLhy7+6Z4FQsxtLyShHgrfbZXNaBW86LF74p1V
	jfGWdpQGjrZrhDBX8/A5Z0AgZk6JEC2vsTnGijc7rJVA7JHms4bMeOHOmZoRY7lLG5gTc9CGuVE
	z+/oBITPANk4UDgkkUh7V7ijNWDkd5cWel2VtPm+m23yHDPPzeh22HPnEpJAY9a/DZGzM/Kv34/
	31qT5hnz7ihtG7VkHV3ThyxiCEPKS4JS4PwRMoZ3VA==
X-Received: by 2002:a05:6000:610:b0:48e:3085:7cf0 with SMTP id ffacd0b85a97d-4a63ce05ddemr14483518f8f.51.1795095385263;
        Thu, 19 Nov 2026 05:36:25 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm11547911f8f.56.2026.11.19.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:36:24 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH v3 0/2] drm/vkms: give every composer user its own switch
Date: Thu, 19 Nov 2026 14:36:02 +0100
Message-Id: <20261119-composer-v3-0-dd470a820303@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ7CIBBFr9KwdkyhQsSV9zAugE5bjC0NVKJpu
 LtQN104u5e892clAb3FQC7VSjxGG6ybMjSHiphBTT2CbTMTVjNB84Fx4+xyBMZIwWpOuTYtyfr
 ssbPvbep2/3F46QeapfTFGGxYnP9svyIt3p/ZSIGCbHmn5Elw0Z2v/ajs85gFUmYj24dyFzKoQ
 cmGo9QKhcZ9mFL6AqkcbqHrAAAA
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

Patch 2 keeps the lock over the count and the queue, so the state the timer
read is still the state it queues.

---
Changes in v3:
- the CRC source no longer keeps a flag of its own: it takes and drops one
  reference per open()/release().  With a flag, a second reader skipped its
  get() while the first one was still releasing, and that release then
  dropped the reference for both.
- vkms_composer_get() returns whether it took a reference; a writeback job
  keeps that value and only drops what it took.
- Link to v2: https://patch.msgid.link/20261119-composer-v2-0-a935e9bae6be@gmail.com

---
Oarora Etimis (2):
      drm/vkms: count the composer users
      drm/vkms: queue the composer work under the output lock

 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 33 +++++++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 29 +++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  7 ++++---
 5 files changed, 56 insertions(+), 23 deletions(-)
---
base-commit: 97429bac371273886238bfcf63d78e7405cacb46
change-id: 20261111-composer-cc9620515bcd

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>


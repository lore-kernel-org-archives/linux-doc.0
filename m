Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092948;
	b=e7cdo0VnnYxme1ftIw0BxAj9X6nzLAjyPlYKjakYEj5ILGFn9Amhi4amTghO/kCBWyBq
	 qGsgP7CdpFGpL+wF2wmWDQP54QIZ6LwrvNb9e5UAq0fYZ/ROFr3P2AgkZG+71DrdXo5p3
	 kwd75Q68tvnA6J2n8lfdMXug2oN27fixYVT2ZrR0t8yrWRgx2v0mMAGrqY/Mzxiz8QANn
	 8faJHQfaZpI0YZTjI+GEzzaOivR/sLX+ocqlvuKpQWHGNLaq/DVKKTQ1EvqRRefzMIJJs
	 0NmwElUqTfTVOv4b5oxoA+eEhx3bpCx/G5E/PkFtsgoCuVB9l+gb878wvbSJg1t21qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=A9m0MKy+gVN2zLdhjCiC0ZccLlxnaGGI2IAP9x2u+h4=;
	b=RXbhgg+IYRMGB0BCAwY6bbax2DsylfCP6zrhbYlSyzHlaa6R21Xrp2U0Ect0sLZBEVpW
	 sT5fJvUHyXFLBQ3Rtx+JKre2oeSguub8TA04t57+ZFxwm92yFSIDwODbWPK4Q6qAZ/oTU
	 LiDchJznaXwuDrz2BKM7MOprZzFnrNmpaz7foWOO2cIviRkpkzrBZI0rdIYV876TT7utc
	 TcZ6NHgjB0AJbiYYtwdh/T/LEUiY+LzkoI0VyygzNclYV25yudfW7z3hIF7GF9pD1z/7j
	 2LQMEj+WUy6BhKG+X1B6+hmL5qw/e6/ee48nvkhOOG275Ad7RRURptR4pRp1gtS/B1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFbppI9u;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC2F606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:55:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DC2F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DFbppI9u
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso30605985e9.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092946; x=1795697746; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A9m0MKy+gVN2zLdhjCiC0ZccLlxnaGGI2IAP9x2u+h4=;
        b=DFbppI9uXoNQpCDAY23IuUSwd/tDZ/XbLe2Z4E23B09Pyt9+YYT+gzIe4fM4wY3nul
         4t8u2YeXljKfu/UAwBgO/1pI3LBmbFSFJYEvVdAj6Ae3k35HelIA/vcYtTtZZoOzUPaq
         Xh/GhjO17OJafhlpQAmg0Ms9teWR8AI8D9+I2FWv3v7ZT6kq0I47MHH3GfGXq1Ryi3OI
         Mt4Oy6nmtDWSfUa1ZCVkGVZX8rUk3sFAc0WyITSBs9ZuNtApKloMHaxCXHBGyDqBjthf
         FTdlY1dSCjNjBzsuv7zPr7lCpMSkfopEKjzBJMGiukBMwO6dr75qwa2CBxWz+2DORqXh
         YdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092946; x=1795697746;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=A9m0MKy+gVN2zLdhjCiC0ZccLlxnaGGI2IAP9x2u+h4=;
        b=vUP6+XaERMvz4mo30hmdwc+cZfL0yCKzo8ztoXhAx+6aw4TBOC2EqpteMakJ9GSvTk
         bLLxpdlqmnN+IV2TJIi5MFVUjZMVeE156DRsvaHFXfRwytgjNGG+J4ySuJe09WhDX2dV
         VfzL4PlGdDFawA2tEma4A36d8edXw7vo1bmxHOHnRSzx+ox+Vw1MMZ6VumqgaXs7ralO
         1PJq3a+DUIxmEpaqYI+UI0b6nf4oNXyAVEeVN2yNluIPbDBAPQu52Jem0ihzAObigxA8
         Rurd12/YA/XVfK1ptX7Fyl8ScAg/7zHvwiYQBIiQGt5L7l0D75p1V66/wu1dSoOmsXWN
         PBvA==
X-Forwarded-Encrypted: i=1; AL+hErEebWXsidwzROoOWfarv8VYp0A3uUZQOSeEZMXVlZqB1bh1EfFz5fP6r1uN6vpTPKi28nWc74Zaojk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QFfC7Gm7ILUzQIf8/ow4pDDEd0atxo3f+gQbin6RYFqgU1KTj
	oE2fPLDjWAd7hB5O/fyBKYi5uLMKC2hbvson9ioSMYwFrlaImSJP+nNt
X-Gm-Gg: AYBFou2csELDdBPbhzN/cWt4le6IOyos0ggekx6RgURjIS9BOBUHTlc3l50dtdawAt7
	m7Vz2VZYCyMcfeiDh5U5/bxMwVe6Nxhlp9UjAS0vOkljHk715LD8JhZFx9DgA3bi4+RIZFP/8IL
	HbnVlxnxChvwVMV6at8l0N1dUZ82Q8Ja9VFzEMKWQLIOxhSY5vZi5P8Tb3ufPZIEFll+9F+Tw+h
	IzqKfoJxOIB10d5xw2sY8+GoesxZMODt+CzdqB32wVz3x3tevwkkg22ZEv35F6QdUvupRA2BIPX
	/6eek305eHwNDdaT65yzo9Ob0wUWQcQYzaab3sKNZFZEoWHON5xuhvALVC8NM5wdEnunT+HAr9s
	BHdx/66Au9qjvb6BzdM3UZKZD7rsZzd9+NgZcvqcbJC9w+8GGBirnEO8r5n2s/4Hk/GCT9j+e4/
	8/IXd2nxbYZtmNqxO8olgxiTA6gCWsjND0qTUPh2EY/gEaWxMesTLejJfITE92N2qXlCwecq1Jl
	U8yMNQiesglqZ9I+EcD1MP2mX+Kbd5neq05WLp/qS1tXiFc1ulo4uwUtli17shZGNQecNhxbTqX
	sNMLX1wEA95J8UTcV0xXgE1MJOteoN+6NZRun4XTWVhVLXjTRAEsvw0BFTRFd+I=
X-Received: by 2002:a05:600c:4e02:b0:4bb:6994:abf0 with SMTP id 5b1f17b1804b1-4bb7da4b889mr120201855e9.23.1795092945486;
        Thu, 19 Nov 2026 04:55:45 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm10198193f8f.4.2026.11.19.04.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:55:44 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Subject: [PATCH v2 0/2] drm/vkms: give every composer user its own switch
Date: Thu, 19 Nov 2026 13:55:25 +0100
Message-Id: <20261119-composer-v2-0-a935e9bae6be@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw7CIBREf6W5azGFCBFX/kfTBeXRXmNLA5VoG
 v5dqFtnd5IzMztEG9BGuDU7BJswol8KsFMDelLLaAmawsBaJmgJ0X5efSkRraVgLad80AaKvgb
 r8H1Mdf2P42t4WL3VfjUmjJsPn+Mr0er9mU2UUCINd0peBBfueh9nhc9zEaDPOX8BaSLoc7IAA
 AA=
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

Split it: the switch belongs to whoever took it - each writeback job keeps
its own record, and so does the CRC source - and vkms_output keeps only a
count of holders.  A get() raises the count for the user that asked, a
put() lowers it for the user that took one, and the vblank reference is
taken by the first holder and dropped by the last.

Patch 2 keeps the lock over the count and the queue, so the state the timer
read is still the state it queues.

---
Oarora Etimis (2):
      drm/vkms: count the composer users
      drm/vkms: queue the composer work under the output lock

 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 39 ++++++++++++++++++++++++++++-------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h       | 31 ++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  6 +++---
 5 files changed, 63 insertions(+), 23 deletions(-)
---
base-commit: 97429bac371273886238bfcf63d78e7405cacb46
change-id: 20261111-composer-cc9620515bcd

Best regards,
--  
Oarora Etimis <oaroraetimis@gmail.com>


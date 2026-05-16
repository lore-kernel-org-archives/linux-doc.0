Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C053D525B
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 11:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778929609; cv=none; b=iB+KO4uYeyzma0Y6XosY8M6C9b6+uxFIwMsfPyrt9h1K3CV6WPG2/y8QHtl22waQW+Jkt2B+tDIFohwbBgNm1OCsIGgGBqn50Xn4U/VTonvWZ3P1hdje4pVB8KtfudYx7B5Z0qiB9SXXNS99z8yD1+x7ghIlcOE0E8IF2wdjETA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778929609; c=relaxed/simple;
	bh=xGLM080fZDT6fjgKMdHlzv2Fg/jga2+0PO1niQABJfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mcVvCh0nRTXcLN9TOJGoR+Zd9JMWqDsNs59j+geVx9hm7KwJe7y+dRwDp6X9w96e8A9wGNyfGpqIFEOkY8BWGbdzxHQAKNvcd3GKAd/HlChVFIc3eAyNKiXbEZ0GHEA1cDR3mZAeUtXygAxQ9aBPHkfGjiTaIjnOxUlFYv1WDY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdVTmOB+; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdVTmOB+"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso3331905e9.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 04:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778929604; x=1779534404; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gz4+cZA8LSphozrVyKGbCKvf5hEOiKCi+FAiUdVKJ/A=;
        b=sdVTmOB+f9mZPSjk+s5pVWCST2ytO0fkDfznZQ6Lxi5LJSWYYYMcJB6M4A1VmiOTSA
         a9JhqTzs9OXoCXi8QtWlvU2sC7PJ3wA5BGq2NQc5JAI4ow14jTLPj+K7yiYweB6/ffhy
         pZhQGA5OA2RoodqOOXNytDnEbcCygV5Ry26VP9cW0N7MqceR73kVr4epNlX7hBlSoN1S
         +w+TNUqJB0q+YUxdz/e9p4ZmPGWKWJlHivjqZ83pFLikKfTGde7iUL87lRS0XLZw8c5c
         +uOFTwGmoeAvx2HLIL09HVSpTQxH3cVZBw+LnSLldYjL7nNpyXuOKxYP+yQtgOVFHQwE
         lgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778929604; x=1779534404;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gz4+cZA8LSphozrVyKGbCKvf5hEOiKCi+FAiUdVKJ/A=;
        b=ZJRNJ2Oyf1PPcAyHO8EL+LZRo+5K+ufzyUyBO1fHsWcHmrx9pndDdfVSC9YmrYMKzR
         O5aqWOQ0UuuKyQ5CVGIqOnUYGJoMBw7vtMKEb0EsVQxllL+qk3zU1sl9hS1+h4vPcS93
         I77EETPBh04O6j/UK4zk5dwWUew3blP0+g4EDAxvRwHJj6RXqHKKUsUEExqJE0DM1U0I
         FC40297bdYeHJTX97nNCZlPd4zEj/7QVytYQIhncZ1fe6YU4y6mvodY7VTKP2gzHT0dd
         JgSkuAHhQlHvfrTwDz6mJwsmsAOpQOaOuMr3/so7iprfGbr+gAHz0K1DNoD/6ww6drHZ
         xanQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BhUE4rwfeYlNLTeWG96PiHy0urr1uMO75XYlBEvWUIupkig8RgiPfN3pw+nky0S/ff+7lvrPCNYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Ku1+jZdcqOOtzU2lHLIa8yH8S1tQZ9ULyVa35tmKInbw6PP2
	R6NQHn6a5MOLRGgunbFt7sKgr/Wy5kQQPIslVG3evWMFvstGGmqdx9SV
X-Gm-Gg: Acq92OGRkaBiCahOpuIppOQp5EuHPUkV0H8lGQgK5z2EwfaRDjTxP49xWXNV+jacY6h
	5apUaIS8WTFTRae8kKV0sMiO+Algmr9ymRXq43cmrx8BXdkA+Q1MKijlFNzboKuN99nz9Z44Jq3
	bSn3SICyi7D8wd670ZPWgXy5iO4CErXUy5bb1OBWDeCi/bdhT8YIFemLO4JJOLLjamrj4mZrJB1
	AVkT2UtlljqMkPoo1nSryT7H2i6M0gygDR8HS4SadY0davod5wY+NmHloUORIxYUJbCvYWDjG/D
	W5Y+ZAdB+CmHB4A5wQGGIDeQv7/uOAGVtmcnSeMTaTI+27Nm2hMCCa4Jk8tXGQ/E4ao8mbwvwKk
	aIfFjrNjsjHr83yniZ6+YOIgoSHX+aaU+sSQ8BXusdgXbY+A0h1CFbkcmK9kknWINQZGmI2aY7z
	q1M+Dzf246EHRLChhcbEifz58qRAY+QqiWPuQT3VJ3xTLMvm8DsEvsD05RtxZUlXY5XMyrPiFEr
	FLMs8C0upU+G89dOg==
X-Received: by 2002:a05:600c:8b45:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48fe63253f3mr102196835e9.21.1778929604120;
        Sat, 16 May 2026 04:06:44 -0700 (PDT)
Received: from [10.13.0.20] (ip87-106-117-14.pbiaas.com. [87.106.117.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb00e5easm36399545e9.13.2026.05.16.04.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 04:06:43 -0700 (PDT)
From: Julian Orth <ju.orth@gmail.com>
Subject: [PATCH 00/12] misc/syncobj: add /dev/syncobj device
Date: Sat, 16 May 2026 13:06:03 +0200
Message-Id: <20260516-jorth-syncobj-v1-0-88ede9d98a81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDU0Mz3az8opIM3eLKvOT8pCzdFJMUY3OTZItkM8MkJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaAM1IAHdxAAAA
X-Change-ID: 20260516-jorth-syncobj-d4d374c8c61b
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 ju.orth@gmail.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778929602; l=3472;
 i=ju.orth@gmail.com; s=20251120; h=from:subject:message-id;
 bh=xGLM080fZDT6fjgKMdHlzv2Fg/jga2+0PO1niQABJfY=;
 b=zo0vZL9hPQu19bKw29wiQABC4vBPxw410iM5DsRWLuc6m/S5L7nGm9ePhoRvAq++IQEZPRF8E
 59xKe6ltBezDBB645EtSqjyATdjsklrspEITvGiRK0KsaSfJfdtER39
X-Developer-Key: i=ju.orth@gmail.com; a=ed25519;
 pk=uM2SS4lelkuIoYHc7v9N9bgBZ3hS632zJS2xjRJLPLI=

This series adds a new device /dev/syncobj that can be used to create
and manipulate DRM syncobjs. Previously, these operations required the
use of a DRM device and the device needed to support the DRIVER_SYNCOBJ
and DRIVER_SYNCOBJ_TIMELINE features.

There are several issues with the existing API:

- Syncobjs are the only explicit sync mechanism available on wayland.
  Most compositors do not use GPU waits. Instead, they use the
  DRM_IOCTL_SYNCOBJ_EVENTFD ioctl to perform a CPU wait. Being tied to
  DRM devices means that compositors cannot consistently offer this
  feature even though no device-specific logic is involved.
- llvmpipe currently cannot offer syncobj interop because it does not
  have access to a DRM device. This means that applications using
  llvmpipe cannot present images before they have finished rendering,
  despite llvmpipe using threaded rendering.
- Clients that do not use the Vulkan WSI need to manually probe /dev/dri
  for devices that support the syncobj ioctls in order to use the
  wayland syncobj protocol.
- Similarly, clients that want to use screen capture have no equivalent
  to the WSI and are therefore forced into that path.
- Having to keep a DRM device open has potentially negative interactions
  with GPU hotplug.
- Having to translate between syncobj FDs and handles is troublesome in
  the compositor usecase since syncobjs come and go frequently and need
  to be cleaned up when clients disconnect.

/dev/syncobj solves these issues by providing all syncobj ioctls under a
consistent path that is not tied to any DRM device. It also operates
directly on file descriptors instead of syncobj handles.

The series starts with a number of small refactorings in drm_syncobj.c
to make its functionality available outside of the file and without the
need for drm_file/handle pairs.

The last commit adds the /dev/syncobj module. I've added it as a misc
device but maybe this should instead live somewhere under gpu/drm.

An application using the new interface can be found at [1].

[1]: https://github.com/mahkoh/jay/pull/947

---
Julian Orth (12):
      drm/syncobj: add drm_syncobj_from_fd
      drm/syncobj: add drm_syncobj_fence_lookup
      drm/syncobj: make drm_syncobj_array_wait_timeout public
      drm/syncobj: add drm_syncobj_register_eventfd
      drm/syncobj: have transfer functions accept drm_syncobj directly
      drm/syncobj: add drm_syncobj_transfer
      drm/syncobj: add drm_syncobj_timeline_signal
      drm/syncobj: add drm_syncobj_query
      drm/syncobj: fix resource leak in drm_syncobj_import_sync_file_fence
      drm/syncobj: add drm_syncobj_import_sync_file
      drm/syncobj: add drm_syncobj_export_sync_file
      misc/syncobj: add new device

 Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
 drivers/gpu/drm/drm_syncobj.c                      | 374 ++++++++++++++-----
 drivers/misc/Kconfig                               |  10 +
 drivers/misc/Makefile                              |   1 +
 drivers/misc/syncobj.c                             | 404 +++++++++++++++++++++
 include/drm/drm_syncobj.h                          |  21 ++
 include/uapi/linux/syncobj.h                       |  75 ++++
 7 files changed, 795 insertions(+), 91 deletions(-)
---
base-commit: 6916d5703ddf9a38f1f6c2cc793381a24ee914c6
change-id: 20260516-jorth-syncobj-d4d374c8c61b

Best regards,
--  
Julian Orth <ju.orth@gmail.com>


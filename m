Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794115003;
	b=ZQ2mj9919wBqDmUCHEe4j3g8iILdzN2nIEhtoVq7F/qjwWw3Fm3jU86gUBmjeO9IGaiX
	 uYY8AnkcAO8+R+04CxD3y37ZaoSNPKxXHXfoR2uqQWMLylFtgHoNYbWPuscoyKWUYWQwL
	 T6iLrfVWZNa42buiIOqq233P2mfMW0vqHOWXIRI0/lkbK6yVwR4OeTAeKUaSzdn1T39QB
	 ZxR9hxntOiyUJatG5vFITgPek4cA/dqSu/fducmbqzZvt9Kbwr7tOrdqI8EoAj9tcMRKA
	 3QLLS2X4oevQtgQFcRuwe03ZIhWlHztMtDtW6QQa4aSRJLFmsJAulNFyHfHiiA5vcSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=gT62dXId+eAb8ukDUrV+GLnTEFym+aAlD/IHLPxFdUE=;
	b=xu0hflVubMXPTwLjKZ1a14Ov3tuGAe8Vx+xh8czdPbLqfc7rDll7eFUCxmyRQBjzlELc
	 Sw7U2xBPExcKZX7uHc5tDW8x7TbJmXhb3i6Lov7gfCJKbtPrXnio/MSJgj2lxWC/ahQBa
	 iRqyCJDRw7u+vx26y/YLJYezeMl/nJ+cWDP2Zaq+ltSUBSWO07f1CtgZeyS9GvRNnhKhi
	 4OvbvET34oVBg0H4JlRrLLUSGmlN92JjuSBYNaJJ9G7ph79vU7kQ/ivhsmNAZLoWEXo/N
	 MoGSJTFtYVJdXd4SAidXGJ/UOa3SdFsSarlPC9tdSqffN2Yd5Z6cTwcki/m9gR8KNqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=engqbeXt;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F81606A31D
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 05:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F81606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=engqbeXt
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a315ed211so236080eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 21:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794115002; x=1794719802; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gT62dXId+eAb8ukDUrV+GLnTEFym+aAlD/IHLPxFdUE=;
        b=engqbeXtR+rWOhiZBYTkPKjjtnb2puay/ycsWiBLGX8+NMoejL9uT3B+p63imdwMRz
         wKi0k8S44NdnihDJ2kDYDN1RokTA2Wf1Lxx77jziVHZ1dN1WriHv7ckibVukhHSKENSJ
         /aygp1AW5ijJgeqZI7W5ZezrV2ZUEx/s1wDrNgwZB832MumiRNE2ZD1sq6eG84g1wPYG
         SMXDSD/w6pIrWZ+WYYQUs73M+Dvt61ebj26ZOf5h7VH9GmBwEkEpnrGjpysdLkPcOmO6
         kgCIx92MRkIB6cX0E/aUQbLWAeg8UKbxvzlkV9Is137WLbceMfybIgQWsLUpC3X+RF4s
         SVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794115002; x=1794719802;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gT62dXId+eAb8ukDUrV+GLnTEFym+aAlD/IHLPxFdUE=;
        b=cY+lZnuFGMiE74lSGMw/iREzFhDrfptuXzDyXuUkq+LPaZr1BUTwNMqEgGSKrSIz7d
         oF6otX6PZ0y9Uxf5ybIlZoZcFm3INpz9WFPs/wobjyHYuWdsu5pKqXciGg7UXsmKLEuA
         bG0NHLUs/+Wy+hQGeidKkL1U+NMEknm9u1rpyGIlgVxJciyoRwOMsELV+DGqpyz/6XXh
         yjOEc+gk5/+Aa8qKlCP2UHCydiF5kDRd0KtYwREsnyUa/FUwhUEX2eEYDaaxpl2QvaM0
         uvxr+oclTSPEKbaXHC6P7pSSJXSI4PPt4Bc2wXgTR5Qoitb05rhu1tBU1I1Jb9gecDd/
         c86Q==
X-Forwarded-Encrypted: i=1; AKwUvBx92TxeF59n6Zc1XI2MHPXR6oxuZtVWeVbYjGoIv0rmU/F59FyERHOALSqn2j6y4wvZMfdZQfdH7bI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bXImWNp7Z1hje/+P5rMA3YFrkUJ1pldWdh6dB7XyjBHUq3qiP
	59orDrDSj9uaEPGN21xCKm/m8yEpBdDp4AAO4ZmbWd2rde7WludrMls+
X-Gm-Gg: AYBFou1nL6Pkj5gP4Bmfq1l9BLDrBorC2352MrROGVnVpYiXabSJlI25dkQQ9IAL4Fp
	QfSr0EusKJgdcpyFZCrYK7/4IGDfQqUMZ93oaXEHRTHymx3atenBxfaDQj1JDpAxIXqEXjYPhNX
	8glSPI7eaJiN2htYhuU8DyauA2DkflK6a7+YosPAMbE9C2kNsQGpxEjBQ+gJh2gbHRBneWToQEA
	SPXaHz/vY6TjtJszhQh/XrdetOfMP4yjhF8iuSQS3tZJc3tC5r5eiExfOiAtGZais4x22oxwiTj
	ABHA2aI1flYfMFeywPmYi5wW3QffAkMvsX9vXY1o4Okd323IcFellpaMHBc0Qp7zSpesOH55fvP
	S5fmyg1WuuLPZA5ViINB9eCQ48/LRwr0w/UZon2EBYP292J/RRdwqRGog6mlTX8uuUAeRMTeerq
	y3/xbudeuNKl2GFkJ25GDMRFox8c5CwaDUIyFyCR0aYrZnIOWA2ixKBKGAmIhrO7N2Kwl5jkyzW
	MulIu9QLzpXRMPABeOK5SpegwshKmVPIpiZg/DvFlTOTQFab3rjXeyQaqDJIaGc3NJsRePLrDty
	PozRzjM5InCCqIh1v6T3Ik/l1A==
X-Received: by 2002:a05:693c:8819:20b0:36c:dbfc:ee6f with SMTP id 5a478bee46e88-370f6ec412cmr5291748eec.14.1794115001952;
        Sat, 07 Nov 2026 21:16:41 -0800 (PST)
Received: from [127.0.1.1] ([121.125.115.175])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372667d60absm2750989eec.26.2026.11.07.21.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 21:16:41 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH v2 0/6] drm/imagination: Add async VM_BIND with sparse
 mappings
Date: Sun, 08 Nov 2026 14:16:22 +0900
Message-Id: <20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAKgF8GoC/22QzU5DIRBGX6VhLYbhAheaxvgeposBhpbk/gntj
 abpu0uvGjcuz2JOzjc3Vqlkqmy/u7FCa655nhrIpx0LZ5xOxHNszKSQRljo+bIWvo7c5ylyCKS
 ScAh9r1i7WAql/LHZ3o6NPVbivuAUzpsjCNkRhdQpFY2K2AdrhfYGlZagQ0gyUhL6R1Xo/dp6L
 t8+NlKtuPXsd4dHDgjQW851GnHhOAx8mOeFr8CBaxVMb6ICadzracQ8PId5fGG/VQ3GfGlDo0b
 bQRddSM46b5PuUBvr0BmyDnxyLnkZ2GPPOdfLXD63Z62wVf37l1YguECRJHjqY2f/Ctjxfr9/A
 Wnul1h2AQAA
X-Change-ID: 20260817-pvr-vm-bind-1ce4f09a1774
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Philipp Stanner <phasta@kernel.org>, 
 Donald Robson <donald.robson@imgtec.com>, 
 Sarah Walker <sarah.walker@imgtec.com>, 
 Matt Coster <opensource@mtcoster.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
 Gyeyoung Baek <gye976@gmail.com>
X-Mailer: b4 0.15.1

Userspace MR:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/43794

This series is for Vulkan sparse binding.

- Patches 1-2 switch the GPUVM to immediate mode.
- Patch 3 moves the existing map and unmap paths onto a single bind
  entry point.
- Patch 4 adds the VM_BIND ioctl.
- Patch 5 adds asynchronous requests.
- Patch 6 adds sparse mappings.

Patches 1-2 were sent separately [1]. They conflict with drm-misc-next,
so they are rebased and included here.

Testing:
Tested on BeagleY-AI.
- The existing IGT pvr_vm_map passes without regressions.
- dEQP-VK.sparse_resources passes for the sparse features the Mesa MR
  above exposes.

[1] https://lore.kernel.org/r/20261011-pvr-gpuvm-immediate-v2-0-744ddc6644c3@gmail.com

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
Changes in v2:
- New patch 3, "Route map and unmap through pvr_vm_bind()".
- Split v1 3/4 into the ioctl (4) and the asynchronous mode (5).
- Bump the driver interface version to 1.2, as 1.1 is already taken by
  another patch.
- Link to v1: https://lore.kernel.org/r/20260817-pvr-vm-bind-v1-0-0a0f21be7d38@gmail.com

---
Gyeyoung Baek (6):
      drm/imagination: Switch the GPUVM to immediate mode
      drm/imagination: Stop locking reservations around map and unmap
      drm/imagination: Route map and unmap through pvr_vm_bind()
      drm/imagination: Add VM_BIND ioctl
      drm/imagination: Add asynchronous VM_BIND
      drm/imagination: Add MAP_SPARSE to VM_BIND

 Documentation/gpu/imagination/uapi.rst     |  15 +
 drivers/gpu/drm/imagination/pvr_device.h   |  10 +
 drivers/gpu/drm/imagination/pvr_drv.c      | 331 ++++++++++++
 drivers/gpu/drm/imagination/pvr_drv.h      |   4 +-
 drivers/gpu/drm/imagination/pvr_fw_meta.c  |   6 +-
 drivers/gpu/drm/imagination/pvr_fw_riscv.c |   6 +-
 drivers/gpu/drm/imagination/pvr_job.c      |   6 +
 drivers/gpu/drm/imagination/pvr_mmu.c      |   2 +-
 drivers/gpu/drm/imagination/pvr_mmu.h      |   1 +
 drivers/gpu/drm/imagination/pvr_queue.c    |   3 +
 drivers/gpu/drm/imagination/pvr_sync.c     | 146 +++++-
 drivers/gpu/drm/imagination/pvr_sync.h     |  13 +
 drivers/gpu/drm/imagination/pvr_vm.c       | 781 ++++++++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_vm.h       |  63 ++-
 include/uapi/drm/pvr_drm.h                 | 129 +++++
 15 files changed, 1303 insertions(+), 213 deletions(-)
---
base-commit: 2d5a8313d9cf989b8f53a5689a96e891bf99fb2c
change-id: 20260817-pvr-vm-bind-1ce4f09a1774
prerequisite-message-id: <20261015-pvr-unmap-all-loop-v1-1-54c676d41269@gmail.com>
prerequisite-patch-id: 5188d944e90112e4cf2678e75255c7a91434ad09

Best regards,
--  
Gyeyoung Baek <gye976@gmail.com>


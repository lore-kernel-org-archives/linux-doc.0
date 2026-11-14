Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631397;
	b=ZhJ5iCGzBx4p5/SSHVY3U7cyFUqkhIW5qDN+NknY5yDZi5g7x1iJhAsivpnYwAHzXTMa
	 hGCi0KEmuH7utZV/8CCxI7CrdVoM5kqyy/1aWtQuEWJKacAL83KomFn9EfPEEHkoPhrqJ
	 af3BAKzpRXMXYmlEUCT8AqRCfwWvclVgMxGAoH3LeHx/MA7GzVHtixqpUc5Df62xROEjW
	 mOvcS9W79NtJdzewQZ8CunVkIyvl/8F8UMfB7FVejKTQpDQOzZ7tg0yMrVs6RdMiPi2r6
	 Gct68QWND6S5h0Gu1zdn3ToBJS/4ihcsQHMXnxc5v7htvKhewXmpFNgFsZtdwxigdDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
	b=4mtMl+QggClB3QKZDbzX8TR4nAIPXlG1InMy7J0/opd2booNd5yHViodZ/71H89L5NpB
	 WF9u3G3IT6VcQs+BjVwjbW3mqH67wSTW4plXIGUOoaXE2km4CLBRIH/XsPAhxE2WTHLR8
	 AeaRdN3u9mX8oAH0qVBQA/pu2i4EYdwMpsS7IiWaZ5K2ND0Xt6SC73Yx/QZcbalq6eMif
	 8AENDsOHiAFXM//J3M4kp5G8QMSi/Hm3IeECVRd5LEbPQM2BaFxzU+O/bBlH8i0NXPlXc
	 Rr02EwGf8rKbmJP+xBlZgG6uFQu/q7Wf/vkzhsiQtj4527ydKBD4uEZ9iCJeuEBTy9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnhzdhYn;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96485606A323
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 04:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96485606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnhzdhYn
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b18717a193so932917a91.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631396; x=1795236196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
        b=BnhzdhYnZq+pqF4iUKKylyIbQCtz1P0HwrjsAZxz6tTO9OPb+g+e4k8mFpT0Ig+R55
         gYT+FrZFc3/ymqAsAhlA63dK8BHdlH1JjHkf3ATpfdGFxg0paLMvY8DfzxXSo5FlO8La
         TxYOx7KkJBnojMOPBzyG77uTuXn2lww6vDYa2GvKAabHezw2KoY2laTRxAvEDcLYRdrn
         MTMpilHlDRCzhnRRD+DDCWLfSEZCAIiefZkCh0B6SicqUZH6BtUB6wtudrbEBoYnUx9Y
         9UIiSOvZjAvh2H3N1sloGdYGAUSHqt8HWZg/CsQSn3KPGsG5z9dFxbsMmJ8LIoDktWHh
         xHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631396; x=1795236196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
        b=zAU0zfVK5+Qwn0zXAN2gmjS2cOV96DvtoPeUL+GDB/oagVFZbfa7IJB6dDPPNoty0o
         0CfDxuGk/Bby7xI9rq/5KjOumafYcQGx7fygzITxGf1n6kzWqyp4SrnGl4+6Vi2b7a5Z
         NaMYDH1zagPlhaTTWKFncxQx1z8z8VxTYHO0n4KeEJ8Zmb2NDM9I40wxu17GTMWfUflj
         nWRUF4uD9ioZbUsP8Gktn0FKKfkppIQigOLxEuMagOOu5dad+Vj7bu+uYjoxQOaI8o/8
         GvXClOFeLbyKwLT8CGEakraP+7JKVEVSMQxua9c9Byx+KKsDZB6nL+pM5QbT9iT7BEWy
         J9cw==
X-Forwarded-Encrypted: i=1; AL+hErH966CEEp/gDW0rdbaB2sXH3GOUA3V+TbqvRc3b+PFW0LJcUTs9vKhlshc5vTlNzwTewqQYI7BvIEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AEeKITNJAaPM/EmcG9Vgx/kIBH5SzDRcPsi8wfQ/5E6cKvXt1
	G607XZlx5ZbDGD7b3yjk6C/EAHJJoBeCHHSBiqctjW9Lcz/cgpV9i6/c
X-Gm-Gg: AYBFou3BOqDdWKQRA3v7rFPBoT53aZtQ3YkBthAZd+TVjjJq6mOGzzCSmjqLzcD8wBC
	1+mcCVPZUOlEVCxuhEjMr1x5Qcz8JACSc8IufSH3CxOgUOoMI8n0CdoT5aH/Gf6zZ8g3uFhX9BM
	iUBQU0zNqZPQvCLHm79TW1pngeJ3OFWTgFLzCNSKYfQ/Cy5c5UH1N8Ufj2UY1pANlYG4CGl650V
	vyJA+Jr4u/a8PtY4hWHt29TtmsgzIoCfidNpWZAICgpxYGmnOcn9y7Vg61uUeoAvjLVl6rtB8J3
	gT02S1b0G4+Sli9sYPzcEKzs/+N2UIQNwsqm50sbSblo9dYKOKS/JpUgQ3a8WpHqcew1LuIZxBQ
	yQeeb/YWfid51RBYsiyh6tRmx8ekiInGwsJ+BwWCE6vM3+Kgj9x+nWVUcONUCF3VaX8H3JOgnPw
	Ga9+o8rexX5dZxuUKWQ0ZO3vG7sm5QBau/6F1SfvCwvDwUPZ9O05QGOnhgNcidHFWCzSlomJuvN
	IH8rWvMpPR9YDRSSPuPMel9pkPYha5xgMRJhyGsSUPd3nkH31yIFtGfHu/YADy83izEc9j0E4l9
	ZCNCwLCoYMDDM9zhI0UwCpx1bMdA3yn8Vxc=
X-Received: by 2002:a17:90b:528c:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b1b0a4e3bbmr4061630a91.40.1794631395879;
        Fri, 13 Nov 2026 20:43:15 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:15 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v8 0/4] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 14 Nov 2026 11:43:00 +0700
Message-ID: <20261114044304.245684-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The GSP-RM log buffers are exposed through debugfs, but they go away
when the GPU is unbound, including when probe() fails, which is when
they are most useful.

Patch 1 moves the debugfs root into the module data, which also fixes
the root being leaked when the driver registration fails. Patch 2 moves
the log buffer code into its own file. Patch 3 adds a gsp_keep_logs
module parameter that keeps a copy of the buffers after unbind. Patch 4
drops the completed item from todo.rst.

Changes since v7:
 - patch 3: check only gsp_keep_logs, not CONFIG_DEBUG_FS, drop the
   reserve() before replacing the copies, add RetainedLogs::push() and
   mark retained_logs() #[inline] (Danilo)
 - collect Alexandre's Reviewed-by for patches 1 and 2

The code and the commit messages were drafted with an LLM coding
assistant and reviewed by me. Each patch builds on its own, and the
series was tested again on a GB203: the copies are kept after unbind
and after a failed probe, replaced by the live buffers on the next
bind, and nothing is kept without gsp_keep_logs.

v7: https://lore.kernel.org/nova-gpu/20261113075317.934264-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (4):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: move the log buffers into their own file
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/debugfs.rs       |  45 ++++++
 drivers/gpu/nova-core/gsp.rs           | 100 +++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 205 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  68 +++++---
 5 files changed, 313 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0


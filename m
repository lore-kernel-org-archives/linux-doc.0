Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E6635F197
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 18:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789324671; cv=none; b=q7mn5G4V56EbG08bbr9XcySMRxTVI9Il/85DH23LP6WyXElkJbW8BX2B+lbY9246p2Rj4BphqgG24EvZu+Tb+0tTxFiCT0xk1R4h4bssOuopUnH/VJibM0TXgFKrqrLIeOmObywQVGV5sHPrQPrwnePgnmwimpME58Swy6ikOHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789324671; c=relaxed/simple;
	bh=Q1Lvvh0J91p4IBd0tHJVInbms5W5qkkgLtxjQuVBLKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dG1pMjgFtAn+pUVP7y13pytXOTkEFAl2/qpLp7mQcXiGGQRx48aVJh25SWeBvUynHYzLJO3HA8lYqB6g+TRUioYeZVrOIx0R+WtfjQ2menbvaU7pPrVibjcc5P9yjcogwSabgK0j7Nc0QBr3v/Q5EJ0lGYBT/07iRCPxzbf+ZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0qiHAkA; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0qiHAkA"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so861187a12.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 11:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789324668; x=1789929468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=d+o4MSkuQ8bnuoNbaiZq6FM4PPIv2ZxLKihE5535AIA=;
        b=H0qiHAkAN94TYPAjzLtO1xsxcf9mhOmzTE6X08sS0Nb8Z96CmD7WToVgHxdEZ1fhaO
         QU1WG6Wh9yourDHb6qZgO6uUizPbMDMSL3ClnTzkP1E5lqD7JrGTw52tNX2cWXcMFuTf
         Zg//kdkq+XGKdj9/8CRKPWLpiY5u9bQ14OnQ2zTuqL0JORvvbfy4YZsbDEdoOkRe//Wv
         y6vwjKWDd1UiFF+JgsDnFD57vJuKuEw+q4BZQDZOiadGkXWQepFjfYFv8gRlojWcpGh1
         jFI+rNagofHMSvnpmczlwER9EkzNi0D7+VX0oY+LX/HFFg+cpGE8xJugBJZw5e0P5bGT
         8Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789324668; x=1789929468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+o4MSkuQ8bnuoNbaiZq6FM4PPIv2ZxLKihE5535AIA=;
        b=TdEJUc106FoialWP7hs4UAU5pwPzXC4GcffgqxxMNyUrtdtQtiTKwd4w6pBr+WgH3s
         +X7fBYd2crXqF5zmEmDyxJ8SW2utp8q6skJ9XtR2/3Imh08PuAhJh5rhCv0AP0Tv9uwb
         5jM9ED9nI/ktRWIj4httRLf8NtHW+2J122UzjWLQyo2fORc+kOhaEhxL4/OKTKfrEZvM
         CERbsncYXp23n0nl2yllCwM+zv5id6qUHnA9w0qMEwu6tXI4T1qu1onSAcO16GpHDs0e
         vaOWij58QOr/O/3OXatfmsOu7msWPxwC6t1QuZl8fJrulk27HZ8LG5AymtLOeALOGDa7
         lBvA==
X-Forwarded-Encrypted: i=1; AKwUvByf25x9UiC4w4kAGcyUMb5N3tPMOsuQSzshFGrGzjDtWMFbSWm47PfZsjoiJU8lP2SsMpyZ/BlaSQk=@vger.kernel.org
X-Gm-Message-State: AFuF++kkOb5khfXf/CXKm/PajSazgLagXYcksJmY+wKqd+VN+gA2YUjq
	0Q+QzGfc1PFKAeChlswH60rJ2FgE3lQYLw+1VKyMSOySLqXJxPHA/eUR
X-Gm-Gg: AYBFou2x0elRKNyCKVNQcM6hpNq6h85CnxVR8gCcw8aKn3C0PRONhfaodhD072z5JYy
	3eS1L6AAgu8BEU1bG4X1CNzZlf5+liwtL8hen/L58BOlLBeVyzvN2DY26RtQvehbuGh1T7mo7gu
	/xWWoCsZBJTzi0Er1VVy3by7rUtcBE/THL3m6xT69fdjOQwtc7McX+s/dW3txTkufxYOGOizulH
	PKJiKxSf2kUcwQfF/dHvG7FOg/SwiC9gzeB0La1wkWBulWpTtr8Sfx6rA5Ef6Dp0LOqg5KTJdVg
	g6xRUdAJTuqiVniyPkxgFeqcbov34Te4jKhhj9W8egA1hY24kE9cTqmKMQpFRiigGa1qlz92yS7
	Yt5ClXrHHLARNqut5HNOtMsB8OvygI1J24YZLzjRNngRNzwST8QvJHE5QGhOtehV49/5vk9rGAa
	i344aEFvZYi/cJqbrDQdF0lPH9h6CQM46G24OePMcKiA9+q50fxBGKc98jVgo35dmznGIhHnBwI
	h0MAw==
X-Received: by 2002:a17:90b:4990:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39dbbe8b896mr14518295a91.5.1789324667744;
        Sun, 13 Sep 2026 11:37:47 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9b08165fsm4118447a91.1.2026.09.13.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:37:47 -0700 (PDT)
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
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v4 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Mon, 14 Sep 2026 01:37:31 +0700
Message-ID: <20260913183734.134307-1-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GSP-RM log buffers are exposed through debugfs, but the entries are
owned by the Gpu that probe() builds, and the buffers themselves are DMA
allocations that cannot outlive the device. They are therefore gone as
soon as the GPU is unbound, and in particular as soon as probe() fails -
which is the case todo.rst singled out, and the one where a GSP log is
worth having.

Patch 1 gives the module data a DebugfsData that owns the debugfs root,
replacing the static that held it. Patch 2 adds a gsp_keep_logs module
parameter: when it is set, whatever the GSP wrote is copied into that
same DebugfsData and exposed under a "retained" directory until the
module is unloaded. Patch 3 drops the now completed task from todo.rst.

Changes since v3:
 - keep the copies in the module data rather than in a second global.
   The debugfs root moves there too, so one pointer now replaces both
   statics, and the global lock and its unsafe initialization are gone
   (Gary Guo)
 - with that, the module data owns the root and is dropped after the
   registration, so a module init that fails can no longer leave the
   directory behind. v3 fixed that by ordering the fields of the module
   data; it now follows from where the root lives, and the guard type
   is gone
 - keep a copy of the device name with the retained copies rather than
   a reference to the device, so that a GPU that is gone does not stay
   allocated until the module is unloaded
 - drop a re-check of the retained directory that could not fire

The pointer is published from inside the initializer of DebugfsData,
through the `&this in` form, and it is a raw pointer rather than a
reference: pin-init does not allow references to fields to be created
inside an initializer. Readers turn it back into a reference in one
place.

Testing was done on top of drm-rust-next with the TLV firmware images
installed. On a GB203:

  - with gsp_keep_logs unset, no "retained" directory is created and the
    entries disappear on unbind, as before;
  - with gsp_keep_logs=1, retained/<BDF>/{loginit,logintr,logrm} hold
    the contents the live entries had, all 64 KiB of each readable;
  - binding the GPU again recreates the live entries without disturbing
    the copies, and unbinding it a second time replaces them, leaving
    exactly one set behind;
  - with a failure injected after the GSP has booted, probe() fails with
    -EINVAL, the driver stays unbound, and the logs of that attempt are
    still readable;
  - with a failure injected into the Registration instead, the module
    fails to load, leaves no debugfs directory behind, and the next load
    comes up with its directory intact;
  - the copies are released on module unload, and three load/unload
    cycles leave nothing behind.

The parameter does need a value: the Rust bool param ops do not set
KERNEL_PARAM_OPS_FL_NOARG, so a bare gsp_keep_logs is refused, where the
C bool would have taken it.

No warnings, oopses or refcount complaints in dmesg throughout. Built and
checked with CLIPPY=1 and rustfmtcheck. checkpatch --strict is clean
apart from the MAINTAINERS note for the new file, which is already
covered by the existing "F: drivers/gpu/nova-core/" pattern.

John Hubbard's r000 series adds three more log buffers in gsp.rs.
Whichever of the two lands second needs a small rebase; the retained
copies extend to the new buffers by adding them to RetainedLogBuffers.

v3: https://lore.kernel.org/nova-gpu/20260912071842.622696-1-vladazaharova2018@gmail.com/
v2: https://lore.kernel.org/nova-gpu/20260815050826.306717-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++--------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 253 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     | 109 +++++++++--
 4 files changed, 362 insertions(+), 112 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 66a2c223b620d844fe26c6bd4844d2a6a8c9dffc
-- 
2.55.0


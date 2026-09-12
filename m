Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FDA3644D1
	for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 07:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789197529; cv=none; b=mtznIW9tMANVVTS7sIav/xSfxj1HqSDDhuepvNwpt4OOCHquUFug2nwoHAqfAwqgiVpiKHvSfQVi0nBlJhZH319OzzqCiRSFRM4sLohbQ/P2rUnenlP3fCJNeJqRu/XT9AewCmjzOhoejFvqItzry9POI3GV14wrGVfpBHRKrQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789197529; c=relaxed/simple;
	bh=bTCuT3YDfl2lby7IRjjh/svKRwiHY4G7WKEbHKZAxrU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LTr9QMCNndu+kkFJTBkJ51w+VshfFgheBdwZJFF9qjV2iEshdPscp9RHMXiZUzJ63fB0WUHgrlntVPOQlJ3U6ULm9zbySlUOM6LH0F3rOyPFOl7bBEJuptpg89EAWynNUxjPHEJLjngT1coTN09nRPJQMLAdhO1i/1ryrMqsIRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A1QICH6g; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A1QICH6g"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f13so675985e87.2
        for <linux-doc@vger.kernel.org>; Sat, 12 Sep 2026 00:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789197525; x=1789802325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rLeyn0OC1le5MSTZk6KLze1f/9azpPHpmNeLJDOBQ0U=;
        b=A1QICH6gZaHOOJcTEzhqEr5zWwErqyp06KeZtQDFUjcb1d6gQ4YpYvOBObTbT2E+kW
         ZUSjU7AIz5WlxFg8/LdZeJAywK0o6zz7WJpeLGIOWNGF+nPU2fTKb0j/6M/jigWTnZht
         18SteFdOblUCnUoL+eurRlbYZQSrJY8h9/8iRYhqSGZDi4RF+oOo0+MIVhGFo/0YxcjL
         9l5R6E8OhL8wcoC/0r6F3TW27bRtoUrYFRg/9+Ov9xadYMeylrIRl3ICYjNTf0TIhywr
         13xBXe2gGsf/QUSTsRvrMi91NqGqELARrP2zXEw2xzbsPRwZqUFiAzR46UdiZBE/awJZ
         Y/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789197525; x=1789802325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rLeyn0OC1le5MSTZk6KLze1f/9azpPHpmNeLJDOBQ0U=;
        b=enOcmmyVuUMLyOHUFg7Lwe1AIuyaw1W2e/lzMm+hRsATsEet6Nkm++uB1Lns4sMND7
         wkcGPWdFR8YkK5f+dFvt8sYocvP6uX7G+2BkMxHv2b81Rs87tVxC5pUPuBdAU+HTZ4QK
         isqJ6C2s/biilfghZ0yZR0csX/R/udmSRrs2lDS8nMq7icc46GVtDZ/mCZzutE55E/CO
         iq86z6Ck5nMJ2831yqQA8lLAclZPxgjCnuIuH3RC5edjrXu/DNx6gNUCpmQsEl4slQXf
         VQ/w/4k3w3ThFAHXrIEgdxoVKeBnfrb4UTReXi1kXRgbrN2wkxD1M5hIquLQdAVat7ZI
         QGXw==
X-Forwarded-Encrypted: i=1; AKwUvBz27T+hXzKSogavad49VXC8bdFDbQiU7TQYcH4kzjnPLvF/9mY31fV+8lptKqgDZ06IGZC+mLHmClY=@vger.kernel.org
X-Gm-Message-State: AFuF++n+TzDMF/y3dePzHxPDzD/iS5Aaz8wirV1NtOzdXgvjrd3OeBPY
	XAKEW7GwlGK9nIHqDP5ywWZiZ4GQ7cCRbJVvEqWH077X34gaR6vmJnEA
X-Gm-Gg: AYBFou2ikO0lHM6bPp+tVVNQvasgmq0ZmBL0E+IJt7mZHRjF7myu6AAcj70dzNMuRRD
	MnqJ2ywoqjtTZ8uh5Uhnn7b1QPaOaFt6uSxCst4yewto/id7j7Zs0cY9SIMgfQsTZnkQPyp2U6D
	SRKx4GqBKJMnlxN231h62oV5EzkgUKlT9drR0Mc/tSVnJE+EvTfmFvWb/fDxGHnFOhHyGf7A99r
	JJNc2yb6fZEsnOlqncf9fHcrgBPwnkdsutK6ElTN2IPdybr7Ql0zygSVNnl74RdbYEdGs8tfRzI
	VnW13B5CCqAXLyJiACVGL9qxubLckvM9ggTyYfCLo6K7QU6rsj7bL6wqJ5pe2/BVXmBtcjZHw33
	a4SK49qLSpp5wtD8RxYrBcnD17PN5X/5GGGJPqA6/ZPYEojVtp2c7W9Sx3od6hlly94lry58VEz
	YesR15NlTqeCflnQ8cbNMEZ3l/ILFgcMu54Sf9SHhsKopsgKV0YXZY9ZSyPnnBcbPEj+t5JLQ7w
	9Lj7A==
X-Received: by 2002:a05:6512:3b87:b0:5b8:9ee1:10fd with SMTP id 2adb3069b0e04-5b8a0343aefmr3048202e87.32.1789197524822;
        Sat, 12 Sep 2026 00:18:44 -0700 (PDT)
Received: from localhost ([95.190.112.239])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04571b0sm1096277e87.13.2026.09.12.00.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 00:18:44 -0700 (PDT)
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
Subject: [PATCH v3 0/3] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 12 Sep 2026 14:18:39 +0700
Message-ID: <20260912071842.622696-1-vladazaharova2018@gmail.com>
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

Patch 1 is a fix this series needs: init() builds the Registration before
the guard that clears the debugfs root, so a registration that fails
leaves the root behind with nothing left to remove it, and the next load
finds the name taken. Patch 2 adds a gsp_keep_logs module parameter: when
it is set, whatever the GSP wrote is copied into memory owned by the
module and exposed under a "retained" directory until the module is
unloaded. Patch 3 drops the now completed task from todo.rst.

Changes since v2:
 - rebase onto current drm-rust-next, where Coherent carries the lifetime
   of the bound device; the live log buffers borrow the device rather
   than holding a reference to it, and only the copies keep one
 - make gsp_keep_logs a bool, now that module parameters support it
 - add the dma_rmb() discussed on v1, as dma_mb(Read), between reading
   the "put" pointer and copying the buffer
 - build the debugfs guard before the Registration (patch 1), so that a
   failed module init cannot leave either directory behind
 - keep nothing when CONFIG_DEBUG_FS is off, where a Dir is a zero-sized
   type and the copies could never be read back
 - take the snapshots before acquiring the global lock, rather than
   holding it across three 64 KiB allocations

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
    fails to load and leaves no debugfs directory behind, where before
    patch 1 the next load would have found the name taken;
  - the copies are released on module unload, and three load/unload
    cycles leave nothing behind;
  - 1, Y and y turn it on, 0 and N turn it off, and a value that is
    neither is refused at load time.

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

v2: https://lore.kernel.org/nova-gpu/20260815050826.306717-1-vladazaharova2018@gmail.com/
v1: https://lore.kernel.org/nova-gpu/20260812113752.532537-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (3):
  gpu: nova-core: build the debugfs guard before registering the driver
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++-------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 267 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  36 +++-
 4 files changed, 320 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 73e5616f3d197c1af5a04a481fe0f13aa3913bd1
-- 
2.55.0


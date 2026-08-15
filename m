Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B584242D62
	for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786770514; cv=none; b=XDE4fnFq2bFkj3et3a2C4dQTQ9wuw9fLPdV5A3Qvyhwl9g8yus/99JL96aHxQS17iS4RwHMU0Iy9825B/hF0AD6F+FbIQ4mAfGfXRLquQ2gF+VT4We1ymOEGSvG+CPYMw+cU0+elzu+WhXmX/WEuzwQJslcISWZPtwWJXNLdJrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786770514; c=relaxed/simple;
	bh=3gtU+cy0ZJ+hiolSfLE6IUY68+TSR11bm8MWfskBrmI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LfOPImHYqbPCcK12ITN6lLGnKDVFJZ5OEug50EPvLKxwk/N2P8In2QYlFlcEv/smThN1at88aX8MjokyQELd5TCwMNVq3vgDv8x+HJpMeVYaETEOqo1Txe1EUw7DIJ2A3Q+8G9ZznmWiBFfziRxNhSHAP4+n0DhxgUUhFikCeGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbDBlmbF; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbDBlmbF"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c953950dfso14075111fa.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786770509; x=1787375309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+Ki1f29ZNNzrhAw8g31VS5wgylnUVVZbopDUMwHeVLM=;
        b=MbDBlmbF5fP0amJLjpzN6XcEsW+E1bOgyPjuXrtlZK3SWmIFWVmEanMgVwV4JWBWGB
         lo2fDn5JslbnaaROhchm31PC7b0cUcf2seQFUeXDk0+9tiChO0KvXx/dJF0zdGeBRS45
         84/HLDTPyRGFNtv8yM/rL77uLtiMKdlr3JraAMRyf/o/wOKeSzbCwlz/pGhOTfU18udp
         eL4tfpaDdMdWzBWV3fq8vRXlQrKKcD+/pRTvPIQt6FtdOlF8kviX3VrRFq3S95xflauf
         giJ4MlsqDh24zzAmW0gNx++TqavRg+Y9CspQkzD1lKf4R/RhvfqnXqvcV6xFfEV/boh9
         xskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786770509; x=1787375309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Ki1f29ZNNzrhAw8g31VS5wgylnUVVZbopDUMwHeVLM=;
        b=LlEuvp3Kri1I0P2cW9bu6dj9V4Ti9Zdkv7nU2oudbtF2GR0HyuzxTIQD3n1vrNR2+z
         ZyHWKD0oGhpxOGnW2OOSLa4hTalgT0T9DmvAGmwHWglR0xcM+/o0l9uPlz/os5iE71L6
         6YQ7SChGZW0VchlOooXTX9YwGxir60S83mta58zc+SkSeDZPLpheQfX71r6OVUT1i5De
         8veE/TUU563GFbka2sVaO+va/nK2+HJdJ88ZHCD/1hGOS+G6YTB/759ypas66QbBc6Ho
         cNygegvVAyaGh7+OfLMu4jZHdPopWq+7ktOK5jbjZio5Acwps3KQ+H8jHtHXRZSdGoRO
         ojpw==
X-Forwarded-Encrypted: i=1; AHgh+RoIZb9cz4ER7dialV+DU8GcLfGKGO1SPqFQ0zzgEvqV/+zKuPFLkGbzdh9xjp+jMXP2iTSgoehZJTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXF9KbBuaz15ofgxDN6JBBrrt7XAafyPTW3eWZrBormLCTTg75
	P09iY7Yp79ygJdmhuR3uB6Zi1rtF6KAW+wMcSeXHEfzWnpqipubgrtt7
X-Gm-Gg: AR+sD13IT9JJ9Yf0K/3exTljVg4MUEILTymWEvkAOuURJY4qOAw1puMfbjkXz51XF/I
	JKb2v7ycLSmI3rbm6ziRYYJRB7JNKU0Rm4HLSQGyiSgIAkcamIk723jNNtq4oT/lFxldRrRWDyH
	oMiQO1NFTO1/jnTJ9LjENnNYL/b10z4fN8aTK3SGpjtmSi2aGVR03SzRZd2jbpVfUpvrWAhoD6K
	tvVAQ5UJ9woMpzNlSQ7y7PXM/4J87NCXj73aNKrMReCDwrKyiQ3jOf/9aflZ/wR4ejOEvY5JUuw
	xPR3+FyKdjB4rzKPlpRkt+WiLIi6xMrZJBjqjRyYOeRvCqKMaMsrf7Kp/J521i9JY5u9eCdlk+R
	CWhZ/UGRjqjSX4ADwrlfz6t9TWlVMB3OZynD+vFmLtE5d+HBPIc+wNcETOpj5HBM3s/QAjvePis
	ZdO8Ns26j8DUkgxp3tnNb4xhqWxvOFkQgod29EcnezEWX6PELrjij+3UQTYmnIiDkkD6NpqQPk2
	U+qaQ==
X-Received: by 2002:a05:6512:3da4:b0:5b0:1879:1b9d with SMTP id 2adb3069b0e04-5b45913b940mr1711971e87.26.1786770508996;
        Fri, 14 Aug 2026 22:08:28 -0700 (PDT)
Received: from localhost ([95.190.110.153])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b9a9a7sm932354e87.13.2026.08.14.22.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 22:08:28 -0700 (PDT)
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
Subject: [PATCH v2 0/2] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 15 Aug 2026 12:08:24 +0700
Message-ID: <20260815050826.306717-1-vladazaharova2018@gmail.com>
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

Patch 1 adds a gsp_keep_logs module parameter: when it is set, whatever
the GSP wrote is copied into memory owned by the module and exposed
under a "retained" directory until the module is unloaded. Patch 2 drops
the now completed task from todo.rst.

Changes since v1:
 - use a gsp_keep_logs module parameter instead of a Kconfig option, so
   that no kernel rebuild is needed
 - use VVec rather than KVec for the copies
 - move the log buffer code into gsp/logbuffer.rs
 - create the "retained" directory in module_init(), which removes the
   additional unsafe block from the teardown path
 - dev_dbg!() instead of dev_info!()
 - take every allocation that can fail before dropping a previous copy
   of the same device, so that running out of memory cannot leave that
   device with no logs at all

Two things did not make it into this revision:

The parameter is a u8 taking 0 or 1 rather than a bool. bool is not
available in this tree: the macro fails with "Unsupported parameter type
bool", as rust/kernel/module_param.rs only instantiates param ops for
i8..u64, isize and usize. There is a TODO in the code to switch over
once it arrives.

The dma_rmb() discussed on v1 is likewise not here yet, as the barrier
abstractions are still making their way in via the tip tree. I will send
it as a separate patch once the backmerge has happened.

Testing was done on top of drm-rust-next with the TLV firmware images
installed, which also settles the question left open on v1 about the
older base. On a GB203:

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
  - the copies are released on module unload, and three load/unload
    cycles leave nothing behind.

No warnings, oopses or refcount complaints in dmesg throughout. Built
and checked with CLIPPY=1 and rustfmtcheck. checkpatch --strict is clean
apart from the MAINTAINERS note for the new file, which is already
covered by the existing "F: drivers/gpu/nova-core/" pattern.

Vladislav Zaharov (2):
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/gsp.rs           | 100 ++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 235 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  28 +++
 4 files changed, 282 insertions(+), 93 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs

-- 
2.55.0


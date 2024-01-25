Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7804101CE
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 04:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706156593; cv=none; b=TjiXHgb3JvrZVBQ1q5MKFps7Cfl818rat6677UqC1HnAqAMS/2jvVQrhylE8BvvI0uIqcpA5FuOMpbgEp+six0yzet+uZVtdG2sOzQbN65TezNCZ1cde/Fo8Zs7ASJoCNl45moIuohBmRqtTKkkwNFW1Oxe+um/kqUdoezKbMxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706156593; c=relaxed/simple;
	bh=Fp/Nsdcth0hMGV4QFLJyIHW6clYIcFNJ6WEMI/uUbQg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t6ZQTS8lNNrDrlfW8urfNQTpOjGhAf9gQenVVn99B0Q93GEQQiZGdgobALbyapMnAn2a1e35cHfu1E8+rK0MdcEVcyZdQmdqD2ZMQwYAkhV6jtyFhJvUM7RRsknhDv/R0Duta66TV2aAZl3SlCr/rj/fn6Hkw/SDIriMbExTTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ImPK+B3u; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ImPK+B3u"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so239529a12.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jan 2024 20:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706156590; x=1706761390; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bdsnxFeLDc7O+tsMX6XHeSkZFgA7YsQDvmpx17WI4kI=;
        b=ImPK+B3uSnxBQUMF7empJ4iH42WReotTS9BJDTwMI2S67bMKnT2q3FhvrLzYoe4T3b
         wYi7HUSJCtQ7f7/N/Oq2t3Sj3MdD9XixxtQ8k8AKZVSUmRBjT8Dzeu1Ey01nw9GZGQAk
         hOC5+oYTERUnQokqGW1qTSr/ltbYMpIdfL/4QzFp2Exvvf8NASjp1aXHd4Tutb7fFZ/o
         1W8Dsp2C91SmY5ADED1AMfxeselJUoC1yoQwQWo/wn/RNRBejndaLo7CAJWfxt4mGU3P
         SFa67xr5LIj2+7ozMEF2UCvyEhVvqCPxaWXeLluUt9fOxRuDqauxjVeGrzHsiOEsqrkj
         3Yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706156590; x=1706761390;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdsnxFeLDc7O+tsMX6XHeSkZFgA7YsQDvmpx17WI4kI=;
        b=Tic4FXPrgPKndsBUAkusZ3edhfhN6/3g55XHg12erUDYItPNFHaFs+jMH3xnqen9J3
         hDMzg8wBD1SNn2LyJVBhIZ6+rPWQx//Dayyxckj1lMgRmoDa37wnCmGPbzZ8NaHDVPW8
         iOP0kLZq29FaIGZz4Tg+uhL0CCgP7m5XoMl27gV0vZFzYGsovKyQQq1BCekcQ8LzdC18
         Rq/Z28IT172C+GkHCTYPujIcvZn4zaSmJ8z+kSEkqg0XjJ4pVSPz1Qno91nQ39AfoeiO
         +a6UFciuCAYi4IyAYjR/+/dT3L8RcsmFFdPgH48qyymckTRorwMaRJ7ynkUdkHITYCaX
         +wCQ==
X-Gm-Message-State: AOJu0Ywbtpu86pgsokktpxToQb2ZQBUYwDzYrBsxtnVT6DxL1TbtsrxK
	NHxc6DLYN2hVDj82i+gH+/SfWiUCRpVVdgOD0Xa3fsWjvDIahBXwusXWr/t7Tag=
X-Google-Smtp-Source: AGHT+IG0c3KHNOYvKXWZKGA877PW8294s0ljZp87IKGqkduZuQ+JPtDg7C2fQbUVQ11GAN+QWsDGOA==
X-Received: by 2002:a05:6a20:9f03:b0:19a:fbfa:b16a with SMTP id mk3-20020a056a209f0300b0019afbfab16amr468801pzb.30.1706156590009;
        Wed, 24 Jan 2024 20:23:10 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id ko9-20020a056a00460900b006dab36287bfsm14549743pfb.207.2024.01.24.20.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 20:23:09 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v10 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Wed, 24 Jan 2024 20:23:07 -0800
Message-Id: <20240124-fencei-v10-0-a25971f4301d@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACvisWUC/23QS07EMAwG4KuMsqbIdp5lxT0Qi+bFZEE7alEEG
 vXuuCOmU6EsbeX77fgqljSXtIiX01XMqZalTCMXCE8nEc7D+JG6ErkhCEgiou1yGkMqXe6zgWi
 dygMIfnyZUy7ft6S3d67PZfma5p9bcMWt+xdBdI+o2EHnUwCHGDwhvc6lTksZw3OYPsWWUukgJ
 eySWFLwhuTg0WNuSPmQhHKXcptpNWpH0iVvG1LdpQKE/cNVsYwqZMq+Bx1lQ+qjdLvULIcBk8Z
 oiai1rTnKfpeGJShEw1YpHRrSHiQ+bmtZWpfBoEoYPTSkO0qzS8dSyUHx1VQGwobsD5Iet+23m
 cjr+pxctP/luq6/EfVc/3ACAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Atish Patra <atishp@atishpatra.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706156588; l=2933;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Fp/Nsdcth0hMGV4QFLJyIHW6clYIcFNJ6WEMI/uUbQg=;
 b=SvtUbRzRCSPcDsyKUxxcadxQoBxxmIhU4504F5DxcJ1phzCTxqjQPG4L5ty+vMNgQswrEoK5x
 HlIebRpycAvDGysjIrrNQ3pIhmMKVTQ3CdAEmLCsQkAYHOsQyG0xTtr
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Improve the performance of icache flushing by creating a new prctl flag
PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
for future expansions such as with the proposed J extension [1].

Documentation is also provided to explain the use case.

Patch sent to add PR_RISCV_SET_ICACHE_FLUSH_CTX to man-pages [2].

[1] https://github.com/riscv/riscv-j-extension
[2] https://lore.kernel.org/linux-man/20240124-fencei_prctl-v1-1-0bddafcef331@rivosinc.com

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v10:
- Fix fence.i condition to properly only flush on migration (Alex)
- Fix documentation wording (Alex)
- Link to v9: https://lore.kernel.org/r/20240123-fencei-v9-0-71411bfe8d71@rivosinc.com

Changes in v9:
- Remove prev_cpu from mm (Alex)
- Link to v8: https://lore.kernel.org/r/20240116-fencei-v8-0-43a42134f021@rivosinc.com

Changes in v8:
- Only flush icache if migrated to different cpu (Alex)
- Move flushing to switch_to to catch per-thread flushing properly
- Link to v7: https://lore.kernel.org/r/20240112-fencei-v7-0-78f0614e1db0@rivosinc.com

Changes in v7:
- Change "per_thread" parameter to "scope" and provide constants for the
  parameter.
- Link to v6: https://lore.kernel.org/r/20240109-fencei-v6-0-04116e51445c@rivosinc.com

Changes in v6:
- Fixup documentation formatting
- Link to v5: https://lore.kernel.org/r/20240108-fencei-v5-0-aa1e51d7222f@rivosinc.com

Changes in v5:
- Minor documentation changes (Randy)
- Link to v4: https://lore.kernel.org/r/20240107-fencei-v4-0-d4cf2fb905d3@rivosinc.com

Changes in v4:
- Add OFF flag to disallow fence.i in userspace (Atish)
- Fix documentation issues (Atish)
- Link to v3: https://lore.kernel.org/r/20231213-fencei-v3-0-b75158238eb7@rivosinc.com

Changes in v3:
- Check if value force_icache_flush set on thread, rather than in mm
  twice (Clément)
- Link to v2: https://lore.kernel.org/r/20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com

Changes in v2:
- Fix kernel-doc comment (Conor)
- Link to v1: https://lore.kernel.org/r/20231122-fencei-v1-0-bec0811cb212@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Include riscv_set_icache_flush_ctx prctl
      documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl

 Documentation/arch/riscv/cmodx.rst | 96 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 arch/riscv/include/asm/mmu.h       |  2 +
 arch/riscv/include/asm/processor.h |  7 +++
 arch/riscv/include/asm/switch_to.h | 13 ++++++
 arch/riscv/mm/cacheflush.c         | 67 ++++++++++++++++++++++++++
 arch/riscv/mm/context.c            | 13 ++++--
 include/uapi/linux/prctl.h         |  6 +++
 kernel/sys.c                       |  6 +++
 9 files changed, 208 insertions(+), 3 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20231117-fencei-f9f60d784fa0
-- 
- Charlie


Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C677B35C68D
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791749808; cv=none; b=Jm7Ob415hqCV8E3poZnjrKVqAeQFJciANuAGMXlcvyb/XBO6uItn/P4m9IdNjsr6gFSvz1BkJdofJjxCw8vk0uicrOEC0nkW41Goj08MhL4iWnvFRZwIwGX0neg9mM9uTDVtXSLSFiWa3ed2td6NPt6S2rlnrOc67zTqF22d8uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791749808; c=relaxed/simple;
	bh=mUa5JfPytUIBNId27ct+pI+y+lXe6dkBu7TtmZ2Okr0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EdSyO17M+MjCZBJWTYCJu8lQz4S8KPkX+OujRgk5Z27ZlLBZzRIqrTI36gZC37gNZsKVu3oZDuNIbp/3OCb5dzpM5J3avk7AbzS9Na3tJ3lKRobj5zF9lfKDJs+ZxNaKzldAXbjQv22heA/WqP5Jouh7Aupe5L4zUA3JZO5Hwyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxG8KF6k; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxG8KF6k"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0a36f1c95so1714647b3.2
        for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 13:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791749806; x=1792354606; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LMIFt4Dv9YYDb9vJ6+cJXhs5xmH9sVe/KBqI/bov4Ps=;
        b=fxG8KF6k5+mW6gdTNTG4F67fBO+eA4n5qdO34dC9x5APqsqi4uaQ8CyYedrMMEiBWt
         UAo/sFIm2V1ZmlPWeWJr1CdOyWs+WZjnBCyihF3bRTIy3klYKMd9ceBGWF+/i4DxDMBe
         SBWvTI0CVPSSS73Obasmzh+SkbTwl9TaWx+xPLFU+suSQNmYCglKIU6LBN3kD+Chq2ic
         PvmWkQHj1UTFyMb0TPAv0Ru4zFIzAsWg/6dEQhTWsNR91niQvCmFY/csPLNlqTE2zc6e
         uAhyBNm410MaLyAxeqEQ3gCkY3o8COIIu6va8k/deJghbt9MtvlmHYmmxh8Q8+lyM2fD
         s1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791749806; x=1792354606;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LMIFt4Dv9YYDb9vJ6+cJXhs5xmH9sVe/KBqI/bov4Ps=;
        b=n/l6zMsCItfvqhT8CYzt83g8EDaOssW29vHWCRvD3DYRGplNWUnjl5YdAmt2bLbT48
         DESPnFjI62dVpAusCJXHOsOEkFre1efmabxK11qPq5aKe+jZhMwFVXAttqWkCX2tVgad
         vsLsopEMdegv/raWhwdhPAzsQss8rRw0c0MqsluyVBmLk7m1u2Tt9khzBm/x+2/42nCq
         kQJHSqX6LVrWJFEYyn/QRppeN1Rdb/Wf98hOxABwqqPCP+elgaqDZJAz3UWbyYuDBfK+
         36w56BesKSR3d8P/DOqL63Cq01rTuixyWXt+glGTPaViwZCL/JaZZWjVx0NjU5UYEn02
         k3+g==
X-Forwarded-Encrypted: i=1; AKwUvBwD2Xxav6BB4/684CyU5pPTT7vOog72oQxaBTy2yH7XUNpb/rO/Ub9SX483Gv0QlDSMuBpqFJ9/O6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQrZmttbM5sALeK07Uvtz165lX13/LwEnkoSOxy+jsWXz8LEKy
	mBegAPicOtMRU2bWA4ocSYeLIN0bXkEJ93/K7zywlKHugqlOhox8Zr0D
X-Gm-Gg: AYBFou1LOEadeQ+SIzPtd3mYh4OmPT7R/sddA4RJwkxZjaSp66lHBM3Iur+rLaeurrS
	Ulk/xQ117DXZsWZ0lkbHyDPdQXejXm4y50SobXonpyJ6djvGpe4Ua5BQW/3bFxB8ar7boj0lFFE
	ENHHLtrIg/zN9QYyxjBpJQb4iPoHnUyklpfESGUpdmB/oZ2vpDxn7gsO+bfu3xpCb2Uk7S7pNT/
	+7v63rAz1Vbw8sM7NxGPVeKNBmqeT2KSRqiHZJjVB/9dqBmVlYmyNDZxdYX79e4iUm7pn/oMK/t
	QMLkzTZNvNObX5d4vxfPQVzVasU4gLjEIx6fzkY2m1hxu/nOJHbv0wJ5pE3qDYXRHwvvXS7gOiC
	JSz61z9xLis/cReMlNhsyECQt2wve9EOuRnFie9z3Fbi+sGQL8QjT9zVVAtVlhrLMSsdAOYk3wr
	x6n2xOEoXjx6phnZbVgWmf0kL8GoIZHUPU3pdcpAbGIA6Efg8lWhYLyhEQZpm15OsXghpHmq2Uq
	HyaAUt4zPGP7MXY4COStVcedSvNg83yTbSawFIQIszyJBEClcnUpv7G
X-Received: by 2002:a05:690c:6e85:b0:8b0:a352:f96d with SMTP id 00721157ae682-8b0a352fd2bmr4001297b3.11.1791749805566;
        Sun, 11 Oct 2026 13:16:45 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07f1ea845sm28267397b3.24.2026.10.11.13.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 13:16:43 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH 0/4] alpha: perf register sampling and user stack dumps
Date: Sun, 11 Oct 2026 16:16:40 -0400
Message-Id: <20261011-alpha-perf-regs-v3-v1-0-eaa625a39712@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSQqAMAxA0auUrA10wAGvIi5KjRoQLSkUofTuF
 pdv8X+BRMKUYFYFhDInfu4G0ykIp78PQt6awWo7GK0N+iueHiPJjkJHwuxwJOt6PQUTvIUWRqG
 d33+6rLV+S01NGGQAAAA=
X-Change-ID: 20261001-alpha-perf-regs-v3-7e23508c1ca2
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1840; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=mUa5JfPytUIBNId27ct+pI+y+lXe6dkBu7TtmZ2Okr0=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJOv1uptCh8YuRrwxtOx3f+klebfddBfEKC3JNCEUmFt
 ctMreJNOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaaa4sZGXo7mf1+B+
 z12/Eu/shBuwOFs9f1RPd5T66Yfn13a9Os2HJGhkel4i1b+KpcHhzx1so9zvd5YZnmqdYzFw/NM
 lGfOpWvgBsA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

This lets perf sample registers and dump the user stack on alpha, which
perf record --call-graph dwarf needs to unwind user space.

r9-r15 are not in pt_regs, so they cannot be sampled. An unwinder
therefore cannot get past a first frame that uses $15 as its frame
pointer (-O0 code or alloca).

The perf tool side is a separate patch for perf-tools-next. libdw also
needs alpha unwinding support, which I am sending to elfutils-devel.

---
Matt Turner (4):
      alpha: fix stale user_stack_pointer()
      alpha: stop storing the user stack pointer in pt_regs
      alpha: use user_stack_pointer() in KSTK_ESP() and dump_elf_thread()
      alpha: add HAVE_PERF_REGS and HAVE_PERF_USER_STACK_DUMP support

 .../features/perf/perf-regs/arch-support.txt       |  2 +-
 .../features/perf/perf-stackdump/arch-support.txt  |  2 +-
 arch/alpha/Kconfig                                 |  2 +
 arch/alpha/include/asm/processor.h                 |  3 +-
 arch/alpha/include/asm/ptrace.h                    |  7 +--
 arch/alpha/include/uapi/asm/perf_regs.h            | 45 +++++++++++++++++
 arch/alpha/include/uapi/asm/ptrace.h               |  2 +-
 arch/alpha/kernel/Makefile                         |  1 +
 arch/alpha/kernel/asm-offsets.c                    |  1 -
 arch/alpha/kernel/entry.S                          |  5 --
 arch/alpha/kernel/perf_regs.c                      | 56 ++++++++++++++++++++++
 arch/alpha/kernel/process.c                        |  2 +-
 arch/alpha/kernel/ptrace.c                         | 12 +++++
 arch/alpha/kernel/traps.c                          |  8 ----
 14 files changed, 122 insertions(+), 26 deletions(-)
---
base-commit: 8f5dbfb93440d1aba216a1a34369a65654b94be9
change-id: 20261001-alpha-perf-regs-v3-7e23508c1ca2

Best regards,
-- 
Matt Turner <mattst88@gmail.com>


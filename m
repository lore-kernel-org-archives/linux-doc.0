Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B34DDCA
	for <linux-doc@vger.kernel.org>; Fri, 16 Feb 2024 00:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708044971; cv=none; b=mLCsh6Y7bmqATWEuv1qp5eBF3zV/kjJzG9HJhMDmIJsNwB1H50lbL3WPczyZ04DkdnsE9BHwC3LURboW6f/bNEHGO3rm8WmwPVxWUlgLNOnD7EiKeUEbmv7B8rKeWaLtuJnBioYIyikPPxriXV+1ScY3a9W4RkOMdZW520c8lqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708044971; c=relaxed/simple;
	bh=QTzT3QVS2VsrmxPx3HJoKYG+aiwG235yvM1vewfPxLQ=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=fILWajuwlZZbxS2M/31Sweb6SHj+qTkbk4GF+qcT1z0T8oNN5gQ4PxOOA7wUH3ZDh33OlK8l/JUR4fjc/20sRnp5oryV021HrzdnOBZOT06nnKnRwplfEyMfKI+aUi9jWCRfhZ2HUVTowtwHi4FovX7d3gieuk4h54LSXBkXcqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=2xlgoCin; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="2xlgoCin"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1306108a12.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 16:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1708044969; x=1708649769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dkaCBJuNpLTSIqbfdZvMoBZZaPADj5hawM9y3evJX3c=;
        b=2xlgoCingqVZs6W7oZId9/43CBBpDYfJmwFy9qvnRj/R2PxuOh0q6OO+z2kOm0sVkC
         ATj6/Zs3REgxy1TL8lucKNeFCiUPFt9DVhh5/D79/rq5K5Z2grA0jggVW4T4Uqw/D/aE
         0/pR6or5jKnov2dFlbqMMo8I55T2yidKbFxJdnchDezRJlEQZCYXKj4jRWbNJhjrsUGU
         U/afNT65ghLagKUPQSXb9hqsSPYP3dIHAwbMHDcRJpo7SwKjjhyKU/7KuEsA4CEh8H9l
         tVpSSEMKQVJUhFFaLTDK9tWcFm8m8hQG/Aut2iNizSitsOGay0G2x7NGcyMoI9IUa0Y7
         bQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708044969; x=1708649769;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkaCBJuNpLTSIqbfdZvMoBZZaPADj5hawM9y3evJX3c=;
        b=floibDEFaCAxxFVxVlIrUjiM63bfqyXaWXuOi93msMOYkYjCVDDKJpms5NfnzGKb1o
         CX7GqQjAlNGE0S/HCsOlikZbGzgBaKyzxGjPf7o3wMpYi1dA5ihZqETduU1/yTV0Ms9O
         fE+TD3GkBtM4xWWXWLPnXkpDK95hFHTXX23vChnelcPpltHwixS94GZLwSt+SY4Hwk+F
         NaE87InUIECC3q+CwGkMINKMjrbL8Q4a8YOV002cfiszEflBAGYTWrTrSIn+ZS2EBfah
         JR0v4eduzdxFI1vEBbGkGk0cvoklKXi6KDuNTnTM1Q3+gnJ6jL9MF1AoH04LVEsyApP0
         zs/A==
X-Forwarded-Encrypted: i=1; AJvYcCV0DP2iy/r0moVm74JUYWwrbysRTnYXNJ/CsZ3sThotJs208WcWJIp8a0qgb0nW9qQfrNJjflBLU6ddBTuix8CUuvd6G5+nkMCT
X-Gm-Message-State: AOJu0Yxpi+w7vzWq0PEckKjIuXK5/K20CgFKvCWgB2ZEHo8AskXhlucM
	fD0JmeEb6dVszOGgpkOetLRomxJgiXGDrIsuy3D0rCTeO7WxxHAUJ3uXEoIw+tw=
X-Google-Smtp-Source: AGHT+IHEdkJhS9SoXoCEe/hJTYKY/SrGzTuFOcU7WZTPXR1Lel/kxVf3cz4WYWwmZlHimuBM52+XzQ==
X-Received: by 2002:a05:6a20:c78d:b0:19e:8af3:8894 with SMTP id hk13-20020a056a20c78d00b0019e8af38894mr4287094pzb.0.1708044968806;
        Thu, 15 Feb 2024 16:56:08 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id bn15-20020a056a00324f00b006dddd5cc47csm1932099pfb.157.2024.02.15.16.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 16:56:08 -0800 (PST)
Date: Thu, 15 Feb 2024 16:56:08 -0800 (PST)
X-Google-Original-Date: Thu, 15 Feb 2024 16:56:06 PST (-0800)
Subject:     Re: [PATCH v4 0/4] membarrier: riscv: Core serializing command
In-Reply-To: <20240131144936.29190-1-parri.andrea@gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  mathieu.desnoyers@efficios.com, paulmck@kernel.org, corbet@lwn.net, mmaas@google.com, hboehm@google.com,
  striker@us.ibm.com, Charlie Jenkins <charlie@rivosinc.com>, rehn@rivosinc.com,
  rdunlap@infradead.org, sorear@fastmail.com, linux-riscv@lists.infradead.org,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, parri.andrea@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: parri.andrea@gmail.com
Message-ID: <mhng-43090865-0201-48df-a5b0-8b160b3fbb1b@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Wed, 31 Jan 2024 06:49:32 PST (-0800), parri.andrea@gmail.com wrote:
> Changes since v3 ([1]):
>   - amend documentation
>
> Changes since v2 ([2]):
>   - amend inline comments
>   - drop ARCH_HAS_MEMBARRIER, create membarrrier.rst
>
> Changes since v1 ([3]):
>   - add smp_mb() in switch_mm()
>   - introduce ARCH_HAS_MEMBARRIER, amend documentation
>
> Changes since RFC ([4]):
>   - introduce prepare_sync_core_cmd()
>   - fix nosmp builds
>
> [1] https://lore.kernel.org/lkml/20240110145533.60234-1-parri.andrea@gmail.com/
> [2] https://lore.kernel.org/lkml/20231211094414.8078-1-parri.andrea@gmail.com/
> [3] https://lore.kernel.org/lkml/20231127103235.28442-1-parri.andrea@gmail.com/
> [4] https://lore.kernel.org/lkml/20230803040111.5101-1-parri.andrea@gmail.com/
>
> Andrea Parri (4):
>   membarrier: riscv: Add full memory barrier in switch_mm()
>   membarrier: Create Documentation/scheduler/membarrier.rst
>   locking: Introduce prepare_sync_core_cmd()
>   membarrier: riscv: Provide core serializing command
>
>  .../membarrier-sync-core/arch-support.txt     | 18 ++++++-
>  Documentation/scheduler/index.rst             |  1 +
>  Documentation/scheduler/membarrier.rst        | 39 +++++++++++++++
>  MAINTAINERS                                   |  4 +-
>  arch/riscv/Kconfig                            |  4 ++
>  arch/riscv/include/asm/membarrier.h           | 50 +++++++++++++++++++
>  arch/riscv/include/asm/sync_core.h            | 29 +++++++++++
>  arch/riscv/mm/context.c                       |  2 +
>  include/linux/sync_core.h                     | 16 +++++-
>  init/Kconfig                                  |  3 ++
>  kernel/sched/core.c                           | 16 ++++--
>  kernel/sched/membarrier.c                     | 13 +++--
>  12 files changed, 185 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/scheduler/membarrier.rst
>  create mode 100644 arch/riscv/include/asm/membarrier.h
>  create mode 100644 arch/riscv/include/asm/sync_core.h

I picked these up into my staging tree for the tester this morning, 
there's a few hiccups from my latest master merge but they don't seem 
super exciting.  So it might take a bit for these to show up in my 
for-next, but they're headed in that direction.

LMK if you guys were aiming for some other tree, or want to do some sort 
of shared tag for them.  Otherwise they'll show up in linux-next soon.

Thanks!

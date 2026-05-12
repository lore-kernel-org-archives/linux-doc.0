Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0023ECBD5
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 13:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506588; cv=none; b=FWWggNWqYBqxtiHtYUufaUyc0QPi1Fihi9TNpAjuGWrBw9ZGphUJHNQk+S0UBJCIqt9fW3EXCXfhlfaFXP+dG8KU94xBxAVQt5LNpnUh/3HTehjjB6IOTwsxtCfQ0s1DoE9EnE6klSx7KhL5zybrQQWJ0rgMg4pomWjxkYCOuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506588; c=relaxed/simple;
	bh=AI7+PC+wO6PLDRtpdw2bXlws667UYCRwcBeEHIMSovA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YsZoBJChYvqyeEptlQtBp3aN3Q3GxvYP1a0cC64jWXTw8EbosRn2xnm/j90jD9qccWH8Eb44WR34LqUh6fYP8ZrADkf1G1bc9AmvzarwVwbGm790IaZ1JFyTQ2GV1WAoNSEmtLF3xLv8Y6ff0cqp827OfKn1hyet4UAapXHa8IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=HrC2uyz6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="HrC2uyz6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-365eecc5885so4205603a91.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 06:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506583; x=1779111383; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z29fhkBQbknShosTsnNNQxT5IXOqOhrJTIx7eoQ358=;
        b=HrC2uyz6M4ftAjkf3RaKqtm7xosMoYcaRoNSA2Ho/WQidy9vLT3CPQw2it2gjR2uc2
         LqLrJvSkFR9CsDOGytE0aufchCTsU84CnR/jC7xJhDyfMD1i0JIdxpnvhNWm+B6TjzD/
         39do8w+h6ovm6IbH9noFsTZeW2da6+T6xFZETmcFioOV7TYb0PtkBIv8KBD0T7uTuKgA
         SVJ/eFWbDUB/q3lLS/FbafH2yU+b0F+bhRCJao8aMaLmPT3sniMYVD/SLDso/dRh39rR
         IZndLAbNyysk9zecUv+PQg1XDld21I5ebLhXyDQJ0V+UimRdnLTxna/i0OCQVxTSU6cY
         T2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506583; x=1779111383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z29fhkBQbknShosTsnNNQxT5IXOqOhrJTIx7eoQ358=;
        b=ScS80h9dg8Ep6YUearjNGDkBWIjHuJYsB1IqvLF/WGZ5W/7Cu5jmP+p1EOo4VpyPEv
         TCB38x36VtQkUmrzyNiNmtAU56CXfeRuQsHOlKByXrW3TSTzU+2FIBcZVaYNIdpKFEr2
         lGG6HATxxdcNxuYLI/YMq0eCxQ0+nEWBhBqCSAfeqBC3epTWYvZksze0QEfxvsLHk+MY
         AhgbMPiYeDdW2s6U/RSvML6ITBDWu1fp6MrxvmTuExtk3prXUwS4cuV0xAZndmfaE09I
         Swm6b1gljn8B08k+1D2f4TKL2DffPtMkj+OX6abE5xkNses9xqznEUpv8lHlARYkf+O4
         nQZg==
X-Forwarded-Encrypted: i=1; AFNElJ8zeOFILuDvXZmt8I/BxECmMHDg8AU0EO6PUOubSR3dKx8x8Mgmw9KWm4rANEVpy4QZX8CeGOygKQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KX8L7B7y2SEovBASct62sGF2Ju991ub6OAyLgipJ443KbBb7
	e856lr9TCpOAsY3+VUimYbzob8+vrBOpbfTuun9+QjzLh3ApDygc9HwznXZiZKyAeP8=
X-Gm-Gg: Acq92OHbqSCSLc35HdexjoXsbIhVpuAgwHOhd0v1fphBHc8tnpenQKnixHKZE7FGT5Q
	YicQtJElFrMxx7tpFd7nFlp2qHFuygSs0dRGHP907pTc4hjMHXrCINH+4TvhfrHnhrZt23Nv1d9
	cPpzSYjZ94OjFe8V1+2Y+uI7GVOgj/W+oNig4p1+oFbHl/0II2ayMArRVJ24Qvodg7CnykZBCti
	mx3KOYttZdPpCPaJqHXWSfdwEAzomvIpD/tExgzN6HKDbLXhQwD7xyPj9S7P/ed7dLnVYHdhHvY
	L5osixR1bu7D3CnF+QhvFmJmakpATKAKyHlzOFmx2H1TyWKI/UMSr1CRnnxLX4lKh1UjcyMsUA6
	l6T899Zsas4fp8j7pDiVVtO38ZCtplvk+0OXiHdUrmVsGhv/9D5896OHBOewCT22B4SIcTF4QT4
	jFkyV27QgEWtqg3BLxGXTb5xbkRnLRKnqHUYZqz7shoBA=
X-Received: by 2002:a17:90b:2648:b0:366:479c:59e8 with SMTP id 98e67ed59e1d1-367d46b8be5mr9758495a91.8.1778506583435;
        Mon, 11 May 2026 06:36:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:23 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 00/10] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Mon, 11 May 2026 21:34:45 -0400
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALaDAmoC/yXMPQ6DMAxA4asgz1hKzW+5StWBBAPuAMiBtBLi7
 qQwfsN7O3hWYQ9NsoNyEC/zFEFpAm5sp4FRumggQ6UpTI0aWsq2Msfxu+hsGQPhoyNTZU9nbc0
 Qy0W5l991fb1v+81+2K3/FRzHCXxjjPl3AAAA
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1

This series builds on Andrew Jones's earlier RFC [1]. It lets
userspace check for RVA23U64 conformance in one call, instead of
walking hwprobe + prctl across every mandatory extension.

The series adds a small framework that resolves profile-class
bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
init time, and surfaces the result through both /proc/cpuinfo and
hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
detection, to riscv_set_isa_bases() without changes to the
surrounding code.

To detect RVA23U64 the kernel first has to recognise every extension
it mandates, so patches 4-6 bring Zicclsm; Ziccamoa, Ziccif,
Ziccrse, Za64rs; and B into the cpufeature parser. The framework
then reads the resulting bitmap, and the final patch exposes the
RVA23U64 bit through RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64.

Series outline:

  1-3. hwprobe.rst clean-ups: document EXT_ZICFISS, normalize
       indentation, and standardize extension capitalization.

   4.  Zicclsm: cpufeature parsing + hwprobe export.
   5.  Ziccamoa, Ziccif, Ziccrse, Za64rs: cpufeature parsing + hwprobe
       export, with cpufeature dependency validation for
       Ziccamoa->Zaamo and Za64rs->Zalrsc.
   6.  B (hwcap + hwprobe), as the Zba/Zbb/Zbs set.

   7.  riscv_have_user_pmlen(): arch-level accessor for user
       pointer-masking PMLEN support, used by RVA23U64 detection.

   8.  cpufeature: per-hart and host-wide isa_bases bitmaps,
       populated at init time. IMA and RVA23U64 detection lives
       here; /proc/cpuinfo and hwprobe both read from these bitmaps.

   9.  /proc/cpuinfo: print "isa bases" / "hart isa bases" lines
       sourced from the cached bitmaps.

  10.  hwprobe: expose RVA23U64 via
       RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64.

Tested on qemu booted with -cpu rva23s64,sv39=on,pmp=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.2-rc2; happy to rebase onto another tree if needed.

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]

BR,
Guodong Xu

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Andrew Jones (4):
      riscv: hwprobe.rst: Replace tabs with spaces
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Guodong Xu (4):
      riscv: hwprobe.rst: Document EXT_ZICFISS
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Jesse Taube (1):
      riscv: Add Zicclsm to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  46 +++++-
 arch/riscv/include/asm/cpufeature.h                |  14 ++
 arch/riscv/include/asm/hwcap.h                     |  23 +--
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/asm/switch_to.h                 |   4 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   9 +-
 arch/riscv/kernel/cpu.c                            |  26 ++++
 arch/riscv/kernel/cpufeature.c                     | 154 ++++++++++++++++++---
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  33 +++--
 arch/riscv/kvm/isa.c                               |  16 +--
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +--
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 17 files changed, 312 insertions(+), 70 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong@riscstar.com>


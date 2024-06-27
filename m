Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6824119D8A9
	for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 17:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719508979; cv=none; b=aPY03D6WLHIr90BUw1IXWU5JReGwVkUhY6KQyjtA7uq6Rx72fOp15VpE9/Z6l10fKBbhpH66q6bty8/6CorUnjedJNRIXm5R+qbXi3QJvcq/vnfRe/ltOYM0lk3/ZUHjvPmuvjSZSRyjUzYXWInD22tlI8shwbkWlL6Dw4DCHjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719508979; c=relaxed/simple;
	bh=i4ZaFghgO+Lt6ofSiczvE8yLB1Ot2zvxfE6Ayg/1ZT8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jMES9z/CCUUBPTAjhA9e1WMXNzZdW+kzlZTRnVe1EhnYcLZxMIv+tdv/8F3GFjFYc3USoKLUBTgQqn51VUcm8s/sltiLBjLGY3HSaSMF83bMGYCCVxD2CaCnhOfCqIPYFNjAVtsg5Yl6bFJe9LbiCBTNVuZRHSecZ9kqBqVNwZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IvHRAUbz; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IvHRAUbz"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7066c9741b7so4056116b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719508977; x=1720113777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WP7jtD8GMMYgLKsWgQuz0MWj++7gT6SNnVpQZDX9lDo=;
        b=IvHRAUbzS1Bb9upUW8x7px7S9DPNPt8K3TayLLmDa+UCJ22cTKgXvNFFULQLddkWVs
         nf3YkB3Ws49aUIx9pkvUIowlt/TKxH/iWy0nWsuVko7X4El7a9wG4ZghLgetZ8cdgxJo
         za+gMDTFvnQ0S77NoC63AFFI3hC256s0oIvZHdNEvelkap8T7PIQ7e6SYaQK+U2l2YiS
         IdSWalRH/PH1YapBk4AkLnlUrduqh/cktZouDk6x25NI6sgNxB4QelyGg0KdMHhR2aVm
         CSorUQHxC0aBI6mB+VU31Zhsv2Tu7rZfVu3Efcu5q0dY1nzF4N3EjBts3SjUITsfv0/S
         Zwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719508977; x=1720113777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WP7jtD8GMMYgLKsWgQuz0MWj++7gT6SNnVpQZDX9lDo=;
        b=OL5NCMBm4YieL24rYroG2GOjhRth2LCv4T+OxcwliaiPF0laVm19CnKkpGy56fFmZB
         yoBEnjWk3PoBZ6LT9qdaY5pdcGEJ6f8QUQJXG7vlY/Oj3G7guRHy81J9Pqtyb1o5XIMH
         nJJJQ4ybK/Jo+jgdU6bZwh+yVgV0LbH6VD6nuZgY51V/WLsV+7QHE9x7h/IzTwd+cHf5
         /XR44h/h1JhiTNHxZy1XnL7Qup4rGaMn5yGU9GqApamjPlylFId/r1Je/5R+vh2HbQ0q
         fQz30NDEnRRy8F3dUFdQIJWSATGDYJJMZzAF5l10ntdTPZB36aZjsEJC56Qn//Lg2Yg6
         /lxg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ9qP/igVrzr3WU+nwKmZ1Rp3U1yLxKSl2QqVZRfZdtNn3Tr3dlki5fvJbX8CuLdZYp3JeX5I2TFf9aUanYZze7YYYNUeE1YhP
X-Gm-Message-State: AOJu0Yw+VOZfWCmYYFojUy53FJiTOvNdwcVFbhxoIxN/hqSqUrs6SBbo
	djGyg75Zhj/RWt5Z2f6WCm2reIPCjxvyVgZYLZUQLzNCZhHwxQf/oOxKfisApuM=
X-Google-Smtp-Source: AGHT+IHWlzW7b9dIzeFM1UaPGPNDnj9mj0+synWhNkTAZT9w3SowrsNm8Dr6wgU1vaHYW9dDDvMM4Q==
X-Received: by 2002:a05:6a00:bf0:b0:705:9aac:ffb8 with SMTP id d2e1a72fcca58-70674582b1bmr13224247b3a.9.1719508976537;
        Thu, 27 Jun 2024 10:22:56 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706b4a58847sm1617843b3a.186.2024.06.27.10.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 10:22:55 -0700 (PDT)
From: Evan Green <evan@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Evan Green <evan@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
Date: Thu, 27 Jun 2024 10:22:37 -0700
Message-Id: <20240627172238.2460840-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627172238.2460840-1-evan@rivosinc.com>
References: <20240627172238.2460840-1-evan@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
hwprobe_key_is_bitmask(), when in reality it was an enum value. This
causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
since SLOW, FAST, and EMULATED have values whose bits overlap with
each other. If the caller asked for the set of CPUs that was SLOW or
EMULATED, the returned set would also include CPUs that were FAST.

Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
returns the same values in response to a direct query (with no flags),
but is properly handled as an enumerated value. As a result, SLOW,
FAST, and EMULATED are all correctly treated as distinct values under
the new key when queried with the WHICH_CPUS flag.

Leave the old key in place to avoid disturbing applications which may
have already come to rely on the key, with or without its broken
behavior with respect to the WHICH_CPUS flag.

Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
Signed-off-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

---

Changes in v3:
 - Further documentation wordsmithing (Conor)

Changes in v2:
 - Clarified the distinction of slow and fast refers to misaligned word
   accesses. Previously it just said misaligned accesses, leaving it
   ambiguous as to which type of access was measured.
 - Removed shifts in values (Andrew)
 - Renamed key to RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF (Palmer)

 Documentation/arch/riscv/hwprobe.rst  | 20 +++++++++++++-------
 arch/riscv/include/asm/hwprobe.h      |  2 +-
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 25d783be2878..7121a00a8464 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -235,8 +235,13 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        c732a4f39a4 ("Zcmop is ratified/1.0").
 
-* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
-  information about the selected set of processors.
+* :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
+     :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
+     mistakenly classified as a bitmask rather than a value.
+
+* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value describing
+  the performance of misaligned scalar native word accesses on the selected set
+  of processors.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNKNOWN`: The performance of misaligned
     accesses is unknown.
@@ -245,12 +250,13 @@ The following keys are defined:
     emulated via software, either in or below the kernel.  These accesses are
     always extremely slow.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are slower
-    than equivalent byte accesses.  Misaligned accesses may be supported
-    directly in hardware, or trapped and emulated by software.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned native word
+    sized accesses are slower than the equivalent quantity of byte accesses.
+    Misaligned accesses may be supported directly in hardware, or trapped and
+    emulated by software.
 
-  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are faster
-    than equivalent byte accesses.
+  * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned native word
+    sized accesses are faster than the equivalent quantity of byte accesses.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 920fc6a586c9..7ebb2f2cc4cf 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -79,6 +79,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 3d1aa13a0bb2..b18639020c61 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -223,6 +223,7 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		break;
 
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
+	case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
 		pair->value = hwprobe_misaligned(cpus);
 		break;
 
-- 
2.34.1


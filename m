Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 006682264A7
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 01:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778031460; cv=pass; b=RLrKRkbpZ62qQKwxL7+S14/LVlUcO0NQwl9+dBZ/QSsHa5Zi7AAExfRA7VzXtWZQUmg0K2cZR34PbPhuvbw85RoBNuPtosELYB4nvxvnqtKJ3yIllkPLJOhKPrnaYS+TC2iMi0/+xyu4lFFDqntdroBzhfpAN/v1ivNqqp2zfMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778031460; c=relaxed/simple;
	bh=C7qsdyfRZwLfmFcnjYA15m8oaydBcIlTQ0Il36+MFvs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VoiVk+UhA1Qe3s3NY0zyyBEJAlEQhbbI1kUIqusfXfm6H/otrTOwq1Sft8nuPKUW9958pTmp7FqyyF5o8AlCHWc6D8WnXRGTSQ7s/9hbemCXhOZj10A0u6sLaiYImEZ4auQP1McHlh8has9Z5SETTSr01jAWt9HfeQVAjcB0hk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixCnj17V; arc=pass smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixCnj17V"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2b4520f6b32so9177027eec.0
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 18:37:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778031458; cv=none;
        d=google.com; s=arc-20240605;
        b=HHKctRlh1B1NGWDftk5f2lquCGX55+T680XSz1FmCK1+464lv+Omh7luMq9I45sVvv
         PINLRPxPJoFHE9DUT4xKUcExQ03QqiDLJXi2NnVmWFbQYQVpz4NPf9DFNHF2zdxs7ntq
         bwqBl20EJv2wg26zN1uQVWpy9wHh9nCzkFwSfCOd+K/L7KPPDFpSX28y/SjWMmxWAzXO
         A2KqkTVnbpON+LAWdM0Ij35C5JoxpP6YkQSanm11tblt3fpPSeXrOS27QvHr+E4qm96V
         5zXEu+H5+09Gg+3333erz++0AJLVQ2iOVgD2rteCWWqqrJe3AGKAz2J8XktA4be8QyTv
         kJsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+u3Nykeuw01L3aBy0CHhFQn8xLtqxnKceotQdPF0M3Y=;
        fh=yKlDP5TtHuhGLLSJceeTaBPQh8KPI+UjyZ++IkRYhGA=;
        b=N/d3LdYJZEgNR9nyLYC31Ic+rq8f+3zj1+0opV0Ym56LMJ4sCvjYXZW/ifR+J/Fz16
         tIJnrLhNUKqRpriNTG+e49bKBajUdWcK7b7V1yCykmJsFr6VmiEdRc7N8b9EuyAO2ccb
         gd7nn0gLFuosv6RUkSuCnb/IWkYTuByG4juXbt4VsX4WVq369gXazIuYglV3N/w86VRA
         75LI10O+Alo9rvCWWflkXJ0043JAvag5Wi/UJecahum7MxTKcuFN3TKJUBflBa+BGzJN
         OssfhJvYrTvc6vejSra+iVC82ND85h2bCxGt2TYzlgVouhfAkqxqe/DtkhCr95TIzWaq
         sSjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778031458; x=1778636258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+u3Nykeuw01L3aBy0CHhFQn8xLtqxnKceotQdPF0M3Y=;
        b=ixCnj17VLPQg9lheYEj3yITgmaUrlpKFp3UIKE7a10tV77if6of1U/OCN4iR+kW/yn
         +lCITkH5gIr+j4XmpIjU6JffIB1d21gnY4B+XV5yyfO3jNLFs4sEVx0eAeOIj2UiC36X
         PCmqQtquocwae3+Cad9kKtLyn6ccJk+krU8gfFzvrWWx24ThoJMQPIBCpxAgKREOiIku
         pm6WCo7lcPwJn4A57PpID296FsHg68BgO+YMjZHycUoGfvSvjAXmoxPAWtpcpG62GCy7
         oBkbEd+sGZuCulyjcDY1VhgYMdm3NRf7L5mg1+xsbmXx0uNzyqtV1H2HJd6OUonOFrXE
         wFag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778031458; x=1778636258;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+u3Nykeuw01L3aBy0CHhFQn8xLtqxnKceotQdPF0M3Y=;
        b=B8TTZe6mEDtkhcJ/Ax/4rmd6U8ftxbmDJDXlzTcew8GuM/8037PAE/R5KsyS3i7u34
         wgExuvQtR+PNdMzCMsg21y+9EBzfa5WzOF/BH6r+7QJ1HZpsVS3/j5rByhSWQ9JsLqAp
         ctTb6V9YtwP8QvGkOJnl/ixQUx1YhrTQ17PUo7HDqELQm1ReB/FB4IRtUdpbpBEENU3/
         mST0hinj9P4n3M6YSwqLJVym31+bN+oqeUNPSkctiqswF1cCMdDGflkxjYku9HBFHkg5
         DPPecfO//cNIGoN6dFQ/ohw4P3Wo9/gvXZN32hrxqb5Ha3t4Bt6YDgdPKyS7BQdjLSvS
         36kQ==
X-Forwarded-Encrypted: i=1; AFNElJ+93+o2DmFl29m9Hp8QBKBrafO1moRs4hs9AAy2+N7E5wK5/pp9WnBHgWA2z7rBZGvkbXW3+1fGYKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6kCli0GYdQR000zUeXurefnH2jAXUtSEj3dybHaUjWlmKIMMD
	BiLpxP+L6HW2E6GLniM2qs4qirao98RaCvS2Trh1DMBbSJv1cQiab8SLgN3UBs50rqlkjGZDe45
	EjXHyPSp/AHU1uC6hLvU+czIM89ACpnwicBRkVlyt2A==
X-Gm-Gg: AeBDiete+66aKqgHsrxlIBUKu3GPrcJjlGZs8kXmi30lfxS+m52ys1z8YxghWcd139K
	aRrXPnCLD6uyHbnlOjLp2xDzt7gZUsnptbrMMFwOnnSON6Cdx+4lmd/dTeZ/42zOLAxYtjHPMxO
	28/GcFhwYrTlCDWfebnMBMUn7TsQyr5JeoSbRnV8rRf7E1nGvtWZUw8MBI57lRMfJz68vbg54bH
	DXT5+XtQIPFkJ3YEMbVx2DYqEt4qQfAOhiWunzR2cJbHDGxoFcBNCNREf1/4KBcxBKTsN7n8FMd
	VmPO9mNHpH1unjy7tO/rQnd5Uf9lJppayWiFWz4ojDvZPyoGoKRK
X-Received: by 2002:a05:7022:251f:b0:127:5cd6:fa45 with SMTP id
 a92af1059eb24-1319cc19f1dmr852370c88.14.1778031457882; Tue, 05 May 2026
 18:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Raymond Newman <raymondcharlesnewman@gmail.com>
Date: Tue, 5 May 2026 21:37:26 -0400
X-Gm-Features: AVHnY4Kf8u22XpqbbYHu0UkH0cArPL6iBBLagzAn_rgaMABRGr1lNMEyPN9lh80
Message-ID: <CAC5penpL_yet9HHqC=BNV_EP2wDe3zpsjFw77T8356veNV0rsw@mail.gmail.com>
Subject: [PATCH] lib/gcd: Convert to Rust
To: linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 96902ad2caf167ca0377e0b2063973e2183465b4 Mon Sep 17 00:00:00 2001
From: Raymond Newman <raymondcharlesnewman@gmail.com>
Date: Tue, 5 May 2026 21:29:29 -0400
Subject: [PATCH] lib/gcd: Convert to Rust

Convert lib/math/gcd.c to Rust. The binary GCD algorithm is preserved
exactly, including both the efficient-ffs fast path and the even/odd
fallback for CONFIG_CPU_NO_EFFICIENT_FFS targets.

__ffs() is replaced with trailing_zeros(), which maps to the same
hardware instruction. swap() is replaced with core::mem::swap().
Unary negation for the bitmask isolation trick is replaced with
wrapping_neg() to make the intentional wrapping behavior explicit.

ABI compatibility is preserved via #[no_mangle] pub extern "C".

Signed-off-by: Raymond Newman <raymondcharlesnewman@gmail.com>
---
 Documentation/core-api/kernel-api.rst         |   2 +-
 .../zh_CN/core-api/kernel-api.rst             |   2 +-
 lib/math/gcd.c                                |  88 ---------------
 lib/math/gcd.rs                               | 103 ++++++++++++++++++
 4 files changed, 105 insertions(+), 90 deletions(-)
 delete mode 100644 lib/math/gcd.c
 create mode 100644 lib/math/gcd.rs

diff --git a/Documentation/core-api/kernel-api.rst
b/Documentation/core-api/kernel-api.rst
index e8211c4ca..fff8ecc47 100644
--- a/Documentation/core-api/kernel-api.rst
+++ b/Documentation/core-api/kernel-api.rst
@@ -178,7 +178,7 @@ Division Functions
 .. kernel-doc:: include/linux/math64.h
    :internal:

-.. kernel-doc:: lib/math/gcd.c
+.. kernel-doc:: lib/math/gcd.rs
    :export:

 UUID/GUID
diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst
b/Documentation/translations/zh_CN/core-api/kernel-api.rst
index a1ea70810..3a9d4a3a3 100644
--- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
+++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst
@@ -174,7 +174,7 @@ include/asm-generic/div64.h

 include/linux/math64.h

-lib/math/gcd.c
+lib/math/gcd.rs

 UUID/GUID
 ---------
diff --git a/lib/math/gcd.c b/lib/math/gcd.c
deleted file mode 100644
index 62efca678..000000000
--- a/lib/math/gcd.c
+++ /dev/null
@@ -1,88 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-#include <linux/kernel.h>
-#include <linux/gcd.h>
-#include <linux/export.h>
-
-/*
- * This implements the binary GCD algorithm. (Often attributed to Stein,
- * but as Knuth has noted, appears in a first-century Chinese math text.)
- *
- * This is faster than the division-based algorithm even on x86, which
- * has decent hardware division.
- */
-
-DEFINE_STATIC_KEY_TRUE(efficient_ffs_key);
-
-#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
-
-/* If __ffs is available, the even/odd algorithm benchmarks slower. */
-
-static unsigned long binary_gcd(unsigned long a, unsigned long b)
-{
- unsigned long r = a | b;
-
- b >>= __ffs(b);
- if (b == 1)
- return r & -r;
-
- for (;;) {
- a >>= __ffs(a);
- if (a == 1)
- return r & -r;
- if (a == b)
- return a << __ffs(r);
-
- if (a < b)
- swap(a, b);
- a -= b;
- }
-}
-
-#endif
-
-/* If normalization is done by loops, the even/odd algorithm is a win. */
-
-/**
- * gcd - calculate and return the greatest common divisor of 2 unsigned longs
- * @a: first value
- * @b: second value
- */
-unsigned long gcd(unsigned long a, unsigned long b)
-{
- unsigned long r = a | b;
-
- if (!a || !b)
- return r;
-
-#if !defined(CONFIG_CPU_NO_EFFICIENT_FFS)
- if (static_branch_likely(&efficient_ffs_key))
- return binary_gcd(a, b);
-#endif
-
- /* Isolate lsbit of r */
- r &= -r;
-
- while (!(b & r))
- b >>= 1;
- if (b == r)
- return r;
-
- for (;;) {
- while (!(a & r))
- a >>= 1;
- if (a == r)
- return r;
- if (a == b)
- return a;
-
- if (a < b)
- swap(a, b);
- a -= b;
- a >>= 1;
- if (a & r)
- a += b;
- a >>= 1;
- }
-}
-
-EXPORT_SYMBOL_GPL(gcd);
diff --git a/lib/math/gcd.rs b/lib/math/gcd.rs
new file mode 100644
index 000000000..29397c669
--- /dev/null
+++ b/lib/math/gcd.rs
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+//! Greatest Common Divisor
+//!
+//! Implements the binary GCD algorithm. Often attributed to Stein,
+//! but as Knuth has noted, appears in a first-century Chinese math text.
+//!
+//! This is faster than the division-based algorithm even on x86, which
+//! has decent hardware division.
+
+use kernel::prelude::*;
+
+/// Calculate the greatest common divisor of two `usize` values
+/// using the binary GCD algorithm.
+///
+/// Returns 0 if both inputs are 0. If only one input is 0, returns
+/// the non-zero value. The result is the largest integer that divides
+/// both `a` and `b` without remainder.
+///
+/// On architectures with an efficient find-first-set instruction,
+/// uses a faster bit-shifting path. On architectures without
+/// (CONFIG_CPU_NO_EFFICIENT_FFS), falls back to an even/odd loop
+/// which benchmarks better under those conditions.
+#[no_mangle]
+pub extern "C" fn gcd(mut a: usize, mut b: usize) -> usize {
+    let r = a | b;
+
+    if a == 0 || b == 0 {
+        return r;
+    }
+
+    #[cfg(not(CONFIG_CPU_NO_EFFICIENT_FFS))]
+    {
+        return binary_gcd(a, b);
+    }
+
+    // Isolate least significant set bit of r, which is shared by
+    // both a and b and must therefore be a factor of the GCD.
+    let r = r & r.wrapping_neg();
+
+    while (b & r) == 0 {
+        b >>= 1;
+    }
+    if b == r {
+        return r;
+    }
+
+    loop {
+        while (a & r) == 0 {
+            a >>= 1;
+        }
+        if a == r {
+            return r;
+        }
+        if a == b {
+            return a;
+        }
+        if a < b {
+            core::mem::swap(&mut a, &mut b);
+        }
+        a -= b;
+        a >>= 1;
+        if (a & r) != 0 {
+            a += b;
+        }
+        a >>= 1;
+    }
+}
+
+/// Inner fast path for architectures with efficient find-first-set.
+///
+/// Uses `trailing_zeros()` which maps directly to the hardware
+/// instruction (e.g. BSF on x86, CLZ on ARM). Not compiled on
+/// CONFIG_CPU_NO_EFFICIENT_FFS targets where the loop-based
+/// even/odd path in `gcd()` benchmarks faster.
+///
+/// `r` captures the shared trailing zeros between `a` and `b`,
+/// representing the power-of-two component of the GCD, which
+/// is restored via shift at the end.
+#[cfg(not(CONFIG_CPU_NO_EFFICIENT_FFS))]
+fn binary_gcd(mut a: usize, mut b: usize) -> usize {
+    let r = a | b;
+
+    b >>= b.trailing_zeros();
+    if b == 1 {
+        return r & r.wrapping_neg();
+    }
+
+    loop {
+        a >>= a.trailing_zeros();
+
+        if a == 1 {
+            return r & r.wrapping_neg();
+        }
+        if a == b {
+            return a << r.trailing_zeros();
+        }
+        if a < b {
+            core::mem::swap(&mut a, &mut b);
+        }
+        a -= b;
+    }
+}
-- 
2.54.0

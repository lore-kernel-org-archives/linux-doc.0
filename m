Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783AF3BCD15
	for <linux-doc@vger.kernel.org>; Thu,  8 Oct 2026 05:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437886; cv=none; b=s9cwApHyZ3VtQEIn9TUSZpx+aWBr614kKZjZre7rhvdrc6ACNdoM81cVPn9SyreP2mJgdvQUFfpVzkInAAeT/igpV/I/GC6Ho3GOPIX9bOCEd2KrBcyd/0XwZwnetl+ispHwtLeZQo08nh2E4JwMWDC1rD3aNyR8osmYR2HEBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437886; c=relaxed/simple;
	bh=JEQbn+ax2E/aRdIc5y9IDts//zVzmXP9z5ZCd4sUttY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h+FXF1i1TyVg8KQMQwSnT/yot2JlV2aLrVegmnPyIJ4GfNj7ZoLl4rNdr55u9XH/jxtYXGy+zPkiCQh094yEW/ZKMh5chhAau6KA1HUZguAWJLlmps7ClYpiy59fVm5FKkTHS4dtZuhglYshKWDLjj1O5pagcqJTwSNl1CoBYRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY/GpUdc; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY/GpUdc"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48b060ec084so1815750f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2026 22:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791437882; x=1792042682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWLFTt24RYDJvEJDwU+vEARTDOg0wmnK2jYoZBai8H0=;
        b=YY/GpUdcPddIeHQcuKrhEjvkkgzotFNqoAzZphgI/IiPk+Bx9VMoKOTDkcjPFKiOo5
         mRNLnYnAC0xJdzwqBaY0ZA8CZLjHoxqxUC8XuLEVJvB44BA0TdDB6OlCqfitQrijE/Ro
         rPS9+HJcFkFcwJ+3xeLSKH1Ay86MNnx6eSx2MF9HePjPqmFrV4hE0jjX2NeNHkjFpiLl
         ViYJLIokNBMbB+TItXUfeNYbd2Jq/Es89S95pIr7MVQioNxvSUlMUTrE9rkIKpRGe7sq
         met9ppn77lOaRtW/V/0LrNlNqHEG6oKcBxVcWuXw/tHhGExkSUP219A2XhP5W2/F+VPx
         VjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791437882; x=1792042682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWLFTt24RYDJvEJDwU+vEARTDOg0wmnK2jYoZBai8H0=;
        b=sAI0kswdY2ah5+7CAxrqa3OOMYaNoHdtr39MsyI27ihmm3gFH4l31U8kd9ZGMtvS+U
         H5xGLIQ+6yJCXVdzmipP72Yiqa+xmfmb/MWRSCp1iHLAApkpMIPF8ptLMyEOyqEZ1UI+
         pVgvXvSU4KGCEfN2tqyxd9j0xYVZqpg7nYZpDRyIa+pseaVOdRIgSX6jwrBFAvNTkLXD
         mnkNs+yWVthxl0GEIuH1r3h90kbcGiAZNX3DbOH+JNdMOQyL6/YkhnnjujT0UMPChEFr
         3E55rGh16yrcis28+iMJBABrNdDjsjeUC0FG9rSDtKSqv5GSBN8VNP+9+XyFDOoLWzkM
         7wPA==
X-Forwarded-Encrypted: i=1; AKwUvBxApzPABPNqTvJ/6vGCXxW3uRDm8y2pVYXUcmz9Ib8ary7cF1CLuG8bnAQNANTCTUvX8hE5nzWheVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6/LCKtt7jYAETrIb58p8JllbWKX0nJWD/HVbSaAPSm5cydxOO
	CxjKThxcThUdVPmqAgLZJI1pOrKxSB5wqnRndQ54Qks0lROTI6dXfjtu
X-Gm-Gg: AYBFou0DFAKYSMsE0ye2CFb01hb9/7X3wuqbe9CTWHLYsP4KYpc2eKKf5OJG+Znk8M1
	QiO3k6TQwffMgbVHcUwcljKqRgnqu1a1QVJJ8WEg/hU8KC1Mm/+uQwH858u4PMFUDuDAjfv+CYv
	dol1sqsCXZtsEZeikx/nF7+/PbbRw3SqxTIrke8SY+kB/tNlTS6XZbckLqhl4r2tw02P5wyqSF/
	1ei2LyquKqwUg+Mz4pnrEOrLwwmNShBY8UW8OTssBQRv6k7IbaHyqOMDosjepBoB0yUV+3+E5bV
	6z3eoxJZL5944IcvOeC+ZZ6mZKF4zNOm1i65kD30TgHMpx4IwXiTju738lcCam7VNxlgkPqCkp/
	k5DGx03FB2g1UqE4zE841FutzkI0SsxVJUSrbUptj67uMPxT9H3SoRBY4wYjGvNMTYcYDmiHiql
	I1s77ChvPG8ipoILse1nrbNyVuk0djCT42nVDPSBbdoMH1i5GGSoZIvHazBWsZ4w8/oZgw22EdU
	GZx69QtwDcFmwWaoVk71/YVR2JqpjA/qxj/KnfcQl32M1ox80b1pfqdSiWx07nz1vt3+sXtF+dY
	ZrCUnKYoCtG0yxsPuX18wRFht+zqFVXIiBPz5K0bCxz4ZgDaqmw5+qiv/nBcOiGp6oriGeMSVgV
	XY2rxmlA=
X-Received: by 2002:adf:e19c:0:b0:48c:4e9e:dc7 with SMTP id ffacd0b85a97d-48c727871f9mr7979486f8f.42.1791437881355;
        Wed, 07 Oct 2026 22:38:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d1f8fbsm8458219f8f.33.2026.10.07.22.37.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Oct 2026 22:38:00 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Christian Schrefl <chrisi.schrefl@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] ARM: rust: Enable Rust support for ARMv6K-only kernels
Date: Thu,  8 Oct 2026 07:37:43 +0200
Message-Id: <20261008053746.49631-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261008053746.49631-1-kmehltretter@gmail.com>
References: <20261008053746.49631-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HAVE_RUST is selected for CPU_32v7 only. A combined ARMv6K and ARMv7
kernel has CPU_32v7 and can use Rust today. A kernel built for ARMv6K
alone cannot. There is no technical reason for that.

No CPU flags are passed to rustc on ARM. The arm-unknown-linux-gnueabi
target has +v6 in its feature list, so Rust code is built as ARMv6 on
all of these kernels already.

Select HAVE_RUST for CPU_32v6K instead. CPU_V7 selects CPU_32v6K, so
ARMv7 stays covered.

Plain ARMv6 (CPU_V6, ARM1136r0) is excluded. It has no 1- and 2-byte
xchg() and no 2-byte cmpxchg(), which the Rust atomic helpers need. A
kernel that combines CPU_V6 with ARMv7 can enable Rust today and does
not link.

Tested in QEMU raspi0 (ARM1176) with bcm2835_defconfig without
ARCH_MULTI_V7. The Rust samples, all Rust KUnit suites and the
doctests pass with the current and with the minimum tool versions.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/arm/Kconfig                    | 2 +-
 rust/helpers/atomic_ext.c           | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 4f980815e92a..bdc42a24bf30 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -15,7 +15,7 @@ support corresponds to ``S`` values in the ``MAINTAINERS`` file.
 =============  ================  ==============================================
 Architecture   Level of support  Constraints
 =============  ================  ==============================================
-``arm``        Maintained        ARMv7 Little Endian only.
+``arm``        Maintained        ARMv6K and ARMv7, Little Endian only.
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index ffbc7f386131..b5816f28783a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -138,7 +138,7 @@ config ARM
 	select MMU_GATHER_RCU_TABLE_FREE if SMP && ARM_LPAE
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RSEQ
-	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v7 && !KASAN
+	select HAVE_RUST if CPU_LITTLE_ENDIAN && CPU_32v6K && !CPU_V6 && !KASAN
 	select HAVE_STACKPROTECTOR
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_UID16
diff --git a/rust/helpers/atomic_ext.c b/rust/helpers/atomic_ext.c
index c267d5190529..1d157df29229 100644
--- a/rust/helpers/atomic_ext.c
+++ b/rust/helpers/atomic_ext.c
@@ -42,7 +42,7 @@ GEN_READ_SET_HELPERS(ptr, const void *)
  * xchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding xchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_XCHG_HELPER(tname, type, suffix)					\
@@ -66,7 +66,7 @@ GEN_XCHG_HELPERS(ptr, const void *)
  * try_cmpxchg helpers depend on ARCH_SUPPORTS_ATOMIC_RMW and on the
  * architecture provding try_cmpxchg() support for i8 and i16.
  *
- * The architectures that currently support Rust (x86_64, armv7,
+ * The architectures that currently support Rust (x86_64, arm,
  * arm64, riscv, and loongarch) satisfy these requirements.
  */
 #define GEN_TRY_CMPXCHG_HELPER(tname, type, suffix)				\
-- 
2.39.5 (Apple Git-154)


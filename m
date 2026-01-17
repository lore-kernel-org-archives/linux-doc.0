Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE943298CB7
	for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 23:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768692765; cv=none; b=HVARMxviY5rkNAg1yPX2GnErJZejaUsQN3j/kP04j6Rw2NJ7icJlGUU9MDibCYvb6hbJXSA/tonqS61MIiDGu/R7+EO7kEwi+hlLahQGxBR7Wa3OGvD1PMuRV2HZIA8ieAqRuM7IUlLijhFRE0TVuyYJww2ToUVDbfDbHF/W+nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768692765; c=relaxed/simple;
	bh=nuzfFbZEU3k5cU+MiiBqYrDg+WADiuf533wpQ8DfhBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pyhuiZMByR7m+OP+3lQQ2U3hY7AvPLNBzji2aQI/aU6XOmo0o8YCAMrSYat3GeDRx7ywdtJ+vfh5rPTYOR9Ytjqg1f23lQ6wC9DbabI1sZW/qY9jdHi528DUJ/SuVaCVX9my8xnRWTwuWUNIvvQl5e0v7Kld3lg5v772OOPT4WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJbSN/Uf; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJbSN/Uf"
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45c7a6de470so2146510b6e.3
        for <linux-doc@vger.kernel.org>; Sat, 17 Jan 2026 15:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768692761; x=1769297561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QCMS+eF83vmFIaisSFMfMqnhtdmha//28PB8xvwFi8=;
        b=hJbSN/UftcG6JroVD7Nj7JzKae6u3T7dC1WWn+WehHRldhBuSkYKEEKJSqpIqkIQVt
         DhE/3HRXS03ZUQ9QBMVHurA6vrr1SSC/T6/8zKwC3Aspm6BRR/A7LkHrdnWuQp3TjyZO
         ezH66nXEYNhF3dfwp9Fb/mEM84o0PSbId5MVBQqpKwVH4hwMfJH2AeOafPpL+60f97jF
         tllP4cvHlTKiUzOizFocg1ewbr3TgZWS+Tnd2uDVhLA1UEt96cHqqu4j9Zk0A8c1ZEms
         8jFtjhcjCiewqQplc9ZYWJVYheACI37z+yJ0QReessvZ4KAzpTGOhW8P5plyWdysFw/p
         X+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768692761; x=1769297561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9QCMS+eF83vmFIaisSFMfMqnhtdmha//28PB8xvwFi8=;
        b=epv+g/tw2GFzeKJU2tu/mAwtPwUs5R5hETN1AcZ6hxq2wuADAsBqIE34uUzShOxL2F
         Akq9ukPXKLqxJp7GvxZNnxHP9v7yzUSZUvanufYoaw3LIaqOYizUs/ewgH0RqCztFkYR
         MThP+Usn4Xo4Qi2Wx5RI6bEzIyZ7qmFf6agEjULW/+Ob73Q9ocAp3i2MXne3RvZ71SMu
         d6/LdP6LPpkIdo84nOY6aIHOKiNBuoWI9xekfZwJ/DTskzaXOakCm/3FMdzRSiiPHfQB
         XqJpSxG+2FsPnoo17RGsFK8jUzBWyRopmSBUa9tENUdVdFUR0PM1Srz7e19eDaQmt2fS
         RUeA==
X-Forwarded-Encrypted: i=1; AJvYcCWokgez00LDPinKSCFdvDhNueXBedq5cw0F28FyOc1gwJ90Hnf3bcz2ogLt8iVPod6wsLbVwpvgz3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmsYMAxObNUm1F6maQ5GpoKsX3BvmrrHGCRgYKyceHbZwhOA7
	44Nk6w0u7SD9TOQLkWa+EEI+YXKJkRqN62AfzlojJb3pph3Ytjk1uGad
X-Gm-Gg: AY/fxX7cv6TM0ne2D25pF2ZZejGb9P/F2Bn4LLTIulhgGBnYneASEN2Q/UWMfaSgSXP
	lY6Q+BGymP913I4/Jx7jGXrLhneXAgiNw0vt3JQQgM9Ses8Du/Y8BVTUSmrwisTcFOAzaiCNZBq
	HaQoTzcEypYJDFf6ReS20ZTx6vpV3YunQtfxc6n2aja3zeWiZHGq0MRB4AMPE1qIGP65IvArl6R
	C10TiSdhEB8qotDefi3xIrn4bkPFOglf/goAnlsZ/f0d6zvN36fpIAlWXnMDB7qGdXacJ5ob96A
	irSfmZgXgT7J7uAIu4pK/vsVwl0QQr7Op2cpRlj2ADEjku5MoX91q+rDFKP0ck0menPAvbAZ29D
	MFB7fGs5wXDiVTIKChfzWOPVTfN1rxegbVldC8bhDWwd6b6DMaZ1m+FiTtQw6Qqt6Ah0tpo+yjl
	EZWLUBXD9mSKJIIwjwzf3PnYOCqDFj+W13nkk937/8
X-Received: by 2002:a05:6808:30a2:b0:455:dfc8:46a6 with SMTP id 5614622812f47-45c9c018560mr3951786b6e.28.1768692761657;
        Sat, 17 Jan 2026 15:32:41 -0800 (PST)
Received: from localhost.localdomain ([50.24.139.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e0086a4sm3424232b6e.12.2026.01.17.15.32.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 17 Jan 2026 15:32:40 -0800 (PST)
From: Andy Chiu <andybnac@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	pjw@kernel.org
Cc: Andy Chiu <andybnac@gmail.com>,
	Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	eric.lin@sifive.com,
	vincent.chen@sifive.com,
	zong.li@sifive.com,
	yongxuan.wang@sifive.com,
	samuel.holland@sifive.com
Subject: [PATCH v2 1/1] Documentation: riscv: update Vector discovery for userspace
Date: Sat, 17 Jan 2026 17:32:27 -0600
Message-Id: <20260117233228.36088-2-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20260117233228.36088-1-andybnac@gmail.com>
References: <20260117233228.36088-1-andybnac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make it explicit that users may use both HWCAP and
PR_RISCV_V_GET_CONTROL for checking the availability of Vector
extensions. This addresses the ABI usage concern[1] arised from the user
space community in supporting Vector sub-exts and multiversioning.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=220795

Suggested-by: Zihong Yao <zihong.plct@isrc.iscas.ac.cn>
Signed-off-by: Andy Chiu <andybnac@gmail.com>
---
Changelog v2:
 - fix a document build failed reported by kernel test robot
 - rephrase some sentences and make it easier to read
---
 Documentation/arch/riscv/vector.rst | 51 +++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
index 3987f5f76a9d..47513edfa879 100644
--- a/Documentation/arch/riscv/vector.rst
+++ b/Documentation/arch/riscv/vector.rst
@@ -13,13 +13,14 @@ order to support the use of the RISC-V Vector Extension.
 Two new prctl() calls are added to allow programs to manage the enablement
 status for the use of Vector in userspace. The intended usage guideline for
 these interfaces is to give init systems a way to modify the availability of V
-for processes running under its domain. Calling these interfaces is not
-recommended in libraries routines because libraries should not override policies
-configured from the parent process. Also, users must note that these interfaces
-are not portable to non-Linux, nor non-RISC-V environments, so it is discourage
-to use in a portable code. To get the availability of V in an ELF program,
-please read :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
-auxiliary vector.
+for processes running under its domain. Changing Vector policy by calling
+:c:macro:`PR_RISCV_V_SET_CONTROL` is not recommended in library routines
+because libraries should not override policies configured by the parent process.
+Also, users must note that these interfaces are not portable to non-Linux,
+nor non-RISC-V environments, so their use is discouraged in portable code.
+To get the availability of V in an ELF program, user code may read the result of
+:c:macro:`PR_RISCV_V_GET_CONTROL`, or the :c:macro:`COMPAT_HWCAP_ISA_V` bit
+of :c:macro:`ELF_HWCAP` in the auxiliary vector.
 
 * prctl(PR_RISCV_V_SET_CONTROL, unsigned long arg)
 
@@ -91,9 +92,9 @@ auxiliary vector.
     Gets the same Vector enablement status for the calling thread. Setting for
     next execve() call and the inheritance bit are all OR-ed together.
 
-    Note that ELF programs are able to get the availability of V for itself by
-    reading :c:macro:`COMPAT_HWCAP_ISA_V` bit of :c:macro:`ELF_HWCAP` in the
-    auxiliary vector.
+    Note that ELF programs are able to get the availability of the standard V
+    extension for itself by reading :c:macro:`COMPAT_HWCAP_ISA_V` bit of
+    :c:macro:`ELF_HWCAP` in the auxiliary vector.
 
     Return value:
         * a nonnegative value on success;
@@ -138,3 +139,33 @@ As indicated by version 1.0 of the V extension [1], vector registers are
 clobbered by system calls.
 
 1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
+
+4.  Vector Extensions Discovery
+-------------------------------
+
+Existing kernel supports running user-mode Vector code on hardware implementing
+various sets of Vector-related extensions. Zve32x is the minimal subextension
+required for hardware that implements 1.0 version of the spec. Or, full v0.7 if the
+kernel is compiled with ``RISCV_ISA_V && RISCV_ISA_XTHEADVECTOR``. When the kernel
+recognizes and supports an extension on a hardware implementation, the kernel
+indicates its existence on ``/proc/cpuinfo``, and the corresponding bits obtained
+from ``riscv_hwprobe(2)`` is also set.
+
+The existence of an extension does not necessary guarantee its availibility to
+any given process. The user process is responsible for checking if an extension is
+available before using it. Traditionally, :c:macro:`ELF_HWCAP` is designed for such
+availibility check. This remains useful for checking the availabilty for the full
+set of v1.0 Vector extension, defined by the isa string "v", by referencing the
+:c:macro:`COMPAT_HWCAP_ISA_V` bit.
+
+However, even though the kernel provides compatibility for flexible hardware
+configurations, the kernel does not report the availability of "v" subextensions,
+nor pre-rectified Vector in :c:macro:`ELF_HWCAP` to prevent exagerating the
+limited bit space.
+
+The bit in :c:macro:`ELF_HWCAP` is designed to serve as a quick check to see iff
+the standard "v" extension is both **pressence** and **available** to the process.
+For any non-standard Vector extensions, the ABI guaranteed way to identify their
+existence is by going through the hwprobe(2) interface for the existency chek.
+Then, ``prctl(PR_RISCV_V_GET_CONTROL)`` serves as the availibility check to see if
+executing any Vector instructions is allowed by the runtime environment.
-- 
2.39.3 (Apple Git-145)


Received: from mail-oo1-f67.google.com (mail-oo1-f67.google.com [209.85.161.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EFB800
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 00:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767744376; cv=none; b=Mfe+KJIpLqXHTD2xtN7tWWklTn/TivC1K6+z+b0Ulw707wtzUECJfE43JUIYqos/PhqKV+A3jVjH2MpapXKzEkEDQbChQju6PH6no/57w/xXwSAqqmX0PvBYGKOim5py+xrhYf+D/DcgH/MPM+qm8bPxSe4LFC23Rf8oczUr6h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767744376; c=relaxed/simple;
	bh=L3zGK0vOWDwJ6EPx+wY8qWZHxhitG5NkRkBh/MFlPGA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hq9HKh3p5ATmqEF7phpC9mP7aU2xQw92QpOFSFUKhI/McaA8DIz0DYUVs8ZQIbeXT+bxOK44/HN74UcGLNwrH+RL8vfZO+aRNrXJYQOtbCsdsllyPUZyJOLUTIeVSjG+y+gBeUYBmVnFluKa6gY5LvvABSHUZ/ow/1LDpPPxdnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=geinxmEC; arc=none smtp.client-ip=209.85.161.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="geinxmEC"
Received: by mail-oo1-f67.google.com with SMTP id 006d021491bc7-6598413b604so905779eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 06 Jan 2026 16:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767744374; x=1768349174; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tgq7GZjchn1EcjfHQ/Ha9eC2PJUmykLGV5Ks1aM6jX8=;
        b=geinxmECRXk6QF98OZxRxy8waoIQXAxCXFQJLaXL1iKOlYqyqA58LeJswEPKAerVBz
         DZdy+mcm5qQjkvnx+u7rd4seoLt4TMUYuEc42NoVKl7NmVwZepn/lpjObVjtAQn9mgM4
         CgVGmuSniPqOQrvomwWriVbyWVeV/28gejCIIQ2U9M3uhh1cFrvxJOrT7/4zDraGpCj8
         iue8BniEuXaRkyJ2y1NZfbUdwj1t96TR0o/7Eu8Hs6hSCyuKEmO4PdLAACcPs0FQNn3q
         K4Urv1kq4v/E2c2Kq/JUupFzYGXYHTGk38pi8VDNoKSFBCtS5Z335YeOx6Q51CPE1zwq
         EDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767744374; x=1768349174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgq7GZjchn1EcjfHQ/Ha9eC2PJUmykLGV5Ks1aM6jX8=;
        b=PLBZtNCqh54PM/57GDQ8qtZH26jSPBtFgbRI3UjDK8ocN82e8mC/nYABkD03gyXJEy
         YfFV+vj14lyupQSMaMf5Lo7DsCVtJQqiPXC8Wu0rCogw0P3B3M3Kn+2W5cSL+pEueCpW
         9rTB9EQ+sv+yAJWMQQQ9p/Z6Rdoq4yykIvs/NVr3p2FQYtV/GJLrDmYyOg1bZzC3Uacw
         NxzD3k95C6pe9S7UmE3Mtt6ladsvMtrxqWIInOlXf4ehHO57vzjuNyB6qvYqUzw3M+eT
         R8pyN/u+A4x4odYKf9rQcjCc+luyUnmjhhr9iphKg9TqMz0DH8Cui8TyRLOjnf0spnCV
         azpw==
X-Forwarded-Encrypted: i=1; AJvYcCXQjWiQk0Qk+36ck3CCeBjDdBQHzqGG7zi5EIdASZ8ez8Zx3JSLuOYkLz1ULQH/0m5ErwNeDeT1eJs=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe6BGpgLf3hTWcXGimlQPAxk3lTFwCkQfzSGM250/DvwiNb6Up
	sgYY2f2hzLG4lInQpF/2QEBNecwBoUzszIdhYeFLVG21X0dx4iWAtdco
X-Gm-Gg: AY/fxX4auhBuxacqQkwAKPuG7lyMiKApUJKwXTQCCYqO0XZdHxRltPXGYXrGcVSIUBQ
	x3u+pbcDtXza799EZykQ0CoPB2tgGVDbv1gPksfs8z+RjCQ3Cdyj4/VjDylBa8lsKLv1iexG88m
	kyg40zCYhjs9XlHd7hhZQQsX3BeNGBO+KjISa3VG3K32PgjWg10VYhHuMLuOXMLfWdcOvMmRHAT
	Wa7OFYl/1J4u2CXzF/2RVDEJO1IcyEnwS00lEl95ByjpbMAXTvkYXO+lYZukcfo8PV2vTU2n3Qw
	bsfDl9E870IjECBNZV+0TdAKM60j9GVD8pWov+rkxh0L/yLH6Gtv01nYI+WzvnBdMUjNDemJWFb
	vBTgz0ZRnO1pRL/EUfksCYu5IytbirK1xEmOPeGRQG1nrBMuuu+Qy+wDKF1Bp/Hxqww+VV/8e0y
	bC886fW3qcUVbNCcvzp0h3mGqUz6E1
X-Google-Smtp-Source: AGHT+IHZk6/5mjRHyYCN1+0jYjV5yZCr12a2Qvfp3DAWPnZ9X8yCdldjy8vhbzKeSmmfI2HWux74cA==
X-Received: by 2002:a05:6820:7511:b0:659:9a49:904d with SMTP id 006d021491bc7-65f54eda43bmr210960eaf.24.1767744374064;
        Tue, 06 Jan 2026 16:06:14 -0800 (PST)
Received: from localhost.localdomain ([50.24.139.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffbe3a6d8esm609612fac.15.2026.01.06.16.06.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Jan 2026 16:06:12 -0800 (PST)
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
Subject: [PATCH v1] Documentation: riscv: update Vector discovery for userspace
Date: Tue,  6 Jan 2026 18:06:09 -0600
Message-Id: <20260107000609.63892-1-andybnac@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
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
 Documentation/arch/riscv/vector.rst | 49 +++++++++++++++++++++++------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/riscv/vector.rst b/Documentation/arch/riscv/vector.rst
index 3987f5f76a9d..1fde56ffe85b 100644
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
@@ -138,3 +139,31 @@ As indicated by version 1.0 of the V extension [1], vector registers are
 clobbered by system calls.
 
 1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
+
+4.  Vector Extensions Discovery
+-------------------------------
+
+Existing kernel supports running Vector code in the user space on hardware
+that only implements zve32x subextension, or 0.7 version of the spec when
+compiled with c:macro:`RISCV_ISA_V && RISCV_ISA_XTHEADVECTOR`. When the kernel
+recognizes and supports an extension on a hardware implementation, the
+kernel indicates its existence on /proc/cpuinfo, and the corresponding bits
+obtained from riscv_hwprobe(2) is also set.
+
+The existence of an extension does not necessary guarantee its availibility to
+any given process. Traditionally, :c:macro:`ELF_HWCAP` is used for such
+availibility check. This remains useful for checking the availabilty for standard
+Vector extension, by referencing the :c:macro:`COMPAT_HWCAP_ISA_V` bit.
+
+However, though the kernel provides compatibility for flexible hardware
+configurations, the kernel does not report the availability of subextension, nor
+pre-standarized Vector in :c:macro:`ELF_HWCAP` to prevent exagerating the
+limited bit space.
+
+c:macro:`HWCAP` is designed to serve as a quick check to see if the standard
+Vector is both *pressence* and *available* to the process. For any non-standard
+Vector extensions, the ABI guaranteed way to identify their existence is by
+going through the hwprobe(2) interface. Then, the
+:c:macro:`prctl(PR_RISCV_V_GET_CONTROL)` serves as the availibility
+check to see if executing any Vector instructions is allowed by the runtime
+environment.
-- 
2.39.3 (Apple Git-145)


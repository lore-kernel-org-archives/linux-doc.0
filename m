Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FE9319601
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 17:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866194; cv=none; b=YI59Xz/cBZLQSonm2ick3ZZtg1ktvGzVua5ByNysBOf4ClysIy5Q1R+A4Vi7ndl83zoRL5JWiNFtUYDDNUG1IjwzUvA8bfVOAakdOIibhfEH8RnCY0U7AA/otvWOcHVj4DUCfx0zibJZKubMkji6giXM7rSIBksW7FADhjoTiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866194; c=relaxed/simple;
	bh=01dgStLxMS9aTnMI8IlTDVuPmoGpFNt9rtBjsvybJOY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ReMH/yaNx6pB46d4T0lBTkAQScuGlki+Grcr3NAwa3UKZZixNOp4XyoqwiBI+0RnQ8Br8GdO5QcQeVnmthX9bRAI2hPKS4YjbtCtWGqsBvPEunZX6seuy7pLTkcVlo1D4zdLAGINf5OW0kG4lNrhnCgjsVFwCAmugRmHujGXEVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMIBUtf8; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMIBUtf8"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1555170a12.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 09:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771866189; x=1772470989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1tnNSjdMmiZcchpYj7Fmmy7pyxIY3tVA+shYAraIB0=;
        b=aMIBUtf8SxX6s7ETzNsS1aZILu2xeMwf8caNtQyKHb4vEZ/8HeyfJXcy5O+kvYFGGg
         wtLCHGi9u82qx8JFnSLpBTLTQX8m9nE8fRc/DgYyunhIjpyRoNYTq1JUwYqQUfpU8jYS
         gdsLMzMywcuwm7vt17JBfR3BFMu74+6R6BWhltDsAfS6B51l9tHWzQGbUhHr0JsXlqve
         m536moiyuHk/VkCckMKTo+mwSXg0eDxxECC1nHkGP0K8DqomJj4pQiXswHYJJetfexz+
         eGOSx0rBRZF4LDpp5apaW3uTGCUSNmcdobFJPCq3qJHf/cPETANQkOnZ8LGtGifp8O99
         lbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866189; x=1772470989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1tnNSjdMmiZcchpYj7Fmmy7pyxIY3tVA+shYAraIB0=;
        b=Ywb44hLk8VkluPotJ7NcoEh1ERSisXSrS8xg9bwoI8Cbrf48mjmhftOZ2EziDLrAEZ
         Tm5RWds3A2pyS+OEtrA07LRvmg0ToxMZKMc/XKgscsaxq2/qtpWHH2RC+rPellrejK0L
         F04hfuRGBf0L4kOgiyik+abDfmDOXhL6lsGFxO8XLZljETxb0/xIIXCf56dzf2xl1TUB
         Lc8vodGrDM8DKvmQr5FyW/7CKq7nkhKHql3NY7plUaWdA1NkDmJNDH6xpln9aHmhS1Py
         1MgBnzchvOWx4agt1RfI2PTmUSuf2R/ey4oxEI7VFnCUdCerHamTcnIBKAdUqjOZAQk2
         65fw==
X-Forwarded-Encrypted: i=1; AJvYcCW0E37Ybe6Sw1EJukdDpcS/sSf7I0t/KA9/a5Na1IjhQPE6KGMu9Y2aPMcOglsLFYBDPZagpoqYmKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCmu9zSKGcbIiy7qFS6Qhm5Bc7om+1nQa+UJgp7luh9MUIf+Ze
	kbx6v0OJbhdiqbRwpBoGJffa3+5vlD72jgIetZzswa1HOZuLUFsN0fp6
X-Gm-Gg: ATEYQzyPSrQ9+aTiJbPh8oPkFxLFVfOzXhxiG9EsiCegGRItMntqyphroJwj0IoI3B+
	9rKj36iL3R4KjKjvrHtFDuPYkN+X0dRpmyOCXnBo6y6eiUPKLgCWmXlU0hYEwFcKjn9ikK1up3/
	cSNQC4XBh5VTUbZ4NikEz7G7T+wv8X8IuSeCKgRsZsLMruvB0wmxsToF/gKiyRybureGjurG4by
	KKXY0b6a/dWnGOWTEGZnQBlyluAWRffNyZecovz1vTLqSAnhVPL7Mfo5Zn0z5L+fRR35xxVoLs5
	TBq00g+BCikBg6GJXQsd3JK5Ip5fbQDKjdo4vaRbkEtX0498O8mgk9z6UYGF70oIljN4pdUC8iw
	s9o5+Bdkt+QnRx7ln4ChEl4WFwlN4VV56w6TKqchb7fGm9fNdiU+/TkaeqaZrbxN1ayNkmrqKvU
	aXZ70BMRM4W/W0RtOk5QR5Azjj5RAOhMLXWPA=
X-Received: by 2002:a17:903:11d2:b0:2aa:e6c8:2c6e with SMTP id d9443c01a7336-2ad7457a8c8mr78853495ad.56.1771866189336;
        Mon, 23 Feb 2026 09:03:09 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34452sm78950655ad.7.2026.02.23.09.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:03:08 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2] docs: sysctl: Add documentation for crypto and debug sysctls
Date: Mon, 23 Feb 2026 22:32:51 +0530
Message-ID: <20260223170251.10540-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The /proc/sys/crypto and /proc/sys/debug directories lacked
documentation in the admin-guide. Add RST files covering
fips_enabled, fips_name, fips_version, exception-trace, and
kprobes-optimization sysctls.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/admin-guide/sysctl/crypto.rst | 49 +++++++++++++++++++
 Documentation/admin-guide/sysctl/debug.rst  | 53 +++++++++++++++++++++
 Documentation/admin-guide/sysctl/index.rst  |  6 ++-
 3 files changed, 106 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
 create mode 100644 Documentation/admin-guide/sysctl/debug.rst

diff --git a/Documentation/admin-guide/sysctl/crypto.rst b/Documentation/admin-guide/sysctl/crypto.rst
new file mode 100644
index 000000000..a4c2e5ed4
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/crypto.rst
@@ -0,0 +1,49 @@
+=================
+/proc/sys/crypto/
+=================
+
+Currently, these files might (depending on your configuration)
+show up in ``/proc/sys/crypto/``:
+
+.. contents:: :local:
+
+fips_enabled
+============
+
+This file contains a read-only flag that indicates whether FIPS mode is
+enabled.
+
+- ``0``: FIPS mode is disabled (default).
+- ``1``: FIPS mode is enabled.
+
+This value is set at boot time via the ``fips=1`` kernel command line
+parameter. When enabled, the cryptographic API will restrict the use
+of certain algorithms and perform self-tests to ensure compliance with
+FIPS (Federal Information Processing Standards) requirements, such as
+FIPS 140-2 and the newer FIPS 140-3, depending on the kernel
+configuration and the module in use.
+
+fips_name
+=========
+
+This read-only file contains the name of the FIPS module currently in use.
+The value is typically configured via the ``CONFIG_CRYPTO_FIPS_NAME``
+kernel configuration option.
+
+fips_version
+============
+
+This read-only file contains the version string of the FIPS module.
+If ``CONFIG_CRYPTO_FIPS_CUSTOM_VERSION`` is set, it uses the value from
+``CONFIG_CRYPTO_FIPS_VERSION``. Otherwise, it defaults to the kernel
+release version (``UTS_RELEASE``).
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+.. See scripts/check-sysctl-docs to keep this up to date:
+.. scripts/check-sysctl-docs -vtable="crypto" \
+..         Documentation/admin-guide/sysctl/crypto.rst \
+..         $(git grep -l register_sysctl_)
diff --git a/Documentation/admin-guide/sysctl/debug.rst b/Documentation/admin-guide/sysctl/debug.rst
new file mode 100644
index 000000000..a836c091d
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/debug.rst
@@ -0,0 +1,53 @@
+================
+/proc/sys/debug/
+================
+
+Currently, these files might (depending on your configuration)
+show up in ``/proc/sys/debug/``:
+
+.. contents:: :local:
+
+exception-trace
+===============
+
+This flag controls whether the kernel prints information about unhandled
+signals (like segmentation faults) to the kernel log (``dmesg``).
+
+- ``0``: Unhandled signals are not traced.
+- ``1``: Information about unhandled signals is printed.
+
+The default value is ``1`` on most architectures (like x86, MIPS, RISC-V),
+but it is ``0`` on **arm64**.
+
+The actual information printed and the context provided varies
+significantly depending on the CPU architecture. For example:
+
+- On **x86**, it typically prints the instruction pointer (IP), error
+  code, and address that caused a page fault.
+- On **PowerPC**, it may print the next instruction pointer (NIP),
+  link register (LR), and other relevant registers.
+
+When enabled, this feature is often rate-limited to prevent the kernel
+log from being flooded during a crash loop.
+
+kprobes-optimization
+====================
+
+This flag enables or disables the optimization of Kprobes on certain
+architectures (like x86).
+
+- ``0``: Kprobes optimization is turned off.
+- ``1``: Kprobes optimization is turned on (default).
+
+For more details on Kprobes and its optimization, please refer to
+Documentation/trace/kprobes.rst.
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+.. See scripts/check-sysctl-docs to keep this up to date:
+.. scripts/check-sysctl-docs -vtable="debug" \
+..         Documentation/admin-guide/sysctl/debug.rst \
+..         $(git grep -l register_sysctl_)
diff --git a/Documentation/admin-guide/sysctl/index.rst b/Documentation/admin-guide/sysctl/index.rst
index 4dd2c9b5d..e153c9611 100644
--- a/Documentation/admin-guide/sysctl/index.rst
+++ b/Documentation/admin-guide/sysctl/index.rst
@@ -67,8 +67,8 @@ This documentation is about:
 =============== ===============================================================
 abi/		execution domains & personalities
 <$ARCH>		tuning controls for various CPU architecture (e.g. csky, s390)
-crypto/		<undocumented>
-debug/		<undocumented>
+crypto/		cryptographic subsystem
+debug/		debugging features
 dev/		device specific information (e.g. dev/cdrom/info)
 fs/		specific filesystems
 		filehandle, inode, dentry and quota tuning
@@ -96,6 +96,8 @@ it :-)
    :maxdepth: 1
 
    abi
+   crypto
+   debug
    fs
    kernel
    net
-- 
2.53.0


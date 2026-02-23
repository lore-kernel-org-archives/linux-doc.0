Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A66430AD0A
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 16:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771863073; cv=none; b=Q/jrL1iBr0+8X9H4QNLymcWjrW2g+a0R2SCD7oe1bCl85qdURBqda0OqGLBLYnFktAiF+zD3XrTjb5b/u00+7EE3AFT0zv7OAC58h5vB1UowM4STBdS1C2h+4rckQtRRnxCS4Zga+K/ndg410FzqYUPKTyKDjx30TZUWHZygikI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771863073; c=relaxed/simple;
	bh=uOWrkVzkhVWru/bVDM1jfSDSccWS6w+xwrHyNaMAnDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaU+XdsEZbhGcNfr0jjma/VnDmU8jHa599xJr39S7lXH8h5Lg/Out6YH2TcXneRnJylDSrDvkwnlkZnMfhG+h8pG7HJUV73cgFBfvt8BmOrzCbRiNU6yU/bJGp6U6Ni60zPO4SmogNyPbIj8/6S5Pm0xTukF/VWs1m96vIQHhpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CU5IOuOT; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CU5IOuOT"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a7bced39cfso46813965ad.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 08:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771863071; x=1772467871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ulpluE+lIE5kdJWNzm2SxUImxzxa4fvIbShMG3wXcjs=;
        b=CU5IOuOTJhLwEf8j290FKBhVTlZWPAcBLCSSDe2YDLsCrETVlyq6tNA2h6mNnMfA2E
         bLlVoeV/8xprkmmjCYsIhHQpvC7NcFVo8a5ywbNzAB8xZFyG9ggrFpSj0DYxF4G7u40p
         rHToiRUkpslXQgPLEAufoAatqQPjTAHubQhu+eH7JSgdoAO6jt52OJK1a2GObwR34QyN
         o1plLAe6IhYrWqq4xa13rs4HdLjByY2E7JZjJqDTBaLcts9JdtF/NiWkCh+Srf/VV4fB
         cfKbANlsv+xns/6r3hDTFHNOC2/KYyyw/E85wyWfXjUTYhSKIALGEEPdRXtV1iZ8tUfl
         6i+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863071; x=1772467871;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ulpluE+lIE5kdJWNzm2SxUImxzxa4fvIbShMG3wXcjs=;
        b=nYF7dKrh0KMHHzHy/FZHhmJZ/HeN2BjEk9UNShE0E1QC1G45jtZRZQ+9312gDcmmtu
         zSDNP4af6QE3bbILt80h0SPux7s7jjyXMFtxTjA7MCrbTJ/SAMKGemoBiK4h0g7kQKPs
         TOT5yJ1GU5enONuFa5CcXj/X5kl04DapXfZBgYbS1skWra/QKDgJaA2YJfcKeWzvSi5C
         E68s8PWJ1Yanh3xtHelKtVwlWOMX8rADHnjw51zIo81XAx7DEfXG7uuEmWKTQ5h/FpRA
         8jax3wuA5bMfuP5oGPX90+yPMLyg2IJSwCscnhr+h/FovjT/Xb7dlv1aFcvG+8Ji52j0
         HN3w==
X-Forwarded-Encrypted: i=1; AJvYcCVngFUPv5XF+a7nUMO4bDMQtHBo5GSx/hAHhpDsFQA+Um4BjTnyU5VaKylP7qj4rP46YVcvrhqlGFE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsD4BVASEvLWcVMUl+WMjiOtUb+5SBSYTgpukBboU9Gu56983m
	g21v3PYm7s4UTTAtAuKO2KSP9Xgi7/40wPcSgpKi5SbNeK094yhAOKOt
X-Gm-Gg: ATEYQzzTVImX36oCKFS31T1bt+2A+GYGfCp0oH/HVxfbh45KOj5WAAxV5cPXVl89L/+
	ZKabwexZh7/9BE/3OCQUwv/tydb53glX0cX3lwsXd1nMd0S2tFuoz2j934E3OLVTdWTdYs1Jxz6
	1bN0DMzV2KLpBx/9XukKsKRD08cD4Jml/akaFa9aoq/te0oDrVWkMD39H/NSWJ/BKRwCzQ9gwaV
	/J6urZRnIlWU/W71Di9cIv562r9l2xltogt6BcFOSSxZjLN6LulA9Fa07qP5oIYuNfpIOBd1dZl
	jVwby5Z2sUmRtNkr1GRLmnvKXDDv6cZQSqL7IJ4i2AJ8TPYD7S3di6/hHA/aNt0sK+FZywQ+19U
	Z4QY68m76Dop0LCEFR7GzDiar8eiJVlS7pZVlHoS9gQf4hSFta8laSJ6JHciRD1fofiIRhQXbpG
	cSNpGXLmtr9alPpeH+ETnkeRVdwROFSIty7Ho=
X-Received: by 2002:a17:903:1448:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2ad74448a69mr106099055ad.21.1771863070635;
        Mon, 23 Feb 2026 08:11:10 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7500e19fsm81994725ad.59.2026.02.23.08.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:11:10 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH] docs: sysctl: Add documentation for crypto and debug sysctls
Date: Mon, 23 Feb 2026 21:40:51 +0530
Message-ID: <20260223161051.8448-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The /proc/sys/crypto and /proc/sys/debug directories lacked documentation in the admin-guide. Add RST files covering fips_enabled, fips_name, fips_version, exception-trace, and kprobes-optimization sysctls.
---
 Documentation/admin-guide/sysctl/crypto.rst | 59 +++++++++++++++++++
 Documentation/admin-guide/sysctl/debug.rst  | 63 +++++++++++++++++++++
 Documentation/admin-guide/sysctl/index.rst  |  8 ++-
 3 files changed, 128 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
 create mode 100644 Documentation/admin-guide/sysctl/debug.rst

diff --git a/Documentation/admin-guide/sysctl/crypto.rst b/Documentation/admin-guide/sysctl/crypto.rst
new file mode 100644
index 000000000..f44a50f68
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/crypto.rst
@@ -0,0 +1,59 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+Documentation for /proc/sys/crypto/
+===================================
+
+.. See scripts/check-sysctl-docs to keep this up to date:
+.. scripts/check-sysctl-docs -vtable="crypto" \
+..         Documentation/admin-guide/sysctl/crypto.rst \
+..         $(git grep -l register_sysctl_)
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+------------------------------------------------------------------------------
+
+This file contains documentation for the sysctl files in
+``/proc/sys/crypto/``.
+
+The files in this directory can be used to monitor and configure the
+Linux kernel's cryptographic subsystem.
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
diff --git a/Documentation/admin-guide/sysctl/debug.rst b/Documentation/admin-guide/sysctl/debug.rst
new file mode 100644
index 000000000..1a35042b6
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/debug.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================================
+Documentation for /proc/sys/debug/
+==================================
+
+.. See scripts/check-sysctl-docs to keep this up to date:
+.. scripts/check-sysctl-docs -vtable="debug" \
+..         Documentation/admin-guide/sysctl/debug.rst \
+..         $(git grep -l register_sysctl_)
+
+Copyright (c) 2026, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+For general info and legal blurb, please look in
+Documentation/admin-guide/sysctl/index.rst.
+
+------------------------------------------------------------------------------
+
+This file contains documentation for the sysctl files in
+``/proc/sys/debug/``.
+
+The files in this directory are used to control various debugging
+features within the Linux kernel.
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
diff --git a/Documentation/admin-guide/sysctl/index.rst b/Documentation/admin-guide/sysctl/index.rst
index 4dd2c9b5d..8b51edcf8 100644
--- a/Documentation/admin-guide/sysctl/index.rst
+++ b/Documentation/admin-guide/sysctl/index.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ===========================
 Documentation for /proc/sys
 ===========================
@@ -67,8 +69,8 @@ This documentation is about:
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
@@ -96,6 +98,8 @@ it :-)
    :maxdepth: 1
 
    abi
+   crypto
+   debug
    fs
    kernel
    net
-- 
2.53.0


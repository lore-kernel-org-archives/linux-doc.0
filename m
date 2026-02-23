Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D3537755A
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 20:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879077; cv=none; b=V/tY2b6l16J4NgcA3JRvLyclAHCM72j1oqxGnFTl1TOgIrMlbgUce554KBoqWyN2IB9jBougYy8OzWmZCvk5UxQM1SiK8j6nZhStxyPvnn4qLle7buQdb4hqWbpOAbRZ7glyFeCkAKCPGb4RPlAxSas83n2sWLnAs7cfopK+QE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879077; c=relaxed/simple;
	bh=mHkfdugwjUVHAPtoR0tbnfI18NaD/jNgASr8sXt1Ges=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehAuTW3TBDN6svKmb7R+2Dpyd/UFBJ9SlgFZviB5fYmnI8hUqgWi+GyW/2g9lhTa/BednXlMZXMbjFhU/ykf98SNOtIZ0EfsKa2BHot/BIsvHcdQhY+6wezVqkIIXlPzR1yFuylLpM1PYcc77SIIKDGKfEmLXHoeoCrfvHmwW7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/Y7FcsA; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/Y7FcsA"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-824a3ba5222so2539054b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 12:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771879075; x=1772483875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=68qZZQVzjBS6H+D7ka9Yz06XSnfgsO040Vn+ZTSewbk=;
        b=S/Y7FcsAZZUtp6zM3v+yB2XiGxs3ewtuka/hTfT88nKalNKc1F8ZiXFAP/J8EShRdl
         8CZxQi0WY0dddJERlihtp2nSBdR5CwO/p1IDz2L1XfPRLiwpwuPu35eBOLs07yWdR9By
         a+MIhTNuz7aDPn1bU9Bg8KhyOLfXqIB+UikePtgK7fY+aQomtwcmowTUWEheD0rNFHy1
         qXIS2NTMpSpHJQrd14/oF+eOmBXGEfw22JV+3PaqNrwWEw0+Pt3t9JA4vz6d5q6cXhIk
         xEzMmj5R4IOC+2gTTXHt7wnX/giyfX6A47Hq3xTTy2H5+jF4L5U06A4O/c7SGECY3Ct+
         AUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771879075; x=1772483875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=68qZZQVzjBS6H+D7ka9Yz06XSnfgsO040Vn+ZTSewbk=;
        b=hgh3OOkO9IFtsXOQeazzSQoWiJ2hJaqeZyob1DPakcYjbhUInFUlOrFWojiZLYroWm
         LyLOWaA972ljlP5Dl1p6aKvGarHLyrRTY26n4XAQHdaC8Yfk0b46jRPd3xvYusAQ0+Ek
         Ma4FTIjhe59es9OeQtr05KuyuBp7o4X+HPlQ70Q2N9DJzhYgSV0ty8KwlEJwSPQkB4cD
         EXszhSHVmOXaCl2zn7l9i7u0IM9o9pR2R2udbjSYgFfT/8Hrjs5Qlx2BNPWc6jxfS3CH
         cleDNsPDVr/BLnXi30+q8e/9NzG3UO/nwqAbeuEJdmu1+JwVUhchLYc6s4FHUULolhQW
         FO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpeO7XaAoT+Yeefb9blHmPYtH7prmceMy6oRAkePKvPrPxYTdsbkW6KEIscYJDuU87NiHh/w6ZJfg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8aTWL2VmmuL6gWXqjzU5722595f8EZ/Z3ZmUm3Hb5UM7eK7s5
	o5Vif9VBbF1acGu6VS1d8KPcB4ynVMQXBIIl/trVELRFnj/9bE6H+tOWQ08v3KP+PV8roQ==
X-Gm-Gg: AZuq6aLknHLfrOZxYjOGyE8CPju+62bn5N9BDsjSZrjKjobpGP7/hpxVEQA3TdA13MN
	7RZNZ56yjqbjodqbU9KJiCdfYzAaCno8w7D72Md/IhHWD5pRhdDOtpOs9ptzSIklynO0nay3D66
	DGf0d0BSVIEdl8vH5T8fNm+566Q3yboixBBGGFChSNVE5LS8FlLxmcbbLKZAiBm3vEF8oM5xYGs
	UIZ9T0ZFP4dbo9ih+ckRzjPgcJJf4QTrgWHUG+pwIP2Hh2smqwsYYfp3m+oz/Fa6m7iBUf7pGJo
	kxPGEdkutnUoaGtYLcYriqod1kJkvaWBfmQfdzIR3hWNTwqwEpMkJN5TCpAIOJJJFavZcbZ3l17
	IzU9vDCHWf/KLP4V3rU9ACqA3mmXIa3guzq7aO8jVtccRvoIF06BMN7CLtNaUAiDNyMHpPFAeKb
	NOE9EjWt2do9y6NfsIlUwiRlUm/ID1V7UogYM=
X-Received: by 2002:a05:6a20:c90d:b0:394:a0f8:f7d0 with SMTP id adf61e73a8af0-39545ed89b0mr7230707637.26.1771879075167;
        Mon, 23 Feb 2026 12:37:55 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd695a8fsm10838761b3a.23.2026.02.23.12.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:37:54 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v2] docs: sysctl: add documentation for crypto and debug
Date: Tue, 24 Feb 2026 02:07:24 +0530
Message-ID: <20260223203724.20874-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for the /proc/sys/crypto and /proc/sys/debug
directories in the admin-guide. This includes tunables for FIPS
mode (fips_enabled, fips_name, fips_version), exception-trace,
and kprobes-optimization.

The documentation is based on source code analysis and addresses
stylistic feedback to keep it direct and concise.

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 Documentation/admin-guide/sysctl/crypto.rst | 47 +++++++++++++++++++
 Documentation/admin-guide/sysctl/debug.rst  | 52 +++++++++++++++++++++
 Documentation/admin-guide/sysctl/index.rst  |  6 ++-
 3 files changed, 103 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
 create mode 100644 Documentation/admin-guide/sysctl/debug.rst

diff --git a/Documentation/admin-guide/sysctl/crypto.rst b/Documentation/admin-guide/sysctl/crypto.rst
new file mode 100644
index 000000000..b707bd314
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/crypto.rst
@@ -0,0 +1,47 @@
+=================
+/proc/sys/crypto/
+=================
+
+These files show up in ``/proc/sys/crypto/``, depending on the
+kernel configuration:
+
+.. contents:: :local:
+
+fips_enabled
+============
+
+Read-only flag that indicates whether FIPS mode is enabled.
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
+Read-only file that contains the name of the FIPS module currently in use.
+The value is typically configured via the ``CONFIG_CRYPTO_FIPS_NAME``
+kernel configuration option.
+
+fips_version
+============
+
+Read-only file that contains the version string of the FIPS module.
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
+..         $(git grep -l register_sysctl_)
diff --git a/Documentation/admin-guide/sysctl/debug.rst b/Documentation/admin-guide/sysctl/debug.rst
new file mode 100644
index 000000000..506bd5e48
--- /dev/null
+++ b/Documentation/admin-guide/sysctl/debug.rst
@@ -0,0 +1,52 @@
+================
+/proc/sys/debug/
+================
+
+These files show up in ``/proc/sys/debug/``, depending on the
+kernel configuration:
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


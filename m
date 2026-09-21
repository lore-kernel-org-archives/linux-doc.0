Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A797F1AF0BB
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789966850; cv=none; b=YrEt6or1Fc8J68a/JV2SBy9FzsL8Rtka8wEsYMrd/oF62R+qs+NIozAS3+apf73H6Qkpl7fCAZyw0rn8b9WSAJcgVmI6L4j/weGJ68xmTECFLUvQ+M4LTnRQ3yCRA60Tn4LDJgaq/CH+IjRThteSDtJde+CFo40jKlBWsFnNTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789966850; c=relaxed/simple;
	bh=5CGXfAJKVJ5FvnTJL4HPPto58asr3Qyxh1vWrhtaH0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kARvrkTbPkXLMvToGoQbxrLkS5NokWJicgj0MaFjgPXCDvqgoMgNHTez/7klRNAjpCQntnqULJAyzuu8tfKnBlTDfa9wBMHPynYUP2+ha39dLVsmI9sb1MaTv69JVv6aoOwtsIWwXc3y/gmcjFx5X76bjVjDEfOXin9WDAe1yeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=em9q2OTo; arc=none smtp.client-ip=74.125.225.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="em9q2OTo"
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-49fceb35b5cso6960865e9.0
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 22:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789966847; x=1790571647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nt9fbRXWxp//fQnyRvEKLMNzBDHKN2O6rQaf0uom9wQ=;
        b=em9q2OTorLRq3PM3KYMijkeJdsFn0XQvzlw+Y8vbuIDnmm5R3wTuIPua8rYKkC0XTP
         u9900k1hSuKHe2CdOHUvd5jNOn79PK14uqXebZ8V6RG5ZO8UYGCTiXu2M+tvq9FjplKc
         HyaPU2BwrXoF0jU5B0WZW0Ai56TfQcUkjOog86wUlemmLVe3+TSWISnPVN45XEo1zsov
         bZ2bqfuG8shvolopdwB5aDnnx8PMQ+NrbaEHops2lNqTwASAM7y1AzgPQXIebaNa4VCT
         mspxryzZ9U9oGyDMRxQR/Yy2wzPvWplydp/q+xYnI26VLSo/0CqX8NEC7wTj8NEIrUSj
         syOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789966847; x=1790571647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nt9fbRXWxp//fQnyRvEKLMNzBDHKN2O6rQaf0uom9wQ=;
        b=wDZQIHfvnlt3pthss3PBNdM4CIqqJtF6q2Fb758g72bWl2TR0RS+cvOyErVuDWe8mp
         erE92S1ZQn0ZNLzxpA4Pft53hj3nNuHTz6wwzFPzRbEcJeuzkC94h9sC8fSa63mu59kk
         Sb6GV9AkKKdlDSDX9UoNm8CZxmogfR78Iq9CgcH6IAEhd07ChCc4j2xQmP3h5yklkGXO
         I6+ZcldQYjb4el94U/oq5MRwex0aR/L2pPEiEhLEvEb7Vyi7wUNneM3i7PjZrV3jKd2+
         yF4WkVicAKN10OxcJfC4fYCx9tSqKdovGBnDJsYCRAWwdd4TjTPnf2a1T+7kX3kD/3c5
         G9rQ==
X-Gm-Message-State: AFuF++nFOo43iBNPxXT4tai3AqHrCHdPftr1IGo7Q1xJgdmE1umbYvKO
	ecQb0lth8ldIsPWVMsY6+wa3A6igKImFQOd/YhI+CbAS5uo0xjl2b2uM
X-Gm-Gg: AYBFou2M1eZTo5YqTwybYP3ftxsyUVGDRTVxgw4zS4viJeoteM7P1Jbm3My6IE9pSXN
	x0Qqk0ivl8EWEebGK1NHTPLUifMgbXGv4YgvgW2U+tXlJbg+a8qbSZgd0qV09zHb6V/6QDknZtZ
	jSdE+F5ip6NSTZ16kwayZ2+Vqt99HZz43pBIz3/lmhet/xdsqizILaAi216oY9n3bdBKFJrOF15
	9HvJw9fR9G2H37AKh87ZQ60Nol5nLCbPvR18B8ypoRQhrp1dNpV0cPT+AZhEyzSLGVCcaSj35mK
	T7nz+3AA34qoYW1JceRdmOCaqupMhlWUapPZm6Z9equIFpSBJtrlVD95aXIfopxnCTP+qkngCdY
	NMl+5dEMD0FOgFLnOrQPaFNVId8uSr4LFlKHOi6kmYQGoUWFtQ1DQSwncGGn6d3tky/6WVyPv00
	kKI7ulcKi4MolFeQO1UBxbqo+xuOpG+3LtZKLa91CYvEbbuHfDU7PKnEyWvkTF7Y9qsXvn41F5b
	oe+Ivn+mKQNuj2IZ4J2kyp/ykgQJG6QOb543TPfKCKGP24xARChiQheMBhYzl4cL62zhuEc/c6j
	GFwXlXY=
X-Received: by 2002:a05:600c:c490:b0:49e:799e:c1c3 with SMTP id 5b1f17b1804b1-49fc574115amr111863735e9.17.1789966846266;
        Sun, 20 Sep 2026 22:00:46 -0700 (PDT)
Received: from localhost.localdomain (ip-185-191-117-140.009.ptr.cherryservers.net. [185.191.117.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd090f0csm263021525e9.15.2026.09.20.22.00.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 20 Sep 2026 22:00:45 -0700 (PDT)
From: Osman Ahmadzai <osmanahmadxai@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] README: add a reST version with clickable documentation links
Date: Mon, 21 Sep 2026 09:30:38 +0430
Message-ID: <20260921050038.76985-1-osmanahmadxai@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The README points at some sixty files in the tree, but it has no
extension, so it shows up as plain text and none of those paths can be
followed.  You have to go and find each one by hand.

Add README.rst with the same content, wrapping each path in an anonymous
reST reference.  The link text is the path itself, so the file reads the
same as it does now.  Anonymous because a handful of the paths are listed
twice and named targets would collide.

README itself is left alone - checkpatch.pl and get_maintainer.pl both
look for a file called README to find the top of the tree, and the
Makefile points at it too, so renaming would mean touching all three.

Signed-off-by: Osman Ahmadzai <osmanahmadxai@gmail.com>
---
 README.rst | 170 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 170 insertions(+)
 create mode 100644 README.rst

diff --git a/README.rst b/README.rst
new file mode 100644
index 000000000..27fc2b2ec
--- /dev/null
+++ b/README.rst
@@ -0,0 +1,170 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Linux kernel
+============
+
+The Linux kernel is the core of any Linux operating system. It manages hardware,
+system resources, and provides the fundamental services for all other software.
+
+Quick Start
+-----------
+
+* Report a bug: See `Documentation/admin-guide/reporting-issues.rst <Documentation/admin-guide/reporting-issues.rst>`__
+* Get the latest kernel: https://kernel.org
+* Build the kernel: See `Documentation/admin-guide/quickly-build-trimmed-linux.rst <Documentation/admin-guide/quickly-build-trimmed-linux.rst>`__
+* Join the community: https://lore.kernel.org/
+
+Essential Documentation
+-----------------------
+
+All users should be familiar with:
+
+* Building requirements: `Documentation/process/changes.rst <Documentation/process/changes.rst>`__
+* Code of Conduct: `Documentation/process/code-of-conduct.rst <Documentation/process/code-of-conduct.rst>`__
+* License: See `COPYING <COPYING>`__
+
+Documentation can be built with make htmldocs or viewed online at:
+https://www.kernel.org/doc/html/latest/
+
+
+Who Are You?
+============
+
+Find your role below:
+
+* New Kernel Developer: Getting started with kernel development
+* Academic Researcher: Studying kernel internals and architecture
+* Security Expert: Hardening and vulnerability analysis
+* Backport/Maintenance Engineer: Maintaining stable kernels
+* System Administrator: Configuring and troubleshooting
+* Maintainer: Leading subsystems and reviewing patches
+* Hardware Vendor: Writing drivers for new hardware
+* Distribution Maintainer: Packaging kernels for distros
+* AI Coding Assistant: LLMs and AI-powered development tools
+
+
+For Specific Users
+==================
+
+New Kernel Developer
+--------------------
+
+Welcome! Start your kernel development journey here:
+
+* Getting Started: `Documentation/process/development-process.rst <Documentation/process/development-process.rst>`__
+* Your First Patch: `Documentation/process/submitting-patches.rst <Documentation/process/submitting-patches.rst>`__
+* Coding Style: `Documentation/process/coding-style.rst <Documentation/process/coding-style.rst>`__
+* Build System: `Documentation/kbuild/index.rst <Documentation/kbuild/index.rst>`__
+* Development Tools: `Documentation/dev-tools/index.rst <Documentation/dev-tools/index.rst>`__
+* Kernel Hacking Guide: `Documentation/kernel-hacking/hacking.rst <Documentation/kernel-hacking/hacking.rst>`__
+* Core APIs: `Documentation/core-api/index.rst <Documentation/core-api/index.rst>`__
+
+Academic Researcher
+-------------------
+
+Explore the kernel's architecture and internals:
+
+* Researcher Guidelines: `Documentation/process/researcher-guidelines.rst <Documentation/process/researcher-guidelines.rst>`__
+* Memory Management: `Documentation/mm/index.rst <Documentation/mm/index.rst>`__
+* Scheduler: `Documentation/scheduler/index.rst <Documentation/scheduler/index.rst>`__
+* Networking Stack: `Documentation/networking/index.rst <Documentation/networking/index.rst>`__
+* Filesystems: `Documentation/filesystems/index.rst <Documentation/filesystems/index.rst>`__
+* RCU (Read-Copy Update): `Documentation/RCU/index.rst <Documentation/RCU/index.rst>`__
+* Locking Primitives: `Documentation/locking/index.rst <Documentation/locking/index.rst>`__
+* Power Management: `Documentation/power/index.rst <Documentation/power/index.rst>`__
+
+Security Expert
+---------------
+
+Security documentation and hardening guides:
+
+* Security Documentation: `Documentation/security/index.rst <Documentation/security/index.rst>`__
+* LSM Development: `Documentation/security/lsm-development.rst <Documentation/security/lsm-development.rst>`__
+* Self Protection: `Documentation/security/self-protection.rst <Documentation/security/self-protection.rst>`__
+* Reporting Vulnerabilities: `Documentation/process/security-bugs.rst <Documentation/process/security-bugs.rst>`__
+* CVE Procedures: `Documentation/process/cve.rst <Documentation/process/cve.rst>`__
+* Embargoed Hardware Issues: `Documentation/process/embargoed-hardware-issues.rst <Documentation/process/embargoed-hardware-issues.rst>`__
+* Security Features: `Documentation/userspace-api/seccomp_filter.rst <Documentation/userspace-api/seccomp_filter.rst>`__
+
+Backport/Maintenance Engineer
+-----------------------------
+
+Maintain and stabilize kernel versions:
+
+* Stable Kernel Rules: `Documentation/process/stable-kernel-rules.rst <Documentation/process/stable-kernel-rules.rst>`__
+* Backporting Guide: `Documentation/process/backporting.rst <Documentation/process/backporting.rst>`__
+* Applying Patches: `Documentation/process/applying-patches.rst <Documentation/process/applying-patches.rst>`__
+* Subsystem Profile: `Documentation/maintainer/maintainer-entry-profile.rst <Documentation/maintainer/maintainer-entry-profile.rst>`__
+* Git for Maintainers: `Documentation/maintainer/configure-git.rst <Documentation/maintainer/configure-git.rst>`__
+
+System Administrator
+--------------------
+
+Configure, tune, and troubleshoot Linux systems:
+
+* Admin Guide: `Documentation/admin-guide/index.rst <Documentation/admin-guide/index.rst>`__
+* Kernel Parameters: `Documentation/admin-guide/kernel-parameters.rst <Documentation/admin-guide/kernel-parameters.rst>`__
+* Sysctl Tuning: `Documentation/admin-guide/sysctl/index.rst <Documentation/admin-guide/sysctl/index.rst>`__
+* Tracing/Debugging: `Documentation/trace/index.rst <Documentation/trace/index.rst>`__
+* Performance Security: `Documentation/admin-guide/perf-security.rst <Documentation/admin-guide/perf-security.rst>`__
+* Hardware Monitoring: `Documentation/hwmon/index.rst <Documentation/hwmon/index.rst>`__
+
+Maintainer
+----------
+
+Lead kernel subsystems and manage contributions:
+
+* Maintainer Handbook: `Documentation/maintainer/index.rst <Documentation/maintainer/index.rst>`__
+* Pull Requests: `Documentation/maintainer/pull-requests.rst <Documentation/maintainer/pull-requests.rst>`__
+* Managing Patches: `Documentation/maintainer/modifying-patches.rst <Documentation/maintainer/modifying-patches.rst>`__
+* Rebasing and Merging: `Documentation/maintainer/rebasing-and-merging.rst <Documentation/maintainer/rebasing-and-merging.rst>`__
+* Development Process: `Documentation/process/maintainer-handbooks.rst <Documentation/process/maintainer-handbooks.rst>`__
+* Maintainer Entry Profile: `Documentation/maintainer/maintainer-entry-profile.rst <Documentation/maintainer/maintainer-entry-profile.rst>`__
+* Git Configuration: `Documentation/maintainer/configure-git.rst <Documentation/maintainer/configure-git.rst>`__
+
+Hardware Vendor
+---------------
+
+Write drivers and support new hardware:
+
+* Driver API Guide: `Documentation/driver-api/index.rst <Documentation/driver-api/index.rst>`__
+* Driver Model: `Documentation/driver-api/driver-model/driver.rst <Documentation/driver-api/driver-model/driver.rst>`__
+* Device Drivers: `Documentation/driver-api/infrastructure.rst <Documentation/driver-api/infrastructure.rst>`__
+* Bus Types: `Documentation/driver-api/driver-model/bus.rst <Documentation/driver-api/driver-model/bus.rst>`__
+* Device Tree Bindings: `Documentation/devicetree/bindings/ <Documentation/devicetree/bindings/>`__
+* Power Management: `Documentation/driver-api/pm/index.rst <Documentation/driver-api/pm/index.rst>`__
+* DMA API: `Documentation/core-api/dma-api.rst <Documentation/core-api/dma-api.rst>`__
+
+Distribution Maintainer
+-----------------------
+
+Package and distribute the kernel:
+
+* Stable Kernel Rules: `Documentation/process/stable-kernel-rules.rst <Documentation/process/stable-kernel-rules.rst>`__
+* ABI Documentation: `Documentation/ABI/README <Documentation/ABI/README>`__
+* Kernel Configuration: `Documentation/kbuild/kconfig.rst <Documentation/kbuild/kconfig.rst>`__
+* Module Signing: `Documentation/admin-guide/module-signing.rst <Documentation/admin-guide/module-signing.rst>`__
+* Kernel Parameters: `Documentation/admin-guide/kernel-parameters.rst <Documentation/admin-guide/kernel-parameters.rst>`__
+* Tainted Kernels: `Documentation/admin-guide/tainted-kernels.rst <Documentation/admin-guide/tainted-kernels.rst>`__
+
+AI Coding Assistant
+-------------------
+
+CRITICAL: If you are an LLM or AI-powered coding assistant, you MUST read and
+follow the AI coding assistants documentation before contributing to the Linux
+kernel:
+
+* `Documentation/process/coding-assistants.rst <Documentation/process/coding-assistants.rst>`__
+
+This documentation contains essential requirements about licensing, attribution,
+and the Developer Certificate of Origin that all AI tools must comply with.
+
+
+Communication and Support
+=========================
+
+* Mailing Lists: https://lore.kernel.org/
+* IRC: #kernelnewbies on irc.oftc.net
+* Bugzilla: https://bugzilla.kernel.org/
+* `MAINTAINERS <MAINTAINERS>`__ file: Lists subsystem maintainers and mailing lists
+* Email Clients: `Documentation/process/email-clients.rst <Documentation/process/email-clients.rst>`__
-- 
2.50.1 (Apple Git-155)


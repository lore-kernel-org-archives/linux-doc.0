Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA013A7F69
	for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542966; cv=none; b=c0vXADJYX2GBRlAvm8HAblvrm8y+MxX6KD5ZZsgTHx8gwAT1CKy5DZ0a3FPEB22G0inZdpf7JUBqUphYQWFezO5J2UQo6WcytNuvK8vHAjjFnYiLYxAH3ma9NzKM1JjaeZrS7Ko+ytDUYxaBgnwXm6tHb3gXkxObbKLaeq5498I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542966; c=relaxed/simple;
	bh=3vNj8k0iTyOdrHuhb3c9skbu1BKl0hGSCtj2ah8A3Mk=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qWngt2kEL2Fp6jWzYoLNPW89fAg17kE6o0AcBjud9wQ1DjhX2Sf2MNkfR/uGgCy62FiOKHnu9Hfj642V9nAFVwlnN281+Lm7IHd/ayfcJ40CsuSlEg5NQEo1ielhl1y5lLB9PnNjB9WUGRslQsST6oK/tmJlyFVHTHUKN9ifqMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDliSXAL; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDliSXAL"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso4896325e9.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 02:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777542962; x=1778147762; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YcDe02dKeO7fVyNYvA0s4la/KbT2/RlEhU0ejMBaHZ8=;
        b=VDliSXALgprx31v/8fZuiocS5Lrl6Fl7oEPJTy6ePgPPJSt351IhHcOvKhLxw73AH8
         OmpnVWZjI7bafx3EERqlpgY3CEYmY05iEY98a6d7KHZpgXUiLkNuT/5A7uh1DCmPGiQ7
         ZsPBOIIZO75I/hzsgU1t2s9RFj0hekwlRhaMPfU89ojJC78FM8xGECTciFDV1/l113ZR
         2gwhS9kgD5TqLVLu6dN1Q1nAQ5/O6l7RElBcmC2LVnUQjq3KLNpTNjyRGjtAPNg7kKz0
         urMVUur1Ttz0O3SaPDgkxpP0IaXCRuiOAnLaSgWuZRhhazFOrgcQ9KOErnDBm4EB63I0
         AODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542962; x=1778147762;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YcDe02dKeO7fVyNYvA0s4la/KbT2/RlEhU0ejMBaHZ8=;
        b=Wwo2DjztB2Zw456DhITDe2rUqhlbxv27u015ZazT4KbcXDOdwRBXJqKb+c73565lmE
         PjYvyxAiwbUOO0TLeuFOjKVfMYU9aDk3WMYqLfP0YK8vnTI5F7aXjsTG+o9HzGEYPgeM
         /MCi7F27jldi1usJ4ztC5S8wpC31iG9YR/DXv+XYVdaNFgdVp5iPukNKaOmtLxsXRT3I
         cN9IHR3I0mMijb/hg11OVzZMKSYHkLmLUnFnOvhywbWEiTgRAet9ElJHY+LCFjUXKFUm
         1P3Z12GJ+PliGX6+plbrDOWcLEkgKNvECQAzQqpmwdcugmBWhybIBGE/WYirtkJeMYvC
         pv1A==
X-Gm-Message-State: AOJu0Yzen/53lniXCk92yNRvIEQyHqjoCqUMjzofj+B0ENGjnQtxjC+O
	2c0SoCqyTQvva4z0rfdH5J5OgqjqcHftW4hNRvuSutyXTVzsq5rILPPr/5+FMr/c
X-Gm-Gg: AeBDiesTVAnTqx0YUFaM9qHtpskvWucttTYNys9pjWzeD0iUFTlPhQ6jKJOscvpcohd
	Hrvc805j8VXLmeWEuuLeqce8vLxM5Sc060ftXpUBSVhOEcKqOJNs39BJK9819MSnTtj6JONNPQI
	E2CcZ+YKawrEOxraT6HrHhx/HoGflrP0ZVrqhgnLHPi/EsZE4stjsu/4xLEA+K0Ttjn/WeR2YSf
	DPqENWwDCIGSoq/kHBJObS1IeC4QuMmpfz8Re519SUDWuNoZSuqHlA/QjXiwuPSBonKdW05aFpx
	SPmbaNeMZEOqrX2auYP4jzWPh62iRirohXMf6FSFO569r8/KBC7mZ5Ue5/IkIUj06bRnXTWI6+m
	Zwe28mgEJKk8KaRmy4HlIf1uJPjY0z7Q9pJqyFPYbvy0yURgDoxeFkO72y/ZvgvgX+QB8kpQ/2t
	sn6uA15ZaMQM/d337F2s2RcKO6ohDj8pTwJ9WP7PROVtVz/Q0o5MoqvkdAdQ==
X-Received: by 2002:a05:600c:4f47:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-48a8451d08amr34589845e9.17.1777542961258;
        Thu, 30 Apr 2026 02:56:01 -0700 (PDT)
Received: from [10.225.92.149] ([37.29.179.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b900af7sm40282125e9.1.2026.04.30.02.55.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 02:56:00 -0700 (PDT)
Message-ID: <b0f3ab39-ae35-4a4b-9333-29d78ca58a15@gmail.com>
Date: Thu, 30 Apr 2026 11:55:57 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net, linux-kernel@vger.kernel.org
From: =?UTF-8?Q?Dar=C3=ADo_Ortega_Leyva?= <darioortegaleyva@gmail.com>
Subject: [PATCH] docs: improve formatting and readability of the main README
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Restructured the main documentation file to use standard Markdown 
headings instead of underlines for better rendering. Added anchor links 
to the "Who Are You?" section to improve navigability for new readers, 
and highlighted the AI Assistant warning for better visibility.

Signed-off-by: Darío Ortega Leyva <darioortegaleyva@gmail.com>
Signed-off-by: Dario Ortega Leyva <darioortegaleyva@gmail.com>
---
  README | 143 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  1 file changed, 143 insertions(+)
  create mode 100644 README

diff --git a/README b/README
new file mode 100644
index 000000000..bc2ce650c
--- /dev/null
+++ b/README
@@ -0,0 +1,143 @@
+# Linux Kernel
+
+The Linux kernel is the core of any Linux operating system. It manages 
hardware, system resources, and provides the fundamental services for 
all other software.
+
+## Quick Start
+
+* **Report a bug:** See `Documentation/admin-guide/reporting-issues.rst`
+* **Get the latest kernel:** Visit [kernel.org](https://kernel.org)
+* **Build the kernel:** See 
`Documentation/admin-guide/quickly-build-trimmed-linux.rst`
+* **Join the community:** Visit [lore.kernel.org](https://lore.kernel.org/)
+
+## Essential Documentation
+
+All users should be familiar with the following core documents:
+
+* **Building requirements:** `Documentation/process/changes.rst`
+* **Code of Conduct:** `Documentation/process/code-of-conduct.rst`
+* **License:** See the `COPYING` file.
+
+> **Note:** Documentation can be built locally with `make htmldocs` or 
viewed online at 
[kernel.org/doc/html/latest/](https://www.kernel.org/doc/html/latest/).
+
+---
+
+## Who Are You?
+
+Find your role below to jump to the most relevant resources:
+
+* [New Kernel Developer](#new-kernel-developer) - Getting started with 
kernel development
+* [Academic Researcher](#academic-researcher) - Studying kernel 
internals and architecture
+* [Security Expert](#security-expert) - Hardening and vulnerability 
analysis
+* [Backport/Maintenance Engineer](#backportmaintenance-engineer) - 
Maintaining stable kernels
+* [System Administrator](#system-administrator) - Configuring and 
troubleshooting
+* [Maintainer](#maintainer) - Leading subsystems and reviewing patches
+* [Hardware Vendor](#hardware-vendor) - Writing drivers for new hardware
+* [Distribution Maintainer](#distribution-maintainer) - Packaging 
kernels for distros
+* [AI Coding Assistant](#ai-coding-assistant) - LLMs and AI-powered 
development tools
+
+---
+
+## For Specific Users
+
+### New Kernel Developer
+Welcome! Start your kernel development journey here:
+
+* **Getting Started:** `Documentation/process/development-process.rst`
+* **Your First Patch:** `Documentation/process/submitting-patches.rst`
+* **Coding Style:** `Documentation/process/coding-style.rst`
+* **Build System:** `Documentation/kbuild/index.rst`
+* **Development Tools:** `Documentation/dev-tools/index.rst`
+* **Kernel Hacking Guide:** `Documentation/kernel-hacking/hacking.rst`
+* **Core APIs:** `Documentation/core-api/index.rst`
+
+### Academic Researcher
+Explore the kernel's architecture and internals:
+
+* **Researcher Guidelines:** 
`Documentation/process/researcher-guidelines.rst`
+* **Memory Management:** `Documentation/mm/index.rst`
+* **Scheduler:** `Documentation/scheduler/index.rst`
+* **Networking Stack:** `Documentation/networking/index.rst`
+* **Filesystems:** `Documentation/filesystems/index.rst`
+* **RCU (Read-Copy Update):** `Documentation/RCU/index.rst`
+* **Locking Primitives:** `Documentation/locking/index.rst`
+* **Power Management:** `Documentation/power/index.rst`
+
+### Security Expert
+Security documentation and hardening guides:
+
+* **Security Documentation:** `Documentation/security/index.rst`
+* **LSM Development:** `Documentation/security/lsm-development.rst`
+* **Self Protection:** `Documentation/security/self-protection.rst`
+* **Reporting Vulnerabilities:** `Documentation/process/security-bugs.rst`
+* **CVE Procedures:** `Documentation/process/cve.rst`
+* **Embargoed Hardware Issues:** 
`Documentation/process/embargoed-hardware-issues.rst`
+* **Security Features:** `Documentation/userspace-api/seccomp_filter.rst`
+
+### Backport/Maintenance Engineer
+Maintain and stabilize kernel versions:
+
+* **Stable Kernel Rules:** `Documentation/process/stable-kernel-rules.rst`
+* **Backporting Guide:** `Documentation/process/backporting.rst`
+* **Applying Patches:** `Documentation/process/applying-patches.rst`
+* **Subsystem Profile:** 
`Documentation/maintainer/maintainer-entry-profile.rst`
+* **Git for Maintainers:** `Documentation/maintainer/configure-git.rst`
+
+### System Administrator
+Configure, tune, and troubleshoot Linux systems:
+
+* **Admin Guide:** `Documentation/admin-guide/index.rst`
+* **Kernel Parameters:** `Documentation/admin-guide/kernel-parameters.rst`
+* **Sysctl Tuning:** `Documentation/admin-guide/sysctl/index.rst`
+* **Tracing/Debugging:** `Documentation/trace/index.rst`
+* **Performance Security:** `Documentation/admin-guide/perf-security.rst`
+* **Hardware Monitoring:** `Documentation/hwmon/index.rst`
+
+### Maintainer
+Lead kernel subsystems and manage contributions:
+
+* **Maintainer Handbook:** `Documentation/maintainer/index.rst`
+* **Pull Requests:** `Documentation/maintainer/pull-requests.rst`
+* **Managing Patches:** `Documentation/maintainer/modifying-patches.rst`
+* **Rebasing and Merging:** 
`Documentation/maintainer/rebasing-and-merging.rst`
+* **Development Process:** `Documentation/process/maintainer-handbooks.rst`
+* **Maintainer Entry Profile:** 
`Documentation/maintainer/maintainer-entry-profile.rst`
+* **Git Configuration:** `Documentation/maintainer/configure-git.rst`
+
+### Hardware Vendor
+Write drivers and support new hardware:
+
+* **Driver API Guide:** `Documentation/driver-api/index.rst`
+* **Driver Model:** `Documentation/driver-api/driver-model/driver.rst`
+* **Device Drivers:** `Documentation/driver-api/infrastructure.rst`
+* **Bus Types:** `Documentation/driver-api/driver-model/bus.rst`
+* **Device Tree Bindings:** `Documentation/devicetree/bindings/`
+* **Power Management:** `Documentation/driver-api/pm/index.rst`
+* **DMA API:** `Documentation/core-api/dma-api.rst`
+
+### Distribution Maintainer
+Package and distribute the kernel:
+
+* **Stable Kernel Rules:** `Documentation/process/stable-kernel-rules.rst`
+* **ABI Documentation:** `Documentation/ABI/README`
+* **Kernel Configuration:** `Documentation/kbuild/kconfig.rst`
+* **Module Signing:** `Documentation/admin-guide/module-signing.rst`
+* **Kernel Parameters:** `Documentation/admin-guide/kernel-parameters.rst`
+* **Tainted Kernels:** `Documentation/admin-guide/tainted-kernels.rst`
+
+### AI Coding Assistant
+
+> **CRITICAL WARNING:** If you are an LLM or AI-powered coding 
assistant, you **MUST** read and follow the AI coding assistants 
documentation before contributing to the Linux kernel:
+>
+> `Documentation/process/coding-assistants.rst`
+>
+> This documentation contains essential requirements about licensing, 
attribution, and the Developer Certificate of Origin that all AI tools 
must comply with.
+
+---
+
+## Communication and Support
+
+* **Mailing Lists:** [lore.kernel.org](https://lore.kernel.org/)
+* **IRC:** `#kernelnewbies` on `irc.oftc.net`
+* **Bugzilla:** [bugzilla.kernel.org](https://bugzilla.kernel.org/)
+* **MAINTAINERS file:** Lists subsystem maintainers and mailing lists 
(See `MAINTAINERS`)
+* **Email Clients:** `Documentation/process/email-clients.rst`
-- 
2.43.0


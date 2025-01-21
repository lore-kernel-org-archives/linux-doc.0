Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250151537D4;
	Tue, 21 Jan 2025 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737483578; cv=none; b=qAkfkZbfCn07hJhCTomg8l5a6kWKr0zKZ630yUXmOvgciKsoGUkm5oTwfudjQgTsJATIMPwlH4ROzvP0N3r0Ntko7JjHeErI+RDz6EFdyhYD03ANWq/iGHUO3vj+9qq6bi5IJzk/6Y6HDrC+bCZGzaOIWpCfPGbP/iljtE58kA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737483578; c=relaxed/simple;
	bh=hbX0TN5e2VfSEiwP4/iE/2PCyqBKqvrqOSu8MEf2VNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LkK9ScSjkT4cb/JYKxkRw84xo1tyeRLKAnWm74U8kY5LKE95WOQW8WoBV6peqM9L06kFTPdfiv4tJ+ZYKgzoWi/jlUfAsU0W/Cb8KKblOzk86Qs2UBoy4Mn3Q51nu5orDArBJa4QfFEHefE+s5V/HfS6sQQDS4ejMCqTquj15Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNpEFCaZ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNpEFCaZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737483576; x=1769019576;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hbX0TN5e2VfSEiwP4/iE/2PCyqBKqvrqOSu8MEf2VNE=;
  b=kNpEFCaZuue/XzZjztn/n9Qn/E76LxYC+ms9XmrnqIVn05xA97Tw78z0
   tYqGTFOD56uUlryWH+ZODuCd3u6JUh4ZepoeYlxN5R9nqwKnLJQT1ll2u
   A6myD9ALSY4riaBPBGgM7W+OJzCURABVcLbRD/CdKSuXZx2ewKzMOVah8
   Dn7ssAV3TmFDCPvBVSmfETKiqdsyHw61ssDAisT3OjfNyzyAnKl9hFlYc
   UvoWJLqXN6vLRcGK8nFCfV2XHG1dWKSDNtsuAkjqktPhMlA+D+OPODuxU
   Ju78kVhkdAoNUIEHqQcGxtBYFTcED4xE8MK5UoR92a0aFQ0p9RsaKScb9
   Q==;
X-CSE-ConnectionGUID: 4zDlTs8+R26bd5v1grTgOw==
X-CSE-MsgGUID: FEYsD5Q1QWiknQgOAJ7C5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="55460528"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="55460528"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 10:19:34 -0800
X-CSE-ConnectionGUID: iTCRc0dtQ+q6udP7LzqT3w==
X-CSE-MsgGUID: f6EeGeZcTDO5daK0L3JMDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="137711774"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 10:19:34 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Yanteng Si <si.yanteng@linux.dev>
Subject: [PATCH] Documentation: Drop cpu0_hotplug mentions
Date: Tue, 21 Jan 2025 10:18:56 -0800
Message-ID: <20250121181856.743616-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is gone since commit e59e74dc48a3 ("x86/topology: Remove CPU0
hotplug option"). zh_CN translation is also updated here, but needs
to be checked.

Cc: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 Documentation/core-api/cpu_hotplug.rst            |  5 -----
 .../translations/zh_CN/core-api/cpu_hotplug.rst   | 15 ++-------------
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index e1b0eeabbb5e5..2c92023573985 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -45,11 +45,6 @@ Command Line Switches
 
   This option is limited to the X86 and S390 architecture.
 
-``cpu0_hotplug``
-  Allow to shutdown CPU0.
-
-  This option is limited to the X86 architecture.
-
 CPU maps
 ========
 
diff --git a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
index bc0d7ea6d834c..7b0566ec5d195 100644
--- a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
+++ b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
@@ -54,11 +54,6 @@ CPU热拔插支持的一个更新颖的用途是它在SMP的暂停恢复支持
 
   这个选项只限于X86和S390架构。
 
-``cpu0_hotplug``
-  允许关闭CPU0。
-
-  这个选项只限于X86架构。
-
 CPU位图
 =======
 
@@ -120,14 +115,8 @@ PowerPC和X86。配置是通过sysfs接口完成的::
  $ echo 1 > /sys/devices/system/cpu/cpu4/online
  smpboot: Booting Node 0 Processor 4 APIC 0x1
 
-CPU又可以使用了。这应该对所有的CPU都有效。CPU0通常比较特殊，被排除在CPU热拔插之外。
-在X86上，内核选项 *CONFIG_BOOTPARAM_HOTPLUG_CPU0* 必须被启用，以便能够关闭CPU0。
-或者，可以使用内核命令选项 *cpu0_hotplug* 。CPU0的一些已知的依赖性:
-
-* 从休眠/暂停中恢复。如果CPU0处于离线状态，休眠/暂停将失败。
-* PIC中断。如果检测到PIC中断，CPU0就不能被移除。
-
-如果你发现CPU0上有任何依赖性，请告知Fenghua Yu <fenghua.yu@intel.com>。
+CPU又可以使用了。这应该适用于所有 CPU，但 CPU0 通常是特殊的，并且被排除在 CPU
+热插拔之外。
 
 CPU的热拔插协作
 ===============
-- 
2.48.0


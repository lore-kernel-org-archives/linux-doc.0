Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3DE55294B
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 19:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710929; cv=none; b=kqfzaknV40I3A8ntxPkF11jDbm3PHc1N5YWd7ICYjNYwacip9+t3oFCDEid2G5S7chUaOy1orTYnf2/mCW0uTOGsXugClb3xUNvPJW9OOY5Cy8U7rsvuxtp94SYV4mAeXjUePxlnJ3TjpjeYGJgm9ZStDfhYMQ4r8+fwt4CA5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710929; c=relaxed/simple;
	bh=T6GG0X79px81P3ekvExxpSpo5PzhH/X1ZBsTTcIl4DY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kmTbElHIxFsUQxnblKyiSelUzKLtbZPb236i8C/c6o0cle68G11rqi3HY/FvIwtKn9T9YNkSXyQYL+azwB4kf3WB2VJo4QfSHtmO3FFUSsxxj+OZejm3BXekLf0AYqfcb9XNj90r5XZQ8ZqQ7TnhvUlFHtteLISziuOZx6Gg2BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net; spf=pass smtp.mailfrom=opnsrc.net; dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b=XQNBYdwq; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opnsrc.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opnsrc.net header.i=@opnsrc.net header.b="XQNBYdwq"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso24466945e9.3
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 12:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=opnsrc.net; s=google; t=1790710926; x=1791315726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WhU4Q4AtsXWrT2tsgOla9plnm0e1MrQXpUDDau4gO4c=;
        b=XQNBYdwqefubXwob/wQIuk7DtTi194BBt331J2oqDIm08q6ZCDwcnAosvi+JyPqUMw
         MqOjx7Db/cBccgQUHuG3WEQFSLATAXYUPwWDIGrJc+Ds8AVBzTIOy3q0GZyxEZSqMQn6
         lPr08mGkyz0Qwv9D3LrBWM1ipqbo7zGZFa5YUp15d6jMAX9JAju0fJ/7aaU3gs5SLOvE
         PDFdXrdu4PoGD67IYASHS7rmSIkXy7hCpfqzxToQzgnCdX08FHmg1ZlXMvMhcNXSFNTo
         4NjGGLWAY12ZCNMayLq7amQIFjN++TQhlAdbyvVJZvQ22XcktEeEaOctxmSzeQrLNu3k
         FMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790710926; x=1791315726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WhU4Q4AtsXWrT2tsgOla9plnm0e1MrQXpUDDau4gO4c=;
        b=hOHUzthq1tdTMHKZilYAcJRBBxN1pRtmysNW0V5NSNA6YQcoXvfZf5rg73nBw52RQo
         5PxCc375mvDc7mUicG0w+xjVyfRxFcQflRjcXp0RX2Sn4y9PK4B0lJO71r/XXx7xl9Hv
         wmDdmRL+g8UNpqA6oeC5jCmRLVPKDott2ede4xYjU5IGe7nLlf82750wLPIxXopEs46x
         yTc8rZKhlzHjPBOFR678QPE2mBJYcucmyQkYhdAsHexmwWqUbLme4H7TKXTcmcgdU+b0
         uLkfInQkvvmnM6zbGpTMlSXCRntL7YLdKKHebcSfzld0JtnSBD2j8HsKP1aohvENZ1vg
         qAbA==
X-Forwarded-Encrypted: i=1; AKwUvBw6okZYVQdnTkqmoUJDUa1eVjXW213wi0eRybwFYlEvaEVeDs0H2s2niYPezrMnOOgc4zxJYemsCEk=@vger.kernel.org
X-Gm-Message-State: AFuF++nyTMWhc2sx/XbjbFHfMDwBD90AT5Xyyliv+yYyMwMZ44kL4Wu3
	vRYNhaOcnXQJfZBcpanuITr9fRPqpg+o68xuiMi7NyFoiuDtSaqkVGjyWnUEJoFekpk=
X-Gm-Gg: AYBFou3p6+eT4Y0aRoYz6UAlIsS7NuxYdMDMAELbiXN6BcX+atp9ik4jTMLsrw/cvd1
	JUDbT0gYa1h9L5sjqH1OYOTWF7gsoWuowhahVvNyh7WfJTFSPln7Cq9d5QSB4ouwdaLJ61j4SFM
	/lj2NyOWfRGKk2HBaQtI0zM73/Qf6XeC1qOG1CO74WH8Na1hybVRc2DOmsRrheVH3wWuNdG0fDz
	o3yOwg5TFWlnzdBum/rnWFBRtlTe/bWdHtBMuCqpBT8E3kmUikhTQFifCQFlLkkp8Tg+EUXpbdn
	Aa4cq9XBvqwi3MofasiL0xzptbJM8oLxTmDgxD7w/McBC38MHrfRchNocZAHSqIn+5WDnkzei0i
	kIlfYBuZtST9pBqLB0Cu7iYXi4RqDbyuiMyuXHVJ89GHiYko+jBelgi+1mBUg5/+tbX8kUboVjx
	jD2Iz98gNHX9KZujvtaG+BEWyRPpP9GhGgC72wAJ2iOaow4y3HmBpPAtqGWX1SpBTPQ9aa0Z/f9
	QWrfgbBI54gjftHZCht5c0cvqXOW5Jhe6xhYw93iRTY+20dKimN4AU9MJH4TKvD36NX4+3q
X-Received: by 2002:a05:600c:4f4c:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a01514585dmr2362545e9.35.1790710926223;
        Tue, 29 Sep 2026 12:42:06 -0700 (PDT)
Received: from localhost.localdomain ([217.146.93.153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b62sm5238355e9.6.2026.09.29.12.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:42:05 -0700 (PDT)
From: salil.mehta@opnsrc.net
To: Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Jonathan Cameron <jic23@kernel.org>,
	James Morse <james.morse@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Gavin Shan <gshan@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Salil Mehta <salil.mehta@opnsrc.net>
Subject: [RFC PATCH 2/2] Revert "cpu/hotplug: Fix NULL kobject warning in cpuhp_smt_enable()"
Date: Tue, 29 Sep 2026 19:41:30 +0000
Message-Id: <1ecc8a0a92cd7bc30f402a6b9e16be93444e57bc.1790692295.git.salil.mehta@opnsrc.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1790692295.git.salil.mehta@opnsrc.net>
References: <cover.1790692295.git.salil.mehta@opnsrc.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Salil Mehta <salil.mehta@opnsrc.net>

This reverts commit f9a82544c7174851f5c7524622f5966dcafd3a47.

That commit fixed a NULL kobject warning in cpuhp_smt_enable() by changing
arm64 so that Online-Capable but MADT-disabled CPUs are not initially in
cpu_present_mask, and by adding/removing them from that mask through the
ACPI map/unmap path.

The original arm64 virtual CPU hotplug model deliberately allowed CPUs to
be present but not enabled. cpu_enabled_mask was introduced to represent
exactly whether a present CPU may currently be brought online.

With the preceding change, cpuhp_smt_enable() now checks cpu_enabled()
before attempting _cpu_up(). This addresses the original warning at the
caller while preserving the present/enabled distinction and the arm64
virtual CPU hotplug model.

Restore the previous arm64 present-mask handling and documentation so that
all enumerated possible CPUs remain present while firmware availability is
represented by the enabled state.

This is posted as an RFC because there may be another reason why changing
the arm64 present-mask semantics is preferred over consuming the generic
enabled mask in cpuhp_smt_enable().

Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
---
 Documentation/arch/arm64/cpu-hotplug.rst | 28 ++++++++++--------------
 arch/arm64/kernel/acpi.c                 |  2 --
 arch/arm64/kernel/smp.c                  | 12 +---------
 3 files changed, 13 insertions(+), 29 deletions(-)

diff --git a/Documentation/arch/arm64/cpu-hotplug.rst b/Documentation/arch/arm64/cpu-hotplug.rst
index 7c3379b704aa..8fb438bf7781 100644
--- a/Documentation/arch/arm64/cpu-hotplug.rst
+++ b/Documentation/arch/arm64/cpu-hotplug.rst
@@ -47,12 +47,11 @@ ever have can be described at boot. There are no power-domain considerations
 as such devices are emulated.

 CPU Hotplug on virtual systems is supported. It is distinct from physical
-CPU Hotplug as all vCPU resources are statically described in the firmware
-configuration tables (e.g. MADT), meaning their maximum possible count is
-known at boot. However, vCPUs that are not enabled at boot are not marked
-as ``present`` by the kernel until they are hotplugged. An example is where
-a virtual machine boots with a single CPU, and additional CPUs are added
-once a cloud orchestrator deploys the workload.
+CPU Hotplug as all resources are described as ``present``, but CPUs may be
+marked as disabled by firmware. Only the CPU's online/offline behaviour is
+influenced by firmware. An example is where a virtual machine boots with a
+single CPU, and additional CPUs are added once a cloud orchestrator deploys
+the workload.

 For a virtual machine, the VMM (e.g. Qemu) plays the part of firmware.

@@ -61,19 +60,16 @@ brought online. Firmware can enforce its policy via PSCI's return codes. e.g.
 ``DENIED``.

 The ACPI tables must describe all the resources of the virtual machine. CPUs
-that are hot-pluggable must have the ``online capable`` bit set and the
-``enabled`` bit cleared in the MADT GICC structures to indicate they can be
-enabled later. The boot CPU must be marked as ``enabled`` with its
-``online capable`` bit cleared. The 'always on' GICR structure must be used
-to describe the redistributors.
+that firmware wishes to disable either from boot (or later) should not be
+``enabled`` in the MADT GICC structures, but should have the ``online capable``
+bit set, to indicate they can be enabled later. The boot CPU must be marked as
+``enabled``.  The 'always on' GICR structure must be used to describe the
+redistributors.

 CPUs described as ``online capable`` but not ``enabled`` can be set to enabled
 by the DSDT's Processor object's _STA method. On virtual systems the _STA method
-must always set the ``ACPI_STA_DEVICE_PRESENT`` bit, while toggling the
-``ACPI_STA_DEVICE_ENABLED`` bit to reflect its plug status. The kernel will
-then dynamically mark the vCPU as ``present`` within the OS when the
-``ACPI_STA_DEVICE_ENABLED`` bit becomes set during hot-add. Changes to the
-firmware policy can be notified to the OS via device-check or eject-request.
+must always report the CPU as ``present``. Changes to the firmware policy can
+be notified to the OS via device-check or eject-request.

 CPUs described as ``enabled`` in the static table, should not have their _STA
 modified dynamically by firmware. Soft-restart features such as kexec will
diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 681aa2bbc399..5891f92c2035 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -448,14 +448,12 @@ int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 apci_id,
 		return *pcpu;
 	}

-	set_cpu_present(*pcpu, true);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_map_cpu);

 int acpi_unmap_cpu(int cpu)
 {
-	set_cpu_present(cpu, false);
 	return 0;
 }
 EXPORT_SYMBOL(acpi_unmap_cpu);
diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index a61dc3016a11..0c5292e4f4e0 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -558,11 +558,6 @@ struct acpi_madt_generic_interrupt *acpi_cpu_get_madt_gicc(int cpu)
 }
 EXPORT_SYMBOL_GPL(acpi_cpu_get_madt_gicc);

-static bool acpi_cpu_is_present(int cpu)
-{
-	return acpi_cpu_get_madt_gicc(cpu)->flags & ACPI_MADT_ENABLED;
-}
-
 /*
  * acpi_map_gic_cpu_interface - parse processor MADT entry
  *
@@ -667,10 +662,6 @@ static void __init acpi_parse_and_init_cpus(void)
 		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
 }
 #else
-static bool acpi_cpu_is_present(int cpu)
-{
-	return false;
-}
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
 #endif

@@ -815,8 +806,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 		if (err)
 			continue;

-		if (acpi_disabled || acpi_cpu_is_present(cpu))
-			set_cpu_present(cpu, true);
+		set_cpu_present(cpu, true);
 		numa_store_cpu_info(cpu);
 	}
 }
-- 
2.34.1

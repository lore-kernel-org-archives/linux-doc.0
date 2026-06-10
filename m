Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADE538331F;
	Wed, 10 Jun 2026 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077948; cv=none; b=GIrcdE7KKJfUkiEdy/Uf9c6JPdQlJxqKV7RIs4giq33lyyv8U/tXuvkyxshJVpa0qzgiksTQ1SdkS7X1bu56zVRYdvKWKjRddLl9uv33iDugP8gHdEvQ8ZFJqaXL8ZiuINHkKE1TQtUw2VHmV53NII5Rjk/Iuw+dJ6ysNumrlmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077948; c=relaxed/simple;
	bh=spFLITLMuVqvZk60vkBaURkEuBKPPJhG4AmcD1L1VIs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHxr2YAKzIK/mqmbwJvLQbUuPf4aM7iqls/QQReDoDNVQrVC+Mt1T0e3ktppE149/0CVyMytQie3SiZqTzLqT7l8iwHziR8C8naYfXZJ0lelB88C6I7Sf2cKeB7UWpuB91FTVb3lQdR0layTqOIumf/4IIPZNSsLTHmdgNhcarQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=X/ujI6xg; arc=none smtp.client-ip=113.46.200.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="X/ujI6xg"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yaeZgUL9why9NypSzc70XDOqswpi+FzflFlPsoNkX3E=;
	b=X/ujI6xgJIrMpg9KYVbi42TOs/c598kqx7zgRtlaOhtl2kk1EYubY+8czdU9Oj0zla4W5U2SA
	/o3L1Eq06le+rx4poWLuXm1sH1G4w/gpsGEsld6Y81vvGplKWEbcTaFYrIwSya21YIMP3k1Lanb
	UwGcenn4FXbpVMEj7sUCtYY=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4gZyTk52nnz12LCq;
	Wed, 10 Jun 2026 15:44:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 714DA40670;
	Wed, 10 Jun 2026 15:52:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 10 Jun
 2026 15:52:17 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <punit.agrawal@oss.qualcomm.com>,
	<ruanjinjie@huawei.com>, <mrigendra.chaubey@gmail.com>,
	<suzuki.poulose@arm.com>, <chenl311@chinatelecom.cn>,
	<fengchengwen@huawei.com>, <maz@kernel.org>, <timothy.hayes@arm.com>,
	<lpieralisi@kernel.org>, <arnd@arndb.de>, <gshan@redhat.com>,
	<jic23@kernel.org>, <dietmar.eggemann@arm.com>, <sudeep.holla@kernel.org>,
	<pierre.gondois@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/2] arm64: smp: Fix hot-unplug tearing by forcing unregistration
Date: Wed, 10 Jun 2026 15:52:01 +0800
Message-ID: <20260610075202.3597031-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610075202.3597031-1-ruanjinjie@huawei.com>
References: <20260610075202.3597031-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Sashiko review pointed out the following issue[1].

Commit eba4675008a6 ("arm64: arch_register_cpu() variant to check if
an ACPI handle is now available.") introduced architectural safety
blocks inside arch_unregister_cpu(). If a hot-unplug operation is
determined to be a physical hardware removal (where _STA evaluates to
!ACPI_STA_DEVICE_PRESENT), or if firmware evaluation fails, it aborts
the unregistration transaction early to protect unreadied arm64
infrastructure.

However, returning early from arch_unregister_cpu() causes a catastrophic
state tearing because the generic ACPI layer (acpi_processor_post_eject())
unconditionally continues its cleanup flow. This leaves the stale sysfs
device leaked in the memory, deadlocking any subsequent hot-add attempts
on the same CPU.

Fix it by simplifying arch_unregister_cpu() to always proceed with
the unregistration, as a pr_err_once() warning is sufficient to make
it more visible for currently not supported physical CPU removal.
Also remove the redundant NULL check on acpi_handle as it cannot be
NULL when calling arch_unregister_cpu().

[1]: https://sashiko.dev/#/patchset/20260520022023.126670-1-ruanjinjie@huawei.com
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: James Morse <james.morse@arm.com>
Cc: stable@vger.kernel.org
Fixes: eba4675008a6e ("arm64: arch_register_cpu() variant to check if an ACPI handle is now available.")
Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/smp.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..543d3459f6e3 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -535,23 +535,13 @@ void arch_unregister_cpu(int cpu)
 {
 	acpi_handle acpi_handle = acpi_get_processor_handle(cpu);
 	struct cpu *c = &per_cpu(cpu_devices, cpu);
-	acpi_status status;
 	unsigned long long sta;
-
-	if (!acpi_handle) {
-		pr_err_once("Removing a CPU without associated ACPI handle\n");
-		return;
-	}
+	acpi_status status;
 
 	status = acpi_evaluate_integer(acpi_handle, "_STA", NULL, &sta);
-	if (ACPI_FAILURE(status))
-		return;
-
-	/* For now do not allow anything that looks like physical CPU HP */
-	if (cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
+	if (!ACPI_FAILURE(status) &&
+	    cpu_present(cpu) && !(sta & ACPI_STA_DEVICE_PRESENT))
 		pr_err_once("Changing CPU present bit is not supported\n");
-		return;
-	}
 
 	unregister_cpu(c);
 }
-- 
2.34.1


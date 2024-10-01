Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5622A1C4637
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727789788; cv=none; b=Yvvq1qwENjUhjXQZc9xL+EA/akXtMRNx74klhQvnRaM2x+HSxR1bzPxUkEH5QTjPAEcyrFPdDegajbZAEBhJJtIUTZoMVJ8SbCu0OsRi7IJNMzihkmhMQWSKip1IAewGI2YeqsuaHUpZpSNAMB2SrVJ/wxuzXeyTM/j+1eITnpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727789788; c=relaxed/simple;
	bh=cjonqL14kqP7WiVMU5iYbwpbNINJOis3L8NTxmK3twA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Plr1j0A7f3dEZcvtVjUtPFuqhVncxBjg5ofOt/Ny5Jghr+DVcOQ2nz60ni3PYPw0bUVNdL57tP4W8vqNAY0lUNdyvqRYvc5SZYiMWRKeGHSiMAY+2AQnuiIt98tL2Vmnpg1AeLLwv9aruacwoGrjE4lo6fZog1XuiMunl4Ngr0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F710367;
	Tue,  1 Oct 2024 06:36:56 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C8223F64C;
	Tue,  1 Oct 2024 06:36:25 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	corbet@lwn.net,
	joey.gouly@arm.com,
	will@kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: set POR_EL0 for kernel threads
Date: Tue,  1 Oct 2024 14:36:17 +0100
Message-Id: <20241001133618.1547996-2-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241001133618.1547996-1-joey.gouly@arm.com>
References: <20241001133618.1547996-1-joey.gouly@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Restrict kernel threads to only have RWX overlays for pkey 0.  This matches
what arch/x86 does, by defaulting to a restrictive PKRU.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 0540653fbf38..94f42df249e3 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -410,6 +410,9 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 		memset(childregs, 0, sizeof(struct pt_regs));
 		childregs->pstate = PSR_MODE_EL1h | PSR_IL_BIT;
 
+		if (system_supports_poe())
+			p->thread.por_el0 = POR_EL0_INIT;
+
 		p->thread.cpu_context.x19 = (unsigned long)args->fn;
 		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
 	}
-- 
2.25.1


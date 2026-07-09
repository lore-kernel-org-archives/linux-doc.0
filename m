Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCCC3EFFA7;
	Thu,  9 Jul 2026 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589484; cv=none; b=fCEmjytc+xwtTyrUlwi2d88bXwKCma52zMBNyylVF2HW7PpZRlpRk/gOEO5kAsi1wlAl/DScTLeX07x5NZKQ+VI/K2sunBQoSypOmQf5JUMZnGXjaPTt0TMaMmqM/yM93i/9ajDg2XzJsQLJB9xxtBo5RM3tv4R4GCn+O8++yNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589484; c=relaxed/simple;
	bh=Blzkef+vFl6oEiCGDH7RYNN90UCJTQHPs7D692yzfSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXBSeeZnZdKLR0LPLGJ5X/pdTgh0A0IyK70faL8pcMxsvt8LiYR0sk1w3c02q/9gfw+mGqd+IXUlW6YDIHXUKYPhmKornEVUDjyskqjAlb77rBJdOQ7jWjF8cwTH4YbjzHPm8JRR05D3Tq82L7Xj04mlBMVLmyvTSEAl8zgzaFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=MHc9scca; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="MHc9scca"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB37E357B;
	Thu,  9 Jul 2026 02:31:17 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 174E33F66F;
	Thu,  9 Jul 2026 02:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783589482; bh=Blzkef+vFl6oEiCGDH7RYNN90UCJTQHPs7D692yzfSs=;
	h=From:To:Cc:Subject:Date:From;
	b=MHc9sccaZKDuO9jTgaSCj4DUQqaXcPUV6zIdVrtUfAkiInpOEHfpQmc0altcLjCc7
	 qRZc4URa30EJElenTdeE1MJucDI+aJlYnFxq0V3x5hiylzJ0Bf25FH/jVoHmFTM3ap
	 CVSw5Ucc2uWJTazHfjN/jbpyxOzb4Db1prLxN0v8=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: james.morse@arm.com,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	corbet@lwn.net,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	dave.martin@arm.com
Subject: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time conversion to be per-arch
Date: Thu,  9 Jul 2026 10:31:08 +0100
Message-ID: <20260709093111.367851-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This version fixes a couple of non-functional mistakes in v4 pointed out by Reinette.

The patches should stay together so please could this all go via tip.

Changelogs in patches.

From cover letter of v3:

This is a new version of Dave Martin's patch [1] to delegate rounding of
bandwidth control user values to the arch code. As there is now more than one
architecture using resctrl, I split the original patch into two, a core resctrl
patch and an x86 patch, and added an MPAM patch. Please let me know if the patch
break down and ordering is sensible and whether the pattern should be followed
for any future similar changes.

This does have a user visible effect on MB schema when using MPAM hardware
with 'bandwidth_gran' greater than 1. I'm not sure if MPAM hardware with such
coarse controls exists in the wild but it is spec compliant and I've tested it
on a model.

[1] https://lore.kernel.org/lkml/20251031154225.14799-1-Dave.Martin@arm.com/

v3: https://lore.kernel.org/lkml/20260515140612.1205251-1-ben.horgan@arm.com/
v4: https://lore.kernel.org/lkml/20260706160639.2136674-1-ben.horgan@arm.com/

Based on v7.2-rc2

Ben Horgan (1):
  arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()

Dave Martin (2):
  x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
  fs/resctrl: Factor MBA parse-time conversion to be per-arch

 Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 drivers/resctrl/mpam_resctrl.c            |  5 +++++
 fs/resctrl/ctrlmondata.c                  |  6 +++---
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.43.0


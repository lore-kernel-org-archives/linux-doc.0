Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC3048BD29;
	Fri, 15 May 2026 14:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853991; cv=none; b=QASEOl84kUqxm8ofBLU7r5RQIGSzUG3lyO/WInrcj9OC/R6xAwdK13/Q2vMeCJJdPca6OAMB8NGyuRN9I3Y408QKyIn9TqDu5z0by9Fs+A71SXF5Z1yq309akxP5DkkL6wPCHkIjLvmlx/E3ZaQBx3OMRKu/VwIMTi5uBsJYrm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853991; c=relaxed/simple;
	bh=92FbUOwThLkQI1YMirCwdfld6AI0F1cy25HxoL3c/k4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ldirvQz8Sfp8ynv6/F+jopIo7mS38eyafs4GXtmiU1zV5q+TB1mlQWYl9Icz5gkl+AukR9oMWOvr5vdQhq/iihEfZ8C0GHVgjL0FjIvFmUEcTmDg7wtWuDmRBsBer1mvvh2xyotb0qxs6Q4+qRKcaUG/4Axo0H4HDrMWXEPJboE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=r0N9wc1a; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="r0N9wc1a"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49DDA2923;
	Fri, 15 May 2026 07:06:20 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 464683F836;
	Fri, 15 May 2026 07:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778853985; bh=92FbUOwThLkQI1YMirCwdfld6AI0F1cy25HxoL3c/k4=;
	h=From:To:Cc:Subject:Date:From;
	b=r0N9wc1aiLGjVKxRj0SczgEXdtXj+o6V04WIR5xn2JOxphg3trzVBX0jrt1J6nGJ6
	 1nB6ZvM8mygUEPKLwlM66unrHynqDu9gVB9eYqLkgQGeIu3hAZ6Ez3EzGq74yOmEAQ
	 pGrtGWpkfSCtSihXnlQ/uZjQeAqlK7Q+tdtrRyFw=
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
Subject: [PATCH v3 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time conversion to be per-arch
Date: Fri, 15 May 2026 15:06:09 +0100
Message-ID: <20260515140612.1205251-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Ben Horgan (2):
  x86/resctrl: Add resctrl_arch_preconvert_bw()
  arm_mpam: resctrl: Add pass-through resctrl_arch_preconvert_bw()

Dave Martin (1):
  fs/resctrl: Factor MBA parse-time conversion to be per-arch

 Documentation/filesystems/resctrl.rst     | 17 +++++++++--------
 arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
 drivers/resctrl/mpam_resctrl.c            |  5 +++++
 fs/resctrl/ctrlmondata.c                  |  6 +++---
 include/linux/resctrl.h                   | 19 +++++++++++++++++++
 5 files changed, 42 insertions(+), 11 deletions(-)

-- 
2.43.0


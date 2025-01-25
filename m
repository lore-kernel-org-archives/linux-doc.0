Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F274F3232;
	Sat, 25 Jan 2025 15:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737820049; cv=none; b=kn1FijJlrMls79+M2EXXipCe+qelrFKmtBW4zzd2oMTDqLSIXiWejSPGPkSH1ODgcOjUvxfN9Ojrf32aTP9KuiGj4Nw20J9HIcEOtvNhP/UEB1P2gFrD1C7LxjZJdSeCl0SUMyaeRYB4cIzi6ijikYrkmg5KCRviTzMSw1csjIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737820049; c=relaxed/simple;
	bh=kW9SDQo9GcJ7STGkG9GR1G7RiUkv0vnUNwTU4R6IFbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QmhB6gMTw/sQyyd3DCknbKumdLJPdsgSZabpriz3o+tZnggg6pWBxTv+tjPKLY3PJhsTGYf6L7lu3D8twRuyS8zdGgffI+dHj3+EzqDew8MZ22GFcrE+f0Lt73Rj37G1mCa2N1Y/RkY6tky/NdL1QXwjpRty5a5mLZJxM6r7+2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mP8O7iPi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mP8O7iPi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B147DC4CED6;
	Sat, 25 Jan 2025 15:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737820048;
	bh=kW9SDQo9GcJ7STGkG9GR1G7RiUkv0vnUNwTU4R6IFbI=;
	h=From:To:Cc:Subject:Date:From;
	b=mP8O7iPi2BXX/hmN86Lvik8+54jGq7z7q0F4lmAVqVqyOT/rO78VdztEWZCvEx7e/
	 2hl4dHSPdoYOHL8tieZXFoyqyTK9RSExtTWtQwODAlaFy7WBlGa6GwSTcUvIGSGW6l
	 WozLlq/ABb7z0zWgbOV+hs9CA9To7yombJ+dL6nyB2a29r8nwgp5ZRosXc0f6RMw5S
	 AlgsE1jk0NKQg4oL00B6nW2bKdCrtPRPNCLTJ/cupDfh0r0gWLPNgyQHZdS/+NRW4m
	 k+3N3DD7M9EigxC5LiHp+B9+oEZhrZDTVGtV3O1xagrp+jQhixKtCLlmc709xtE2Cl
	 y5VyVe/PJUwQA==
From: carlos.bilbao@kernel.org
To: corbet@lwn.net
Cc: avadhut.naik@amd.com,
	akpm@linux-foundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH] .mailmap: Update incorrect entry and my email in MAINTAINERS
Date: Sat, 25 Jan 2025 09:47:21 -0600
Message-ID: <20250125154721.1035737-1-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Update .mailmap to fix a mapping and my email address in MAINTAINERS.

Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 .mailmap    |  1 -
 MAINTAINERS | 10 +++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/.mailmap b/.mailmap
index 83837191affb..0768824e9d19 100644
--- a/.mailmap
+++ b/.mailmap
@@ -139,7 +139,6 @@ Bryan Tan <bryan-bt.tan@broadcom.com> <bryantan@vmware.com>
 Cai Huoqing <cai.huoqing@linux.dev> <caihuoqing@baidu.com>
 Can Guo <quic_cang@quicinc.com> <cang@codeaurora.org>
 Carl Huang <quic_cjhuang@quicinc.com> <cjhuang@codeaurora.org>
-Carlos Bilbao <carlos.bilbao.osdev@gmail.com> <carlos.bilbao@amd.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao.osdev@gmail.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <carlos.bilbao@amd.com>
 Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
diff --git a/MAINTAINERS b/MAINTAINERS
index 4006434e0155..f7e70513ebff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1077,7 +1077,7 @@ F:	drivers/video/fbdev/geode/
 
 AMD HSMP DRIVER
 M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
-R:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+R:	Carlos Bilbao <carlos.bilbao@kernel.org>
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
 F:	Documentation/arch/x86/amd_hsmp.rst
@@ -5793,7 +5793,7 @@ F:	drivers/usb/atm/cxacru.c
 
 CONFIDENTIAL COMPUTING THREAT MODEL FOR X86 VIRTUALIZATION (SNP/TDX)
 M:	Elena Reshetova <elena.reshetova@intel.com>
-M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 S:	Maintained
 F:	Documentation/security/snp-tdx-threat-model.rst
 
@@ -11228,7 +11228,7 @@ S:	Orphan
 F:	drivers/video/fbdev/imsttfb.c
 
 INDEX OF FURTHER KERNEL DOCUMENTATION
-M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 S:	Maintained
 F:	Documentation/process/kernel-docs.rst
 
@@ -22018,7 +22018,7 @@ Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
 SPANISH DOCUMENTATION
-M:	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
+M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>
 S:	Maintained
 F:	Documentation/translations/sp_SP/
@@ -22030,7 +22030,7 @@ L:	sparclinux@vger.kernel.org
 S:	Maintained
 Q:	http://patchwork.ozlabs.org/project/sparclinux/list/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
+:	git git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
 F:	arch/sparc/
 F:	drivers/sbus/
 
-- 
2.43.5


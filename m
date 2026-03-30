Received: from outbound.baidu.com (jpmx.baidu.com [119.63.196.201])
	by smtp.subspace.kernel.org (Postfix) with SMTP id AF6D63B6C19;
	Mon, 30 Mar 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.63.196.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774868430; cv=none; b=Q9LTBewywf6UQYMUju3Tnglcuz/qsUDRSq5AxWKYlGBXmGrHPznf+PRQtg13X20KtiaQLnxMyvqRffp/8/o1dLmhWHs7ixua6zWpqhFTlyxJhJsr5k7OlIMqZj5vz/RFr+PKA1vc3UL2dJIfgtESvxgDVxklHpXpmRrS2nGd85M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774868430; c=relaxed/simple;
	bh=eLwc+p5540DFbApxOFSRVLw7WHCkZ12pDEXbGuennII=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uWQmrmTaj7eL5Z/ZDGvP3c6VxG46aoFlKs8uerADeKKsdWIA/XYzqCOrfXq1Wm6AZuUs1KtwGQP8+wI5OHQTgMoevuqdLjI9TtEpe88yHUtJvCx2I0amqPxAzTarHZgw+8qZrwKHvwqsD7JoW1VUsDt0Mf6aWSGmh9Z1Y5f9q/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=KDDp9t52; arc=none smtp.client-ip=119.63.196.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="KDDp9t52"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
	<akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Randy Dunlap
	<rdunlap@infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Li RongQing <lirongqing@baidu.com>, Shuah Khan
	<skhan@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>, Feng Tang
	<feng.tang@linux.alibaba.com>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Askar Safin <safinaskar@gmail.com>, Bjorn
 Helgaas <bhelgaas@google.com>, Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH v2] Documentation/kernel-parameters: fix architecture alignment for pt, nopt, and nobypass
Date: Mon, 30 Mar 2026 06:59:57 -0400
Message-ID: <20260330105957.2271-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjkjy-exc12.internal.baidu.com (172.31.51.12) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1774868420;
	bh=FhWygHzI4TiCiWtDBZF5j4MHUyORFghQge+nWQNOUBc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=KDDp9t52I9VagoRBsDyYtkN4PMzWJdm3IVMalUTakq6LteC+x8ayx/Ag72IeUBHGQ
	 OiQ+wYaV/NAwg9hV10NIhy/26O943paz3lZSWPfgG17YorJpa56VMOY87oRqnCue1n
	 eznyT8V3HPPdchn1Ug9hzWgnMVDp/PRyVlBUJXHAOu4sZAff8u1gdQ0ZPq4AfUGD8e
	 MqGzOPGJMbknKaw8ene38UFxSqMBwNFN/bHEpjBOI5fmCGG1ORXPl2PCJP8GbkP1us
	 X7lk6tBY0N8PC3WvRUrj8vZsM80E5ljblcqYy3AcwlPQxeV4YLQx7sNFDqo4YUyeXT
	 QtezMZqe/28qg==

From: Li RongQing <lirongqing@baidu.com>

Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
into kernel-parameters.txt") introduced a formatting regression where
architecture tags were placed on separate lines with broken indentation.
This caused the 'nopt' [X86] parameter to appear as if it belonged to
the [PPC/POWERNV] section.

Furthermore, since the main 'iommu=' parameter heading already specifies
it is for [X86, EARLY], the subsequent standalone [X86] tags for 'pt',
'nopt', and the AMD GART options are redundant and clutter the
documentation.

Clean up the formatting by removing these redundant tags and properly
attributing the 'nobypass' option to [PPC/POWERNV].

Fixes: ab0e7f20768a ("Documentation: Merge x86-specific boot options doc into kernel-parameters.txt")
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Li RongQing <lirongqing@baidu.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Marco Elver <elver@google.com>
Cc: Paul E. McKenney <paulmck@kernel.org>
Cc: Askar Safin <safinaskar@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 03a5506..5253c23 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2615,15 +2615,11 @@ Kernel parameters
 			Intel machines). This can be used to prevent the usage
 			of an available hardware IOMMU.
 
-			[X86]
 		pt
-			[X86]
 		nopt
-			[PPC/POWERNV]
-		nobypass
+		nobypass	[PPC/POWERNV]
 			Disable IOMMU bypass, using IOMMU for PCI devices.
 
-		[X86]
 		AMD Gart HW IOMMU-specific options:
 
 		<size>
-- 
2.9.4


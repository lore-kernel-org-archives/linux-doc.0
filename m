Received: from outbound.baidu.com (jpmx.baidu.com [119.63.196.201])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 72CA13B27D8;
	Thu, 26 Mar 2026 07:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.63.196.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511257; cv=none; b=tN1jMRGxsW92Eritdox/L+vH6cdJyAzvSdhoSolLoU0kzgfqUTtwEgOvkqqE2gLxiS9P7KERPq7nNJFGLlwEvD+hKQ4NIE/diOVRDuF7SuqCSlGqKXDgQuyAYmraEu9pHWM28l8kt1v+ab0gVvwK8zYUHewD/xNCOKZZhM4EpcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511257; c=relaxed/simple;
	bh=dJLQUXgrA2cZRFPoqmZ8NqvxPoPonBr5Y5UDrfu0QVI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TOHSsgyW6igHYwgWrvMy5mLnNubzhXwnf1hatUGbGVv6l2E0J6/5884a/HuB6/bRkHLZN83ZgKzLs4SF1AoRxsb5j+2J9DvbNbRWwwRI8cNPzxdMpIVE1BFq02B02aOZ7F4Do7Ky+SYbv/vk7aL23pM4jPYAo1PYNl6QM92CchY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=W4DuWM7x; arc=none smtp.client-ip=119.63.196.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="W4DuWM7x"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
	Feng Tang <feng.tang@linux.alibaba.com>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, Li RongQing
	<lirongqing@baidu.com>, "Paul E . McKenney" <paulmck@kernel.org>, Askar Safin
	<safinaskar@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Sohil Mehta
	<sohil.mehta@intel.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] docs: kernel-parameters: fix architecture alignment for pt, nopt, and nobypass
Date: Thu, 26 Mar 2026 03:46:58 -0400
Message-ID: <20260326074658.1899-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: bjhj-exc11.internal.baidu.com (172.31.3.21) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1774511242;
	bh=0qlIez7CHyooxGukv9QKRh8T9+O2lgqml6ysSIP4kks=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=W4DuWM7xJkofK4gXK29QTLVFsXg5ksAavQ/+D2JL3z7hd+jwWfvOVaWul9RBr0NM0
	 YZSh6THa9LSt1Z5kOKucGdmFA3K8kZ8O0U3qH7SYLgQjBmNOXCcHROSSDuM10a/7Xm
	 QMfYvXDNk1FfZd+MxLRhkaTC6W3cBo50CGoi6bjrQDU3/eJCpE5CP5PKMW6Y9kL8wT
	 K1lp9EL9/NVlnIidxj8/NXzsAjvvlfssva6OoGNJx63wjJTGw9W6NqkQFBHAoKqD9v
	 2rOAIq/ZplJwPTRh9TEd0fKD0gyAx0EFjaFBjmy0G4LIOubM+8wE70X19FdfaT8atl
	 L4914HOqPrzXQ==

From: Li RongQing <lirongqing@baidu.com>

Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
into kernel-parameters.txt") introduced a formatting regression where
architecture tags were placed on separate lines with broken indentation.
This caused the 'nopt' [X86] parameter to appear as if it belonged to
the [PPC/POWERNV] section.

Fix the formatting by placing the architecture tags on the same line as
their respective parameters ('pt', 'nopt', and 'nobypass') and restoring
proper indentation.

Fixes: ab0e7f20768a ("Documentation: Merge x86-specific boot options doc into kernel-parameters.txt")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 03a5506..dc1c5bd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2615,12 +2615,9 @@ Kernel parameters
 			Intel machines). This can be used to prevent the usage
 			of an available hardware IOMMU.
 
-			[X86]
-		pt
-			[X86]
-		nopt
-			[PPC/POWERNV]
-		nobypass
+		pt  	[X86]
+		nopt	[X86]
+		nobypass	[PPC/POWERNV]
 			Disable IOMMU bypass, using IOMMU for PCI devices.
 
 		[X86]
-- 
2.9.4


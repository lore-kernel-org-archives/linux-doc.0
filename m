Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F911C2325;
	Tue,  6 Aug 2024 11:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722943631; cv=none; b=Vg/r35yi6pogKvn0MWFod5Vw3jXDiEXYSjIJlBK+lAA6WPUlR2Ax1Y+/WGJ34BmhZJAoflayIBrcVD2HF8utcBuM07YA4nmHf2qsQ8aoQmp/CXHmAxy9OUR1lZGc1i8GG/FKZsceCrvoIV2vD78+iRjOqzd5tdhm1wg3NoC5I5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722943631; c=relaxed/simple;
	bh=jJMgzlKUwYGNIWrj5fOYUjYmwCZBf0YsqyCiRIEBoHE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AYfiLHMzzX1DQ3ordOD6ZpRTHiqiGj/X7kD+32UvlK9zbQOu0VxxJPzv/ciQXfPDYpiduNoLc8mp6H8lrbjbxn1+j+vsW9Ug/UxVqqBbo/36txQbwuE7+cO1B7YZlML/LyL1ovX46na37MjTz2FHwnWEYdTm/cuaU0wbBvBqkVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WdWF25VbRzfZ5w;
	Tue,  6 Aug 2024 19:25:10 +0800 (CST)
Received: from kwepemi100008.china.huawei.com (unknown [7.221.188.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 260111800A0;
	Tue,  6 Aug 2024 19:27:04 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi100008.china.huawei.com
 (7.221.188.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 6 Aug
 2024 19:27:03 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <corbet@lwn.net>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] arm64/kdump: Update the high memory reserve doc
Date: Tue, 6 Aug 2024 19:33:20 +0800
Message-ID: <20240806113320.2388386-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi100008.china.huawei.com (7.221.188.57)

Since commit 282c3a66b724 ("crash: Fix riscv64 crash memory reserve dead
loop"), if reservation from the high memory failed on ARM64, the kernel
will not falls back to searching the low memory, so remove it in the doc.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/arch/arm64/kdump.rst | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/Documentation/arch/arm64/kdump.rst b/Documentation/arch/arm64/kdump.rst
index 56a89f45df28..11b9b84bf422 100644
--- a/Documentation/arch/arm64/kdump.rst
+++ b/Documentation/arch/arm64/kdump.rst
@@ -79,10 +79,6 @@ To reserve memory for crashkernel=size,high, searching is first
 attempted from the high memory region. If the reservation succeeds, the
 low memory reservation will be done subsequently.
 
-If reservation from the high memory failed, the kernel falls back to
-searching the low memory with the specified size in crashkernel=,high.
-If it succeeds, no further reservation for low memory is needed.
-
 Notes:
 
 - If crashkernel=,low is not specified, the default low memory
-- 
2.34.1


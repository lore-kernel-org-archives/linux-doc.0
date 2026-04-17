Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386363128CA;
	Fri, 17 Apr 2026 03:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776396134; cv=none; b=To+bq6xrxushf5XjrjmPfj3ykbvNgJuYwBEKcjTmAKx93mAtUYRHv2+nuAlUn5R/rNe4BM/rM9GZjkahuLqW555WiMrKpECFb7n6lNENuFprMvIcXZDBz4M748Mw/4mpl3AmZJ8hLwviggsquxoERPk5QZw/MSVvpazAc8r59VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776396134; c=relaxed/simple;
	bh=86K7XkxC/v2L5UoF5U0XaLF4l4XC/tIPLraYXXMY20w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=elNHy4cnXKJwIo3OnmAD/ZMZ7BrBMWFVFNU5M/MRPtaf845Dv8/5kz2TG9pfRI4YyJUGbZskBCQD8fyvTozOQvxW6AM8E4nZ0MOq7Isw75CG0NhjHd6eo9cVZTHx2B9hoLg5PzRE6lUzOcS8Io0hCV/NlSxv2UlmD3jm8C+NFs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=6EOdu9ab; arc=none smtp.client-ip=113.46.200.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="6EOdu9ab"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SOq/ZxC6M8wVXHNjMQe7Rw4xaPWmBQS6yZbztjmE8kw=;
	b=6EOdu9absDQrLD3VgjMBEJCMhp8NEszwwLk5P7IzqAGIPcDk3ND55TevuhT8VJZGzBGK1JCLT
	/jO7I+8XocXiZgiD8T2G4pFXNQlJ0LtP7tFzeUv3Hxz62EOwYcn0zQpV+5uZGwmNpYYs3lwRRyi
	2vVv0Ix4vAbCoeeUwDBjwE0=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fxg4z3fH5z1T4Gh;
	Fri, 17 Apr 2026 11:16:03 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9AFF940576;
	Fri, 17 Apr 2026 11:22:06 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 17 Apr
 2026 11:22:05 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<akpm@linux-foundation.org>, <bp@alien8.de>, <rdunlap@infradead.org>,
	<pmladek@suse.com>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <safinaskar@gmail.com>, <bhelgaas@google.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<skelley@nvidia.com>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] docs: Update nosmt support for arm64
Date: Fri, 17 Apr 2026 11:25:40 +0800
Message-ID: <20260417032540.3720627-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
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

commit eed4583bcf9a6 ("arm64: Kconfig: Enable HOTPLUG_SMT") enable
HOTPLUG_SMT for SMT control for arm64, but the documentation was
not updated accordingly to reflect that ARM64 now supports control SMT
via boot parameter and sysfs knobs:

1. Boot parameters:

nosmt:          Disable SMT, can be enabled via sysfs knobs.
nosmt=force:    Disable SMT, cannot be enabled via sysfs knobs.

2. Runtime sysfs controls:

Write "on", "off", "forceoff" or the number of SMT threads (1, 2, ...)
to /sys/devices/system/cpu/smt/control.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb850e5290c2..6a73eb5abae9 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4661,7 +4661,7 @@ Kernel parameters
 	nosmt		[KNL,MIPS,PPC,EARLY] Disable symmetric multithreading (SMT).
 			Equivalent to smt=1.
 
-			[KNL,LOONGARCH,X86,PPC,S390] Disable symmetric multithreading (SMT).
+			[KNL,LOONGARCH,X86,ARM64,PPC,S390] Disable symmetric multithreading (SMT).
 			nosmt=force: Force disable SMT, cannot be undone
 				     via the sysfs control file.
 
-- 
2.34.1


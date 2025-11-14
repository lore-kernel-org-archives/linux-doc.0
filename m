Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166EB25B1FC;
	Fri, 14 Nov 2025 01:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763084645; cv=none; b=hxpr6eNxlx/EakmpxvYA97y5B+1MN1jO2jLC/xYcSNpJvpbaZcBVxskoy11HkcTwyqTcxoliaNRCpKasnOA4nQ7DzQV1YPqdscRyy4txaOpwH1LsrpXizaVJD522HdKYNGY0Z+GKNqNUrPGfmvuCee+UhvXr9mlnB039joVGhUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763084645; c=relaxed/simple;
	bh=kCpm6UfHQfyKqfl1HGSAMwKE51AlrWmaiMPMUYiMUaI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R9a71wpKk+my/sWSfdrawtFDfItNl6zhlWdqGMf6OCQ3FDkjQAANIhYdRxAjmqe6jL18V4N2Z51NNi7Uj0CWtxQ29QjIJAM28Ddr1nCnmZHw/qMsUXZTcmezVVBnMMX8Xzj/MpjLr0LzIsZ4AeSQVicWtvRoDF25WMjrjcuvcOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=k5oceqjA; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="k5oceqjA"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nCjMka+wSNI4Uo7olxnlWMKvwXcFuiIk59LT80Qywhs=;
	b=k5oceqjAxwGRzEvqgTuDqHg0SrWwRnuWF8irlHJAqJvYKudjZjKB4qhjgewk3kSyDIv8X3QTB
	CG8T4Smc/S2h6+myOAmclcPRoUw0e9OAkF8Z2dYeBWcfftQZcqRbGnbuM0Ain7iGmKvs5DfTUCC
	BpxdOS4zOuEfeD1ShmzAKEo=
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4d70Hh17PBzpSw8;
	Fri, 14 Nov 2025 09:42:08 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id F0C98180064;
	Fri, 14 Nov 2025 09:43:53 +0800 (CST)
Received: from huawei.com (10.50.85.128) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 14 Nov
 2025 09:43:53 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <p.zabel@pengutronix.de>, <corbet@lwn.net>, <yuehaibing@huawei.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] Documentation: reset: Remove reset_controller_add_lookup()
Date: Fri, 14 Nov 2025 10:05:31 +0800
Message-ID: <20251114020531.94262-1-yuehaibing@huawei.com>
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
 dggpemf500002.china.huawei.com (7.185.36.57)

Commit 205b261463ff ("reset: remove legacy reset lookup code") removed this
api, so update the document.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 Documentation/driver-api/reset.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/driver-api/reset.rst b/Documentation/driver-api/reset.rst
index 84e03d7039cc..f773100daaa4 100644
--- a/Documentation/driver-api/reset.rst
+++ b/Documentation/driver-api/reset.rst
@@ -218,4 +218,3 @@ devm_reset_controller_register().
                reset_controller_register
                reset_controller_unregister
                devm_reset_controller_register
-               reset_controller_add_lookup
-- 
2.34.1


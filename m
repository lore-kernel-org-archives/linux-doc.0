Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84689C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 11:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbiI3LVl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232373AbiI3LVB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 07:21:01 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF9C2708
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 04:09:34 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mf6qZ30YwzpTrN;
        Fri, 30 Sep 2022 19:06:34 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 19:09:32 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 30 Sep
 2022 19:09:32 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-doc@vger.kernel.org>
CC:     <corbet@lwn.net>, <yangyingliang@huawei.com>
Subject: [PATCH -next 6/8] Documentation: devres: add missing I2C helper
Date:   Fri, 30 Sep 2022 19:25:32 +0800
Message-ID: <20220930112534.861221-7-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930112534.861221-1-yangyingliang@huawei.com>
References: <20220930112534.861221-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add missing devm_i2c_add_adapter() to devres.rst. It's introduced by
commit 07740c92ae57 ("i2c: core: add managed function for adding i2c
adapters").

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 Documentation/driver-api/driver-model/devres.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 58ecea907446..197af4e839eb 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -280,6 +280,7 @@ GPIO
 
 I2C
   devm_i2c_new_dummy_device()
+  devm_i2c_add_adapter()
 
 IIO
   devm_iio_device_alloc()
-- 
2.25.1


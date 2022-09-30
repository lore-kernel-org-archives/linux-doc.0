Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BFFC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 11:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiI3LVo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 07:21:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiI3LVB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 07:21:01 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3912722
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 04:09:35 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Mf6qb173fzpVNq;
        Fri, 30 Sep 2022 19:06:35 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 30 Sep 2022 19:09:33 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 30 Sep
 2022 19:09:33 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-doc@vger.kernel.org>
CC:     <corbet@lwn.net>, <yangyingliang@huawei.com>
Subject: [PATCH -next 8/8] Documentation: devres: add missing IIO helpers
Date:   Fri, 30 Sep 2022 19:25:34 +0800
Message-ID: <20220930112534.861221-9-yangyingliang@huawei.com>
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

Add some missing device-managed helpers of iio to devres.rst.

devm_iio_kfifo_buffer_setup_ext() is introduced by commit 0a21526bc1d4 ("iio:
kfifo: add devm_iio_triggered_buffer_setup_ext variant").

devm_iio_triggered_buffer_setup_ext() is introduced by commit 5164c7889857 ("iio:
triggered-buffer: add {devm_}iio_triggered_buffer_setup_ext variants").

devm_iio_hw_consumer_alloc() is introduced by b688c18d3006 ("IIO: hw_consumer:
add devm_iio_hw_consumer_alloc").

devm_fwnode_iio_channel_get_by_name() is introduced by commit 1e64b9c5f9a0 ("iio:
inkern: move to fwnode properties")

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 Documentation/driver-api/driver-model/devres.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 16558c6cf702..4daa9d14e527 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -287,12 +287,16 @@ IIO
   devm_iio_device_register()
   devm_iio_dmaengine_buffer_setup()
   devm_iio_kfifo_buffer_setup()
+  devm_iio_kfifo_buffer_setup_ext()
   devm_iio_map_array_register()
   devm_iio_triggered_buffer_setup()
+  devm_iio_triggered_buffer_setup_ext()
   devm_iio_trigger_alloc()
   devm_iio_trigger_register()
   devm_iio_channel_get()
   devm_iio_channel_get_all()
+  devm_iio_hw_consumer_alloc()
+  devm_fwnode_iio_channel_get_by_name()
 
 INPUT
   devm_input_allocate_device()
-- 
2.25.1


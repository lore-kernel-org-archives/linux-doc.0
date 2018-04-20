Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 00A477DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 20 Apr 2018 10:08:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754306AbeDTKHu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 20 Apr 2018 06:07:50 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7186 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754545AbeDTKHs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Apr 2018 06:07:48 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 92EE01A6A5D6F;
        Fri, 20 Apr 2018 18:07:35 +0800 (CST)
Received: from [127.0.0.1] (10.63.195.168) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Fri, 20 Apr 2018
 18:07:36 +0800
Subject: [PATCH] VFIO: Fix Documentation
References: <1524218521-61496-1-git-send-email-zhangshaokun@hisilicon.com>
To:     <alex.williamson@redhat.com>, <corbet@lwn.net>
CC:     <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From:   "dongbo (E)" <dongbo4@huawei.com>
X-Forwarded-Message-Id: <1524218521-61496-1-git-send-email-zhangshaokun@hisilicon.com>
Message-ID: <36f5940b-cac5-9a4a-86cb-7ad9766d5d62@huawei.com>
Date:   Fri, 20 Apr 2018 18:07:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1524218521-61496-1-git-send-email-zhangshaokun@hisilicon.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.63.195.168]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Dong Bo <dongbo4@huawei.com>

Signed-off-by: Dong Bo <dongbo4@huawei.com>
---
 Documentation/vfio.txt | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/vfio.txt b/Documentation/vfio.txt
index ef6a511..f1a4d3c 100644
--- a/Documentation/vfio.txt
+++ b/Documentation/vfio.txt
@@ -252,15 +252,14 @@ into VFIO core.  When devices are bound and unbound to the driver,
 the driver should call vfio_add_group_dev() and vfio_del_group_dev()
 respectively::
 -	extern int vfio_add_group_dev(struct iommu_group *iommu_group,
-	                              struct device *dev,
+	extern int vfio_add_group_dev(struct device *dev,
 				      const struct vfio_device_ops *ops,
 				      void *device_data);
  	extern void *vfio_del_group_dev(struct device *dev);
  vfio_add_group_dev() indicates to the core to begin tracking the
-specified iommu_group and register the specified dev as owned by
+iommu_group of the specified dev and register the dev as owned by
 a VFIO bus driver.  The driver provides an ops structure for callbacks
 similar to a file operations structure::
 -- 1.9.1


.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC70C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 29 Dec 2021 02:14:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234135AbhL2COg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Dec 2021 21:14:36 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:34859 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhL2COf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Dec 2021 21:14:35 -0500
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JNw255SYBzccBq;
        Wed, 29 Dec 2021 10:14:05 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 29 Dec 2021 10:14:33 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 29 Dec
 2021 10:14:33 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v3 0/3] Translate opp into Chinese
Date:   Wed, 29 Dec 2021 10:42:09 +0800
Message-ID: <20211229024212.32752-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate power/index.rst and power/opp.rst into Chinese.

v3:
1. Translate comments in the pseudocode and chart.
2. Pick Yanteng's Reviewed-by tags.

v2:
1. Split a cleanup patch for index.rst.
2. Pick Alex's Reviewed-by tags.

Tang Yizhou (3):
  docs/zh_CN: Cleanup index.rst
  docs/zh_CN: Add power/index Chinese translation
  docs/zh_CN: Add opp Chinese translation

 Documentation/translations/zh_CN/index.rst    |   8 +-
 .../translations/zh_CN/power/index.rst        |  56 +++
 .../translations/zh_CN/power/opp.rst          | 341 ++++++++++++++++++
 3 files changed, 401 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/power/index.rst
 create mode 100644 Documentation/translations/zh_CN/power/opp.rst

-- 
2.17.1


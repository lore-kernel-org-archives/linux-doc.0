Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31204C433FE
	for <linux-doc@archiver.kernel.org>; Sun, 26 Dec 2021 08:01:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231440AbhLZIBq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Dec 2021 03:01:46 -0500
Received: from szxga02-in.huawei.com ([45.249.212.188]:16863 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231391AbhLZIBq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Dec 2021 03:01:46 -0500
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4JMCsZ5q4bz91PD;
        Sun, 26 Dec 2021 16:00:50 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 26 Dec 2021 16:01:44 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Sun, 26 Dec
 2021 16:01:43 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH 0/2] docs/zh_CN: Translate opp into Chinese
Date:   Sun, 26 Dec 2021 16:29:21 +0800
Message-ID: <20211226082923.3261-1-tangyizhou@huawei.com>
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

Tang Yizhou (2):
  docs/zh_CN: Add power/index Chinese translation
  docs/zh_CN: Add opp Chinese translation

 Documentation/translations/zh_CN/index.rst    |   4 +-
 .../translations/zh_CN/power/index.rst        |  56 +++
 .../translations/zh_CN/power/opp.rst          | 341 ++++++++++++++++++
 3 files changed, 399 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/power/index.rst
 create mode 100644 Documentation/translations/zh_CN/power/opp.rst

-- 
2.17.1


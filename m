Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C6BC433FE
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 14:13:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236767AbiDHOPy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 10:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235465AbiDHOPw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 10:15:52 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0541028E364
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 07:13:46 -0700 (PDT)
Received: from dggpeml500022.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4KZgCZ3LXtzFpXK;
        Fri,  8 Apr 2022 22:11:22 +0800 (CST)
Received: from dggpeml500006.china.huawei.com (7.185.36.76) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Fri, 8 Apr 2022 22:13:43 +0800
Received: from huawei.com (10.175.100.227) by dggpeml500006.china.huawei.com
 (7.185.36.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Fri, 8 Apr
 2022 22:13:42 +0800
From:   Tang Yizhou <tangyizhou@huawei.com>
To:     <siyanteng@loongson.cn>, <siyanteng01@gmail.com>,
        <alexs@kernel.org>, <seakeel@gmail.com>
CC:     <linux-doc@vger.kernel.org>, <corbet@lwn.net>,
        <zhengbin13@huawei.com>, <tangyeechou@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Subject: [PATCH v2 0/2] Add spinlocks Chinese translation
Date:   Fri, 8 Apr 2022 22:47:40 +0800
Message-ID: <20220408144742.23225-1-tangyizhou@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500006.china.huawei.com (7.185.36.76)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Now I start to translate some documents of locking.

Tang Yizhou (2):
  docs/zh_CN: Add locking/index Chinese translation
  docs/zh_CN: Add spinlocks Chinese translation

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../translations/zh_CN/locking/index.rst      |  42 +++++
 .../translations/zh_CN/locking/spinlocks.rst  | 149 ++++++++++++++++++
 3 files changed, 192 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/locking/index.rst
 create mode 100644 Documentation/translations/zh_CN/locking/spinlocks.rst

-- 
2.17.1


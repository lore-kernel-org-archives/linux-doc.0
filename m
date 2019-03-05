Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,UNPARSEABLE_RELAY
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 256C07D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Mar 2019 06:58:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfCEG6f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Mar 2019 01:58:35 -0500
Received: from out30-44.freemail.mail.aliyun.com ([115.124.30.44]:49635 "EHLO
        out30-44.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725818AbfCEG6f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 5 Mar 2019 01:58:35 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01f04427;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0TM.l8T0_1551769107;
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0TM.l8T0_1551769107)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 05 Mar 2019 14:58:27 +0800
From:   Alex Shi <alex.shi@linux.alibaba.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        harryxiyou@gmail.com, corbet@lwn.net, leoyang.li@nxp.com
Cc:     colyli@suse.de, fengguang.wu@intel.com, shawn.guo@linaro.org,
        lizefan@huawei.com, Alex Shi <alex.shi@linux.alibaba.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>
Subject: [PATCH v2 01/27] docs/zh_CN: add disclaimer file
Date:   Tue,  5 Mar 2019 14:57:48 +0800
Message-Id: <20190305065815.157964-2-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190305065815.157964-1-alex.shi@linux.alibaba.com>
References: <20190305065815.157964-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This a disclaimer file which will be included in Chinese files
as header. To reduce the same common contents copy.

Part of contents quoted from Federico Vaga's file:
    Documentation/translations/it_IT/disclaimer-ita.rst.
Thanks a lot!

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Harry Wei <harryxiyou@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Li Zefan <lizefan@huawei.com>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>
Cc: Coly Li <colyli@suse.de>
Cc: Federico Vaga <federico.vaga@vaga.pv.it>
---
 Documentation/translations/zh_CN/disclaimer-zh_CN.rst | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/disclaimer-zh_CN.rst

diff --git a/Documentation/translations/zh_CN/disclaimer-zh_CN.rst b/Documentation/translations/zh_CN/disclaimer-zh_CN.rst
new file mode 100644
index 000000000000..5934369b2606
--- /dev/null
+++ b/Documentation/translations/zh_CN/disclaimer-zh_CN.rst
@@ -0,0 +1,9 @@
+:orphan:
+
+.. warning::
+     此文件的目的是为让中文读者更容易阅读和理解，而不是作为一个分支。 因此，如果
+     您对此文件有任何意见或更新，请先尝试更新原始英文文件。
+
+.. note::
+     如果您发现本文档与原始文件有任何不同或者有翻译问题，请联系该文件的维护者，
+     或者请求时奎亮的帮助：<alex.shi@linux.alibaba.com>。
-- 
2.19.1.856.g8858448bb


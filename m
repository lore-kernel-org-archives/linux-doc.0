Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C588DC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 05:56:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbiJUF4y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 01:56:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiJUF4x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 01:56:53 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68D311AA251;
        Thu, 20 Oct 2022 22:56:51 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=key1;
        t=1666331810;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=0u6qyhnCAlQ1d7P6scmoLBK8nHnEUK4WWC2Tj/LMqlU=;
        b=hLBS643EDhhyJMbCDPJBb9piRbtnt7MUxMZNHrXpMLI2cEKvoGMv6pV078Uknk3Y0q5pvt
        lth4x9lcGkPDPp2Zi0yM6btCTQ2FvIiU9XBc0REmJ9Kn9KXfZy59SmOynQX1FsIJRmWuA1
        285T7jJ+G5d/k+oVGHyk45/ObxrPWsTMiFEcxv8IuGH0Zcyq/f3G9HPZOcj05553mT8HWe
        zg0LcKPrLZOXpKT1BCSbfJuQzgnoqeuE351wftkvNOmjCP7WQ3AUydjBU6XF76Esq/7AMc
        B0p3Boe1zUL+o6jhhJqBRa75sYttKkRLSE0NTaqxX7l62IdbpyLLOmGjBOY34g==
From:   Rui Li <me@lirui.org>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Wu XiangCheng <wu.xiangcheng@linux.dev>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rui Li <me@lirui.org>
Subject: [PATCH v4 0/2] docs/zh_CN: Add staging/index and xz Chinese translation
Date:   Fri, 21 Oct 2022 13:56:21 +0800
Message-Id: <cover.1666328379.git.me@lirui.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate the following files into Chinese:

- Documentation/staging/index.rst
- Documentation/staging/xz.rst

Add staging/index into the menu of zh_CN/index. Also fix one
translation in the zh_CN/index file.

Changes since v3 [1]:
Add missing reviewed-by signature for patch 1 and 2.

[1]: v3: https://marc.info/?l=linux-doc&m=166627656723013&w=2

Rui Li (2):
  docs/zh_CN: Add staging/index Chinese translation
  docs/zh_CN: Add staging/xz Chinese translation

 Documentation/translations/zh_CN/index.rst    |   8 +-
 .../translations/zh_CN/staging/index.rst      |  26 +++++
 .../translations/zh_CN/staging/xz.rst         | 100 ++++++++++++++++++
 3 files changed, 130 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/staging/index.rst
 create mode 100644 Documentation/translations/zh_CN/staging/xz.rst

-- 
2.30.2


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 594B0C4332F
	for <linux-doc@archiver.kernel.org>; Wed, 19 Oct 2022 12:35:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbiJSMfX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Oct 2022 08:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232525AbiJSMes (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Oct 2022 08:34:48 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4CE731340;
        Wed, 19 Oct 2022 05:14:38 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=key1;
        t=1666181572;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VVCs7WQep6i6gIMaAL5uWBOvoNwiv9dL9OwYbl8Fxz8=;
        b=IFGcYZabz380HJ5L2uAgj0rMpmKNT1aSzi66m0ORydXkPlgD8vTnz4+P80cgN2xKEue5fT
        +E01khPflU3ywkLGNGC57uAVJGV5vWU2IulfxpuGpbnUY3Uq5FnMgO/N9TgWuig4xksQ+K
        quf6tSTB6e9pyUeulZ+CR0BbcYMDu6GRQ2WZlVn5ICU2jdORqolEDwR6bt00QLBCzZFuoJ
        0k6SlRoJEbciavO/R/NlF/2H6kH9BbesL8JNwnIiJMys03dyVVHXBT4lNVLi2Z4up+EOV2
        lRevVJ2Ix7YAyiwxKHbXexD5rbvHB87Qc7zm4jXNqkBJYsAb2jf7AdvuTCyp7A==
From:   Rui Li <me@lirui.org>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Wu XiangCheng <wu.xiangcheng@linux.dev>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rui Li <me@lirui.org>
Subject: [PATCH v2 0/2] docs/zh_CN: Add staging/index and xz Chinese translation
Date:   Wed, 19 Oct 2022 20:11:55 +0800
Message-Id: <cover.1666181295.git.me@lirui.org>
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

Rui Li (2):
  docs/zh_CN: Add staging/index Chinese translation
  docs/zh_CN: Add staging/xz Chinese translation

 Documentation/translations/zh_CN/index.rst    |  8 +-
 .../translations/zh_CN/staging/index.rst      | 26 +++++
 .../translations/zh_CN/staging/xz.rst         | 99 +++++++++++++++++++
 3 files changed, 129 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/staging/index.rst
 create mode 100644 Documentation/translations/zh_CN/staging/xz.rst

-- 
2.30.2


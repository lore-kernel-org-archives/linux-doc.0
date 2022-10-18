Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7D0C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 11:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiJRLz0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Oct 2022 07:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229705AbiJRLzY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 07:55:24 -0400
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D191495AE;
        Tue, 18 Oct 2022 04:55:21 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=key1;
        t=1666094119;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=p1pHbprhXkTEzsEX5N8roFvnRzHIR+4tcfEqHqpfjDU=;
        b=Fjx1TxyczRMGZq1CqUdP8Ys1pW2oP6OGDJiDljsZm6TSCkl34KwQ2vhBhkdxUgWXWECP98
        KmAro1g0Uzfs97bh9JmvUza4QrwK1mNlEj86Hk4pO6W+hLmaXTxfz9A50VDbH/vrVNZUzr
        MOcazpYWXlc9luW4In96bvCu95Yp45ZnCflsE8ITmkeipRjzIWfUjSOotPqLI8RR2Jn8jw
        3RwveSafK3x17YqVmj3yvPIk4npf+sy96j9kHSGqlulPUmDs09UKHAz2vb6oek75dpe8SG
        k4FhBuadXi+XBHSmOWViUViXGJjVcWxX/jvbhFkgXOuWc6vzx88GCYDsfJpX+A==
From:   Rui Li <me@lirui.org>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Wu XiangCheng <wu.xiangcheng@linux.dev>, Rui Li <me@lirui.org>
Subject: [PATCH v2 0/2] docs/zh_CN: Add userspace-api/index and ebpf Chinese translation
Date:   Tue, 18 Oct 2022 19:54:51 +0800
Message-Id: <cover.1666093699.git.me@lirui.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate the following documents into Chinese:

- Documentation/translations/zh_CN/userspace-api/ebpf/index.rst
- Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst
- Documentation/translations/zh_CN/userspace-api/index.rst

Add userspace-api into the menu of zh_CN index.

Rui Li (2):
  docs/zh_CN: Add userspace-api/ebpf Chinese translation
  docs/zh_CN: Add userspace-api/index Chinese translation

 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../zh_CN/userspace-api/ebpf/index.rst        | 22 ++++++++
 .../zh_CN/userspace-api/ebpf/syscall.rst      | 31 +++++++++++
 .../zh_CN/userspace-api/index.rst             | 51 +++++++++++++++++++
 4 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/userspace-api/ebpf/index.rst
 create mode 100644 Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst
 create mode 100644 Documentation/translations/zh_CN/userspace-api/index.rst

-- 
2.30.2


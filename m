Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F64C4332F
	for <linux-doc@archiver.kernel.org>; Sun, 16 Oct 2022 11:59:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbiJPL7A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Oct 2022 07:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbiJPL67 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Oct 2022 07:58:59 -0400
Received: from mail-200160.simplelogin.co (mail-200160.simplelogin.co [176.119.200.160])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8263C8D6
        for <linux-doc@vger.kernel.org>; Sun, 16 Oct 2022 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=dkim;
        t=1665921536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=pbbFFRETcqbPxIYeu3GqDRTtJt9V9EKGK3LVAFNYRmA=;
        b=BGOScIprcB9RW6Ed4E671GX7Tpkkk8bHwGoZELnHuQYCWKHbxtfj/2fo9TzThYVNCvR09G
        EdpAV8LiRpPe4eFzf8jtC7MD7G7VzP9c9mF8xeiHRsORd91vM0JhshhBIXIBbOp8cfNIde
        zbQJR79+nnXrv1qLk3UVGyfSTe0v8e4=
Subject: [PATCH 0/2] docs/zh_CN: Add userspace-api/index and ebpf Chinese
 translation
Date:   Sun, 16 Oct 2022 19:58:42 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From:   Rui Li <me@lirui.org>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Message-ID: <166592153626.7.4500669936128595360.69288105@lirui.org>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 69288106
X-SimpleLogin-Want-Signing: yes
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
 .../zh_CN/userspace-api/ebpf/syscall.rst      | 31 ++++++++++++
 .../zh_CN/userspace-api/index.rst             | 50 +++++++++++++++++++
 4 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/userspace-api/ebpf/index.rst
 create mode 100644 Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst
 create mode 100644 Documentation/translations/zh_CN/userspace-api/index.rst

-- 
2.30.2



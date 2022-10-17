Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B02EC4167E
	for <linux-doc@archiver.kernel.org>; Mon, 17 Oct 2022 13:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiJQN1e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Oct 2022 09:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiJQN1b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 09:27:31 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C8365E56D;
        Mon, 17 Oct 2022 06:27:30 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lirui.org; s=key1;
        t=1666013249;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=pbbFFRETcqbPxIYeu3GqDRTtJt9V9EKGK3LVAFNYRmA=;
        b=RUTZlXdzYUgzsEFdwf5FDmGIa1X1J9/Qud/8S/ZHtJne6BenhTISCmzjLWffcRatYuKsAX
        jk6b40frwe8LdEXOGjR00sMeX9J711Gef+sjP/vLv/Wioqror6hpe16yrC/qVXNGMP+WlN
        OxFN/bX1xGdqIyb6HoUbBFurvcbTQAN5A09Z3Az9soIHBkj+LYfYzltLqi/q2ob2Z3uDWP
        T/OoOBR8vFhM7S0fFLkJSHJUTqtbVmfIuWbjwBJp0tBfS7h4PEH5r0PPPCT4EPXOoQ+iBH
        ImIAod/3+gsynMTJb63ptG8hJj8/oh8EbHM+Wiz/xkJwqU4dq6FbXw6FXIXJaA==
From:   Rui Li <me@lirui.org>
To:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rui Li <me@lirui.org>
Subject: [RESEND PATCH 0/2] docs/zh_CN: Add userspace-api/index and ebpf Chinese translation
Date:   Mon, 17 Oct 2022 21:27:03 +0800
Message-Id: <cover.1666009558.git.me@lirui.org>
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
 .../zh_CN/userspace-api/ebpf/syscall.rst      | 31 ++++++++++++
 .../zh_CN/userspace-api/index.rst             | 50 +++++++++++++++++++
 4 files changed, 104 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/userspace-api/ebpf/index.rst
 create mode 100644 Documentation/translations/zh_CN/userspace-api/ebpf/syscall.rst
 create mode 100644 Documentation/translations/zh_CN/userspace-api/index.rst

-- 
2.30.2


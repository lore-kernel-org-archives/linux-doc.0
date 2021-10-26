Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC1AC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 11:46:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B794960D07
	for <linux-doc@archiver.kernel.org>; Tue, 26 Oct 2021 11:46:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235551AbhJZLsY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Oct 2021 07:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233543AbhJZLsY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Oct 2021 07:48:24 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFCDC061745
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 04:46:00 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id e200-20020a4a55d1000000b002b8bedf08cdso441291oob.1
        for <linux-doc@vger.kernel.org>; Tue, 26 Oct 2021 04:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1MOPH8gZ+/Md9cZp5YJDmbOaUF0FBKy2gkGYIUl0wng=;
        b=kXrGqsVAtxCQagzJLTFu+YZNxfpOuRujQ8tiSaAO4tXf5H4gYqGR30ez1nNf/5a/J8
         qYYC+vgXdRFw1eqjNq/NORu6qHSSdI9/1tux7Cbg5C99cP+AyDaDkD3dTaPaHvLUUeJT
         L+JmKP+IraHhSUPRtU7bB3qKrfs5HkLExeXK7Md/sw79y2iwqIOf3iqbY78onkiRRR9z
         VVRb2g/2sg9t3F4grwylms67QL5G9BGC1+8HykO03yHl/4Uo1rkvbLRVL7PGNFd4MqiA
         qFqWrczHxbR6rV6uOl2EDLSuZDdCgwbRvBZAyzinJ0Sg5gPvaWOjLgfoBRSTyDAQowfo
         6Kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1MOPH8gZ+/Md9cZp5YJDmbOaUF0FBKy2gkGYIUl0wng=;
        b=gEmJpF2xA1PU1imulNsr3FPnLic1G4f3Q/zTk5EiBGhSUDw+K3CcX063Z894uWQPeV
         LcrM+fiJkjdf/n5A/F5Xc5K+lkV891D0oFHUJtWPEtydTuKazxPRFouNUi7keH+faxQh
         c3LaY16Cs2Qho19nQlr9NtB4Urtk/GfqMJo1LH27bspb0PlqaR0ceCaWeMZm9xB74i08
         vk485h6Y8aWtgjqSbHOXIiDvTqflcqAos8+ZIUCUjT/FZKWu6sgLWSFttz54MStr9A/n
         G2xG2+8orADpvTKeahcdoLBaqKetelVr1wP6DG2OINShD6PMA1uP3xlmEP6Eb8Vxfi3c
         A+CA==
X-Gm-Message-State: AOAM533C4/1DRkTqvF6FB17VnviQ00qwkHZqhvTEvsXASxLC0nkOmxRw
        THwCDU0ZHjOd1Tvt208ZJq4=
X-Google-Smtp-Source: ABdhPJxbBJ8fkWIIcsBnaJ99jkfx+0g3Rv5ra4rnMUDuRFp8YjdL4FPP6yqJInpXvx40QVQCv1S5zA==
X-Received: by 2002:a4a:a847:: with SMTP id p7mr17014747oom.78.1635248759957;
        Tue, 26 Oct 2021 04:45:59 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.170])
        by smtp.gmail.com with ESMTPSA id e23sm4404340oih.40.2021.10.26.04.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 04:45:59 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 1/2] docs/zh_CN add PCI index.rst translation
Date:   Tue, 26 Oct 2021 19:45:30 +0800
Message-Id: <668466823fd2b66768553f12199bce74e8450f78.1635248253.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635248253.git.siyanteng@loongson.cn>
References: <cover.1635248253.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate ../PCI/index.rst into Chinese

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/PCI/index.rst          | 35 +++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |  2 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/index.rst

diff --git a/Documentation/translations/zh_CN/PCI/index.rst b/Documentation/translations/zh_CN/PCI/index.rst
new file mode 100644
index 000000000000..8c6dec03856f
--- /dev/null
+++ b/Documentation/translations/zh_CN/PCI/index.rst
@@ -0,0 +1,35 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/PCI/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+
+
+.. _cn_PCI_index.rst:
+
+===================
+Linux PCI总线子系统
+===================
+
+.. toctree::
+   :maxdepth: 2
+   :numbered:
+
+Todolist:
+
+   pci
+   pciebus-howto
+   pci-iov-howto
+   msi-howto
+   sysfs-pci
+   acpi-info
+   pci-error-recovery
+   pcieaer-howto
+   endpoint/index
+   boot-interrupts
-- 
2.27.0


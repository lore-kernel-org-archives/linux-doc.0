Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8C3C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 10:04:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0511611C7
	for <linux-doc@archiver.kernel.org>; Wed, 20 Oct 2021 10:04:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229921AbhJTKGv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Oct 2021 06:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTKGv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Oct 2021 06:06:51 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 645D5C06161C
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 03:04:37 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id y207so8961160oia.11
        for <linux-doc@vger.kernel.org>; Wed, 20 Oct 2021 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TKSTQFxBfJYemHJuqCR1+mMXk3djQmMoKbqXIFVhrj0=;
        b=Nu2bI9ehkO1iLYO0RjZqKzz2mqOV2PV5YprRKKEZPMH/qiJPzmJ1qN68jFBwOyni5z
         rcWtKuYJ7YoZSRRLkOz4wrSO/9GZYVkC73GJblo6WRHDnEAhgDy3i9j99ZLRXMtPyQsu
         BjE6OmZdTatXPyEeKvpno1zPbXBwRDjnJqVUOYOMJNmKcrDvSJllPkQKsp2VlB9WbDoe
         cTOI2HIfJmkwsaiYJD4ThjpwNG1usDC7lT7g7F3NaptK82VpTu3ujwYmJ2kz55ITR7V1
         ufuptxxeIV/4yDvfsNYVhmjJZGW2QQ+BypjBRl6vlFKK+S8s95M7m/vuJid+DRTofsw3
         2Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TKSTQFxBfJYemHJuqCR1+mMXk3djQmMoKbqXIFVhrj0=;
        b=2y6D1STvXTiXB+7JWSW2wTA2BOp+1gegESmw7cXP7UDREbKq/3fRBcSOn/uQC4Wqal
         LwwuS2bBafLkSIk933UbYaM3BImLpcnxwlxcS1jDAnrfLSBH0P7ECbGW8ze5TGGjh00j
         eZGyCuCiZupt+pwcjVKtw6ZUJuFsBzHvTy0NP/Is+kWkWnY5pPboRF9aH/+p8+RBNf0M
         6Zg2TC/vzh0JqAT1CDorwbc8Z4IkLon57Nys+wFf24Vp2xTTrNi30s6I8l5Dk2Fo0qFG
         O5zZGvaucRYlr9nte7PBPF+vLHgSTr8E8yaG3DoMwZT963blhKggB24r9ng7prKy5Jpq
         qGlA==
X-Gm-Message-State: AOAM532gYlVtG1eHXnI3L7eEglIUY2oXj7ggWZ4o/sEiYsMHSSkMtxbw
        k1qDDgSAxcR6hT1woBoe8mLgeowpMDOC7XEC
X-Google-Smtp-Source: ABdhPJzmk155Sv8D9+294ZhdpYQC6bIoet+slfpTnu5CEphNBiE7c54LzWxVhNMelLVvk/+nKVtvig==
X-Received: by 2002:a54:4688:: with SMTP id k8mr8746120oic.70.1634724276815;
        Wed, 20 Oct 2021 03:04:36 -0700 (PDT)
Received: from localhost.localdomain ([8.47.15.131])
        by smtp.gmail.com with ESMTPSA id h91sm374557otb.38.2021.10.20.03.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 03:04:36 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 1/2] docs/zh_CN add PCI index.rst translation
Date:   Wed, 20 Oct 2021 18:04:12 +0800
Message-Id: <d40830880bdf788512023735b69fcadcfa824578.1634723736.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1634723736.git.siyanteng@loongson.cn>
References: <cover.1634723736.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate ../PCI/index.rst into Chinese

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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
diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
index a34e58733ac8..45bfd0774f2d 100644
--- a/Documentation/translations/zh_CN/index.rst
+++ b/Documentation/translations/zh_CN/index.rst
@@ -106,6 +106,7 @@ TODOList:
    virt/index
    infiniband/index
    accounting/index
+   PCI/index
 
 TODOList:
 
@@ -137,7 +138,6 @@ TODOList:
 * vm/index
 * bpf/index
 * usb/index
-* PCI/index
 * scsi/index
 * misc-devices/index
 * scheduler/index
-- 
2.27.0


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68648C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 02:42:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4632460C40
	for <linux-doc@archiver.kernel.org>; Fri, 12 Nov 2021 02:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234503AbhKLCpP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Nov 2021 21:45:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhKLCpO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Nov 2021 21:45:14 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25589C061766
        for <linux-doc@vger.kernel.org>; Thu, 11 Nov 2021 18:42:24 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id g19so7245461pfb.8
        for <linux-doc@vger.kernel.org>; Thu, 11 Nov 2021 18:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CIxK+JO32fIcULmlVMYfluY5dPjP4xil6d4Hnbt8Ao=;
        b=WORhjw0xorTpHpih6+N7+gp0BaTHg5naij9oAs3hqTok1l7yd77Txptb8awXHzGqO7
         PSToYslapYIDwhRzlJ+1OSIbf/1r8qAMsu6FCIGcYn0Bs+DSsPAWIYWVaHUfUBOGa7kH
         EXaJWPRmqi7zTgAUskkHMOEr4wNfFZkl5VsvFtSwxal6FgC713tMqcFRXl4sR4sYtw1R
         EzYyN5KLCILV2Epn3Ut7BC+YA6NPTpoBQ1DpDrugQsvDLrPXGNAJmmrz36BrHyIjXSHR
         CqG3PJF6ZEAEqLNICaLiRGhSTZUaoDkJ9coyvvSUcuu1At9iToBlvLVGKw/yXBt6rcWo
         jqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2CIxK+JO32fIcULmlVMYfluY5dPjP4xil6d4Hnbt8Ao=;
        b=qsHsNzpIE6qWwbmjIk2ltcWPGccNVPu4Ypz367yUppYaTEnolOmJ5yxhKrhjwfYNbR
         xP9tsE9QSjj0BaeYVQg59M6s6c6mzqkO/aI/NhZIPiBIrV4cfILnsQrfcVem9ArgSJqH
         7Fl+9wBGXltRSYPZ9hKY5YeugqzAtSNSkb6MttN1IpbJWPI0eglX35cZJPcyrcSzUJIp
         m9pzPPNrCsDkKQTZmLlrAhfkZ4kxWrGZGd11KsDdLlKEuO1Rq8tbgrgumZP6qHMidWo4
         29K7Zf34FNzHdEsXwwRVL1jScBeAXRJpteB28rptnxqwSJUmyQRwB8ckNqS3eVXh/rr3
         L2Lg==
X-Gm-Message-State: AOAM533FzAIXNzPRhif4fYlUiP9dI3kT5hF+pdIhxEGVtbVbj/w6XExK
        F7u1OG+Dk0mSWUzG8iWGEyU=
X-Google-Smtp-Source: ABdhPJwB3Cfis19qo8gkTAZfLe8tLxwKuiMfheSVUvwyEzSAX/JPXBks1MjFVnqr7ZT30y5kL1ajXA==
X-Received: by 2002:a05:6a00:1350:b0:49f:e389:8839 with SMTP id k16-20020a056a00135000b0049fe3898839mr10765954pfu.51.1636684943708;
        Thu, 11 Nov 2021 18:42:23 -0800 (PST)
Received: from localhost.localdomain ([8.47.69.168])
        by smtp.gmail.com with ESMTPSA id me7sm10874261pjb.9.2021.11.11.18.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 18:42:23 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn
Subject: [PATCH 0/2] docs/zh_CN: add msi-howto and sysfs-pci translation
Date:   Fri, 12 Nov 2021 10:41:32 +0800
Message-Id: <cover.1636684159.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../PCI/msi-howto.rst and ../PCI/sysfs-pci.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add msi-howto translation
  docs/zh_CN: add sysfs-pci trnaslation

 .../translations/zh_CN/PCI/index.rst          |   4 +-
 .../translations/zh_CN/PCI/msi-howto.rst      | 235 ++++++++++++++++++
 .../translations/zh_CN/PCI/sysfs-pci.rst      | 128 ++++++++++
 3 files changed, 366 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/msi-howto.rst
 create mode 100644 Documentation/translations/zh_CN/PCI/sysfs-pci.rst

-- 
2.27.0


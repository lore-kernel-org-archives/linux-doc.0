Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E235C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 08:09:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231196AbiCCIKd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 03:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbiCCIKc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 03:10:32 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73281704E9
        for <linux-doc@vger.kernel.org>; Thu,  3 Mar 2022 00:09:47 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id 195so3867988pgc.6
        for <linux-doc@vger.kernel.org>; Thu, 03 Mar 2022 00:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OREhomj194WNfo7uzyVT1KZ0ugIdzBmXXDvAXEfCM6Y=;
        b=O0sVne0LPcb3emK9egoDOaB2r8aOgMXBhtVnplNH80H+6g+m8HX3vlp9eV98/HbWEZ
         aY6W2AlHD1P99FEz4WJDIl2B7ftzp8D6J1wBxpESTmk1LJDlRBA0a+/6QcWi2IoetVBS
         QIlsGrMbYI/VDkmht8/rUDcCfyqvWHM/Zw5a3w55w1NNwJK7FRw0WBorQcs6Q5ANQJnu
         oarj9C68pVqya4PatXKXmE3Etx0URIJQ+AaDnUg5Iv3JlkODa5cTtwztbmFJ3uTqXGno
         zo5UHb48L+ZFuBooQ6vr3X2CbXSCF/LfTMdwYPdf6aB4XBD6IBaWgn+7W51IfVZ7jzKh
         OEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OREhomj194WNfo7uzyVT1KZ0ugIdzBmXXDvAXEfCM6Y=;
        b=Y0o1HC1v1DhBgvV3sV6/J3lzkOGPQmKUTv1j5aXPlLS6CX+/3stcVDHIFvSbVaZiJF
         c5QRAUFnoqgbJfpWjhOompe82g8EbgqkQ/cRFaD4yJn+xTG+WYGiv8etsQcQh4R0xEZh
         kCSzyd+BYb/yY4f9iYy/gfyN95IzDVq99pUXVTTqilxzwEbWGXo5fGC4UcsE1y0MOO7/
         M51j460GXqT8cY+62zJtLH+Xh5/QSxJUUhpkrFshQXl85C7K866CshTwS53HTxRkDEDN
         CeStjpGBx+xyY+wEgx5PmVxw+cthMrTa30LULBmU7l3xzpu/TbI90Z7q6JC/2Juupimx
         KXow==
X-Gm-Message-State: AOAM532aqudfoP4K5v98KeVk0x8/+2oKSW7NTV+RHsfLKWVcHZrzemQr
        qTrFAh5rl4WjU50BrH8loxDcwh7BrScIvsZo
X-Google-Smtp-Source: ABdhPJyi0op7jC1XgvMAf1YOfv56Csti6DqPreQGkoRyK82lCVBIPE0KpgCbAYEaCx5NJ2fSeJ6R0g==
X-Received: by 2002:a05:6a00:890:b0:4f6:686e:a8a9 with SMTP id q16-20020a056a00089000b004f6686ea8a9mr2888550pfj.83.1646294987359;
        Thu, 03 Mar 2022 00:09:47 -0800 (PST)
Received: from localhost.localdomain (42-200-190-71.static.imsbiz.com. [42.200.190.71])
        by smtp.gmail.com with ESMTPSA id 6-20020a630006000000b0036d11540db8sm1371229pga.76.2022.03.03.00.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:09:46 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH 0/3] docs/zh_CN: add devicetree translation
Date:   Thu,  3 Mar 2022 16:06:26 +0800
Message-Id: <cover.1646294349.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v1:
Translate .../devicetree/of_unittest.rst and .../devicetree/usage-model.rst into Chinese.

Yanteng Si (3):
  docs/zh_CN: add devicetree index translation
  docs/zh_CN: add devicetree usage-model translation
  docs/zh_CN: add devicetree of_unittest translation

 .../translations/zh_CN/devicetree/index.rst   |  50 +++
 .../zh_CN/devicetree/of_unittest.rst          | 189 ++++++++++
 .../zh_CN/devicetree/usage-model.rst          | 330 ++++++++++++++++++
 Documentation/translations/zh_CN/index.rst    |   6 +-
 4 files changed, 574 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/devicetree/index.rst
 create mode 100644 Documentation/translations/zh_CN/devicetree/of_unittest.rst
 create mode 100644 Documentation/translations/zh_CN/devicetree/usage-model.rst

-- 
2.27.0


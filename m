Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A82EC433F5
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 08:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbiCGImB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:42:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231623AbiCGImA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:42:00 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D59C2559A
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:41:06 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id v1-20020a17090a088100b001bf25f97c6eso5997469pjc.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mUkL3ssXjwlY1F1cQIKXlAh+KmYlfeCkjw17drc+d0Y=;
        b=IF2drHa1jEC/P1oJK5+JBcViwRWSP9iPuR3qUB+2RtIBJHM7zHiICqQkvuTSUFztc6
         O6h0PBd9F2+s5naGe8NXxxmNHyxO6Rh2ffdMaZJGoAGRXJouzTcBkoVrpcY7eXFstVMq
         xKOkBtk1D9GSKpeMJ/c4P9r67pxwA4Q01w4glXWekBrGaRFl5+Dg/AQIR7+jlsJd9j3C
         JaEQm7C0MZ2rOmUuZDvbI3JgEXQgPQfWGX3Ze/yp/2dBdkEvZBxYgaPyc60OtyQ6/QjE
         O/8W0ke2NJjImTK/YjYNWepiAzjmZuqlPNiO/CGDDn6PO1agg4m1GeLgZCPDCgwl1vnb
         FpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mUkL3ssXjwlY1F1cQIKXlAh+KmYlfeCkjw17drc+d0Y=;
        b=j9V0EGIA+fvPyhDsADgUZcIQbopnpMaxeFWKx3de6KBWg9HkZa+JATJexSGMiFx45X
         Rh/KrgWB3+4zV++qSvz1LF6MZxe+3A/836CPFjpl+IkDKwzai4CLNiRWk4A6V59ovup1
         vO9gb8xnYMgbqZ0CUz88AiwD2MnT2oNO4/VYcMapkRZe1CVAVyvSCHaWEmVndu3YAMHA
         oewzv1ckkb1GKE4OXsjQi1Em+xQghkGWrIWkusynkZ1i1PaTv4rNur9tBQWXzdwp4OPC
         OBC9cYFIIOawSZNCDb4plCDW7GfAvkmGZKmBCr86xcs5qhbhfreo07LfjvExq5bN3Lgd
         t1Yg==
X-Gm-Message-State: AOAM531sbwo5WXZ6zdOuwoJPMuz3JQdKVihPxbfDvzKMmpnsqqeWM4B5
        CwGkId4vYh5xt3HaMy1Rsfw=
X-Google-Smtp-Source: ABdhPJxJQ2WcjwAKxUM9cdf4uV2q9yePTwliqrd2l+hFJyJhUaTMhGC75RImwvHiR1gC6B5BBtHjmA==
X-Received: by 2002:a17:902:6b04:b0:14f:2cc0:fa98 with SMTP id o4-20020a1709026b0400b0014f2cc0fa98mr11060477plk.44.1646642465804;
        Mon, 07 Mar 2022 00:41:05 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id bd10-20020a056a00278a00b004f6fe0f4cbasm2929431pfb.101.2022.03.07.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:41:05 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/3] docs/zh_CN: add devicetree translation
Date:   Mon,  7 Mar 2022 16:42:19 +0800
Message-Id: <cover.1646642188.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

v2:
* Pick Alex's Review-by tag.
* Modify "test-date" to "测试数据" according to Alex's opinion.

v1:
* Translate .../devicetree/of_unittest.rst and .../devicetree/usage-model.rst into Chinese.

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


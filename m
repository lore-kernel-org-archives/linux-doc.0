Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72587C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 15 Jan 2022 07:17:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbiAOHRX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 Jan 2022 02:17:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbiAOHRW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 Jan 2022 02:17:22 -0500
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34879C061574
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:22 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id 128so4810560pfe.12
        for <linux-doc@vger.kernel.org>; Fri, 14 Jan 2022 23:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFs7Sf3VyEc2Q2siyyQooXBX8bqlbXgps1Z8FYBk6Ko=;
        b=PXIWOlLWwrikiDwOtgAo6Pm4RJWeiEtw1cgwtZGZyKZ8KDSGFZtVXXKW4ztcclop12
         lWnSTZ3QHdDa0CeXX7BHZCTs5TefrF4YNkDUX1CVPy4SAYbCLVmPNCix++dsYfbJPEmS
         c0IK+QmltgxOkFn8uhNaga3OjRI+jrkyajKKc55MI0U0MDTUiIn/TpmA2kgCVSvM+2A/
         cyHaGGujzK7FPf6DHJo6PYWo2qDzXfEiXPsYEZ61roktq+KhKxf0g4yaqDgw348nrbuX
         XtjfFJROAXHtf13CBFXQoXzv9soRQjnuycrrvM3zfR5Flp533fK+a9KswpNb4zBZrUcI
         Nlxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFs7Sf3VyEc2Q2siyyQooXBX8bqlbXgps1Z8FYBk6Ko=;
        b=5EE+Jr6GMhK9BUNcjX2fQWUld2UVURWdXGpP5BhxTq33yF3GRNTA+X700vuMolPXjB
         uZRNa4RFGKZmOHvlHY6ZK8P5MlYzNreek0PQJuUKzeM4NKx76F8dmAG+Wyv96UrxQPwu
         KV6hee+UGmQ/f+5DIuIELckZQBU0MzgtPjN8Oc8epyes5KxvmipKG8hekICakp93EnDh
         Zm691/KOyjl1RwJ7Lev1JDFDaNdfkqCzoDAS8H8xTDx7Z9Hljowmt6Fs62/9JH4gwTtP
         knTEs/N7SbZVRKO8dLx61jHNAvgGJ3wl7dwrC+zhUP0CoUsDifYUFJeZhJa0RhcUsBlz
         OgAA==
X-Gm-Message-State: AOAM532F/OmYC31GdPE4+4FHX2q3dPI5WXhbyIGDxz7TBObcwNGVRuEe
        TP+zwPfSE0JcjVtCayGQe6c=
X-Google-Smtp-Source: ABdhPJxzj2Q/xEGUMz2DLLXcLJHp04dr1DWeIi3v16BeG1nJ1Q+R18Y7ljcQj97b3GGpiqx0onVFwg==
X-Received: by 2002:a63:eb0f:: with SMTP id t15mr11032606pgh.145.1642231041465;
        Fri, 14 Jan 2022 23:17:21 -0800 (PST)
Received: from localhost.localdomain (cm218-252-25-221.hkcable.com.hk. [218.252.25.221])
        by smtp.gmail.com with ESMTPSA id u8sm7888909pfi.147.2022.01.14.23.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 23:17:21 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v2 0/4] docs/zh_CN: add vm damon translation
Date:   Sat, 15 Jan 2022 15:14:59 +0800
Message-Id: <cover.1642230669.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2：
* Pick Alex's Reviewed-by tag.

v1；
* Translate .../vm/damon/* into Chinese.

Yanteng Si (4):
  docs/zh_CN: add damon index tronslation
  docs/zh_CN: add damon faq translation
  docs/zh_CN: add damon design translation
  docs/zh_CN: add damon api translation

 .../translations/zh_CN/vm/damon/api.rst       |  32 ++++
 .../translations/zh_CN/vm/damon/design.rst    | 139 ++++++++++++++++++
 .../translations/zh_CN/vm/damon/faq.rst       |  48 ++++++
 .../translations/zh_CN/vm/damon/index.rst     |  33 +++++
 Documentation/translations/zh_CN/vm/index.rst |   2 +-
 5 files changed, 253 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/damon/api.rst
 create mode 100644 Documentation/translations/zh_CN/vm/damon/design.rst
 create mode 100644 Documentation/translations/zh_CN/vm/damon/faq.rst
 create mode 100644 Documentation/translations/zh_CN/vm/damon/index.rst

-- 
2.27.0


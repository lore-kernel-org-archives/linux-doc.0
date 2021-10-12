Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC4AC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 12:34:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B43B61039
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 12:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236445AbhJLMgN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Oct 2021 08:36:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbhJLMgK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Oct 2021 08:36:10 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04AE5C06161C
        for <linux-doc@vger.kernel.org>; Tue, 12 Oct 2021 05:34:09 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id lk8-20020a17090b33c800b001a0a284fcc2so1776806pjb.2
        for <linux-doc@vger.kernel.org>; Tue, 12 Oct 2021 05:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kkQWp0j1s7Q9oCEjUY1c0EReF7Mybo73c1vBKPciGE=;
        b=NBCv7dNZ30cY5UMFdle/ozbaHh2iSJaDmKsltPMVG027vwBLnLmkjPxNvnWBwf1RxF
         jCpC/otT48Ux8+8fGUoSqpSjnyWgiBQbWOGn6YZxQ1KFaeedE1+V+7to6A28QWjqiMM+
         6SKKns84+STdzVHGIpBSDMDY7muxRNwz2E8W0+qoVB9297CjjI09LoPCxNPwPFlUX8QQ
         M2lUnWgmzTDL18nBDTM7WqDezyEMo7DaiPe8WngULcbtJpNJ5J902s9DA6HWLm0/35wy
         MVjNG9Ijnpj08NqjKA56UMV5jW0eLOZc5nLy8XzKvF/IzKP9qrKIoFsiOp6KBbrjb+6G
         +A+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9kkQWp0j1s7Q9oCEjUY1c0EReF7Mybo73c1vBKPciGE=;
        b=3AJRkpSz1CSlBWWbfzoDO40ntOIqxcP9M3PUKWqz5Ci0Trcdz93FolwBLpg89CesY4
         9xXWsECsY8eZXWbo9dt6X9WZjV7DiUQBPHoTllezsUDBajtyxxLMz8paG8MaG7hotXa7
         ZkP0xpFOZjgyeWm2L17tgnMEk5qNHWweZry5gA3jRjUS8tnuLwxNHY90E9/QheB9XCzj
         J796/CV0wRttXlmuFt4qGleiZ6aU20FwAg5GEQp0Mhecdvia9j/ue6VTqAb4MTHfRdmW
         Utlst635AvM4OWt3nWRoeRABo/Ij2KwZVl5QZU5d9OXnvcU7GM+hSWFYSG3+uqcLLLFb
         irXw==
X-Gm-Message-State: AOAM531f5j83GLiFGDXYddC1oBYX4ywynN75Qq8F0ygoaBreNr6SNnEx
        Ua5qDnIVtSnk9G3S3P6m8Yg=
X-Google-Smtp-Source: ABdhPJyH6+g9fDsMpTTiljJX4wSsxqj50cR3UtznfR5StzMK7nOAcbT0qzFuDAlJQjVmNdxD1FprXw==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id nu11mr5692163pjb.210.1634042048500;
        Tue, 12 Oct 2021 05:34:08 -0700 (PDT)
Received: from localhost.localdomain ([8.45.41.28])
        by smtp.gmail.com with ESMTPSA id i7sm11214317pfr.218.2021.10.12.05.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 05:34:07 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 0/2] docs/zh_CN: add core-api assoc_array and xarray translation
Date:   Tue, 12 Oct 2021 20:33:53 +0800
Message-Id: <cover.1634041639.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../core-api/assoc_array.rst and ../core-api/xarray.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add core-api assoc_array translation
  docs/zh_CN: add core-api xarray translation

 .../zh_CN/core-api/assoc_array.rst            | 473 ++++++++++++++++++
 .../translations/zh_CN/core-api/index.rst     |   5 +-
 .../translations/zh_CN/core-api/xarray.rst    | 371 ++++++++++++++
 3 files changed, 847 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/assoc_array.rst
 create mode 100644 Documentation/translations/zh_CN/core-api/xarray.rst

-- 
2.27.0


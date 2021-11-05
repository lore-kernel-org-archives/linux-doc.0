Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4515C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:27:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D901604AC
	for <linux-doc@archiver.kernel.org>; Fri,  5 Nov 2021 02:27:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231898AbhKEC3m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 22:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231874AbhKEC3l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 22:29:41 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A24C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 19:27:03 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id g25-20020a9d5f99000000b0055af3d227e8so6623655oti.11
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 19:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j9ykbUb1YeO7QSdfXs5r6pJcJYNdJbS3WqEskbg8BFk=;
        b=ooAJ60ltj8GuWy60Y4j5GL/LtM1Upm7mfvUZmivUsh4sdaGIjiAzIDtwznZZEPxZaz
         8fPJ83uf6H+nwC7/hsLCmJsqHFpTzAKKV5wzTcNLWhXd2IiusBBH5ExbE8dADqp3hHbS
         2DI0ZeXHaCFp8ptUaaKJZB9E4ZeeK3X7w9+4EMURRfLKEImqD1cCfHHETlLDCYhSsMaI
         JGFVyl5UXOnPwEzOtrbJY3Oc/0iauC0+NKHldB8T4nFcS88IFgbn96QCjtKjFlY5dl6b
         yZwoNJYT1zsGEWtsADHQPcqUAbBfC6pYurMrtkN973P704PKU/5xQ31DgtMJa+AjL3pz
         Bu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j9ykbUb1YeO7QSdfXs5r6pJcJYNdJbS3WqEskbg8BFk=;
        b=DlWnqlrpegm2b3lM5RWklDJ1L2cMXiWNAMiBXun0LaxyD8hCy6xZaqzu6EoATCWU00
         9y7aA9Ja9T6qHB2oSrPHEourYk+KBX5HpwFxt7QCiYOUnLN0cN39j5BCyQQn2Lo1/BZe
         fehTDER/MQzOb1jewz+fPDVZy2Bd6f/Nn0ynYwPEEoS2Vn/5NSOzjA+GYsqjuDvapF4S
         MM63HZECYRD0N+sZjYZWq/R/rDx7ezImi0fVU+KDh/UC1kiqtJLvJVA1GcNm78ImEtKJ
         b5qkZKZAVtQA5Ap/K8E1pxvFHYwBzY5+nb0B4WYT+VSw0QGWPHUg5lSJD8CykkWA8RYt
         7I7A==
X-Gm-Message-State: AOAM530fpMlf+pgwbjckvEoxzC7d8gYm7GtKHYo+O9D0D3PyZD8QLZns
        hQRu0PPokMVxpl5jEEeJMb0=
X-Google-Smtp-Source: ABdhPJwIgnsFjix+di9OxtJFgFefSdoHRv4bpz7UBRWZAW2YOEOl8zYbUwzOGV/jd47FcAYFpFVuvQ==
X-Received: by 2002:a05:6830:11a:: with SMTP id i26mr5599521otp.204.1636079222324;
        Thu, 04 Nov 2021 19:27:02 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id j4sm1725231otk.38.2021.11.04.19.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 19:27:01 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        bobwxc@email.cn
Subject: [PATCH 0/2] docs/zh_CN add pciebus-howto and pci-iov-howto translation
Date:   Fri,  5 Nov 2021 10:26:20 +0800
Message-Id: <cover.1636027203.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate ../PCI/pci-iov-howto.rst and ../PCI/pciebus-howto.rst into Chinese.

Yanteng Si (2):
  docs/zh_CN: add pciebus-howto translation
  docs/zh_CN: add pci-iov-howto translation

 .../translations/zh_CN/PCI/index.rst          |   5 +-
 .../translations/zh_CN/PCI/pci-iov-howto.rst  | 170 ++++++++++++++++
 .../translations/zh_CN/PCI/pciebus-howto.rst  | 192 ++++++++++++++++++
 3 files changed, 365 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/PCI/pci-iov-howto.rst
 create mode 100644 Documentation/translations/zh_CN/PCI/pciebus-howto.rst

-- 
2.27.0


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9715C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 07:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238215AbhLFHGy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 02:06:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbhLFHGx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 02:06:53 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DC6C0613F8
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 23:03:25 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id n8so6466264plf.4
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 23:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aJqLVTFEFWUUZnSLJ96lbpbnqgg8iOP5eZSmYkNzQCs=;
        b=GBTKFt+il8s/rJjo8LHellV4aLJXuk7QYeIf0ES9CYMhPRVHJFhDvsw5+nG1fTa/rF
         55nZ6wCt6ZzXhTEKRRNbV8aQGwxPhWPWlcFueuT6xSjIcgm6rMZXiRmUU62Xbgs1dzCU
         3WHTQSBNEk+1PCNVfbizCHAWjYTZxDznV1wQ2LhW4hEiKZ4/DKX56y9jWtYhAZIc5Nwb
         gZrEi2jyok1P8FGYkwVIpcDPxOQK6vL8dGe07I7oiFUpwk5obLno5xLb01Iisihn0ay8
         MnY86sKQJncLrKccU5zVcuDeMUf6c4fWEAMaP/1CLiw8JNEyJjJPfQ6S0vwoNoHo+1WH
         zE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aJqLVTFEFWUUZnSLJ96lbpbnqgg8iOP5eZSmYkNzQCs=;
        b=i3cuWXYXB+3NlWWbvQ02guSGlWX7Xh6NqKrWmz4QBJEOwCuXZsS6qHuR33BuL23l8Q
         /M8qXyUpkhXQbcAGSG+1uf7O1Wcj7+gv5Aqj1e19+qz9sADyDDBcSgt0YxF+R4UtSLie
         XEqcjBSQ7Sr9/OD2OZXuYl05rRiWp1ACyxLWtgpTvMtzGYuTp3K4UBRDW2slFG4h/kQ1
         DNuVO4vXwM6rnjqs5YddO7LubQN2VyEYWQc0iZlWHksKKrG2k5lY2k+8ByMB/Yv2ifgJ
         VWZ6/bKmUfLIh9uNpHyqqiajXS6nKhMOva23duAxKyLnb5yklsOVzqYbwoYpNpxPnhlo
         X9dQ==
X-Gm-Message-State: AOAM533OC9LN2aqjTka837lgkA4amSxuSA3LZmNOx7wNdjV4BNemHSvZ
        R/4o4SCuzx0dW24UdjadSB1vgNIgaXU8Orm9
X-Google-Smtp-Source: ABdhPJzIJLm78BeXDopolP4jH0Nlk0FJs3zrvvuajwgUFvWDyLJXoHsCE2royFvm7+eaN5o/r/ww9w==
X-Received: by 2002:a17:90b:3882:: with SMTP id mu2mr35104863pjb.165.1638774205134;
        Sun, 05 Dec 2021 23:03:25 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id 63sm11066255pfz.119.2021.12.05.23.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 23:03:24 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        tangyizhou@huawei.com
Subject: [PATCH v6 0/2] docs/zh_CN: add scheduler completion translation
Date:   Mon,  6 Dec 2021 15:01:49 +0800
Message-Id: <cover.1638773872.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v6:

* Pick Yizhou's Acked-by tag,
* Fix a build warning.

v5:

* Modified some words under Yizhou advices.

v4:

* remove unused label.
* Modified some words under Yizhou advices.

v3:

* Pick Reviewed-by tag.

v2:

* Modified some words under Alex's advices.

v1:

* Translate .../scheduler/completion.rst and index.rst into Chinese.


Yanteng Si (2):
  docs/zh_CN: add scheduler index translation
  docs/zh_CN: add completion translation

 Documentation/translations/zh_CN/index.rst    |   2 +-
 .../zh_CN/scheduler/completion.rst            | 256 ++++++++++++++++++
 .../translations/zh_CN/scheduler/index.rst    |  43 +++
 3 files changed, 300 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/completion.rst
 create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst

-- 
2.27.0


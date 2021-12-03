Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54CDC433EF
	for <linux-doc@archiver.kernel.org>; Fri,  3 Dec 2021 08:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350558AbhLCIHa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Dec 2021 03:07:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235044AbhLCIHa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Dec 2021 03:07:30 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB051C06173E
        for <linux-doc@vger.kernel.org>; Fri,  3 Dec 2021 00:04:06 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id o14so1561808plg.5
        for <linux-doc@vger.kernel.org>; Fri, 03 Dec 2021 00:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RiW7paxhWUihs5iIFlbRa8ZAIgQVO/pYUWqDMk9Vo/I=;
        b=LX6sO2hreOaF5SGs5HCwOGIF1BIrVo7CUWaN3IgiRgxGXH0F9OC4Ej/FqKpumo1fwF
         Wc9P0uJgncVWKh4fCFfTXpC7HqF2zn2vgTQvJI0ExwukAvuWaSny3HztCUMhJc6x7tyl
         t4ZsYW7wpgo2jDpxrrbIOb2iFEBBEOdA67Bfg2F68wq8VMpIm1ge+8i9pbQX45h1rpc6
         2YZEm2jEZa2PnKT8ES6RWgvr5NbDckVNp3E+my4aC6VjKff8MPW7FSo9+8x4w2cbk5Zk
         lDLeoHmtUuiZg99gcpNUTW8r6QUFJ80EzNspL3T8F+kEPt85sfhrll9w+uh0SJK9nqiu
         Gi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RiW7paxhWUihs5iIFlbRa8ZAIgQVO/pYUWqDMk9Vo/I=;
        b=akuErVmLBQtKxtvzEnIxvEJ80erYyPVva/uUJ4rO/ULulcd9zFwocob2wAZJQvd2Y7
         ooTCmqBFlctw65sLUME2Lspzt+JBQ3urru0KoOOLcrvzdwyu7RKUTNR0cXeTG9ym8RqD
         mdzNoc4y4wK6VjETWUu8lETG/yc66GMBS/VeLalDkPpucOxaPFSQOUUj39WtRXn62vT7
         0ikUWzQnBPeT3CARkSRIdH6FtgIp0gnL+v3nAxk97i2sj5Jyk4O8h5Qlxp8GXE2LM7EY
         rY9pPMOEsnCOJrb2XajE6roKbfvB1s4eKfk9G6qZyM3kbie4jjLDYR9IrOgFLZC+ePA5
         YdFw==
X-Gm-Message-State: AOAM533BLrhbDCu/ibUzhZ5e4RB4+U+7qJudf3qnKeGxqy9SHtRE1CUr
        DVP6988vdB/QhUZr469z+okio31BvrgQgg==
X-Google-Smtp-Source: ABdhPJykH7L0GQ2GLGLO3ryz1l0duYvJDuvizYaWtZbA628BaGaiwROOdgr2q4tbtmDZDMhETpd96g==
X-Received: by 2002:a17:90b:1b0a:: with SMTP id nu10mr12345164pjb.35.1638518646326;
        Fri, 03 Dec 2021 00:04:06 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id d12sm2062883pfu.91.2021.12.03.00.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 00:04:05 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, kolyshkin@gmail.com,
        changhuaixin@linux.alibaba.com, tangyizhou@huawei.com
Subject: [PATCH v4 0/2] docs/zh_CN: add scheduler completion translation
Date:   Fri,  3 Dec 2021 16:02:41 +0800
Message-Id: <cover.1638515812.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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
 .../translations/zh_CN/scheduler/index.rst    |  45 +++
 3 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scheduler/completion.rst
 create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst

-- 
2.27.0


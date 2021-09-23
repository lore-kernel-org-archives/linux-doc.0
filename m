Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D70C1C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9B5661263
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240129AbhIWJkm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 05:40:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238217AbhIWJkl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 05:40:41 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2061C061574
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:10 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so819702otv.4
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yj7lEiNaqQnnJEP0pjEJOBwcDcryUAPFQfVuQl+ualY=;
        b=jgFMCS294S+gJfB75K9lQeBxVl8RPpCTvelwyyP3pXdDhUafRQKvMH2amCstzT7y/n
         OnZekelVbVgEYdEHWNX9AM0oRHBuZzezld3jrXNEbKvzKHlGtZuabebp2rLIE47HtG7s
         pGEb2bglyYRrDlROQA1RUOeGT5pNFuVpU9BtyumheKGdhPfSqm4M2TgXZOAcQwY0t3gu
         ZBDjqYMRgTrb/QGd+VQ8svvPVFdE1viU6DCxICqdXA8pRa97NM78GhFWrx8ggEZpre+G
         iTIiX92Avhpzjev3nEkuUQN3D8GIh0lfEQVsqmJGsI4rgD699OFlAkvJ5uSWQ1dAb3jz
         0dzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yj7lEiNaqQnnJEP0pjEJOBwcDcryUAPFQfVuQl+ualY=;
        b=GMgxbO0vf+9S62KL0dFoZg6lXJQtQiHMurPjwEM6JofQFTMX0ZBuwTREwlKzMvYKlj
         Na6E+Z9XO0JGQtCB0jfL7bo1cnxldz1wa4Gs5+BMGEG0i2Js0Rf6WmT+QJwRPFcInxTG
         3HzmSfoxQFabGLXJ8ipbGoVUyB0oImI6Ef0+rGe1lzAx7EkJ5U8COjylFv3M27Sixy09
         yYq11nuKzpuwmLidKOiGrgnpO1W4rp98Q4IEm1iHod1rJafW+9GKPgGPUd+Vhv5C7eUO
         2P2F9W3jXudJxCRse4P1eMUFQQwPNWlo3lP+xbjyOjKbFl3qWGEbFIEa2TgIYseiJOLk
         F2/w==
X-Gm-Message-State: AOAM532rNZ1VEaPk7YDHOQZBhc4I6PL5tAAq3b4Z2uT9Klp9ZsjhAGCy
        O4IWWY437EY8xguDUWCbVCQ=
X-Google-Smtp-Source: ABdhPJzTHNzeuRd1k7rUbnRWtpT5jOxiXFFTYdqNCnfbJ1ddstAC8mjOT3tZxZkgqEoGbuASutpUvQ==
X-Received: by 2002:a05:6830:24a3:: with SMTP id v3mr3597970ots.74.1632389950129;
        Thu, 23 Sep 2021 02:39:10 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.165])
        by smtp.gmail.com with ESMTPSA id a67sm1158328otb.0.2021.09.23.02.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 02:39:09 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v2 0/3] docs/zh_CN: improve process translation
Date:   Thu, 23 Sep 2021 17:37:53 +0800
Message-Id: <cover.1632389476.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
*Replace 发送 with 寄送.

v1:
* Modify some content that may mislead the reader, we should describe the patch in English.
* improve howto.rst and 5.Posting.rst.
* typo fix.

Yanteng Si (3):
  docs/zh_CN: Improve zh_CN/process/howto.rst
  docs/zh_CN: typo fix and improve translation
  docs/zh_CN: modify some words

 Documentation/translations/zh_CN/process/5.Posting.rst |  8 ++++----
 Documentation/translations/zh_CN/process/howto.rst     | 10 +++++-----
 .../translations/zh_CN/process/submitting-patches.rst  |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

-- 
2.27.0


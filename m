Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6807BC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 02:03:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46CF661AFB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Nov 2021 02:03:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhKSCGX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Nov 2021 21:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230151AbhKSCGX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Nov 2021 21:06:23 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D05C061574
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 18:03:22 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id q12so7222594pgh.5
        for <linux-doc@vger.kernel.org>; Thu, 18 Nov 2021 18:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxJqYQQ4FyDQaVyuBGQex86r8N01jeXJLu5xF+e64Rs=;
        b=OuoT4VUcP3XUqP7AM3PdOu/KiDQ/Cb1+fgOyUoQm+P/fkUdKsSPRZ+FgBxYX3byVkE
         mMWAFtnVJ8cgxGadBjBwoOwBFddo3kCGWDlGB5z069EMPIiAE1VtNZ+TWGMkrGWVyOLC
         eyNDr5eaVpvBM42k/TUSpkt08UVyXV8Rmzj2lA4MUVeuF0eOKRqBx8qqRb5/+yQhPfdl
         42yf4HvgLbrFOKGE5ztU0Lg1Iaxq2M2PJiZRdZ1yFolWYFR0xmEFhf+4ZQzU64xdVOWp
         63G0DQzEzjH37W5mbN5hEiAugSmqBdgR5b6rfhrf2FCJZv0osSu/REOhZ/cUIlnIr807
         urgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wxJqYQQ4FyDQaVyuBGQex86r8N01jeXJLu5xF+e64Rs=;
        b=5KIHaeQrFCZ9/iXqzkiUYil136WaDFxt59SP1Xu2BS15sydME2ENH9rp6wknenbK4b
         8uPHwO6JGg4wQ47uzIZtIPCbISY+8//qXZxBvGWGpN+ZSdlKqnoJTj/3iKhDEkb8ftHq
         ZtayLCoGWW83Ru+oPSBr6YIszeZ6XenvbMzo3hTE+8bcmTZHpxHtdWLdV5R1jyqn0hU0
         YMDZNp4vv6q8HIulwUQ7FEhOg/OSb9XOcz9IvGpRDgpqdxygf0sRTSXc4xCc/QrVEPU/
         zuwKCXNkllNiPTqvD/YKK8QCNK0bB4OlTIiGDW1nzUVxafqFHOC1CEhFavoCQeCjlOvL
         I98Q==
X-Gm-Message-State: AOAM531+9TKJimlFrPUQnhv9lxBAfco9ly6yfqXYyD2yNM+quJZVNqnf
        S/dO5TjIR/g4o4Q+uljaEMqDPPhSvxNxXA==
X-Google-Smtp-Source: ABdhPJzm0vSVxRDUGxpFd/ko5+dm0mGb3u+IwEctjjRnibBVthr7yz/vSNSDgQdSx8Qt9z4/giaDrQ==
X-Received: by 2002:a63:be4b:: with SMTP id g11mr14842056pgo.46.1637287401814;
        Thu, 18 Nov 2021 18:03:21 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id na13sm743965pjb.11.2021.11.18.18.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 18:03:21 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH 0/2] docs/zh_CN: add scheduler completion translation
Date:   Fri, 19 Nov 2021 10:02:20 +0800
Message-Id: <cover.1637287018.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../scheduler/completion.rst and index.rst into Chinese.

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


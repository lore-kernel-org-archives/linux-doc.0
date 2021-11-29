Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B68BC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 03:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239137AbhK2DGY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Nov 2021 22:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346034AbhK2DEX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Nov 2021 22:04:23 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9D6AC061756
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:05 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id h24so11509553pjq.2
        for <linux-doc@vger.kernel.org>; Sun, 28 Nov 2021 19:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loOtrxpiU0DbfJGLBSacaCV+bT9DzOr2V8JkCTZzs8E=;
        b=hcrfgFXfiDnBo++kDbRmr5S9Aowy5ufsClZArVEscXdoVSaSYO/f6PAgze2bZt0iBy
         ig1bDVZZAHYOES6bD3On/jEcUjxoVjsuHYWbRRF5x2+KWLSsqJuXlLAe/CV8o5XPtkAQ
         pIxHtuVZxFGxZovZLwGj2N9ZuU1G84n1f218L3+NNfsJ2RcFruFZzdNGr9wqgG96wCjm
         j1lRKk7l3r15Iod8zCWW35CEzcn8EOKU6xXCBIy9NC5QVAyzBxjOIJ3OW3BrYUbgJl92
         ROyYjvTnot/akIz8N460T5+nILVlTptK8+hCUIqrb/YkczqAZpXFAqYi/UvwXqKPsHMq
         XBng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=loOtrxpiU0DbfJGLBSacaCV+bT9DzOr2V8JkCTZzs8E=;
        b=2ovN88jikcijV6KjIzz9bKA9ByQ1So261UJufHxOnWjdHle6o+3jNgV4WADiZReCbl
         f9LX8fH6qUyYeNB8PTawS3jsZh4c6dpjxj24cY1YkZleLrbEnjJPLJDhJ8v0g7C7TScQ
         029wVNgOBb/cvOW3i7QbW612k+oeBubVT8Hzj1GClY8cXs9w/xa9eI+QY04rXEiFpDbd
         miOA/bUgMe01lpezKu/PNe7TZqNYIL1Cc3q4HFRp0HqX5kmmNoYo67XV9Zl54kndcn5K
         d/vhVIKVw/TYImYKID/mT2l8CR3JaV/gi/Fq7sRg5fLnNcPBp+O0cEWTxSGCFtk/Su3D
         hBkQ==
X-Gm-Message-State: AOAM531tNYBNzYTpQdpMeYQoc97TFabdnPsc58GczCNj9l97KWqoyO6j
        anSrYPHtdan+e8Bo0lQCLUpC5FdYceNcrMtV
X-Google-Smtp-Source: ABdhPJxYpVLPunjgSSAX3KTKiesWh9/JRt3u/ATcecEQrMo3/IGwhw+22Ef1dmEiDxxadZyVon65Vg==
X-Received: by 2002:a17:902:b48f:b0:143:bbf0:81d9 with SMTP id y15-20020a170902b48f00b00143bbf081d9mr56810601plr.5.1638154865422;
        Sun, 28 Nov 2021 19:01:05 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.90])
        by smtp.gmail.com with ESMTPSA id k1sm15513284pfu.31.2021.11.28.19.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 19:01:04 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: [PATCH v3 0/2] docs/zh_CN: add scheduler completion translation
Date:   Mon, 29 Nov 2021 10:59:50 +0800
Message-Id: <cover.1638154307.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

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


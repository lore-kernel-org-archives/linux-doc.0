Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C822DC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 07:51:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2B7E60F46
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 07:51:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231205AbhKAHxf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Nov 2021 03:53:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbhKAHxd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Nov 2021 03:53:33 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDEDAC061714
        for <linux-doc@vger.kernel.org>; Mon,  1 Nov 2021 00:51:00 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id w193so23869091oie.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Nov 2021 00:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JhzL0VbtQPPdaLDQ6KQ5pk8t6tNal/sd56NHU8VPik=;
        b=iLGzkQE73sW9fSkdmaL4D0i0JPitSXHiVwbCpl9HzowwQZehZS8kRy3PsODIlPD9BZ
         o8T+8CFY/CR0358WiI+Ga8rvQaV16pdERgKz/Aww8fxVXy3kVFinb0BqMjUMSvMDJNDg
         5iPwDXXB2Ie02Mw0g87WkDEOVr/AcRJfQ9QxMmGsn5JVZGSgkGgfbh46bJB3yfVgAxE9
         BiZML7qJUWDUA0Ev6h+EMFz0yxHV7hHz2X7bnEe8HMQANSyOu0JrEVTTM0f/3AAHspcI
         zk1YNN9PB9dNSLar/8tAfs/bNrF/BR29hLY4GDoMcIdz7jBhAiVocS8U/bMxaPJPOKr9
         hTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2JhzL0VbtQPPdaLDQ6KQ5pk8t6tNal/sd56NHU8VPik=;
        b=fuY7YtmksNosM5Oq0zyv1t8Kz3YKEv5xJ09idw9E+SitVcTtgclkwA5c+3Mf985kJy
         SvihR+a1SITL0hzIjS+JFF2RFgsHXRfB6GuSXuEZ9MEegXVUlGM9RBH/4PfwfDgEwmny
         3UW3QPAtrpis/nhe46B+cCVxrRVWTORJpg2k6y+fIrEp+ZT9vpb1dDJy35uxqAaF40T5
         fs8ypmlHqI45bWiZJaj5k+mo30xiU3PJuWC/lPBngxnj+y/4zSKNgyc+mMpY9mEPylu1
         gfSFPyA1N6vMJjqQ1i7AvGR9pixIkxP7NvNI83BfvvkKxrbrmheKSJn0FoOj1ny5VkLs
         eJcw==
X-Gm-Message-State: AOAM533l+T8JTyZzQ6zxFDEKXkC/6guhiJKNQAL4TU0bB/+p1yRGN/Cj
        TvTkdYsWnYNAn70j+6cVEKI=
X-Google-Smtp-Source: ABdhPJw4ej5WQWiwy7lmOa+RKS+gOSc6kcfaJ9EuaQFO9dI5WGCraFOEHRY97ltbnbqjFUBv3knwKg==
X-Received: by 2002:a05:6808:1781:: with SMTP id bg1mr7560055oib.94.1635753060352;
        Mon, 01 Nov 2021 00:51:00 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
        by smtp.gmail.com with ESMTPSA id f18sm3921431otl.28.2021.11.01.00.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 00:51:00 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        wanjiabing@vivo.com, bernard@vivo.com
Subject: [PATCH 0/2] docs/zh_CN: move and update sparse
Date:   Mon,  1 Nov 2021 15:50:20 +0800
Message-Id: <cover.1635752631.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Chinese sparse documentation is too old, so let's update it to
the latest version and move it to ../zh_CN/dev-tools/.

Yanteng Si (2):
  docs/zh_CN: move sparse into dev-tools
  docs/zh_CN: update sparse translation

 .../translations/zh_CN/dev-tools/index.rst    |   2 +-
 .../translations/zh_CN/dev-tools/sparse.rst   | 108 ++++++++++++++++++
 Documentation/translations/zh_CN/sparse.txt   |  91 ---------------
 3 files changed, 109 insertions(+), 92 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/dev-tools/sparse.rst
 delete mode 100644 Documentation/translations/zh_CN/sparse.txt

-- 
2.27.0


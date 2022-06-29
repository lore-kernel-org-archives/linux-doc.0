Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C84EC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jun 2022 01:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiF2Bcu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 21:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbiF2Bct (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 21:32:49 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57E2201BA
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:32:48 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id i64so13608762pfc.8
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 18:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3g1pMU8jjpRq2Yqw0B79T70UE/7NoHF4/d0o4UgFWSo=;
        b=MJwskSvqMftr1NHhU9PsHIxm74YQwzYJ+T39atcHK6wSMZexi247O7gYa0BMurGIIW
         MHm0G0pUx1pSCxy059ZTl1kzCNQXjizpuN6eY24x9fwReu6L2oDXNo99qTcaCuIwbg/N
         uD9MtG8fL4nivDlt46DkIyMXcSlmcSp5ubeTeExS91Oqs0glh/70yE/YU5gqzejJW8Lg
         afUtrzgFeLBGIBkeLPuQymXwIfMQL1qKz7zpzdReJbHB5Sb3x8I4YfxNT5f7dpVHXCO/
         9oWWHi4f+w8XL8ockST4DPlFi2BTA+FsTvF1QQZwjK7SRNfp9zWylCQRJZd+2JVs4xDI
         udDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3g1pMU8jjpRq2Yqw0B79T70UE/7NoHF4/d0o4UgFWSo=;
        b=vzhwUu4pz+/6ZUmEmSim6Jd9oJrsaTlnOqBWNwnD27s46shTfVGhbQIIMRfpj/N33D
         q8OJWUqpD8xmrDXGbpHqso8xfzhJk7EtIst8MVfspa+1WMZmgjLx/8FsQkOg4tBZBhrF
         lPgTJovOaqYmAQxWAVpHM+yl2iAnj3EWRT9xxEDd69G1dWA1+xTlkjJwu00PQBgi22RG
         XwFq3K4d7HJ6rzeI0V+XeAkZYJT1jTVaSH2jwf/yOp4ZAzV2982h1z/+weyvuoaV/pE4
         Yo3J8+4jVTwtaqkjN/KcTgqDJMUxq7d1WUIDfBR8UDlvxqCpcKoa8lokLqZmWdNLM64D
         tQ3w==
X-Gm-Message-State: AJIora/L/J0Qg9Mhc+VG29hNC5pMcvbquAQZDRdhUeZ4xxRCIYbzrAr0
        XiBrTTaIpskKxdqk1rkpt/ozZQ==
X-Google-Smtp-Source: AGRyM1vVmrDoC9NdV58muuAiUVjesyXdoh492DTRTYhqBJy4sn/stkbBqyloDoiaPwGrfp5lMd1MQg==
X-Received: by 2002:a63:3f48:0:b0:40c:f2ca:4769 with SMTP id m69-20020a633f48000000b0040cf2ca4769mr759318pga.205.1656466368269;
        Tue, 28 Jun 2022 18:32:48 -0700 (PDT)
Received: from localhost.localdomain (bb119-74-120-80.singnet.com.sg. [119.74.120.80])
        by smtp.gmail.com with ESMTPSA id ij28-20020a170902ab5c00b0016223016d79sm9973581plb.90.2022.06.28.18.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 18:32:47 -0700 (PDT)
From:   yizhou.tang@shopee.com
To:     siyanteng@loongson.cn, alexs@kernel.org, seakeel@gmail.com,
        corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, robin.lubin@shopee.com, huangh@sea.com,
        bobwxc@email.cn, Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH v2 0/2] Add mutex-design Chinese translation
Date:   Wed, 29 Jun 2022 09:32:38 +0800
Message-Id: <20220629013240.65386-1-yizhou.tang@shopee.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tang Yizhou <yizhou.tang@shopee.com>

v2:
Take Alex's advice and pick his Reviewed-by tag.

Tang Yizhou (2):
  docs/zh_CN: Show the Chinese translation of spinlocks
  docs/zh_CN: Add mutex-design Chinese translation

 .../translations/zh_CN/locking/index.rst      |   5 +-
 .../zh_CN/locking/mutex-design.rst            | 145 ++++++++++++++++++
 2 files changed, 148 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/locking/mutex-design.rst

-- 
2.34.1


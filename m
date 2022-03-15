Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F5DC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Mar 2022 23:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346865AbiCOX12 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Mar 2022 19:27:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237567AbiCOX11 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Mar 2022 19:27:27 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B0D55777
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 16:26:14 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id s11so1315463pfu.13
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 16:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UgBsS+NtdwCUhRkVs917jaRxQ+xowkqmP8HkCdcv4i0=;
        b=DRfYmbGbqekTwx0Zu3FNGrFk1ALwu+qHe+eJdCYGUlPUXYGPKxsuCbL2bxl99TcErc
         la15ifRp4U/H1W2PjeSKT2i6spJrOnJQ5v9H8RR5ztkt4NCIfuks3GxoNAN7MrdrB5JE
         QIJdFclbBpWIANDAJS9dLMfEI6EW5rOYSXAJDRR8/NMInPXPPP9d/enjtnkWXfenQGmm
         /YQbcgV4AaVuHytdcPlBKAQccwDrFHuY7u6KXaYzSJjur6NKmKTtqiL5o5UPs3WKClDp
         e1mxYbY/6/CN2GpbfyDkpfpPpbAQVaeV5wXibFp/cMKLEONrmwf46N8eHpTYmCcUSfG2
         t8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UgBsS+NtdwCUhRkVs917jaRxQ+xowkqmP8HkCdcv4i0=;
        b=4nxUCRvU1hfslkHQulcZWEKOBR0/U6JA3Rb2wHq8I+HrmqXsN9zfzmKEvNJQJE9Ez0
         ikLrubeaduv0Xz54TiGiKnL2Mh3LYgfTXF6XQb9F4D3xMzpB4w/DaEMDKPAe5f8IOhcM
         NYzO1tWc9nitrDEiMrctpHybUitaXvue9NeszgAXj/mNPHsym4cDYD7l9HvO3absl2tj
         z3hoFmCVE3qSeuV+hZgIUbg1AWxuXYviw3WPSdT7L1BRHvsaiD5ngNOp1DyUxI9wrhV5
         MXOZk9N+hjbqLUcuciN++tFrtHcN5eUDUHoGDtCGEzKLJl5/MOYEi8czO9mIt8i5/T6s
         pEFg==
X-Gm-Message-State: AOAM531MiQNoPQD+IHoFQELK1/ejQnFv7j7D4aoo3yvJKzrjQzvLl1vp
        DQ7QYb1P2dIHqLNpAy0dw8Gftxg+vn43bAcj
X-Google-Smtp-Source: ABdhPJzbSvtnDPFops/eahcFsfuUn/WRWzraql0f1znkh2QJTPbtdpPMegtfWSF1rfL6R3MLu6DsAA==
X-Received: by 2002:a05:6a00:b83:b0:4f7:374c:10ef with SMTP id g3-20020a056a000b8300b004f7374c10efmr31195605pfj.31.1647386774446;
        Tue, 15 Mar 2022 16:26:14 -0700 (PDT)
Received: from localhost ([2406:da14:36f:1b00:83fe:7e83:ccf0:685a])
        by smtp.gmail.com with ESMTPSA id u17-20020a056a00159100b004f763ac761fsm214935pfk.33.2022.03.15.16.26.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 16:26:13 -0700 (PDT)
From:   Zhou Yuheng <woshoxxx@gmail.com>
To:     alexs@kernel.org
Cc:     linux-doc@vger.kernel.org, Zhou Yuheng <woshoxxx@gmail.com>
Subject: [PATCH v3] docs/zh_CN: Fix typo in process/howto.rst
Date:   Wed, 16 Mar 2022 07:24:28 +0800
Message-Id: <20220315232428.4982-1-woshoxxx@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct the url of linux-next

Signed-off-by: Zhou Yuheng <woshoxxx@gmail.com>
---
 Documentation/translations/zh_CN/process/howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index 2903d7161..1334cdb32 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -252,7 +252,7 @@ Linux-next 集成测试树
 在将子系统树的更新合并到主线树之前，需要对它们进行集成测试。为此，存在一个
 特殊的测试存储库，其中几乎每天都会提取所有子系统树：
 
-        https://git.kernel.org/？p=linux/kernel/git/next/linux-next.git
+        https://git.kernel.org/?p=linux/kernel/git/next/linux-next.git
 
 通过这种方式，Linux-next 对下一个合并阶段将进入主线内核的内容给出了一个概要
 展望。非常欢冒险的测试者运行测试Linux-next。
-- 
2.17.1


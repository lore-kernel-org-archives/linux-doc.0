Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FAFC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 15 Mar 2022 14:11:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348881AbiCOOMV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Mar 2022 10:12:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbiCOOMU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Mar 2022 10:12:20 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13558546B2
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 07:11:09 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id w4so16307592ply.13
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 07:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hx9aYqqbf3b0nbSxprrcgFkju48eZVfhPBWjUmHoMwU=;
        b=daOjHKeWkdrHUA4/OZQOQSrCsedrZw5NdDOyxHXnf+zPgtEDhcmJzlaNY7POd8niup
         tt1C+NvmOGiRMfp+u82m3mSEdgMHjAPeU8U4ZnKfcq/j2qDLnDC8bKYNS2o3K8uZcr+A
         MlLhVKJiASuhtfYg7LW2dLYQP4JN2EvNl9/Ojn7UckOdtPUiK1q3MN7AFhVc0jQl4pzR
         pKPBY0pOJFaZu5SS05CQQJL5JDzQP8UNQC4h0dKXgmmrnPR4rp3VfaasfhBMKnakaS1O
         xXAn+nIVFGGpSe2iohJ7XP/dpsfCXU75zTOSWXsaqVIAAsxfq3mNw/UZv1CcLkoaQdfR
         MaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hx9aYqqbf3b0nbSxprrcgFkju48eZVfhPBWjUmHoMwU=;
        b=tD6utRwlVhmbq9rTuwRKfacNSgPsshMFPHn4+INDwIo3FzDIcQsm5nhghTmkCCwFAL
         cupadVVUzJUWpn4qVTtHX66ia9geu+45GNoisVJrXD7kRuSbtl9h2Qov4TUEfaA4ljR3
         wmSFBwUhIIF78yYWYlJbNzGL/OWpY5bRtuiNv1dLfjUEDy2XAjhgjh14wo1nCv0xENPL
         dqRo9yUr74sKpc42t6d9XNz7ZgjxT0rtlIxTjy6PYXv6xocbwo/9BAO86Cc34lgj8W8+
         WWJC0tyawXMfjEWYf9EkIbVgwS3V1OGlCLnKYupxTqXLod4GRibOfOSqqxz4tKft1sK/
         ZbTw==
X-Gm-Message-State: AOAM532jwd41/jPe4hmhOz/vgOySHAsgZ+VUBgVZYggowedlGAKuhkrn
        xYuVwFIOGykXDLEqpGBcgPM=
X-Google-Smtp-Source: ABdhPJwgcN7FSJQJxZRI3VahHvlPvycBU6KT/PKaqWvy0xU91xkbTJzr5IMtF32vsIPU8yBRzDKwLg==
X-Received: by 2002:a17:902:8549:b0:153:563a:39a1 with SMTP id d9-20020a170902854900b00153563a39a1mr13287672plo.21.1647353468573;
        Tue, 15 Mar 2022 07:11:08 -0700 (PDT)
Received: from localhost ([2406:da14:36f:1b00:83fe:7e83:ccf0:685a])
        by smtp.gmail.com with ESMTPSA id k190-20020a633dc7000000b0037c921abb5bsm21088657pga.23.2022.03.15.07.11.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 07:11:08 -0700 (PDT)
From:   Zhou Yuheng <woshoxxx@gmail.com>
To:     alexs@kernel.org
Cc:     linux-doc@vger.kernel.org, Zhou Yuheng <woshoxxx@gmail.com>
Subject: [PATCH] docs/zh_CN: Fix typo in process/howto.rst
Date:   Tue, 15 Mar 2022 22:11:00 +0800
Message-Id: <20220315141100.4996-1-woshoxxx@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

   - Change the full-width symbol into half-width symbol for the url of linux-next to make it can be accessed.

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


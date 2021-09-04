Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CDD6C433EF
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 04:06:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 218E460F92
	for <linux-doc@archiver.kernel.org>; Sat,  4 Sep 2021 04:06:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhIDEHG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 4 Sep 2021 00:07:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbhIDEHG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 4 Sep 2021 00:07:06 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C2FC061575
        for <linux-doc@vger.kernel.org>; Fri,  3 Sep 2021 21:06:05 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q68so957818pga.9
        for <linux-doc@vger.kernel.org>; Fri, 03 Sep 2021 21:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KLu8kJxq+KGkdyuo/rapMzUExlAjMbk0j4YTN2RGbrY=;
        b=OJHM9gZ36DCoIM4Ah5DH1klnhC7GmpJm7z8g9xAZc+IkmWcm7WMkFB+AtRy4aabD2a
         DsfFWj7aqd3ZkSeIBBi77dYuKnapwWfngn1UTkr5RjmBjcb+IvMfo1rZPo4vsvaC/m/O
         50ATgGaPUT62dyMi8sUykXjczNbhUFmDxTwg9VAOjPpH9pzPm+UmKSHt+4tPLhfyLyfp
         V7Mt2VeX/UZOYoaMAg1ZdHEpDtHBtGtkTy+VWATUVByNA7HldW9gVywpmAoh3su7g3AU
         SRmCcKPkR8ZCRrI3mA9bAJKct5Cnl9YciTgozxkFlNbpHbfKc9VnCjU4OGfYWKHucv+6
         tQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KLu8kJxq+KGkdyuo/rapMzUExlAjMbk0j4YTN2RGbrY=;
        b=Yq3mT177whe8d8Q3ynn1YPNMdH4kyit81Ewm/vE90h1UwAXQsmSGgiFtc1LAJVeyKW
         mwuax0wo4Rbcp+LoAfpQC4YwzXHys+jzDq2SpzXBBc9Ccn3vJZHmpSrtmrDyqudyqG4q
         O9e2HTH2V9EtpR5l1ZjZSeorDh9mGBq20Zq773+xw2OX0pwqeevWOQdHGJy3F9mxI2ai
         Q6c025bYB5QAdoWDDyBXChIWdy7QMZ8/KqbuToQ1S2Ko8Wb5VEaxqgfCW1LgqoG0A0nn
         jKFsnf7m9zYv6+XesQJQxNotK+qE5LZDj+Od/MgMGcHklUeAJGWdIDJBgJGSxZOBBHff
         r+MA==
X-Gm-Message-State: AOAM5307mcFsNyRSYo6PnShfcQIF7Uova6QHkA9ML+FctbtebuCWF/q0
        Q3kraeup5BRpY6yytyi7DfcgTTleGIBXNeXCV0I=
X-Google-Smtp-Source: ABdhPJyJ97lFo22QlsL2q6ESeF93czcS4t0UmRJs/lFeNhYjoyNdRqQgCBjnz8HG+RDGlrAEncNReg==
X-Received: by 2002:a63:e04a:: with SMTP id n10mr1972358pgj.381.1630728364368;
        Fri, 03 Sep 2021 21:06:04 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-000e-1427-04a7-1405-be12-3ea4.dynamic-ip6.hinet.net. [2001:b011:e:1427:4a7:1405:be12:3ea4])
        by smtp.gmail.com with ESMTPSA id j9sm865145pgl.1.2021.09.03.21.06.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 21:06:04 -0700 (PDT)
From:   "arthur.yueh" <ysde108@gmail.com>
To:     linux-doc@vger.kernel.org
Cc:     ArthurYueh <ysde108@gmail.com>
Subject: [PATCH] Update zh-tw document index.rst (#1)
Date:   Sat,  4 Sep 2021 12:06:00 +0800
Message-Id: <20210904040600.85817-1-ysde108@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: ArthurYueh <ysde108@gmail.com>

Trying to make the `zh-tw` index.rst document more readable for users who use `zh-tw`
---
 Documentation/translations/zh_TW/index.rst | 43 +++++++++-------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index c02c4b528..5458dab82 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -14,22 +14,20 @@
 
 
 .. note::
-   內核文檔繁體中文版的翻譯工作正在進行中。如果您願意並且有時間參與這項工
-   作，歡迎提交補丁給胡皓文 <src.res@email.cn>。
+   linux核心文件繁體中文的翻譯工作正在進行中。如果您願意並且有時間參與這項工
+   作，歡迎提交修正給胡皓文 <src.res@email.cn>。
 
-許可證文檔
+許可證
 ----------
 
-下面的文檔介紹了Linux內核原始碼的許可證（GPLv2）、如何在原始碼樹中正確標記
-單個文件的許可證、以及指向完整許可證文本的連結。
+下面的文件介紹了Linux核心原始碼的許可證（GPLv2）、如何在原始碼的樹狀紀錄中，正確標記各個文件的許可證、以及完整的許可證內文的連結。
 
 Documentation/translations/zh_TW/process/license-rules.rst
 
-用戶文檔
+用戶相關文件
 --------
 
-下面的手冊是爲內核用戶編寫的——即那些試圖讓它在給定系統上以最佳方式工作的
-用戶。
+下列的使用說明文件是爲了那些「試著在特定系統，最佳化linux核心執行」的用戶所寫的
 
 .. toctree::
    :maxdepth: 2
@@ -40,31 +38,29 @@ TODOList:
 
 * kbuild/index
 
-固件相關文檔
+硬體相關文件
 ------------
 
-下列文檔描述了內核需要的平台固件相關信息。
+下列文件有linux核心對於不同平台的期待的資訊。
 
 TODOList:
 
 * firmware-guide/index
 * devicetree/index
 
-應用程式開發人員文檔
+應用程式開發者文件
 --------------------
 
-用戶空間API手冊涵蓋了描述應用程式開發人員可見內核接口方面的文檔。
+user-space API文件，整合了有關於linux應用程式開發者方面的核心介面。
 
 TODOlist:
 
 * userspace-api/index
 
-內核開發簡介
+linux核心開發簡介
 ------------
 
-這些手冊包含有關如何開發內核的整體信息。內核社區非常龐大，一年下來有數千名
-開發人員做出貢獻。與任何大型社區一樣，知道如何完成任務將使得更改合併的過程
-變得更加容易。
+這些使用說明全面的包含了關於如何開發linux核心的資訊。linux核心社群非常龐大，一年下來有數千名開發者做出貢獻。與其他大型社群一樣，知道一些事情是如何運作的，會使得你PR的合併過程變得更加容易。
 
 .. toctree::
    :maxdepth: 2
@@ -82,12 +78,10 @@ TODOList:
 * livepatch/index
 * rust/index
 
-內核API文檔
+linux核心API文件
 -----------
 
-以下手冊從內核開發人員的角度詳細介紹了特定的內核子系統是如何工作的。這裡的
-大部分信息都是直接從內核原始碼獲取的，並根據需要添加補充材料（或者至少是在
-我們設法添加的時候——可能不是所有的都是有需要的）。
+以下使用說明從linux核心開發者的角度，詳細介紹了特定的linux核心子系統是如何運作的。這裡的大部分資訊，都是直接從linux核心原始碼內取出來的，並根據需要添加補充說明。
 
 TODOList:
 
@@ -133,25 +127,24 @@ TODOList:
 * scheduler/index
 * mhi/index
 
-體系結構無關文檔
+與linux核心架構無關的文件
 ----------------
 
 TODOList:
 
 * asm-annotations
 
-特定體系結構文檔
+與特定linux核心架構相關的文件
 ----------------
 
 TODOList:
 
 * arch
 
-其他文檔
+其他文件
 --------
 
-有幾份未排序的文檔似乎不適合放在文檔的其他部分，或者可能需要進行一些調整和/或
-轉換爲reStructureText格式，也有可能太舊。
+有些未排序的文件似乎不適合放在文件的其他部分，或者可能需要進行一些調整，或轉換爲reStructureText格式，也有可能就是太舊了。
 
 TODOList:
 
-- 
2.31.1


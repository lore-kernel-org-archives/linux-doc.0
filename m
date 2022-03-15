Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BC2C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Mar 2022 13:59:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348877AbiCOOAi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Mar 2022 10:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237766AbiCOOAh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Mar 2022 10:00:37 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38FB6205E4
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 06:59:24 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso2060887pjb.0
        for <linux-doc@vger.kernel.org>; Tue, 15 Mar 2022 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FT3o/Z6QRes6v2fqBmxOTq5l2W4zpeVgffhkIoRiN/k=;
        b=DY6lZQjtCB8wtDwsLUDTTmf1DRp3PyTxBwG6vmn/VGjjdKaf32YKg59x0y+q2SOzoR
         TNtogQCeTRvYGcHeEOzu/3TAkMkDKiagjqbltYabbxFFok+ZH6mJa/N1TEF8McPj1V6d
         LvxQYObKUL/qkNKVDlC+srYmocrIkY75AqhEPxrDr4iv9JHcqscGtDHMF9y0oeMIzNl5
         zd3tmn+uiQXTPQ+J2NPVaAP5JXXYYEtfy7V5tGumRYDS5dqSW/THwa8WYdq3bmgzPdEx
         yvQAx8QAqLnig5Ee+FQ3D9BbWcv42kWq54Ugx7B2mYc4x0MuNJVjaTVUWb4imEkAAmTX
         Xx6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FT3o/Z6QRes6v2fqBmxOTq5l2W4zpeVgffhkIoRiN/k=;
        b=o4krZk3tyjmHNNMICM+za/5rVAFpJFL8Y8H8iyqvHjAURhK5KDMEE+vjN+bFbQ2ySj
         6u8e4d3UDUrTa1OPL3/mdEGIlb6kG+dRAwRYs66FD6lXcMEBbemsnAdbQtRGdLo0Bz3d
         6+/iXrf4maLgLbqd6ia+vJ5FbLtvZU/+3Slheq7lOOuxaG6RbRYmmNcM4PA6/V0ZUMBs
         iXMJwtastMNe+U0X3WK3L/VLgTr1zeRbH2c0TBQpLobXb4NsB17sNYzvf1kv4f9Hvkmc
         oKOiRgxcerO78EVsPSesgnHq9ehDqH28z1RgqQlU77bG+rd3TXYQ5I4SPNOZK218A9k9
         zxKA==
X-Gm-Message-State: AOAM531tHgyLCknwdvJQ7yiCtieJrsZBaY7pNCFxymH8/mBHG6rfKvuL
        TfjaSy6o4LYm1O5j/Eyqklbwl6qTKiBspRONvSg=
X-Google-Smtp-Source: ABdhPJzQK2TF2dnZqOedWmwsyxthi008oNH04bg4aupfYoID58b8GKB/x3Z8hqA62R6vG672ywN3Bg==
X-Received: by 2002:a17:902:bb92:b0:153:4eae:c77e with SMTP id m18-20020a170902bb9200b001534eaec77emr14065328pls.93.1647352763769;
        Tue, 15 Mar 2022 06:59:23 -0700 (PDT)
Received: from localhost ([2406:da14:36f:1b00:83fe:7e83:ccf0:685a])
        by smtp.gmail.com with ESMTPSA id q18-20020a637512000000b003816cf04406sm2084542pgc.22.2022.03.15.06.59.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 06:59:23 -0700 (PDT)
From:   Zhou Yuheng <woshoxxx@gmail.com>
To:     alexs@kernel.org
Cc:     linux-doc@vger.kernel.org, Zhou Yuheng <wwoshoxxx@gmail.com>
Subject: [PATCH] docs/zh_CN: Fix typo in process/howto.rst
Date:   Tue, 15 Mar 2022 21:59:18 +0800
Message-Id: <20220315135918.3816-1-woshoxxx@gmail.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Zhou Yuheng <wwoshoxxx@gmail.com>

   - Change the full-width symbol into half-width symbol for the url of linux-next to make it can be accessed.

Signed-off-by: Zhou Yuheng <wwoshoxxx@gmail.com>
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


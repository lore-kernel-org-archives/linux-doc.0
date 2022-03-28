Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB127C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 12:47:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242624AbiC1Mt0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 08:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239014AbiC1Mt0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 08:49:26 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 250D44D9D6
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:45 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id m22so13948178pja.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bbgL7VdrRS4nd8vrzhWB69cyGoEtolsn/4UP+ZJ8nb0=;
        b=hpcdK0CQlIw8tvs3521y31fcWZ99gi2t7fnZEw/2vcWNg1ZK23Og5TwdqkFwYo2nn+
         BIsT+gKbSIaXsnJk/TEZ0w5OD3ETn7sHGaBAA1iPM7RfA4nwD8DDvSym1pzUFxLNHqMy
         xjOkdvI8G4WF6+HQF4d2LTuHUvhE/Kt9F0iflqtWUWIIyWWxEcVM9PVIArhZlAr/fdZr
         KAkYDwS7KpX7eSj2pKgqAclCV6V/Rwzmo801HxoSnxCFrkK4R3CYh7ZD4/zaaowx0Dd3
         BnD1Vafp3rswlE1aXt2kDUBasJuZaNX8IYOKRd+Q9+hthPmfcdsWSOWVNlgZ2GO9964n
         Rlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bbgL7VdrRS4nd8vrzhWB69cyGoEtolsn/4UP+ZJ8nb0=;
        b=ht5+VYfuMelHY+pzB0sIRAfXfqMdtOQPWreJg/25b7+cGmS8kp7X7TdEwe4AUgb7Jh
         aF4mqtnW7HgzCXaxaU6qfepVVGMeqtX7lBWbMCkm0mgjQ/gyQhx05e9jqHlKYLf3CkVi
         D507Tx3oi6WQMYRrnMfAlUGStZFBEnwpz9gwzfLDExNn6EgOgiY6HznVe7iUeP8/FDeZ
         9Qxpku1/JRQew+1PHFaEsgBqWUy1joA7FvmAij99652N9KmhKkd4lX0X6lqFwCPOTWQk
         x5+d0fzq09atTCRq3BxuR33GrpvC+Vv5WyMrtA06NO66M0O0L6l6Xz22krMrjwido31I
         xSCA==
X-Gm-Message-State: AOAM531aXgfh8WygLKZdQp5osLdDLSfa7uhoJXo6KbyntklcJNhrYAh3
        2SbW0327keFwcdnpN35Ish8=
X-Google-Smtp-Source: ABdhPJxS9j4Y1MpOl903aHdC3NNnUvkd5ngoVPkj9JzQe3eh5Oz/zt7D/26dhBAoqicidWQdbfV8Uw==
X-Received: by 2002:a17:903:3005:b0:154:317:3834 with SMTP id o5-20020a170903300500b0015403173834mr26040694pla.156.1648471664671;
        Mon, 28 Mar 2022 05:47:44 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id ck13-20020a056a00328d00b004fb1414476bsm11339079pfb.200.2022.03.28.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 05:47:44 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 3/3] docs/zh_CN/damon: typo fix
Date:   Mon, 28 Mar 2022 20:48:35 +0800
Message-Id: <9de68c807d0a27f010c8e1eaf007dd947ec97f8f.1648471647.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648471647.git.siyanteng@loongson.cn>
References: <cover.1648471647.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The word in original doc is: 'enabled', not 'enable'.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/admin-guide/mm/damon/reclaim.rst       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
index 9e541578f38d..1500bdbf338a 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
@@ -53,8 +53,8 @@ DAMON_RECLAIM找到在特定时间内没有被访问的内存区域并分页。
 
 下面是每个参数的描述。
 
-enable
-------
+enabled
+-------
 
 启用或禁用DAMON_RECLAIM。
 
-- 
2.27.0


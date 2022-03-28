Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4526FC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 28 Mar 2022 12:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242621AbiC1MtQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Mar 2022 08:49:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239014AbiC1MtP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Mar 2022 08:49:15 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 322804D9D6
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:35 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id bc27so12171390pgb.4
        for <linux-doc@vger.kernel.org>; Mon, 28 Mar 2022 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qAqmclSX/3nDrkiEAbA3xBs5OiARfNYqNSE7+fQhyJ8=;
        b=PMp7ufA+tNcUSueRj+Dx9Ucxjh5gcRwSLqNmmiS7//if6JVlFLrMXiHqmpwJ5Y//36
         txpd3jKtDSisVf13mRvfgFC76wVGeqIftr+/3Ef4XaY2+1/J0oExACKKJAySZoisqD3V
         NCO/D3ABccMcj10QUIkLCxwkEOXiZZ3lF9CUNLIDiMDs6ly6FnM7BQuXksATO6rrH7Ck
         c82M550+uuFByxtFdpUSsrFXCS1fRMV+ks9nHfHKoO8zMPMGbkj2PxRd0nwvj4UjjClF
         ep90dJI2Xf/dxmwDlVwK7A0jp+Sd6sWSA3FgFjoIFGvXYKGwYrXD4I4fwMdfjadlHkB4
         NDag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qAqmclSX/3nDrkiEAbA3xBs5OiARfNYqNSE7+fQhyJ8=;
        b=CC1uy1X1roXwm6unWPIc/fmvziRccgEkP/G5SfxjhrmRNnDQsjJGRznyWGEVMuqwOG
         ueDb6a63VYEcAhRYHTsejmv3KML2+a4LIVbVH19bUwrtDDsxcbB805z/dWt6gU6jCjKL
         ryrSMu8vGn2lGsN+r8c5jlUEc89Tf6Zowz4xJB3FMty8KKG2Ds05oOziJaYDN6Q8qWoy
         Kf2/amIvUNLL0X+UYCkUpk8KH+mrnImFi4teycz1J5zyJy0xIiQwzRSEJwKFvF3Ckrxw
         0VATYOlW3YzbcBqZe7D7Pu1EF/YPllBbtvZHqbSzOv94xpC3eKqJ+0Us1TBo9UnTr9BV
         Ir0g==
X-Gm-Message-State: AOAM532Wi6pTGHFfJFYiKWVQAfLY4yYrhzvq4enqN6FJZuIWLG9ci0Wx
        scgZlYG5os6Jtu/JxtZVlp0=
X-Google-Smtp-Source: ABdhPJyUFywmqv6eIXTWjxKIoNKfw0tVzuV3hh5zmkbqlzJ0c6fPKwLhbFVfXBfQJ4QfiaUkcQpu/A==
X-Received: by 2002:a63:1a0d:0:b0:386:1835:df92 with SMTP id a13-20020a631a0d000000b003861835df92mr10469046pga.432.1648471654706;
        Mon, 28 Mar 2022 05:47:34 -0700 (PDT)
Received: from localhost.localdomain (111-250-2-155.dynamic-ip.hinet.net. [111.250.2.155])
        by smtp.gmail.com with ESMTPSA id ck13-20020a056a00328d00b004fb1414476bsm11339079pfb.200.2022.03.28.05.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 05:47:34 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 1/3] docs/zh_CN/damon: update outdated term 'regions update interval'
Date:   Mon, 28 Mar 2022 20:48:33 +0800
Message-Id: <d98c4c1e5b00acd99abfe822057b34492ebb58a3.1648471647.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1648471647.git.siyanteng@loongson.cn>
References: <cover.1648471647.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since 072fd1b47215("Docs/damon: update outdated term 'regions update interval'")
use update interval,zh_CN should use 更新间隔, so let's sync update.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/admin-guide/mm/damon/usage.rst      | 6 +++---
 Documentation/translations/zh_CN/vm/damon/design.rst       | 7 ++++---
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
index 5d7533347216..10b9ac7664d3 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst
@@ -46,7 +46,7 @@ DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
 属性
 ----
 
-用户可以通过读取和写入 ``attrs`` 文件获得和设置 ``采样间隔`` 、 ``聚集间隔`` 、 ``区域更新间隔``
+用户可以通过读取和写入 ``attrs`` 文件获得和设置 ``采样间隔`` 、 ``聚集间隔`` 、 ``更新间隔``
 以及监测目标区域的最小/最大数量。要详细了解监测属性，请参考 `:doc:/vm/damon/design` 。例如，
 下面的命令将这些值设置为5ms、100ms、1000ms、10和1000，然后再次检查::
 
@@ -108,8 +108,8 @@ DAMON导出了八个文件, ``attrs``, ``target_ids``, ``init_regions``,
             1   20      40
             1   50      100" > init_regions
 
-请注意，这只是设置了初始的监测目标区域。在虚拟内存监测的情况下，DAMON会在一个 ``区域更新间隔``
-后自动更新区域的边界。因此，在这种情况下，如果用户不希望更新的话，应该把 ``区域的更新间隔`` 设
+请注意，这只是设置了初始的监测目标区域。在虚拟内存监测的情况下，DAMON会在一个 ``更新间隔``
+后自动更新区域的边界。因此，在这种情况下，如果用户不希望更新的话，应该把 ``更新间隔`` 设
 置得足够大。
 
 
diff --git a/Documentation/translations/zh_CN/vm/damon/design.rst b/Documentation/translations/zh_CN/vm/damon/design.rst
index 05f66c02740a..46128b77c2b3 100644
--- a/Documentation/translations/zh_CN/vm/damon/design.rst
+++ b/Documentation/translations/zh_CN/vm/damon/design.rst
@@ -77,7 +77,7 @@ DAMON目前为物理和虚拟地址空间提供了基元的实现。下面两个
 ========================
 
 下面四个部分分别描述了DAMON的核心机制和五个监测属性，即 ``采样间隔`` 、 ``聚集间隔`` 、
-``区域更新间隔`` 、 ``最小区域数`` 和 ``最大区域数`` 。
+``更新间隔`` 、 ``最小区域数`` 和 ``最大区域数`` 。
 
 
 访问频率监测
@@ -135,5 +135,6 @@ DAMON的输出显示了在给定的时间内哪些页面的访问频率是多少
 监测目标地址范围可以动态改变。例如，虚拟内存可以动态地被映射和解映射。物理内存可以被
 热插拔。
 
-由于在某些情况下变化可能相当频繁，DAMON检查动态内存映射的变化，并仅在用户指定的时间
-间隔（ ``区域更新间隔`` ）内将其应用于抽象的目标区域。
+由于在某些情况下变化可能相当频繁，DAMON允许监控操作检查动态变化，包括内存映射变化，
+并仅在用户指定的时间间隔（ ``更新间隔`` ）中的每个时间段，将其应用于监控操作相关的
+数据结构，如抽象的监控目标内存区。
\ No newline at end of file
-- 
2.27.0


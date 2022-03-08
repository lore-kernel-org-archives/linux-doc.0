Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8280CC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Mar 2022 08:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344859AbiCHIME (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:12:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344930AbiCHILr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 03:11:47 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C253EBB8
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 00:10:51 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id gj15-20020a17090b108f00b001bef86c67c1so1691968pjb.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 00:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IRhJnGUf7LgcfX3QkuNt17gYnklMoAiNEvH0nsk2B58=;
        b=Al30cY/t7QCbmWZzZHTmAo+zbN8GoV0WC8rVSaIo8XJUlrYz5oJvD+MqDXPPQc+RPc
         5ugddlbkwHpXoIoJX5/8XBu9bX8qW2k+Ru9cgN4LTKbQbrNLCvTY8nHU0ohts6hI9a7F
         xNLp5uncSv5/Ma9WtFrdfq70nIIyPgGXR3UVFiBYgCgH1xCd78cPrwbBX5HLGNZk4/Gn
         6r3BIEgsW3RVTV0eNIRNNkBge+RzE4yACqMxk2U8DiUxcyO/OQ0aryIs26m1Wi6g4a2w
         KiAd/02qB4vD4ZZIlKdojY376KpkEu9qwPqn8A+654JeKGfNYhbF58unkOnSZ83vfQqf
         pApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IRhJnGUf7LgcfX3QkuNt17gYnklMoAiNEvH0nsk2B58=;
        b=uTSh5WmSSlSILLvyNTvd9gtD2TCK/G6c3XH4oE4IdXaYAiBQwYlu6vBJHctvubHQWY
         O6x3efwdqdmc5otWtvj+SMSqpW8d1W1Vn9IoxJkf5+5kQF19Z7oLcGsBFUBzVQRP5hZ0
         tfK6+QWOHfh9bJ/QAwK8uPPZd23Np/4PyYpnqP/VFfMx6uCAhhEalc64pHebuzdAswp1
         1NezEAiCu1VIT6KT/yWgJZDUFlFquBW9LVwxyT2yu81xl0xBV+aK+V1dBpUPH93ZRZ5J
         NO9R8ryTwQN1ELcKdBVQewfphTvbp7SZ3dJaj8c83CHAkPbpY8vA5A0+UjFOiym5pDjq
         56xg==
X-Gm-Message-State: AOAM531KXydsgNu8atWz0nJLz6uRwzr1Lby622RzFNCNGHmflZRe2qUp
        COhb5/qgjIIACtg5m8bNUw8=
X-Google-Smtp-Source: ABdhPJy6sANwB7fzbCqws2IRxagbbH2G3pgJypZJK8wMsTD3qpE6z5/9TSsRcq9BX1uYw2PiNbtP0Q==
X-Received: by 2002:a17:902:d890:b0:151:6b8b:db0a with SMTP id b16-20020a170902d89000b001516b8bdb0amr16394761plz.15.1646727050950;
        Tue, 08 Mar 2022 00:10:50 -0800 (PST)
Received: from localhost.localdomain ([50.7.60.25])
        by smtp.gmail.com with ESMTPSA id d14-20020a056a0024ce00b004f7281cda21sm2165282pfv.167.2022.03.08.00.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:10:50 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 3/5] docs/zh_CN: add admin-guide damon start translation
Date:   Tue,  8 Mar 2022 16:12:01 +0800
Message-Id: <bff566a8b342231b76fd89516d1a126fab5fd90a.1646723249.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1646723249.git.siyanteng@loongson.cn>
References: <cover.1646723249.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

Translate Documentation/admin-guide/mm/damon/start.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../zh_CN/admin-guide/mm/damon/index.rst      |   4 +-
 .../zh_CN/admin-guide/mm/damon/start.rst      | 132 ++++++++++++++++++
 2 files changed, 135 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
index 4581e1bc2506..4aa122f375e3 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
@@ -19,8 +19,10 @@
 .. toctree::
    :maxdepth: 2
 
+   start
+
 Todolist:
 
-*   start
+
 *   usage
 *   reclaim
diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
new file mode 100644
index 000000000000..67d1b49481dc
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
@@ -0,0 +1,132 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/mm/damon/start.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+========
+入门指南
+========
+
+本文通过演示DAMON的默认用户空间工具，简要地介绍了如何使用DAMON。请注意，为了简洁
+起见，本文档只描述了它的部分功能。更多细节请参考该工具的使用文档。
+`doc <https://github.com/awslabs/damo/blob/next/USAGE.md>`_ .
+
+
+前提条件
+========
+
+内核
+----
+
+首先，你要确保你当前系统中跑的内核构建时选定了这个功能选项 ``CONFIG_DAMON_*=y``.
+
+
+用户空间工具
+------------
+
+在演示中，我们将使用DAMON的默认用户空间工具，称为DAMON Operator（DAMO）。它可以在
+https://github.com/awslabs/damo找到。下面的例子假设DAMO在你的$PATH上。当然，但
+这并不是强制性的。
+
+因为DAMO使用的是DAMON的debugfs接口(详情请参考 :doc:`usage` 中的使用方法) 你应该
+确保debugfs被挂载。手动挂载它，如下所示::
+
+    # mount -t debugfs none /sys/kernel/debug/
+
+或者在你的 ``/etc/fstab`` 文件中添加以下一行，这样你的系统就可以在启动时自动挂载
+debugfs了::
+
+    debugfs /sys/kernel/debug debugfs defaults 0 0
+
+
+记录数据访问模式
+================
+
+下面的命令记录了一个程序的内存访问模式，并将监测结果保存到文件中。 ::
+
+    $ git clone https://github.com/sjp38/masim
+    $ cd masim; make; ./masim ./configs/zigzag.cfg &
+    $ sudo damo record -o damon.data $(pidof masim)
+
+命令的前两行下载了一个人工内存访问生成器程序并在后台运行。生成器将重复地逐一访问两个
+100 MiB大小的内存区域。你可以用你的真实工作负载来代替它。最后一行要求 ``damo`` 将
+访问模式记录在 ``damon.data`` 文件中。
+
+
+将记录的模式可视化
+==================
+
+你可以在heatmap中直观地看到这种模式，显示哪个内存区域（X轴）何时被访问（Y轴）以及访
+问的频率（数字）。::
+
+    $ sudo damo report heats --heatmap stdout
+    22222222222222222222222222222222222222211111111111111111111111111111111111111100
+    44444444444444444444444444444444444444434444444444444444444444444444444444443200
+    44444444444444444444444444444444444444433444444444444444444444444444444444444200
+    33333333333333333333333333333333333333344555555555555555555555555555555555555200
+    33333333333333333333333333333333333344444444444444444444444444444444444444444200
+    22222222222222222222222222222222222223355555555555555555555555555555555555555200
+    00000000000000000000000000000000000000288888888888888888888888888888888888888400
+    00000000000000000000000000000000000000288888888888888888888888888888888888888400
+    33333333333333333333333333333333333333355555555555555555555555555555555555555200
+    88888888888888888888888888888888888888600000000000000000000000000000000000000000
+    88888888888888888888888888888888888888600000000000000000000000000000000000000000
+    33333333333333333333333333333333333333444444444444444444444444444444444444443200
+    00000000000000000000000000000000000000288888888888888888888888888888888888888400
+    [...]
+    # access_frequency:  0  1  2  3  4  5  6  7  8  9
+    # x-axis: space (139728247021568-139728453431248: 196.848 MiB)
+    # y-axis: time (15256597248362-15326899978162: 1 m 10.303 s)
+    # resolution: 80x40 (2.461 MiB and 1.758 s for each character)
+
+你也可以直观地看到工作集的大小分布，按大小排序。::
+
+    $ sudo damo report wss --range 0 101 10
+    # <percentile> <wss>
+    # target_id     18446632103789443072
+    # avr:  107.708 MiB
+      0             0 B |                                                           |
+     10      95.328 MiB |****************************                               |
+     20      95.332 MiB |****************************                               |
+     30      95.340 MiB |****************************                               |
+     40      95.387 MiB |****************************                               |
+     50      95.387 MiB |****************************                               |
+     60      95.398 MiB |****************************                               |
+     70      95.398 MiB |****************************                               |
+     80      95.504 MiB |****************************                               |
+     90     190.703 MiB |*********************************************************  |
+    100     196.875 MiB |***********************************************************|
+
+在上述命令中使用 ``--sortby`` 选项，可以显示工作集的大小是如何按时间顺序变化的。::
+
+    $ sudo damo report wss --range 0 101 10 --sortby time
+    # <percentile> <wss>
+    # target_id     18446632103789443072
+    # avr:  107.708 MiB
+      0       3.051 MiB |                                                           |
+     10     190.703 MiB |***********************************************************|
+     20      95.336 MiB |*****************************                              |
+     30      95.328 MiB |*****************************                              |
+     40      95.387 MiB |*****************************                              |
+     50      95.332 MiB |*****************************                              |
+     60      95.320 MiB |*****************************                              |
+     70      95.398 MiB |*****************************                              |
+     80      95.398 MiB |*****************************                              |
+     90      95.340 MiB |*****************************                              |
+    100      95.398 MiB |*****************************                              |
+
+
+数据访问模式感知的内存管理
+==========================
+
+以下三个命令使每一个大小>=4K的内存区域在你的工作负载中没有被访问>=60秒，就会被换掉。 ::
+
+    $ echo "#min-size max-size min-acc max-acc min-age max-age action" > test_scheme
+    $ echo "4K        max      0       0       60s     max     pageout" >> test_scheme
+    $ damo schemes -c test_scheme <pid of your workload>
-- 
2.27.0


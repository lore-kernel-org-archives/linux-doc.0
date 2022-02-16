Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 829E4C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 16 Feb 2022 09:38:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232115AbiBPJiT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Feb 2022 04:38:19 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:59798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiBPJiT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Feb 2022 04:38:19 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E816565
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:38:07 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id u16so1664935pfg.12
        for <linux-doc@vger.kernel.org>; Wed, 16 Feb 2022 01:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7EoJHC+YbMTrlPpbMTnVydl0+MB8UnHiL3zB+ecDm1I=;
        b=J+KCye0feS3rPNzb3OKoFU9L8kihwtXtY/9hqb6d70ft722d8GgMhUuBhx40G/c43K
         iTyGIj7sLKukRmct81b4p9L/H0CGRcklt9D0upltwrrXGVI6CdXtNkkhpV94A+nXvcQq
         L0vwaIv28BGpE9pF1JJ/guFlL8ctRdUllm6SzVlsHhAsJ1X4iGU2d0b+aQq4S6s2vsWe
         +0+x7Ky+FqcB7LIMy0hJDp47HnjpZSZ2D2nFhrKwhk9MKVD9TPPhihiIVQ1ZiawNgN3E
         3XRDT/yD1JopyUi4ySnuKjXXtcgIS0IA7Somn6NK12trc5rfVzv0pbdF5WqQswyUXjAh
         WwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7EoJHC+YbMTrlPpbMTnVydl0+MB8UnHiL3zB+ecDm1I=;
        b=NJZw040XdstaPDIwh7ckXzheoLtVXnvCcJGrEVXSI2eX+3AQWWOwO4Gp66GjzPgJNz
         y3DoQdfFTTnDiOM4R54leIu+fP8OQLdq5iYqhFas3DM/8PorfhI3OQHYE6/DcXRojYbZ
         GSuNgAqunAFu9QkNbSy0snLWlM33T5t/IV3+3jFR6hZGPX/51w0DJ554imlIlXjgKvCn
         r8K1xPgurtoqpAGb3aak3QGjDDIxNAX0rZamlvpDrNST9tw9jYbEtJy3L+HkFZIJVYf6
         649GUxctMgIgs9B0y1PHk0witK5GL4/elWGICBrFcXn6gZTNHmqrFeXIS3cxjMJwYrtU
         wP/g==
X-Gm-Message-State: AOAM5317yIgqxvhhyx6t8S7aNaynOEokoXNpDsn3LuJt+Kf9VLUeGuKj
        UMmkKXZb5fX+JK6ZQtrIG1oFVpcQpNBrqAjc
X-Google-Smtp-Source: ABdhPJxtB/lrE+1tCPkTxoYSHhEjFTu9nkpEOZnr3yV8jervKR8aJWiYn5l/Xi/VY9GJamYw3IPZGg==
X-Received: by 2002:a63:8941:0:b0:371:d4b0:807b with SMTP id v62-20020a638941000000b00371d4b0807bmr1582165pgd.159.1645004287103;
        Wed, 16 Feb 2022 01:38:07 -0800 (PST)
Received: from localhost.localdomain ([211.109.233.153])
        by smtp.gmail.com with ESMTPSA id 11sm19251289pja.36.2022.02.16.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 01:38:06 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 2/5] docs/zh_CN: add admin-guide damon index translation
Date:   Wed, 16 Feb 2022 17:34:43 +0800
Message-Id: <0e3f618a914980ad649d956a43aeca93d71c1f79.1645003763.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1645003763.git.siyanteng@loongson.cn>
References: <cover.1645003763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../admin-guide/mm/damon/index.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/admin-guide/mm/damon/index.rst      | 26 +++++++++++++++++++
 .../zh_CN/admin-guide/mm/index.rst            |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst

diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
new file mode 100644
index 000000000000..4581e1bc2506
--- /dev/null
+++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
@@ -0,0 +1,26 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../../../disclaimer-zh_CN.rst
+
+:Original: Documentation/admin-guide/mm/damon/index.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+============
+监测数据访问
+============
+
+:doc:`DAMON </vm/damon/index>` 允许轻量级的数据访问监测。使用DAMON，
+用户可以分析他们系统的内存访问模式，并优化它们。
+
+.. toctree::
+   :maxdepth: 2
+
+Todolist:
+
+*   start
+*   usage
+*   reclaim
diff --git a/Documentation/translations/zh_CN/admin-guide/mm/index.rst b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
index b2c114075090..181eb4cd6aae 100644
--- a/Documentation/translations/zh_CN/admin-guide/mm/index.rst
+++ b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
@@ -29,12 +29,12 @@ Linux内存管理有它自己的术语，如果你还不熟悉它，请考虑阅
 .. toctree::
    :maxdepth: 1
 
+   damon/index
    ksm
 
 Todolist:
 * concepts
 * cma_debugfs
-* damon/index
 * hugetlbpage
 * idle_page_tracking
 * memory-hotplug
-- 
2.27.0


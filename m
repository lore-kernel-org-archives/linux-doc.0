Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C71F5C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 01:50:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232403AbiA0Bud (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Jan 2022 20:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbiA0Buc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Jan 2022 20:50:32 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1382DC06161C
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 17:50:32 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id i65so1281987pfc.9
        for <linux-doc@vger.kernel.org>; Wed, 26 Jan 2022 17:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PEF0A6uhsxdtwKpGwaZiA4R4PC6dQReZ+boW2VpL6lg=;
        b=JcJZS8CJ1QQbfS7RAXT1gl2q98NtPscscJ3YopjZK4pNbUTwD+QXtZruvj8GaHtDNm
         Dg4D2JVED2Hm0Y6cTC4cHM2rPJScs7YiskAc+UQ8qkV3Of6AFjmPt6ieHab1jZQMfrgQ
         db5ImmziDq8tDjQtga8IPq0RW1w6moQP8fVEbqDxkK8Jop2Ps4Aewvi0TfDgL7vsgA5O
         EeOFkWA1nVXfjhBv8BDzpfLeGG86ixofJUQT2Hd7WqtjskKM1d2Hj2r4cuQxQ2IaZ6In
         jMVw/XbHhdJOfHpMdN0JYJVto4qllcd15DxOkkZ55kXVkvbxRrHlHl+8UCnWPtb7WOpu
         N21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PEF0A6uhsxdtwKpGwaZiA4R4PC6dQReZ+boW2VpL6lg=;
        b=ruVjpGvlKQEfbs3jnmgXYfXRVUdz45aoA1tW1x7+63cAScTI7V1YjkNhWwLLkaMDw4
         iEvxoH3dYScmVYJePT4ZWBCef9OvctfZCWQiPu4ejDju2XUaRLVQBIfxnc5MLPlT8Tuj
         sbgobLtYdG3UrZoLQToS0wJm6Pdy1QINhanykvbjEttK+suT0g4pJKOyi2oOeTbmxtPt
         ZvdWMcxgWohqqQsAuJamkUUcLPhhbQ0/bXLLJ0LWPXctybrqGzG0x4MoIgexHYDa1g1Y
         fQkd24TUIzkFr2nsVV0fT8+xCj/Ya1gV1RHnIzja832fHI9GfVV8d4ZWvRK3rMSLKuYk
         MxvA==
X-Gm-Message-State: AOAM530yjjFTKEj6S79jUJI9QX4BeVmGKALEvOloV/WEB+jmHnDNs8v5
        tquH/+iGcaEhetFCWwD1z7g=
X-Google-Smtp-Source: ABdhPJwB6tZ0nhH5OuZR8fu6EcWmA3K39k/aLUG3Qs+wED9dP9OS45YNx0FraS7aWGHKPQGmeerH+g==
X-Received: by 2002:a62:e116:: with SMTP id q22mr1236352pfh.48.1643248231529;
        Wed, 26 Jan 2022 17:50:31 -0800 (PST)
Received: from localhost.localdomain (cm218-252-25-221.hkcable.com.hk. [218.252.25.221])
        by smtp.gmail.com with ESMTPSA id a14sm3594562pfv.212.2022.01.26.17.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 17:50:31 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 1/2] docs/zh_CN: add free_page_reporting translation
Date:   Thu, 27 Jan 2022 09:47:53 +0800
Message-Id: <4ef77c1be8319fc45b18e9f4c41986095d794562.1643246827.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1643246827.git.siyanteng@loongson.cn>
References: <cover.1643246827.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate .../vm/free_page_reporting.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../zh_CN/vm/free_page_reporting.rst          | 38 +++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |  5 ++-
 2 files changed, 41 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/vm/free_page_reporting.rst

diff --git a/Documentation/translations/zh_CN/vm/free_page_reporting.rst b/Documentation/translations/zh_CN/vm/free_page_reporting.rst
new file mode 100644
index 000000000000..6894e26ce079
--- /dev/null
+++ b/Documentation/translations/zh_CN/vm/free_page_reporting.rst
@@ -0,0 +1,38 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/vm/_free_page_reporting.rst
+
+:翻译:
+
+ 司延腾 Yanteng Si <siyanteng@loongson.cn>
+
+:校译:
+
+==========
+空闲页报告
+==========
+
+空闲页报告是一个API，设备可以通过它来注册接收系统当前未使用的页面列表。这在虚拟
+化的情况下是很有用的，客户机能够使用这些数据来通知管理器它不再使用内存中的某些页
+面。
+
+对于驱动，通常是气球驱动要使用这个功能，它将分配和初始化一个page_reporting_dev_info
+结构体。它要填充的结构体中的字段是用于处理散点列表的 "report" 函数指针。它还必
+须保证每次调用该函数时能处理至少相当于PAGE_REPORTING_CAPACITY的散点列表条目。
+假设没有其他页面报告设备已经注册， 对page_reporting_register的调用将向报告框
+架注册页面报告接口。
+
+一旦注册，页面报告API将开始向驱动报告成批的页面。API将在接口被注册后2秒开始报告
+页面，并在任何足够高的页面被释放之后2秒继续报告。
+
+报告的页面将被存储在传递给报告函数的散列表中，最后一个条目的结束位被设置在条目
+nent-1中。 当页面被报告函数处理时，分配器将无法访问它们。一旦报告函数完成，这些
+页将被返回到它们所获得的自由区域。
+
+在移除使用空闲页报告的驱动之前，有必要调用page_reporting_unregister，以移除
+目前被空闲页报告使用的page_reporting_dev_info结构体。这样做将阻止进一步的报
+告通过该接口发出。如果另一个驱动或同一驱动被注册，它就有可能恢复前一个驱动在报告
+空闲页方面的工作。
+
+
+Alexander Duyck, 2019年12月04日
diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentation/translations/zh_CN/vm/index.rst
index fc39f0d60318..9cdfde0364f0 100644
--- a/Documentation/translations/zh_CN/vm/index.rst
+++ b/Documentation/translations/zh_CN/vm/index.rst
@@ -23,17 +23,18 @@ TODO:待引用文档集被翻译完毕后请及时修改此处）
 
    active_mm
    balance
+   damon/index
+   free_page_reporting
+   ksm
 
 TODOLIST:
 * arch_pgtable_helpers
-* damon/index
 * free_page_reporting
 * frontswap
 * highmem
 * hmm
 * hwpoison
 * hugetlbfs_reserv
-* ksm
 * memory-model
 * mmu_notifier
 * numa
-- 
2.27.0


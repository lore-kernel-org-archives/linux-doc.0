Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 47B7F7D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:58:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729138AbeKLTtq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:49:46 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33629 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729133AbeKLTtq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 14:49:46 -0500
Received: by mail-wm1-f68.google.com with SMTP id f19-v6so8476571wmb.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 01:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=P7bU520jYWPTb3cyPzcSyUy1YpHK+qexJMs0P6lqanE=;
        b=JtQQC93arLRCUkYIzxYNMaBRBMon6J3hW9n1Xxh71Mx0tPT2003ZczFsHzJ42mmoOX
         CFbUgZR3B0Jz5VRmHN1WePt8B0KRBQkeu6YZZjQxZMnpbSTRsYSnZaaMTfMQXbgZ9JGD
         le/9K33CGl4PFQx+RuuGtMEVzyJUE113m9ick=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=P7bU520jYWPTb3cyPzcSyUy1YpHK+qexJMs0P6lqanE=;
        b=i+Tv2MHggweVAqb1tV0dIiQvh51ztCkJXnPB2pRrnWEcHjV9mdA8AxM8En2e9TRswo
         nYq1gxw4mRGyz2M0/z1cjHWwmzT/oXZpTywoN8+AiKRG0Zi4y6SxvOGKGJPhMage9Y9Y
         L4hfubpBq3jrgoYToVIpv/XnM3qbUeKeVf8vU1FTccfQC42Mrmu4AKKmCmMSyLc043/v
         M/oJOMIoabPnS1v+kMhKt7zlhqv8w4fYbV3SF9GGb4+2Ek/p9sNeqZwg9ADZ5GlhuJtB
         XkIqz7dNIq/tcRhCqTYTquwG6HKu0cnE818nZkj+YWedKN7MSCjgEsLJCvXwbznPh3TR
         CDQQ==
X-Gm-Message-State: AGRZ1gIl6VLBObNCAK0S5TVBOh7WuxNqziAWCxo+G011dJfQS5U7QuHA
        18pXRxOnJ5gnUWpKsuVojh7W5O8ijGwvsQiZ
X-Google-Smtp-Source: AJdET5fOPU/wEBvlrP6ob154UM+loSKSJ6hxBJmlftnunIrjo0kJIOyXnAZ6VBhayyAA8PJXPnmG9w==
X-Received: by 2002:a1c:b5ce:: with SMTP id e197-v6mr6848082wmf.30.1542016635664;
        Mon, 12 Nov 2018 01:57:15 -0800 (PST)
Received: from localhost.localdomain ([93.68.220.21])
        by smtp.gmail.com with ESMTPSA id r14-v6sm21273089wro.8.2018.11.12.01.57.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 01:57:15 -0800 (PST)
From:   Paolo Valente <paolo.valente@linaro.org>
To:     Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Angelo Ruocco <angeloruocco90@gmail.com>,
        Dennis Zhou <dennis@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Johannes Weiner <hannes@cmpxchg.org>
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        broonie@kernel.org, bfq-iosched@googlegroups.com,
        oleksandr@natalenko.name, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Valente <paolo.valente@linaro.org>
Subject: [PATCH 05/12] cgroup: add owner name to cftypes
Date:   Mon, 12 Nov 2018 10:56:25 +0100
Message-Id: <20181112095632.69114-6-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181112095632.69114-1-paolo.valente@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Angelo Ruocco <angeloruocco90@gmail.com>

The piece of information "who created a certain cftype" is not stored
anywhere, thus a cftype is not able to know who is its owner.

This commit addresses this problem by adding a new field in the cftype
structure that enables the name of its owner to be explicitly set.

Signed-off-by: Angelo Ruocco <angeloruocco90@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 include/linux/cgroup-defs.h |  2 ++
 include/linux/cgroup.h      | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index d659763c7221..6e31f478c6e1 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -36,6 +36,7 @@ struct seq_file;
 #define MAX_CGROUP_TYPE_NAMELEN 32
 #define MAX_CGROUP_ROOT_NAMELEN 64
 #define MAX_CFTYPE_NAME		64
+#define MAX_OWNER_NAME		64
 
 /* define the enumeration of all cgroup subsystems */
 #define SUBSYS(_x) _x ## _cgrp_id,
@@ -505,6 +506,7 @@ struct cftype {
 	 * end of cftype array.
 	 */
 	char name[MAX_CFTYPE_NAME];
+	char owner_name[MAX_OWNER_NAME];
 	unsigned long private;
 
 	/*
diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 9968332cceed..bf17a9843f45 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -293,6 +293,19 @@ void css_task_iter_end(struct css_task_iter *it);
 			;						\
 		else
 
+/**
+ * list_for_each_cft - walk circular list of cftypes linked together
+ * @cft: cftype from where to start
+ * @n: cftype used as a temporary storage
+ *
+ * A cftype pointed by a file may be part of a circular list of cftypes, this
+ * macro walks the circular list starting from any given cftype. Unlike the
+ * "list_for_each_entry" macro, the first element is included in the iteration.
+ */
+#define list_for_each_cft(cft, n)					\
+	for (n = NULL; cft != n; n = (n == NULL) ? cft : n,		\
+	     cft = list_next_entry(cft, share_node))
+
 /*
  * Inline functions.
  */
-- 
2.16.1


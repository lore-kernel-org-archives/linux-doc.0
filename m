Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0AB47D8A4
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 Jan 2019 22:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbfAJWIK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Jan 2019 17:08:10 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:33529 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728873AbfAJWIK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jan 2019 17:08:10 -0500
Received: by mail-pg1-f193.google.com with SMTP id z11so5413735pgu.0
        for <linux-doc@vger.kernel.org>; Thu, 10 Jan 2019 14:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OULLMuerNEP0alqy6OmnDEtcrB759rW8C6mN7L4vig=;
        b=srgGXbB+MDNra9yHvnpA7JnWGI1yejRbQpFLJdis5RB26UjMRqie4R/aLpnklNN0sS
         5MS4o1NN5rAT8Ib1XEseXKu47U1MW3+j8Nkeaj9RrKK9MxEaoeMMi7fVSpRYgDcAjikr
         RiGmbTb0KnMwV26nPA14fjRBZePi7eM3fcfGCU4Dmom9T1iiwNS+gg622NARdbtZlrdy
         xTwWjl+Z+99ssFmmYZqRPn7SNQYWzW6GoP30dPpVQv/zuXIAg8wvN0SWhp7AX1FS6eZF
         oHZ75LY1xssaHYs2FxZ7UEZi6KubW8MBt6CheGcaSE3XdXz9IntU59HFtunkyEXA2Hwk
         9keA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OULLMuerNEP0alqy6OmnDEtcrB759rW8C6mN7L4vig=;
        b=SJUMe46e3Kbjbp11oTcbhj6Ilb+9QZvtw7UwHybVgm1k89f/2AamqyCyf4ITxUmGd9
         i3f7rP3sC6v/7nJsRi28FzI7LrlVy8NadE3eYDRfRGA0d8OHUlEBA7ggYcnv1u5yrKJT
         Bjro5xQ6ONpJyzJPV5zpIQJSuCOq1ektnJjkYNAQDoqyM3GBmIeI86WOCvKqX+sRk9af
         hyu16BAqMtq3XDfa1KCJO4+1Ix9Ol4+bdQvZbwP0FrHO9VgzaeNUAToBJUDyXJwXaUf1
         Zhc4euQ0e12e4OfiapujDyIYRwp2jjZqgrPo44zQApb3/D8KgPL9QNZoMgkvqjrDO57f
         sPmQ==
X-Gm-Message-State: AJcUukeMUeDDK9fHxCiL+rqX7BmlziC5QiR/tqpTAAsYDwmvBlKiHDxB
        o/Aq88LSxPbpJvpJb0y9/DJ3sw==
X-Google-Smtp-Source: ALg8bN60+69qoUR4ahkci/QfrF0Ij7K44dZKkAyRXtZKwR23+ut1vvrrUADTQ2Xl1Peh8ZO+UT3bSQ==
X-Received: by 2002:a63:7e5b:: with SMTP id o27mr10907220pgn.214.1547158088900;
        Thu, 10 Jan 2019 14:08:08 -0800 (PST)
Received: from surenb0.mtv.corp.google.com ([2620:0:1000:1612:3320:4357:47df:276b])
        by smtp.googlemail.com with ESMTPSA id p7sm152958019pfj.72.2019.01.10.14.08.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Jan 2019 14:08:08 -0800 (PST)
From:   Suren Baghdasaryan <surenb@google.com>
To:     gregkh@linuxfoundation.org
Cc:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH v2 2/5] kernel: cgroup: add poll file operation
Date:   Thu, 10 Jan 2019 14:07:15 -0800
Message-Id: <20190110220718.261134-3-surenb@google.com>
X-Mailer: git-send-email 2.20.1.97.g81188d93c3-goog
In-Reply-To: <20190110220718.261134-1-surenb@google.com>
References: <20190110220718.261134-1-surenb@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Johannes Weiner <hannes@cmpxchg.org>

Cgroup has a standardized poll/notification mechanism for waking all
pollers on all fds when a filesystem node changes. To allow polling
for custom events, add a .poll callback that can override the default.

This is in preparation for pollable cgroup pressure files which have
per-fd trigger configurations.

Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 include/linux/cgroup-defs.h |  4 ++++
 kernel/cgroup/cgroup.c      | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 5e1694fe035b..6f9ea8601421 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -32,6 +32,7 @@ struct kernfs_node;
 struct kernfs_ops;
 struct kernfs_open_file;
 struct seq_file;
+struct poll_table_struct;
 
 #define MAX_CGROUP_TYPE_NAMELEN 32
 #define MAX_CGROUP_ROOT_NAMELEN 64
@@ -573,6 +574,9 @@ struct cftype {
 	ssize_t (*write)(struct kernfs_open_file *of,
 			 char *buf, size_t nbytes, loff_t off);
 
+	__poll_t (*poll)(struct kernfs_open_file *of,
+			 struct poll_table_struct *pt);
+
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	struct lock_class_key	lockdep_key;
 #endif
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 7a8429f8e280..3f533f95acdc 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3499,6 +3499,16 @@ static ssize_t cgroup_file_write(struct kernfs_open_file *of, char *buf,
 	return ret ?: nbytes;
 }
 
+static __poll_t cgroup_file_poll(struct kernfs_open_file *of, poll_table *pt)
+{
+	struct cftype *cft = of->kn->priv;
+
+	if (cft->poll)
+		return cft->poll(of, pt);
+
+	return kernfs_generic_poll(of, pt);
+}
+
 static void *cgroup_seqfile_start(struct seq_file *seq, loff_t *ppos)
 {
 	return seq_cft(seq)->seq_start(seq, ppos);
@@ -3537,6 +3547,7 @@ static struct kernfs_ops cgroup_kf_single_ops = {
 	.open			= cgroup_file_open,
 	.release		= cgroup_file_release,
 	.write			= cgroup_file_write,
+	.poll			= cgroup_file_poll,
 	.seq_show		= cgroup_seqfile_show,
 };
 
@@ -3545,6 +3556,7 @@ static struct kernfs_ops cgroup_kf_ops = {
 	.open			= cgroup_file_open,
 	.release		= cgroup_file_release,
 	.write			= cgroup_file_write,
+	.poll			= cgroup_file_poll,
 	.seq_start		= cgroup_seqfile_start,
 	.seq_next		= cgroup_seqfile_next,
 	.seq_stop		= cgroup_seqfile_stop,
-- 
2.20.1.97.g81188d93c3-goog


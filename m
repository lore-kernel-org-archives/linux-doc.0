Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9060A7DE6F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 10:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbeKSU6g (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 15:58:36 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45269 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728280AbeKSU6H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 15:58:07 -0500
Received: by mail-wr1-f68.google.com with SMTP id v6so9566646wrr.12
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 02:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=U4mx1fsW9hQVbmr4//R68r7KKVwetfXIYfE3uWdN0BA=;
        b=WmfejyvwiqglaM7h5Ev4Z0FCeNcqTiYIIExPQ4Tm4odYSIRRi7BQKPz60lpr5NxKUn
         Ql1cG2nTKWLNdExnpTToG1ROtic9FG/wQtE4SiV+z7fwdjnpxuYSE5pHUn2+EKlQHGQg
         sT2nPkqTp2x2oDyuhu8iBxzs0ALZZ7E508z78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=U4mx1fsW9hQVbmr4//R68r7KKVwetfXIYfE3uWdN0BA=;
        b=sNMTLwB4lE3H0MEnIUfSSrPMlV3FI9aHqZwkbDbeWVD99AvILzuIK5q3T6jt0BMRG8
         W1UxpmAovInR6UN3g6xBlERXdbM5kgJg8l0HR+wW3zOpLxBNVbTowl0hLW9q5zeH8sTa
         mybw6nFyJxqrDc54pEV+mml6yKeQGkA5OW5L0aE98pIrUApMUaIeRb5xRbQMcq1o1T9I
         m6MPNM67C043VYTkPjCA3hH84y5kqMUu1nRLelPb7eC0vdv091zhb1wD7KyP+inDtENp
         3Sg+V/VGjCg4TlNfFzq9CByRUa0LXBZdVcNdgmrt/2ERSpO8WTg3VmhihutIVNi0tIfT
         6ZaQ==
X-Gm-Message-State: AA+aEWbqbo86xkdEaoF2zU5Op6YQLKXL4FhqbzB90DcQsGBmU98ayzWm
        hVYQqYzN0QVWpSgO+rOAM7IPOQ==
X-Google-Smtp-Source: AFSGD/W2mi6KsjsMrtNGYj62KHvXQ8q32ubp7k6R4iPvkIGZteTn9oJGijRQQtIMchc92nXrQQ0Ntg==
X-Received: by 2002:a5d:410e:: with SMTP id l14mr9321492wrp.61.1542623692598;
        Mon, 19 Nov 2018 02:34:52 -0800 (PST)
Received: from localhost.localdomain ([37.162.18.180])
        by smtp.gmail.com with ESMTPSA id e9sm14973298wro.16.2018.11.19.02.34.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 02:34:52 -0800 (PST)
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
Subject: [PATCH V2 06/10] cgroup: make all functions of all cftypes be invoked
Date:   Mon, 19 Nov 2018 11:34:20 +0100
Message-Id: <20181119103424.3853-7-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181119103424.3853-1-paolo.valente@linaro.org>
References: <20181119103424.3853-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Angelo Ruocco <angeloruocco90@gmail.com>

When two or more entities (of any kind) share a file, their respective
cftypes are linked together. The allowed operations on those files
are: open, release, write and show, mapped to the functions defined in
the cftypes.

This commit makes the cgroup core invoke, whenever one of those
operations is requested, the respective function of all the cftypes
linked together.

Signed-off-by: Angelo Ruocco <angeloruocco90@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 kernel/cgroup/cgroup.c | 181 ++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 132 insertions(+), 49 deletions(-)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 61eafd69e2fd..9bf6b0b5a0ca 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3452,66 +3452,107 @@ static int cgroup_cpu_pressure_show(struct seq_file *seq, void *v)
 static int cgroup_file_open(struct kernfs_open_file *of)
 {
 	struct cftype *cft = of->kn->priv;
+	struct cftype *n;
+	int ret = 0;
 
+	list_for_each_cft(cft, n) {
+		if (cft->open)
+			ret = cft->open(of);
+		/*
+		 * If there has been an error with the open function of one of
+		 * the cft associated with the file, we call the release
+		 * function of all the cftype associated to cft whose open
+		 * function succeded.
+		 */
+		if (ret) {
+			struct cftype *c = of->kn->priv;
+			struct cftype *n;
+
+			list_for_each_cft(c, n) {
+				if (cft == c)
+					break;
+				if (c->release)
+					c->release(of);
+			}
+			break;
+		}
+	}
 
-	if (cft->open)
-		return cft->open(of);
-	return 0;
+	return ret;
 }
 
 static void cgroup_file_release(struct kernfs_open_file *of)
 {
 	struct cftype *cft = of->kn->priv;
+	struct cftype *n;
 
-	if (cft->release)
-		cft->release(of);
+	list_for_each_cft(cft, n)
+		if (cft->release)
+			cft->release(of);
 }
 
+/*
+ * Call all the write functions of the cftypes associated with the file.
+ *
+ * When a write fails, don't keep trying to write into the file via the write
+ * functions of the other cftypes associated with it.
+ */
 static ssize_t cgroup_file_write(struct kernfs_open_file *of, char *buf,
 				 size_t nbytes, loff_t off)
 {
 	struct cgroup_namespace *ns = current->nsproxy->cgroup_ns;
 	struct cgroup *cgrp = of->kn->parent->priv;
 	struct cftype *cft = of->kn->priv;
+	struct cftype *n;
 	struct cgroup_subsys_state *css;
-	int ret;
+	int ret = 0;
 
-	/*
-	 * If namespaces are delegation boundaries, disallow writes to
-	 * files in an non-init namespace root from inside the namespace
-	 * except for the files explicitly marked delegatable -
-	 * cgroup.procs and cgroup.subtree_control.
-	 */
-	if ((cgrp->root->flags & CGRP_ROOT_NS_DELEGATE) &&
-	    !(cft->flags & CFTYPE_NS_DELEGATABLE) &&
-	    ns != &init_cgroup_ns && ns->root_cset->dfl_cgrp == cgrp)
-		return -EPERM;
+	list_for_each_cft(cft, n) {
+		/*
+		 * If namespaces are delegation boundaries, disallow writes to
+		 * files in an non-init namespace root from inside the
+		 * namespace except for the files explicitly marked
+		 * delegatable - cgroup.procs and cgroup.subtree_control.
+		 */
+		if ((cgrp->root->flags & CGRP_ROOT_NS_DELEGATE) &&
+		    !(cft->flags & CFTYPE_NS_DELEGATABLE) &&
+		    ns != &init_cgroup_ns && ns->root_cset->dfl_cgrp == cgrp)
+			return -EPERM;
 
-	if (cft->write)
-		return cft->write(of, buf, nbytes, off);
+		if (cft->write) {
+			ret = cft->write(of, buf, nbytes, off);
 
-	/*
-	 * kernfs guarantees that a file isn't deleted with operations in
-	 * flight, which means that the matching css is and stays alive and
-	 * doesn't need to be pinned.  The RCU locking is not necessary
-	 * either.  It's just for the convenience of using cgroup_css().
-	 */
-	rcu_read_lock();
-	css = cgroup_css(cgrp, cft->ss);
-	rcu_read_unlock();
+			if (ret)
+				break;
+			continue;
+		}
 
-	if (cft->write_u64) {
-		unsigned long long v;
-		ret = kstrtoull(buf, 0, &v);
-		if (!ret)
-			ret = cft->write_u64(css, cft, v);
-	} else if (cft->write_s64) {
-		long long v;
-		ret = kstrtoll(buf, 0, &v);
-		if (!ret)
-			ret = cft->write_s64(css, cft, v);
-	} else {
-		ret = -EINVAL;
+		/*
+		 * kernfs guarantees that a file isn't deleted with operations
+		 * in flight, which means that the matching css is and stays
+		 * alive and doesn't need to be pinned.  The RCU locking is not
+		 * necessary either.  It's just for the convenience of using
+		 * cgroup_css().
+		 */
+		rcu_read_lock();
+		css = cgroup_css(cgrp, cft->ss);
+		rcu_read_unlock();
+
+		if (cft->write_u64) {
+			unsigned long long v;
+
+			ret = kstrtoull(buf, 0, &v);
+			if (!ret)
+				ret = cft->write_u64(css, cft, v);
+		} else if (cft->write_s64) {
+			long long v;
+
+			ret = kstrtoll(buf, 0, &v);
+			if (!ret)
+				ret = cft->write_s64(css, cft, v);
+		} else {
+			return -EINVAL;
+		}
 	}
 
 	return ret ?: nbytes;
@@ -3533,22 +3574,64 @@ static void cgroup_seqfile_stop(struct seq_file *seq, void *v)
 		seq_cft(seq)->seq_stop(seq, v);
 }
 
+/*
+ * A file shared by more cftypes may be showing different values. In that case
+ * call all the show functions and print the name of the owner that defined
+ * them.
+ */
 static int cgroup_seqfile_show(struct seq_file *m, void *arg)
 {
 	struct cftype *cft = seq_cft(m);
+	struct cftype *n;
 	struct cgroup_subsys_state *css = seq_css(m);
+	char *first_seqshow_str = NULL;
+	size_t first_str_size = 0;
+	size_t current_str_size = 0;
 	int ret = 0;
 
-	if (cft->seq_show)
-		ret = cft->seq_show(m, arg);
-	else if (cft->seq_show_cft)
-		ret = cft->seq_show_cft(m, cft, arg);
-	else if (cft->read_u64)
-		seq_printf(m, "%llu\n", cft->read_u64(css, cft));
-	else if (cft->read_s64)
-		seq_printf(m, "%lld\n", cft->read_s64(css, cft));
-	else
-		ret = -EINVAL;
+	list_for_each_cft(cft, n) {
+		if (cft->seq_show) {
+			ret = cft->seq_show(m, arg);
+			if (ret)
+				break;
+		} else if (cft->seq_show_cft) {
+			ret = cft->seq_show_cft(m, cft, arg);
+			if (ret)
+				break;
+		} else if (cft->read_u64) {
+			seq_printf(m, "%llu\n", cft->read_u64(css, cft));
+		} else if (cft->read_s64) {
+			seq_printf(m, "%lld\n", cft->read_s64(css, cft));
+		} else {
+			ret = -EINVAL;
+			break;
+		}
+		current_str_size = m->count - current_str_size;
+
+		if (first_seqshow_str == NULL) {
+			first_seqshow_str = kmalloc(m->size, GFP_KERNEL);
+			first_str_size = m->count;
+			strcpy(first_seqshow_str, m->buf);
+			first_str_size = m->count;
+		} else if (strcmp(first_seqshow_str,
+				  m->buf + m->count - current_str_size)) {
+			first_str_size = -1;
+		}
+
+		if (current_str_size) {
+			seq_printf(m, " - %s\n", cft->owner_name);
+			current_str_size = m->count;
+		}
+	}
+
+	/*
+	 * If all the cft->seqfile_show/read are equal, truncate the
+	 * output of the seqfile to the length of the first string.
+	 */
+	if (first_str_size != -1)
+		m->count = first_str_size;
+
+	kfree(first_seqshow_str);
 	return ret;
 }
 
-- 
2.16.1


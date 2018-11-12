Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 448637D08E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:57:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbeKLTti (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:49:38 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40370 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728440AbeKLTtg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 14:49:36 -0500
Received: by mail-wm1-f67.google.com with SMTP id z8-v6so1320285wma.5
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 01:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rpZR9mJwWH7OFtYLISHMCJG8f05AVkaLjpshd/8XLBg=;
        b=QDGg0Xfc28PGvnVlOCCcIqTsT8u+2STJ/BRHsU4TWNb0Qf39eUTzZBIPZWewRac+F9
         r48HnFML9ikjsTAzSxVkv0tFmaCQtYLBMHy0CbrhczPcXAlEm1vn9O3ROOQfl4KxKeZt
         qrhsIG/0OD+gZ8HfdS87YYirC8OfV4zYGI4ck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rpZR9mJwWH7OFtYLISHMCJG8f05AVkaLjpshd/8XLBg=;
        b=goRY3H5OK/RCUB/aAxDcNVSh/d98f2RAF4+kafbSnDUBexH2F3/yZQw773dqlkTqxr
         cX8foLpHJ41QtXjHWx3sEah+YZmgYARwyrkjESmBHoA378ThsEdAdvM02RJe6dE3JN5U
         /4cL48+elj/AZNbz09uHp9bxcZtGYQ3YUfbf3lTCLPyler2R9XjbKNkogBKvE6rFPudT
         GzW/D6oeYYoSpqDsBb0SpM7kekmkSy8l2gjWbuHlSfBEvyDqyCSF6MKkO868v1FsigOw
         EmgMDVSBZnomG2e/9UP/4PL2IPPVueKS6UhyPXP02VaY3jUsa3zaeTSil08HK25jnR13
         w5BA==
X-Gm-Message-State: AGRZ1gKWVVZ+rO34C8ZDfuu2nGF1alyf2SWv+70FWHomsuqPcHAm8/Wq
        bVi+5OwN9EktTYIILk/Vf683YQ==
X-Google-Smtp-Source: AJdET5eWLeJkszgxQtsLss1OSpAsy7RqDKp6DgrqNS+c3cAOGNvX8LTc+ygXS4wYZVvjQxFVOOjuEA==
X-Received: by 2002:a1c:2097:: with SMTP id g145-v6mr6949615wmg.57.1542016627706;
        Mon, 12 Nov 2018 01:57:07 -0800 (PST)
Received: from localhost.localdomain ([93.68.220.21])
        by smtp.gmail.com with ESMTPSA id r14-v6sm21273089wro.8.2018.11.12.01.57.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 01:57:07 -0800 (PST)
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
Subject: [PATCH 02/12] cgroup: add hook seq_show_cft with also the owning cftype as parameter
Date:   Mon, 12 Nov 2018 10:56:22 +0100
Message-Id: <20181112095632.69114-3-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181112095632.69114-1-paolo.valente@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The current implementation of the seq_show hook in the cftype struct
has only, as parameters, the seq_file to write to and the arguments
passed by the command line. Thus, the only way to retrieve the cftype
that owns an instance of such hook function is by using the accessor
in the seq_file itself.

But in a future scenario where the same file may be shared by multiple
cftypes, this accessor will point only to the first of the cftypes
linked to the seq_file. It will then be impossible to access the
cftype owning the seq_show function within the seq_show itself, unless
such cftype is the first one.

This commit adds an additional seq_show_cft hook that has as a formal
parameter also the cftype that owns the function.

Signed-off-by: Angelo Ruocco <angeloruocco90@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 include/linux/cgroup-defs.h |  3 ++-
 kernel/cgroup/cgroup.c      | 15 +++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/include/linux/cgroup-defs.h b/include/linux/cgroup-defs.h
index 5e1694fe035b..7841db6e7fb3 100644
--- a/include/linux/cgroup-defs.h
+++ b/include/linux/cgroup-defs.h
@@ -543,8 +543,9 @@ struct cftype {
 	 */
 	s64 (*read_s64)(struct cgroup_subsys_state *css, struct cftype *cft);
 
-	/* generic seq_file read interface */
+	/* generic seq_file read interfaces*/
 	int (*seq_show)(struct seq_file *sf, void *v);
+	int (*seq_show_cft)(struct seq_file *sf, struct cftype *cft, void *v);
 
 	/* optional ops, implement all or none */
 	void *(*seq_start)(struct seq_file *sf, loff_t *ppos);
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 8b79318810ad..74012b61fe19 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1448,7 +1448,8 @@ static umode_t cgroup_file_mode(const struct cftype *cft)
 {
 	umode_t mode = 0;
 
-	if (cft->read_u64 || cft->read_s64 || cft->seq_show)
+	if (cft->read_u64 || cft->read_s64 || cft->seq_show ||
+	    cft->seq_show_cft)
 		mode |= S_IRUGO;
 
 	if (cft->write_u64 || cft->write_s64 || cft->write) {
@@ -3549,17 +3550,19 @@ static int cgroup_seqfile_show(struct seq_file *m, void *arg)
 {
 	struct cftype *cft = seq_cft(m);
 	struct cgroup_subsys_state *css = seq_css(m);
+	int ret = 0;
 
 	if (cft->seq_show)
-		return cft->seq_show(m, arg);
-
-	if (cft->read_u64)
+		ret = cft->seq_show(m, arg);
+	else if (cft->seq_show_cft)
+		ret = cft->seq_show_cft(m, cft, arg);
+	else if (cft->read_u64)
 		seq_printf(m, "%llu\n", cft->read_u64(css, cft));
 	else if (cft->read_s64)
 		seq_printf(m, "%lld\n", cft->read_s64(css, cft));
 	else
-		return -EINVAL;
-	return 0;
+		ret = -EINVAL;
+	return ret;
 }
 
 static struct kernfs_ops cgroup_kf_single_ops = {
-- 
2.16.1


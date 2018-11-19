Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6BF867D8A3
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 10:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728096AbeKSU5x (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 15:57:53 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46174 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727813AbeKSU5w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 15:57:52 -0500
Received: by mail-wr1-f66.google.com with SMTP id l9so18545882wrt.13
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 02:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LmkQD0tbtsZAukIf+hDcnldAyNR4PdixWTebwHtfE1o=;
        b=AaxJv2p3JFx65im37SGV+IZMjQz1PPfDkb8OcXtv8JDpUPSwtJZtW84/AKZepCQe+C
         N6ByZWMq30fbYPq9WLjLvcq+3L+10BQzWw1OW1Pt/d9MWCFPc6NjMm4cKoRYnUAPMnD9
         s0GJUK1te5M31nWFXEdF1uRlg/3TqiSkMp1y0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LmkQD0tbtsZAukIf+hDcnldAyNR4PdixWTebwHtfE1o=;
        b=F1a8+cJAiWC+WMpR0no/DZNGC0Ijr387BVH2VsEDZJXPA+cM+p0HDRj9xsUWCRFFCI
         LhoH7Q6SLJUv094862r/PwmA7alpe6IWxugZzRFBo0t3hyko9eKd4XUTf9CUivYsJdTZ
         GMMnQBsnG5TBg7xdfXY5N+3CbfouxbaYSOiir8JVA8JmaC8aiLMvKuc5981dAirbbb3F
         wzq74vNJ33PmTb//OFc+7/ChGmztvIMq6EgD58g6g187JaeqN3mHEap9gfyO9piwWvrJ
         mc1w+3ZNwm6tGaD1S7xiNDFmeaDjGeawf0e7ynBoD/pCQsopI4hbTxA6tClVzR6HXttH
         4kBA==
X-Gm-Message-State: AA+aEWbHfTlevrZUMZAVmxoRcnTG/Aas4DaZQmhUMgv9+JPiklBtBSLz
        qwEUYH1ESWFAA/xctISWBDQM7A==
X-Google-Smtp-Source: AFSGD/VCCSlfW7s2cTUeUYGwoWoJPMb3TpI+ymkX4bkzm+sqlXypUQzp38a5WThphA2RbFy/Gh6k5g==
X-Received: by 2002:adf:a743:: with SMTP id e3mr4979481wrd.56.1542623677866;
        Mon, 19 Nov 2018 02:34:37 -0800 (PST)
Received: from localhost.localdomain ([37.162.18.180])
        by smtp.gmail.com with ESMTPSA id e9sm14973298wro.16.2018.11.19.02.34.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 02:34:37 -0800 (PST)
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
Subject: [PATCH V2 01/10] cgroup: add hook seq_show_cft with also the owning cftype as parameter
Date:   Mon, 19 Nov 2018 11:34:15 +0100
Message-Id: <20181119103424.3853-2-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181119103424.3853-1-paolo.valente@linaro.org>
References: <20181119103424.3853-1-paolo.valente@linaro.org>
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
index 6aaf5dd5383b..9d0993dd68fe 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -1418,7 +1418,8 @@ static umode_t cgroup_file_mode(const struct cftype *cft)
 {
 	umode_t mode = 0;
 
-	if (cft->read_u64 || cft->read_s64 || cft->seq_show)
+	if (cft->read_u64 || cft->read_s64 || cft->seq_show ||
+	    cft->seq_show_cft)
 		mode |= S_IRUGO;
 
 	if (cft->write_u64 || cft->write_s64 || cft->write) {
@@ -3519,17 +3520,19 @@ static int cgroup_seqfile_show(struct seq_file *m, void *arg)
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


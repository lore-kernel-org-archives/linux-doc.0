Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D84C49361
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 15:21:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A3E56127C
	for <linux-doc@archiver.kernel.org>; Fri, 18 Jun 2021 15:21:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbhFRPXv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Jun 2021 11:23:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:63684 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235120AbhFRPWa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 18 Jun 2021 11:22:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624029621; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=ND/72u+nNISmAsgxRuyz5vLjkrP/NEQ6vHD7wkgEiKc=; b=VnssmFFZQQ3+ZZZqJWDs/WedX2lSEPUIPzQaflCXrJgP/AMlDvQuaXFLR7nZxjhfuvYcZKWw
 gw4o/ShrUjj339rm0Zx+LexpFDXncm8nRt7jTf6n9j0THNus478EcuYVcX9MmJLV+oUfmN5W
 azUsnnXcTQj6iCb27KHSiCMFLP4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIzNjUxMiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60ccb99b2eaeb98b5e44d5d8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Jun 2021 15:19:55
 GMT
Sender: charante=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AF03C4323A; Fri, 18 Jun 2021 15:19:54 +0000 (UTC)
Received: from hu-charante-hyd.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: charante)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 39F64C43460;
        Fri, 18 Jun 2021 15:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 39F64C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=charante@codeaurora.org
From:   Charan Teja Reddy <charante@codeaurora.org>
To:     akpm@linux-foundation.org, vbabka@suse.cz, corbet@lwn.net,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, rientjes@google.com, mchehab+huawei@kernel.org,
        lokeshgidra@google.com, andrew.a.klychkov@gmail.com,
        xi.fengfei@h3c.com, nigupta@nvidia.com,
        dave.hansen@linux.intel.com, famzheng@amazon.com,
        mateusznosek0@gmail.com, oleksandr@redhat.com, sh_def@163.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
        Charan Teja Reddy <charante@codeaurora.org>
Subject: [PATCH V4 3/3] mm: compaction: fix wakeup logic of proactive compaction
Date:   Fri, 18 Jun 2021 20:48:55 +0530
Message-Id: <89e90b9c13566e7c28d70e5d6aa048ee3ec41757.1624028025.git.charante@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1624028025.git.charante@codeaurora.org>
References: <cover.1624028025.git.charante@codeaurora.org>
In-Reply-To: <cover.1624028025.git.charante@codeaurora.org>
References: <cover.1624028025.git.charante@codeaurora.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, proactive compaction tries to get triggered for every
HPAGE_FRAG_CHECK_INTERVAL_MSEC(=500msec) even when proactive compaction
is disabled with sysctl.compaction_proactiveness = 0. This results in
kcompactd thread wakes up and goes to sleep for every 500msec with out
the need of doing proactive compaction. Though this doesn't have any
overhead, few cpu cycles can be saved by avoid of waking up kcompactd
thread for proactive compaction when it is disabled.

Signed-off-by: Charan Teja Reddy <charante@codeaurora.org>
---
 -- Changes in V4:
       o No functional changes from V3.
 -- Changes in V3:
       o Fix wake up logic in proactive compaction.
 -- Changes in V2 through V2 doesn't exist.

 mm/compaction.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 7672be3..44a232a 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2928,6 +2928,8 @@ static int kcompactd(void *p)
 	while (!kthread_should_stop()) {
 		unsigned long pflags;
 
+		if (!sysctl_compaction_proactiveness)
+			timeout = MAX_SCHEDULE_TIMEOUT;
 		trace_mm_compaction_kcompactd_sleep(pgdat->node_id);
 		if (wait_event_freezable_timeout(pgdat->kcompactd_wait,
 			kcompactd_work_requested(pgdat), timeout) &&
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation


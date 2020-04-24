Return-Path: <SRS0=MbD/=6I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378D5C54FD0
	for <linux-doc@archiver.kernel.org>; Fri, 24 Apr 2020 20:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1325D214AF
	for <linux-doc@archiver.kernel.org>; Fri, 24 Apr 2020 20:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkgpsJhe"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbgDXUBx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Apr 2020 16:01:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729475AbgDXUBw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Apr 2020 16:01:52 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28728C09B048
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:51 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id h11so4117933plr.11
        for <linux-doc@vger.kernel.org>; Fri, 24 Apr 2020 13:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/8EQG22JXL8ro/80I28EMVnMy622Pquoagwe6M0KrVU=;
        b=bkgpsJheMHUDzSTUosy/UAmwFCjhd6C93gLM9hF6tuH8HE0JtCUDwchMJgA4bHZwLP
         4+f1x8+0v/848OOPExzbK2I3sunvdbo5trOn22INE8ZwrpXG0YsszY6YCNaTw1LFt4lY
         XN72vfCJQTu+zmfwmIj5CHhW3OjXO2uMxf+/NdOGySfetVTtMhHgSzuchXCmesiwvz61
         sctlSYlMaonWSsoBknhQ0UeQXNbWCA5tw9GbaJPOEjMemh924mF1FKK/BSqAELRs7mpc
         1OLxUhPRlrtGb02Ieerk9XKr3T05xZzlamq5SxmhEy/mXhO79lDkbcb/RGM90w2y/YOM
         te2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/8EQG22JXL8ro/80I28EMVnMy622Pquoagwe6M0KrVU=;
        b=XcKL6lbrgKvxqQ3o2TtxMq+W0bpIDYmND/yGmIKarKvk5tvV7HEYSW+a8Rz147blZl
         yIeYl1taA2H4OnqagHXLINYwH+957yrFyJ1Xrcq7uHJfJd36RrQqTrIsldf24yHoIu6K
         vt/yx6b8YlOfKYu/2ivS/nshF4zkcd7YFs2YMeqEGTYTPjmSsQxIIY+m9sOgETMq0WBx
         2ApTEo84R/u3iIH3+Snw/3eZg46qcRCSOdY7zHNLFx+Vl5wSt9A+Z3tun2aXy299CFIH
         jAvAn6B3ArSkCOj6nWH3FY+8/4glDiil6bSWgH3qeChiH7NTR4DRNbDA8BAmhErfdNHX
         QC2A==
X-Gm-Message-State: AGi0PuYuWMcLG9cXgV3y0dGts0vO/OqTFekVBHYVdCMykw+GxNAwPx/V
        Z/jn8NIm54f+oYoIp+mp1Mugkg==
X-Google-Smtp-Source: APiQypJUSxhtBMeJ7MpTSeNvVV+NwnzwtOy8Co1PRQCOAmo3YYA+dJdsE6uygCk7p+wHrej+onVEZg==
X-Received: by 2002:a17:90a:c702:: with SMTP id o2mr8185535pjt.196.1587758510506;
        Fri, 24 Apr 2020 13:01:50 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id o11sm5532224pgd.58.2020.04.24.13.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2020 13:01:49 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     loic.pallardy@st.com, arnaud.pouliquen@st.com, s-anna@ti.com,
        linux-remoteproc@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/14] remoteproc: Deal with synchronisation when shutting down
Date:   Fri, 24 Apr 2020 14:01:31 -0600
Message-Id: <20200424200135.28825-11-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200424200135.28825-1-mathieu.poirier@linaro.org>
References: <20200424200135.28825-1-mathieu.poirier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The remoteproc core must not allow function rproc_shutdown() to
proceed if currently synchronising with a remote processor and
the synchronisation operations of that remote processor does not
support it.  Also part of the process is to set the synchronisation
flag so that the remoteproc core can make the right decisions when
restarting the system.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 drivers/remoteproc/remoteproc_core.c     | 32 ++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_internal.h |  7 ++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 3a84a38ba37b..48afa1f80a8f 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1849,6 +1849,27 @@ int rproc_boot(struct rproc *rproc)
 }
 EXPORT_SYMBOL(rproc_boot);
 
+static bool rproc_can_shutdown(struct rproc *rproc)
+{
+	/*
+	 * The remoteproc core is the lifecycle manager, no problem
+	 * calling for a shutdown.
+	 */
+	if (!rproc_needs_syncing(rproc))
+		return true;
+
+	/*
+	 * The remoteproc has been loaded by another entity (as per above
+	 * condition) and the platform code has given us the capability
+	 * of stopping it.
+	 */
+	if (rproc->sync_ops->stop)
+		return true;
+
+	/* Any other condition should not be allowed */
+	return false;
+}
+
 /**
  * rproc_shutdown() - power off the remote processor
  * @rproc: the remote processor
@@ -1879,6 +1900,9 @@ void rproc_shutdown(struct rproc *rproc)
 		return;
 	}
 
+	if (!rproc_can_shutdown(rproc))
+		goto out;
+
 	/* if the remote proc is still needed, bail out */
 	if (!atomic_dec_and_test(&rproc->power))
 		goto out;
@@ -1898,6 +1922,14 @@ void rproc_shutdown(struct rproc *rproc)
 	kfree(rproc->cached_table);
 	rproc->cached_table = NULL;
 	rproc->table_ptr = NULL;
+
+	/*
+	 * The remote processor has been switched off - tell the core what
+	 * operation to use from hereon, i.e whether an external entity will
+	 * reboot the remote processor or it is now the remoteproc core's
+	 * responsability.
+	 */
+	rproc_set_sync_flag(rproc, RPROC_SYNC_STATE_SHUTDOWN);
 out:
 	mutex_unlock(&rproc->lock);
 }
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 61500981155c..7dcc0a26892b 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -27,6 +27,9 @@ struct rproc_debug_trace {
 /*
  * enum rproc_sync_states - remote processsor sync states
  *
+ * @RPROC_SYNC_STATE_SHUTDOWN	state to use after the remoteproc core
+ *				has shutdown (rproc_shutdown()) the
+ *				remote processor.
  * @RPROC_SYNC_STATE_CRASHED	state to use after the remote processor
  *				has crashed but has not been recovered by
  *				the remoteproc core yet.
@@ -36,6 +39,7 @@ struct rproc_debug_trace {
  * operation to use.
  */
 enum rproc_sync_states {
+	RPROC_SYNC_STATE_SHUTDOWN,
 	RPROC_SYNC_STATE_CRASHED,
 };
 
@@ -43,6 +47,9 @@ static inline void rproc_set_sync_flag(struct rproc *rproc,
 				       enum rproc_sync_states state)
 {
 	switch (state) {
+	case RPROC_SYNC_STATE_SHUTDOWN:
+		rproc->sync_with_rproc = rproc->sync_flags.after_stop;
+		break;
 	case RPROC_SYNC_STATE_CRASHED:
 		rproc->sync_with_rproc = rproc->sync_flags.after_crash;
 		break;
-- 
2.20.1


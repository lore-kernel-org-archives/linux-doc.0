Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD92C63697
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:54:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B3A821D7E
	for <linux-doc@archiver.kernel.org>; Thu, 26 Nov 2020 15:54:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q0DXHENI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgKZPya (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 26 Nov 2020 10:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391335AbgKZPya (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Nov 2020 10:54:30 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC5EC0617A7
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:30 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id l1so2634867wrb.9
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2020 07:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9eBkN6lmfdOZ6y3T4AeVQ2xEMCxfbxxoIUc76Qx59Gw=;
        b=q0DXHENIOaqhJFnVso9J1kN3Eb61iVK8nd3AricHajirGlfnSXv+NmgwWHCMVIELoM
         /xkucGICwySq83LXla7dhpUSyhhrYAX2WyLB2M0GSO+2LUD2XI2l+m2AypGqvHH1oZWj
         ar44f6d4mUGekt4sM2d7YlccV/6w5dO+75q5vS8ABmkgJxt4nsK1E5YYxMSRXHZwtqRw
         CgRzDUSpetP2+yE0F4UC58Vh56PRAdl/j8zQgvJ3gdi0B97IexPJS8ZDk2Z0gcqlwvRq
         +6NN5jRL2/yL9KuYo3aGBfcKHp1j9xVMqkzoFKdL7JrD/vM8UlDrwr99kKCpPxKPalu6
         8LXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9eBkN6lmfdOZ6y3T4AeVQ2xEMCxfbxxoIUc76Qx59Gw=;
        b=RBlLOjXsDqGGZjIpFSOo72SJSlSDXU18AiUr5QzZLWs7yEzlYVJq9CV3TtvDa1hdA4
         ulKHfSB2wgy6DMudC/d52f+PjWIm7OoctQGbuEyoKWwIIVcEWJ16uKEz1wFRMfWIv2Dh
         vU41gMXypZMmwz2MQQIIZMmV0K5pjvE4VjKRpLczyji36NvHT36gHRbgsm6nR/ARVpcK
         H3B3V2i6jaIEeYVU3hTcz6uZcvzXm1HukMVMfa5s09oL0PqeC3ssrjgBil9ggAISY2mj
         GshOHVYXWXC2zK9CJGmOdvbwg+9ESDHmrFEKFJ9dmYjkG284vn8/tQ8DBWvPAXV9KG/r
         Wi4A==
X-Gm-Message-State: AOAM533Y+N3Aq5d26BGZ/cXQirNgocMaJp1s4dh+ZnDLf4j+vwMHvIxz
        x+LR2U5tYdd3GsEWZqWDhsThLQ==
X-Google-Smtp-Source: ABdhPJw/lRW3PEMxi02nhLES66F/ltyrof/LoT+FjVRp6ybB+E4igrjSX8c/nxUUNknF9HL5GfidZA==
X-Received: by 2002:a5d:5482:: with SMTP id h2mr4667449wrv.18.1606406068612;
        Thu, 26 Nov 2020 07:54:28 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:f008:704d:8d4b:9951])
        by smtp.gmail.com with ESMTPSA id v7sm2637615wma.26.2020.11.26.07.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:54:27 -0800 (PST)
From:   David Brazdil <dbrazdil@google.com>
To:     kvmarm@lists.cs.columbia.edu
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
        James Morse <james.morse@arm.com>,
        Julien Thierry <julien.thierry.kdev@gmail.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Christoph Lameter <cl@linux.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@android.com, David Brazdil <dbrazdil@google.com>
Subject: [PATCH v3 01/23] psci: Support psci_ops.get_version for v0.1
Date:   Thu, 26 Nov 2020 15:53:59 +0000
Message-Id: <20201126155421.14901-2-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201126155421.14901-1-dbrazdil@google.com>
References: <20201126155421.14901-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KVM's host PSCI SMC filter needs to be aware of the PSCI version of the
system but currently it is impossible to distinguish between v0.1 and
PSCI disabled because both have get_version == NULL.

Populate get_version for v0.1 with a function that returns a constant.

psci_opt.get_version is currently unused so this has no effect on
existing functionality.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 drivers/firmware/psci/psci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 00af99b6f97c..213c68418a65 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -146,6 +146,11 @@ static int psci_to_linux_errno(int errno)
 	return -EINVAL;
 }
 
+static u32 psci_get_version_0_1(void)
+{
+	return PSCI_VERSION(0, 1);
+}
+
 static u32 psci_get_version(void)
 {
 	return invoke_psci_fn(PSCI_0_2_FN_PSCI_VERSION, 0, 0, 0);
@@ -514,6 +519,8 @@ static int __init psci_0_1_init(struct device_node *np)
 
 	pr_info("Using PSCI v0.1 Function IDs from DT\n");
 
+	psci_ops.get_version = psci_get_version_0_1;
+
 	if (!of_property_read_u32(np, "cpu_suspend", &id)) {
 		psci_function_id[PSCI_FN_CPU_SUSPEND] = id;
 		psci_ops.cpu_suspend = psci_cpu_suspend;
-- 
2.29.2.454.gaff20da3a2-goog


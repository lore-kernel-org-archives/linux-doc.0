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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A45C8300F
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3959921D7F
	for <linux-doc@archiver.kernel.org>; Wed,  2 Dec 2020 18:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387739AbgLBSmw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Dec 2020 13:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731007AbgLBSmv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Dec 2020 13:42:51 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C27C061A4C
        for <linux-doc@vger.kernel.org>; Wed,  2 Dec 2020 10:41:39 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id r3so5174181wrt.2
        for <linux-doc@vger.kernel.org>; Wed, 02 Dec 2020 10:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cK6AK8VTndq2WNu92SDcRQLBfLwMiV+V214MHUEgg2w=;
        b=Xf/f5iL7f+U7uWYo68hnex0nqviSfyrK8iju0quGui/JaXe3jHIb4ayRSem4PO/dq2
         lJGlb+3oWwRKdmbaF5MTjSBGA1a/nZ3DnuYAFU0VXkg3XJeK83UY1px90mjbi3yXR1Mb
         iM4vVVqC7wOJlGnKkNBM4fXDzNbk9nKHDjGpETmTOggyBJ43ISHXgf96DSwHeZ+e19Zg
         qzN5AGHZoq4l2bC1PF4CKHiN+laTlUEI/0jdRvB/GCkrYMSfiNf9DuMdmu6iUyf28J74
         kWyZuBuapoYx8SF7rQXnFicabHz3K+IUHtgj2IDCOGeZb28eFFDsBHNzY2NUKlGXgXVv
         XqJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cK6AK8VTndq2WNu92SDcRQLBfLwMiV+V214MHUEgg2w=;
        b=MHimJPh2I4Qj2erjbFQuWBRsp7WkMsUpX55BRS8uBZBPJKXoRvdl9OTQZWYTDLF4Lq
         Ep8xeA/zNPoMZnpCFkafP70bloPZ8FkZRNntnOaL3lCV0mBz80KndFOvyR/4APavYEgl
         bkbknusLAV2zMBXyMfz7qKid9gQrthuPJ8ps7d0oNKPI7HCjYmGChCdlepwXNHTBZCZJ
         qPUjcgLKQoIpBQUgp4ZTnnFsvj5CjEQHIC3iqwzxUiE1HkuWwlqvSTBqQ7yR2nVE1vyD
         iVAg7dWrU8Uh+Ybdtbb8riVfcBUXNAWkbi6CK5XLa9XmsTCuc/JomtB0p3mcFZpOUpCD
         9R8A==
X-Gm-Message-State: AOAM530G64hgVcFLCel+IAxRW1u5Ra6/s7et28BNCHJAWUeobpwvLj+N
        tcMtUvuCfKqRi7B2O46xzAvErQ==
X-Google-Smtp-Source: ABdhPJyx6RaeHoVm3xBFk7dQ2A5SBfxrzx+C7n8O07sr+KP5yugR90H9p2be9APNazqd8m8Fn6a1ww==
X-Received: by 2002:adf:dd81:: with SMTP id x1mr5122600wrl.163.1606934498348;
        Wed, 02 Dec 2020 10:41:38 -0800 (PST)
Received: from localhost ([2a01:4b00:8523:2d03:5ddd:b7c5:e3c9:e87a])
        by smtp.gmail.com with ESMTPSA id z21sm2967184wmk.20.2020.12.02.10.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Dec 2020 10:41:37 -0800 (PST)
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
Subject: [PATCH v4 05/26] psci: Replace psci_function_id array with a struct
Date:   Wed,  2 Dec 2020 18:41:01 +0000
Message-Id: <20201202184122.26046-6-dbrazdil@google.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201202184122.26046-1-dbrazdil@google.com>
References: <20201202184122.26046-1-dbrazdil@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Small refactor that replaces array of v0.1 function IDs indexed by an
enum of function-name constants with a struct of function IDs "indexed"
by field names. This is done in preparation for exposing the IDs to
other parts of the kernel. Exposing a struct avoids the need for
bounds checking.

Signed-off-by: David Brazdil <dbrazdil@google.com>
---
 drivers/firmware/psci/psci.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 13b9ed71b446..593fdd0e09a2 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -58,15 +58,14 @@ typedef unsigned long (psci_fn)(unsigned long, unsigned long,
 				unsigned long, unsigned long);
 static psci_fn *invoke_psci_fn;
 
-enum psci_function {
-	PSCI_FN_CPU_SUSPEND,
-	PSCI_FN_CPU_ON,
-	PSCI_FN_CPU_OFF,
-	PSCI_FN_MIGRATE,
-	PSCI_FN_MAX,
+struct psci_0_1_function_ids {
+	u32 cpu_suspend;
+	u32 cpu_on;
+	u32 cpu_off;
+	u32 migrate;
 };
 
-static u32 psci_function_id[PSCI_FN_MAX];
+static struct psci_0_1_function_ids psci_0_1_function_ids;
 
 #define PSCI_0_2_POWER_STATE_MASK		\
 				(PSCI_0_2_POWER_STATE_ID_MASK | \
@@ -178,7 +177,7 @@ static int __psci_cpu_suspend(u32 fn, u32 state, unsigned long entry_point)
 
 static int psci_0_1_cpu_suspend(u32 state, unsigned long entry_point)
 {
-	return __psci_cpu_suspend(psci_function_id[PSCI_FN_CPU_SUSPEND],
+	return __psci_cpu_suspend(psci_0_1_function_ids.cpu_suspend,
 				  state, entry_point);
 }
 
@@ -198,7 +197,7 @@ static int __psci_cpu_off(u32 fn, u32 state)
 
 static int psci_0_1_cpu_off(u32 state)
 {
-	return __psci_cpu_off(psci_function_id[PSCI_FN_CPU_OFF], state);
+	return __psci_cpu_off(psci_0_1_function_ids.cpu_off, state);
 }
 
 static int psci_0_2_cpu_off(u32 state)
@@ -216,7 +215,7 @@ static int __psci_cpu_on(u32 fn, unsigned long cpuid, unsigned long entry_point)
 
 static int psci_0_1_cpu_on(unsigned long cpuid, unsigned long entry_point)
 {
-	return __psci_cpu_on(psci_function_id[PSCI_FN_CPU_ON], cpuid, entry_point);
+	return __psci_cpu_on(psci_0_1_function_ids.cpu_on, cpuid, entry_point);
 }
 
 static int psci_0_2_cpu_on(unsigned long cpuid, unsigned long entry_point)
@@ -234,7 +233,7 @@ static int __psci_migrate(u32 fn, unsigned long cpuid)
 
 static int psci_0_1_migrate(unsigned long cpuid)
 {
-	return __psci_migrate(psci_function_id[PSCI_FN_MIGRATE], cpuid);
+	return __psci_migrate(psci_0_1_function_ids.migrate, cpuid);
 }
 
 static int psci_0_2_migrate(unsigned long cpuid)
@@ -548,22 +547,22 @@ static int __init psci_0_1_init(struct device_node *np)
 	psci_ops.get_version = psci_0_1_get_version;
 
 	if (!of_property_read_u32(np, "cpu_suspend", &id)) {
-		psci_function_id[PSCI_FN_CPU_SUSPEND] = id;
+		psci_0_1_function_ids.cpu_suspend = id;
 		psci_ops.cpu_suspend = psci_0_1_cpu_suspend;
 	}
 
 	if (!of_property_read_u32(np, "cpu_off", &id)) {
-		psci_function_id[PSCI_FN_CPU_OFF] = id;
+		psci_0_1_function_ids.cpu_off = id;
 		psci_ops.cpu_off = psci_0_1_cpu_off;
 	}
 
 	if (!of_property_read_u32(np, "cpu_on", &id)) {
-		psci_function_id[PSCI_FN_CPU_ON] = id;
+		psci_0_1_function_ids.cpu_on = id;
 		psci_ops.cpu_on = psci_0_1_cpu_on;
 	}
 
 	if (!of_property_read_u32(np, "migrate", &id)) {
-		psci_function_id[PSCI_FN_MIGRATE] = id;
+		psci_0_1_function_ids.migrate = id;
 		psci_ops.migrate = psci_0_1_migrate;
 	}
 
-- 
2.29.2.454.gaff20da3a2-goog


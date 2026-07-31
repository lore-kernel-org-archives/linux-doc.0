Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738E13314AE
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 19:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526629; cv=none; b=Jyi/c11lh8dQEjGj5W2/aro1l5hks80wRXtQqzCJ/k17maDWq4P+aWpihVM2W/2Xrl77aaqs/E1RMwnq1tm207k2liBB9FEyyDGKVckInOEPhlRC9XODrGO37PsXjPR+ODopUMAx1lGA0A0iFnJrLZUgx3hPa88/38NTmXoy7ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526629; c=relaxed/simple;
	bh=qXT/YyghuLXJBSy1G2LLYi1ev8LYFIkXQQw2480uRds=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=eXRg6OZ9PUkcjzXmJ8HcrJYzBAAk2URawbESE4ED5LL/fKeHTwIr+bBOTK89NsrJLSZbd/bRGBgEb9m30BVUnz+AZd1TyJPDz4sYo4PljqGDrUHPoL3Oj36UriBn6/ADPiJo2K/PVwlWxc9jxE1GHTLgcvg2mrDt+xRcMGS6LUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nYG0NrQA; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nYG0NrQA"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso1510949a12.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 12:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785526628; x=1786131428; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vECLUKzXFGOEzwlGZwpZ/IhaB1EZugqHi458H7aGCEg=;
        b=nYG0NrQAIFuj63nhJDxmPcu1N6CVfErECmcjVMT19WThRSIlWDzqqmlU0e5Xl4ar2B
         2jY8S4VbH17U25hjjHg65iNGe+w4sWJ10nkGivRCxe9sf+ciIQBEfqVlUv7RfMhaGR+G
         Xip6nHXNSJeAfBsleV8lRUBRVk7mmMDqsp8HANtR2aXPLamp9y0ueXEGMJpVkYKbCstF
         7t+haRCNRfDpVxedRQB7H5bvFFoeQCd4Uqdz1G77nBzt4R+V4hMPzcCBenp7aep7SVqk
         h6AFgx7b065m4bJBEr59biEiOWzf4PxKszNP78MaShtHQ71Ve0f49zMDyz2UNzIQUtF/
         +eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785526628; x=1786131428;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vECLUKzXFGOEzwlGZwpZ/IhaB1EZugqHi458H7aGCEg=;
        b=SSAd4KDtkuSuTB0wnXRUVOSHGLXvXgZp1xZZ6PXorKdeNb8C4m5JPcRufpz0biCT6L
         M7bN9sXohV63K9iDlfi/f3hg/zwEM6Xj2KNdxKFPLMo8dg1+NOqn7/bYZjshrRzgNsjF
         vvg5yzP49eAUbtBV/4kTO2oWzCflc6OBrrJgh0BbibhnpSxgfY5MRJki8Ti0riaqGE6n
         q/eo4A0lgHG5SlwQQh5QAStgFiYzs0KxmUoryQYsT+We+ozb0/xQ/3qgRakgh4Hl/jmq
         TvBD8ylC51Rffm1Qa6HtYlwMsdwp4E7HvZu0qUI7H5VB2Etz+CNkYtKC1c/poMTSMooa
         j1HA==
X-Forwarded-Encrypted: i=1; AHgh+RrEwpegOYyiM7FSC/AoJhBSJqkuXyhsbz8xC1TkLQU/ukZazS1Xje5FGIyW1uY+LfLH9lfBdv68D6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGTkwsJhUp6IJTUpeY1/ugsXE9sEh+QeIZFuSSqU/sZ/fk/f/
	rpfh6+XSXwGpFpY+xAJoPvD0E7WI/cyzNlYyIK/PexnxHNZW7Jz5sCgMqw9DxYGAQeX1agqXEqf
	tQhXIscP4Jg==
X-Received: from dybb18.prod.google.com ([2002:a05:693c:6092:b0:311:cbf9:7438])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7007:b0:3c6:3c5b:f2e4
 with SMTP id adf61e73a8af0-3c92a8f460fmr957909637.60.1785526627519; Fri, 31
 Jul 2026 12:37:07 -0700 (PDT)
Date: Fri, 31 Jul 2026 19:37:05 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260731193705.2902728-1-pratmal@google.com>
Subject: [PATCH v4] mm/page_reporting: Add page_reporting_delay_ms module parameter
From: pratmal@google.com
To: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org, 
	sj@kernel.org, corbet@lwn.net, ljs@kernel.org
Cc: skhan@linuxfoundation.org, anshuman.khandual@arm.com, gthelen@google.com, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, liam@infradead.org, rppt@kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

Free page reporting currently hardcodes a 2-second interval between
reports. This rigid delay cannot accommodate diverse guest workloads.

This patch introduces a module parameter, page_reporting_delay_ms
(default: 2000), allowing users to tune the reporting rate:
 - Lower values enable aggressive memory reclamation by returning unused
   pages to the host immediately.
 - Higher values help batch pages during spiky allocation/free churn,
   reducing hypercalls and nested page fault overheads.

Setting the delay to 0 is safe and execution is strictly gated by:
 - reporting is only triggered by high-order page frees.
 - expensive hypercalls are bounded by a slot capacity watermark check
   before proceeding.

Signed-off-by: Pratyush Mallick <pratmal@google.com>
---
v4:
 - Added a helper function for schedule_delayed_work().
 - Updated the commit message.
 - v3: https://lore.kernel.org/linux-mm/amiPTPKfTOEpgetH@lucifer/T/#t
v3:
 - Converted page_reporting_delay_ms from a sysctl to a module parameter.
 - Dropped the max value cap (PAGE_REPORTING_DELAY_MS_MAX).
 - Documented page_reporting.page_reporting_delay_ms in Documentation/admin-guide/kernel-parameters.txt.
 - Updated code comments in mm/page_reporting.c to reflect dynamic parameterization.
 - v2: https://lore.kernel.org/linux-mm/3da27fde-25dc-4cb8-8e05-74cd26fc2f7c@kernel.org/T/#t
v2:
 - Documented page_reporting_delay_ms in Documentation/admin-guide/sysctl/vm.rst.
 - v1: https://lore.kernel.org/linux-mm/20260722192935.1646848-1-pratmal@google.com/T/#u
v1: Fixed feedback from RFC.
 - Added lower and upper cap to sysctl value.
 - Reverted the reordering on page_reporting_delay_ms.
 - Dropped the mod_delayed_work() change.
 - RFC: https://lore.kernel.org/linux-mm/20260714171456.2350037-1-pratmal@google.com/T/#u
 .../admin-guide/kernel-parameters.txt         |  6 +++++
 mm/page_reporting.c                           | 26 +++++++++++++------
 2 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..364c2dce8e70 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4810,6 +4810,12 @@ Kernel parameters
 			Adjust the minimal page reporting order. The page
 			reporting is disabled when it exceeds MAX_PAGE_ORDER.
 
+	page_reporting.page_reporting_delay_ms=
+			[KNL] Free page reporting delay in milliseconds
+			Format: <unsigned integer>
+			Adjust the delay in milliseconds between free page
+			reporting intervals. Default is 2000 (2 seconds).
+
 	panic=		[KNL] Kernel behaviour on panic: delay <timeout>
 			timeout > 0: seconds before rebooting
 			timeout = 0: wait forever
diff --git a/mm/page_reporting.c b/mm/page_reporting.c
index 942e84b6908a..c01aa3af80f3 100644
--- a/mm/page_reporting.c
+++ b/mm/page_reporting.c
@@ -47,7 +47,11 @@ MODULE_PARM_DESC(page_reporting_order, "Set page reporting order");
  */
 EXPORT_SYMBOL_GPL(page_reporting_order);
 
-#define PAGE_REPORTING_DELAY	(2 * HZ)
+static unsigned int page_reporting_delay_ms = 2 * MSEC_PER_SEC;
+module_param(page_reporting_delay_ms, uint, 0644);
+MODULE_PARM_DESC(page_reporting_delay_ms,
+		 "Set page reporting delay in milliseconds");
+
 static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly;
 
 enum {
@@ -56,6 +60,13 @@ enum {
 	PAGE_REPORTING_ACTIVE
 };
 
+/* schedule work for page reporting */
+static void page_reporting_schedule_work(struct page_reporting_dev_info *prdev)
+{
+	schedule_delayed_work(&prdev->work,
+			      msecs_to_jiffies(page_reporting_delay_ms));
+}
+
 /* request page reporting */
 static void
 __page_reporting_request(struct page_reporting_dev_info *prdev)
@@ -76,11 +87,10 @@ __page_reporting_request(struct page_reporting_dev_info *prdev)
 		return;
 
 	/*
-	 * Delay the start of work to allow a sizable queue to build. For
-	 * now we are limiting this to running no more than once every
-	 * couple of seconds.
+	 * Delay the start of work to allow a sizable queue to build.
+	 * We limit this based on page_reporting_delay_ms.
 	 */
-	schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
+	page_reporting_schedule_work(prdev);
 }
 
 /* notify prdev of free page reporting request */
@@ -335,12 +345,12 @@ static void page_reporting_process(struct work_struct *work)
 err_out:
 	/*
 	 * If the state has reverted back to requested then there may be
-	 * additional pages to be processed. We will defer for 2s to allow
-	 * more pages to accumulate.
+	 * additional pages to be processed. We will defer by
+	 * page_reporting_delay_ms to allow more pages to accumulate.
 	 */
 	state = atomic_cmpxchg(&prdev->state, state, PAGE_REPORTING_IDLE);
 	if (state == PAGE_REPORTING_REQUESTED)
-		schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
+		page_reporting_schedule_work(prdev);
 }
 
 static DEFINE_MUTEX(page_reporting_mutex);
-- 
2.55.0.508.g3f0d502094-goog


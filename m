Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793B3DF01F
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 23:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785193550; cv=none; b=kSsgWroUXHE/oK1hP+IayUaSgw5A8ZgjUzW4xnh8vB9629O7xGi20/IqxcdrYG0sQUnwGRDvV9NToS7HnmS8CUsCgfX8q3JdUqd3aJxksy7QN0+zZhhEgKOpntibOf0DKYyDKeba4k8xO0T1z7zxOxRHb8SYDTWDbBHnf0XOWC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785193550; c=relaxed/simple;
	bh=IMjQJw16RAAwAtYnIc+WsIqMjJ3c9v+3r6PBzyWepzA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uO3qoaV/lCs0SKvFVy1iErf7oc7uXIf3dq/OBwJwRzdzB3njBkzkjHBVARf1DeFWZ4fEd4pVc/xB32bVUsc0RahQGdxRPBTQwCKXRRYC9GYDU2EkLygx6+VDMBTPoYPfoTTys8cFqEtewQ/0x3z4JPOOAF+b1Ym0oYJ1iWbIUww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f32UOKEl; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--pratmal.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f32UOKEl"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84e04598adeso2676582b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785193548; x=1785798348; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lCgFliqJWz+M9tZQ5Il6O3npkwRo/L4rfW7GdWN7+m0=;
        b=f32UOKElxHmmdh1i7VuMtO0X680cF0EUugfryK+E2CwzWPNocbSGKTLriGUfrWub8r
         N92nn7Zps6wclXvp8a5bQoPFoVpn5nQrP8/N8HqkkpMCZEaTpV5b8jDEOI+RbnIxlPK0
         wYkGtBMBR7oCE//Dz6wy0kKIf0ra51GAChtbcAPoNuZ2ylx9s7Jo6BroPkB+RAfVilwr
         DGCgV7Am2d6L8K6oovCRQxOTQMV7bKIsmyML51cTUUh0SVqVztEP+DahSjwoV53REgjL
         3tVJHA+eexV0ZdDwamjNWa2dew3FjqFQspz9sPPmOwov2k7M7vQEZ+QSARC1gyc0wafj
         9xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193548; x=1785798348;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lCgFliqJWz+M9tZQ5Il6O3npkwRo/L4rfW7GdWN7+m0=;
        b=hOU6k2jPulSQlbLOfeNiTA0SnaZQwh+fx7hY9vb04clH9NDdHQ4QkzJ4aOplsdyxDQ
         Bf6MBZ00PhwC18C9Bl1eASZg92WHHM775EzkNYXa7VO5ovLg2G1zIsF8vp9PCoSPYSMB
         hDkmtdEsx3hGv+juvVO+oK9otGoQEWg7LoxUoBXlnbSWtwHFmF/2R8/Enbv9xaGgDV56
         ckSowMb1tcXRQHZNXkYFaqGlsIry5KHGeLJ6TxlZdD9NWxgMpEBWIpiKSpaHYVQEoAfn
         Lvt/GAvoswS30/4T7mgWCXeMCyskPbGAKtVkaqN+mqZR39CHIhxglrSqXi1doXtToqQQ
         mDLw==
X-Forwarded-Encrypted: i=1; AHgh+RqfB7R005pEIe5RLaer3DIUVhyE32Iyw5xQDD7eZoRKYn/8OXY5SwucI6WZ1tQmuDnUWLj1Vz5MY58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPbAqDTnkwmEKSbD1EBfF/mk/S5ROMjd9BCDGwl/PrP8RlJ7A
	nJGLEoqC5BTP1NJQUmNVWy+YRhkICZVEefKqReM9edMqFeqOA2DztQeMX7Vdgq65UCxHLkimJPT
	1pOiVRwIyXw==
X-Received: from dykm9.prod.google.com ([2002:a05:7300:1889:b0:311:4890:b1b9])
 (user=pratmal job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:b92:b0:3c3:6c90:65b3
 with SMTP id adf61e73a8af0-3c67dff9882mr9745829637.65.1785193547902; Mon, 27
 Jul 2026 16:05:47 -0700 (PDT)
Date: Mon, 27 Jul 2026 23:05:45 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260727230545.262579-1-pratmal@google.com>
Subject: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module parameter
From: pratmal@google.com
To: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org, 
	sj@kernel.org, corbet@lwn.net
Cc: skhan@linuxfoundation.org, anshuman.khandual@arm.com, gthelen@google.com, 
	surenb@google.com, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, ljs@kernel.org, liam@infradead.org, rppt@kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Pratyush Mallick <pratmal@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pratyush Mallick <pratmal@google.com>

Currently, the free page reporting uses a hardcoded delay of
(2 HZ) between reporting intervals. While this is a reasonable
default, it lacks the flexibility to adapt to varying guest workloads.

A low delay allows aggressive memory reclamation, returning unused
pages to the host as quickly as possible. However, during spiky
allocation/free churn, this immediate reporting can lead to a severe
performance penalty (nested page faults) as the guest re-allocates memory
that the host has just unmapped. In these scenarios, there is benefit
from increasing the delay to batch free pages over a longer window,
absorbing the churn without hypercall and re-fault overhead.

This patch exposes the delay as a module parameter:
/sys/module/page_reporting/parameters/page_reporting_delay_ms, measured
in milliseconds and defaults to 2000ms.

Signed-off-by: Pratyush Mallick <pratmal@google.com>
---
v3:
 - Converted page_reporting_delay_ms from a sysctl to a module parameter.
 - Dropped the max value cap (PAGE_REPORTING_DELAY_MS_MAX).
 - Documented page_reporting_delay_ms in kernel-parameters.txt.
 - Updated code comments in mm/page_reporting.c.
 - v2: https://lore.kernel.org/linux-mm/3da27fde-25dc-4cb8-8e05-74cd26fc2f7c@kernel.org/T/#t

v2:
 - Documented page_reporting_delay_ms in Documentation/admin-guide/sysctl/vm.rst.
 - v1: https://lore.kernel.org/linux-mm/20260722192935.1646848-1-pratmal@google.com/T/#u

v1: Fixed feedback from RFC.
 - Added lower and upper cap to sysctl value.
 - Reverted the reordering on page_reporting_delay_ms.
 - Dropped the mod_delayed_work() change.
 - RFC: https://lore.kernel.org/linux-mm/20260714171456.2350037-1-pratmal@google.com/T/#u
 .../admin-guide/kernel-parameters.txt         |  6 ++++++
 mm/page_reporting.c                           | 21 ++++++++++++-------
 2 files changed, 19 insertions(+), 8 deletions(-)

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
index 942e84b6908a..a67311468204 100644
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
@@ -76,11 +80,11 @@ __page_reporting_request(struct page_reporting_dev_info *prdev)
 		return;
 
 	/*
-	 * Delay the start of work to allow a sizable queue to build. For
-	 * now we are limiting this to running no more than once every
-	 * couple of seconds.
+	 * Delay the start of work to allow a sizable queue to build.
+	 * We limit this based on page_reporting_delay_ms.
 	 */
-	schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
+	schedule_delayed_work(&prdev->work,
+			      msecs_to_jiffies(page_reporting_delay_ms));
 }
 
 /* notify prdev of free page reporting request */
@@ -335,12 +339,13 @@ static void page_reporting_process(struct work_struct *work)
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
+		schedule_delayed_work(&prdev->work,
+				      msecs_to_jiffies(page_reporting_delay_ms));
 }
 
 static DEFINE_MUTEX(page_reporting_mutex);
-- 
2.55.0.229.g6434b31f56-goog


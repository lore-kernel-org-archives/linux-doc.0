Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8B727A477;
	Tue, 28 Jul 2026 01:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785201239; cv=none; b=EbpXdzUlfP1jzG1bT2cFnfi5qHotXmHZ2T4HVmiGoMMxtfn5iggXKiYjoYWOppKIQ3hr7NtSpp6t2UAwJF37q0iH7ubGWQOQm32QX3lX6QE7kNyAGuvDYSQX1w1sISQsY//rKIjSLq99Z5bJCBBmWdaNCYmPzbWt3PvmUmYwNEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785201239; c=relaxed/simple;
	bh=4oHtG3v0tOUMa1Mw8i4F4wz1N31phh39K/DCtgAuMKk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=YluQu0N4V+bNdYaVJwYtCsneHWjKQLWQPUOjh/Or8GW71mE2u1UvtroVmlt65+qUywgOWecU83J/lTdmA4yq9D555KyTataTmn5G0nNuetZASkNhvr4tJv10Ts8gGbCL68ISoB5t31zRTuo7F2FEXMkQuFcXJUZY9eU7H2AN0pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BGilTH8z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BGilTH8z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A54C1F000E9;
	Tue, 28 Jul 2026 01:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785201236;
	bh=NIXmI5Wrz5QQpJEi32OhaAP/sLdLGCY4PKg0EE41yN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BGilTH8z74mcP66Zopm/CHbt5aJ75n75odHbFQLxDOFWNGetS4+SiUnn4vUx0L+76
	 JVjfXfLudFZ0BA2PEXQ/0dEPXvaxLAQSig19TXbSbMnbhFB+qjo1O4AJOIBEog4qqe
	 NhzwvhxaKABySW72eumF9j3++S7m2h5rcT4wlUnE=
Date: Mon, 27 Jul 2026 18:13:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: pratmal@google.com
Cc: vbabka@kernel.org, david@kernel.org, sj@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, anshuman.khandual@arm.com, gthelen@google.com,
 surenb@google.com, mhocko@suse.com, jackmanb@google.com,
 hannes@cmpxchg.org, ziy@nvidia.com, ljs@kernel.org, liam@infradead.org,
 rppt@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Link Lin <linkl@google.com>
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms
 module parameter
Message-Id: <20260727181355.481ebbe3b56425a760583f39@linux-foundation.org>
In-Reply-To: <20260727230545.262579-1-pratmal@google.com>
References: <20260727230545.262579-1-pratmal@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Jul 2026 23:05:45 +0000 pratmal@google.com wrote:

> From: Pratyush Mallick <pratmal@google.com>
> 
> Currently, the free page reporting uses a hardcoded delay of
> (2 HZ) between reporting intervals. While this is a reasonable
> default, it lacks the flexibility to adapt to varying guest workloads.
> 
> A low delay allows aggressive memory reclamation, returning unused
> pages to the host as quickly as possible. However, during spiky
> allocation/free churn, this immediate reporting can lead to a severe
> performance penalty (nested page faults) as the guest re-allocates memory
> that the host has just unmapped. In these scenarios, there is benefit
> from increasing the delay to batch free pages over a longer window,
> absorbing the churn without hypercall and re-fault overhead.
> 
> This patch exposes the delay as a module parameter:
> /sys/module/page_reporting/parameters/page_reporting_delay_ms, measured
> in milliseconds and defaults to 2000ms.

Of course we'd prefer some sort of self-tuning so the kernel
automatically avoids the situation.  But the user's expectation that
reporting occurs at a fixed frequency messes up that concept.


> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt

lgtm.  It conflicts with Link Lin's "mm/page_reporting: use
system_freezable_wq to fix UAF during suspend".  Easy resolution:


 Documentation/admin-guide/kernel-parameters.txt |    6 ++++
 mm/page_reporting.c                             |   19 ++++++++------
 2 files changed, 17 insertions(+), 8 deletions(-)

--- a/Documentation/admin-guide/kernel-parameters.txt~mm-page_reporting-add-page_reporting_delay_ms-module-parameter
+++ a/Documentation/admin-guide/kernel-parameters.txt
@@ -4813,6 +4813,12 @@ Kernel parameters
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
--- a/mm/page_reporting.c~mm-page_reporting-add-page_reporting_delay_ms-module-parameter
+++ a/mm/page_reporting.c
@@ -48,7 +48,11 @@ MODULE_PARM_DESC(page_reporting_order, "
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
@@ -77,12 +81,11 @@ __page_reporting_request(struct page_rep
 		return;
 
 	/*
-	 * Delay the start of work to allow a sizable queue to build. For
-	 * now we are limiting this to running no more than once every
-	 * couple of seconds.
+	 * Delay the start of work to allow a sizable queue to build.
+	 * We limit this based on page_reporting_delay_ms.
 	 */
 	queue_delayed_work(system_freezable_wq, &prdev->work,
-			   PAGE_REPORTING_DELAY);
+			   msecs_to_jiffies(page_reporting_delay_ms));
 }
 
 /* notify prdev of free page reporting request */
@@ -337,13 +340,13 @@ static void page_reporting_process(struc
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
 		queue_delayed_work(system_freezable_wq, &prdev->work,
-				   PAGE_REPORTING_DELAY);
+				   msecs_to_jiffies(page_reporting_delay_ms));
 }
 
 static DEFINE_MUTEX(page_reporting_mutex);
_


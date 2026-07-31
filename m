Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46C1D95A3;
	Fri, 31 Jul 2026 21:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785533663; cv=none; b=UWIpkMotmZS7WeCz1xZRK19tffIpjOihAWmzdHGOzq3LSDJjl2hSPtsab7rDbaqY8UB3CEAMGge8Y9pZ5CCdfYcs4ZN1Am9dro1w+Wr+sLJaVFmhspmxSB30zfOSKntevsWX7fonDie0l+EbMkRziXBaV929ZS0NJXBQLeYaSqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785533663; c=relaxed/simple;
	bh=trVW8CV1wJrrim1K+VidXRKSnmmDEgDKOim4tlw0BoI=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QpR5l8ohQ4PSQ7oQTOkTO2RZ/KAoxu5ovKGp+LIRBW4NXZBUMjQW+D+QrkWhgYcdVw2pAoUPJI7/L4wL5Gw+F8YDxAT4+VlIV8SMGijH6p12Y3vEOkoEyZq1sti2T0JPCveBVGDbCQQkPvFHZTACwefu1u43Jjr0ru1ch9uQe8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ifDOQ1SY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ifDOQ1SY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1161F00AC4;
	Fri, 31 Jul 2026 21:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1785533661;
	bh=xl5DXrdTRqnaEe2rqitpQGHYE6K74Xb0gMeSAYrZW/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ifDOQ1SYRWQ+Jyaxb2r8QDbxDjNXQ5IKB+Fl0NDIzg6uuMdiSx7JFI8ove6rmqEOL
	 YnQQy3r/XW2OW+0bvyW+2jRbNH8lxFMROAZyEwnq4m9iSRiPkflC+4kPOHdbQQzFiA
	 4ojzOu7w0B5zjxYeiuKNF3pIA2ojGzQtSLbS7nc0=
Date: Fri, 31 Jul 2026 14:34:20 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: pratmal@google.com
Cc: vbabka@kernel.org, david@kernel.org, sj@kernel.org, corbet@lwn.net,
 ljs@kernel.org, skhan@linuxfoundation.org, anshuman.khandual@arm.com,
 gthelen@google.com, surenb@google.com, mhocko@suse.com,
 jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
 liam@infradead.org, rppt@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] mm/page_reporting: Add page_reporting_delay_ms
 module parameter
Message-Id: <20260731143420.0787387ce2ca120ecee15338@linux-foundation.org>
In-Reply-To: <20260731193705.2902728-1-pratmal@google.com>
References: <20260731193705.2902728-1-pratmal@google.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 31 Jul 2026 19:37:05 +0000 pratmal@google.com wrote:

> Free page reporting currently hardcodes a 2-second interval between
> reports. This rigid delay cannot accommodate diverse guest workloads.
> 
> This patch introduces a module parameter, page_reporting_delay_ms
> (default: 2000), allowing users to tune the reporting rate:
>  - Lower values enable aggressive memory reclamation by returning unused
>    pages to the host immediately.
>  - Higher values help batch pages during spiky allocation/free churn,
>    reducing hypercalls and nested page fault overheads.
> 
> Setting the delay to 0 is safe and execution is strictly gated by:
>  - reporting is only triggered by high-order page frees.
>  - expensive hypercalls are bounded by a slot capacity watermark check
>    before proceeding.

This conflcits with the just-upstreamed 0b45f6927a1
("mm/page_reporting: use system_freezable_wq to fix UAF during
suspend")
(https://lore.kernel.org/20260721005603.1710551-1-linkl@google.com).

Please review my resolution:

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
@@ -57,6 +61,13 @@ enum {
 	PAGE_REPORTING_ACTIVE
 };
 
+/* schedule work for page reporting */
+static void page_reporting_schedule_work(struct page_reporting_dev_info *prdev)
+{
+	queue_delayed_work(system_freezable_wq, &prdev->work,
+			      msecs_to_jiffies(page_reporting_delay_ms));
+}
+
 /* request page reporting */
 static void
 __page_reporting_request(struct page_reporting_dev_info *prdev)
@@ -77,12 +88,10 @@ __page_reporting_request(struct page_rep
 		return;
 
 	/*
-	 * Delay the start of work to allow a sizable queue to build. For
-	 * now we are limiting this to running no more than once every
-	 * couple of seconds.
+	 * Delay the start of work to allow a sizable queue to build.
+	 * We limit this based on page_reporting_delay_ms.
 	 */
-	queue_delayed_work(system_freezable_wq, &prdev->work,
-			   PAGE_REPORTING_DELAY);
+	page_reporting_schedule_work(prdev);
 }
 
 /* notify prdev of free page reporting request */
@@ -337,13 +346,12 @@ static void page_reporting_process(struc
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
-		queue_delayed_work(system_freezable_wq, &prdev->work,
-				   PAGE_REPORTING_DELAY);
+		page_reporting_schedule_work(prdev);
 }
 
 static DEFINE_MUTEX(page_reporting_mutex);
_


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921CA37996C;
	Sat,  1 Aug 2026 09:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785576341; cv=none; b=M0yXSu1+rG0Nj0jsQln1jGgd4+HJb4kUlxqmKL6aUTG36Vi8/mHsKuW7PetUJlfpx6y/f+OqX0bct495zqAK9lV6cK8MjYyRQOo/ElvFnDMFnCFK+YAlmkQX/5gy+bCaXFUOao4zGlblOnO262oQ7AdtuX1tAq2YfG+5KGptEdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785576341; c=relaxed/simple;
	bh=M9XmZH4M5iP8qjbpSi9jwOlKI/kgMsZc0Bl4SJCkKf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S5bM91spav/tbbDyiAK4qo+kXzoHYH/9oWBr9ueR4U0Dv24W5W25i8izrfgn11aG6iiqoX9sCu/CGkaEnHmXRnbP9dgZXrehKoyOt9FBrz0bI5/bMd9ItlKPr/lJ8PQr0D2Pc9jvy3jVPgiYm8nWTw4DwSyp8NsXPO4XYby1P9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWOrIDhk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWOrIDhk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC0F1F00AC4;
	Sat,  1 Aug 2026 09:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785576340;
	bh=dnH8kMzvuedz5XR8h84XFqr31pF3AJSMqise3dLXv94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MWOrIDhk7NpRd710mAh9X31XwxvhTvYZO67pcOs5p4384DYr18f6yJ2dMsHnrL7U6
	 oqr2JLYspbFKTp695RDOwABAwGtkT4W46Whhzc/EyvIHxZO6jOcpVJ6dVlbkcSMETp
	 qLyeaMZKLdl2h2zUzXedcxjFCIftmYVifVM4K2D47iVGgZ6jiU6jYOq/XVDbMCUHq4
	 4MGJnAYhvegUBckzxfHOdHXMrF1L/T7Bfynw0dyBPMeoz2KkRIeTeNRUSrtfBosWA6
	 EHRowDuVeHERq7mfdVmgrziTxmd8C/AulssOsb5KYw0dI/TmxZ50cIU6X54tEUJvrw
	 a5dr/5n+1waEA==
Date: Sat, 1 Aug 2026 10:25:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: pratmal@google.com
Cc: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org, 
	sj@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	anshuman.khandual@arm.com, gthelen@google.com, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
Message-ID: <am20uLFuMrJH9wfN@lucifer>
References: <20260731193705.2902728-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731193705.2902728-1-pratmal@google.com>

On Fri, Jul 31, 2026 at 07:37:05PM +0000, pratmal@google.com wrote:
> From: Pratyush Mallick <pratmal@google.com>
>
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

Thanks!

>
> Signed-off-by: Pratyush Mallick <pratmal@google.com>

LGTM so:

Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
> v4:
>  - Added a helper function for schedule_delayed_work().
>  - Updated the commit message.
>  - v3: https://lore.kernel.org/linux-mm/amiPTPKfTOEpgetH@lucifer/T/#t
> v3:
>  - Converted page_reporting_delay_ms from a sysctl to a module parameter.
>  - Dropped the max value cap (PAGE_REPORTING_DELAY_MS_MAX).
>  - Documented page_reporting.page_reporting_delay_ms in Documentation/admin-guide/kernel-parameters.txt.
>  - Updated code comments in mm/page_reporting.c to reflect dynamic parameterization.
>  - v2: https://lore.kernel.org/linux-mm/3da27fde-25dc-4cb8-8e05-74cd26fc2f7c@kernel.org/T/#t
> v2:
>  - Documented page_reporting_delay_ms in Documentation/admin-guide/sysctl/vm.rst.
>  - v1: https://lore.kernel.org/linux-mm/20260722192935.1646848-1-pratmal@google.com/T/#u
> v1: Fixed feedback from RFC.
>  - Added lower and upper cap to sysctl value.
>  - Reverted the reordering on page_reporting_delay_ms.
>  - Dropped the mod_delayed_work() change.
>  - RFC: https://lore.kernel.org/linux-mm/20260714171456.2350037-1-pratmal@google.com/T/#u
>  .../admin-guide/kernel-parameters.txt         |  6 +++++
>  mm/page_reporting.c                           | 26 +++++++++++++------
>  2 files changed, 24 insertions(+), 8 deletions(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..364c2dce8e70 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4810,6 +4810,12 @@ Kernel parameters
>  			Adjust the minimal page reporting order. The page
>  			reporting is disabled when it exceeds MAX_PAGE_ORDER.
>
> +	page_reporting.page_reporting_delay_ms=
> +			[KNL] Free page reporting delay in milliseconds
> +			Format: <unsigned integer>
> +			Adjust the delay in milliseconds between free page
> +			reporting intervals. Default is 2000 (2 seconds).
> +
>  	panic=		[KNL] Kernel behaviour on panic: delay <timeout>
>  			timeout > 0: seconds before rebooting
>  			timeout = 0: wait forever
> diff --git a/mm/page_reporting.c b/mm/page_reporting.c
> index 942e84b6908a..c01aa3af80f3 100644
> --- a/mm/page_reporting.c
> +++ b/mm/page_reporting.c
> @@ -47,7 +47,11 @@ MODULE_PARM_DESC(page_reporting_order, "Set page reporting order");
>   */
>  EXPORT_SYMBOL_GPL(page_reporting_order);
>
> -#define PAGE_REPORTING_DELAY	(2 * HZ)
> +static unsigned int page_reporting_delay_ms = 2 * MSEC_PER_SEC;
> +module_param(page_reporting_delay_ms, uint, 0644);
> +MODULE_PARM_DESC(page_reporting_delay_ms,
> +		 "Set page reporting delay in milliseconds");
> +
>  static struct page_reporting_dev_info __rcu *pr_dev_info __read_mostly;
>
>  enum {
> @@ -56,6 +60,13 @@ enum {
>  	PAGE_REPORTING_ACTIVE
>  };
>
> +/* schedule work for page reporting */
> +static void page_reporting_schedule_work(struct page_reporting_dev_info *prdev)
> +{
> +	schedule_delayed_work(&prdev->work,
> +			      msecs_to_jiffies(page_reporting_delay_ms));
> +}
> +
>  /* request page reporting */
>  static void
>  __page_reporting_request(struct page_reporting_dev_info *prdev)
> @@ -76,11 +87,10 @@ __page_reporting_request(struct page_reporting_dev_info *prdev)
>  		return;
>
>  	/*
> -	 * Delay the start of work to allow a sizable queue to build. For
> -	 * now we are limiting this to running no more than once every
> -	 * couple of seconds.
> +	 * Delay the start of work to allow a sizable queue to build.
> +	 * We limit this based on page_reporting_delay_ms.
>  	 */
> -	schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
> +	page_reporting_schedule_work(prdev);
>  }
>
>  /* notify prdev of free page reporting request */
> @@ -335,12 +345,12 @@ static void page_reporting_process(struct work_struct *work)
>  err_out:
>  	/*
>  	 * If the state has reverted back to requested then there may be
> -	 * additional pages to be processed. We will defer for 2s to allow
> -	 * more pages to accumulate.
> +	 * additional pages to be processed. We will defer by
> +	 * page_reporting_delay_ms to allow more pages to accumulate.
>  	 */
>  	state = atomic_cmpxchg(&prdev->state, state, PAGE_REPORTING_IDLE);
>  	if (state == PAGE_REPORTING_REQUESTED)
> -		schedule_delayed_work(&prdev->work, PAGE_REPORTING_DELAY);
> +		page_reporting_schedule_work(prdev);
>  }
>
>  static DEFINE_MUTEX(page_reporting_mutex);
> --
> 2.55.0.508.g3f0d502094-goog
>

--
Cheers, Lorenzo

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364E93446A6;
	Tue, 28 Jul 2026 11:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785237248; cv=none; b=gjgZtoa6eF4CWnaVFLuYDUpEDljLIAgTBuvbJEuNhHF7mCK5glqVZkv2MYUt4ql4wsgFS+VYuOBfCEveiP/ojnuvvCzS9ayxjt5b/PZILHLVUrVUI+344X9aF2vu8AXXs5Z/VkE6HgVOsmM0utjVJ9t2BzkyFdiZn3S0cwjMTHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785237248; c=relaxed/simple;
	bh=vp93YgSELe/iwQ2aEBDro3NhVKYRHxViKxNKeLfdoKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTtsCs59ayIWuGalrmQHY6GfaleyUgpAJ23Lv+KHr0r1LsXhxCKrnuB1W0stGKT2bMikKmq7BS376iDQXwwz4hV349oqugKq7dr/xZt4Q6/ibY7tq/WnsOIhH1/e4kn/Nz5BEyZPoOirysFlIfUab+e1nOFADSxspvcoBDt9lMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LPe50sZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPe50sZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C511F000E9;
	Tue, 28 Jul 2026 11:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237247;
	bh=/BnA39edsDXhZakbSq/F6cdj+/HFBLubHdNOwS7e3lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LPe50sZMCYDr5ixko7ra5gKEwb0+j0gXOXX4CM3QC+CiJqhJak1d1WcSv+sPYIEVD
	 p8++6py3y9YXp7doinEsW4t9gBYPbK7bNtqpyoFnrJ2sJigaKT4NjX/eHUuEYh2oP1
	 az+wML4CXB6vuSXAD/2INNsO0nbBSuDp/HWdb9UFN+Ue2ojnObeZZt7lC6EPXzSHhs
	 FKEDMcQNIsuiMJ8PxDUQRjHDJon013BoUoyNMGC56Je43OPRz4K0j/Z/O2bQ2Hhb+G
	 1QsVycOSnT4mVfeiITd2NizLtkcCU9sIBcPxofjqYqjkEeuR0C3HeiDnW54V64RDVH
	 Pwl0mKsPWpAdg==
Date: Tue, 28 Jul 2026 12:13:47 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: pratmal@google.com
Cc: akpm@linux-foundation.org, vbabka@kernel.org, david@kernel.org, 
	sj@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	anshuman.khandual@arm.com, gthelen@google.com, surenb@google.com, mhocko@suse.com, 
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com, liam@infradead.org, 
	rppt@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module
 parameter
Message-ID: <amiN82J8p5z9l_Rm@lucifer>
References: <20260727230545.262579-1-pratmal@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727230545.262579-1-pratmal@google.com>

On Mon, Jul 27, 2026 at 11:05:45PM +0000, pratmal@google.com wrote:
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

Since you're talking about increasing it, maybe set the floor at the current
value of 2s?

>
> This patch exposes the delay as a module parameter:
> /sys/module/page_reporting/parameters/page_reporting_delay_ms, measured
> in milliseconds and defaults to 2000ms.

I'm not sure this is great as it means we now have a parameter we have to
support forever and autotuning becomes harder to implement, also if later the
implementation is changed, this might prevent a reimplementation.

Have you considered actually adding logic to detect the problem you're having
and delay in that case?

It seems like this is the "easy" solution but it has a price too.

>
> Signed-off-by: Pratyush Mallick <pratmal@google.com>
> ---
> v3:
>  - Converted page_reporting_delay_ms from a sysctl to a module parameter.
>  - Dropped the max value cap (PAGE_REPORTING_DELAY_MS_MAX).
>  - Documented page_reporting_delay_ms in kernel-parameters.txt.
>  - Updated code comments in mm/page_reporting.c.
>  - v2: https://lore.kernel.org/linux-mm/3da27fde-25dc-4cb8-8e05-74cd26fc2f7c@kernel.org/T/#t
>
> v2:
>  - Documented page_reporting_delay_ms in Documentation/admin-guide/sysctl/vm.rst.
>  - v1: https://lore.kernel.org/linux-mm/20260722192935.1646848-1-pratmal@google.com/T/#u
>
> v1: Fixed feedback from RFC.
>  - Added lower and upper cap to sysctl value.
>  - Reverted the reordering on page_reporting_delay_ms.
>  - Dropped the mod_delayed_work() change.
>  - RFC: https://lore.kernel.org/linux-mm/20260714171456.2350037-1-pratmal@google.com/T/#u
>  .../admin-guide/kernel-parameters.txt         |  6 ++++++
>  mm/page_reporting.c                           | 21 ++++++++++++-------
>  2 files changed, 19 insertions(+), 8 deletions(-)
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
> index 942e84b6908a..a67311468204 100644
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
> @@ -76,11 +80,11 @@ __page_reporting_request(struct page_reporting_dev_info *prdev)
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
> +	schedule_delayed_work(&prdev->work,
> +			      msecs_to_jiffies(page_reporting_delay_ms));

Err, do we not want to limit this to something sensible? What if the user
specifies 0 does it just hammer the system at that stage?

>  }
>
>  /* notify prdev of free page reporting request */
> @@ -335,12 +339,13 @@ static void page_reporting_process(struct work_struct *work)
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
> +		schedule_delayed_work(&prdev->work,
> +				      msecs_to_jiffies(page_reporting_delay_ms));

This code is duplicated, while you've making this change maybe pull this into
its own function?

>  }
>
>  static DEFINE_MUTEX(page_reporting_mutex);
> --
> 2.55.0.229.g6434b31f56-goog
>

Thanks, Lorenzo

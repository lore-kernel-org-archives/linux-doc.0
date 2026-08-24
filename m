Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E583537D0
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 11:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569392; cv=none; b=M4d/5Sc7C3KcY10QEWVh2qQX8ta4ufPSwsIKaFQgki4+OCDgjTWo39Ovu7wcZILrW6hiUuWQ1E4eryuVXPQOetDwWYuF3EBB6Z2Qg4IuGf2NHh5j9dEeVWEfTB06AdMSzfBJb+wLlrAIgOPwv9eYfJknBJ8L11MWOqPwQBKSkCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569392; c=relaxed/simple;
	bh=Ut9h7TWlUTrEIkPphu4EqaRJcc2broKStGh7BpCJbvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dP/sXvQa4sCYbOxrTGyiCLnxXSwUP4oKRO8U4hBnY8z6Tw74Bt2PwqXs+4T8KJTwyZ0rzlfXnf2VMX5Oeb29444iATmnznZG21vbtNMFGF9lu+BggW45PRxq5T23zkOYOBhb3DW+V/4v8/MmQNTIZHbEea9ltksqOU48QZZU384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SzPCSzAJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SzPCSzAJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1039E1F000E9;
	Mon, 24 Aug 2026 11:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787569391;
	bh=UdCOtUzK9WsMiHEbiXYD8f6q2FcIgH+IdV2r7/ydGwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SzPCSzAJGs3UGrpf2l5Ux5IkhIojvbrune2DyFgFdqytpk8KxvGYe4xy0mn9cvJpc
	 kTKyQ431BDuqkXn823kR2GrIbjkA5YAe1Els36lu393h7RjRapU5wFEyLCOoGLYhMW
	 f4PoB9ugcvMcYFUp1hEaBnvhfXG+Ul5AgPhr+hXG5ox0OaE1ExDs0fE8arUZslL4+F
	 mJQVLeXzSeHbrF4NiYc8JvdDxe/+yCIj/132zC6+zLpIeitDTEWvzJNLafHfTAdB78
	 pFgxBJluHzQ0in44PHlF27OJWnRNTy16WwoInCMPZyA3CXaZepPvqKrzQ7uFg0x8VN
	 4TkDhS5adwhow==
Date: Mon, 24 Aug 2026 12:03:05 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Jinjiang Tu <tujinjiang@huawei.com>
Cc: akpm@linux-foundation.org, david@kernel.org, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
	surenb@google.com, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	shr@devkernel.io, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	wangkefeng.wang@huawei.com, sunnanyong@huawei.com
Subject: Re: [PATCH v3 2/2] mm/ksm: fix advisor_min_pages_to_scan description
Message-ID: <aowk3FVFNAT1EIsE@gremlin>
References: <20260824061010.3343959-1-tujinjiang@huawei.com>
 <20260824061010.3343959-3-tujinjiang@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824061010.3343959-3-tujinjiang@huawei.com>

On Mon, Aug 24, 2026 at 02:10:10PM +0800, Jinjiang Tu wrote:
> Both Documentation/admin-guide/mm/ksm.rst and the comment next to the
> variable definition in mm/ksm.c describe advisor_min_pages_to_scan as a
> lower limit of the pages_to_scan parameter, but that is not how the
> scan-time advisor actually uses it. commit 4e5fa4f5eff6 ("mm/ksm: add ksm
> advisor") only uses it to initialize ksm_thread_pages_to_scan when the
> scan-time advisor is enabled.
>
> ksm_thread_pages_to_scan is adjusted by scan_time_advisor() after a full
> scan finishes. ksm_thread_pages_to_scan could be increased or decreased
> depend on the real scan time is longer or shorter than the target scan
> time. The min value of ksm_thread_pages_to_scan is only limited by
> KSM_ADVISOR_MIN_CPU, so ksm_thread_pages_to_scan could be smaller than
> ksm_advisor_min_pages_to_scan.
>
> The semantics of advisor_min_pages_to_scan was updated in the v2 patchset
> [1], but the documentation wasn't updated.
>
> Update the documentation and comment to match the semantics of
> advisor_min_pages_to_scan.
>
> Link: https://lore.kernel.org/linux-mm/20231028000945.2428830-2-shr@devkernel.io/ [1]
> Signed-off-by: Jinjiang Tu <tujinjiang@huawei.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  Documentation/admin-guide/mm/ksm.rst | 4 ++--
>  mm/ksm.c                             | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-guide/mm/ksm.rst
> index c9f533b10f6f..c329ca747b8c 100644
> --- a/Documentation/admin-guide/mm/ksm.rst
> +++ b/Documentation/admin-guide/mm/ksm.rst
> @@ -183,8 +183,8 @@ advisor_target_scan_time
>          pages. The default value is 200 seconds.
>
>  advisor_min_pages_to_scan
> -        specifies the lower limit of the ``pages_to_scan`` parameter of the
> -        scan time advisor. The default is 500.
> +        specifies the initial value of the ``pages_to_scan`` parameter of
> +        the scan time advisor. The default is 500.
>
>  advisor_max_pages_to_scan
>          specifies the upper limit of the ``pages_to_scan`` parameter of the
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 7d5b76478f0b..4a6cf8cf5d60 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -342,7 +342,7 @@ static enum ksm_advisor_type ksm_advisor;
>   * Only called through the sysfs control interface:
>   */
>
> -/* At least scan this many pages per batch. */
> +/* Initial number of pages to scan per batch. */
>  static unsigned long ksm_advisor_min_pages_to_scan = 500;
>
>  static void set_advisor_defaults(void)
> --
> 2.43.0
>

--
Cheers, Lorenzo

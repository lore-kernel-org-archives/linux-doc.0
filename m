Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B4A21CA12
	for <linux-doc@vger.kernel.org>; Sun, 18 May 2025 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747589846; cv=none; b=Vli6aI1kd1w7IL8J7Qynx8x97anJDpKPi5mxmSsgvJwbDTJ39x6xGRUUpNXN6agrHoylEJE2TWQ+6QQXvYLxltYHZ8K1Mq3nykk0b1PPxNwH21dl1vpf0Kut63r6/kQ3InSxMd8LXRxuSKyveEN26Y4mwOtQxOku7JkTKdjXvJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747589846; c=relaxed/simple;
	bh=CSRxbM3+T6U5byPtqB+FhmAWooidlHo2X7w37MqtYVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/UyRR5ubgFO+wjyT5xdn1+RJLACuHp5zj2SOQY5Cutff43S/MwHuHPDxiZ/CmO1dPEM1Xxy0gd1XXMgSwFvIwMitL9ObhvJSwt+xefvZjEihFlzwq+A0IKHBhhO0GtoAEXv+H4WklDgRmzDwPKiAnhulZQdaSBl38BSXe/6/mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rK2TRKH+; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rK2TRKH+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iKn9cvuYfxqJJaFXdXO2+NnISc4hH2vzGer5n9wvfbM=; b=rK2TRKH+h1R6ieAG135MGmJrUJ
	iJccO3sfNHaDUO83MCttA5zkTlRnRCzd5yoMuLlRRpfWoZIOxsHvrQLaIdzzCUGjQv69pD9DELlRd
	tsXnetF2D8Anl47doEQ/nuMENOEVPoQoVUAGb7IxiL5o681nLUjRs1cazT2TUBps/+pBMQnNNJbMm
	aanBKj4BXDNOlfTbRMkYjzl9CiZGImZfeAnaejDX8W2m+wAGd1BqfOkc05TsO98RrkDwrlqBrCSb6
	5jPGnAZCI1sFi6B8RhmNj+0CjWMNIsg95klnSPL92YQ4ujbnI13VrZ1vdaLBUp+cCf2cotvcrZOrb
	YTc/6yWQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uGhwi-00000000VYU-0xZp;
	Sun, 18 May 2025 17:37:09 +0000
Message-ID: <a7f91768-a05f-4c1b-afa6-42da1b371e97@infradead.org>
Date: Sun, 18 May 2025 10:37:04 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: admin-guide: fix typos in reporting-issues.rst
To: 10sharmashivam@gmail.com, corbet@lwn.net
Cc: linux@leemhuis.info, linux-doc@vger.kernel.org,
 linux-kernel-mentees@vger.kernel.org, skhan@linuxfoundation.org
References: <20250518172658.6983-1-10sharmashivam@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250518172658.6983-1-10sharmashivam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/18/25 10:26 AM, 10sharmashivam@gmail.com wrote:
> From: Shivam Sharma <10sharmashivam@gmail.com>
> 
> Correct pin-point to pinpoint, If that the case to If that is the case,
> and its only slightly modified to it's only slightly modified in
> Documentation/admin-guide/reporting-issues.rst for proper spelling and grammar.
> 
> Signed-off-by: Shivam Sharma <10sharmashivam@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/admin-guide/reporting-issues.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
> index 2fd5a030235a..9a847506f6ec 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -41,7 +41,7 @@ If you are facing multiple issues with the Linux kernel at once, report each
>  separately. While writing your report, include all information relevant to the
>  issue, like the kernel and the distro used. In case of a regression, CC the
>  regressions mailing list (regressions@lists.linux.dev) to your report. Also try
> -to pin-point the culprit with a bisection; if you succeed, include its
> +to pinpoint the culprit with a bisection; if you succeed, include its
>  commit-id and CC everyone in the sign-off-by chain.
>  
>  Once the report is out, answer any questions that come up and help where you
> @@ -206,7 +206,7 @@ Reporting issues only occurring in older kernel version lines
>  This subsection is for you, if you tried the latest mainline kernel as outlined
>  above, but failed to reproduce your issue there; at the same time you want to
>  see the issue fixed in a still supported stable or longterm series or vendor
> -kernels regularly rebased on those. If that the case, follow these steps:
> +kernels regularly rebased on those. If that is the case, follow these steps:
>  
>   * Prepare yourself for the possibility that going through the next few steps
>     might not get the issue solved in older releases: the fix might be too big
> @@ -312,7 +312,7 @@ small modifications to a kernel based on a recent Linux version; that for
>  example often holds true for the mainline kernels shipped by Debian GNU/Linux
>  Sid or Fedora Rawhide. Some developers will also accept reports about issues
>  with kernels from distributions shipping the latest stable kernel, as long as
> -its only slightly modified; that for example is often the case for Arch Linux,
> +it's only slightly modified; that for example is often the case for Arch Linux,
>  regular Fedora releases, and openSUSE Tumbleweed. But keep in mind, you better
>  want to use a mainline Linux and avoid using a stable kernel for this
>  process, as outlined in the section 'Install a fresh kernel for testing' in more

-- 
~Randy

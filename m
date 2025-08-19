Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378462FD7DF
	for <linux-doc@vger.kernel.org>; Tue, 19 Aug 2025 17:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755623990; cv=none; b=MPgT8jfOxOrMSwj679NSR7y52Em7GlhkGLhP4yatk7oS7+3M+v5f053iUgnLMTtzLfY/znviHX4E4Y338HQ5WYWOmFhOk5JOnlkQ48IC9yBB0a5ypdOmy/UINEjn71ubUtewT+bhlEL2gNIyVMzVYEPjQjTFPFkZlvuhyGYgfaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755623990; c=relaxed/simple;
	bh=EbEK+wUrPFyIZL6ejm/I4ihD2VipDGgycgoNU3ybRV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KvtWPygdzE3oS2rLrhww38jOmETxZGpXOzTYQH7r1gjTK22lMXgtfxQiieFKoyMpF5EkIedo7YEAyqTZKeU4/EVt85TPKuoVpN6WX+yWfIuwOXb5F87JnJI8g1dHSzuJaP53AG0yhyw7xcYRCm7YOo1j1zm2QC8OG20FG6T6+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eZBb9Ex3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eZBb9Ex3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IpCPFBFrffqol+gRZf+Avntwhnq8pE3YbK9M7WF2nzI=; b=eZBb9Ex3Av08HbtVD4OinOwJVu
	pSIpTEB+WK0HZKK9y1OJSbtiKlMp9+YNdpXz/sWIjZIPqQ2lkUjHbPZDROwtHp6ilgI6w/P/FQLNr
	c71j2eTSlCH/iDMGrNNUjK5/l1pDatsfGKYy1O/IRA5A0cB3nv0BTzzJZnGQwNvvGAI92oynPBQby
	ibw4laTHwz3q0QjeP55/m1CS0YAB3aZAlW658rhKZisViWuOs7eSEk6wMBdILd15Tf2qQsaTtgNGr
	mzC012kfqJBcS68Gh+knP46fI/uGP0wInodcIHOEN/F0zI+OXtLa+kIMp/54OiID9p2AZR9ooyVz1
	hgWTzNfQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoPzw-0000000B5Wl-3QJg;
	Tue, 19 Aug 2025 17:19:48 +0000
Message-ID: <c34602fb-b05d-4daa-a0c7-02fca96166de@infradead.org>
Date: Tue, 19 Aug 2025 10:19:48 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: replace a duplicated word and add missing
 SPDX-License tag
To: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>, corbet@lwn.net
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250819113551.34356-1-kubik.bartlomiej@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/19/25 4:35 AM, Bartlomiej Kubik wrote:
> Fix documentation issues by removing a duplicated word and adding the
> missing SPDX-License identifier.
> 
> Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
> 
> Changelog:
> 
> Changes since v2:
> - Replace “that” with “the.”
> 
> Changes since v1:		
> - Add missing SPDX-License tag
> - Remove duplicated word "that"
> 
>  Documentation/admin-guide/kernel-parameters.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
> index 39d0e7ff0965..7bf8cc7df6b5 100644
> --- a/Documentation/admin-guide/kernel-parameters.rst
> +++ b/Documentation/admin-guide/kernel-parameters.rst
> @@ -1,3 +1,5 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
>  .. _kernelparameters:
>  
>  The kernel's command-line parameters
> @@ -213,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
>  There are also arch-specific kernel-parameters not documented here.
>  
>  Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
> -a trailing = on the name of any parameter states that that parameter will
> +a trailing = on the name of any parameter states that the parameter will
>  be entered as an environment variable, whereas its absence indicates that
>  it will appear as a kernel argument readable via /proc/cmdline by programs
>  running once the system is up.

-- 
~Randy

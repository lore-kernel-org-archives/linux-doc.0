Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB074194A59
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 02:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750906386; cv=none; b=erhw/CYCR1LDO7yZCXCmYSe1gmUqdoRKrNhx7A3KqjC40NaXipcDd0kENzoPWUiNZrbliebCPsD8P2RG2WTcJC0JagKOjUIODGmYZGVlifyLH9KBzBK+Rj78GqmuNqcSS79DgFZg5fPZwoCn2m+WFkvUJ7kKrBIsZkoHNARKxxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750906386; c=relaxed/simple;
	bh=0VEI0X4CvEOOouYAIgu/X3YWJ20ZaQYk5XMJ1ezWz5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUADaY9feoe1j/QKTyZX6o21wDfIg9fzPMh2dvh9G/oDPQP6uDaVE1t1nRk1sQD3L5SOI6uXD2j5QtZAPGxevtWTNZVGn6/F0GGLRR8kgSwKK0FsbOGxW28kJEs+L+wG6dH9R3e6yaEY1BXvxg7inNFBI9y87NkldcY6bjj2/MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DzOvbgAD; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DzOvbgAD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w/cIVpHtvaBDtCOYKNZmW6y+GsF0Dr+uwVRldRHo/l8=; b=DzOvbgAD2fjZHVM9aG7TDiLXia
	9CEG5WcEewOtrhBWLGO6RVeoWXa+Wy7mAQnfv0SphwzA8aEHNDOv8AU4kJ8jI5KWypDNF1jvxWsiH
	2H4ynQaheU1cn8yD4PmM+IkTJHmT2GQ4NnxQ25rBSLCHGD250Lcn/8BJ2NfciaYiiSFHmf+1NHsen
	N1O8X6+R5iPJxMuJnSRIDhuRR+2P3JzIzzl6WrlDBPgxFweLwdZunVI3kiXwvkb0yWITyw351SXVJ
	OgZu3Lr5K+kxMakQ2joajC8g+AKAYC0S7DI4zl0EtEkalyxOYtqq/6+6m7J1B1Hcdn0pNeo8QJmEf
	E1e4z9bw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUcjU-000000061ZZ-3C3L;
	Thu, 26 Jun 2025 02:53:01 +0000
Message-ID: <d45396b1-2579-477b-890e-830d52ac2581@infradead.org>
Date: Wed, 25 Jun 2025 19:52:58 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ABI: make the KernelVersion field optional
To: alison.schofield@intel.com, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>
References: <20250626024101.792073-1-alison.schofield@intel.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250626024101.792073-1-alison.schofield@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/25/25 7:40 PM, alison.schofield@intel.com wrote:
> From: Alison Schofield <alison.schofield@intel.com>
> 
> The KernelVersion field has limited practical value. Git history
> provides more accurate tracking of when features were introduced
> and target kernel versions often change during development and
> merge.
> 
> Label it optional.
> 
> Signed-off-by: Alison Schofield <alison.schofield@intel.com>
> ---
> 
> Plan B is to remove the field entirely. 
> 
> 
>  Documentation/ABI/README | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/README b/Documentation/ABI/README
> index ef0e6d11e919..315fffe1f831 100644
> --- a/Documentation/ABI/README
> +++ b/Documentation/ABI/README
> @@ -46,7 +46,9 @@ Every file in these directories will contain the following information:
>  
>  What:		Short description of the interface
>  Date:		Date created
> -KernelVersion:	Kernel version this feature first showed up in.
> +KernelVersion:	(Optional) Kernel version this feature first showed up in.
> +		Note: git history often provides more accurate version
> +		info, so this field may be omitted.

ISTM that ABI files and git history have different users/audiences.
Sure, KernelVersion may be incorrect (but close?), but telling a "user"
that they should install git and clone linux.git to determine the kernel
version is a lot to ask -- and then they need git instructions for how to
look up the kernel version.

>  Contact:	Primary contact for this interface (may be a mailing list)
>  Description:	Long description of the interface and how to use it.
>  Users:		All users of this interface who wish to be notified when

-- 
~Randy


Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE012DB7A9;
	Tue, 12 May 2026 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778551430; cv=none; b=rgC7ecWYKRCoTHVN/fw+KELWB33JJYQ0Yn9Ez56EbVhj7WInItACo7l2tjNYsIEG2Gzlh45NBiOlEQVYbQ4d44bC4UUw+/Ao6T6FEr3mBVS+PrH/DujO9fjjnLIR33o7pSt7HYMVCdEzynoNjWWWRxPqalBusabxEJ3hlXx6G/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778551430; c=relaxed/simple;
	bh=bTDY1eGqE7yd5wIXnwhOVsBUAkOROMBmFRCI2fNGiyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S75SmVmxDLJ+kGjDT021c1ZJXewknVCbKejZBgnGA3GquhQu7nFpSLVXuT80CPYrqXBbleuFjO6HULsG2fcM3iQK26tL4yzoZAie8W9Eph7SIw0aoyTvq1XvIELJKfI8gOOK+MmDVWplOkfG9iV8BgZotDBM1W/TpvWscEdI+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mJg6p2cA; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mJg6p2cA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=wdp+dzxOs0pXky8Qxkm3o/6GJ9g6C72O6O+bRHyZZDE=; b=mJg6p2cAuUwQnlL7LMXTTeD56e
	lrLtxjNY/E4c9Js4lHnJsjhGAEua8CZjlQOFMIwdAHCkH2eKMRJNcTkEYtFIhP+MGZ0jjn44FOi0s
	WxOXHYLe1jAZA24pEm9yHexbYeT1SuOZXnyzAV5oWLiQ5Egp5Z1Sg3cQFE+HM2P14Qi/f90Hisgk2
	YBOdbqQese6e24A4GuYj0900PUlvGtgdUcPzHqViam+zqKhShWdH1W1GfwE1DO/Q7Mxi0AZbTYcRk
	zv0Rqy5AM8Myqun+c19XBxVSS5F/t8wHMt9E0j2vVHI2yaH08UG9kJ+yvsbTS6xsOWABGG1Y8uezU
	YDdgDKTA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcT3-0000000FE4y-0UL9;
	Tue, 12 May 2026 02:03:29 +0000
Message-ID: <836433fa-2e6e-4072-beae-1b77e757d3a6@infradead.org>
Date: Mon, 11 May 2026 19:03:27 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: reporting-issues: fix advice wording
To: Chen-Shi-Hong <eric039eric@gmail.com>, linux@leemhuis.info
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260512015146.4081-1-eric039eric@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260512015146.4081-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/11/26 6:51 PM, Chen-Shi-Hong wrote:
> Replace "these advices" with "this advice" in
> Documentation/admin-guide/reporting-issues.rst.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/admin-guide/reporting-issues.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
> index 16a66a1f1975..731865b5e8ff 100644
> --- a/Documentation/admin-guide/reporting-issues.rst
> +++ b/Documentation/admin-guide/reporting-issues.rst
> @@ -129,7 +129,7 @@ After these preparations you'll now enter the main part:
>     situations; during the merge window that actually might be even the best
>     approach, but in that development phase it can be an even better idea to
>     suspend your efforts for a few days anyway. Whatever version you choose,
> -   ideally use a 'vanilla' build. Ignoring these advices will dramatically
> +   ideally use a 'vanilla' build. Ignoring this advice will dramatically
>     increase the risk your report will be rejected or ignored.
>  
>   * Ensure the kernel you just installed does not 'taint' itself when
> @@ -795,7 +795,7 @@ Install a fresh kernel for testing
>      situations; during the merge window that actually might be even the best
>      approach, but in that development phase it can be an even better idea to
>      suspend your efforts for a few days anyway. Whatever version you choose,
> -    ideally use a 'vanilla' built. Ignoring these advices will dramatically
> +    ideally use a 'vanilla' built. Ignoring this advice will dramatically
>      increase the risk your report will be rejected or ignored.*
>  
>  As mentioned in the detailed explanation for the first step already: Like most
> 
> base-commit: 5d6919055dec134de3c40167a490f33c74c12581
> prerequisite-patch-id: 1089bde9e188a84c873ff722a776bc107a6e8103

-- 
~Randy

Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845C92857CC;
	Tue, 25 Nov 2025 05:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764050007; cv=none; b=Ha1iW2UoxieOZpubtCfQJ0U3/mKcVgo/qFpFw1QAVo5hXG+RctRuh8zsJkQNC0mPyxfIDPZ2hMVlqpRsXZEXZelDDCx1NQ+f14zL3urJtm+IIDSbf2ptvQuP4ch0ezbGj79PA5eWzkLmYHoKJq/z2e3Zca5DbZ/m7ivrtKxhzUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764050007; c=relaxed/simple;
	bh=DiObbucc0C5CFKycpRRDw3SgR+nYXbi94Arvkd1knKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tC9D04zJl2ZAjsUko030sapIFR4ybfB0XaS8mgyazfnfMb24OG8YMOBvBsWnhbaeqpIirNgHphypf0na4jeBKGFXOwQLJM0wicbWetEdYnVY+42dxn+ksE2XgazwaeVoA2EtSSP3VuXh97TtjSDpJWDW0EVe1kmvFM4XW6bSGLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tGYz0MV2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tGYz0MV2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=haQqnYQDuvg7Cx4NB51mm01UFixFiluTmg+NarrqEUU=; b=tGYz0MV2CXBm3T/y4WERpStvWd
	QSrn003iR4xQfSU3HhNCVhIzdQA1w9yYGSjgtt3PinfIFQMn6lBObjziM+acYEEAZz76rFNwFKQez
	tzqVZBf9SPFnj2wzD+turSKdZ1vLYgBRCDAW3bupbh2azanNYp5QxuqKxl9QQDtXAi20Rio7GxB/A
	82CHRdgIgv6OykLN/T496nPmA0NrYkB4wBwPWtCGAHNKKjMn1FX3gw9WVLF5jjo2CxlnPX7ozG633
	hP6dnKziODaj4gdf8MHOkOd2I67ySmHGS2YbvCNeAO3R3LbACuzGH0pvntoA0cyCpqZjE9Y8nHY5F
	5A2cHb6g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNlz5-0000000Cnbc-49Du;
	Tue, 25 Nov 2025 05:53:05 +0000
Message-ID: <7222680d-2812-4aca-ad29-4b908c6ba676@infradead.org>
Date: Mon, 24 Nov 2025 21:53:03 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Docs: admin/kernel-parameters: Add trace_clock=tai
To: Jian Zhang <zhangjian.3032@bytedance.com>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>, Feng Tang <feng.tang@linux.alibaba.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Kees Cook <kees@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Frank van der Linden <fvdl@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
References: <20251125053406.148219-1-zhangjian.3032@bytedance.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251125053406.148219-1-zhangjian.3032@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/25 9:34 PM, Jian Zhang wrote:
> After CLOCK_TAI is added, add missing option trace_clock=tai.
> 

When/where is CLOCK_TAI added?
Commit hash?
Thanks.

> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 6c42061ca20e..fdbd2149f321 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -7452,6 +7452,7 @@
>  			mono_raw - Use ktime_get_raw_fast_ns() for time
>  				stamps.
>  			boot - Use ktime_get_boot_fast_ns() for time stamps.
> +			tai - Use ktime_get_tai_fast_ns() for time stamps.
>  			Architectures may add more clocks. See
>  			Documentation/trace/ftrace.rst for more details.
>  

-- 
~Randy


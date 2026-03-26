Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7633FD145;
	Thu, 26 Mar 2026 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541269; cv=none; b=qMnaItCyBObiwuc3YH7o8lh9s1rzcn/U9ywcAz6SVZeU7oUXQn5yGHXFc9OsKU1JD+y6aUQNgyZCddtllAqIBzmp/xv85QvkG+3lELn0DzNQMeDjcJDm3I4YbMFTUJJhBoWEd9yv5mWSTZGJMCHQWnWIYFZzn59GUNYEaCh91L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541269; c=relaxed/simple;
	bh=szH3MY0WiQYpFTFxIiIbtNZTi78H3y/b2AdjBwwM2DU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gkSET4uvYPRw7KdQt2FdB9yHt4O1ZG9zUunEOmU1a//1V5U5buw8MiCgF4nVHaOjLb/ygAZdpe7spfW8oems42Zk2G2QdEGA0oegGYKi+d/cC+Psdji8j+O9laWD9uyp3LMS4+cITg9B84un+f9KOc0e54s4y9iQpsClE0prEU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tj0Lm22N; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tj0Lm22N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=c98lXZB1Lb6d6N5rkPaniwodh24QfrFl1Dqq3UC0kyE=; b=tj0Lm22NQAa98n4A4mwWWreMIw
	zeM1fF88CE+5JYuR5xmu4b/CGaElb5lSYZ1rPa3s16XZpwNKwE6WWW0KFZfe2NID2XUadkGqHz6uV
	jxhpV3er/xtMOa6wEZfRRKlr+q8KUL3L5nUtkKv1t3xFYldKGztyN6xDkRqtWwn+pmfmcnOgEn6TU
	2AeoFSGamqL+eKjUQLwLsXbMxzR2WdZcoDrkWjsQqsbs8HcFncN/VBrjlPpNPUc3Gky9O7szs+R/X
	ZTu87ABpJKobDeTTnoH7yNK7wLpdfDYH5W4c/7yLeHYecHl5To35UVPqUNIM8zCGYmcht4xQB141w
	7f/Qcs0w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5nFC-00000005pAP-0AdO;
	Thu, 26 Mar 2026 16:07:38 +0000
Message-ID: <b72c938d-1690-49f4-b617-916f24c3c53c@infradead.org>
Date: Thu, 26 Mar 2026 09:07:37 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kernel-parameters: fix architecture alignment for
 pt, nopt, and nobypass
To: lirongqing <lirongqing@baidu.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Dapeng Mi <dapeng1.mi@linux.intel.com>, Kees Cook <kees@kernel.org>,
 Marco Elver <elver@google.com>, "Paul E . McKenney" <paulmck@kernel.org>,
 Askar Safin <safinaskar@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Sohil Mehta <sohil.mehta@intel.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260326074658.1899-1-lirongqing@baidu.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260326074658.1899-1-lirongqing@baidu.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/26/26 12:46 AM, lirongqing wrote:
> From: Li RongQing <lirongqing@baidu.com>
> 
> Commit ab0e7f20768a ("Documentation: Merge x86-specific boot options doc
> into kernel-parameters.txt") introduced a formatting regression where
> architecture tags were placed on separate lines with broken indentation.
> This caused the 'nopt' [X86] parameter to appear as if it belonged to
> the [PPC/POWERNV] section.
> 
> Fix the formatting by placing the architecture tags on the same line as
> their respective parameters ('pt', 'nopt', and 'nobypass') and restoring
> proper indentation.
> 
> Fixes: ab0e7f20768a ("Documentation: Merge x86-specific boot options doc into kernel-parameters.txt")
> Signed-off-by: Li RongQing <lirongqing@baidu.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 03a5506..dc1c5bd 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2615,12 +2615,9 @@ Kernel parameters
>  			Intel machines). This can be used to prevent the usage
>  			of an available hardware IOMMU.
>  
> -			[X86]
> -		pt
> -			[X86]
> -		nopt
> -			[PPC/POWERNV]
> -		nobypass
> +		pt  	[X86]
> +		nopt	[X86]
> +		nobypass	[PPC/POWERNV]
>  			Disable IOMMU bypass, using IOMMU for PCI devices.
>  
>  		[X86]

This looks good as far as it goes, but there are still some problems IMO.

These are all iommu= options, but iommu says that it's for [X86,EARLY].
No PPC/POWERNV mentioned there.

Then immediately following nobypass, there is this:
		[X86]
		AMD Gart HW IOMMU-specific options:

which is also in questionable format. The [X86] isn't needed at all IMO,
or if it's desirable, those 2 lines should be on one line.

Anyway, for this patch:
Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A7F2D7BF;
	Fri,  7 Aug 2026 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081822; cv=none; b=AG/v6g5s2tcjaElpNeK89frfOaFs1JH1o4GdWvtxXP1mzezh+GwxrEoEuYABWV0W8lMCc7JgsNC2ccs48TH3dcT/jlb7deLQRERpEmLw99QLbT9jZktA4jFLUmpBgkaTyRnguo6gT9/YwB6v+9Db2AK+lvbC3EPNhIdgsex5jo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081822; c=relaxed/simple;
	bh=YVAtyIiVo47zR/vLvZvJXFCMjyHoKaOz+Co988m/phg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cm+sExn0RRWsnM2ISmPmD+MNTiYAL17ixlxILV/Mo4whq6HBkdpyzK/Kraec56RwcZozDVnY5voM18E45wvrWJMhgbL0SjThuYOe6dHbat51LLK4wqjGBN+GtYopwbKGjJZ7MxHSpr7WlEiz3USXIh+fHhcfKxHlrrdURaUR1m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Y2883ENI; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Y2883ENI"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1786081811; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=O2ts/+NOU/ig6apjsY5MOlDb5fcgScCS6Bn65AobUUQ=;
	b=Y2883ENIEGRIdsFZNjxa3R1pNZv95XFSi/LjC39cdnFU4H2NjKLEjLn6lY0psBv1T7B1PW4J4z6DSzLX/FaWXp6UcKaRHEFvrNkI6OrfiVSRgK5fixCVMQY4IeeeaIDFmIVx9v67yEfqAWnfgqrRuwsAFJkCsVjYoV10zwmgz88=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=feng.tang@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0X8VlEd6_1786081808;
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0X8VlEd6_1786081808 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 07 Aug 2026 13:50:09 +0800
Date: Fri, 7 Aug 2026 13:50:06 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	rdunlap@infradead.org, andriy.shevchenko@linux.intel.com,
	kees@kernel.org, tony.luck@intel.com, pmladek@suse.com,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com,
	kernel@gpiccoli.net
Subject: Re: [PATCH] docs: panic: Disclaimer about console verbosity when
 using panic_print with pstore
Message-ID: <anVyDvgyBi77RSTA@U-2FWC9VHC-2323.local>
References: <20260805205026.1699568-1-gpiccoli@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260805205026.1699568-1-gpiccoli@igalia.com>

On Wed, Aug 05, 2026 at 05:49:04PM -0300, Guilherme G. Piccoli wrote:
> Users of panic_print / panic_sys_info are usually aware of the potentially
> huge amount of information displayed with such options - their goal by
> using them is indeed to dump more information during panic!
> 
> What might come unnoticed at first is the impact that the console_verbose()
> call on panic path has, specially in cases that users rely on pstore as
> a means to collect the panic logs. Recent experience shows that dumping
> all tasks in an ARM64 system (with qcom_geni tty driver) gets a 2 minute

Indeed, the all task call stack dumping is quite chatty :) which is
usually my last resort for debugging.

> delay on panic time due to writing such information to console. But in
> that case, pstore was used, so there was no need for console printing,
> and suppressing that reduced the full time to less than 1 second.
> 
> The option "printk.console_no_auto_verbose" aims exactly at this use
> case: avoid automatically increasing the loglevel during panic path.
> So, let's officially document this to avoid users wasting their time
> either on long panic printing or debugging the panic delays.
> 
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>

Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>

Thanks,
Feng

> ---
>  Documentation/admin-guide/kernel-parameters.txt | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f22..04c0ef2cf910 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4862,6 +4862,9 @@ Kernel parameters
>  			so there are risks of losing older messages in the log.
>  			Use this option carefully, maybe worth to setup a
>  			bigger log buffer with "log_buf_len" along with this.
> +			Also consider using "printk.console_no_auto_verbose=Y"
> +			if using this along with pstore, to avoid extra delays
> +			due to increased console verbosity during panic.
>  
>  	panic_sys_info= A comma separated list of extra information to be dumped
>                          on panic.
> @@ -4877,6 +4880,8 @@ Kernel parameters
>                          blocked_tasks:  print only tasks in uninterruptible (blocked) state
>  
>                          This is a human readable alternative to the 'panic_print' option.
> +                        Please be aware of the caveats using this option, check
> +                        the panic_print information above regarding delays.
>  
>  	panic_console_replay
>  			When panic happens, replay all kernel messages on
> -- 
> 2.50.1

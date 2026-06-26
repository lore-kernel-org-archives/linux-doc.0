Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CCF3E557E;
	Fri, 26 Jun 2026 10:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468005; cv=none; b=UxHEvamj0rJgmwsJmjvELBK6UgYIyb7EP+E9+fv4ok6THNK2jfSO6c3xagtuLCsTJ/+m5q8585z8C/NLG+sONwdb9sIIEYyJXoU8RCOuT4kSfuYgndGxW53x1O/q2D+0FFcIkpl8yzWG/1P1ee4+3yA2LY/zLItLDq80hvYsgV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468005; c=relaxed/simple;
	bh=Ichldg/Lgx+4aCZTDsVDefQT/wWCCs3ULSYGGGegNgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMis6K7//fjeUzuxHBXtclB50b12JDrLscIkEGChWLTGJlJR1DIpn5xukCeXVNOCIH+wRxhXk4yydeF8lG0ul6dxOVBdtHk5o5i/3PKteaTQHq+tVssAd7X+AHIYm44RhAh5KK5UMjiwDidZEY2R7vTv1NAo3FRpSMthKV3Jzwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=TYk1QtiE; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="TYk1QtiE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=co7OmSTR03cVkZPaaYPKAU3TQA+wn5DyKc6v4gArSjs=; b=TYk1QtiEhCi/7ksiQbtmivfC6W
	yy92lm/+NX9XdwOZS/Fp3Zx/nxK2SFrayR8WP1NvC7KHE9xbTuy82XKz91FIDS/0ThOXNCpR9Njky
	4DGPjX0zbvaRek5JGMBArYDVo2KvvWTZIToDD45qlXSLZ5pm+7XfLbiFOm1d+FqxRjcnC4vrcfuXk
	u7dhHWgCiG3PkM8IfGBstxVN3ZrgQj0dT/E2azT6xvVPZ29g0usQK7fBmIBXzHL00bgtixzHC/yuN
	2nWeKqyWuZLrVJVaCsOAz3a4pORFanCuL6WVRhU1NmgynSCI7Y6sz+bj25NMm9IUCDshlEzfrO/ok
	rDETyNbA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3Lg-0000000BcDF-26Eo;
	Fri, 26 Jun 2026 09:59:49 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 36FA2301574; Fri, 26 Jun 2026 11:59:48 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:59:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, yury.norov@gmail.com,
	kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
	tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
	seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
	srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
	vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
	pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 07/24] sched/fair: Select preferred CPU at wakeup when
 possible
Message-ID: <20260626095948.GO1181229@noisy.programming.kicks-ass.net>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-8-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625124648.802832-8-sshegde@linux.ibm.com>

On Thu, Jun 25, 2026 at 06:16:31PM +0530, Shrikanth Hegde wrote:
> Update available_idle_cpu to consider preferred CPUs. This takes care of
> lot of decisions at wakeup to use only preferred CPUs. There is no need to
> put those explicit checks everywhere.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  kernel/sched/sched.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 5d009c2529b2..148fe6145f1a 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1434,6 +1434,9 @@ static inline bool available_idle_cpu(int cpu)
>  	if (!idle_rq(cpu_rq(cpu)))
>  		return 0;
>  
> +	if (!cpu_preferred(cpu))
> +		return 0;
> +
>  	if (vcpu_is_preempted(cpu))
>  		return 0;
>  

This one might hurt, it is a whole extra cacheline in otherwise already
sensitive (wakeup) paths.


Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A42C3BB66C;
	Fri, 26 Jun 2026 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782468053; cv=none; b=TNsnLJX6ugdbdr88L5LbiaQ3slnryyzCDyVzZGy3KIJ+hEW2O464XYWQf8IriT1WUipoFyNB8T7nrcpcWnTDL0ZIvoWnSY1bb7anN8aiFV968DOsepnFAMVX88s6cWnqi2ePpnaLSyegSCFRrz4sIMrM/As1u4HLGSjwGA3qMzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782468053; c=relaxed/simple;
	bh=lSA4IIL06QeIFea61gU3OCEgVK01bOJuoTnTYa3U0kY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SDRc8BZiKADbkZ9RwD0Ezhd3zpV769D4w3KsowHC8uwCnLrxJyH40/3VMpn7lvxjxlna3bDU+hv4aMIlg6kPTYxowVTng4eh9LEYBH6L1GZFy5B2CE1JCVMq9Xtj6rqDIQ0xlZJttSOn76NqxYEmyHn5fKTf7JstWnGyZnd2kJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iJB4g4GS; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iJB4g4GS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=doiJhSpxAd46t07guaMw8G0vRsyMjK4ExK5bNiBXZw0=; b=iJB4g4GSp4VBvmuq41lyY84wv0
	NoyHLwcg+BKBt+IPREIONGoIT/Q5yBQdY9S1AlIVfmLQ/UTvRydIoU20dbjs8Ne97iZI3nvQKLJnI
	7iqIel+YwSOXywWpFDSMMoXO9NKAq1oaDhFAcUCVqqqKSp48LBeFmeLr2hRwTUc44dWrW4kpKIF+z
	+VF/noUmCnWmqOXadO435E/gZH+oOk2oYkpaKPuOaTRhrkSRCaTpfsjJlXWQJIbaqVtUy/fT8JF0n
	jV4LePEaKeOjefA6pzY6F619DYbQbzatKayDcEoyQb3qsvVx9vzABdwlZQ4MYEl9MCVOEHgRNd0Gz
	H8g6xivw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3MZ-0000000BcNM-0KXF;
	Fri, 26 Jun 2026 10:00:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 238E2300339; Fri, 26 Jun 2026 12:00:43 +0200 (CEST)
Date: Fri, 26 Jun 2026 12:00:43 +0200
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
Subject: Re: [PATCH v5 09/24] sched/fair: Pull the load on preferred CPU
Message-ID: <20260626100043.GP1181229@noisy.programming.kicks-ass.net>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-10-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625124648.802832-10-sshegde@linux.ibm.com>

On Thu, Jun 25, 2026 at 06:16:33PM +0530, Shrikanth Hegde wrote:

> @@ -14375,6 +14379,10 @@ static int sched_balance_newidle(struct rq *this_rq, struct rq_flags *rf)
>  	if (!cpu_active(this_cpu))
>  		return 0;
>  
> +	/* Do not pull to a !preferred CPU just to push it out next */
> +	if (!cpu_preferred(this_cpu))
> +		return 0;
> +
>  	/*
>  	 * This is OK, because current is on_cpu, which avoids it being picked
>  	 * for load-balance and preemption/IRQs are still disabled avoiding

Why not just replace the cpu_active() check above?

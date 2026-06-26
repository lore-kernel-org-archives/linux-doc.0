Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91C33E8C70;
	Fri, 26 Jun 2026 09:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466108; cv=none; b=oaIAjr8ln+/v3TXfzyA5OYPbttVZ/dwKGCIo4cyi2YVxaGOGgzaKIWviGgL/KqcOzWuLLg76NKviHfqpn2V9mo+bG7d56QX0QMw4qhFGJXog5oFu8FN4PrOOGZ0ukyb2KCZJMACh8nHs/Kh1LVh1smds7BoFgWLSLowN5Ec6xl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466108; c=relaxed/simple;
	bh=co/O9zH/3HCuaBvQPzQhKVDhsZlKxGnkh+dGrVIWTjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mt7leR2wk2y/b/oxim/V8dff6WzOBvsiCyDkOL+dxPxoHtUbIgI6Fl96zNfBr99ZKd+wY0Q4NasYngTF5ADx7+AXrSx8eBbfNHlHEfGlFYnZdvYOM8cpYGYV9wikBTFeBOteJTGMFQwpQSNbAhSWGiI2im5/oj9pPuGrx+0E0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nm3p8Clh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nm3p8Clh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JtpPtzl/3db5DvMog9C4lhXRmHQaSLV/aY4gzRkyqyQ=; b=nm3p8ClhstKodsxbB9ptZ//cL5
	rLc8c3knV4V4CFJfb8dINjMkR9a3gcLfHfZa5oid8V7nASc+Hii1fdkSZLaG7itlaCjhJt5pdL1Mz
	Zihv0fH1egCCogGMXDoOx+He5lB3YtvYiyp13zAHDtMTH9e1dhGvvBMah6JrnK377bFxWd+ZtTFTX
	VTuSwlpep7otLVgzo/ceA+e7agWnqJwHQH+ZrARZr8+ivIDMc31e8V1xtR8r/fPCjw9K586Fhk3PU
	AVU778wu0/6hV8t9Qqjk2at8wKOC+3kct/cWo9irjcBp8utk3VbjDr4lRbw4aVWPLG3WWks+MCsHS
	SFwliYCw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2r1-0000000BZg1-0Zbf;
	Fri, 26 Jun 2026 09:28:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5FCD9300BDE; Fri, 26 Jun 2026 11:28:06 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:28:06 +0200
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
Subject: Re: [PATCH v5 13/24] virt/steal_monitor: Add documentation
Message-ID: <20260626092806.GL1181229@noisy.programming.kicks-ass.net>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-14-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625124648.802832-14-sshegde@linux.ibm.com>

On Thu, Jun 25, 2026 at 06:16:37PM +0530, Shrikanth Hegde wrote:

> +Core idea:
> +==========
> +steal time is an indication available today in Guest which shows contention
> +for underlying physical CPU. Use it as a hint in the guest to fold the
> +workload to a reduced set of vCPUs. When there is contention, steal time
> +will show up in all the guests. When each guest honors the hint and folds
> +the workload to a smaller set of vCPUs(Preferred CPUs), it reduces the
> +contention and thereby reduces vCPU preemption.
> +This is achieved without any cross-guest communication.
> +
> +Steal monitor driver effectively does:
> +
> +1. Periodically computes steal time across the system.
> +
> +2. If steal time is greater than high threshold, reduce the number of
> +   preferred CPUs by 1 core. Ensure at least one core is left always.
> +   This avoids running into extreme cases.
> +
> +3. If steal time is lower or equal to low threshold, increase the
> +   number of preferred CPUs by 1 core. If preferred is same as active,
> +   nothing to be done.
> +
> +4. Ensure preferred CPUs is always subset of active CPUs.
> +   On feature disable it is same as active CPUs.


So this is very much a co-operative scheme. Perhaps add a few words to
describe the effect of a non cooperative guest. IIRC the result is not
worse than the status quo. That is, if one (or more) guests refuse to
co-operate it will not make things worse, it will just not result in
improvements, right?

Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07F5392C2C;
	Fri, 26 Jun 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466926; cv=none; b=t18+yhEjFM0D+uX8AF06UXTd86QbYizqnKQM5+uhzI56hbdzCWFSao7CftWmYYcwinSQnbxI3oH1Pi96WmJdo40JgCkSPDmiiaMcXomz0T8xTs8toasY3+WicVDCktclZGcz0ncNG7iZ+Q7Znx2cPJTOwM+BvOa7JzvaskJdoCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466926; c=relaxed/simple;
	bh=0NLb8XfDlB6QB+sv6lmaTA4QCIt5pVjC+CwvqTvI0ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOmKRTnQny83R9VoAmoLzTe07utHJcKNJMAXLs5W1roeQAgwOOj3LmCvjvBSaPmgBm8XND5cFIYpVR0+/s5NHWdgc93kF+sYEHjSEl8i6L48EelBcEnk287ttHSttX0hVWPChUulGCyOqti3e+OeiQ4M9QjN+89oeGk9umHFYLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SUQIZ0Ce; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SUQIZ0Ce"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BJLFz/+CdS0AinJQL0bJYRZ4ui269+yCx4kP8xx6ZcY=; b=SUQIZ0CeAOFhR+dKd7zU+n3cdo
	OF7XecpGU8NWfxYbp6lJGov5j43n/m0sd9Ui42IkKMU2NmZQ5Klaz/XxmOSe45rf6pL+++8C/Y8+t
	cr4GSf4N/eIUi/yX1zjdQB/aH99AI3jO5AFyy/bXNWLaGnhqoFW/jTPQFRpIx3hiPHATFr7GgvNji
	oH3cnhnBJ2Cv4vWG+VOhHtbfeeoWrI0ft0haH4z9MJlEPl8LHtJVKwCaIL4BxUQPgdhn6aGqRFzOr
	/CUegOrfzxT6TQjjFeJ96PFpnx+PLBHWPcRz9h8sRpwvzJb7hznThAK6tcYaudoncEqUs204s/Sbu
	mLWT+Ifw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd34L-0000000BapN-3HOt;
	Fri, 26 Jun 2026 09:41:54 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B5942300339; Fri, 26 Jun 2026 11:41:53 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:41:53 +0200
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
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
Message-ID: <20260626094153.GD2568396@noisy.programming.kicks-ass.net>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626093901.GN1181229@noisy.programming.kicks-ass.net>

On Fri, Jun 26, 2026 at 11:39:01AM +0200, Peter Zijlstra wrote:
> On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
> 
> > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > index 80211900f373..5a643d608ea6 100644
> > --- a/include/linux/cpumask.h
> > +++ b/include/linux/cpumask.h
> > @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
> >  extern struct cpumask __cpu_present_mask;
> >  extern struct cpumask __cpu_active_mask;
> >  extern struct cpumask __cpu_dying_mask;
> > +
> > +#ifdef CONFIG_PREFERRED_CPU
> > +extern struct cpumask __cpu_preferred_mask;
> > +#else
> > +#define __cpu_preferred_mask __cpu_active_mask
> > +#endif
> 
> This is cure, but does it not result in set_cpu_preferred() changing
s/cure/cute/
> active mask, and it that not somewhat unexpected behaviour?
s/it/is/

Typing hard, clearly. Also hitting 30C before noon :-(



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75122D77F5;
	Fri,  3 Apr 2026 12:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217977; cv=none; b=uqKkWSwHI0c0hId/kROrl0dDxzsAinRcBGy0fi17XoeN1r5gthym35ssUV4M+0YhXrJZUvhTFVqlur4DgNklsqxIGfqMAcBcBP4biBPUIUejGbqTfP1ci1GZXAQ4a9RajQxhK0DrozhXxA/yIKx5uBUeyiGfoTkg7ZiVLiHqwPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217977; c=relaxed/simple;
	bh=qxSJnJJLUdWKHQdmjZ36W6yEr8sXivN1DVtEHDmnnVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKzjyk6WA6VOmMTaHIu9cdTz5l7LoYM0qlbsZ4jA/PGYEsyug9XpLtB7AaWM2lSmur+BaZ3LRdnOVG8t1pYXqEkVF+VuazlsDWJOpXJcPuIUOKfdMehaRc1fOPqlPkyM+v8hzR/8rGuPW+HemV3niV1qET4jH8Z5KLDOiSnUP0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/pMGymr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/pMGymr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16347C4CEF7;
	Fri,  3 Apr 2026 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217977;
	bh=qxSJnJJLUdWKHQdmjZ36W6yEr8sXivN1DVtEHDmnnVY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f/pMGymrltb9LffZhsf7CTs17lBt6iBEcl59rJAnLbMMEwxfcOuh6ohSR7QgvFpiw
	 Du52SEcnqfePt/tdoSKdtJ0nlNdyYjjJH2d6kJ/VB45WYSUZkbFN6mDLj/Y/dLcMmW
	 VhF7g6qZ13k8NMO1G4IwKVN49WL712x+MGpJ6eD1SCSDkAfHTGOf64/UjKXO+Yu7Ez
	 MTOARqYM8Pm3xie2EC7mvrGLcWgaB8k6zNIaHBsyTRGJKKrVnJXn5Xo5bIt4WSFHW0
	 uIKEoEOi+rfyjQm8l4ReM8Ke4/RK9CP/yG/3VPkET66A2GSs4+nzvg4SRe7w3pfZnb
	 gGXxJNJsxivmQ==
Date: Fri, 3 Apr 2026 14:06:14 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v3] doc: Add CPU Isolation documentation
Message-ID: <ac-tNrdNMKQ2uh0k@localhost.localdomain>
References: <20260402094749.18879-1-frederic@kernel.org>
 <20260402110122.2gkDqQ7Q@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402110122.2gkDqQ7Q@linutronix.de>

Le Thu, Apr 02, 2026 at 01:01:22PM +0200, Sebastian Andrzej Siewior a écrit :
> On 2026-04-02 11:47:49 [+0200], Frederic Weisbecker wrote:
> > nohz_full was introduced in v3.10 in 2013, which means this
> > documentation is overdue for 13 years.
> > 
> > Fortunately Paul wrote a part of the needed documentation a while ago,
> > especially concerning nohz_full in Documentation/timers/no_hz.rst and
> > also about per-CPU kthreads in
> > Documentation/admin-guide/kernel-per-CPU-kthreads.rst
> > 
> > Introduce a new page that gives an overview of CPU isolation in general.
> > 
> > Acked-by: Waiman Long <longman@redhat.com>
> > Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> > Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> 
> This documents also isolcpus= boot argument. The only thing that this
> argument does and runtime can not do is the managed_irq sub argument.
> This sub argument is a story of its own and it is of quite limited for
> me taste.
> 
> However, isolcpus= is marked as deprecated. I suggest to remove the
> "Deprecated - use cpusets instead" note as the static configuration is
> fine if the system is partitioned once never changed within its
> lifetime.
> Are there any objections and if so why needs this boot argument be
> removed (assuming we have a runtime equivalent knob for managed_irq)?

No objections! Thanks.

> 
> Sebastian

-- 
Frederic Weisbecker
SUSE Labs

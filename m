Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861928150F;
	Wed,  1 Apr 2026 15:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775058483; cv=none; b=nxbSNOPVxPGv1aAawuCtWfSf38EM2O+3vE36OUUgNt0ktovjGVQCjdekpaBaHUfGxf/JuOqmtLPCl2szlJQIrwclc/J/QQ0nHVkfbDZaabBszv025A3m/HN1PZozrynLXDSVQnRQznQXLkDj1+h+pRvSSJun5SLzB7qYMrszdbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775058483; c=relaxed/simple;
	bh=e4r736UNyDpMj6ROkltHCxYndivZ7YQ7wT2b1JiXGlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e6MeDVR6m9h7V0UUA2xn9qx2+tWP6NK1MnpAtIbIaG8YYO09mBkkcRfdiTjVGrBlTIjm0EKhayy2j5WZTZLgMUE6yNMRXndHH7HrJCI/PvLxVXcsVX3ldmtKQMgt1W6aDOcUy0NJ9WH56nnigJo0NhUc6HxO/WpkokFY4kO189A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u79Kf6cK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u79Kf6cK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EEAC4CEF7;
	Wed,  1 Apr 2026 15:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775058482;
	bh=e4r736UNyDpMj6ROkltHCxYndivZ7YQ7wT2b1JiXGlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u79Kf6cK9E31WfN2mHQ09aYbaLHso2rTvOVvOsmKVsR070kcsoH9NLQiOhharQojs
	 e6Q23ecaNRYeJ0c/90Ng6gketGyyukHpnyBUjOxT4pkuCqnENdYggnYriMhgAr6UbR
	 xJbhfYOa4UTSkP8AKP3tQEkmBzDKF01BFidQdHClH6DUHS6Mhoiim8Wgez9gHG87Qy
	 NgvwvTh8KmxbDeVn0C98rrf3T/WYnIDE4zaN9pj4TFmD6OpKRHljsFfkn+9gAT/p9w
	 8oLUv2QJTRzSP2m34uhYMrm29YFuLIK8iOAmx9tskCC/DG4ImvjSiVqqFS3k38qLfH
	 1QC4SwZI5uOnQ==
Date: Wed, 1 Apr 2026 17:47:59 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Waiman Long <longman@redhat.com>
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
	Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
Message-ID: <ac0-LzTrOJIECLoH@localhost.localdomain>
References: <20260326140055.41555-1-frederic@kernel.org>
 <90a6512f-5b6b-4781-87f3-4580ac426c37@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <90a6512f-5b6b-4781-87f3-4580ac426c37@redhat.com>

Le Thu, Mar 26, 2026 at 03:17:48PM -0400, Waiman Long a écrit :
> On 3/26/26 10:00 AM, Frederic Weisbecker wrote:
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
> > Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> > ---
> > v2:
> >     - Fix links and code blocks (Bagas and Sebastian)
> >     - Isolation is not only about userspace, rephrase accordingly (Valentin)
> >     - Paste BIOS issues suggestion from Valentin
> >     - Include the whole rtla suite (Valentin)
> >     - Rephrase a few details (Waiman)
> >     - Talk about RCU induced overhead rather than slower RCU (Sebastian)
> > 
> >   Documentation/admin-guide/cpu-isolation.rst | 357 ++++++++++++++++++++
> >   Documentation/admin-guide/index.rst         |   1 +
> >   2 files changed, 358 insertions(+)
> >   create mode 100644 Documentation/admin-guide/cpu-isolation.rst
> > 
> > diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> > new file mode 100644
> > index 000000000000..886dec79b056
> > --- /dev/null
> > +++ b/Documentation/admin-guide/cpu-isolation.rst
> > @@ -0,0 +1,357 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=============
> > +CPU Isolation
> > +=============
> > +
> > +Introduction
> > +============
> > +
> > +"CPU Isolation" means leaving a CPU exclusive to a given workload
> > +without any undesired code interference from the kernel.
> > +
> > +Those interferences, commonly pointed out as "noise", can be triggered
> > +by asynchronous events (interrupts, timers, scheduler preemption by
> > +workqueues and kthreads, ...) or synchronous events (syscalls and page
> > +faults).
> > +
> > +Such noise usually goes unnoticed. After all synchronous events are a
> > +component of the requested kernel service. And asynchronous events are
> > +either sufficiently well distributed by the scheduler when executed
> > +as tasks or reasonably fast when executed as interrupt. The timer
> > +interrupt can even execute 1024 times per seconds without a significant
> > +and measurable impact most of the time.
> > +
> > +However some rare and extreme workloads can be quite sensitive to
> > +those kinds of noise. This is the case, for example, with high
> > +bandwidth network processing that can't afford losing a single packet
> > +or very low latency network processing. Typically those usecases
> > +involve DPDK, bypassing the kernel networking stack and performing
> > +direct access to the networking device from userscace.
> 
> As also pointed by by Sashiko, there is a typo "userscace" -> "userspace".
> There are also typos reported in
> 
> https://sashiko.dev/#/patchset/20260326140055.41555-1-frederic%40kernel.org

Thanks!

What do you think about these lines of Sashiko's review:

"""
Does this script violate the cgroup v2 "no internal process" constraint?
By enabling the cpuset controller on the test directory's
cgroup.subtree_control file, the cgroup cannot also contain processes.
"""

That is confusing me...

> 
> > +
> > +In order to run a CPU without or with limited kernel noise, the
> > +related housekeeping work needs to be either shutdown, migrated or
> > +offloaded.
> > +
> > +Housekeeping
> > +============
> > +
> > +In the CPU isolation terminology, housekeeping is the work, often
> > +asynchronous, that the kernel needs to process in order to maintain
> > +all its services. It matches the noises and disturbances enumerated
> > +above except when at least one CPU is isolated. Then housekeeping may
> > +make use of further coping mechanisms if CPU-tied work must be
> > +offloaded.
> > +
> > +Housekeeping CPUs are the non-isolated CPUs where the kernel noise
> > +is moved away from isolated CPUs.
> > +
> > +The isolation can be implemented in several ways depending on the
> > +nature of the noise:
> > +
> > +- Unbound work, where "unbound" means not tied to any CPU, can be
> > +  simply migrated away from isolated CPUs to housekeeping CPUs.
> > +  This is the case of unbound workqueues, kthreads and timers.
> > +
> > +- Bound work, where "bound" means tied to a specific CPU, usually
> > +  can't be moved away as-is by nature. Either:
> > +
> > +	- The work must switch to a locked implementation. Eg: This is
> > +	  the case of RCU with CONFIG_RCU_NOCB_CPU.
> > +
> > +	- The related feature must be shutdown and considered
> > +	  incompatible with isolated CPUs. Eg: Lockup watchdog,
> > +	  unreliable clocksources, etc...
> > +
> > +	- An elaborated and heavyweight coping mechanism stands as a
> > +	  replacement. Eg: the timer tick is shutdown on nohz_full but
> 
> "shutdown" should be 2 words as "shutdown" isn't a verb. Should we add CPU
> after "nohz_full" to make it more clear?

Right.

> 
> 
> > +	  with the constraint of running a single task on the CPU. A
> > +	  significant cost penalty is added on kernel entry/exit and
> > +	  a residual 1Hz scheduler tick is offloaded to housekeeping
> > +	  CPUs.
> > +
> > --- a/Documentation/admin-guide/index.rst
> > +++ b/Documentation/admin-guide/index.rst
> > @@ -94,6 +94,7 @@ likely to be of interest on almost any system.
> >      cgroup-v2
> >      cgroup-v1/index
> > +   cpu-isolation
> >      cpu-load
> >      mm/index
> >      module-signing
> 
> Other than the minor nits mentioned above,
> 
> Acked-by: Waiman Long <longman@redhat.com>

Thanks!

> 

-- 
Frederic Weisbecker
SUSE Labs

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B643C9EF7;
	Thu,  2 Apr 2026 22:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775168494; cv=none; b=YdhNuaack6BK3hw3IplpoWrlLADV/ZWvI2XFWSMXp3yJs6sZ8+sVtglu2uqyykSukuHPtO5uBubrKYYwHsZeJu4nUUMjuOyjo+gjksKxiQMRCq8rirhpbWfPoOlZQlsnPpW8wWJAeqgSQ51zl59zWgXtyHsEKtiSvxMKpNmxz58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775168494; c=relaxed/simple;
	bh=/O6pOQOawGm3QVkocb+e1/Jt2yj3E+m0Xn+m5n3VUf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KIYY4dz7gnz10Fcpq7dVMedS8LRFbLpyhMASXoMwNoT2zB3Ur2pKZerbwM0d39y19wmP1/FZvRtVhJBLyQGLH4gOosKQo5g5yP8kpHczl83AbMJx59xusiSuLabC+7z3lz43Wt7ph06LJ/N+7xTqPMGRny6MW70q5NNJrjNCV6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sQ1Bj2Vk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sQ1Bj2Vk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26643C116C6;
	Thu,  2 Apr 2026 22:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775168494;
	bh=/O6pOQOawGm3QVkocb+e1/Jt2yj3E+m0Xn+m5n3VUf4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=sQ1Bj2VkRiaXH6x1vKuH4nw8FAvJFdaJx4wkMpcMLE/bQlpi8UZaBwJ7TrJqy42aB
	 l1XODfCvXYvcxB19oH1ENT/VnNaTuT3crFs/6HVRQWVc5OoM2kf7O4DnBa/yfmdP9c
	 eGqZxzqI4MVKKRcATt3MeV2QDK5ww5ViUjuT/tOLxzqmF17XnT3bIDZSMRYCRGm/Ea
	 QJAOZ+JPff/ZK5HI5LZAJqF43+T+Jfofh45vkFBqXt7LB9K8USXPFMgPhGtda2P9jT
	 7Yg9EoCVUXt5NCggCErQYB9kAJZcjYcOkSaY+SNm7p2az35abzJILC7wC4VTsriJtc
	 RNcmGTSr5D2JQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id ABA54CE049F; Thu,  2 Apr 2026 15:21:33 -0700 (PDT)
Date: Thu, 2 Apr 2026 15:21:33 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v3] doc: Add CPU Isolation documentation
Message-ID: <ddae3a2a-cac1-49c2-95c0-cd75abb81165@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20260402094749.18879-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402094749.18879-1-frederic@kernel.org>

On Thu, Apr 02, 2026 at 11:47:49AM +0200, Frederic Weisbecker wrote:
> nohz_full was introduced in v3.10 in 2013, which means this
> documentation is overdue for 13 years.
> 
> Fortunately Paul wrote a part of the needed documentation a while ago,
> especially concerning nohz_full in Documentation/timers/no_hz.rst and
> also about per-CPU kthreads in
> Documentation/admin-guide/kernel-per-CPU-kthreads.rst
> 
> Introduce a new page that gives an overview of CPU isolation in general.
> 
> Acked-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

> ---
> v3: Apply suggestions from Randy, Steven, Valentin, Waiman and also Sashiko!
> 
>  Documentation/admin-guide/cpu-isolation.rst | 357 ++++++++++++++++++++
>  Documentation/admin-guide/index.rst         |   1 +
>  2 files changed, 358 insertions(+)
>  create mode 100644 Documentation/admin-guide/cpu-isolation.rst
> 
> diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> new file mode 100644
> index 000000000000..8c65d03fd28c
> --- /dev/null
> +++ b/Documentation/admin-guide/cpu-isolation.rst
> @@ -0,0 +1,357 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=============
> +CPU Isolation
> +=============
> +
> +Introduction
> +============
> +
> +"CPU Isolation" means leaving a CPU exclusive to a given workload
> +without any undesired code interference from the kernel.
> +
> +Those interferences, commonly pointed out as "noise", can be triggered
> +by asynchronous events (interrupts, timers, scheduler preemption by
> +workqueues and kthreads, ...) or synchronous events (syscalls and page
> +faults).
> +
> +Such noise usually goes unnoticed. After all, synchronous events are a
> +component of the requested kernel service. And asynchronous events are
> +either sufficiently well-distributed by the scheduler when executed
> +as tasks or reasonably fast when executed as interrupt. The timer
> +interrupt can even execute 1024 times per seconds without a significant
> +and measurable impact most of the time.
> +
> +However some rare and extreme workloads can be quite sensitive to
> +those kinds of noise. This is the case, for example, with high
> +bandwidth network processing that can't afford losing a single packet
> +or very low latency network processing. Typically those use cases
> +involve DPDK, bypassing the kernel networking stack and performing
> +direct access to the networking device from userspace.
> +
> +In order to run a CPU without or with limited kernel noise, the
> +related housekeeping work needs to be either shut down, migrated or
> +offloaded.
> +
> +Housekeeping
> +============
> +
> +In the CPU isolation terminology, housekeeping is the work, often
> +asynchronous, that the kernel needs to process in order to maintain
> +all its services. It matches the noises and disturbances enumerated
> +above except when at least one CPU is isolated. Then housekeeping may
> +make use of further coping mechanisms if CPU-tied work must be
> +offloaded.
> +
> +Housekeeping CPUs are the non-isolated CPUs where the kernel noise
> +is moved away from isolated CPUs.
> +
> +The isolation can be implemented in several ways depending on the
> +nature of the noise:
> +
> +- Unbound work, where "unbound" means not tied to any CPU, can be
> +  simply migrated away from isolated CPUs to housekeeping CPUs.
> +  This is the case of unbound workqueues, kthreads and timers.
> +
> +- Bound work, where "bound" means tied to a specific CPU, usually
> +  can't be moved away as-is by nature. Either:
> +
> +	- The work must switch to a locked implementation. E.g.:
> +	  This is the case of RCU with CONFIG_RCU_NOCB_CPU.
> +
> +	- The related feature must be shut down and considered
> +	  incompatible with isolated CPUs. E.g.: Lockup watchdog,
> +	  unreliable clocksources, etc...
> +
> +	- An elaborate and heavyweight coping mechanism stands as a
> +	  replacement. E.g.: the timer tick is shut down on nohz_full
> +	  CPUs but with the constraint of running a single task on
> +	  them. A significant cost penalty is added on kernel entry/exit
> +	  and a residual 1Hz scheduler tick is offloaded to housekeeping
> +	  CPUs.
> +
> +In any case, housekeeping work has to be handled, which is why there
> +must be at least one housekeeping CPU in the system, preferably more
> +if the machine runs a lot of CPUs. For example one per node on NUMA
> +systems.
> +
> +Also CPU isolation often means a tradeoff between noise-free isolated
> +CPUs and added overhead on housekeeping CPUs, sometimes even on
> +isolated CPUs entering the kernel.
> +
> +Isolation features
> +==================
> +
> +Different levels of isolation can be configured in the kernel, each of
> +which has its own drawbacks and tradeoffs.
> +
> +Scheduler domain isolation
> +--------------------------
> +
> +This feature isolates a CPU from the scheduler topology. As a result,
> +the target isn't part of the load balancing. Tasks won't migrate
> +either from or to it unless affined explicitly.
> +
> +As a side effect the CPU is also isolated from unbound workqueues and
> +unbound kthreads.
> +
> +Requirements
> +~~~~~~~~~~~~
> +
> +- CONFIG_CPUSETS=y for the cpusets-based interface
> +
> +Tradeoffs
> +~~~~~~~~~
> +
> +By nature, the system load is overall less distributed since some CPUs
> +are extracted from the global load balancing.
> +
> +Interfaces
> +~~~~~~~~~~
> +
> +- Documentation/admin-guide/cgroup-v2.rst cpuset isolated partitions are recommended
> +  because they are tunable at runtime.
> +
> +- The 'isolcpus=' kernel boot parameter with the 'domain' flag is a
> +  less flexible alternative that doesn't allow for runtime
> +  reconfiguration.
> +
> +IRQs isolation
> +--------------
> +
> +Isolate the IRQs whenever possible, so that they don't fire on the
> +target CPUs.
> +
> +Interfaces
> +~~~~~~~~~~
> +
> +- The file /proc/irq/\*/smp_affinity as explained in detail in
> +  Documentation/core-api/irq/irq-affinity.rst page.
> +
> +- The "irqaffinity=" kernel boot parameter for a default setting.
> +
> +- The "managed_irq" flag in the "isolcpus=" kernel boot parameter
> +  tries a best effort affinity override for managed IRQs.
> +
> +Full Dynticks (aka nohz_full)
> +-----------------------------
> +
> +Full dynticks extends the dynticks idle mode, which stops the tick when
> +the CPU is idle, to CPUs running a single task in userspace. That is,
> +the timer tick is stopped if the environment allows it.
> +
> +Global timer callbacks are also isolated from the nohz_full CPUs.
> +
> +Requirements
> +~~~~~~~~~~~~
> +
> +- CONFIG_NO_HZ_FULL=y
> +
> +Constraints
> +~~~~~~~~~~~
> +
> +- The isolated CPUs must run a single task only. Multitask requires
> +  the tick to maintain preemption. This is usually fine since the
> +  workload usually can't stand the latency of random context switches.
> +
> +- No call to the kernel from isolated CPUs, at the risk of triggering
> +  random noise.
> +
> +- No use of POSIX CPU timers on isolated CPUs.
> +
> +- Architecture must have a stable and reliable clocksource (no
> +  unreliable TSC that requires the watchdog).
> +
> +
> +Tradeoffs
> +~~~~~~~~~
> +
> +In terms of cost, this is the most invasive isolation feature. It is
> +assumed to be used when the workload spends most of its time in
> +userspace and doesn't rely on the kernel except for preparatory
> +work because:
> +
> +- RCU adds more overhead due to the locked, offloaded and threaded
> +  callbacks processing (the same that would be obtained with "rcu_nocbs"
> +  boot parameter).
> +
> +- Kernel entry/exit through syscalls, exceptions and IRQs are more
> +  costly due to fully ordered RmW operations that maintain userspace
> +  as RCU extended quiescent state. Also the CPU time is accounted on
> +  kernel boundaries instead of periodically from the tick.
> +
> +- Housekeeping CPUs must run a 1Hz residual remote scheduler tick
> +  on behalf of the isolated CPUs.
> +
> +Checklist
> +=========
> +
> +You have set up each of the above isolation features but you still
> +observe jitters that trash your workload? Make sure to check a few
> +elements before proceeding.
> +
> +Some of these checklist items are similar to those of real-time
> +workloads:
> +
> +- Use mlock() to prevent your pages from being swapped away. Page
> +  faults are usually not compatible with jitter sensitive workloads.
> +
> +- Avoid SMT to prevent your hardware thread from being "preempted"
> +  by another one.
> +
> +- CPU frequency changes may induce subtle sorts of jitter in a
> +  workload. Cpufreq should be used and tuned with caution.
> +
> +- Deep C-states may result in latency issues upon wake-up. If this
> +  happens to be a problem, C-states can be limited via kernel boot
> +  parameters such as processor.max_cstate or intel_idle.max_cstate.
> +  More finegrained tunings are described in
> +  Documentation/admin-guide/pm/cpuidle.rst page
> +
> +- Your system may be subject to firmware-originating interrupts - x86 has
> +  System Management Interrupts (SMIs) for example. Check your system BIOS
> +  to disable such interference, and with some luck your vendor will have
> +  a BIOS tuning guidance for low-latency operations.
> +
> +
> +Full isolation example
> +======================
> +
> +In this example, the system has 8 CPUs and the 8th is to be fully
> +isolated. Since CPUs start from 0, the 8th CPU is CPU 7.
> +
> +Kernel parameters
> +-----------------
> +
> +Set the following kernel boot parameters to disable SMT and setup tick
> +and IRQ isolation:
> +
> +- Full dynticks: nohz_full=7
> +
> +- IRQs isolation: irqaffinity=0-6
> +
> +- Managed IRQs isolation: isolcpus=managed_irq,7
> +
> +- Prevent SMT: nosmt
> +
> +The full command line is then:
> +
> +  nohz_full=7 irqaffinity=0-6 isolcpus=managed_irq,7 nosmt
> +
> +CPUSET configuration (cgroup v2)
> +--------------------------------
> +
> +Assuming cgroup v2 is mounted to /sys/fs/cgroup, the following script
> +isolates CPU 7 from scheduler domains.
> +
> +::
> +
> +  cd /sys/fs/cgroup
> +  # Activate the cpuset subsystem
> +  echo +cpuset > cgroup.subtree_control
> +  # Create partition to be isolated
> +  mkdir test
> +  cd test
> +  echo +cpuset > cgroup.subtree_control
> +  # Isolate CPU 7
> +  echo 7 > cpuset.cpus
> +  echo "isolated" > cpuset.cpus.partition
> +
> +The userspace workload
> +----------------------
> +
> +Fake a pure userspace workload, the program below runs a dummy
> +userspace loop on the isolated CPU 7.
> +
> +::
> +
> +  #include <stdio.h>
> +  #include <fcntl.h>
> +  #include <unistd.h>
> +  #include <errno.h>
> +  int main(void)
> +  {
> +      // Move the current task to the isolated cpuset (bind to CPU 7)
> +      int fd = open("/sys/fs/cgroup/test/cgroup.procs", O_WRONLY);
> +      if (fd < 0) {
> +          perror("Can't open cpuset file...\n");
> +          return 0;
> +      }
> +
> +      write(fd, "0\n", 2);
> +      close(fd);
> +
> +      // Run an endless dummy loop until the launcher kills us
> +      while (1)
> +      ;
> +
> +      return 0;
> +  }
> +
> +Build it and save for later step:
> +
> +::
> +
> +  # gcc user_loop.c -o user_loop
> +
> +The launcher
> +------------
> +
> +The below launcher runs the above program for 10 seconds and traces
> +the noise resulting from preempting tasks and IRQs.
> +
> +::
> +
> +  TRACING=/sys/kernel/tracing/
> +  # Make sure tracing is off for now
> +  echo 0 > $TRACING/tracing_on
> +  # Flush previous traces
> +  echo > $TRACING/trace
> +  # Record disturbance from other tasks
> +  echo 1 > $TRACING/events/sched/sched_switch/enable
> +  # Record disturbance from interrupts
> +  echo 1 > $TRACING/events/irq_vectors/enable
> +  # Now we can start tracing
> +  echo 1 > $TRACING/tracing_on
> +  # Run the dummy user_loop for 10 seconds on CPU 7
> +  ./user_loop &
> +  USER_LOOP_PID=$!
> +  sleep 10
> +  kill $USER_LOOP_PID
> +  # Disable tracing and save traces from CPU 7 in a file
> +  echo 0 > $TRACING/tracing_on
> +  cat $TRACING/per_cpu/cpu7/trace > trace.7
> +
> +If no specific problem arose, the output of trace.7 should look like
> +the following:
> +
> +::
> +
> +  <idle>-0 [007] d..2. 1980.976624: sched_switch: prev_comm=swapper/7 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=user_loop next_pid=1553 next_prio=120
> +  user_loop-1553 [007] d.h.. 1990.946593: reschedule_entry: vector=253
> +  user_loop-1553 [007] d.h.. 1990.946593: reschedule_exit: vector=253
> +
> +That is, no specific noise triggered between the first trace and the
> +second during 10 seconds when user_loop was running.
> +
> +Debugging
> +=========
> +
> +Of course things are never so easy, especially on this matter.
> +Chances are that actual noise will be observed in the aforementioned
> +trace.7 file.
> +
> +The best way to investigate further is to enable finer grained
> +tracepoints such as those of subsystems producing asynchronous
> +events: workqueue, timer, irq_vector, etc... It also can be
> +interesting to enable the tick_stop event to diagnose why the tick is
> +retained when that happens.
> +
> +Some tools may also be useful for higher level analysis:
> +
> +- Documentation/tools/rtla/rtla.rst provides a suite of tools to analyze
> +  latency and noise in the system. For example Documentation/tools/rtla/rtla-osnoise.rst
> +  runs a kernel tracer that analyzes and output a summary of the noises.
> +
> +- dynticks-testing does something similar to rtla-osnoise but in userspace. It is available
> +  at git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git
> diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
> index b734f8a2a2c4..cd28dfe91b06 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -94,6 +94,7 @@ likely to be of interest on almost any system.
>  
>     cgroup-v2
>     cgroup-v1/index
> +   cpu-isolation
>     cpu-load
>     mm/index
>     module-signing
> -- 
> 2.53.0
> 

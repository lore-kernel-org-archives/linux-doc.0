Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AB3AEF5E;
	Thu, 26 Mar 2026 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774561361; cv=none; b=Bp+pwwlf2VQVtRuClVQ3C9PwoUT8UX2C4Pw83NvtOHCI5WMEefRriccAXaDLIL1u8kgZ4wWNnDUm+QQ3w/9NH0LEaw2aE6TJdqJ8Ar+i0+qsWROp/+KxwRFKWbD1w9ZlBcjji0klfMipCKnRoyoMbYJPIQ1DPF72WIuu984V20s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774561361; c=relaxed/simple;
	bh=0AfbFrFxPZRrsU5UHFdo0ECWk9YlJJEoO4UneAK30rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NLtFL5yC7t1VrPAqRIWbddQCPHn9VH+Wekw8X0S/YHNI9k6RjWhNxpUSLUQbWfjJxCeyjT7N8i+yMQe8kyTjxx14IM1RQtBa5Y2wkSxSofhcFc/cuMJTzz6uZGqaZ/F9QpJt+lFG2RV+9S227HZj1jr79PxGNjNZpjAYhQh3Olw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=E3DXaDDF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="E3DXaDDF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=qKFEgKYWws0QoL7VTyeBquY+mEoAKKp0w2OB8GZRLjE=; b=E3DXaDDFj+1AGafL3avFxJK49u
	ZHLBa0EsRw6rjG8yQ5aGxvXooPG/s4HZ1BkB7nW7gNf+6AKrdLemmHa9rk/UkF3V/3Ur2qksMCVB2
	N7DpnFhMmrw+vxNZsBTtS0JwxzV3ja3mN4YqcTRlvYhbwQRmjfi8A1JlrZXtUKb/gEQzbQZqWna0T
	YAKtzOHUmvzeLHU53d1ULdvn/u6slOStvJY0NVYAEKyExPJwdoUCPqQv3anNBEgsuJYCO6vSPwESM
	/nsUPeo16gBJhgqOEtIhfDkjI5JYDSC7vZomJKK5DoZTGHOy+zPP6YoN+W8QyPAuM2jKafwB3FAfl
	SsyCIasg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5sTJ-00000006Gbt-2EsC;
	Thu, 26 Mar 2026 21:42:33 +0000
Message-ID: <6d113021-6208-4dcc-a209-a2317d680e3f@infradead.org>
Date: Thu, 26 Mar 2026 14:42:32 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
To: Frederic Weisbecker <frederic@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Gabriele Monaco <gmonaco@redhat.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marcelo Tosatti <mtosatti@redhat.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Michal Hocko <mhocko@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Vlastimil Babka <vbabka@suse.cz>,
 Waiman Long <longman@redhat.com>, linux-doc@vger.kernel.org,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Bagas Sanjaya <bagasdotme@gmail.com>
References: <20260326140055.41555-1-frederic@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260326140055.41555-1-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

(Just some small comments -- take them or not.)

On 3/26/26 7:00 AM, Frederic Weisbecker wrote:
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
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
> v2:
>    - Fix links and code blocks (Bagas and Sebastian)
>    - Isolation is not only about userspace, rephrase accordingly (Valentin)
>    - Paste BIOS issues suggestion from Valentin
>    - Include the whole rtla suite (Valentin)
>    - Rephrase a few details (Waiman)
>    - Talk about RCU induced overhead rather than slower RCU (Sebastian)
> 
>  Documentation/admin-guide/cpu-isolation.rst | 357 ++++++++++++++++++++
>  Documentation/admin-guide/index.rst         |   1 +
>  2 files changed, 358 insertions(+)
>  create mode 100644 Documentation/admin-guide/cpu-isolation.rst
> 
> diff --git a/Documentation/admin-guide/cpu-isolation.rst b/Documentation/admin-guide/cpu-isolation.rst
> new file mode 100644
> index 000000000000..886dec79b056
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

nit:                                            "noise,"

> +by asynchronous events (interrupts, timers, scheduler preemption by
> +workqueues and kthreads, ...) or synchronous events (syscalls and page
> +faults).
> +
> +Such noise usually goes unnoticed. After all synchronous events are a

maybe (I would):                      After all,

> +component of the requested kernel service. And asynchronous events are
> +either sufficiently well distributed by the scheduler when executed

                       well-distributed

> +as tasks or reasonably fast when executed as interrupt. The timer
> +interrupt can even execute 1024 times per seconds without a significant
> +and measurable impact most of the time.
> +
> +However some rare and extreme workloads can be quite sensitive to
> +those kinds of noise. This is the case, for example, with high
> +bandwidth network processing that can't afford losing a single packet
> +or very low latency network processing. Typically those usecases

                                                           use cases

> +involve DPDK, bypassing the kernel networking stack and performing
> +direct access to the networking device from userscace.

                                               ^^^^^^^^^ (already noted)

> +
> +In order to run a CPU without or with limited kernel noise, the
> +related housekeeping work needs to be either shutdown, migrated or
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
> +	- The work must switch to a locked implementation. Eg: This is

	                                                   E.g.: This is

> +	  the case of RCU with CONFIG_RCU_NOCB_CPU.
> +
> +	- The related feature must be shutdown and considered
> +	  incompatible with isolated CPUs. Eg: Lockup watchdog,

	                                   E.g.:

> +	  unreliable clocksources, etc...
> +
> +	- An elaborated and heavyweight coping mechanism stands as a

	     elaborate

> +	  replacement. Eg: the timer tick is shutdown on nohz_full but

	               E.g.:

> +	  with the constraint of running a single task on the CPU. A
> +	  significant cost penalty is added on kernel entry/exit and
> +	  a residual 1Hz scheduler tick is offloaded to housekeeping
> +	  CPUs.
> +
> +In any case, housekeeping work has to be handled, which is why there
> +must be at least one housekeeping CPU in the system, preferrably more

                                                        preferably

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
> +which having their own drawbacks and tradeoffs.

         has its own

> +
> +Scheduler domain isolation
> +--------------------------
> +
> +This feature isolates a CPU from the scheduler topology. As a result,
> +the target isn't part of the load balancing. Tasks won't migrate
> +neither from nor to it unless affined explicitly.

   either from or to it

> +
> +As a side effect the CPU is also isolated from unbound workqueues and
> +unbound kthreads.
> +
> +Requirements
> +~~~~~~~~~~~~
> +
> +- CONFIG_CPUSETS=y for the cpusets based interface

                              cpusets-based

> +
> +Tradeoffs
> +~~~~~~~~~
> +
> +By nature, the system load is overall less distributed since some CPUs
> +are extracted from the global load balancing.
> +
> +Interface
> +~~~~~~~~~

   Interfaces
   ~~~~~~~~~~

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
> +Interface
> +~~~~~~~~~
   Interfaces
   ~~~~~~~~~~

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
> +Full dynticks extends the dynticks idle mode, which stop the tick when

                                                       stops

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
> +- No use of posix CPU timers on isolated CPUs.

               POSIX

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
> +  callbacks processing (the same that would be obtained with "rcu_nocb"
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
> +Some of these checklist items are similar to those of real time

I prefer "real-time" but it seems that "real time," "realtime," or
"real-time" is OK in the kernel source tree.

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
> +- Prevent from SMT: nosmt

     Prevent SMT: nosmt

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
> +Fake a pure userspace workload, the below program runs a dummy

                         workload: the program below


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


(No bot or AI help :)
-- 
~Randy


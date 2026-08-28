Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607993E2AB6
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787913538; cv=pass; b=gicMfNW3Xx4cSDNj0Kwx4A/ql447fDK390Xmoub/v2G+lcQguXsiWr8GgRnT8hqNGi809h50PJn/08BznerjQ3P6xndKBzhHRRUhzXZbmzYUjbi0JMUoX3QjCJWqD3xpemGX0b6ImcxrtrRJafP9dNOwutz5+FG13tglkZe8M1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787913538; c=relaxed/simple;
	bh=ZHNPvgcNvjnqAN+85MR7Lyl0b9dDkq4jyaQvoDGUW/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f2izxWIQ8FeUmHeuIG9fmXwsYYEw+5uZBCU1J3lkKI4JqJhVBXO8klyT+WLfwXMXFqlyAK/V0bhdZvK7Pf3qvWRgxllch8N/lSLOBUiU56epv77cKaVU3b/iw9iw237gy89+R1O1bi43UIF9bL6rN5JSnRZiVjZhOK/a9ikIIKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJmOdyEZ; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJmOdyEZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a5ebf75d62so1320314a12.1
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 03:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787913534; cv=none;
        d=google.com; s=arc-20260327;
        b=jbzeSFoq0zbHXBZTbNCaNB/dV3yW1uT3DQGula4kOFXK3HX8whpR4Mq4VyCPRnOV3+
         l0DKlfwJvSRybrEYoVs++b8XtcuxPRni6OmBlUMcd0KDshHAhiZiXGP7mbGoMM9SQ8HB
         bpYMMmx/QV9YICefznpDRW0Hzv4f4f6yJMpDm2I67nyt2KUhnlEQlYnv2IhIwa6FNGZb
         rK6vttJWSFYvsDwghOM1tncUJS1qj+O2fZfb3GjTNCwtLQT4etkTYYQngovsqyEp11tA
         7OTcN957n1ZYhfYK3i00N/RA+mJ2DZ1APce/MPK0is7d12wH1cPVmkUYTe0TXObyvLEw
         6pMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aSNPU2ja2u72rxkCHAjApXZObqZ59bvTYvEEgnVj1lM=;
        fh=EP7s3kODV++Z2aqnvBv30OP2nnxsFvwgkdBYZwQgJRw=;
        b=Ffm2oFPNbdGR5+/yeJ7BMxdHxkwzB/BqUanwfieguiYi/X3hggzK50X/5md5Kju3gE
         godfEIkdVdH8HJCadFa77sC7s6qf+YVhzjt/x4Yv4txza2jTcmCJ8gGWGgJ1NLVmBZBW
         opSdwK+Gm4SBuSCsrUFCvcm0Vp4nO9HoqLdksArrQpTG3TDs3vfV9F8QyC5Rtqg2AMEK
         7mmzrpQZjQvfGimrAdzg1rL2TNIyyd7UCYdml3QQyG6G1RISW/yqpdBmUaxqpFWsbAM6
         bm0079yLNWftW8ow0bKuCIjpRdkwZDWHG7Hy+ct6qcPNrVQFHsnrke30nOxwVPCa8eaT
         oUTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787913534; x=1788518334; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aSNPU2ja2u72rxkCHAjApXZObqZ59bvTYvEEgnVj1lM=;
        b=kJmOdyEZaXA62Lv6mltBiQdUxLfn1lE2wByTh8LgBIJqDG+A8ZIH1FxJN5sg8bjgaM
         kf++mAoAn1i6ds9MrbkC3y1qGvPr8k2pBAYm9la7HiG1H7T10y3VTaQRNFqllJrIiX6/
         Haf3I9ZGnvrEjnawG7tyHnsDNx20eozvFwPJAV4Qqv1obgw+zT3ej6sQ/2x4wpJHhrLQ
         YnflqSEaePz7TSyvlJ+r028VVDmpAJ4ipkMde8BLXTfSBdNLKPMwdqjHPonX3Mbu38B7
         vCjH2jmlyP081XhDGbqvMdG1/EJBnWFw/lOrxfakIYERfqQiyUF22w1gaocndQVmn2Cw
         s3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787913534; x=1788518334;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aSNPU2ja2u72rxkCHAjApXZObqZ59bvTYvEEgnVj1lM=;
        b=kIWJmRCWvnClsvh/naykADvQQjS+hoZdx4np9yOorUVOt7WJmife8ge5eYpCGXO3J2
         6acfOfm7NuEPgZqcJT3glZkBUjjRYA2sozNJOmgdgvhq/DmnZASbrc5n6YOhQA4ktXVn
         HQLo8kLdB4ESl5VhIkH+MI+h8yyHRrHY8H8199WITVB02Ibqm4q5PLq3bc1DeqzK36kf
         7oJB4mp5koOIn0JBgA4udNKMEqDpffP82Vs23ASA2oOEcK26X7Wwj+cyeIcFObqfwz0f
         Cehkaa5gnWFvPPmyBmeZABc8Y10eSY6zP8ViE9T93blrGlxB/mVefznJRyRyqRKt97iH
         MmEg==
X-Forwarded-Encrypted: i=1; AHgh+RpYAnI7KfbEN0XRByMxkZI/pCY2Erd0SF/AP1wES/r2A7D9kqls2D/H4gg0GDNL+r/lldBvFXXn6Jo=@vger.kernel.org
X-Gm-Message-State: AFuF++nZqGSZtePYi1OG0bAwVlUdewOz32NWeO1TMq3PrD38208eUPfy
	mh12FPcwOvnx3kjCeK+LngAJXm0hiRCxGhJm2d991bJg05IjvdjvA8kQfw3txdfh1s4VwOMnjyV
	I1fKrbbJmm7chAy5C7Y/fa2wjtbQXoN0D+vsb51Jfhg==
X-Gm-Gg: AR+sD11sTGfDIvauESdxM6sTsQlZ7Ckl9DpQ48uKh8eF9rbnbUeeQ/4lyoHOulGMO1F
	pbhI6oPbaVOne2WVjUXBxDyAaNejs9kef4o2nc7yAOHxHCtdLNG/vW6ZRd1fzk3m/V8jkblQzz+
	wUDSRt11vYr78N7wao0hjIpIywRM4SFLtc/9G2WdMNZAfW2m/zCgofVA2nIKwoOiGmCL1NIpWiA
	BvcO/EI4/ZGrZ8qH2QvEXptk+BuRWbpH2emrREudxgsCzBlp3AFb+yPHArOAAlhUxqvv6y+22C4
	FzQWIRp6BCVXkk1cqvt3El445WDdJSjmftcvgV9DJ/pQ0175LxvTp2WaoK1vBSJLUMe9jg3PbIw
	l3A==
X-Received: by 2002:a05:6402:52d0:b0:697:eb97:a4ed with SMTP id
 4fb4d7f45d1cf-6a60c5ab04dmr3838875a12.7.1787913534540; Fri, 28 Aug 2026
 03:38:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825103855.721013-1-sshegde@linux.ibm.com>
 <20260825103855.721013-6-sshegde@linux.ibm.com> <8262d2f9-9f2f-4821-8497-991d7c8448a3@arm.com>
In-Reply-To: <8262d2f9-9f2f-4821-8497-991d7c8448a3@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 28 Aug 2026 12:38:41 +0200
X-Gm-Features: AcwNN1VRBsyVPI-p9UXzNMfWcn7VLGiTkR-yO7pmCmFXXcSrsOwzowtaWwf6M1s
Message-ID: <CAKfTPtB27-eFXGG9GcXdm4=YLZy6-vQMAQqoCbHa5xZxA3YBpw@mail.gmail.com>
Subject: Re: [PATCH v11 05/12] sched/core: Try to use a preferred CPU in is_cpu_allowed
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org, mingo@kernel.org, 
	peterz@infradead.org, juri.lelli@redhat.com, yury.norov@gmail.com, 
	kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net, 
	meted@linux.ibm.com, ynorov@nvidia.com, tglx@kernel.org, 
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com, 
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org, 
	maddy@linux.ibm.com, srikar@linux.ibm.com, hdanton@sina.com, 
	chleroy@kernel.org, vineeth@bitbyteword.org, frederic@kernel.org, 
	arighi@nvidia.com, pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org, 
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org, 
	rdunlap@infradead.org, kernellwp@gmail.com, linux-doc@vger.kernel.org, 
	jgross@suse.com, virtualization@lists.linux.dev, sunlightlinux@gmail.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 28 Aug 2026 at 09:51, Dietmar Eggemann <dietmar.eggemann@arm.com> wrote:
>
> On 25.08.26 12:38, Shrikanth Hegde wrote:
> > When possible, try to choose a preferred CPU.
> >
> > This is essential to maintain user affinities when preferred
> > CPUs change. A task pinned on a non-preferred CPU should continue
> > to run there, since this is a non-user triggered event.
> >
> > If a CPU is non-preferred and the task can run on other CPUs which are
> > currently preferred, then choose a preferred CPU instead.
> > This is decided by checking if cpus_ptr and cpu_preferred_mask
> > intersect or not. If yes, then the task has other preferred CPUs.
> >
> > The push task mechanism uses a stopper thread which calls
> > select_fallback_rq() and uses this mechanism to pick a preferred CPU.
> >
> > This takes care of the wakeup path for FAIR tasks too.
> > is_cpu_allowed() is called to ensure wakeups happen on preferred CPUs.
> > With that, additional checks in available_idle_cpu() are not necessary.
> >
> > Ignore the preferred CPU state if a task's affinity is changing and
> > its new mask no longer includes the CPU it is currently running on.
> > This ensures migration_cpu_stop() does not abort, preventing the task
> > from being stranded outside its allowed affinity.
> >
> > Account for tasks with architecture-specific CPU masks
> > (e.g., 32-bit tasks on arm64). For such tasks, explicitly check against
> > the arch-allowed CPUs to determine if any of the preferred CPUs are
> > actually valid.
> >
> > For the majority of cases, this would still keep select_fallback_rq()
> > as O(N). cpumask_intersects(), which is O(N), is called only if
> > !cpu_preferred. The task running there is expected to move out.
> > Subsequently, it should run on a preferred CPU. This becomes O(N**2)
> > only for tasks pinned solely to non-preferred CPUs. That is a rare case.
> >
> > Overhead is minimal when the CPU is preferred.
> >
> > Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> > ---
> >  kernel/sched/core.c | 41 +++++++++++++++++++++++++++++++++++++++--
> >  1 file changed, 39 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index a45f7c308329..f71317fe281d 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -2494,6 +2494,35 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
> >       return rq->nr_pinned;
> >  }
> >
> > +static inline bool task_can_sched_on_preferred(int cpu, struct task_struct *p)
> > +{
> > +     const struct cpumask *valid_mask;
> > +     int i;
> > +
> > +     if (cpu_preferred(cpu))
> > +             return false;
> > +
> > +     /* Only FAIR tasks honor preferred CPU state */
> > +     if (unlikely(p->sched_class != &fair_sched_class))
> > +             return false;
> > +
> > +     /* Ignore preferred state if task affinity is changing */
> > +     if (unlikely(!cpumask_test_cpu(task_cpu(p), p->cpus_ptr)))
> > +             return false;
> > +
> > +     valid_mask = task_cpu_possible_mask(p);
> > +     if (likely(valid_mask == cpu_possible_mask))
> > +             return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> > +
> > +     /* Tasks with arch-specific CPU masks. e.g. 32-bit tasks on arm64. */
> > +     for_each_cpu_and(i, p->cpus_ptr, cpu_preferred_mask) {
> > +             if (cpumask_test_cpu(i, valid_mask))
> > +                     return true;
> > +     }
>
> Looking more into this, there might be a window in 64-32-bit execve()
> for 32bit EL0 tasks on Arm64 (w/ allow_mismatched_32bit_el0 command line
> option).
>
> The time before arch_setup_new_exec() calls
> force_compatible_cpus_allowed_ptr() to restrict CPU affinity for those
> tasks.
>
> Let me run more test on this ...
>
> Why not simply:
>
> - return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> + return cpumask_first_and_and(p->cpus_ptr, cpu_preferred_mask,
> +                              task_cpu_possible_mask(p)) < nr_cpu_ids;

+1
This is the best way to check that there is a valid cpu

>
> IMHO, you want to know whether there is at least one CPU that belongs to
> all three CPU masks?
>
> [...]

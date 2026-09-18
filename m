Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9936A4F3ED4
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 15:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747114; cv=pass; b=ZCCZhUAjNG/YESPvWtwBfI0lKX6Bm/P4+/zZ5fGi9zsRMDhaBFLxDbdkyXEXBW+pDgrYMleK/5Sp72+gLN1rtQl/xTRxC9/XqrkwVFyXFCxtnRiJdOIgmxCbpXxEfSKgVoHpg4KSaAFxIz8V4jxjv+a7CqBlkijKyboTPl8tLAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747114; c=relaxed/simple;
	bh=AzF/BNQ7RIcuXs/Va13t9WQbgmTvpVxCmCAovciey/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f0H7pQ3YxkAsOGP1wahbKfiIcjgvxdO3P6dKtfRnJ2uc1wbn5IR2ZHuocmO+VThpFKLrle62DbiullCF7M6R7LsGUiibSUQOTdf3RiWZ3zoYfZQEbCmvHrq0e/Gq95yD7uxqdyERSOX/uKuGaHloGZalDKhwI/0vdUOGw7sMUAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DMWQZyk9; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DMWQZyk9"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f0b20so149538466b.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 08:58:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789747110; cv=none;
        d=google.com; s=arc-20260327;
        b=qAOLRsY6h8kQaCN7ACIpKtgvvWqXSkJs6l/i3RWtFSPShk+NqUDchoZjZYAqAQodri
         bu1Q2AsgDiVrznWcR/9irk7IE7rAGBOoNSqfTWPmk5zg1k4sjS5312fg7EhJntJJnTV4
         F7sRPSbNRAW6y4pm7DbStI60nhkOGMkioYVj8qGN9jc6phIHw7YU1/QcSfLYW9eoNnq9
         wJJ1BQQYGzoHRVQDi2fCRGM2BvtSzSNYBDhAdkqJEOT82uXSHzH9JIeCRHuU71usuNM6
         NYyIlKGl1eQDmVmaIObovLQE/0gh6/JUWusHB2ddvG3hlSg1BDxqJVH2GhXWT2UjX1kE
         ASSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y42X9+7LyLcCK+Af5Fjqf9gTdz/QZrAInZikBHre8gg=;
        fh=lZas8ZKjeVJM69yVzK4sMBbfresdr/3db/U6JPo2xmY=;
        b=jcwAFAGznDfir5p6BekfcBG4vN/LrfimtBpf4frKixETdLm8+OMwnsvwlhuqPiYmw6
         i0/Oka97qyfhcCdC8BCNDnp4AlcVwdzCrR8GuG5uLAIAX1Rs7Oh/dcHS85LjvyHF0yTz
         +OZwHknTPP6JdXzWn/YB5tKv8bFrn8+J/gv5zSrRCeCrjTcMRf+kDDNXiIBdXIyE6rtd
         1+OsJ469oE3OVhJcEdzneX7BeA98CnNkO/j7XX6V23VdS3EVQyvEXaDkxDTjmfFhQ/sf
         fpXHPPM080KuXVL4csnKDijin06Y4du7Dihhf/c1ujkg1+xf4RRsnzL/OhPEAuKz9oXK
         fl2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789747110; x=1790351910; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y42X9+7LyLcCK+Af5Fjqf9gTdz/QZrAInZikBHre8gg=;
        b=DMWQZyk9Z6tKjJ261i3bD03dczqhgOV6AIWihMQOcB8Xfbjl7OwrPZfsc1KNgsDFeX
         t+afJfH5kyXuqvYZWLB30aWkxIjYlLEKAbgG/eV8U7APHJWv1sIWoCU2T5FPVTHlpdZ5
         99QXaZPQZONER30xShQOIcGOUZNvpGXHzaBSdC42tqqSNOR2nYOBsAFG4FMlkURYN7Pb
         NJYf/d7K8FtBu/i4R0a4hrlxIbNd+xrbVJJS4y50AarN+XdMpEKrZbZrRroGPQQnJqBm
         F8MLgSXNyhpZ9FbwJOJfObBRriezri0TjAHOAoxmj/teWYCX1L7RZoGZZP7K0Z9n/rzj
         lx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747110; x=1790351910;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y42X9+7LyLcCK+Af5Fjqf9gTdz/QZrAInZikBHre8gg=;
        b=Mq4sX6be65YIjaUuJd+xvUsW68d8GtQof6qV3EZ/rx7jFNB008Xvmi5Gqnhwyajqkn
         w9HPh1GI2burQNZBS67IMerKQNaO9jbvw4UeaHz6M6co3IpIU9LurQWm1Nn8SkVUCaw+
         nx/0A7Y2Ns7+rT6+DRcP566ouH42GumaxfSwWlAv7x6puMT89+RzpRpm7Y+iSRJesMB1
         J0febgnTaRBZp4nzRa0h6cWThiIN1AdOmUU2L9LSyRj8OQTmuL/RTCZb3dsjYid0IYHp
         c4Y71kkpdhYrrygkM2+scdOCQD3GeL0khmMgGPvBrPJOR896ng3lchDVOPjKQaYS1nwW
         NbzQ==
X-Forwarded-Encrypted: i=1; AKwUvBy0hfjbN7/9fzrBx3lzDTBIKL3cb+NjqS0Bju1wVVXZlF3NClqutbMz1Wr1jDKGFExZWMJxuVjqU50=@vger.kernel.org
X-Gm-Message-State: AFuF++nxucTs4si+IbNoigx3m6ozCCnox3by2eOfV0JWRHwUmTRkwCCq
	/V37XKo6MnSjHcToZOXwivQIy37G/NIFWdTl3VARM0ckW+i27WZ/WRJl3iqzJs4TrvuNnKhBbUZ
	mDIzHFiRgluy4DCwiWCXsMmJYOuIvQ5570VMLbAmIzw==
X-Gm-Gg: AYBFou23yjtygCmdT4dfJiRbTkVzo/iuPf9MlXtQGCTA3WmjwtG02woDsRhcRj4Yg79
	hFjlzuz3+JCC2tuDZw0ON2R9O9LIvg/PWWCXsFSQ3UAZ0N+6Al3Ag9EbhyEdIb3xLMdm09TEe+0
	MTRTNOOgDSdsu+AGEDTqzw63BNgEYDxXxgFYNiwbqXWyZVoOIj74aePzzL8WsPWUsm+KPkScJTn
	b9hXCyXXVyX93Yk6iFLmyFWlzP6unkFDxpxs4UNzx6f3zll2658NfXXVKnrVUJJgaRVqaDsIJuJ
	rlU+zSftJNM2ye4xztsjUVNHODLF/z/wvhKfbVh6i1tywxkket+qawe+Z75JeexHNRCNb6aTgvx
	9I28hFfYZ2lMoSFoECCBd+vU=
X-Received: by 2002:a17:907:9813:b0:c29:f5d8:9c71 with SMTP id
 a640c23a62f3a-c2a15812476mr292824166b.32.1789747109774; Fri, 18 Sep 2026
 08:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917140707.3807229-1-arighi@nvidia.com> <20260917140707.3807229-2-arighi@nvidia.com>
In-Reply-To: <20260917140707.3807229-2-arighi@nvidia.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Sep 2026 17:58:17 +0200
X-Gm-Features: AcwNN1Vt0IfO0HK__f28wKscCa1yq1Ie4GWMEpburg_ccDIGb0uvVB_j-52mBJg
Message-ID: <CAKfTPtDBcN5=++vTmcqkCqxdemeDFFVu54vy0Omh2Ui7LNwLTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] sched/fair: Honor asymmetric SMT priority in idle selection
To: Andrea Righi <arighi@nvidia.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Will Deacon <will@kernel.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Christian Loehle <christian.loehle@arm.com>, Srikar Dronamraju <srikar@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, 
	Breno Leitao <leitao@debian.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lee Trager <ltrager@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 16:08, Andrea Righi <arighi@nvidia.com> wrote:
>
> POWER7 uses SD_ASYM_PACKING at the shared-capacity SMT level to order
> hardware threads, and NVIDIA Olympus benefits from the same policy. Idle
> CPU selection does not consult that order, so a task can wake on an
> arbitrary sibling and remain there until load balancing corrects the
> placement. On these systems, that initial choice can prevent the core
> from entering its preferred lower-thread resource mode and cause a large
> and persistent performance loss.
>
> When idle selection finds an available CPU in an SMT core, choose the
> highest-priority available sibling. On SMT2 Olympus this only changes
> selection on fully idle cores. A partially idle core has only one
> available CPU. On wider SMT systems such as POWER7, it also fills
> available siblings in priority order while the core is partially busy.
>
> Apply the preference to idle-core and idle-CPU scans,
> asymmetric-capacity scans, target, previous, recently-used CPU fast
> paths and the slow path. Inspect the lowest scheduling domain directly,
> but require both CPUs to share its span because isolcpus can split
> hardware siblings across scheduling domains.
>
> Keep physical-core capacity selection independent from SMT sibling
> ordering. SD_ASYM_CPUCAPACITY first selects among cores with different
> maximum capacities, then SD_ASYM_PACKING selects the preferred available
> sibling inside the chosen core, whose siblings continue to share equal
> capacity.
>
> Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
> Reviewed-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
> Signed-off-by: Andrea Righi <arighi@nvidia.com>

Reviewed-by: Vincent Guittot <vincent.guittot@linaro.org>


> ---
>  kernel/sched/fair.c | 85 ++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 68 insertions(+), 17 deletions(-)
>
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 4d0b94465d19e..8e6dc3a657cca 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8598,6 +8598,35 @@ static inline bool test_idle_cores(int cpu)
>         return false;
>  }
>
> +/*
> + * Redirect a CPU to a higher-priority available sibling in its SMT domain,
> + * subject to task affinity.
> + */
> +static inline int select_idle_smt_cpu(struct task_struct *p, int cpu)
> +{
> +       struct sched_domain *sd;
> +       int best = cpu;
> +       int sibling;
> +
> +       if (!sched_smt_active())
> +               return cpu;
> +
> +       sd = rcu_dereference_all(cpu_rq(cpu)->sd);
> +       if (!sd || !(sd->flags & SD_SHARE_CPUCAPACITY) ||
> +           !(sd->flags & SD_ASYM_PACKING))
> +               return cpu;
> +
> +       for_each_cpu_and(sibling, sched_domain_span(sd), p->cpus_ptr) {
> +               if (sibling == best || !choose_idle_cpu(sibling, p))
> +                       continue;
> +
> +               if (sched_asym_prefer(sibling, best))
> +                       best = sibling;
> +       }
> +
> +       return best;
> +}
> +
>  /*
>   * Scans the local SMT mask to see if the entire core is idle, and records this
>   * information in sd_balance_shared->has_idle_cores.
> @@ -8982,7 +9011,7 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>
>         if (choose_idle_cpu(target, p) &&
>             asym_fits_cpu(task_util, util_min, util_max, target))
> -               return target;
> +               goto select_smt_priority;
>
>         /*
>          * If the previous CPU is cache affine and idle, don't be stupid:
> @@ -8992,8 +9021,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             asym_fits_cpu(task_util, util_min, util_max, prev)) {
>
>                 if (!static_branch_unlikely(&sched_cluster_active) ||
> -                   cpus_share_resources(prev, target))
> -                       return prev;
> +                   cpus_share_resources(prev, target)) {
> +                       target = prev;
> +                       goto select_smt_priority;
> +               }
>
>                 prev_aff = prev;
>         }
> @@ -9011,7 +9042,8 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             prev == smp_processor_id() &&
>             this_rq()->nr_running <= 1 &&
>             asym_fits_cpu(task_util, util_min, util_max, prev)) {
> -               return prev;
> +               target = prev;
> +               goto select_smt_priority;
>         }
>
>         /* Check a recently used CPU as a potential idle candidate: */
> @@ -9025,8 +9057,10 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>             asym_fits_cpu(task_util, util_min, util_max, recent_used_cpu)) {
>
>                 if (!static_branch_unlikely(&sched_cluster_active) ||
> -                   cpus_share_resources(recent_used_cpu, target))
> -                       return recent_used_cpu;
> +                   cpus_share_resources(recent_used_cpu, target)) {
> +                       target = recent_used_cpu;
> +                       goto select_smt_priority;
> +               }
>
>         } else {
>                 recent_used_cpu = -1;
> @@ -9048,7 +9082,11 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>                  */
>                 if (sd) {
>                         i = select_idle_capacity(p, sd, target);
> -                       return ((unsigned)i < nr_cpumask_bits) ? i : target;
> +                       if ((unsigned int)i < nr_cpumask_bits) {
> +                               target = i;
> +                               goto select_smt_priority;
> +                       }
> +                       return target;
>                 }
>         }
>
> @@ -9061,14 +9099,18 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>
>                 if (!has_idle_core && cpus_share_cache(prev, target)) {
>                         i = select_idle_smt(p, sd, prev);
> -                       if ((unsigned int)i < nr_cpumask_bits)
> -                               return i;
> +                       if ((unsigned int)i < nr_cpumask_bits) {
> +                               target = i;
> +                               goto select_smt_priority;
> +                       }
>                 }
>         }
>
>         i = select_idle_cpu(p, sd, has_idle_core, target);
> -       if ((unsigned)i < nr_cpumask_bits)
> -               return i;
> +       if ((unsigned int)i < nr_cpumask_bits) {
> +               target = i;
> +               goto select_smt_priority;
> +       }
>
>         /*
>          * For cluster machines which have lower sharing cache like L2 or
> @@ -9076,12 +9118,19 @@ static int select_idle_sibling(struct task_struct *p, int prev, int target)
>          * first. But prev_cpu or recent_used_cpu may also be a good candidate,
>          * use them if possible when no idle CPU found in select_idle_cpu().
>          */
> -       if ((unsigned int)prev_aff < nr_cpumask_bits)
> -               return prev_aff;
> -       if ((unsigned int)recent_used_cpu < nr_cpumask_bits)
> -               return recent_used_cpu;
> +       if ((unsigned int)prev_aff < nr_cpumask_bits) {
> +               target = prev_aff;
> +               goto select_smt_priority;
> +       }
> +       if ((unsigned int)recent_used_cpu < nr_cpumask_bits) {
> +               target = recent_used_cpu;
> +               goto select_smt_priority;
> +       }
>
>         return target;
> +
> +select_smt_priority:
> +       return select_idle_smt_cpu(p, target);
>  }
>
>  /**
> @@ -9758,8 +9807,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>         }
>
>         /* Slow path */
> -       if (unlikely(sd))
> -               return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +       if (unlikely(sd)) {
> +               new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +               return select_idle_smt_cpu(p, new_cpu);
> +       }
>
>         /* Fast path */
>         if (wake_flags & WF_TTWU)
> --
> 2.55.0
>

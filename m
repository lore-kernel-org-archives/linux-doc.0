Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7D3C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 26 Oct 2022 12:23:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232903AbiJZMXK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Oct 2022 08:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232748AbiJZMXJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 26 Oct 2022 08:23:09 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4F1908F240;
        Wed, 26 Oct 2022 05:23:08 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F022623A;
        Wed, 26 Oct 2022 05:23:13 -0700 (PDT)
Received: from [10.57.2.24] (unknown [10.57.2.24])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B3563F71A;
        Wed, 26 Oct 2022 05:23:05 -0700 (PDT)
Message-ID: <62a7cafc-13d6-5341-0128-420db7d5da8c@arm.com>
Date:   Wed, 26 Oct 2022 13:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] sched/topology: Remove EM_MAX_COMPLEXITY limit
Content-Language: en-US
To:     Pierre Gondois <pierre.gondois@arm.com>
Cc:     Ionela.Voinescu@arm.com, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220812101620.627838-1-pierre.gondois@arm.com>
From:   Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20220812101620.627838-1-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Pierre,

On 8/12/22 11:16, Pierre Gondois wrote:
> From: Pierre Gondois <Pierre.Gondois@arm.com>
> 
> The Energy Aware Scheduler (EAS) estimates the energy consumption
> of placing a task on different CPUs. The goal is to minimize this
> energy consumption. Estimating the energy of different task placements
> is increasingly complex with the size of the platform. To avoid having
> a slow wake-up path, EAS is only enabled if this complexity is low
> enough.
> 
> The current complexity limit was set in:
> commit b68a4c0dba3b1 ("sched/topology: Disable EAS on inappropriate
> platforms").
> base on the first implementation of EAS, which was re-computing
> the power of the whole platform for each task placement scenario, cf:
> commit 390031e4c309 ("sched/fair: Introduce an energy estimation helper
> function").
> but the complexity of EAS was reduced in:
> commit eb92692b2544d ("sched/fair: Speed-up energy-aware wake-ups")
> and find_energy_efficient_cpu() (feec) algorithm was updated in:
> commit 3e8c6c9aac42 ("sched/fair: Remove task_util from effective
> utilization in feec()")
> 
> find_energy_efficient_cpu() (feec) is now doing:
> feec()
> \_ for_each_pd(pd) [0]
>    // get max_spare_cap_cpu and compute_prev_delta
>    \_ for_each_cpu(pd) [1]
> 
>    \_ get_pd_busy_time(pd) [2]
>      \_ for_each_cpu(pd)
> 
>    // evaluate pd energy without the task
>    \_ get_pd_max_util(pd, -1) [3.0]
>      \_ for_each_cpu(pd)
>    \_ compute_energy(pd, -1)
>      \_ for_each_ps(pd)
> 
>    // evaluate pd energy with the task on prev_cpu
>    \_ get_pd_max_util(pd, prev_cpu) [3.1]
>      \_ for_each_cpu(pd)
>    \_ compute_energy(pd, prev_cpu)
>      \_ for_each_ps(pd)
> 
>    // evaluate pd energy with the task on max_spare_cap_cpu
>    \_ get_pd_max_util(pd, max_spare_cap_cpu) [3.2]
>      \_ for_each_cpu(pd)
>    \_ compute_energy(pd, max_spare_cap_cpu)
>      \_ for_each_ps(pd)
> 
> [3.1] happens only once since prev_cpu is unique. To have an upper
> bound of the complexity, [3.1] is taken into account for all pds.
> So with the same definitions for nr_pd, nr_cpus and nr_ps,
> the complexity is of:
> nr_pd * (2 * [nr_cpus in pd] + 3 * ([nr_cpus in pd] + [nr_ps in pd]))
>   [0]  * (     [1] + [2]      +       [3.0] + [3.1] + [3.2]          )
> = 5 * nr_cpus + 3 * nr_ps
> 
> The complexity limit was set to 2048 in:
> commit b68a4c0dba3b1 ("sched/topology: Disable EAS on inappropriate
> platforms")
> to make "EAS usable up to 16 CPUs with per-CPU DVFS and less than 8
> performance states each". For the same platform, the complexity would
> actually be of:
> 5 * 16 + 3 * 7 = 101
> 
> Since the EAS complexity was greatly reduced, bigger platforms can
> handle EAS. For instance, a platform with 256 CPUs with 256
> performance states each would reach it. To reflect this improvement,
> remove the EAS complexity check.
> 
> Signed-off-by: Pierre Gondois <Pierre.Gondois@arm.com>
> ---
>   Documentation/scheduler/sched-energy.rst | 37 ++--------------------
>   kernel/sched/topology.c                  | 39 ++----------------------
>   2 files changed, 6 insertions(+), 70 deletions(-)
> 

The patch looks good for both: documentation bit and code removal.

We have a new safety checks inside the Energy Model during the setup
of EM for perf domian, even a more strict and precised (32bit arch or
64bit arch) to no overflow in our calculations (when we estimate
energy). This is documented in the Energy Model, so IMO you can easily
drop this paragraph as the patch does. The same applies to the checks
in the code.

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>



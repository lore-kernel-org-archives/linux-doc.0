Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B73C47088
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 21:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A414C61057
	for <linux-doc@archiver.kernel.org>; Wed, 26 May 2021 21:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233040AbhEZVoo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 May 2021 17:44:44 -0400
Received: from foss.arm.com ([217.140.110.172]:50186 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232976AbhEZVoo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 May 2021 17:44:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69F2F6D;
        Wed, 26 May 2021 14:43:12 -0700 (PDT)
Received: from e120325.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CCA213F73B;
        Wed, 26 May 2021 14:43:10 -0700 (PDT)
Date:   Wed, 26 May 2021 22:43:08 +0100
From:   Beata Michalska <beata.michalska@arm.com>
To:     Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc:     Valentin Schneider <valentin.schneider@arm.com>,
        linux-kernel@vger.kernel.org, peterz@infradead.org,
        mingo@redhat.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, corbet@lwn.net, rdunlap@infradead.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/3] sched/topology: Rework CPU capacity asymmetry
 detection
Message-ID: <20210526214308.GB1712@e120325.cambridge.arm.com>
References: <20210524101617.8965-1-beata.michalska@arm.com>
 <20210524101617.8965-3-beata.michalska@arm.com>
 <87fsyc6mfz.mognet@arm.com>
 <20210524225508.GA14880@e120325.cambridge.arm.com>
 <87a6oj6sxo.mognet@arm.com>
 <20210525102945.GA24210@e120325.cambridge.arm.com>
 <98ad8837-b9b8-ff50-5a91-8d5951ee757c@arm.com>
 <20210526121546.GA13262@e120325.cambridge.arm.com>
 <1cae4fcc-d276-f66d-c094-35571233d923@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cae4fcc-d276-f66d-c094-35571233d923@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 26, 2021 at 08:17:25PM +0200, Dietmar Eggemann wrote:
> On 26/05/2021 14:15, Beata Michalska wrote:
> > On Wed, May 26, 2021 at 11:52:25AM +0200, Dietmar Eggemann wrote:
> >> On 25/05/2021 12:29, Beata Michalska wrote:
> >>> On Tue, May 25, 2021 at 10:53:07AM +0100, Valentin Schneider wrote:
> >>>> On 24/05/21 23:55, Beata Michalska wrote:
> >>>>> On Mon, May 24, 2021 at 07:01:04PM +0100, Valentin Schneider wrote:
> >>>>>> On 24/05/21 11:16, Beata Michalska wrote:
> 
> [...]
> 
> >> static inline int
> >> asym_cpu_capacity_classify(struct sched_domain *sd, 
> >>                            const struct cpumask *cpu_map)
> >> {
> >>         int sd_span_match = 0, cpu_map_match = 0, flags = 0; 
> >>         struct asym_cap_data *entry;
> >>
> >>         list_for_each_entry(entry, &asym_cap_list, link) {
> >>                 if (cpumask_intersects(sched_domain_span(sd), entry->cpu_mask))
> >>                         ++sd_span_match;
> >>                 else if (cpumask_intersects(cpu_map, entry->cpu_mask))
> >>                         ++cpu_map_match;
> >>         }
> >>
> >>         WARN_ON_ONCE(!sd_span_match);
> >>
> >>         if (sd_span_match > 1) { 
> >>                 flags |= SD_ASYM_CPUCAPACITY;
> >>                 if (!cpu_map_match)
> >>                         flags |= SD_ASYM_CPUCAPACITY_FULL;
> >>         }
> >>
> >>         return flags;
> >> }
> > So I planned to drop the list_is_singular check as it is needless really.
> > Otherwise, I am not really convinced by the suggestion. I could add comments
> > around current version to make it more ..... 'digestible' but I'd rather
> > stay with it as it seems more compact to me (subjective).
> 
> You could pass in `const struct cpumask *sd_span` instead of `struct
> sched_domain *sd` though. To make it clear that both masks are used to
> compare against the cpumasks of the asym_cap_list entries.
>
I could definitely do that, though if I switch to arrays for CPUs masks,
it might get a bit confusing again.
No strong preferences here though. Can do either or both.

Thanks.

---
BR
B.
>  static inline int
> -asym_cpu_capacity_classify(struct sched_domain *sd,
> +asym_cpu_capacity_classify(const struct cpumask *sd_span,
>  			   const struct cpumask *cpu_map)
>  {
>  	int sd_asym_flags = SD_ASYM_CPUCAPACITY | SD_ASYM_CPUCAPACITY_FULL;
> @@ -1377,14 +1378,14 @@ asym_cpu_capacity_classify(struct sched_domain *sd,
>  		goto leave;
>  
>  	list_for_each_entry(entry, &asym_cap_list, link) {
> -		if (cpumask_intersects(sched_domain_span(sd), entry->cpu_mask)) {
> +		if (cpumask_intersects(sd_span, entry->cpu_mask)) {
>  			++asym_cap_count;
>  		} else {
>  			/*
>  			 * CPUs with given capacity might be offline
>  			 * so make sure this is not the case
>  			 */
> -			if (cpumask_intersects(entry->cpu_mask, cpu_map)) {
> +			if (cpumask_intersects(cpu_map, entry->cpu_mask)) {
>  				sd_asym_flags &= ~SD_ASYM_CPUCAPACITY_FULL;
>  				if (asym_cap_count > 1)
>  					break;
> @@ -1395,7 +1396,6 @@ asym_cpu_capacity_classify(struct sched_domain *sd,
>  leave:
>  	return asym_cap_count > 1 ? sd_asym_flags : 0;
>  }
> -#endif
>  
>  static inline struct asym_cap_data *
>  asym_cpu_capacity_get_data(unsigned long capacity)
> @@ -1589,6 +1589,7 @@ sd_init(struct sched_domain_topology_level *tl,
>  	struct sd_data *sdd = &tl->data;
>  	struct sched_domain *sd = *per_cpu_ptr(sdd->sd, cpu);
>  	int sd_id, sd_weight, sd_flags = 0;
> +	struct cpumask *sd_span;
>  
>  #ifdef CONFIG_NUMA
>  	/*
> @@ -1636,10 +1637,11 @@ sd_init(struct sched_domain_topology_level *tl,
>  #endif
>  	};
>  
> -	cpumask_and(sched_domain_span(sd), cpu_map, tl->mask(cpu));
> -	sd_id = cpumask_first(sched_domain_span(sd));
> +	sd_span = sched_domain_span(sd);
> +	cpumask_and(sd_span, cpu_map, tl->mask(cpu));
> +	sd_id = cpumask_first(sd_span);
>  
> -	sd->flags |= asym_cpu_capacity_classify(sd, cpu_map);
> +	sd->flags |= asym_cpu_capacity_classify(sd_span, cpu_map);
>  	/*
>  	 * Convert topological properties into behaviour.
>  	 */

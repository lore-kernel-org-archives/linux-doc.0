Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE18C7D043
	for <lwn-linux-doc@archive.lwn.net>; Wed, 20 Jun 2018 14:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754089AbeFTOUo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 20 Jun 2018 10:20:44 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39334 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753569AbeFTOUm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Jun 2018 10:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZKxqSmRvuBEzji6QJ6OPJdofTke9TPC+3mQgLDLbuK0=; b=FfcfwekdHiUptkRfLd3jezK1E
        O5CAxLDZM7ArLBCKh3gOdaCAtBixCWG8TmRABFDt0xvvu5W6x/+i+RxvgasONV1nshJM9cUkz+XNr
        1cdiRLAkMSSS3jWMIRHP7ZUBu+Y0F7nGSyWpSSNHTy/IznJLuHziV+ENXRjWJ/1J22ZTeTS7y7HUz
        rmvWXeszgvNPsbcfTzcI2r5qYcsfFNoDnHNHq7JZNHBGnWOKEELqz4PiBxnHEvqKTIkqh8cuIXygw
        b+rPDjTzMmIf9/xAUaIbu45vihPZSWKhvcQC9+CLqWM0ewYH2XmEULNjgaokq0VHdsrd2W1ATL3R9
        3Kr1iR7Pg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fVdyC-0005FK-V5; Wed, 20 Jun 2018 14:20:25 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6E94D2029F1D5; Wed, 20 Jun 2018 16:20:23 +0200 (CEST)
Date:   Wed, 20 Jun 2018 16:20:23 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH v10 9/9] cpuset: Allow reporting of sched domain
 generation info
Message-ID: <20180620142023.GL2494@hirez.programming.kicks-ass.net>
References: <1529295249-5207-1-git-send-email-longman@redhat.com>
 <1529295249-5207-11-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529295249-5207-11-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 18, 2018 at 12:14:09PM +0800, Waiman Long wrote:
> +#ifdef CONFIG_DEBUG_KERNEL
> +static inline void debug_print_domains(cpumask_var_t *doms, int ndoms)
> +{
> +	int i;
> +	char buf[200];
> +	char *ptr, *end = buf + sizeof(buf) - 1;
> +
> +	for (i = 0, ptr = buf, *end = '\0'; i < ndoms; i++)
> +		ptr += snprintf(ptr, end - ptr, "dom%d=%*pbl ", i,
> +				cpumask_pr_args(doms[i]));
> +
> +	pr_debug("Generated %d domains: %s\n", ndoms, buf);
> +}

Why not use pr_cont() and do away with that static buffer?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

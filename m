Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F143EC4321E
	for <linux-doc@archiver.kernel.org>; Mon, 28 Nov 2022 20:39:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231251AbiK1Uja (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Nov 2022 15:39:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233789AbiK1Uj0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Nov 2022 15:39:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1891FB5A;
        Mon, 28 Nov 2022 12:39:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 80AF2B80FD4;
        Mon, 28 Nov 2022 20:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5820EC433D6;
        Mon, 28 Nov 2022 20:39:21 +0000 (UTC)
Date:   Mon, 28 Nov 2022 15:39:19 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@kernel.org>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Juri Lelli <juri.lelli@redhat.com>,
        Clark Williams <williams@redhat.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/3] tracing/osnoise: Add preempt/irq disable options
Message-ID: <20221128153919.33c008d1@gandalf.local.home>
In-Reply-To: <03d4a8522792fa3a51920c79f8a5074933a2fcb3.1669409262.git.bristot@kernel.org>
References: <cover.1669409262.git.bristot@kernel.org>
        <03d4a8522792fa3a51920c79f8a5074933a2fcb3.1669409262.git.bristot@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 25 Nov 2022 22:20:23 +0100
Daniel Bristot de Oliveira <bristot@kernel.org> wrote:

> @@ -1308,6 +1315,8 @@ static void notify_new_max_latency(u64 latency)
>   */
>  static int run_osnoise(void)
>  {
> +	bool preempt_disable = test_bit(OSN_PREEMPT_DISABLE, &osnoise_options);
> +	bool irq_disable = test_bit(OSN_IRQ_DISABLE, &osnoise_options);

	bool irq_disable = test_bit(OSN_IRQ_DISABLE, &osnoise_options);
	bool preempt_disable = IS_ENABLED(CONFIG_PREEMPT) &&
			!irq_disable && test_bit(OSN_PREEMPT_DISABLE, &osnoise_options);

>  	struct osnoise_variables *osn_var = this_cpu_osn_var();
>  	u64 start, sample, last_sample;
>  	u64 last_int_count, int_count;
> @@ -1335,6 +1344,14 @@ static int run_osnoise(void)
>  	 */
>  	threshold = tracing_thresh ? : 5000;
>  
> +	/*
> +	 * IRQ disable also implies in preempt disable.
> +	 */
> +	if (irq_disable)
> +		local_irq_disable();

	if (preempt_disable)
> +		preempt_disable();
> +
>  	/*
>  	 * Make sure NMIs see sampling first
>  	 */
> @@ -1422,16 +1439,21 @@ static int run_osnoise(void)
>  		 * cond_resched()
>  		 */
>  		if (IS_ENABLED(CONFIG_PREEMPT_RCU)) {
> -			local_irq_disable();
> +			if (!irq_disable)
> +				local_irq_disable();
> +
>  			rcu_momentary_dyntick_idle();
> -			local_irq_enable();
> +
> +			if (!irq_disable)
> +				local_irq_enable();
>  		}
>  
>  		/*
>  		 * For the non-preemptive kernel config: let threads runs, if
> -		 * they so wish.
> +		 * they so wish, unless set not do to so.
>  		 */
> -		cond_resched();
> +		if (!irq_disable && !preempt_disable)
> +			cond_resched();
>  
>  		last_sample = sample;
>  		last_int_count = int_count;
> @@ -1450,6 +1472,14 @@ static int run_osnoise(void)
>  	 */
>  	barrier();
>  
> +	/*
> +	 * Return to the preemptive state.
> +	 */

	if (preempt_disable)
> +		preempt_enable();
> +

> +	if (irq_disable)
> +		local_irq_enable();

-- Steve

>  	/*
>  	 * Save noise info.
>  	 */

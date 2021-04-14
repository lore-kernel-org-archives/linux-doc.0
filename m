Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE09EC433B4
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 14:30:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 798ED61155
	for <linux-doc@archiver.kernel.org>; Wed, 14 Apr 2021 14:30:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhDNObA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Apr 2021 10:31:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:34934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1347902AbhDNOax (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 14 Apr 2021 10:30:53 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39CB361139;
        Wed, 14 Apr 2021 14:30:31 +0000 (UTC)
Date:   Wed, 14 Apr 2021 10:30:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Daniel Bristot de Oliveira <bristot@redhat.com>
Cc:     linux-kernel@vger.kernel.org, kcarcia@redhat.com,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Clark Willaims <williams@redhat.com>,
        John Kacur <jkacur@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH 2/5] tracing/hwlat: Implement the mode config option
Message-ID: <20210414103029.7c48b76e@gandalf.local.home>
In-Reply-To: <c6b6ac9274e417b650c7aa9494bcf4f6ca0a1097.1617889883.git.bristot@redhat.com>
References: <cover.1617889883.git.bristot@redhat.com>
        <c6b6ac9274e417b650c7aa9494bcf4f6ca0a1097.1617889883.git.bristot@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  8 Apr 2021 16:13:20 +0200
Daniel Bristot de Oliveira <bristot@redhat.com> wrote:

> +/**
> + * hwlat_mode_write - Write function for "mode" entry
> + * @filp: The active open file structure
> + * @ubuf: The user buffer that contains the value to write
> + * @cnt: The maximum number of bytes to write to "file"
> + * @ppos: The current position in @file
> + *
> + * This function provides a write implementation for the "mode" interface
> + * to the hardware latency detector. hwlatd has different operation modes.
> + * The "none" sets the allowed cpumask for a single hwlatd thread at the
> + * startup and lets the scheduler handle the migration. The default mode is
> + * the "round-robin" one, in which a single hwlatd thread runs, migrating
> + * among the allowed CPUs in a round-robin fashion.
> + */
> +static ssize_t hwlat_mode_write(struct file *filp, const char __user *ubuf,
> +				 size_t cnt, loff_t *ppos)
> +{
> +	const char *mode;
> +	char buf[64];
> +	int ret;
> +	int i;
> +
> +	if (hwlat_busy)
> +		return -EBUSY;

So we can't switch modes while running?


Also, with this implemented, you can remove the disable_migrate variable,
and just switch the mode to NONE when it's detected that the affinity mask
of the thread has been changed.

-- Steve


> +
> +	if (cnt >= sizeof(buf))
> +		return -EINVAL;
> +
> +	if (copy_from_user(buf, ubuf, cnt))
> +		return -EFAULT;
> +
> +	buf[cnt] = 0;
> +
> +	mode = strstrip(buf);
> +
> +	ret = -EINVAL;
> +
> +	for (i = 0; i < MODE_MAX; i++) {
> +		if (strcmp(mode, thread_mode_str[i]) == 0) {
> +			hwlat_data.thread_mode = i;
> +			ret = cnt;
> +		}
> +	}
> +
> +	*ppos += cnt;
> +
> +	return cnt;
> +}
> +
> +

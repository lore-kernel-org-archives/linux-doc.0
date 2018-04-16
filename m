Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 883B87DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 20:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753353AbeDPUIs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 16:08:48 -0400
Received: from ms.lwn.net ([45.79.88.28]:58712 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753323AbeDPUIs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Apr 2018 16:08:48 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0C1692E4;
        Mon, 16 Apr 2018 20:08:48 +0000 (UTC)
Date:   Mon, 16 Apr 2018 14:08:46 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thymo van Beers <thymovanbeers@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: kernel-parameters.txt: Fix whitespace
Message-ID: <20180416140846.0effe6ad@lwn.net>
In-Reply-To: <20180416154458.GA24716@thinkpad>
References: <20180416154458.GA24716@thinkpad>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Apr 2018 17:45:01 +0200
Thymo van Beers <thymovanbeers@gmail.com> wrote:

> Some lines used spaces instead of tabs at line start.
> This can cause mangled lines in editors due to inconsistency.
> 
> Replace spaces for tabs where appropriate.

Seems like a fine idea.  The patch doesn't apply, though; can you please
make a version against current docs-next?  (Or against 4.17-rc1 will work
too).

Also...

>  			domain
> -			  Isolate from the general SMP balancing and scheduling
> -			  algorithms. Note that performing domain isolation this way
> -			  is irreversible: it's not possible to bring back a CPU to
> -			  the domains once isolated through isolcpus. It's strongly
> -			  advised to use cpusets instead to disable scheduler load
> -			  balancing through the "cpuset.sched_load_balance" file.
> -			  It offers a much more flexible interface where CPUs can
> -			  move in and out of an isolated set anytime.
> -
> -			  You can move a process onto or off an "isolated" CPU via
> -			  the CPU affinity syscalls or cpuset.
> -			  <cpu number> begins at 0 and the maximum value is
> -			  "number of CPUs in system - 1".
> +				Isolate from the general SMP balancing and scheduling
> +				algorithms. Note that performing domain isolation this way
> +				is irreversible: it's not possible to bring back a CPU to
> +				the domains once isolated through isolcpus. It's strongly
> +				advised to use cpusets instead to disable scheduler load
> +				balancing through the "cpuset.sched_load_balance" file.
> +				It offers a much more flexible interface where CPUs can
> +				move in and out of an isolated set anytime.
> +
> +			You can move a process onto or off an "isolated" CPU via
> +			the CPU affinity syscalls or cpuset.
> +			<cpu number> begins at 0 and the maximum value is
> +			"number of CPUs in system - 1".

This would appear to have changed the indentation of some of the text?

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

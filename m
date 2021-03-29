Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A97C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:49:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A0E9B6195C
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 12:49:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhC2Msv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 08:48:51 -0400
Received: from mx2.suse.de ([195.135.220.15]:38328 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231401AbhC2Msk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 29 Mar 2021 08:48:40 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1617022119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=oVEktv1cqih9pweZwfNrelV7WGFmRKyYQ1G30+rLI5U=;
        b=Df4DlQ04wTdK2JfTB4b3/FJ+zdB5757N4KzGJ/wMv91lN6EDMMv4xj+oWEl9C6qZDLYyFK
        mZZ2kTvNI4h6oF4SRO+119IjS7uWOMiKuMwXGoTUywCyvCNUWjd018JmvTRNCZjRKVmRVY
        t5Dn8lZbqq+SaoGegHV9+Tti3YwzXB4=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id EBF97B46C;
        Mon, 29 Mar 2021 12:48:38 +0000 (UTC)
Date:   Mon, 29 Mar 2021 14:48:37 +0200
From:   Petr Mladek <pmladek@suse.com>
To:     Wang Qing <wangqing@vivo.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Joe Perches <joe@perches.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Santosh Sivaraj <santosh@fossix.org>,
        Andrey Ignatov <rdna@fb.com>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Modify the explanation and documentation related to
 watchdog thread
Message-ID: <YGHMpT2h4iSgIhxj@alley>
References: <1616554602-1857-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1616554602-1857-1-git-send-email-wangqing@vivo.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed 2021-03-24 10:56:39, Wang Qing wrote:
> "watchdog/%u" threads has be replaced by cpu_stop_work, So we need to modify 
> the explanation and documentation related to this.
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  .../admin-guide/kernel-per-CPU-kthreads.rst          | 20 --------------------
>  kernel/watchdog.c                                    | 12 ++++--------

It would be nice to update also

     Documentation/admin-guide/sysctl/kernel.rst
     Documentation/admin-guide/lockup-watchdogs.rst

Anyway, the changes in this patch looks good. Feel free
to use:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

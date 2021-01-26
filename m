Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70762C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 10:29:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17BD9221FB
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jan 2021 10:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403937AbhAZK3C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jan 2021 05:29:02 -0500
Received: from mx2.suse.de ([195.135.220.15]:47300 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2403940AbhAZK2h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 26 Jan 2021 05:28:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1611656871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pOda+MvC/sHys1dv13U5VXg25nGXKMCvumVGvRV1f6c=;
        b=YXcm+GxgMkbGv/c1skH0GerHWmZ9Lg6XaKFaz1+x8Tcu5n/72+9fgMM3TUNxfnCmzzpFjB
        8LaejLB6PN4pv9IecvMVR1SJ8AdLY6X8WgHAwU63vhnjo21J7xY+xKr1h7JIQ+ELYwN25i
        vBEg+gsy5UtGntgHdqm3PK8WpPW62lw=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 164A5ABDA;
        Tue, 26 Jan 2021 10:27:51 +0000 (UTC)
Date:   Tue, 26 Jan 2021 11:27:50 +0100
From:   Petr Mladek <pmladek@suse.com>
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        John Ogness <john.ogness@linutronix.de>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] printk: rectify kernel-doc for prb_rec_init_wr()
Message-ID: <YA/upguVH/Jj0GJz@localhost.localdomain>
References: <20210125081748.19903-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125081748.19903-1-lukas.bulwahn@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 2021-01-25 09:17:48, Lukas Bulwahn wrote:
> The command 'find ./kernel/printk/ | xargs ./scripts/kernel-doc -none'
> reported a mismatch with the kernel-doc of prb_rec_init_wr().
> 
> Rectify the kernel-doc, such that no issues remain for ./kernel/printk/.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

The patch has been committed into printk/linux.git, branch
printk-rework.

Best Regards,
Petr

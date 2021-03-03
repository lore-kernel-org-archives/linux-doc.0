Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4871C433E0
	for <linux-doc@archiver.kernel.org>; Wed,  3 Mar 2021 10:40:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7497D64EE1
	for <linux-doc@archiver.kernel.org>; Wed,  3 Mar 2021 10:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344632AbhCCKiC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 05:38:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:58996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234187AbhCCCCc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 2 Mar 2021 21:02:32 -0500
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 987EB64E6B;
        Wed,  3 Mar 2021 02:01:37 +0000 (UTC)
Date:   Tue, 2 Mar 2021 21:01:36 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/7] printk: Make %pS and friends print module build ID
Message-ID: <20210302210136.3ded3ab3@gandalf.local.home>
In-Reply-To: <20210301174749.1269154-6-swboyd@chromium.org>
References: <20210301174749.1269154-1-swboyd@chromium.org>
        <20210301174749.1269154-6-swboyd@chromium.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon,  1 Mar 2021 09:47:47 -0800
Stephen Boyd <swboyd@chromium.org> wrote:

>  WARNING: CPU: 4 PID: 3255 at drivers/misc/lkdtm/bugs.c:83 lkdtm_WARNING+0x28/0x30 [lkdtm] (ed5019fdf5e53be37cb1ba7899292d7e143b259e)
>  Modules linked in: lkdtm rfcomm algif_hash algif_skcipher af_alg xt_cgroup uinput xt_MASQUERADE
>  CPU: 4 PID: 3255 Comm: bash Not tainted 5.11 #3 aa23f7a1231c229de205662d5a9e0d4c580f19a1
>  Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
>  pstate: 00400009 (nzcv daif +PAN -UAO -TCO BTYPE=--)
>  pc : lkdtm_WARNING+0x28/0x30 [lkdtm] (ed5019fdf5e53be37cb1ba7899292d7e143b259e)
>  lr : lkdtm_do_action+0x24/0x40 [lkdtm] (ed5019fdf5e53be37cb1ba7899292d7e143b259e)

Why not just change the "Modules linked in:" portion to show the build IDs
instead of every function call? Maybe make it a config option to do so?

-- Steve

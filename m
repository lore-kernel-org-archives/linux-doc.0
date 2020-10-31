Return-Path: <SRS0=jeLJ=EG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B4BFC388F7
	for <linux-doc@archiver.kernel.org>; Sat, 31 Oct 2020 20:05:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BE2F206F9
	for <linux-doc@archiver.kernel.org>; Sat, 31 Oct 2020 20:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604174749;
	bh=1Spt7E/h+lOQId9KrMw1DcEaITriY24WYnLpjKmK2nY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=l6v3xV9hzTho23t5LFkl+FLTMzUSPCBXcmkI5KB9o+8uZLX7hMvUyS6Qxah45Dw9g
	 jxppc3n8aZ7Ncmph62fZ0j3UOarHZVJo2mqfhFxSM7AoWJHyV+h8RYPerqb2XhpWus
	 9CsdtPRFS90tgOy2S2koJ9USI0ZOSfdcY2pykP90=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbgJaUFs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 31 Oct 2020 16:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:33766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728561AbgJaUFs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sat, 31 Oct 2020 16:05:48 -0400
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net [73.231.172.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47CA0206F7;
        Sat, 31 Oct 2020 20:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604174747;
        bh=1Spt7E/h+lOQId9KrMw1DcEaITriY24WYnLpjKmK2nY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=P14brFCOSpQW65Dbdx5U7se86/FZiSqKzg4jcdn4ytDHfpGGaWGUhXkfdWp4g1nEg
         ct+ZRPM3QAII1WWxbGoaBzAjOw07Cgx667qA/1efhlIPAle9uBia0Pc3BljgyDlVEb
         is27XL0W4OVlI0eaFhJX4/ZcXoBzySkEaO8gqfCY=
Date:   Sat, 31 Oct 2020 13:05:46 -0700
From:   Andrew Morton <akpm@linux-foundation.org>
To:     Anand K Mistry <amistry@google.com>
Cc:     linux-fsdevel@vger.kernel.org, asteinhauser@google.com,
        joelaf@google.com, tglx@linutronix.de,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Alexey Gladkov <gladkov.alexey@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Michal Hocko <mhocko@suse.com>,
        Mike Rapoport <rppt@kernel.org>, NeilBrown <neilb@suse.de>,
        Peter Zijlstra <peterz@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] proc: Provide details on indirect branch speculation
Message-Id: <20201031130546.d2b94345008e807f548dc068@linux-foundation.org>
In-Reply-To: <20201030172731.1.I7782b0cedb705384a634cfd8898eb7523562da99@changeid>
References: <20201030172731.1.I7782b0cedb705384a634cfd8898eb7523562da99@changeid>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 30 Oct 2020 17:27:54 +1100 Anand K Mistry <amistry@google.com> wrote:

> Similar to speculation store bypass, show information about the indirect
> branch speculation mode of a task in /proc/$pid/status.

Why is this considered useful?

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C244C6FA82
	for <linux-doc@archiver.kernel.org>; Mon, 26 Sep 2022 15:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235208AbiIZP4t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Sep 2022 11:56:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233463AbiIZP43 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Sep 2022 11:56:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3729491F2
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 07:44:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8BADDB80ABF
        for <linux-doc@vger.kernel.org>; Mon, 26 Sep 2022 14:43:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5FCCC433D7;
        Mon, 26 Sep 2022 14:43:57 +0000 (UTC)
Date:   Mon, 26 Sep 2022 10:45:05 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc:     Yoann Congal <yoann.congal@smile.fr>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH RESEND] Documentation: kprobetrace: Improve readability
Message-ID: <20220926104505.542d1da0@gandalf.local.home>
In-Reply-To: <20220925104846.630cd22a3f82e69770eb365a@kernel.org>
References: <20220915153358.813993-1-yoann.congal@smile.fr>
        <87r104tr6o.fsf@meer.lwn.net>
        <81cae8f1-67e9-37ba-4bfd-566c877944ca@gmail.com>
        <20220921224725.618283bc@gandalf.local.home>
        <fa0bb78c-c0c3-bea5-45b1-460b0754e369@smile.fr>
        <20220925104846.630cd22a3f82e69770eb365a@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 25 Sep 2022 10:48:46 +0900
Masami Hiramatsu (Google) <mhiramat@kernel.org> wrote:

> > I'll send a v2 splitted and a lot less markup added (CC'ing the tracing 
> > maintainers). I guess I got a bit carried away once I started...
> > 
> > Steven, without adding any markup where there was not previously, how do 
> > you feel about changing the '...'/"..." by ``...`` where applicable?  

I'm happy with anything that Masami agrees on.

> 
> Hi, I'm the original author of that document.
> I think it depends on the context (unless mechanically replaced.)
> I will review it, so plaese split that part.

-- Steve

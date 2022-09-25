Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8132C07E9D
	for <linux-doc@archiver.kernel.org>; Sun, 25 Sep 2022 01:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbiIYBsx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 24 Sep 2022 21:48:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiIYBsw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 24 Sep 2022 21:48:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0E2046201
        for <linux-doc@vger.kernel.org>; Sat, 24 Sep 2022 18:48:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3AED960B4A
        for <linux-doc@vger.kernel.org>; Sun, 25 Sep 2022 01:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8E2C433C1;
        Sun, 25 Sep 2022 01:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664070530;
        bh=9S7fIKzT4dnfPFBYM9oxHtjBiNcNL+Rj+GU6Hn0HVw8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=cFdUuVw9H4TFw0NuAxYJW/V7e6dIpMVU4p0NFlu1U4/l4450nVX9EKaRvms4x/x1r
         063sYXdiufin7R8fq1o91nEVHBkGF17cThBqh5jL8O5QVK1foM6gifc5lIB79wT9Lx
         DHTYNwhuAC65WdvVcwu3r4AJAXowZBUu/ZTABbWhq4cF4MkBgvkxy+QyW95s2t1i90
         0vIxow2gBMY2vzeupRA/K3d4DKC/sqDo25qGz/ZIG2O7P/ESrta8ejBCFM1Mmsc/0u
         Gf5TR+5NfJ5EqLED6pvuV1y5yoc2d6zIIGELY6RGCJITWhTfudM3zg7cMyCO8v5rGU
         Q3JVIk2z+H9nw==
Date:   Sun, 25 Sep 2022 10:48:46 +0900
From:   Masami Hiramatsu (Google) <mhiramat@kernel.org>
To:     Yoann Congal <yoann.congal@smile.fr>
Cc:     Steven Rostedt <rostedt@goodmis.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH RESEND] Documentation: kprobetrace: Improve readability
Message-Id: <20220925104846.630cd22a3f82e69770eb365a@kernel.org>
In-Reply-To: <fa0bb78c-c0c3-bea5-45b1-460b0754e369@smile.fr>
References: <20220915153358.813993-1-yoann.congal@smile.fr>
        <87r104tr6o.fsf@meer.lwn.net>
        <81cae8f1-67e9-37ba-4bfd-566c877944ca@gmail.com>
        <20220921224725.618283bc@gandalf.local.home>
        <fa0bb78c-c0c3-bea5-45b1-460b0754e369@smile.fr>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 24 Sep 2022 15:32:29 +0200
Yoann Congal <yoann.congal@smile.fr> wrote:

> 
> On 9/21/22 22:20, Jonathan Corbet wrote:
> > - This patch almost certainly should be split up.  At a minimum, I 
> > would put the pure markup changes in one, and more substantive 
> > changes in the other.  While you're at it, please consider whether 
> > the document *really* needs all that ``literal text`` or not.
> 
> 
> On 9/22/22 04:47, Steven Rostedt wrote:>>> Yoann Congal 
> <yoann.congal@smile.fr> writes:
> >>>> Improve readability of kprobetrace documentation by adding 
> >>>> markup (mainly code snippets), fixing some typos and splitting 
> >>>> some paragraphs.
> >>>> 
> >>>> Signed-off-by: Yoann Congal <yoann.congal@smile.fr> --- 
> >>>> Documentation/trace/kprobetrace.rst | 128 
> >>>> ++++++++++++++-------------- 1 file changed, 66 insertions(+), 
> >>>> 62 deletions(-)
> > No. This file belongs to the tracing maintainers (I'll need to update
> > the MAINTAINERS file, thanks Jon for letting me know).
> > And yes, there's too much markup added to it.
> > 
> > NACK on that.
> > 
> > But there are some other clean ups in that patch that I have no 
> > problem with.
> 
> Hi,
> 
> I'll send a v2 splitted and a lot less markup added (CC'ing the tracing 
> maintainers). I guess I got a bit carried away once I started...
> 
> Steven, without adding any markup where there was not previously, how do 
> you feel about changing the '...'/"..." by ``...`` where applicable?

Hi, I'm the original author of that document.
I think it depends on the context (unless mechanically replaced.)
I will review it, so plaese split that part.

Thank you,

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

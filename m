Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E26C433C1
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 08:58:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E84F619FC
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 08:58:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbhCZI6K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 04:58:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229758AbhCZI6A (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Mar 2021 04:58:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6C0C61A18;
        Fri, 26 Mar 2021 08:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1616749080;
        bh=edZqUHw5Z3EONRX9RfghM0Jwz5Bjv21lNtfF9E2D0+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rNwGEBLQjWWZYnjU+saotsVAj14lGybssYYaAdviMY3V2Amsx5I1bmGPwK1ezyFTE
         eAvONQwAhTy+ueH8s3MQ6DkU2TlfK6qw1nJouRgFJKv1CRRW9wprSpzjKXvbW3rwnD
         APJLJBV1RxVynxbd2aEe5aLAPDRqb0d/KgpTxhkc=
Date:   Fri, 26 Mar 2021 09:57:57 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     ksummit <ksummit-discuss@lists.linuxfoundation.org>,
        Sasha Levin <sashal@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [Ksummit-discuss] [2/5] reporting-issues: step-by-step-guide:
 main and two sub-processes for stable/longterm
Message-ID: <YF2iFW4/LF6itKFm@kroah.com>
References: <c396c91f-27c2-de36-7b05-099e03c213f4@leemhuis.info>
 <b14050b6-8426-a762-49f1-1565c48a5724@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b14050b6-8426-a762-49f1-1565c48a5724@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 26, 2021 at 07:16:40AM +0100, Thorsten Leemhuis wrote:
> On 26.03.21 07:13, Thorsten Leemhuis wrote:
> > Lo! Since a few months mainline in
> > Documentation/admin-guide/reporting-issues.rst contains a text written
> > to obsolete the good old reporting-bugs text. For now, the new document
> > still contains a warning at the top that basically says "this is WIP".
> > But I'd like to remove that warning and delete reporting-bugs.rst in the
> > next merge window to make reporting-issues.rst fully official. With this
> > mail I want to give everyone a chance to take a look at the text and
> > speak up if you don't want me to move ahead for now.
> > 
> > For easier review I'll post the text of reporting-issues.rst in reply to
> > this mail. I'll do that in a few chunks, as if this was a cover letter
> > for a patch-set. 
> 
> 
> Step-by-step guide how to report issues to the kernel maintainers

Looks good to me, no objections from my side.  Thanks so much for doing
this!

greg k-h

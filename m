Return-Path: <SRS0=+Dmp=5T=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0E1C43331
	for <linux-doc@archiver.kernel.org>; Fri,  3 Apr 2020 07:25:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0408F206F8
	for <linux-doc@archiver.kernel.org>; Fri,  3 Apr 2020 07:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389814AbgDCHZf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 3 Apr 2020 03:25:35 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:52008 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730889AbgDCHZf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 3 Apr 2020 03:25:35 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 185FA2983E9
Message-ID: <e1abeecb58caabd93af10af9a97ba93eb2fa1a0b.camel@collabora.com>
Subject: Re: [PATCH v2] docs: pr_*() kerneldocs and basic printk docs
From:   Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     Jani Nikula <jani.nikula@linux.intel.com>, corbet@lwn.net,
        linux-doc@vger.kernel.org, pmladek@suse.com
Cc:     kernel@collabora.com
Date:   Fri, 03 Apr 2020 09:25:31 +0200
In-Reply-To: <877dyxm6t7.fsf@intel.com>
References: <6e398e11-0c5b-7308-1bda-8d7178c0a42b@infradead.org>
         <20200402124425.3363-1-ricardo.canuelo@collabora.com>
         <877dyxm6t7.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 2020-04-03 at 09:17 +0300, Jani Nikula wrote:
> :functions: lets you specify multiple space separated identifiers. You
> could have *one* kernel-doc directive, and list all the functions you
> want. What you have above causes printk.h to be parsed 11 times.
> 
> Did not actually check, but I think the only difference is that listing
> multiple identifiers produces the documentation in the order it occurs
> in the file.
> 
> > +/**
> > + * pr_emerg - Print an emergency-level message
> > + * @fmt: format string
> > + *
> > + * This macro expands to a printk with KERN_EMERG loglevel. It uses
> > pr_fmt() to
> > + * generate the format string.
> >   */
> >  #define pr_emerg(fmt, ...) \
> >  	printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
> 
> Doesn't this produce a warning for not documenting varargs? That would
> be @...: in the comment.

Hi Jani, thanks for your comments.

You're right. Initially I had all the :functions: statements separate because I
intended to have the function references interspersed between the document
paragraphs, but since I finally decided to put them all at the bottom it'd be
better to group them as much as possible.

Regarding the varargs doc, I'm getting no warnings. At first I included the @...
for every function and then I noticed some other existing cases where they were
automatically generated even though they weren't explicitly documented, so I
though that was the way to go.

But now that you mention it, there's this in Documentation/doc-guide/kernel-
doc.rst:

    If a function has a variable number of arguments, its description should
    be written in kernel-doc notation as::

          * @...: description

so I'll go ahead and add them.

Best,
Ricardo


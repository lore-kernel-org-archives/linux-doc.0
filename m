Return-Path: <SRS0=e/bK=4N=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD65EC35E04
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 16:59:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5A322084E
	for <linux-doc@archiver.kernel.org>; Tue, 25 Feb 2020 16:59:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tycho-ws.20150623.gappssmtp.com header.i=@tycho-ws.20150623.gappssmtp.com header.b="obXLz10X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730278AbgBYQ7y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 25 Feb 2020 11:59:54 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39624 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729537AbgBYQ7y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 25 Feb 2020 11:59:54 -0500
Received: by mail-ot1-f67.google.com with SMTP id 77so172513oty.6
        for <linux-doc@vger.kernel.org>; Tue, 25 Feb 2020 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tycho-ws.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jg0YNPqJezZVUwCFdHARTZrqrfIyXbKgJjQXBy2EgeE=;
        b=obXLz10XOEGMDi+fy15W5pJoxg2aAVL6AYksZyWoo8IBPOTtJb+dpMiZAMtIJTMuJT
         G2UZl8bKM4UUz+Y2m4kty8fhxmhYUjIh0EnqKZY1MJxWgtwL6QyjSd42/H45gcRNBXbs
         3dZ1wQtGZRdvdiXpknvQhDIKLqB2FgOiweqqKg1uiVuflc9VOnVLLSIGTsEfqnrtUUPj
         R38ucCaBdtLTdUFHGtG+JnhEXP1O5WemfQh3cZ0Mh9g4UNShiUAxJkUi/wwNMwQ0eFhI
         FWd0XRrOAgbZ7m6UlcY86zAePgVTKANBZAZB7Ozeza7324Zk6qdPYD0Q1pIY+JQJkj3j
         zQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jg0YNPqJezZVUwCFdHARTZrqrfIyXbKgJjQXBy2EgeE=;
        b=DU8kIRAgwcCk2k44zGtdnKETnMgBPGHdY6VJamGGyrW5/nX2Aoz7rVoNu9iogk2A3a
         9spumexAuIcuYMZD7gqBdk/xULNpJUrmxDC4Z60jw6tM7H/kIUE7/FvH3otx1K3zIz0O
         JKoir/NhbKDWwIuVbyU1oNeeRrk7YMsj6znpTWMa/LMBDLfmLXTBqZ74Ok16NitPtOq0
         113huAaOt8fk3B3aBdoWCNr1K9ULGErjt0ls/+R55ECmox4lkmBV3M30G+YpH+ezyQBD
         qiidIcxpWkPk+YKIAcdcmJHtDvpBID6TkcquKTlvcE2Xbwn1+bLgRH/MnVCqBDTjCjyS
         ql9w==
X-Gm-Message-State: APjAAAWlFr3JU4T6ZMxKg/KtDlVD5SZFJ1cLCRTS6Cm9wd8yzmdspeBs
        KJ5Hqr78lB7nadYgoeVBY/ZWWYUB3NY=
X-Google-Smtp-Source: APXvYqz0fshWq4AG7hDbXRYpYd2JsApVm0RWVGcBcP1KoMwWrHTNMPm5bvf9GvC4dsgLNorIefB06g==
X-Received: by 2002:a9d:518b:: with SMTP id y11mr43420985otg.349.1582649993199;
        Tue, 25 Feb 2020 08:59:53 -0800 (PST)
Received: from cisco (ip24-252-86-56.no.no.cox.net. [24.252.86.56])
        by smtp.gmail.com with ESMTPSA id c21sm5376737oiy.11.2020.02.25.08.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 08:59:52 -0800 (PST)
Date:   Tue, 25 Feb 2020 09:59:54 -0700
From:   Tycho Andersen <tycho@tycho.ws>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: fix filesystems/porting.rst whitespace
Message-ID: <20200225165954.GA11763@cisco>
References: <20200220214009.11645-1-tycho@tycho.ws>
 <20200225032028.2bda9de8@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225032028.2bda9de8@lwn.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 25, 2020 at 03:20:28AM -0700, Jonathan Corbet wrote:
> On Thu, 20 Feb 2020 14:40:09 -0700
> Tycho Andersen <tycho@tycho.ws> wrote:
> 
> > If we start with spaces instead of tabs, rst seems to get confused and
> > italicize some things (presumably because of the `*'s).
> > 
> > Instead, let's switch to using leading tabs as we do elsewhere in the file.
> > 
> > Signed-off-by: Tycho Andersen <tycho@tycho.ws>
> > ---
> >  Documentation/filesystems/porting.rst | 21 +++++++++++----------
> >  1 file changed, 11 insertions(+), 10 deletions(-)
> 
> So I don't see that problem in my builds, and it doesn't show in the
> version on kernel.org either.  What version of sphinx are you running?

It's actually the default vim syntax highlighter that gets confused in
my case,

VIM - Vi IMproved 8.1 (2018 May 18, compiled Sep 05 2019 11:15:15)
Included patches: 1-875, 878, 884, 948, 1046, 1365-1368, 1382, 1401

Tycho

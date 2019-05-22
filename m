Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E0F4B7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 22 May 2019 09:49:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbfEVJtI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 22 May 2019 05:49:08 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38272 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728438AbfEVJtI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 May 2019 05:49:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id d18so1526017wrs.5
        for <linux-doc@vger.kernel.org>; Wed, 22 May 2019 02:49:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=scX4WfC5WsPnoLs+Nl/iwg3kKLZv9A3kLQMPNHZ+zvU=;
        b=Nl5b/GqSqwaBwgsNehjlXPZoMnrgsVc7NIDk9oPBHTEfOWoK/+CKs2nyV3iY/GVvx7
         qOlIZn1XfmWutpOz5dt9a1aZ66naAR14YWjkELkVidv1Arwauo+E+KzAof57IEREv9HB
         BVwrKk21gPRnGKRzqfsHij2+laBCPc+75qpFj/cgrkb+gtjMTkp/AA/gViu28lXME+Tr
         J0IMhAIq/aSyVb6z6Crg1/dxXC7ulZMHN9exVte4dOJaj/+SHQEUU780hqYT09KZx9xM
         NOhO9swAqTSraCNK+DNx+jhUKKNKcnxR0DmepLVMydUmOIpeSwO8NukaA9eRVXe6zi7h
         J/GQ==
X-Gm-Message-State: APjAAAWDombBW9tPfxP3JJXDAMiuDiPqZNX7CuTAnnu4+s0vE8dvph6U
        n/RK6LhxDYM5zt4ZAOnR8QBgWA==
X-Google-Smtp-Source: APXvYqwqQVOypYige44jfKRw9hc/jrC8xIL71+dWaaI4HvyYOi88cmgA1dpoQgWpagKViIpU77sPTA==
X-Received: by 2002:a5d:6849:: with SMTP id o9mr223972wrw.196.1558518546686;
        Wed, 22 May 2019 02:49:06 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id u15sm44023094wru.16.2019.05.22.02.49.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 May 2019 02:49:06 -0700 (PDT)
Date:   Wed, 22 May 2019 11:49:05 +0200
From:   Oleksandr Natalenko <oleksandr@redhat.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH RFC 0/2] docs: Deal with some Sphinx deprecation warnings
Message-ID: <20190522094905.pjg3ldvvkndohryb@butterfly.localdomain>
References: <20190521211714.1395-1-corbet@lwn.net>
 <20190522094354.mnolo6bh6yeiza5h@butterfly.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190522094354.mnolo6bh6yeiza5h@butterfly.localdomain>
User-Agent: NeoMutt/20180716
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 22, 2019 at 11:43:54AM +0200, Oleksandr Natalenko wrote:
> On Tue, May 21, 2019 at 03:17:12PM -0600, Jonathan Corbet wrote:
> > The Sphinx folks are deprecating some interfaces in the upcoming 2.0
> > release; one immediate result of that is a bunch of warnings that show up
> > when building with 1.8.  These two patches make those warnings go away,
> > but at a cost:
> 
> A minor correction, if I may and if I understand this correctly: 2.0 is
> not an upcoming release, but a current one (2.0.1, to be precise), and
> this means that in some distros (like, Arch [1]) `make htmldocs` is
> already broken for quite some time.
> 
> [1] https://bugs.archlinux.org/task/59688

^^ this was the initial Bug for introducing the doc, but it got reverted
in [2].

[2] https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/linux&id=cfe52e9aa8168d9571bedf8a376e2cfbd25223fd

> 
> > 
> >  - It introduces a couple of Sphinx version checks, which are always
> >    ugly, but the alternative would be to stop supporting versions
> >    before 1.7.  For now, I think we can carry that cruft.
> > 
> >  - The second patch causes the build to fail horribly on newer
> >    Sphinx installations.  The change to switch_source_input() seems
> >    to make the parser much more finicky, increasing warnings and
> >    eventually failing the build altogether.  In particular, it will
> >    scream about problems in .rst files that are not included in the
> >    TOC tree at all.  The complaints appear to be legitimate, but it's
> >    a bunch of stuff to clean up.
> > 
> > I've tested these with 1.4 and 1.8, but not various versions in between.
> > 
> > Jonathan Corbet (2):
> >   doc: Cope with Sphinx logging deprecations
> >   doc: Cope with the deprecation of AutoReporter
> > 
> >  Documentation/sphinx/kerneldoc.py | 48 ++++++++++++++++++++++++-------
> >  Documentation/sphinx/kernellog.py | 28 ++++++++++++++++++
> >  Documentation/sphinx/kfigure.py   | 38 +++++++++++++-----------
> >  3 files changed, 87 insertions(+), 27 deletions(-)
> >  create mode 100644 Documentation/sphinx/kernellog.py
> > 
> > -- 
> > 2.21.0
> > 
> 
> -- 
>   Best regards,
>     Oleksandr Natalenko (post-factum)
>     Senior Software Maintenance Engineer

-- 
  Best regards,
    Oleksandr Natalenko (post-factum)
    Senior Software Maintenance Engineer

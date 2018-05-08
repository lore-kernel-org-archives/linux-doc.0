Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9CFA87DE74
	for <lwn-linux-doc@archive.lwn.net>; Tue,  8 May 2018 16:51:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932989AbeEHQvR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 8 May 2018 12:51:17 -0400
Received: from mail-wr0-f176.google.com ([209.85.128.176]:40278 "EHLO
        mail-wr0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932815AbeEHQvQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 May 2018 12:51:16 -0400
Received: by mail-wr0-f176.google.com with SMTP id v60-v6so32949561wrc.7
        for <linux-doc@vger.kernel.org>; Tue, 08 May 2018 09:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lDuJ5XMw0zPeWg0V2TzHl6hi7lt48aanxOmUkStEN6c=;
        b=E/u/jgcaCfXemGbNqJlQDj8Y+sXAZNr0vZJMNTH6hQhQq+pT6zoSXK5hFxqL0w9nw+
         PR857Vh9ev9JyjsQTp8Dj8Yeh35aB9rJ9DksKD0LYlqz9fJLe3VQxl8lOmou052DW3Mf
         4BX304KEb1zxAc5LvgzQRMyIr4nGDLDM4JGA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lDuJ5XMw0zPeWg0V2TzHl6hi7lt48aanxOmUkStEN6c=;
        b=t5XR5MmKuqPPRkm/tycAZYjiX+YffbuPBncbuMWWxM2Cy6WZnw6m1owfo1PVlCVGIF
         SR5HY4A2hYOPxdW7OO6i+JWZSvjcYaugCMu00tBub8yFtmlfqD1r9XFv949iCXw45h7n
         wNCVGuisFfpPUVLmbBO4Nm0YPzodSjcBmH647EZOG7iTteHQJ5JwpTiHxwcRuUbn97aj
         4GuWwCDfvBCjvQI51wHHAvWsMuHlJpMvrAqBsidumYhWJAaZM9WGW3Yh2F/nz+RS4Sr1
         8e00dczIzldjBaTiM1gIZYujWTo+bcbCohstoC6AUsAeIrljYcViZGSaXQ19F14j0tid
         e7eg==
X-Gm-Message-State: ALQs6tC/+tHBa9quVR3N8LWadvP4lNFyTb6BIB0tSgO3G4gh8L93RywC
        HKvoHEcweqHvp7+nkg/khCbw2g==
X-Google-Smtp-Source: AB8JxZpzyxcMOt/iKXekyIm0MlVQMFsBxiJBlXfOtMYVg0pn5R3hZe1/zFNOFxAFWe/CBWp6Y/IBmg==
X-Received: by 2002:adf:ad61:: with SMTP id p88-v6mr31932793wrc.24.1525798274905;
        Tue, 08 May 2018 09:51:14 -0700 (PDT)
Received: from andrea ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id o15-v6sm12656227wrj.13.2018.05.08.09.51.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 May 2018 09:51:14 -0700 (PDT)
Date:   Tue, 8 May 2018 18:51:08 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <parri.andrea@gmail.com>,
        Will Deacon <will.deacon@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Matthew Wilcox <mawilcox@microsoft.com>,
        Jeff Layton <jlayton@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Elena Reshetova <elena.reshetova@intel.com>,
        "Tobin C. Harding" <me@tobin.cc>,
        SeongJae Park <sj38.park@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Helmut Grohne <h.grohne@intenta.de>
Subject: Re: [PATCH 05/18] docs: core-api: add cachetlb documentation
Message-ID: <20180508165108.GA10555@andrea>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <07b59879d34502828467f0190f941e23e08fdc81.1525684985.git.mchehab+samsung@kernel.org>
 <20180508100408.070fa171@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180508100408.070fa171@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 08, 2018 at 10:04:08AM -0600, Jonathan Corbet wrote:
> On Mon,  7 May 2018 06:35:41 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > The cachetlb.txt is already in ReST format. So, move it to the
> > core-api guide, where it belongs.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> 
> I think we could do a better job of this by integrating it with the
> kerneldoc comments.  Meanwhile, though, this is a step in the right
> direction, so I've applied it, thanks.

This depends on what you mean by "the right direction": IMO, breaking
in-sources references and get_maintainer.pl does not qualify as such.

  Andrea


> 
> jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

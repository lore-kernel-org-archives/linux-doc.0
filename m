Return-Path: <SRS0=/7E3=6O=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E26C47247
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 19:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BE2E20731
	for <linux-doc@archiver.kernel.org>; Thu, 30 Apr 2020 19:57:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="XqTNUK6O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbgD3T5a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Apr 2020 15:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbgD3T53 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Apr 2020 15:57:29 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55428C035495
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 12:57:29 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id x12so6124127qts.9
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2020 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=LQzvuTiDzxPg8UH93cWpbzSYrqHmgu+qFCbwAwEqzrw=;
        b=XqTNUK6OjR2wnrjL1ekQ59FruO/L9hC7avESb1TAex4GM8KYVyffZ4+yeO3rgDBoUD
         2JM7qmOtjmkqyIbqGgDTxKdj5aKTTJrwcU2x+hGF68kCCaX1o+7t6EjfKZLsbCSKeyi/
         dQ37o9HIVVPZfBhMBhSOAOf3H+zo6qz7bd/Bkc8SWtEUNLvc8F8e6AQAX5CaQouOqCU+
         W1at4ORGUGKKdS6YPURLv15trAp09e+ejrSOJV3YzgCUzRS0zVOUOGVjXAk1yqsJ5q8O
         8OAtOt19hNTrv9zqMmpE7gQlUN9IC7CQpFeBjFDh661QROIIOSonPON3ipKsxtySNr/F
         2IQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LQzvuTiDzxPg8UH93cWpbzSYrqHmgu+qFCbwAwEqzrw=;
        b=s85fz3CVQBLuYqgBi6ZEtvC4nNp9su25V/fIY/sFFbseWriJsZVYYV+iT3lya4uoY2
         LYUyEd1g/EICZHvTS6br5Qx2xLps48hg4Y8KiyriAn+Z8CgB4lMU5JYjGL3UTZx1LvxZ
         OuQP+z45R92lPmUKF6Be9bGUYQ6GkBRxV5bWMPuaa2O1xYrEi0PjmyjHGp1iWOgc+bb+
         FukZlcMuVYDsuAYQJGqfA8s7VYbFeZfgdcnWpPzzrcgjPqi85CeEbVtddkkUp1S3F0fU
         OS6OzSkwTnhQOSxKxiKUvIAp50gGbs8Q5bkCU4j7QUfR5/y2RM2u7cIRaR3LR99Pu7OF
         ouRQ==
X-Gm-Message-State: AGi0PuZpx2kmbLyL2PJX4CVVCuhMVEdlLrgpbHUHmMa3fNQMPAC3yiVZ
        MfGT8F4Z+KvsAjmxf/j82F0ZyA==
X-Google-Smtp-Source: APiQypLeHtVRo31TWgHmb+0zDjdx4VCsPKzmGa+gDrrI/ELs5FpHmKX0AdnqBHMTMiWGBPap150b5Q==
X-Received: by 2002:ac8:470e:: with SMTP id f14mr151315qtp.87.1588276648462;
        Thu, 30 Apr 2020 12:57:28 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id b19sm861386qkg.72.2020.04.30.12.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:57:28 -0700 (PDT)
Message-ID: <07d33cf9937c89519bafc9210a98dab42579e681.camel@massaru.org>
Subject: Re: [PATCH] docs: filesystems: fix `make htmldocs` warning
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, hubcap@omnibond.com,
        martin@omnibond.com, devel@lists.orangefs.org,
        linux-kernel@vger.kernel.org, brendanhiggins@google.com,
        skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Date:   Thu, 30 Apr 2020 16:57:24 -0300
In-Reply-To: <20200430134704.236c612b@lwn.net>
References: <20200430190737.80950-1-vitor@massaru.org>
         <20200430134704.236c612b@lwn.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Thu, 2020-04-30 at 13:47 -0600, Jonathan Corbet wrote:
> On Thu, 30 Apr 2020 16:07:37 -0300
> Vitor Massaru Iha <vitor@massaru.org> wrote:
> 
> > make htmldocs
> > Documentation/filesystems/orangefs.rst:124: WARNING: Literal block
> > expected; none found.
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > ---
> >  Documentation/filesystems/orangefs.rst | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/filesystems/orangefs.rst
> > b/Documentation/filesystems/orangefs.rst
> > index e41369709c5b..628dc220567e 100644
> > --- a/Documentation/filesystems/orangefs.rst
> > +++ b/Documentation/filesystems/orangefs.rst
> > @@ -119,9 +119,7 @@ it comes to that question::
> >  
> >      /opt/ofs/bin/pvfs2-genconfig /etc/pvfs2.conf
> >  
> > -Create an /etc/pvfs2tab file::
> > -
> > -Localhost is fine for your pvfs2tab file:
> > +Create an /etc/pvfs2tab file. Localhost is fine for your pvfs2tab
> > file::
> >  
> >      echo tcp://localhost:3334/orangefs /pvfsmnt pvfs2
> > defaults,noauto 0 0 > \
> >  	/etc/pvfs2tab
> 
> Thanks, but this has already been fixed in docs-next.

Sorry about that. I searched but I didn't find the documentation tree.
Could you point me to the git url?

Thanks,
Vitor


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17B9CE79A9
	for <linux-doc@archiver.kernel.org>; Tue, 19 Sep 2023 21:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233345AbjISVzz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Sep 2023 17:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjISVzz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Sep 2023 17:55:55 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2845BE
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 14:55:49 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-564b6276941so5116667a12.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Sep 2023 14:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1695160549; x=1695765349; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p23pnOYGk3ABoqitzqOpkQDck52ivIL+ObmTQIK/lbM=;
        b=Q7s12vpoHMWZfteAyD9VXAAdYxY3eZgTQxh3aqlrFQYhf+nXqLQKSKesR22KUM9oku
         1gc/Y9wbI3G/Fl+g36VaqSPg1wqYeYVFxNSqZ6v2U8/OZMJkA/V8eF9W3FDfZrrdVUSM
         WZFOfJno/LhzgZdpxTH63Yb986Ff5Of1gCxX6rR3oyyTOwam1GXtKm3F0QusLT/JOjan
         XdojSyGfTNlnXyN9UDjyYr22wt/X6a+JGR4VK5PPPgv32mbFSarkXPatkGcB2QbZmx4Q
         kRDsk+Aw/U+0m4EH8zrv1NeScgg9KCAWAh3d5mGclpH1AJ1jgnnDBEll6m7gQSHKFjBE
         w+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695160549; x=1695765349;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p23pnOYGk3ABoqitzqOpkQDck52ivIL+ObmTQIK/lbM=;
        b=huFn1TKJ9D2QAdFfNVMPNwjUg4H5TrQeMoqDnYxIxjkPFQ8fflByui4q8PkENbzgIl
         2SO6mlYvXyJTV4OGv9AI3AfWiy32joFgdv8twyoxNzSNG5xJlfzAEZv0eqQrPI98OdCP
         XpHoO33WHc2mpXf0FYnfvhMeyoEn9E0ORRl7Jj8ckCzQmZpurTpa8+o8N8O4KtLkSjNT
         Weu00G+yVbn2gwm7LDWmq2dTc1351+VIuvyUXlv7rG4VMhRGzYCCDnyWYVWsol93KpYm
         0dpUVEg2DXcwz0LGm3J9snY7ICKIzPwFiQi+2JzzI0OQSJ17bcFwKNODyWzLVLeqp9G3
         /Ftw==
X-Gm-Message-State: AOJu0YwC602Vka0VUti+qrJzlvqo7e1HMkHD48iYfzHLg1jioFzM00mW
        gm/yBd1N0aMEzqr0VuFNJPK4gA==
X-Google-Smtp-Source: AGHT+IHspxmsKhfq6Ll9avr86y296rLfb+iCXNFGFKL7NQLpxfRwf+/96uZeezej+TkLnnrPCiSPIw==
X-Received: by 2002:a17:90a:bb8b:b0:268:b682:23de with SMTP id v11-20020a17090abb8b00b00268b68223demr1012959pjr.28.1695160549114;
        Tue, 19 Sep 2023 14:55:49 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-20-59.pa.nsw.optusnet.com.au. [49.180.20.59])
        by smtp.gmail.com with ESMTPSA id q20-20020a170902e31400b001bdc664ecd3sm7004304plc.307.2023.09.19.14.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 14:55:48 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
        (envelope-from <david@fromorbit.com>)
        id 1qiih7-002xdF-2X;
        Wed, 20 Sep 2023 07:55:45 +1000
Date:   Wed, 20 Sep 2023 07:55:45 +1000
From:   Dave Chinner <david@fromorbit.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Dave Chinner <dchinner@redhat.com>,
        Charles Han <hanchunchao@inspur.com>, corbet@lwn.net,
        djwong@kernel.org, allison.henderson@oracle.com,
        bhelgaas@google.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: Re: [PATCH] Documentation: xfs: Remove repeated word in comments
Message-ID: <ZQoY4UKcjIJYaJCO@dread.disaster.area>
References: <20230918071905.296081-1-hanchunchao@inspur.com>
 <ZQoMqI/QGPWEpkEi@rh>
 <ZQoPaXNAwtu4wl02@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQoPaXNAwtu4wl02@casper.infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 19, 2023 at 10:15:21PM +0100, Matthew Wilcox wrote:
> On Wed, Sep 20, 2023 at 07:03:36AM +1000, Dave Chinner wrote:
> > [cc linux-xfs@vger.kernel.org]
> > 
> > Hi Charles,
> > 
> > For future reference, can you CC the XFS list on XFS documentation
> > changes please?  That's much preferable to sending patches to random
> > developers and hoping they notice it....
> > 
> > On Mon, Sep 18, 2023 at 03:19:05PM +0800, Charles Han wrote:
> > > Remove the repeated word "the" in comments.
> > > 
> > > Signed-off-by: Charles Han <hanchunchao@inspur.com>
> > > ---
> > >  Documentation/filesystems/xfs-online-fsck-design.rst | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/Documentation/filesystems/xfs-online-fsck-design.rst b/Documentation/filesystems/xfs-online-fsck-design.rst
> 
> To be fair, this new file isn't listed in MAINTAINERS, so
> scripts/get_maintainer.pl doesn't know about it.  May I
> suggest the attached patch?

> From e0eb2f0d1425e6a5dae23c983eb793afa5d040c1 Mon Sep 17 00:00:00 2001
> From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> Date: Tue, 19 Sep 2023 17:12:45 -0400
> Subject: [PATCH] XFS: Update MAINTAINERS to catch all XFS documentation
> 
> Assumes that all XFS documentation will be prefixed with xfs-, which
> seems like a good policy anyway.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  MAINTAINERS | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bf0f54c24f81..3554195022ee 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23640,8 +23640,7 @@ T:	git git://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git
>  P:	Documentation/filesystems/xfs-maintainer-entry-profile.rst
>  F:	Documentation/ABI/testing/sysfs-fs-xfs
>  F:	Documentation/admin-guide/xfs.rst
> -F:	Documentation/filesystems/xfs-delayed-logging-design.rst
> -F:	Documentation/filesystems/xfs-self-describing-metadata.rst
> +F:	Documentation/filesystems/xfs-*
>  F:	fs/xfs/
>  F:	include/uapi/linux/dqblk_xfs.h
>  F:	include/uapi/linux/fsmap.h

Looks fine to me.

Reviewed-by: Dave Chinner <dchinner@redhat.com>

-- 
Dave Chinner
david@fromorbit.com

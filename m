Return-Path: <SRS0=ajHd=6Z=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45740C47255
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:11:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17F3720714
	for <linux-doc@archiver.kernel.org>; Mon, 11 May 2020 23:11:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kds3MjSm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgEKXLZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 May 2020 19:11:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725828AbgEKXLZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 11 May 2020 19:11:25 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EC91C061A0C
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:11:25 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id r22so3661075pga.12
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2020 16:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kd/QhpImkX36HF8SlWn26Vq1MT1a121rRIqfkQ3OXgM=;
        b=kds3MjSmr+27Km3d5Oqby9a5V7U3EwsuhhfZylClXw9zwc4b+sEYlhi4/M9bgYp5oB
         ang2aRYRWcMFQYbgk5YRBlzv3/fVADiSFz2nwkFRGmc5lPYWVxEHJYfF7rYTeO/sjxc6
         vdDOl1TTJxTZOoez95WzbMM3Hee11EoiliYSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kd/QhpImkX36HF8SlWn26Vq1MT1a121rRIqfkQ3OXgM=;
        b=JMy0/Gjxg/RD69H3tjOUq++TeCqyDWaxvhsW8WmOgbEPEI0+KwEzb4c4NFvTlfx25H
         YiaS4MBAH5Qxue5lmSSp5GF61dETB24vuZE5jp4DhaOAWbV9tRds0tnAsy6JdeG45vgD
         iSq9hq1lM/AJIz/fvi4trCUTjdBpAy3JjWIWv7750nBCPIjUdoFNYVgleEC9saTwD5Yi
         xYWCIO3hGpRmIRB2maRPAwQSplGPEl/Y7YY9/my9DI29RPfRjrTAmgKcr4Z+a8RNxsD1
         LrlWZJqd/fELu7BbHMraiQwhMhDe6nx6o9YTsHDoy5j1yE/VQZuVBPJrDB3mfaYHvpn+
         eYIQ==
X-Gm-Message-State: AOAM532aOlbJGJ8Mp3LoxbmJRGImiv3b68kolBS4JLJZ1RTODcWD6bmn
        Pudh2PpPuqV2w/HQDe3COwmy8A==
X-Google-Smtp-Source: ABdhPJwPSUZYIDM8rwAeY/r+K/5u3nE0s9lk3VUhI8mXzXA0IuzsVQak6fdByiO5BrTqPRTkUdRfcg==
X-Received: by 2002:a63:387:: with SMTP id 129mr7901119pgd.117.1589238684936;
        Mon, 11 May 2020 16:11:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 138sm10064164pfz.31.2020.05.11.16.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 16:11:23 -0700 (PDT)
Date:   Mon, 11 May 2020 16:11:22 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     WeiXiong Liao <liaoweixiong@allwinnertech.com>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Petr Mladek <pmladek@suse.com>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Rob Herring <robh@kernel.org>,
        Pavel Tatashin <pasha.tatashin@soleen.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v7 09/18] pstore/blk: Introduce backend for block devices
Message-ID: <202005111609.2CA37E4A3@keescook>
References: <20200510202436.63222-1-keescook@chromium.org>
 <20200510202436.63222-10-keescook@chromium.org>
 <2b4fec3e-53f7-b8d9-49f8-d24401f83363@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b4fec3e-53f7-b8d9-49f8-d24401f83363@infradead.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 11, 2020 at 08:36:49AM -0700, Randy Dunlap wrote:
> On 5/10/20 1:24 PM, Kees Cook wrote:
> > diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
> > index 98d2457bdd9f..92ba73bd0b62 100644
> > --- a/fs/pstore/Kconfig
> > +++ b/fs/pstore/Kconfig
> > @@ -160,3 +160,67 @@ config PSTORE_ZONE
> >  	help
> >  	  The common layer for pstore/blk (and pstore/ram in the future)
> >  	  to manage storage in zones.
> > +
> > +config PSTORE_BLK
> > +	tristate "Log panic/oops to a block device"
> > +	depends on PSTORE
> > +	depends on BLOCK
> > +	select PSTORE_ZONE
> > +	default n
> > +	help
> > +	  This enables panic and oops message to be logged to a block dev
> > +	  where it can be read back at some later point.
> > +
> > +	  If unsure, say N.
> > +
> > +config PSTORE_BLK_BLKDEV
> > +	string "block device identifier"
> > +	depends on PSTORE_BLK
> > +	default ""
> > +	help
> > +	  Which block device should be used for pstore/blk.
> > +
> > +	  It accept the following variants:
> > +	  1) <hex_major><hex_minor> device number in hexadecimal represents
> > +	     itself no leading 0x, for example b302.
> 
> 	     itself with no leading 0x,

Yes, I've reworked the language here. Thanks!

-- 
Kees Cook

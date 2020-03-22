Return-Path: <SRS0=X7yh=5H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31330C4332E
	for <linux-doc@archiver.kernel.org>; Sun, 22 Mar 2020 15:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F405D20724
	for <linux-doc@archiver.kernel.org>; Sun, 22 Mar 2020 15:59:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jlRqkmR/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgCVP7P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 22 Mar 2020 11:59:15 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41018 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgCVP7O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 22 Mar 2020 11:59:14 -0400
Received: by mail-pl1-f196.google.com with SMTP id t16so4783360plr.8
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2020 08:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PluEgB5CGHn5zIpx8WT7vUDABEi6WP6504DCfOquj6o=;
        b=jlRqkmR/q0VZPRBfaUHIyYnR4OYoJj1t9u9gSVkszMQKDXNKOtA4tGMcr+N8oj4kQJ
         v+CHKQK6pd49ksBYnkX9J7l4rBRVy+ulNiDZg9qE7SKA077y1LZ+WISoir5WfFF+gHdZ
         KDrLrafv7vYCdtP+vRPho318LyXdizai8mqwM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PluEgB5CGHn5zIpx8WT7vUDABEi6WP6504DCfOquj6o=;
        b=NMZAZXFuOBRc+uWSj7AV8sxIWupBNywDKGMxanthGAfblHadatT1/TW8kM7JjZfNvR
         N/ttWBHFyoM+f2CZ3xfAVpUWR4mnyH+IcBAHrlBghgimf2QcZs6H0DWTRG0R+V/LVbOj
         KifJcN2IxF2u7YrU0BVzylKbmTUMQodizWRkMp4f4sro6jXJYwVyISo5hkpn6hI6Set6
         7atMMywL97sVkjrNTKW+5nBKV4+J29Wa+UNjux3Lw+HCKcdD4ge5/Q/Apfj7kPm3FUtF
         7qOyaXtBzbTPsg8wYnMf+x8hro724NdyK4ItTpz6LWNDCAC+NOuWknrOaHWEP9PFf2H6
         Tzmw==
X-Gm-Message-State: ANhLgQ0YRqHnvamm/nWEKS7dRcpNu0apuRKxttLi7BQ1akocfgafYXmJ
        hx4GNWnpg9U7zEm7Wj1fKym0NQ==
X-Google-Smtp-Source: ADFU+vvhqzwqYD5/diSgghDIEd9lyztkeS8kSQVvuUtRaNA6/tp+betHbMLKqpDQy6uKuylJ/6pnJw==
X-Received: by 2002:a17:902:d898:: with SMTP id b24mr14591699plz.0.1584892751838;
        Sun, 22 Mar 2020 08:59:11 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b9sm9852106pgi.75.2020.03.22.08.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2020 08:59:11 -0700 (PDT)
Date:   Sun, 22 Mar 2020 08:59:10 -0700
From:   Kees Cook <keescook@chromium.org>
To:     WeiXiong Liao <liaoweixiong@allwinnertech.com>
Cc:     Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 03/11] pstore/blk: blkoops: support pmsg recorder
Message-ID: <202003220846.978F969@keescook>
References: <1581078355-19647-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1581078355-19647-4-git-send-email-liaoweixiong@allwinnertech.com>
 <202003181107.6B776F0E5F@keescook>
 <4ddb742f-7819-25e9-7bf4-49a80823d2aa@allwinnertech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ddb742f-7819-25e9-7bf4-49a80823d2aa@allwinnertech.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 22, 2020 at 07:14:37PM +0800, WeiXiong Liao wrote:
> hi Kees Cook,
> 
> On 2020/3/19 AM 2:13, Kees Cook wrote:
> > On Fri, Feb 07, 2020 at 08:25:47PM +0800, WeiXiong Liao wrote:
> >> +config PSTORE_BLKOOPS_PMSG_SIZE
> >> +	int "pmsg size in kbytes for blkoops"
> >> +	depends on PSTORE_BLKOOPS
> >> +	depends on PSTORE_PMSG
> >> +	default 64
> > 
> > Instead of "depends on PSTORE_PMSG", you can do:
> > 
> > 	default 64 if PSTORE_PMSG
> > 	default 0
> > 
> 
> What happens if PSTORE_BLKOOPS_PMSG_SIZE is non-zero while
> PSTORE_PMSG is disabled? The pmsg recorder do not work but pstore/blk
> will always allocate zone for pmsg recorder since pmsg_size is non-zero.
> It waste storage space.

Yeah, true. This gets back to my wanting to have this be more dynamic in
the pstore core. But, yes, for now, you're right.

You can still do this for initialization:

static long pmsg_size = IS_ENABLED(CONFIG_PSTORE_PMSG)
				?  CONFIG_PSTORE_BLKOOPS_PMSG_SIZE
				: -1;

But that'll require logic changes to verify_size(). We can revisit this
after v3.

> >> @@ -611,7 +776,8 @@ static ssize_t blkz_dmesg_read(struct blkz_zone *zone,
> >>  		char *buf = kasprintf(GFP_KERNEL,
> >>  				"%s: Total %d times\n",
> >>  				record->reason == KMSG_DUMP_OOPS ? "Oops" :
> >> -				"Panic", record->count);
> >> +				record->reason == KMSG_DUMP_PANIC ? "Panic" :
> >> +				"Unknown", record->count);
> > 
> > Please use get_reason_str() here.
> > 
> 
> get_reason_str() is marked 'static' on platform.c and pstore/blk only
> support oops
> and panic, it's no need to check more reason number.

I'd still rather identical strings not be scattered around pstore. :) Go
ahead and make get_reason_str() non-static and rename it
pstore_get_reason_str(), EXPORT_SYMBOL(), add to pstore.h etc.

-- 
Kees Cook

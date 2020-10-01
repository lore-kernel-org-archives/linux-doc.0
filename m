Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5104BC47423
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 04:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BCC4221E8
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 04:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tom7LI02"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725918AbgJAERI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 00:17:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725800AbgJAERI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 00:17:08 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F2FC0613D0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 21:17:06 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id b124so3213913pfg.13
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2020 21:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=s4XehrwkF2DDQMEswJuHfeDvX5s+FgOsxfZuPhSMT5k=;
        b=Tom7LI02NqYpO+tQuLV1w/lqCE9jjmNlpkDkhQcSB9F4YIqGAC6CpLc1Nql2KpSHIO
         AGglpdoP+b3TJn7MpDQMlu7zUwWosHoH/OJsuelb5sH123bSvbWoiCiCBLgjmW9WJcRm
         EbmXfTr2RAaGuhvbuuun5uKwv7wR14F9HxBhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=s4XehrwkF2DDQMEswJuHfeDvX5s+FgOsxfZuPhSMT5k=;
        b=np2T3Vcz6OjRIjhb/s5vETk/HRSJU4SCicQKqLg3CE7mk6UTvKId/deuwLGvmOebw+
         WsbYKnISEhnoUK6EMBo6FuxLUscg8EHnkdYzZK6e3QZhl0hIShONgUWx/p8PJDlkQ5/8
         rdqGypOZx2d/3b8rYRtQVQiixm5kjbziHD5mFe9r76MTZVRL/rD7i7QaF3lb412a6k2l
         nKG3GNhmfIRlNQWuB9ThqmCKre4/IpucXUIIDDk4eGo+ea9UGrn+XRW9vp2DmJAxYY9U
         Tdm5eP57Gr2XAJWVwDFQlHIKolHJzddX/zfT9/AB/rsOePowE7DepBMDqoEs+08MKLpt
         k1Xw==
X-Gm-Message-State: AOAM5330nUhmxpR6MZ6KfZi2rn0WTU23PaBK5VBRJJe+0t1gr89OQDcy
        7gLHU1FdNLS7CWUdCATeDtY1ovD1JoB2tBD4
X-Google-Smtp-Source: ABdhPJzV/r2DVoiyI84z9iiqknwLRtq3vjEzAjlhj2nmeWV3fxw1H+sBUIEurQkPsPEpR9OB8Exx5g==
X-Received: by 2002:aa7:8287:0:b029:142:2501:39ec with SMTP id s7-20020aa782870000b0290142250139ecmr5194026pfm.59.1601525825768;
        Wed, 30 Sep 2020 21:17:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a13sm4412632pfi.139.2020.09.30.21.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 21:17:04 -0700 (PDT)
Date:   Wed, 30 Sep 2020 21:17:03 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Joe Perches <joe@perches.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 1/8] sysfs: Add sysfs_emit and sysfs_emit_at to format
 sysfs output
Message-ID: <202009302108.18B05CA38@keescook>
References: <cover.1600285923.git.joe@perches.com>
 <884235202216d464d61ee975f7465332c86f76b2.1600285923.git.joe@perches.com>
 <20200930115740.GA1611809@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930115740.GA1611809@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 01:57:40PM +0200, Greg Kroah-Hartman wrote:
> Kees, and Rafael, I don't know if you saw this proposal from Joe for
> sysfs files, questions below:

I'm a fan. I think the use of sprintf() in sysfs might have been one of
my earliest complaints about unsafe code patterns in the kernel. ;)

> > +/**
> > + *	sysfs_emit - scnprintf equivalent, aware of PAGE_SIZE buffer.
> > + *	@buf:	start of PAGE_SIZE buffer.
> > + *	@fmt:	format
> > + *	@...:	optional arguments to @format
> > + *
> > + *
> > + * Returns number of characters written to @buf.
> > + */
> > +int sysfs_emit(char *buf, const char *fmt, ...)
> > +{
> > +	va_list args;
> > +	int len;
> > +
> > +	if (WARN(!buf || offset_in_page(buf),
> > +		 "invalid sysfs_emit: buf:%p\n", buf))

I don't want the %p here, but otherwise, sure. I'd also make it a _ONCE
variant:

	if (WARN_ONCE(!buf || offset_in_page(buf),
		 "invalid sysfs_emit: offset_in_page(buf):%zd\n",
		  buf ? offset_in_page(buf) : 0))

> > +		return 0;
> > +
> > +	va_start(args, fmt);
> > +	len = vscnprintf(buf, PAGE_SIZE, fmt, args);
> > +	va_end(args);
> > +
> > +	return len;
> > +}
> > +EXPORT_SYMBOL_GPL(sysfs_emit);
> > +
> > +/**
> > + *	sysfs_emit_at - scnprintf equivalent, aware of PAGE_SIZE buffer.
> > + *	@buf:	start of PAGE_SIZE buffer.
> > + *	@at:	offset in @buf to start write in bytes
> > + *		@at must be >= 0 && < PAGE_SIZE
> > + *	@fmt:	format
> > + *	@...:	optional arguments to @fmt
> > + *
> > + *
> > + * Returns number of characters written starting at &@buf[@at].
> > + */
> > +int sysfs_emit_at(char *buf, int at, const char *fmt, ...)
> > +{
> > +	va_list args;
> > +	int len;
> > +
> > +	if (WARN(!buf || offset_in_page(buf) || at < 0 || at >= PAGE_SIZE,
> > +		 "invalid sysfs_emit_at: buf:%p at:%d\n", buf, at))

Same:

	if (WARN_ONCE(!buf || offset_in_page(buf) || at < 0 || at >= PAGE_SIZE,
		 "invalid sysfs_emit_at: offset_in_page(buf):%zd at:%d\n",
		  buf ? offset_in_page(buf) : 0, at))

> > +		return 0;
> > +
> > +	va_start(args, fmt);
> > +	len = vscnprintf(buf + at, PAGE_SIZE - at, fmt, args);
> > +	va_end(args);
> > +
> > +	return len;
> > +}
> > +EXPORT_SYMBOL_GPL(sysfs_emit_at);
> 
> These feel sane, but I'm loath to have a ton of churn for no good
> reason.

I think the churn is worth it if we remove "seemingly wrong" code
patterns from the kernel. It's especially useful, IMO, for when there
are future mutations/refactorings and we don't end up with a bare
sprintf somewhere else.

> If we make all sysfs show/store functions use these calls instead of
> sprintf(), it "feels" like that might address the objections that people
> have had in the past where they are nervous about "bare" sprintf()
> calls, right?

I would think so. This is the kind of thing we did for %n in seq_file:
remove potential foot-gun API in favor of subsystem-specific safe API.

> It also might make things easier to audit where we can see much easier
> where sysfs files are doing "foolish" things by calling sysfs_emit_at()
> a bunch of times they shouldn't be, and maybe automate the documentation
> of sysfs files in a better way.

Indeed!

> So I guess I'm asking for another developer to at least agree that this
> feels like the right way forward here.  I don't want to start down this
> path, only to roll them all back as it feels like pointless churn.

With the changes above, I'd Ack it. :)

-- 
Kees Cook

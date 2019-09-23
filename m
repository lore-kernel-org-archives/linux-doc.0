Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0EDCA7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 22:40:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503447AbfIWWko (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 18:40:44 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42220 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503436AbfIWWko (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Sep 2019 18:40:44 -0400
Received: by mail-pg1-f195.google.com with SMTP id z12so8852188pgp.9
        for <linux-doc@vger.kernel.org>; Mon, 23 Sep 2019 15:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dV/VFIBBnqaIS6aRCC/wcXHFeYbMA2iZ1Q9+7enJTQg=;
        b=Ne7PIJi24GGIHptbAvF1PYuU1lPdUtAI8cUiMgsIavTd3Ni4NUMgE5ngyrSH0WjFpJ
         y6V13OYicPJFLnGdpvQOoM2ZiBUQgeKR6S3xP0qepIBvlRosmtun5YhV47GwZBMhwHIi
         fUrNZg8L5+CM3H1+fM8iP30LIcWfeOB4xauFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dV/VFIBBnqaIS6aRCC/wcXHFeYbMA2iZ1Q9+7enJTQg=;
        b=odQmWjaFYI2zAusxmJdh1bMa72jPa/PwKNN0p9x7yGJGH/GXAsOTXJhEk445FbTLXb
         r6q/zUiU4p+SqOtJyALYPb2iqfMBzNiEgKlxpSfCiOyVfQyJxHtkWtS+FBwgktb6Cf3Q
         nzGr6i8BeDOQdE+eQQ4UJ/Mg6f9vB5DI/u7b8V5xAGgvO2S/IT588j90jNX3J9REYjv3
         MYvoZZw3kLtDAksQ6mGATDHNLXx3FZ/XvQYxAwsrlA3SoQTbYZIhlzpN6c+dUx9d8gGI
         E72HMPEc62LzB+zyLBWjpBYm+FDb/WQtFWUjFhEzcz0Ucmcym98CJh7Eo51h6iGcp3vw
         PLYg==
X-Gm-Message-State: APjAAAUboLKpOAIruNvrbb9npBPwOfnZS4fXEZWAt56fNUJw6fF4jY6g
        YjSSzsimnlLHbi3pjOcLlCRljQ==
X-Google-Smtp-Source: APXvYqwJ/YZFjqVIePIntTXndtIsstaltiFMdt5JylGJwMjKeHF8y7vM9oVdgnJmvOsINhEnrCrbCw==
X-Received: by 2002:a65:504c:: with SMTP id k12mr2257623pgo.252.1569278443553;
        Mon, 23 Sep 2019 15:40:43 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o42sm19687393pjo.32.2019.09.23.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2019 15:40:42 -0700 (PDT)
Date:   Mon, 23 Sep 2019 15:40:41 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: Use make invocation's -j argument for
 parallelism
Message-ID: <201909231537.0FC0474C@keescook>
References: <201909191438.C00E6DB@keescook>
 <20190922140331.3ffe8604@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190922140331.3ffe8604@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Sep 22, 2019 at 02:03:31PM -0600, Jonathan Corbet wrote:
> On Thu, 19 Sep 2019 14:44:37 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > While sphinx 1.7 and later supports "-jauto" for parallelism, this
> > effectively ignores the "-j" flag used in the "make" invocation, which
> > may cause confusion for build systems. Instead, extract the available
> 
> What sort of confusion might we expect?  Or, to channel akpm, "what are the
> user-visible effects of this bug"?

When I run "make htmldocs -j16" with a pre-1.7 sphinx, it is not
parallelized. When I run "make htmldocs -j8" with 1.7+ sphinx, it uses
all my CPUs instead of 8. :)

> > +	-j $(shell python3 $(srctree)/scripts/jobserver-count $(SPHINX_PARALLEL)) \
> 
> This (and the shebang line in the script itself) will cause the docs build
> to fail on systems lacking Python 3.  While we have talked about requiring
> Python 3 for the docs build, we have not actually taken that step yet.  We
> probably shouldn't sneak it in here.  I don't see anything in the script
> that should require a specific Python version, so I think it should be
> tweaked to be version-independent and just invoke "python".

Ah, no problem. I can fix this. In a quick scan it looked like sphinx
was python3, but I see now that's just my install. :)

> >  	-b $2 \
> >  	-c $(abspath $(srctree)/$(src)) \
> >  	-d $(abspath $(BUILDDIR)/.doctrees/$3) \
> > diff --git a/scripts/jobserver-count b/scripts/jobserver-count
> > new file mode 100755
> > index 000000000000..ff6ebe6b0194
> > --- /dev/null
> > +++ b/scripts/jobserver-count
> > @@ -0,0 +1,53 @@
> > +#!/usr/bin/env python3
> > +# SPDX-License-Identifier: GPL-2.0-or-later
> 
> By license-rules.rst, this should be GPL-2.0+

Whoops, thanks.

> > +# Extract and prepare jobserver file descriptors from envirnoment.
> > +try:
> > +	# Fetch the make environment options.
> > +	flags = os.environ['MAKEFLAGS']
> > +
> > +	# Look for "--jobserver=R,W"
> > +	opts = [x for x in flags.split(" ") if x.startswith("--jobserver")]
> > +
> > +	# Parse out R,W file descriptor numbers and set them nonblocking.
> > +	fds = opts[0].split("=", 1)[1]
> > +	reader, writer = [nonblock(int(x)) for x in fds.split(",", 1)]
> > +except:
> 
> So I have come to really dislike bare "except" clauses; I've seen them hide
> too many bugs.  In this case, perhaps it's justified, but still ... it bugs
> me ...

Fair enough. I will adjust this (and the later instance).

> 
> > +	# Any failures here should result in just using the default
> > +	# specified parallelism.
> > +	print(default)
> > +	sys.exit(0)
> > +
> > +# Read out as many jobserver slots as possible.
> > +jobs = b""
> > +while True:
> > +	try:
> > +		slot = os.read(reader, 1)
> > +		jobs += slot
> > +	except:
> 
> This one, I think, should be explicit; anything other than EWOULDBLOCK
> indicates a real problem, right?
> 
> > +		break
> > +# Return all the reserved slots.
> > +os.write(writer, jobs)
> 
> You made writer nonblocking, so it seems plausible that we could leak some
> slots here, no?  Does writer really need to be nonblocking?

Good point. I will fix this too.

> 
> > +# If the jobserver was (impossibly) full or communication failed, use default.
> > +if len(jobs) < 1:
> > +	print(default)
> > +
> > +# Report available slots (with a bump for our caller's reserveration).
> > +print(len(jobs) + 1)
> 
> The last question I have is...why is it that we have to do this complex
> dance rather than just passing the "-j" option through directly to sphinx?
> That comes down to the "confusion" mentioned at the top, I assume.  It
> would be good to understand that?

There is no method I have found to discover the -j option's contents
(intentionally so, it seems) from within make. :(

-- 
Kees Cook

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CDB957D90D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 24 Sep 2019 21:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438314AbfIXVvi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 24 Sep 2019 17:51:38 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46644 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbfIXVvi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Sep 2019 17:51:38 -0400
Received: by mail-pg1-f194.google.com with SMTP id a3so1983906pgm.13
        for <linux-doc@vger.kernel.org>; Tue, 24 Sep 2019 14:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L7gG2OO+jz7b36c/gN/ybwC9G0RA1PGpUJISeNqEcl4=;
        b=j0Hy/ryx8DixYZOOmEwkUX0/pEG2qkc7U7jVaDgYP0aCO9H/XfGJ6Z0y/24GG1oiof
         rHxm/3fUioGvhaobSpoh8PZULnBsgeplegW4Gm74C5U3fVi1417fO4qWU56uhxMxrfYh
         DiYyBBdPj1ulomolqxMJchKIYdAVliR+MuuZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L7gG2OO+jz7b36c/gN/ybwC9G0RA1PGpUJISeNqEcl4=;
        b=hQLVGiBWin4f+Lvs7dBCBAvRtTl+l++Z7IPMSsenlixQ07nOohW+Xx3nxdBPjDNOe6
         M6AOXxp6NVF6KsCwQjBZCdjhOnMoQHQB5CME8RGnQO6Hs+fc82IKeGGqDbPXGjpTKUkn
         vJVjvU8OR3Nlp4scpiFXxWAgzfHuthEolue3f14wfsH32gkzmjwhfNFsXzKxcE8hhtUf
         p3qRIcxs/VFWE6vUL4lxJTRJyJ2eNNEUzs59pJbA6hE2Yo16QVCFByUU389KLcOXAAYn
         HnkyD/eC6aNSVkmHwo4pX5a5xYcL5q1NJneSQ43BAt3JAhk8ilEA33tOu2xuJK+vagX7
         kOxQ==
X-Gm-Message-State: APjAAAWE5tinNHnHB1+Cr+rPT2pxivZErMpto5oX9rYDdBYnz0VcyRmo
        dCIquKwKAadv6ihcrQandN9Vnw==
X-Google-Smtp-Source: APXvYqwCZP6jCkktcNQcHRwtBJrjQEe6Q8sx0//w+SKXejMYCli/WV6jeQY8d1sFIKDvQeZUZ71YlQ==
X-Received: by 2002:a63:121c:: with SMTP id h28mr5143588pgl.336.1569361895679;
        Tue, 24 Sep 2019 14:51:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b3sm840602pjp.13.2019.09.24.14.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2019 14:51:34 -0700 (PDT)
Date:   Tue, 24 Sep 2019 14:51:33 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC][PATCH] docs: Programmatically render MAINTAINERS into ReST
Message-ID: <201909241450.8A6B7E6EBF@keescook>
References: <201909231534.E8BE691@keescook>
 <87mueutb99.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87mueutb99.fsf@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 24, 2019 at 10:16:18AM +0300, Jani Nikula wrote:
> I'd suggest making convert-maintainers.py a Sphinx extension, and
> handling all of this in Sphinx.

That's an excellent idea. I've done this now -- it simplifies things
quite a bit (though I had to beat my head against some odd behavioral
issues I tripped over inside docutils). I'll see the next version
shortly...

-- 
Kees Cook

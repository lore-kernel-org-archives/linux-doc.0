Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 269657D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 06:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfE2Gy2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 02:54:28 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40819 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725992AbfE2Gy2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 02:54:28 -0400
Received: by mail-oi1-f194.google.com with SMTP id r136so1150734oie.7
        for <linux-doc@vger.kernel.org>; Tue, 28 May 2019 23:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pChoKwIWurLwR+JcSuU1NNjyDM3j/trzD6X0wFNY0n4=;
        b=aRSV8+6iSGxARgcHjqu+worAprAztrfzegvwvu1xeYjMWRbmUICvgJ7FsEXWylX7hP
         MzephQNOCnMMUT1Egx1mwD4RPi9Qp4Lg9dANyWFRT1XICfOmX0E4ytSxoQ+84hOygtpo
         ChMNoXihqGT5C1eoF7EuG9MBKljOAjrFwWvYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pChoKwIWurLwR+JcSuU1NNjyDM3j/trzD6X0wFNY0n4=;
        b=ToNvi2ewIyIOQ2AiyuhPZnqUkKqoNX9Qi8cSRka4ZAlmJqI8tVoj7JSz2gT8UlyB1h
         M2N3spXV+kqEHROaBAxP2xtK7IrjmfUt5gFuR/7x/oZtraqGa/BQ3qDJ5p3M2p3uFHWS
         DDiBErHYLKi/mKG7nsWSN78XSynEJTKp9Y/4MUTkyhKTGV1smbqB3F+P0E2Mxmxix0sv
         XSH0spFrlnl6tUYLznICMQKNtQvtOmBYqWg/p6wjinxITAjEixBId6K9djdsgyGxKg56
         IiJzmAuPpVt2bAuKqjpMScRQGM+hfViy+dREbWQzoJtULF5jsxlEJdDYlWd6gyI4Nutg
         nP+Q==
X-Gm-Message-State: APjAAAVqpI0rY6ktq99WNx/Bq2lQMVtD59Z4Pay5VmczzyACSlcEQFab
        ZOODr3Fw5X6rPXaUru+RaoifQkW6D8qMyZ3y57ubFw==
X-Google-Smtp-Source: APXvYqxEFm7alRLONi7G8F6YaFxfCuYNB3CbojO+n4bQcOMY76gCc9bWruq40KNBeXkP9IsGt/WbcXln11o+AWenJIY=
X-Received: by 2002:aca:6208:: with SMTP id w8mr5374548oib.128.1559112867588;
 Tue, 28 May 2019 23:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190522205034.25724-1-corbet@lwn.net> <20190522205034.25724-7-corbet@lwn.net>
In-Reply-To: <20190522205034.25724-7-corbet@lwn.net>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 29 May 2019 08:54:16 +0200
Message-ID: <CAKMK7uFVP6o5jU_cEPshYXwWN39ohybid52yBj567dGBiejzTg@mail.gmail.com>
Subject: Re: [PATCH 6/8] docs/gpu: fix a documentation build break in i915.rst
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Markus Heiser <markus.heiser@darmarit.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Oleksandr Natalenko <oleksandr@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 22, 2019 at 10:51 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Documentation/gpu/i915.rst is not included in the TOC tree, but newer
> versions of sphinx parse it anyway.  That leads to this hard build failure:

It is included I think: Documentation/gpu/index.rst -> drivers.rst ->
i915.rst. With that corrected A-b: me.

btw this patch didn't go to intel-gfx and all i915 maintainers, I
think per get_maintainers.pl it should have. Just asking since I had a
few patches of my own where get_maintainers.pl didn't seem to do the
right thing somehow.
-Daniel

>
> > Global GTT Fence Handling
> > ~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > reST markup error:
> > /stuff/k/git/kernel/Documentation/gpu/i915.rst:403: (SEVERE/4) Title level inconsistent:
>
> Make the underlining consistent and restore a working docs build.
>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/gpu/i915.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/i915.rst b/Documentation/gpu/i915.rst
> index 055df45596c1..cf9ff64753cc 100644
> --- a/Documentation/gpu/i915.rst
> +++ b/Documentation/gpu/i915.rst
> @@ -401,13 +401,13 @@ GTT Fences and Swizzling
>     :internal:
>
>  Global GTT Fence Handling
> -~~~~~~~~~~~~~~~~~~~~~~~~~
> +-------------------------
>
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_gem_fence_reg.c
>     :doc: fence register handling
>
>  Hardware Tiling and Swizzling Details
> -~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +-------------------------------------
>
>  .. kernel-doc:: drivers/gpu/drm/i915/i915_gem_fence_reg.c
>     :doc: tiling swizzling details
> --
> 2.21.0
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch

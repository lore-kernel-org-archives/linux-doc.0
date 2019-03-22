Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A96B87D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 22 Mar 2019 17:56:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728563AbfCVR4Q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 22 Mar 2019 13:56:16 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40148 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbfCVR4P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 22 Mar 2019 13:56:15 -0400
Received: by mail-lf1-f66.google.com with SMTP id u68so1981369lff.7
        for <linux-doc@vger.kernel.org>; Fri, 22 Mar 2019 10:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PAk363DYf+KC20/ypoh36Mrm+ABIuRbIAGe2gqauIc4=;
        b=CRL4VMFj6rGbr8do1XrgApDTQwILz0sEk3Hv+zHgUklKRo2LLjh3s2O2KawMQYnZKS
         2JImjt6TBXu+Gp1sKnXCEab/KDkW/FTp8xQILsUVnYOam+/WKXQVx0SqIb5+O/lnlVGM
         uD7QX2dOp9sfQjw1WdGeEx6aBlb/uMqee7YJ/UijbM/qZbc2CGnUOnYJwCPZZHhhuBv3
         D6kdEFWPp3d+7j+B5mbRJVwV1Ibioa47w+xUqrKK91fWj/9ABS6IR94ARG7BA8Ay9y+X
         fbTinwyXiSm9ArHiV9dBWZ1WREIpBLLhj/pAscblnP6uVFKX8+Pb1aJzzRLK9CyiXE+/
         6v0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PAk363DYf+KC20/ypoh36Mrm+ABIuRbIAGe2gqauIc4=;
        b=M8KkmcFDeaCjd/qg5Ndt0kr53zPDbiVGCC7XzBZoGjvKiuaUGWN414rxFEz5TLtnHS
         W1zwdGbAogcbghsdv3TPIHJ9+tIHLhbjT1PXD4Vn3YWqJv8bpqa4w3J3gZSuyfUqY863
         iB8ZcE5IVk0BvKmvhtcdL5PpWchnAwNPca/1WbwSbEt7lIYxg4O451CQ6l6YW3Y8lgZS
         LTkRU9XtudXjl0skTiFpPNxhJKPwDG3ISCnUFs8g9ygipF1HhsAq90RMn8MirWeoIgvY
         /l1ZKX2DBJba0JwPbGHDI6qB457hmbzMHPROKL6L74UJP1bTYQk9MQAoLPplKyBXVcFJ
         AUmg==
X-Gm-Message-State: APjAAAXtO8NEq+03MkFhQHa+oOZcM78sIvIhImHViN5EKo0CBUZAxKom
        plMeKKJIXV+wsug42sLAp8OJLQ==
X-Google-Smtp-Source: APXvYqyVMVdiEfweKyLfreRyyWifvfBUmXeguKIjzlElC98sMzo12D3bgpYE9wE2zVF8cuMQVdKdHw==
X-Received: by 2002:ac2:5381:: with SMTP id g1mr5781238lfh.130.1553277372912;
        Fri, 22 Mar 2019 10:56:12 -0700 (PDT)
Received: from centauri.lan (h-229-118.A785.priv.bahnhof.se. [5.150.229.118])
        by smtp.gmail.com with ESMTPSA id m4sm1774402ljc.28.2019.03.22.10.56.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 22 Mar 2019 10:56:11 -0700 (PDT)
Date:   Fri, 22 Mar 2019 18:56:10 +0100
From:   Niklas Cassel <niklas.cassel@linaro.org>
To:     Sean Christopherson <sean.j.christopherson@intel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Tobin C . Harding" <me@tobin.cc>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Joe Perches <joe@perches.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4] docs: Clarify the usage and sign-off requirements for
 Co-developed-by
Message-ID: <20190322175610.GA25944@centauri.lan>
References: <20190322155735.13954-1-sean.j.christopherson@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190322155735.13954-1-sean.j.christopherson@intel.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 22, 2019 at 08:57:35AM -0700, Sean Christopherson wrote:
> The documentation for Co-developed-by is a bit light on details, e.g. it
> doesn't explicitly state that:
> 
>   - Multiple Co-developed-by tags are perfectly acceptable
>   - Co-developed-by and Signed-off-by must be paired together
>   - SOB ordering should still follow standard sign-off procedure
> 
> Lack of explicit direction has resulted in developers taking a variety
> of approaches, often lacking any intent whatsoever, e.g. scattering SOBs
> willy-nilly, collecting them all at the end or the beginning, etc...
> Tweak the wording to make it clear that multiple co-authors are allowed,
> and document the expectation that standard sign-off procedures are to
> be followed.
> 
> The use of "original author" has also led to confusion as many patches
> don't have just one "original" author, e.g. when multiple developers
> are involved from the genesis of the patch.  Remove all usage of
> "original" and instead call out that Co-developed-by is simply a way to
> provide attribution in addition to the From tag, i.e. neither tag is
> intended to imply anything with regard to who did what.
> 
> Provide examples to (hopefully) eliminate any ambiguity.
> 
> Cc: Tobin C. Harding <me@tobin.cc>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Cc: Jonathan Cameron <jic23@kernel.org>
> Cc: Joe Perches <joe@perches.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Niklas Cassel <niklas.cassel@linaro.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Signed-off-by: Sean Christopherson <sean.j.christopherson@intel.com>
> ---
> 
> v1: https://lkml.kernel.org/r/20190320151140.32432-1-sean.j.christopherson@intel.com
> v2: https://lkml.kernel.org/r/20190321184316.8525-1-sean.j.christopherson@intel.com
>     Rewrite the blurb to state standard sign-off procedure should be
>     followed as opposed to dictating the original author's SOB be last.
> v3: https://lkml.kernel.org/r/20190321200103.9333-1-sean.j.christopherson@intel.com
>     Update a similar blurb in Documentation/process/5.Posting.rst
> v4: Rework the blurbs to avoid use of the word "original" [Tobin]
> 
>  Documentation/process/5.Posting.rst          | 10 +++--
>  Documentation/process/submitting-patches.rst | 40 +++++++++++++++++---
>  2 files changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> index 4213e580f273..d2da09372563 100644
> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst
> @@ -216,10 +216,12 @@ The tags in common use are:
>     which can be found in :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`
>     Code without a proper signoff cannot be merged into the mainline.
>  
> - - Co-developed-by: states that the patch was also created by another developer
> -   along with the original author.  This is useful at times when multiple
> -   people work on a single patch.  Note, this person also needs to have a
> -   Signed-off-by: line in the patch as well.
> + - Co-developed-by: states that the patch was co-created by several developers;
> +   it is a used to give attribution to co-authors (in addition to the author
> +   atrributed by the From: tag) when multiple people work on a single patch.

fwiw

s/atrributed/attributed/

> +   Every Co-developed-by: must be immediately followed by a Signed-off-by: of
> +   the associated co-author.  Details and examples can be found in
> +   :ref:`Documentation/process/submitting-patches.rst <submittingpatches>`.
>  
>   - Acked-by: indicates an agreement by another developer (often a
>     maintainer of the relevant code) that the patch is appropriate for
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index be7d1829c3af..06db26b12495 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -545,10 +545,40 @@ person it names - but it should indicate that this person was copied on the
>  patch.  This tag documents that potentially interested parties
>  have been included in the discussion.
>  
> -A Co-developed-by: states that the patch was also created by another developer
> -along with the original author.  This is useful at times when multiple people
> -work on a single patch.  Note, this person also needs to have a Signed-off-by:
> -line in the patch as well.
> +Co-developed-by: states that the patch was co-created by multiple developers;
> +it is a used to give attribution to co-authors (in addition to the author
> +attributed by the From: tag) when several people work on a single patch.  Since
> +Co-developed-by: denotes authorship, every Co-developed-by: must be immediately
> +followed by a Signed-off-by: of the associated co-author.  Standard sign-off
> +procedure applies, i.e. the ordering of Signed-off-by: tags should reflect the
> +chronological history of the patch insofar as possible, regardless of whether
> +the author is attributed via From: or Co-developed-by:.  Notably, the last
> +Signed-off-by: must always be that of the developer submitting the patch.
> +
> +Note, the From: tag is optional when the From: author is also the person (and
> +email) listed in the From: line of the email header.
> +
> +Example of a patch submitted by the From: author::
> +
> +	<changelog>
> +
> +	Co-developed-by: First Co-Author <first@coauthor.example.org>
> +	Signed-off-by: First Co-Author <first@coauthor.example.org>
> +	Co-developed-by: Second Co-Author <second@coauthor.example.org>
> +	Signed-off-by: Second Co-Author <second@coauthor.example.org>
> +	Signed-off-by: From Author <from@author.example.org>
> +
> +Example of a patch submitted by a Co-developed-by: author::
> +
> +	From: From Author <from@author.example.org>
> +
> +	<changelog>
> +
> +	Co-developed-by: Random Co-Author <random@coauthor.example.org>
> +	Signed-off-by: Random Co-Author <random@coauthor.example.org>
> +	Signed-off-by: From Author <from@author.example.org>
> +	Co-developed-by: Submitting Co-Author <sub@coauthor.example.org>
> +	Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
>  
>  
>  13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
> @@ -696,7 +726,7 @@ A couple of example Subjects::
>  The ``from`` line must be the very first line in the message body,
>  and has the form:
>  
> -        From: Original Author <author@example.com>
> +        From: Patch Author <author@example.com>
>  
>  The ``from`` line specifies who will be credited as the author of the
>  patch in the permanent changelog.  If the ``from`` line is missing,
> -- 
> 2.21.0
> 

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B356BC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 12:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240924AbhLJMYg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 07:24:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240915AbhLJMYc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 07:24:32 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59565C061746
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 04:20:57 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id u1so14540814wru.13
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 04:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dyQr2ti9ilz8ECo57KSkq4lKgtmyn1SiEY3nHitXJS0=;
        b=kKlHf5ufFGS3lqJB0CYLdtxRM/+Zd2tF1TIonrt1jLM+uzJlRXxND1cQdMa32DXTuO
         PzTGfW9C1I3/pc0hVC20gfSSv4NVqqyRBjtjWZ6xN2e4WRN/Jcyr/zEOSLQmVA7njKdP
         bbzHxOzNuuE90WMuTIpCk+QzC08zm6Kl8x6wVbkI0vIQH/EkiBWjVZ4KZUgQ6VaaLjLj
         x7AhE+bd9XDLpJLrmUUEUgJYVZ77YOSLERwlB+A+V0laaJPbnRnEbBMFURiwHl73QnyF
         WyC+HTA2khTn7xXjZZlpQTZdiiJHYsj6LNwEN3ipEtxvvleQIxbefQPQ4y3wJxxy1VAv
         rbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dyQr2ti9ilz8ECo57KSkq4lKgtmyn1SiEY3nHitXJS0=;
        b=ElS71W5xWlOrzkUjSBjj+LbZquSNstiXkLV/2gjLza7I7AuxNBdFmpej7ERkOAyORi
         ZgHpfe40SwP0ZNvZ7zLfVv6q4z2CTYwCyjWe7zS9v+D6ljXegnnTe4yjx2p30NLzC7BH
         fntAJGqtAFIwuxmKCJXeLVzrL7iHLI4dkqRuwXlXtuyG6DojJWNPmpTuHytAcwtQVy1b
         QNC85KO6mq3BcQMXHG6mwkK8Xfn8HzzsHFeCuCOdTHjvkjGqwg1TpFlONUJLtqgtjMHa
         ef/uOR17q04wmQH0sOHMWAlXCqIKYhFy09zSzc/YJTCC8IZf8mdP5ZSkMnksh0rm0Hyi
         O/1w==
X-Gm-Message-State: AOAM530iF6HL7kn70pAuhmyD/QGa0avenR3rgvRZeettr7wtk99VBJ1x
        UCINdVI7Cr0skH4JZP9ZR3AGaQ==
X-Google-Smtp-Source: ABdhPJzECZyx1gn+Wvql4o7TK0rM8yLNSUmec05SdRZaiWptYAmqVraN+IU+1m90aCiisoO//e59oQ==
X-Received: by 2002:adf:cd02:: with SMTP id w2mr13812551wrm.269.1639138855743;
        Fri, 10 Dec 2021 04:20:55 -0800 (PST)
Received: from google.com ([2a00:79e0:d:209:57bd:f79b:724a:8b02])
        by smtp.gmail.com with ESMTPSA id b14sm3164792wrd.24.2021.12.10.04.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 04:20:54 -0800 (PST)
Date:   Fri, 10 Dec 2021 12:20:50 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans de Goede <hdegoede@redhat.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Andrew Scull <ascull@google.com>,
        Will Deacon <will@kernel.org>
Subject: Re: DRM? Re: [PATCH v2 2/2] misc: dice: Add driver to forward
 secrets to userspace
Message-ID: <YbNGIimUI7Cagvwe@google.com>
References: <20211209151123.3759999-1-dbrazdil@google.com>
 <20211209151123.3759999-3-dbrazdil@google.com>
 <20211209194807.GB28088@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209194807.GB28088@duo.ucw.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Pavel,

On Thu, Dec 09, 2021 at 08:48:07PM +0100, Pavel Machek wrote:
> Hi!
> 
> > +config DICE
> > +	tristate "Open Profile for DICE driver"
> > +	depends on OF_RESERVED_MEM
> > +	help
> > +	  This driver allows to ownership of a reserved memory region
> > +	  containing DICE secrets and expose them to userspace via
> > +	  a character device.
> > +
> 
> Explaining what DICE is (and what Open Profile is) would be useful.
Sure, I'll expand the description.

> I see it is for some kind of DRM? Why is in non-evil and why do we
> want it in Linux?
Best to think of this as an extension to verified boot where each boot
stage signs the hashes of the software it loaded. The certificate is
what's passed in this reserved memory region. It is used in the context
of confidential computing for remote attestation, and it is very similar
to the EFI-based approach from IBM for SEV:
https://lore.kernel.org/all/20211007061838.1381129-1-dovmurik@linux.ibm.com/

There's a link to the project's documentation in the cover letter with
much more technical detail if you're interested.

-David



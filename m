Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 245D5C432BE
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 18:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F03360F38
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 18:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240639AbhHDSq3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Aug 2021 14:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240405AbhHDSpv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Aug 2021 14:45:51 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19FBBC06179F
        for <linux-doc@vger.kernel.org>; Wed,  4 Aug 2021 11:45:32 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id e5so4005204pld.6
        for <linux-doc@vger.kernel.org>; Wed, 04 Aug 2021 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/EQmTGydF1pIXOESNrwErzBdNg9CrOE9Mxb8eJMGl6U=;
        b=lYgtUH8iYVPqtvlrViEDj4VisTlI5BAnqJr+1CvEvld5nN6Rr/R75P9DnspBYe8FOA
         GvhNwqEoUnzWPmWB8A28qBG6O+IKvGIoCEYJ6HWqGjl3m6xhmUIME+FBpli2J/sYtzb1
         0ZM6tR/MN7vxyJQIPM8zHlHp4FJpGRdzghkChnowHjsbAY5DD7MPKN9e8dHGqkCH26t5
         WoEAW9u+JDUK+G5crAlmyWI+HlNoFIGDM03OwBFC3JWb/rfC5H7glsPCimWq1uuR/C9O
         85bW3wAHCCflHFpo+vNcqoFkuW/Vp97Wprb+sMzRVocNrGf+R482OPaB/PGxZE/4Zaoa
         GVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/EQmTGydF1pIXOESNrwErzBdNg9CrOE9Mxb8eJMGl6U=;
        b=rz8Qxw+u4M7F7to6e1aJDT6+uc0oGWXKYEAPvoMShn2SooozQ/SBDLBaUDBfBhseiu
         sut/7KruO2POMRLM6ACQA+fdXfiFvGALGrqC/VnxKFBw8CxPcCgRSNm6sABqSYy4vnpu
         ztnkKjV8WlQyTe0dWytPYYCGGJt9g1xhccItcUdpSqLvdi57LybOjnIbmqK5AKqASfhz
         Yc/+K7wSxSbrH78jTrgi9cVJGY9YbkjzxTzvFiKbC9evMJihpcEwEF9AOkOWA+ynvrTn
         da/cR0Vl7yqxnH1VZ0rKIUMuQzuFSfbPMIagbSFEM8aIM0R8eYaNkpA65c3GmPKNRQt1
         6SDA==
X-Gm-Message-State: AOAM530kdsfF5XNU+YFny/nSpIKCUF6lgXcsrMpGa1vJ8w38Rqppd8Pk
        J+gcHpWmAOnxrfFkDasTINo+y9jvZCMNI63UhtojdQ==
X-Google-Smtp-Source: ABdhPJwRABacfDbCANpEBh/SV7ISPXsw4UJ7/x0n6pmLObYtDw0FF3GTHMwnbKk4Jkn/qvdLfv0uzAtpGu6zUY49kjA=
X-Received: by 2002:a63:3c7:: with SMTP id 190mr530402pgd.240.1628102731653;
 Wed, 04 Aug 2021 11:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210804174322.2898409-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YQrXhnHJCsTxiRcP@casper.infradead.org>
In-Reply-To: <YQrXhnHJCsTxiRcP@casper.infradead.org>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 4 Aug 2021 11:45:20 -0700
Message-ID: <CAPcyv4hW7nxffn0s8OKOh=GfK3AO_CvgRvuYs8vOQ8B4PCW24A@mail.gmail.com>
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 4, 2021 at 11:09 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Aug 04, 2021 at 10:43:22AM -0700, Kuppuswamy Sathyanarayanan wrote:
> > +/* Driver allow list */
> > +static LIST_HEAD(driver_allow_list);
> > +/* Driver deny list */
> > +static LIST_HEAD(driver_deny_list);
>
> Why use a doubly-linked-list here?  An allocating xarray should perform
> much better and use less memory.

Sounds reasonable to me.

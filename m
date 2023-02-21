Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35FADC64EC7
	for <linux-doc@archiver.kernel.org>; Tue, 21 Feb 2023 18:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbjBUSSM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Feb 2023 13:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbjBUSSM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Feb 2023 13:18:12 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1768EA5E5
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 10:18:11 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id b14so2467448ior.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Feb 2023 10:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUNt3Ol5shKiy1nHOYbokPC4KRoWdgPPUE/ehJvDV1w=;
        b=SJ6IUbCWEHmdLuE28QLs+57LLNuHJNpObRBBvlOywNHZv9kq8iJZHLLrkbGLvTXFm9
         5HwhJqxqoMqxcDWhPGwm+xvorPbPBFpZ4i9MOdop8PON589iOmDue+ugYewjpmhouNmA
         4vbP5poiWqakA1EnQ/NqwSWe5R772ZmbXnvl4a085XAw8ZS1dpResaITDFOib/Ourts6
         T3Q3xzrRsFeweARBA9rr8+37okEvbUFyv/PC8h7h0cu1bS3vga/EQRtJdTXcS/tQOFvS
         hALjs3SB4tMOhM+jgMaqAsbl2OOS2nSFNy3IDn2Lai7EPSK8whGXHA2MPNsYrYUZf3oI
         V3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUNt3Ol5shKiy1nHOYbokPC4KRoWdgPPUE/ehJvDV1w=;
        b=clCTpkZQYZnEzWoTAbTcnvAIO9kCFuHcTlIKpwRm+El9f8h530wqheLKydW5GRH5vg
         0pT8GJn+yb/+l4ioPLCNEEh+Pi+4OMdnnOP8aTVHG3WJNso6rApmm6ddvVtph532pAEa
         70rWjNQPdO1wpt4N4XeQdZbSnPY5u+SZrHthioYnvjLir6u3620qy+HMAj9wilS7nGDd
         ipHC7fxnTgLyFhhZla6YmirNwOjtyWiJUVrFYacvDIDPq0El8UXrY8UChKRfw9bfm3Ps
         fojKmXWgPOol3dGlVkaojb6cYXtCpQj82KU5FcTWSlV4Qs1C3hEbCHuhaTGDaZHd0uTx
         LvUQ==
X-Gm-Message-State: AO0yUKWI+MRth799Ir+y2+yh9/5XNF8KL9zJygtg1g4X8Wpij6RqHXpJ
        Yar67L30aNvhSpe3BEsWu3d2C961t0i7ogF/6wM=
X-Google-Smtp-Source: AK7set9x2egFzIZm5YHo/fABOpZSL9F5vaosKdOytLdw69pxy4vcogWRKbJjhjxDBH86+7DwO5Sxbg==
X-Received: by 2002:a6b:a11:0:b0:740:72dd:1617 with SMTP id z17-20020a6b0a11000000b0074072dd1617mr11377357ioi.14.1677003490200;
        Tue, 21 Feb 2023 10:18:10 -0800 (PST)
Received: from google.com ([2620:15c:183:200:6558:edf8:99c2:7857])
        by smtp.gmail.com with ESMTPSA id w3-20020a5d8443000000b00745bc07f527sm1111473ior.10.2023.02.21.10.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:18:09 -0800 (PST)
Date:   Tue, 21 Feb 2023 11:18:05 -0700
From:   Ross Zwisler <zwisler@google.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: broken link in bpf/bpf_devel_QA
Message-ID: <Y/UK3e1nq1EDoBeM@google.com>
References: <Y++09LKx25dtR4Ow@google.com>
 <Y/GRSd/ZfFGnGQ+4@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/GRSd/ZfFGnGQ+4@debian.me>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Feb 19, 2023 at 10:02:33AM +0700, Bagas Sanjaya wrote:
> On Fri, Feb 17, 2023 at 10:10:12AM -0700, Ross Zwisler wrote:
> > Hi,
> > 
> > I was checking out this page:
> > 
> > https://docs.kernel.org/bpf/bpf_devel_QA.html
> > 
> > and noticed that we have two links to .rst pages that are getting converted to
> > links in different ways.  This one:
> > 
> >   See the kernels selftest `Documentation/dev-tools/kselftest.rst`_
> >   document for further documentation.
> > 
> > is getting converted to a full external link:
> > 
> >   <p>See the kernels selftest <a class="reference external"
> >   href="https://www.kernel.org/doc/html/latest/dev-tools/kselftest.html">Documentation/dev-tools/kselftest.rst</a>
> >   document for further documentation.</p>
> > 
> > While this one:
> > 
> >   Finally to ensure support for latest BPF Type Format features -
> >   discussed in `Documentation/bpf/btf.rst`_
> > 
> > Is left as a short local link to a nonexistent .rst page:
> > 
> >   <p>Finally to ensure support for latest BPF Type Format features - discussed
> >   in <a class="reference external"
> >   href="btf.rst">Documentation/bpf/btf.rst</a> 
> > 
> > <snipped>...
> > 
> > Given that the page source for these two links are basically the same:
> > 
> >  `Documentation/dev-tools/kselftest.rst`
> >  and
> >  `Documentation/bpf/btf.rst`
> > 
> > I'm guessing this is an issue with how Sphinx is generating the resulting
> > html, probably because it's trying to generate a more 'local' sort link for
> > the btf.rst page?
> 
> I see that the issue is due to link handling when the external link
> target is actually internal link sibling (i.e. the same level as doc where
> the target is link from).
> 
> The fix is to simply use internal link mechanism. I will send the patch
> as reply to this message shortly.
> 
> Thanks.

Thanks for the quick fix!

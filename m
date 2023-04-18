Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D90EC77B71
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 10:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbjDRKS4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 06:18:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231135AbjDRKSv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 06:18:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01B8E72A2
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681813081;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MG0Nr2BMXXdUPGLSdXJQNTH3SV8FDEpzwmgkuk+rqoY=;
        b=IuAYB32CiihbOyX452xUqm2oGGadRoE+R7KfEbV64D0sUjrW4piWuu7iVeeWai6NuTrbYA
        OF74GXfU9YcQm5jLuDriLEUjhfn4zCLifMl7zYauoOhJHxT1gQb+FToz9ndrihBued6b/e
        nE5p4OXRv+A25XtRqIBRuHWPlk/hMx8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-9mpqpbHKM1GjPcsi3jrAYQ-1; Tue, 18 Apr 2023 06:17:59 -0400
X-MC-Unique: 9mpqpbHKM1GjPcsi3jrAYQ-1
Received: by mail-wm1-f69.google.com with SMTP id n19-20020a05600c501300b003f16fda66d9so185732wmr.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 03:17:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681813078; x=1684405078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG0Nr2BMXXdUPGLSdXJQNTH3SV8FDEpzwmgkuk+rqoY=;
        b=EK91lp827yX3ghv6miyvdbse8nPHl7rlY7IJRbr2TFg+yOTaaVUPhv4ElpMpZj35Rv
         lN/WPUhQQjothmyolvKJ1aNDbwyofWFF2cz3+hAs4cjhEL3f+c0uilJIFXcADVXbwyea
         R+x6vtk56sSQXSJCOfMT4P+kzyS8DezWL3ltf8E8tzL6vM04/w6eXq+JLoOoJnFxSWf2
         cNqHXfDXaIYEMXicFU69oGTsc1FgNz8SFAqtkr5UayX5ofMnTN88FJQUBRePPGJAshnS
         w7FBqpfJvxXzqwJC7gOIG5t5/MrVJVUVorernZldhvVAjYnjaGAQ3nS/VSXR/3HaDqRa
         YTrg==
X-Gm-Message-State: AAQBX9dR5FP/yRBJVI9KBONbGbULed9uSsC8hDx5yfdjCOmOkpdQtrUB
        DY/QkrUKQaSL/hggbEstYovLfkMUukgtl6fpw9UFS8plfDFvJeTGTk3115GRXh4ifDM24AtOfyL
        h19MI4zIeiO1kGqTWWxOZ
X-Received: by 2002:a05:600c:cf:b0:3f1:6ec5:bc6f with SMTP id u15-20020a05600c00cf00b003f16ec5bc6fmr7229573wmm.24.1681813078644;
        Tue, 18 Apr 2023 03:17:58 -0700 (PDT)
X-Google-Smtp-Source: AKy350Ym6ZWQyN42luCGewFwsYwO8ohz8iOoGYg/73E3FSOB8LN2mYA6Z4LDEdHP8XSeA1LCBedC9w==
X-Received: by 2002:a05:600c:cf:b0:3f1:6ec5:bc6f with SMTP id u15-20020a05600c00cf00b003f16ec5bc6fmr7229554wmm.24.1681813078298;
        Tue, 18 Apr 2023 03:17:58 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id a8-20020a5d4568000000b002f61f08a9a6sm12351042wrc.50.2023.04.18.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 03:17:57 -0700 (PDT)
Date:   Tue, 18 Apr 2023 12:17:55 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        James Chapman <jchapman@katalix.com>, tparkin@katalix.com,
        edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PPPoL2TP: Add more code snippets
Message-ID: <ZD5uU8Wrz4cTSwqP@debian>
References: <20230416220704.xqk4q6uwjbujnqpv@begin>
 <ZD5V+z+cBaXvPbQa@debian>
 <20230418085323.h6xij7w6d2o4kxxi@begin>
 <ZD5dqwPblo4FOex1@debian>
 <20230418091148.hh3b52zceacduex6@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418091148.hh3b52zceacduex6@begin>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 18, 2023 at 11:11:48AM +0200, Samuel Thibault wrote:
> Guillaume Nault, le mar. 18 avril 2023 11:06:51 +0200, a ecrit:
> > On Tue, Apr 18, 2023 at 10:53:23AM +0200, Samuel Thibault wrote:
> > > Guillaume Nault, le mar. 18 avril 2023 10:34:03 +0200, a ecrit:
> > > > PPPIOCBRIDGECHAN's description
> > > > belongs to Documentation/networking/ppp_generic.rst, where it's already
> > > > documented.
> > > 
> > > Yes but that's hard to find out when you're looking from the L2TP end.
> > 
> > That's why I proposed linking to ppp_generic.rst.
> 
> Yes, but it's still not obvious to L2TP people that it's a ppp channel
> that you have to bridge. Really, having that 20-line snippet available
> would have saved me some head-scratching time.

But the reverse is also true: someone looking at the PPP documentation
is probably not going to realise that PPP sample code have been put in
the L2TP doc.

We can instead add PPP specific code in the PPP documentation. Then add
a line in l2tp.rst saying something like "Handling of the PPP layer is
described in ppp_generic."

If you feel like having sample code for a full example covering the
whole process of creating and setting up the file descriptiors needed
for bridging PPP channels (UDP, L2TP tunnels, L2TP sessions and PPP
channels, and why not PPPoE), then I feel a specific file would be more
indicated, as this would cross several different subsystems.

It'd be okay to to have a few PPP-specific calls in l2tp.rst since
L2TPv2 is tied to PPP and that could give a more complete example of
how to use the L2TP uAPI. But that should be limitted to the most basic
PPP features (creating a channel and a unit).

> Samuel
> 


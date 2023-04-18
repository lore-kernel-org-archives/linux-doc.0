Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EE0C77B75
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 09:08:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231221AbjDRJIi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 05:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231315AbjDRJIT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 05:08:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3DD7AA9
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 02:07:15 -0700 (PDT)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-ofmqb7H6NRyZui1cH-uXmQ-1; Tue, 18 Apr 2023 05:06:55 -0400
X-MC-Unique: ofmqb7H6NRyZui1cH-uXmQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-3f08ed462c0so36557845e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 02:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681808814; x=1684400814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRNrCYgGB848z5UzPrsHH5olhsaYvQSEqVGi0dF9+RM=;
        b=kBhkDjuIzNTrc0Ildq6NBkGaK/Jtdy9XZP5a6Hay/fOeCMS3URCUF9rqWNYfIvSrLO
         X9sxmX0JaEyS9AceIsrgAbfagWpC/lUnwtg6mO8HOIOxLadAZTDqYBQfEb3npmiv+ec3
         WJk2JOE6Hp/PxbzXcU4+DJbBqu3gi0Oue/STNTslcIwu7RyP7FoU0PxHOdMsIC3W+fP5
         uW9296Idqk8MO2d2fydOcPQ0Qlbvnl43EFPDbaIaM611TTUfQW/lDwL33eM/vVtR5Rok
         Z4zH7tCBm5iuUvwNuXivhDF2DcSzv8CPdlh8X6uXcFWLu95QLyxWeFf7IoS/gxITTz1/
         LO9g==
X-Gm-Message-State: AAQBX9fzghA6dKoNJwxCCAKixC7K+pVGUNZd+xfYbEVodqOXD+gblzrP
        NDGXn56kiPQvCCkLnyxqkiGuszwxBeXYJ41fCd5ulKu2o0lGbJc1tO8zrVXuPuGjdorcfL5NudK
        z8hPIDHOoiR7dSENkh3i4
X-Received: by 2002:adf:e946:0:b0:2f4:e2d5:401 with SMTP id m6-20020adfe946000000b002f4e2d50401mr1519790wrn.25.1681808814379;
        Tue, 18 Apr 2023 02:06:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350bz/rwcsf+s+AD4QbxZIhyM+n7t/iwWgYMWM6XYFAl0LJK2SNq+DkwwG58Zh35mwMuSCxt1rw==
X-Received: by 2002:adf:e946:0:b0:2f4:e2d5:401 with SMTP id m6-20020adfe946000000b002f4e2d50401mr1519763wrn.25.1681808814032;
        Tue, 18 Apr 2023 02:06:54 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id x13-20020a5d60cd000000b002c54c9bd71fsm12429777wrt.93.2023.04.18.02.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 02:06:53 -0700 (PDT)
Date:   Tue, 18 Apr 2023 11:06:51 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        James Chapman <jchapman@katalix.com>, tparkin@katalix.com,
        edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PPPoL2TP: Add more code snippets
Message-ID: <ZD5dqwPblo4FOex1@debian>
References: <20230416220704.xqk4q6uwjbujnqpv@begin>
 <ZD5V+z+cBaXvPbQa@debian>
 <20230418085323.h6xij7w6d2o4kxxi@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418085323.h6xij7w6d2o4kxxi@begin>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 18, 2023 at 10:53:23AM +0200, Samuel Thibault wrote:
> Guillaume Nault, le mar. 18 avril 2023 10:34:03 +0200, a ecrit:
> > On Mon, Apr 17, 2023 at 12:07:04AM +0200, Samuel Thibault wrote:
> > >          sax.sa_family = AF_PPPOX;
> > >          sax.sa_protocol = PX_PROTO_OL2TP;
> > >          sax.pppol2tp.fd = tunnel_fd;
> > > @@ -406,12 +407,64 @@ Sample userspace code:
> > >          /* session_fd is the fd of the session's PPPoL2TP socket.
> > >           * tunnel_fd is the fd of the tunnel UDP / L2TPIP socket.
> > >           */
> > > -        fd = connect(session_fd, (struct sockaddr *)&sax, sizeof(sax));
> > > -        if (fd < 0 ) {
> > > +        ret = connect(session_fd, (struct sockaddr *)&sax, sizeof(sax));
> > > +        if (ret < 0 ) {
> > 
> > Now you also need to close session_fd.
> 
> ? No, we need it for PPPIOCGCHAN, and also PPPIOCGL2TPSTATS.

connect() failed. You can't do anything with this socket.

> I'll put return session_fd instead.

What's the point of returning session_fd if connect() failed?
How will the caller know if session_fd is connected or not?
Why would it even be interested in a half-created session fd?

> > > +The ppp<ifunit> interface can then be configured as usual with SIOCSIFMTU,
> > > +SIOCSIFADDR, SIOCSIFDSTADDR, SIOCSIFNETMASK, and activated by setting IFF_UP
> > > +with SIOCSIFFLAGS
> > > +
> > > +  - Tunnel switching is supported by bridging channels::
> > 
> > This is a PPP feature not an L2TP one.
> > 
> > PPPIOCBRIDGECHAN's description
> > belongs to Documentation/networking/ppp_generic.rst, where it's already
> > documented.
> 
> Yes but that's hard to find out when you're looking from the L2TP end.

That's why I proposed linking to ppp_generic.rst.

> > If necessary, you can link to ppp_generic.rst here.
> > 
> > Also, calling this feature 'tunnel switching' is misleading.
> 
> That's how I have seen it is called in L2TP jargon.

That still doesn't describe the kernel feature. We can add a 'so called
"tunnel switching" in L2TP jargon' into parenthesis to give a hint to
the people using this terminology.

> Samuel
> 


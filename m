Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A77D6C77B71
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 08:35:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjDRIf2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 04:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231166AbjDRIfZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 04:35:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAB61FCA
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 01:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681806852;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Rv7GgXtXE5BwsWMierc+FyeJxK2YpNxYqQW013L/+7M=;
        b=W3iqFd9RCEULWTJM7LDbwdM4juYzExrJi6Ft5iTL75e0R/4m+W32ryvTehA9PzyTdNHBVv
        lLlhwzHyDbfz8y4TZlkt6KFdhxuldZ4u76HBKcaupdIxNUDFgXuGyefM7KCLRPcsZ5Wx4G
        bOi1tthT7CZh3MwYimXen44ju1gRW8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-XTUZFhw2O8uRw2AfvXJcxw-1; Tue, 18 Apr 2023 04:34:08 -0400
X-MC-Unique: XTUZFhw2O8uRw2AfvXJcxw-1
Received: by mail-wm1-f70.google.com with SMTP id az39-20020a05600c602700b003f172e1d5bbso2698301wmb.9
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 01:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681806847; x=1684398847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv7GgXtXE5BwsWMierc+FyeJxK2YpNxYqQW013L/+7M=;
        b=BbI/U3oG00g5TkEYNDxpf2MizklSw1gm23gV3W/y6Q3pwBTK6qHSN41iWtkjpsKv54
         ONIrlKNAIeMg9syWsvt3I6oEDV9Q3iBHxayCZZCg6EuEEYTuQsaQRmQkH7yFi9bqBr3Q
         hauE9vBVCjfRDH00Ze1lu5rVNzuRb8mENTR6upQ/LfOaUpW2OVg3OOe9HjxnQLa9I62b
         o2HDcmOeSHFfywJKSmceoJThafDiXH7qun91Co4icVWSBzxtKFzhXHBPKtjLWOiOeFVd
         M0wv0g3IyiU3G5csemdbJgv/u4iVrtN0ei0/IREAgl6V+D/+Mc4Fo4QAKOisAgSk3eDO
         V9AA==
X-Gm-Message-State: AAQBX9dEpBi4xfWBp2y57tIsfFZKYoJD97vc0q6+8FJJqES69suLiwWv
        KRgoEKmy78tO8GsyEB4pcmEyvZaqsmJxX7TRuhNsNIOty/wm3N7aWtlZNcxV3JM+dMdnMHAd0Rt
        MEtq5qXzYJmhB7zpnW/QL
X-Received: by 2002:a1c:cc05:0:b0:3ef:d8c6:4bc0 with SMTP id h5-20020a1ccc05000000b003efd8c64bc0mr12024313wmb.40.1681806847536;
        Tue, 18 Apr 2023 01:34:07 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZAnXaPSvYcMlsYfwVlVoREfFWc5IGmWbn2t4pTzfp2bAd1gmhgH/3mQQN/vZnl6zfILt9UWw==
X-Received: by 2002:a1c:cc05:0:b0:3ef:d8c6:4bc0 with SMTP id h5-20020a1ccc05000000b003efd8c64bc0mr12024293wmb.40.1681806847207;
        Tue, 18 Apr 2023 01:34:07 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id c7-20020a05600c0a4700b003ef4cd057f5sm18266803wmq.4.2023.04.18.01.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 01:34:06 -0700 (PDT)
Date:   Tue, 18 Apr 2023 10:34:03 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        James Chapman <jchapman@katalix.com>, tparkin@katalix.com,
        edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PPPoL2TP: Add more code snippets
Message-ID: <ZD5V+z+cBaXvPbQa@debian>
References: <20230416220704.xqk4q6uwjbujnqpv@begin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230416220704.xqk4q6uwjbujnqpv@begin>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 17, 2023 at 12:07:04AM +0200, Samuel Thibault wrote:
> The existing documentation was not telling that one has to create a PPP
> channel and a PPP interface to get PPPoL2TP data offloading working.
> 
> Also, tunnel switching was not described, so that people were thinking
> it was not supported, while it actually is.
> 
> Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
> 
> ---
>  Documentation/networking/l2tp.rst |   59 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 56 insertions(+), 3 deletions(-)
> 
> --- a/Documentation/networking/l2tp.rst
> +++ b/Documentation/networking/l2tp.rst
> @@ -387,11 +387,12 @@ Sample userspace code:
>    - Create session PPPoX data socket::
>  
>          struct sockaddr_pppol2tp sax;
> -        int fd;
> +        int ret;
>  
>          /* Note, the tunnel socket must be bound already, else it
>           * will not be ready
>           */
> +        int session_fd = socket(AF_PPPOX, SOCK_DGRAM, PX_PROTO_OL2TP);

Please declare session_fd with the other variables.
Also, check the return value of the socket() call.

>          sax.sa_family = AF_PPPOX;
>          sax.sa_protocol = PX_PROTO_OL2TP;
>          sax.pppol2tp.fd = tunnel_fd;
> @@ -406,12 +407,64 @@ Sample userspace code:
>          /* session_fd is the fd of the session's PPPoL2TP socket.
>           * tunnel_fd is the fd of the tunnel UDP / L2TPIP socket.
>           */
> -        fd = connect(session_fd, (struct sockaddr *)&sax, sizeof(sax));
> -        if (fd < 0 ) {
> +        ret = connect(session_fd, (struct sockaddr *)&sax, sizeof(sax));
> +        if (ret < 0 ) {

Now you also need to close session_fd.

>                  return -errno;
>          }
>          return 0;
>  
> +  - Create PPP channel::
> +
> +        int chindx;
> +        ret = ioctl(session_fd, PPPIOCGCHAN, &chindx);
> +        if (ret < 0)
> +                return -errno;
> +
> +        int ppp_chan_fd = open("/dev/ppp", O_RDWR);
> +
> +        ret = ioctl(ppp_chan_fd, PPPIOCATTCHAN, &chindx);
> +        if (ret < 0)
> +                return -errno;
> +
> +Non-data PPP frames will be available for read on `ppp_chan_fd`.
> +
> +  - Create PPP interface::
> +
> +        int ppp_if_fd = open("/dev/ppp", O_RDWR);

Check for errors please.

> +
> +        int ifunit;

Also, keep kernel style formatting:
  * All variable declarations in one block (ordered from longest to
    shortest line).
  * New line between variable declarations and code.

> +        ret = ioctl(ppp_if_fd, PPPIOCNEWUNIT, &ifunit);

You need to initialise ifunit first.
Use -1 to let the kernel pick a free unit index.

> +        if (ret < 0)
> +                return -errno;
> +
> +        ret = ioctl(ppp_chan_fd, PPPIOCCONNECT, ifunit);
> +        if (ret < 0)
> +                return -errno;
> +
> +The ppp<ifunit> interface can then be configured as usual with SIOCSIFMTU,
> +SIOCSIFADDR, SIOCSIFDSTADDR, SIOCSIFNETMASK, and activated by setting IFF_UP
> +with SIOCSIFFLAGS
> +
> +  - Tunnel switching is supported by bridging channels::

This is a PPP feature not an L2TP one. PPPIOCBRIDGECHAN's description
belongs to Documentation/networking/ppp_generic.rst, where it's already
documented. If documentation needs to be improved, that should be done
there.

If necessary, you can link to ppp_generic.rst here.

Also, calling this feature 'tunnel switching' is misleading. Switching
happens between L2TP sessions (or more generally between any PPP
transports), not between L2TP tunnels (which are just L2TP session
multiplexers).


Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA845C77B75
	for <linux-doc@archiver.kernel.org>; Tue, 18 Apr 2023 08:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjDRIPE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Apr 2023 04:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjDRIPD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Apr 2023 04:15:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C898BB0
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681805648;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=EGmsPhYqXkM4h3lS3j2J6rFOa5Kg9NoDZ6FuRnesr/A=;
        b=iaw/6TJLdbYvGXwx0bXs16DbnLaz1v+KxiwzeqCt9LxH/B7XarWtg3YNX6z+55zdi5qxwh
        0PeVLrLUjavEZJx/bm8gw5KMtU1BEBmwgzn3xhHqoHgHIiHqq8TxUCRnNbok4pW9BUlgHz
        V1rsLqcs4w6b7vV3DoFzx3Wbh9a4UhE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-OZFrH3MTOjeBnujwNbIirQ-1; Tue, 18 Apr 2023 04:14:05 -0400
X-MC-Unique: OZFrH3MTOjeBnujwNbIirQ-1
Received: by mail-wm1-f72.google.com with SMTP id c20-20020a05600c171400b003f173d94427so2393268wmn.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Apr 2023 01:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681805644; x=1684397644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EGmsPhYqXkM4h3lS3j2J6rFOa5Kg9NoDZ6FuRnesr/A=;
        b=Rc5mfmNaeB4haaBXr8hEAd6IfQ+owfgupTS2BtJpppcSVyKI9HtBSqg85F7ZtiAm3n
         AoZLtFf2UhvJOGkXsdGqbdxMvW/ulq0FUHJ0s94Q57YkrNlVN8NfpLD+J6a5IajdChXX
         otqXDqmzQfgNVxds4GQ/jRjPASsCThJfRFsz/Fj1CTV666hFxug/ct4Z76viFXYh03rC
         lZlxze3fVix2awIjHv7B81c9kaVUug94n3jjVxs3mnV4+HcKGcI4069I9sfsV8dqIVQC
         A5Y6nZs2Ns4PUwf7LQqKuXflL1aSlLgq8kY2H4kmBj9xtaagjrvCpaylWEEJJC2n2DU1
         WHhw==
X-Gm-Message-State: AAQBX9fUvGfRUUB9HOTCz4zJ9HdDUSID97A9/pz+m7RmTp7DImgtAR9v
        KVQyFCcXSZG4vpQwwfI/DZj6Oa2pDQd7WffH5yGbcHm6m2T23snX28679DLduBxap4eHWMZz680
        +QyKHActHdGrdZN0Up3SD
X-Received: by 2002:a7b:cc94:0:b0:3f0:5beb:6f0 with SMTP id p20-20020a7bcc94000000b003f05beb06f0mr12966604wma.18.1681805644137;
        Tue, 18 Apr 2023 01:14:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350aA7v1tMPmHJ6euPAD3upj/mGQ0RZG5O7DSucBbGroxI9JcIp3kDKJehA+p1y5A4FmxtBeLPQ==
X-Received: by 2002:a7b:cc94:0:b0:3f0:5beb:6f0 with SMTP id p20-20020a7bcc94000000b003f05beb06f0mr12966578wma.18.1681805643836;
        Tue, 18 Apr 2023 01:14:03 -0700 (PDT)
Received: from debian ([92.62.32.42])
        by smtp.gmail.com with ESMTPSA id q25-20020a05600c331900b003f17b91c3adsm90863wmp.28.2023.04.18.01.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 01:14:03 -0700 (PDT)
Date:   Tue, 18 Apr 2023 10:14:00 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Dominique Martinet <asmadeus@codewreck.org>
Cc:     Samuel Thibault <samuel.thibault@ens-lyon.org>,
        James Chapman <jchapman@katalix.com>, tparkin@katalix.com,
        edumazet@google.com, davem@davemloft.net, kuba@kernel.org,
        pabeni@redhat.com, corbet@lwn.net, netdev@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PPPoL2TP: Add more code snippets
Message-ID: <ZD5RSOrpUusamkQv@debian>
References: <20230416220704.xqk4q6uwjbujnqpv@begin>
 <ZDx2IUYTmLSdzU6D@codewreck.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZDx2IUYTmLSdzU6D@codewreck.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 17, 2023 at 07:26:41AM +0900, Dominique Martinet wrote:
> Samuel Thibault wrote on Mon, Apr 17, 2023 at 12:07:04AM +0200:
> (That somewhat makes it sounds like the "new" netlink interface cannot
> be used (e.g. ip command); although I guess sommeone implementing this
> would be more likely to use the ioctls than not so having the names can
> be a timesaver?)

I don't understand what you mean by 'the "new" netlink interface'. You
can create a PPP interface either with the PPPIOCNEWUNIT ioctl or with
netlink. But no matter how you create it, you need a /dev/ppp file
descriptor associated to the PPP network device. Other than that, and
no matter how you create them, PPP network devices can be used and
configured like any other network interface. You absolutely can use
"ip link" to manage you ppp interfaces.


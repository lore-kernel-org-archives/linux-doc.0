Return-Path: <SRS0=87kO=6F=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EC8C54FD0
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 12:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48FE1206B8
	for <linux-doc@archiver.kernel.org>; Tue, 21 Apr 2020 12:38:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CBU1r5Bh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgDUMil (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 21 Apr 2020 08:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728285AbgDUMil (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Apr 2020 08:38:41 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B27C061A41
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 05:38:41 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id k11so16311172wrp.5
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2020 05:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dEtMSnugQ0Yz8dEGP0UAZ0gmicmpiHlS1EX56QRmSxU=;
        b=CBU1r5Bh/z0btpExs9JQcV1xmQKPX8pt2qs5S2PKDBCXn+8oq/3Zit1BDOlY7ZtHVB
         ZCt35gvpxp/b8ZMio6jsNpYxm9V49VDog66VLWJzup6N0BP23SIeZGpN1PNnbePNh3t/
         9wA20fyU9sIL6UZfl+s7XPNkO7+Nuxq4JbL00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dEtMSnugQ0Yz8dEGP0UAZ0gmicmpiHlS1EX56QRmSxU=;
        b=AT04V6K7LwRkVv19l8rAl8vf4QaqSVYS7nWNYqXOjR1sbcSibIGgxkZwUN3h1BRKdN
         61zzv4oZDpNKEOesa+cQRDee1VP6rybGHZwqM54olz+EPV2A+BCKvdAviTsV/bIozb2I
         rrrZKW/BqmURnYXXyORx59QHcAjQ4EUh1x7fU4gLrGEtU9RLLygyAy3bm8P9GIfKAmyZ
         JjZLSeEpGWuYMF2dqmA27PnKwj/bK1YkkM8QazDiPY+vbNtHv7oSd5YOOtL526Ra0vhG
         0ILPX8/eY5PlV4tljiksUn18CihjY7DAZ47yKpgnXqFp728eqIDdt5sWckbRhps8EX+3
         Np0w==
X-Gm-Message-State: AGi0Pua/BfKd7WD3oTenMTHmxrB3IMNtEFqAdorW9h10emwSf6WQ+/0a
        Sc9nWmk+egGRw32gyeK58kgXuA==
X-Google-Smtp-Source: APiQypIzvmkA09MwByYqroH0B7xqF5CSvHdVyYFGv6atnXmAXLQdkPPxOvWpKImiQh189bdrvWfWOA==
X-Received: by 2002:a05:6000:10c4:: with SMTP id b4mr3232873wrx.203.1587472719979;
        Tue, 21 Apr 2020 05:38:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k3sm4000288wru.90.2020.04.21.05.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 05:38:39 -0700 (PDT)
Date:   Tue, 21 Apr 2020 14:38:37 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Gal Pressman <galpress@amazon.com>, linux-doc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] dma-buf: Couple of documentation typo fixes
Message-ID: <20200421123837.GZ3456981@phenom.ffwll.local>
References: <20200420074115.23931-1-galpress@amazon.com>
 <20200420170059.5a42693e@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200420170059.5a42693e@lwn.net>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 20, 2020 at 05:00:59PM -0600, Jonathan Corbet wrote:
> On Mon, 20 Apr 2020 10:41:15 +0300
> Gal Pressman <galpress@amazon.com> wrote:
> 
> > Fix a couple of typos: "as" -> "has" and "int" -> "in".
> > 
> > Signed-off-by: Gal Pressman <galpress@amazon.com>
> 
> Applied, thanks.

Also applied to drm-misc-next, the dma-buf stuff is maintained as part of
drm. And maybe I actually get around to doing the doc polish for all
things dma-buf that I've been promised to do since months :-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

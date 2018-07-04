Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BDD477DF93
	for <lwn-linux-doc@archive.lwn.net>; Wed,  4 Jul 2018 08:10:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932788AbeGDIKN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 4 Jul 2018 04:10:13 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40660 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932548AbeGDIIL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 4 Jul 2018 04:08:11 -0400
Received: by mail-ed1-f66.google.com with SMTP id e19-v6so3396266edq.7
        for <linux-doc@vger.kernel.org>; Wed, 04 Jul 2018 01:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=w66l6tz+r9p4F+Eoe4KThD6XXTh3DwUn+pN+Ovv0ArA=;
        b=fq4DnXrU9XfzzdzAnxiW9bpfRcYcKQ2ZwlsPkbG4+UFrySbzX7JrLhzBqoWuSgk8Px
         f7c5M/CpUgJT2mehgkzrWcePFOT9KZ+DO92XdBqWkyefpfN5UFvMxMe0SFF3Xb8MjBKa
         XCulOex7ut42nVMCAVxAvktVHNz4CIumsc4gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=w66l6tz+r9p4F+Eoe4KThD6XXTh3DwUn+pN+Ovv0ArA=;
        b=KO4OIpWJizeRkpaXMxqmCn4v+5hIlvfm+rNJ7cwrzSIxeoTmtxtp7qbpXZpLFvgQJX
         etNLPVdBhSTpkrW7WpfpDP4poJk1y0Obb1+YFqhe7qZNHrYw9/LfQuatNejYCyNH/kH1
         C0VpUR9YS1XgGyDLwYDU35qEH4uGE0I2fobdOAvRyGsxcvcRkhL/QooQHfOuXfnllBrl
         bRlvphThx4q1P2hwquu0l2G1zp0iuodeXddcYdkXXjYL1e1lCua3i3MnodFBd34gtZO7
         WTnVZQ2/4fR3RlHeo8WLJTst8ZjvZ7tT5SmZKwL0xeZ+9k68coi4JptZ6SC0+6A++lWt
         DuLw==
X-Gm-Message-State: APt69E2xpccDwyPwnSq0diLMNNFgnvtylvrHWIg2Y98kNSrkQVnJOxqP
        TnSpuim5n7kRIBVdQrPYKNl6Rg==
X-Google-Smtp-Source: AAOMgpdcHbRDLZ3ijVt1yc51ifPGGVOJD83Y+RN5OB+aRLji3Y4YzJQtYVu+CL0a7CEBuUKQ+bweYg==
X-Received: by 2002:a50:bb41:: with SMTP id y59-v6mr1683861ede.10.1530691690319;
        Wed, 04 Jul 2018 01:08:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:5628:0:496f:7dc5:66d7:a057])
        by smtp.gmail.com with ESMTPSA id j34-v6sm1656944edd.2.2018.07.04.01.08.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jul 2018 01:08:09 -0700 (PDT)
Date:   Wed, 4 Jul 2018 10:08:07 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Gerd Hoffmann <kraxel@redhat.com>
Cc:     dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v6] Add udmabuf misc device
Message-ID: <20180704080807.GH3891@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Shuah Khan <shuah@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
        "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
References: <20180703075359.30349-1-kraxel@redhat.com>
 <20180703083757.GG7880@phenom.ffwll.local>
 <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180704055338.n3b7oexltaejqmcd@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.16.0-2-amd64 
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 04, 2018 at 07:53:38AM +0200, Gerd Hoffmann wrote:
> On Tue, Jul 03, 2018 at 10:37:57AM +0200, Daniel Vetter wrote:
> > On Tue, Jul 03, 2018 at 09:53:58AM +0200, Gerd Hoffmann wrote:
> > > A driver to let userspace turn memfd regions into dma-bufs.
> > > 
> > > Use case:  Allows qemu create dmabufs for the vga framebuffer or
> > > virtio-gpu ressources.  Then they can be passed around to display
> > > those guest things on the host.  To spice client for classic full
> > > framebuffer display, and hopefully some day to wayland server for
> > > seamless guest window display.
> > > 
> > > qemu test branch:
> > >   https://git.kraxel.org/cgit/qemu/log/?h=sirius/udmabuf
> > > 
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> > > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > 
> > I think some ack for a 2nd use-case, like virtio-wl or whatever would be
> > really cool. To give us some assurance that this is generically useful.
> 
> Tomeu?  Laurent?
> 
> > Plus an ack from dma-buf folks (nag them on irc, you don't have them on Cc
> > here).
> 
> Hmm, does MAINTAINERS need an update then?  Maintainer and mailing lists
> listed in the "DMA BUFFER SHARING FRAMEWORK" entry are on Cc.

Yeah, maintainers entry with you as maintainer plus dri-devel as mailing
list plus drm-misc as repo would be good. Just grep for drm-misc.git for
tons of examples.

> Who should be Cc'ed?

dim add-missing-cc ftw :-)

Cheers, Daniel
> 
> > Then this is imo good to go.
> > 
> > I assume you'll push it to drm-misc, like all the other dma-buf stuff?
> 
> Can do that, sure, after collecting the acks ...
> 
> thanks,
>   Gerd
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-doc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

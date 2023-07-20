Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1143EEB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 06:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjGTGWF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 02:22:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbjGTGWE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 02:22:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 487872122
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 23:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689834072;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=G7E15ZRYXK8CY2BMMBkch1JiRHBbdCSXbkVcaEUkyro=;
        b=ZAHP5lvCC9jkMysuoECumfiAj5WqhO5P7dk9R3u3mIQfXyRJD0Ug0nYn0agH9oKjhCK60+
        H4nxU8Dkvwg76VrPgBguVZnTB52394aJbRt0gbTzII84v5kON4C8W8yvSA1YcHZVEy3iBr
        KDG42R+P17brhY2UjDl1Vfk27xiNLgU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-KC4f1xj8OGyFhYlJkN75RQ-1; Thu, 20 Jul 2023 02:21:11 -0400
X-MC-Unique: KC4f1xj8OGyFhYlJkN75RQ-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30e6153f0eeso245261f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Jul 2023 23:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689834070; x=1690438870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G7E15ZRYXK8CY2BMMBkch1JiRHBbdCSXbkVcaEUkyro=;
        b=d3Bn+Mmd2HFvGMqaZQ6WqrG3n83mqQ5uiILrXjrCIddjSVPXBT5URHDLrWYc8rXG/z
         Q7GBT23CnEQQmB6ZpNjdMWP3+7QbpjoYfzRM4+Uxyqb4Y4HvUhSyozTa5BLb75P44MNo
         vKpL2zry7firdg5f5xHQV2Ddo84y+sogN1pVbcwK8xu9KDzAIrSLDi6xV0ukmBGDIbFt
         YXMeqFfowh9WfUdpQkJoD2iQtppzborp35JEGRBBTNKJrsBuc8qRLKDw85xd6TbmqbN2
         DPh7mQgwfMdd3fDrqCaL/bbOfn7U9ahXqlowV2fJTcYLg3n2yR36HeVbb41AcDnDP8lh
         LtfQ==
X-Gm-Message-State: ABy/qLaPHuEM2u1sMiDrZE8d2l3w4KKqBTrr9A6SstNDk2a1Yazp8m0v
        ldpsFuuO1NiQKdTNFkajTJiiwyvD9kkticavMM7AnFbhjFDyJLPI/Wi6mwrmzHqRtBczRxu3SYN
        Rx1aqdPSBSYv3BPfbKNug
X-Received: by 2002:a5d:6650:0:b0:315:9d38:3698 with SMTP id f16-20020a5d6650000000b003159d383698mr1245134wrw.61.1689834069853;
        Wed, 19 Jul 2023 23:21:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG72m49mtoIQRQmV7z3WrUBtsy50We3+bRwUIZdneZE1EVzG3ahYCSi5gjl2F65adK7buUGoA==
X-Received: by 2002:a5d:6650:0:b0:315:9d38:3698 with SMTP id f16-20020a5d6650000000b003159d383698mr1245122wrw.61.1689834069571;
        Wed, 19 Jul 2023 23:21:09 -0700 (PDT)
Received: from redhat.com ([2a02:14f:172:65c:3b05:aa8f:9ec2:7e3e])
        by smtp.gmail.com with ESMTPSA id w10-20020adfd4ca000000b003140f47224csm286661wrk.15.2023.07.19.23.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 23:21:08 -0700 (PDT)
Date:   Thu, 20 Jul 2023 02:21:05 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH] dma: DMA_ATTR_SKIP_CPU_SYNC documentation tweaks
Message-ID: <20230720021914-mutt-send-email-mst@kernel.org>
References: <98ef4f76d7a5f90b0878e649a70b101402b8889d.1689761699.git.mst@redhat.com>
 <20230720060742.GA2987@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720060742.GA2987@lst.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 20, 2023 at 08:07:42AM +0200, Christoph Hellwig wrote:
> On Wed, Jul 19, 2023 at 06:15:59AM -0400, Michael S. Tsirkin wrote:
> > A recent patchset highlighted to me that DMA_ATTR_SKIP_CPU_SYNC
> > might be easily misunderstood.
> 
> .. just curious: what patchset is that?  DMA_ATTR_SKIP_CPU_SYNC is
> often a bad idea and all users probably could use a really good
> audit..

Message-Id: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>


Looks like there's really little else can be done: there's a
shared page we allow DMA into, so we sync periodically.
Then when we unmap we really do not need that data
synced again.

What exactly is wrong with this?


> >  #define DMA_ATTR_NO_KERNEL_MAPPING	(1UL << 4)
> >  /*
> > - * DMA_ATTR_SKIP_CPU_SYNC: Allows platform code to skip synchronization of
> > - * the CPU cache for the given buffer assuming that it has been already
> > - * transferred to 'device' domain.
> > + * DMA_ATTR_SKIP_CPU_SYNC: Allows platform code to skip synchronization of the
> > + * CPU and device domains for the given buffer.
> 
> While we're at it, I think "allows" is the wrong word here, we really
> must skip the synchronization or else we're in trouble.

Hmm could you explain? I thought multiple sync operations are harmless.

-- 
MST


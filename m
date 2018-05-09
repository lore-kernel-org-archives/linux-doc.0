Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 67DD17DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 12:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934777AbeEIMBE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 08:01:04 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42172 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751052AbeEIMBC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 08:01:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=6+UcR/8jLxgFOKWNkdDZuoeQHF/8UMwDcfVHTCweXHg=; b=VqnYop9zWVOajXK5Q4mnrjlzB
        CrJGK97pp/q2DjyU2lKEk8FSeVg6pFtrjxW8k5DrPD+rGgJVnnUGmm9AhA3AsWAIFo0DOJPYDpzee
        RGzVcZZY+l7M7qDc0Lx+lvvZQlY05Ij9vI8+uSWljgHAAWrY3bRvlYDPsR9cfVvap+mj3hhWyoRjv
        EJ7aH6gqPudsOBm9OOsoBy1gmOxSjpDzXjnrMxoU0LdvfhN9+e4z0zA9srwNJwhCD6O2C9b+ZMyuJ
        5PCTzYMVFRynLomoklPDonJvik5c3CP7AAzcBAs7ZV8gmGKlYvVkcMRumt7b/rp7lEgLdCeVe/3Oz
        czNOOhnZA==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGNmH-0006wX-7I; Wed, 09 May 2018 12:01:01 +0000
Date:   Wed, 9 May 2018 09:00:57 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org
Subject: Re: [PATCH 15/18] iio: iio.h: use nested struct support on
 kernel-doc markup
Message-ID: <20180509090057.23051846@vento.lan>
In-Reply-To: <20180507180803.21e967b2@archlinux>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <1a31240699b1b6ee089b5b36889ab27ae14ad94e.1525684985.git.mchehab+samsung@kernel.org>
        <20180507180803.21e967b2@archlinux>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 7 May 2018 18:08:03 +0100
Jonathan Cameron <jic23@kernel.org> escreveu:

> On Mon,  7 May 2018 06:35:51 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > Solve those Sphinx warnings:
> > 
> >     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.sign' not described in 'iio_chan_spec'
> >     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.realbits' not described in 'iio_chan_spec'
> >     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.storagebits' not described in 'iio_chan_spec'
> >     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.shift' not described in 'iio_chan_spec'
> >     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.repeat' not described in 'iio_chan_spec'
> >     ./include/linux/iio/iio.h:270: warning: Function parameter or member 'scan_type.endianness' not described in 'iio_chan_spec'
> > 
> >     ./include/linux/iio/iio.h:191: WARNING: Unexpected indentation.
> >     ./include/linux/iio/iio.h:192: WARNING: Block quote ends without a blank line; unexpected unindent.
> >     ./include/linux/iio/iio.h:198: WARNING: Definition list ends without a blank line; unexpected unindent.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>  
> Great thanks.  I couldn't figure out how to do this last time
> I looked at it.

Support for nested structs were only recently introduced :-)

> 
> Applied to the togreg branch of iio.git and pushed out as testing for
> the autobuilders to ignore it.

Thanks!
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

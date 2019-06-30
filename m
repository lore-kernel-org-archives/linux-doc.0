Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D15F87D2EF
	for <lwn-linux-doc@archive.lwn.net>; Sun, 30 Jun 2019 17:32:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfF3Rcq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 30 Jun 2019 13:32:46 -0400
Received: from ms.lwn.net ([45.79.88.28]:46734 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726572AbfF3Rcq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 30 Jun 2019 13:32:46 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 699722CF;
        Sun, 30 Jun 2019 17:32:45 +0000 (UTC)
Date:   Sun, 30 Jun 2019 11:32:43 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Sheriff Esseson <sheriffesseson@gmail.com>
Cc:     skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        darrick.wong@oracle.com, linux-xfs@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [linux-kernel-mentees] [PATCH v1] Doc : fs : convert xfs.txt to
 ReST
Message-ID: <20190630113243.7265c33e@lwn.net>
In-Reply-To: <20190630165046.GB5193@localhost>
References: <20190630165046.GB5193@localhost>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, 30 Jun 2019 17:50:46 +0100
Sheriff Esseson <sheriffesseson@gmail.com> wrote:

> On Sat, Jun 29, 2019 at 09:57:59PM +0100, Sheriff Esseson wrote:
> > Signed-off-by: Sheriff Esseson <sheriffesseson@gmail.com>
> > ---
> > 
> > In v3:
> > Update MAINTAINERS. Fix Indentation/long line issues. Insert Sphinx tag.
> > 
> > -- 
> > 2.22.0
> >   
> 
> Signed-off-by: Sheriff Esseson <sheriffesseson@gmail.com>
> ---
> 
> In v4:
> dax.txt : 
> 	fix broken reference to xfs.rst

I will now repeat what I said yesterday:

> Please do us a favor?  
> 
> 1) Post each patch standalone, without quoted text, ready to be applied.
> 
> 2) Wait a little while between postings so that you can address more than
> one comment at a time.
> 
> OK, two favors - off-by-one errors are my specialty...:)

I did actually mean that.  For "a little while" I meant "a few days or
so".  Please slow down a little.  In any case, we're getting closer to the
merge window, so this patch won't be applied for a while regardless.

Thanks,

jon

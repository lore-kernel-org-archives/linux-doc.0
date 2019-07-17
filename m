Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6016F7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 17 Jul 2019 12:30:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbfGQMab (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Jul 2019 08:30:31 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:54442 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQMaa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Jul 2019 08:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=D3yTnN8AkZ3Z3ILxtVx4CVwqbGSwtLMgR8TBHVoiD/0=; b=lEkvQudgPYomC7wLmtHgDLUoU
        gijgSpLa7oOBJQFIkxEnBL2fDYPM7/2fbPj0ZgsWyIZXin5LWWrbktVdWOSrtMas8qUWoV1hPlQoN
        rYCxYSN8LKuLIpqncnThwXzJ+r5DLFxBTOCCGL1fs9G1chYuzsReelh5AgaRVfGBBm7Bkv2SIcpoE
        4GFeKpg8cYw+TgwjZZQ4e+ZBA99WfByo7ThCcEr0rL1RJiUxOnrDF+fO5Pzed6icp48EcPtKPxZnJ
        oEqbYpQsDzEh1C05Hke/9+0oj0me7Utk1oQ4byfpt0r6BflKQUm+dVKJt9PIJ57MztmekausNAWY2
        hsMCIlcBg==;
Received: from [191.33.154.161] (helo=coco.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hnj4m-0001JN-NN; Wed, 17 Jul 2019 12:30:29 +0000
Date:   Wed, 17 Jul 2019 09:30:25 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Markus Heiser <markus.heiser@darmarit.de>
Cc:     gregkh@linuxfoundation.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 06/20] docs: kernel_abi.py: fix UTF-8 support
Message-ID: <20190717093025.443ecbf7@coco.lan>
In-Reply-To: <fd4ae75a-3cb3-3f26-8891-e503451355b9@darmarit.de>
References: <cover.1563360659.git.mchehab+samsung@kernel.org>
        <4967544f097ebce823133b1dad0ff374ba1a4fbb.1563360659.git.mchehab+samsung@kernel.org>
        <fd4ae75a-3cb3-3f26-8891-e503451355b9@darmarit.de>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 17 Jul 2019 13:44:40 +0200
Markus Heiser <markus.heiser@darmarit.de> escreveu:

> Hi Mauro,
> 
> just nitpicking ..
> 
> Am 17.07.19 um 13:05 schrieb Mauro Carvalho Chehab:
> > The parser breaks with UTF-8 characters with Sphinx 1.4.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> > ---
> >   Documentation/sphinx/kernel_abi.py | 20 +++++++-------------
> >   1 file changed, 7 insertions(+), 13 deletions(-)
> > 
> > diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> > index 32ce90775d96..0f3e51e67e8d 100644
> > --- a/Documentation/sphinx/kernel_abi.py
> > +++ b/Documentation/sphinx/kernel_abi.py
> > @@ -1,4 +1,5 @@
> > -# -*- coding: utf-8; mode: python -*-
> > +# coding=utf-8  
> 
> Can we use the more common::
> 
>    # -*- coding: utf-8 -*-
> 
> notation?  See [1] """using formats recognized by popular editors"""
> 
> If I'am not wrong,  I remember we had this 'magic comment' discussion in the past.

Changed. I ended by merging this change, together with the SPDX one at
the initial patch and did some other patch merges, in order to provide
a cleaner history.

Thanks,
Mauro

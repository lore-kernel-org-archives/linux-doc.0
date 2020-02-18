Return-Path: <SRS0=SFNS=4G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC4AC34026
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 10:07:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC76320722
	for <linux-doc@archiver.kernel.org>; Tue, 18 Feb 2020 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582020458;
	bh=5dUjEYMsKrdB1vCmUIFocwSYPGYIiPyhvc2OgSo0umA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=WZfA/+0XHp/cm4wzifprxFb8jiXuPMTcVsQyQCQVBb5jsS+ltoicFlhVKLMeFS3s6
	 x/uFwFjLPlEbbifxNDRXEs91w84EKVdSqrWGXK5wdSh7fU+TBFrzJi9CQyI49P8eKP
	 aOGKJ2ICi7BFINgH7kel0bCpWVr3lhjPW06zv2v0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgBRKHh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Feb 2020 05:07:37 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:35552 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgBRKHh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Feb 2020 05:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description;
        bh=+ubzgwWRDVP0Wr1vDpgnLvEPIoud36HG39FDLUrxEew=; b=c2w+DYLCNvLqziMvzOtrobTKYf
        4Ypb5Yrnz+Nm9jwFfhbEzWTLTYBz9HJLf8dsWoLrmcvAjjC2sFbm+z8ALu6p7TBFfPOze+pQETVN5
        VnNk8b+j7ooNNyXU7L9PuQEZHDFvWRiHRC91+af1Ro+rKTiWUOmhBY+24AkGtnJP93hhwZMztZpj0
        SiVu4L9pr6UtLl49udMEvnT4ytluxUVNBRwLxHsk+3ExmNzWN73xoqIETW84cJiyOEfgPzNXJUNoH
        1C4U8UQ0OMzJ9gxtqJAKV08nviuWkoygbbwg9WElVAIppTtu9/KssmN6dzYINtY5flnyLrxYwwfHc
        Y6rzL6zQ==;
Received: from tmo-109-126.customers.d1-online.com ([80.187.109.126] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j3zmx-0005ab-64; Tue, 18 Feb 2020 10:07:35 +0000
Date:   Tue, 18 Feb 2020 11:07:31 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Joseph Qi <joseph.qi@linux.alibaba.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-fsdevel@vger.kernel.org, Mark Fasheh <mark@fasheh.com>,
        Joel Becker <jlbec@evilplan.org>, ocfs2-devel@oss.oracle.com
Subject: Re: [PATCH 12/44] docs: filesystems: convert dlmfs.txt to ReST
Message-ID: <20200218110731.2890658d@kernel.org>
In-Reply-To: <3b40d7d4-3798-08db-220d-b45704ada48a@linux.alibaba.com>
References: <cover.1581955849.git.mchehab+huawei@kernel.org>
        <efc9e59925723e17d1a4741b11049616c221463e.1581955849.git.mchehab+huawei@kernel.org>
        <3b40d7d4-3798-08db-220d-b45704ada48a@linux.alibaba.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Tue, 18 Feb 2020 09:21:51 +0800
Joseph Qi <joseph.qi@linux.alibaba.com> escreveu:

> On 20/2/18 00:11, Mauro Carvalho Chehab wrote:

> > @@ -96,14 +101,19 @@ operation. If the lock succeeds, you'll get an fd.
> >  open(2) with O_CREAT to ensure the resource inode is created - dlmfs does
> >  not automatically create inodes for existing lock resources.
> >  
> > +============  ===========================
> >  Open Flag     Lock Request Type
> > ----------     -----------------  
> 
> Better to remove the above line.
> 
> > +============  ===========================
> >  O_RDONLY      Shared Read
> >  O_RDWR        Exclusive
> > +============  ===========================
> >  
> > +
> > +============  ===========================
> >  Open Flag     Resulting Locking Behavior
> > ----------     --------------------------  
> 
> Ditto.

Ok. So, I guess we can just merge the two tables into one, like:

	============  =================
	O_RDONLY      Shared Read
	O_RDWR        Exclusive
	O_NONBLOCK    Trylock operation
	============  =================

Right?

Cheers,
Mauro

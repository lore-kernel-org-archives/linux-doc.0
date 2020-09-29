Return-Path: <SRS0=tD+q=DG=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DB6AC4741F
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 19:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16A4121548
	for <linux-doc@archiver.kernel.org>; Tue, 29 Sep 2020 19:08:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="dJuYu1b4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbgI2TIT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Sep 2020 15:08:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728498AbgI2TIS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Sep 2020 15:08:18 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B36C9C0613D2
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 12:08:18 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id 19so4512943qtp.1
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2020 12:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ubN7nDZwcIPlTTYHe5FaCTt3Iw6Y7lTVBnmXQgBCqO4=;
        b=dJuYu1b4GUdaRAFl3BrJoBgZhhuqb3ew4gTbyPaC+SO4QId0/YLmHm+BWdFQNUTHCN
         L9NQY1+GFtFJqHEKvGnFkC2Dy4IPF5CnhPdGd1fJszGf2ZEQyJm499vH4e8pQEkhZkNe
         2DA5AGCGBIVaHfJ2KSjtfpAdAoDFhc7KfUehLdrNdZNzp7zM6DG9gKPeZLSAAyv8mDVl
         6LjPHZfWBe23kDrmbBzukp9kCLteTNknBCHhp/K2k8vAvDlmvu6tVwUL2Z8h3CQsuLPu
         oVz7EFQEHFCPwkbdjkjpRbqYdjNZc9ospOvLohv3eVaMAiEhwk52DkB8bYh1WLBukhsM
         YDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ubN7nDZwcIPlTTYHe5FaCTt3Iw6Y7lTVBnmXQgBCqO4=;
        b=OzmcLH9i6wdC2bHinbJcvaulKB1XIBOChpZhuCz1wskSPFhyqpxF3gj0cd4f1wYykp
         HGMhe/gXVs/0MdKOueCYgA1l2jBv1xzRME/2+dZuEToa28neSgEokRixea2b6qr1kDdN
         PDTnP07GGvcLu7GuWjmkssSlmXwYdPOxAQfuR4GkDM6ogzMMw7qQ+fD++Ykarx1e/OjL
         Jn8ZMq8vQJlN9Nzf+tVdBOUttv/dTJElmOej/s54fbqBD6EsQ0q5FEenF6WAccgpQpm/
         /zqx2zxdxOe5VZtdSy54TPOVIv2eSgkUcqBpPq02i1wGHdBTro5js1aIE56riDSrS5nJ
         7o6A==
X-Gm-Message-State: AOAM532K2LMiLPIJjzxaDWhNF6ynPw1hjzeCheGDHakT9T2p9N6VgDaC
        6riycidvl+HoNyqp7EvZ8WHfjg==
X-Google-Smtp-Source: ABdhPJycYyIQXPXHmrimJcfRCfX8unjWqtXljPgcHzqOrxl8KM8vlavGzhbBfP33+3I4oV8FDS/vHA==
X-Received: by 2002:ac8:1763:: with SMTP id u32mr4951171qtk.14.1601406497766;
        Tue, 29 Sep 2020 12:08:17 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net. [156.34.48.30])
        by smtp.gmail.com with ESMTPSA id t20sm5804267qke.79.2020.09.29.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 12:08:17 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1kNKz2-003Exd-Hx; Tue, 29 Sep 2020 16:08:16 -0300
Date:   Tue, 29 Sep 2020 16:08:16 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
        Ralph Campbell <rcampbell@nvidia.com>,
        Shuah Khan <shuah@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH 2/8] selftests/vm: use a common gup_test.h
Message-ID: <20200929190816.GY9916@ziepe.ca>
References: <20200928062159.923212-1-jhubbard@nvidia.com>
 <20200928062159.923212-3-jhubbard@nvidia.com>
 <20200928125739.GP9916@ziepe.ca>
 <6481e78f-c70d-133a-ff4a-325b5cd8fd5d@nvidia.com>
 <20200929163507.GV9916@ziepe.ca>
 <aab477bf-4353-5e6b-4cc9-9872c9376ed2@nvidia.com>
 <20200929175524.GX9916@ziepe.ca>
 <715c49ec-d2a8-45cb-8ace-c6b1b4b8f978@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <715c49ec-d2a8-45cb-8ace-c6b1b4b8f978@nvidia.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 29, 2020 at 11:59:55AM -0700, John Hubbard wrote:
> On 9/29/20 10:55 AM, Jason Gunthorpe wrote:
> > On Tue, Sep 29, 2020 at 10:44:31AM -0700, John Hubbard wrote:
> > > On 9/29/20 9:35 AM, Jason Gunthorpe wrote:
> > > > On Mon, Sep 28, 2020 at 01:10:24PM -0700, John Hubbard wrote:
> > > > > On 9/28/20 5:57 AM, Jason Gunthorpe wrote:
> > > > > > On Sun, Sep 27, 2020 at 11:21:53PM -0700, John Hubbard wrote:
> ...
> > > I don't see any "gcc -m" type of dependency generation pass happening
> > > in this relatively simple Make system.
> > 
> > It happens with -MD, all the deps are stored in files like mm/.init-mm.o.cmd
> > and sucked into the build.
> 
> You are thinking of kbuild. This is not kbuild. There are no such artifacts
> being generated.

Oh. Really? That's horrible.

Jason

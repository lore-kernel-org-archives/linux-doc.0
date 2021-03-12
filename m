Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BE4C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 16:32:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE2416501A
	for <linux-doc@archiver.kernel.org>; Fri, 12 Mar 2021 16:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbhCLQb4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:31:56 -0500
Received: from verein.lst.de ([213.95.11.211]:46238 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232054AbhCLQbz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 12 Mar 2021 11:31:55 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 932C668B05; Fri, 12 Mar 2021 17:31:52 +0100 (CET)
Date:   Fri, 12 Mar 2021 17:31:52 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     "Liu, Yi L" <yi.l.liu@intel.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        "Williams, Dan J" <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 02/10] vfio: Split creation of a vfio_device into init
 and register ops
Message-ID: <20210312163152.GA11384@lst.de>
References: <0-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com> <2-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com> <BN6PR11MB4068BDE65D5AA2A3E0A1200BC36F9@BN6PR11MB4068.namprd11.prod.outlook.com> <20210312142326.GA2356281@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210312142326.GA2356281@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 12, 2021 at 10:23:26AM -0400, Jason Gunthorpe wrote:
> This is rarely done, there should be a good reason to do it, as making
> a private structure in a container_of system requires another memory
> allocation.
> 
> 'struct device' has this for instance, look at the 'p' member.
> 
> In this case I can't see much value

Agreed.  Moving this code to the normal kernel pattern really not just
helps to find bugs and reduce complexity, but also makes it much easier
for random kernel developers to actually be able to understand the code.

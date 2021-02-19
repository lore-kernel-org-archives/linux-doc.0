Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0827CC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 22:59:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B62DD64E86
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 22:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhBSW6v convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Feb 2021 17:58:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:32209 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhBSW6v (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Feb 2021 17:58:51 -0500
IronPort-SDR: FKInaeRuTzRqKWUyS6NR7/DhL+mfDbvfRSaFYhPnZNVrvhj2dOk3RKDGKMoHINIQlb/S+gkV/M
 XilhL0N4TY2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="184044714"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; 
   d="scan'208";a="184044714"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 14:57:04 -0800
IronPort-SDR: 6ZGvPb5zOmo1LHc3Zhdomz6dsl5PlnzLiY94jlUlJY2IoeGfJl8KqwworlmgiUgED1y2GEQCXx
 pvFR3/wRjZyQ==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; 
   d="scan'208";a="440458360"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2021 14:57:04 -0800
Date:   Fri, 19 Feb 2021 14:59:40 -0800
From:   Jacob Pan <jacob.jun.pan@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Driver Review <linux-drivers-review@eclists.intel.com>,
        iommu@eclists.intel.com, Yi Liu <yi.l.liu@intel.com>,
        Raj Ashok <ashok.raj@intel.com>,
        "Tian, Kevin" <kevin.tian@intel.com>,
        Lu Baolu <baolu.lu@linux.intel.com>, Wu Hao <hao.wu@intel.com>,
        Yi Sun <yi.y.sun@intel.com>, Dave Jiang <dave.jiang@intel.com>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
        jacob.jun.pan@linux.intel.com
Subject: Re: [PATCH v4 01/16] docs: Document IO Address Space ID (IOASID)
 APIs
Message-ID: <20210219145940.0ad35b08@jacob-builder>
In-Reply-To: <87im6op1bp.fsf@meer.lwn.net>
References: <1613683288-89552-1-git-send-email-jacob.jun.pan@linux.intel.com>
        <1613683288-89552-2-git-send-email-jacob.jun.pan@linux.intel.com>
        <87im6op1bp.fsf@meer.lwn.net>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Fri, 19 Feb 2021 07:41:14 -0700, Jonathan Corbet <corbet@lwn.net> wrote:

> Jacob Pan <jacob.jun.pan@linux.intel.com> writes:
> 
> > IOASID is used to identify address spaces that can be targeted by device
> > DMA. It is a system-wide resource that is essential to its many users.
> > This document is an attempt to help developers from all vendors navigate
> > the APIs. At this time, ARM SMMU and Intel’s Scalable IO Virtualization
> > (SIOV) enabled platforms are the primary users of IOASID. Examples of
> > how SIOV components interact with the IOASID APIs are provided.
> >
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: linux-doc@vger.kernel.org
> > Cc: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> > Signed-off-by: Wu Hao <hao.wu@intel.com>
> > Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> > ---
> >  Documentation/driver-api/ioasid.rst | 696 ++++++++++++++++++++++++++++
> >  1 file changed, 696 insertions(+)
> >  create mode 100644 Documentation/driver-api/ioasid.rst  
> 
> A detail, but an important one: you need to add this new file to
> index.rst so it gets built as part of the kernel docs.
> 
will do for this and the cgroup one. thanks!

> Thanks,
> 
> jon


Thanks,

Jacob

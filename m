Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B104BC433DB
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 14:41:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 635EA64EB7
	for <linux-doc@archiver.kernel.org>; Fri, 19 Feb 2021 14:41:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhBSOl5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 19 Feb 2021 09:41:57 -0500
Received: from ms.lwn.net ([45.79.88.28]:49870 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229681AbhBSOl4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 19 Feb 2021 09:41:56 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C1BD860C;
        Fri, 19 Feb 2021 14:41:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C1BD860C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1613745675; bh=aoWX+izE5tRqQb9jArFT1Q+50JfwHjkXRYmTmmY5N3U=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rBnhDMv2KbhqePpps9XXnfY9ufRyI+WI1kAHpL7GxB7XFbhQ3UtoX9T+c6U1w7fV6
         UNdnB+gTVsXXD7pfHzgk9cHV+rLKO0j7cBynSlApRLi0Y3f1kuaSrJgUmhcmcrqT8O
         GXok2PfMm4UeqezX1y73iSSPBbhSrlBlIXKOu5tEpZSfZ6tv5YwowZ0QdTifEp97JS
         z87wqGUP04tauE8fW7D8Y1qbSaTnqAXJVrA76RoZM9NasIGLaDFSTHAF8Ns8ARMBRI
         b6QaIFSuZsueI1Q/U9gSQv9DnGtkZeWonH+o5YSYL7dwVgFQNSJbPKja8FQAkB3xhj
         7CQsoiOkwTx7Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jacob Pan <jacob.jun.pan@linux.intel.com>,
        Linux Driver Review <linux-drivers-review@eclists.intel.com>,
        iommu@eclists.intel.com
Cc:     Yi Liu <yi.l.liu@intel.com>, Raj Ashok <ashok.raj@intel.com>,
        "Tian, Kevin" <kevin.tian@intel.com>,
        Lu Baolu <baolu.lu@linux.intel.com>, Wu Hao <hao.wu@intel.com>,
        Yi Sun <yi.y.sun@intel.com>, Dave Jiang <dave.jiang@intel.com>,
        Jacob Pan <jacob.jun.pan@linux.intel.com>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v4 01/16] docs: Document IO Address Space ID (IOASID) APIs
In-Reply-To: <1613683288-89552-2-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1613683288-89552-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1613683288-89552-2-git-send-email-jacob.jun.pan@linux.intel.com>
Date:   Fri, 19 Feb 2021 07:41:14 -0700
Message-ID: <87im6op1bp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jacob Pan <jacob.jun.pan@linux.intel.com> writes:

> IOASID is used to identify address spaces that can be targeted by device
> DMA. It is a system-wide resource that is essential to its many users.
> This document is an attempt to help developers from all vendors navigate
> the APIs. At this time, ARM SMMU and Intel=E2=80=99s Scalable IO Virtuali=
zation
> (SIOV) enabled platforms are the primary users of IOASID. Examples of
> how SIOV components interact with the IOASID APIs are provided.
>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> Signed-off-by: Wu Hao <hao.wu@intel.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> ---
>  Documentation/driver-api/ioasid.rst | 696 ++++++++++++++++++++++++++++
>  1 file changed, 696 insertions(+)
>  create mode 100644 Documentation/driver-api/ioasid.rst

A detail, but an important one: you need to add this new file to
index.rst so it gets built as part of the kernel docs.

Thanks,

jon

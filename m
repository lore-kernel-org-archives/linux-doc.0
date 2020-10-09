Return-Path: <SRS0=YNrp=DQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA24EC433DF
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 15:33:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F545222D9
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 15:33:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389236AbgJIPdl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Oct 2020 11:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388811AbgJIPdk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Oct 2020 11:33:40 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 999DBC0613D2;
        Fri,  9 Oct 2020 08:33:40 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7BA9E60B;
        Fri,  9 Oct 2020 15:33:38 +0000 (UTC)
Date:   Fri, 9 Oct 2020 09:33:36 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Jan Kara <jack@suse.cz>, David Sterba <dsterba@suse.com>,
        <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Documentation: better locations for sysfs-pci,
 sysfs-tagging
Message-ID: <20201009093336.0d1385cd@lwn.net>
In-Reply-To: <20201009070128.118639-1-jhubbard@nvidia.com>
References: <20201009070128.118639-1-jhubbard@nvidia.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 9 Oct 2020 00:01:28 -0700
John Hubbard <jhubbard@nvidia.com> wrote:

> sysfs-pci and sysfs-tagging were mis-filed: their locations within
> Documentation/ implied that they were related to file systems. Actually,
> each topic is about a very specific *use* of sysfs, and sysfs *happens*
> to be a (virtual) filesystem, so this is not really the right place.
> 
> It's jarring to be reading about filesystems in general and then come
> across these specific details about PCI, and tagging...and then back to
> general filesystems again.
> 
> Move sysfs-pci to PCI, and move sysfs-tagging to networking. (Thanks to
> Jonathan Corbet for coming up with the final locations.)
> 
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

Applied, thanks.

jon

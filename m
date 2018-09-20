Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 663817D87C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 20 Sep 2018 17:08:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbeITWwb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 20 Sep 2018 18:52:31 -0400
Received: from ms.lwn.net ([45.79.88.28]:46898 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726128AbeITWwb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 20 Sep 2018 18:52:31 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 54A692EF;
        Thu, 20 Sep 2018 17:08:04 +0000 (UTC)
Date:   Thu, 20 Sep 2018 11:08:02 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, olof@lixom.net
Subject: Re: [PATCH] iommu: Fix passthrough option documentation
Message-ID: <20180920110802.7687857b@lwn.net>
In-Reply-To: <60d15534e43f7856ce2e436aff28465cd679bb1d.1537448341.git.robin.murphy@arm.com>
References: <60d15534e43f7856ce2e436aff28465cd679bb1d.1537448341.git.robin.murphy@arm.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 20 Sep 2018 14:14:26 +0100
Robin Murphy <robin.murphy@arm.com> wrote:

> Document that the default for "iommu.passthrough" is now configurable.
> 
> Fixes: 58d1131777a4 ("iommu: Add config option to set passthrough as default")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> 
> Joerg, Jon, as a pure doc fix I'll leave it to your discretion as to
> whose tree is most appropriate (it shouldn't conflict with the other
> IOMMU patches I'm working on)

I went ahead and applied it, thanks.

jon

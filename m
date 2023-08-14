Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A3FC05052
	for <linux-doc@archiver.kernel.org>; Mon, 14 Aug 2023 19:01:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231814AbjHNTBL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Aug 2023 15:01:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjHNTBH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Aug 2023 15:01:07 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D959BC;
        Mon, 14 Aug 2023 12:01:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2F32737B;
        Mon, 14 Aug 2023 19:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2F32737B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692039666; bh=tQh3pIMFG+9zufiHzFMwP/8NN+j8T7Vgt8LF6E7l7p8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=j4WRMjahIsEOEnuk0eDt5nXwT2dm4Zth6mHjVwmNqwIrp66g0SDB9dHI82cvyXS2U
         07JeuDDtRXe3GCf5Q8WV6Fy42421ceUoUiMZMXROJXS2fYQVWKmKrMI2JJXmaex+ck
         zQZIt9jb7oYZgS4XD8G0/aTY/3L+o1ozW6Gr7j87bFugNdreaOboaFSWUjGx2cEqfc
         prYmZbt4oBhtUt+Du7gohudyVFxQbSzsrhD55xYFPeO5oTqJF1+3/MrEmSAWT0cWiH
         qt3mHd/Ywk0eX/R+UPCq+ZNpo3zeozNjBwH0H6+eJEJxYN+ku3v2Km6oloBhJKowOq
         Y1iVRo0fKhqtg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Pavan Kumar Linga <pavan.kumar.linga@intel.com>,
        netdev@vger.kernel.org, kuba@kernel.org
Cc:     linux-doc@vger.kernel.org, emil.s.tantilov@intel.com,
        joshua.a.hay@intel.com, sridhar.samudrala@intel.com,
        alan.brady@intel.com, madhu.chittim@intel.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        willemb@google.com, decot@google.com, rdunlap@infradead.org,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: Re: [PATCH net-next v2 0/2] Fix invalid kernel-doc warnings
In-Reply-To: <20230814170720.46229-1-pavan.kumar.linga@intel.com>
References: <20230814170720.46229-1-pavan.kumar.linga@intel.com>
Date:   Mon, 14 Aug 2023 13:01:05 -0600
Message-ID: <87pm3pv47i.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Pavan Kumar Linga <pavan.kumar.linga@intel.com> writes:

> kernel-doc reports invalid warnings on IDPF driver patch series [1]
> that is submitted for review. This patch series fixes those warnings.
>
> [1]: https://lore.kernel.org/netdev/20230808003416.3805142-1-anthony.l.nguyen@intel.com/
> ---
> v1 -> v2:
>  * Fix typos in the commit message
>
> net-next:
> v1 - https://lore.kernel.org/netdev/20230812002549.36286-1-pavan.kumar.linga@intel.com/
>
> These fixes are needed for the IDPF driver patch series to have
> a clean CI. So targeting the series to net-next instead of
> linux-docs.
> ---
>
> Pavan Kumar Linga (2):
>   scripts: kernel-doc: parse DEFINE_DMA_UNMAP_[ADDR|LEN]
>   scripts: kernel-doc: fix macro handling in enums
>
>  scripts/kernel-doc | 5 +++++
>  1 file changed, 5 insertions(+)

I have one comment on the second patch, and I'll grumble again about not
being copied on these, but I guess the series is OK.  I can drop it into
docs-next for the merge window.  If there is some need to take it via
another path, then:

Acked-by: Jonathan Corbet <corbet@lwn.net>

...just let me know.

Thanks,

jon

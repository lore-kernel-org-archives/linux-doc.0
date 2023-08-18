Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 628C1EE4980
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 17:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355106AbjHRRZX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 13:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379127AbjHRRZK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 13:25:10 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26404236
        for <linux-doc@vger.kernel.org>; Fri, 18 Aug 2023 10:24:38 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D8C8B5BF;
        Fri, 18 Aug 2023 17:24:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D8C8B5BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1692379462; bh=k0BLm8YiDuas8nCtN3xUICHCtvA8bbUm/O2R9ILwIvU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=E0zDM0dvJ/OFsh2TJhpsT1QswcjBS4Sna/3v2txPUdZeIO6XqPJb1Hq1SWpqvFeXf
         0licl9AMfhvVeCjjKDiycVyrlzbp/4o2CRHgB9j/sN/xTYEPvI4LOQy0OH3gXQEis0
         zJ1rTLYDlD8ILyTfs7qMy/ytFt9Yy9F4tObTRy7PvOm3c8/9ppvUC+FJo68p1wCKZc
         3pAsP+IwMLFV9ItyH1cODnr7WFW8duGlJm1F4nkFB1OCc5/NHP3nVXkWo28ss77bcf
         Ao59SqnH12sT1N4As8H3fqM5oXGVhWqfz1BxhZ6KA+0KbniuuGIsV3NErBMUQwlnRZ
         NDa9Um/Lae/2A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Pavan Kumar Linga <pavan.kumar.linga@intel.com>,
        linux-doc@vger.kernel.org
Cc:     kuba@kernel.org, rdunlap@infradead.org, emil.s.tantilov@intel.com,
        joshua.a.hay@intel.com, sridhar.samudrala@intel.com,
        alan.brady@intel.com, madhu.chittim@intel.com,
        jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
        willemb@google.com, decot@google.com,
        Pavan Kumar Linga <pavan.kumar.linga@intel.com>
Subject: Re: [PATCH docs-next v3 0/2] Fix invalid kernel-doc warnings
In-Reply-To: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
References: <20230815210417.98749-1-pavan.kumar.linga@intel.com>
Date:   Fri, 18 Aug 2023 11:24:21 -0600
Message-ID: <87sf8gl0vu.fsf@meer.lwn.net>
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
> v2 -> v3:
>  * Changed from net-next to docs-next based on Jonathan's comment:
>    https://lore.kernel.org/netdev/87pm3pv47i.fsf@meer.lwn.net/
>  * Added a 'Cc' tag in the commit message
>  (patch 2):
>  * Replaced ".*" with "[^;]*" in the regex
>
> v1 -> v2:
>  * Fix typos in the commit message
>
> net-next:
> v2 - https://lore.kernel.org/netdev/20230814170720.46229-1-pavan.kumar.linga@intel.com/
> v1 - https://lore.kernel.org/netdev/20230812002549.36286-1-pavan.kumar.linga@intel.com/
> ---
>
> Pavan Kumar Linga (2):
>   scripts: kernel-doc: parse DEFINE_DMA_UNMAP_[ADDR|LEN]
>   scripts: kernel-doc: fix macro handling in enums
>
>  scripts/kernel-doc | 5 +++++
>  1 file changed, 5 insertions(+)

Series applied, thanks.

jon

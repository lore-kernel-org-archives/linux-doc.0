Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E342C00140
	for <linux-doc@archiver.kernel.org>; Thu, 18 Aug 2022 17:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbiHRRaq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Aug 2022 13:30:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234758AbiHRRap (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 13:30:45 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 730AC83052
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 10:30:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B7ED9380;
        Thu, 18 Aug 2022 17:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B7ED9380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1660843843; bh=HEzCVhd8Z2BaSgOGmYZqp8NQRsZGiSOk/f24cGVFZA0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Cu4PrKHrISuQtR4Z+aUOUHdoSUBTWj46jiAhbpc/e1qcrOGB2TCp1WSbddpwHdR2y
         sA5P+Hj/kdZwqL7uxNzwSwqXz8s9AcyWFWUiamSJGnCUWn61FebBGNyKDa3tvAROoh
         +vktDGGU4Q4vtGNRA2golm0yeTWhdun60affVrVDYoB9rFOKcmmSs8m3dO93L+dbDl
         qwHXXudweyBTE9eFBJUOW+YTajRxn0xEf8wrLZ5dxo4Ub5oWY/h9A0037Fqy9JJmk+
         HFog50idSwAVIe8KgZqGqWx9/iizZHpX0pchmJ2eWlDJu6BXEZQH6inZVP284X7DZw
         UOofoa9AOQfvA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Manfred Spraul <manfred@colorfullife.com>,
        Federico Vaga <federico.vaga@vaga.pv.it>,
        Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>, linux-doc@vger.kernel.org
Cc:     Josef Bacik <josef@toxicpanda.com>, nbd@other.debian.org,
        Manfred Spraul <manfred.spraul@de.bosch.com>
Subject: Re: [PATCH] Doc update: Correct magic values from nbd protocol, V2
In-Reply-To: <20220805082532.55131-1-manfred@colorfullife.com>
References: <20220805082532.55131-1-manfred@colorfullife.com>
Date:   Thu, 18 Aug 2022 11:30:43 -0600
Message-ID: <87k075bgsc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Manfred Spraul <manfred@colorfullife.com> writes:

> From: Manfred Spraul <manfred.spraul@de.bosch.com>
>
> The magic number documentation refers to old values for
> NBD_REQUEST_MAGIC and NBD_REPLY_MAGIC: The documented values were used
> until Linux 2.1.116pre2.
>
> Thus:
> - Update the documentation.
> - Update the header file: The authorative source for the nbd protocol
>   is proto.md from the nbd package, thus mention this.
> - Remove the historic values from the header file.
>   The historic values are still documented in proto.md from the nbd
>   package.
>
> Removing the historic values is intentional:
> The values are stale for > 20 years, and this was not noticed.
> My guess is that everyone used grep to confirm that the values are
> still in use - and the historic values resulted that there were
> still hits with grep, ...
>
> Signed-off-by: Manfred Spraul <manfred.spraul@de.bosch.com>
> Link: https://github.com/NetworkBlockDevice/nbd/commit/107356ee528eb30744d518a8ac1cb6d379da4868
> Link: https://lore.kernel.org/all/20220318200446.14648-1-manfred@colorfullife.com/
> Link: https://lists.debian.org/nbd/2022/01/msg00039.html
> ---
> V2:
> - more links added, especially a link to the commit for proto.md
> - typo corrected in the commit summary
>
> @Jonathan:
> I've created one patch that updates the English text and the 3 translations
> that contain magic-number.rst.
> Is this the right approach? I could also split the patch into 4 changes.

No, for something like this, it's fine to fix everything together.

Applied, thanks.

jon

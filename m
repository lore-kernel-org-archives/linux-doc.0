Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D2FC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 22:29:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFD0961401
	for <linux-doc@archiver.kernel.org>; Tue, 20 Apr 2021 22:29:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234265AbhDTW36 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Apr 2021 18:29:58 -0400
Received: from ms.lwn.net ([45.79.88.28]:60958 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233964AbhDTW35 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Apr 2021 18:29:57 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 26FD07DA;
        Tue, 20 Apr 2021 22:29:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 26FD07DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618957765; bh=7uuK2tjREFu4yCuLr1biJCkH1dasIWWLO/M3i17nl4E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=h5ZZb0TD1EY/spR6gVSbjmq92ch78HxyyBhpwOWiXsKOqf4f/Um3Tlo1pyrWTzQsu
         V0KpTds+54lQEoc8mDfbBQw27YlIPF3je/plaa9J0tOE+Vm35d/MQdgbKC/miXDKaD
         3CanA19CeqCajUrUIN2qstisaysztCfTtcO6h7+CDyaB2L3JVo8DZbY8TBgQ8T8+5M
         2l6SxSlul5uf8G+tsonuejcvoPq6gUCh5l9tKzg57rdvUdlf3WBsUF3S7U67P/vgeQ
         mQWN4+m7H2VnwjkrxlashHt72k3UzUB+7x8H0pjddDZs6welkm1nk9crr1+WH4gpYC
         NA6iZC+4Xjsgw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] docs: driver-model: Update the documentation for
 device class
In-Reply-To: <20210407061053.81940-1-manivannan.sadhasivam@linaro.org>
References: <20210407061053.81940-1-manivannan.sadhasivam@linaro.org>
Date:   Tue, 20 Apr 2021 16:29:24 -0600
Message-ID: <87czuoio8r.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> writes:

> The current documentation about the device class is out of date such
> that it refers to non-existent APIs and structures. This commit updates
> them to the current device class APIs and structures, removes wordings
> that no longer valid while trying to keep the original content intact.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>
> Changes in v2:
>
> * Fixed CLASS_ATTR_RW as spotted by Greg
>
>  .../driver-api/driver-model/class.rst         | 144 ++++++++----------
>  1 file changed, 66 insertions(+), 78 deletions(-)

Note that this file was removed in commit 1364c6787525 back in
February by Geert (added to CC).  If you want to update this document,
you'll first want to bring it back.

Thanks,

jon

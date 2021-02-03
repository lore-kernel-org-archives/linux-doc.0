Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF88C433DB
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 22:10:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2E0E764F6B
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 22:10:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbhBCWKN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Feb 2021 17:10:13 -0500
Received: from ms.lwn.net ([45.79.88.28]:33528 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232822AbhBCWKB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Feb 2021 17:10:01 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6DBCF6153;
        Wed,  3 Feb 2021 22:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6DBCF6153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1612390150; bh=sqlfgOb0Cgr5vQF+7w1/lZA62jlFey7rGwwspcUhzo4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=s2x4f3Q/8kxerjzz69mnh1jFTMjhaMAphwUQar6c9NlyXKWjcRLqaEEtxZhOmUo2g
         TGKTxtRxgsPZA1osVD2d7zo6w+4Jh48Lf8PRp4pPhg3Uc/N7IlQkmydwl7snLWaF07
         x/dZFpZzCVHZHBXrb6dT8MGcqVojTfWou7K50wUlHSsj92x+UnbpBsYqsb+OmORsUw
         4XGnuMruUHBFJfUWLwS6/EJdyHaYGbBntnHYhZEpwlrngy1law3apNXPxr0W2BUD7D
         fPd2TWJU2cvtGZQBFuYNJfGjaOwwladw3xmuT6nu96Y6Isc0dpJRtQj8UpFXSVjxt9
         2w9bjIFYq+9IA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 4/6] Documentation: misc-devices: Add Documentation
 for dw-xdata-pcie driver
In-Reply-To: <2cc3a3a324d299a096f1d3e682b2039d3537b013.1612389746.git.gustavo.pimentel@synopsys.com>
References: <cover.1612389746.git.gustavo.pimentel@synopsys.com>
 <2cc3a3a324d299a096f1d3e682b2039d3537b013.1612389746.git.gustavo.pimentel@synopsys.com>
Date:   Wed, 03 Feb 2021 15:09:09 -0700
Message-ID: <87y2g4hkhm.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Gustavo Pimentel <Gustavo.Pimentel@synopsys.com> writes:

> Add Documentation for dw-xdata-pcie driver.
>
> Signed-off-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
>  Documentation/misc-devices/dw-xdata-pcie.rst | 40 ++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/misc-devices/dw-xdata-pcie.rst

If you add a new RST file, you also need to add it to the corresponding
index.rst so that it gets pulled into the docs build.

Once you've done that, please build the docs and look at the results,
you may not get quite what you're expecting :)

Thanks,

jon

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72202C46467
	for <linux-doc@archiver.kernel.org>; Tue,  3 Jan 2023 17:51:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237887AbjACRuv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Jan 2023 12:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237990AbjACRu0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jan 2023 12:50:26 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F0597649;
        Tue,  3 Jan 2023 09:50:23 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 89FFB4BF;
        Tue,  3 Jan 2023 17:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 89FFB4BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1672768223; bh=URxRshRfHe6UeljKti7S8tG81fA6qAziJX9+1HOSEh4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=PKZ8ujpWdpMxDExLtS1F5t7lRM9YppasEXvUYrkY7NIPcWARL+tLInukgfxhccB4b
         mnTiTkEEnz4I9rHSyxbYCvNPUtze7aAEWKvPm+dhn38nYOZnBBPwZakHyMQK0qhIYe
         IuAHdGugjAidjN1GpH70kkdtyuLOO307j9cZDzUYxQjWl67iD494o1dUjknENaWVfx
         za2SCHjl4tN2iJSKTQp9gaY/gLn+Ge14UpcmIAdX2PN8z5sYHUxMpWZRafA8Mw28q0
         eQr3OEo/C8cxWwwt9t6/Q7BrVFjNtDN4Pu8GFFSVuSjn4+vDmw8Q7spEdaBNknUQ5V
         4up0/bXQK+swA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yann Sionneau <ysionneau@kalray.eu>
Cc:     Yann Sionneau <ysionneau@kalray.eu>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Clement Leger <clement.leger@bootlin.com>,
        Guillaume Thouvenin <gthouvenin@kalray.eu>
Subject: Re: [RFC PATCH 01/25] Documentation: kvx: Add basic documentation
In-Reply-To: <20230103164359.24347-2-ysionneau@kalray.eu>
References: <20230103164359.24347-1-ysionneau@kalray.eu>
 <20230103164359.24347-2-ysionneau@kalray.eu>
Date:   Tue, 03 Jan 2023 10:50:22 -0700
Message-ID: <874jt7fqxt.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yann Sionneau <ysionneau@kalray.eu> writes:

> Add some documentation for kvx arch and its Linux port.
>
> CC: Jonathan Corbet <corbet@lwn.net>
> CC: linux-doc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> Co-developed-by: Clement Leger <clement.leger@bootlin.com>
> Signed-off-by: Clement Leger <clement.leger@bootlin.com>
> Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
> Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
> ---
>  Documentation/kvx/kvx-exceptions.txt | 246 ++++++++++++++++++++++++
>  Documentation/kvx/kvx-iommu.txt      | 183 ++++++++++++++++++
>  Documentation/kvx/kvx-mmu.txt        | 272 +++++++++++++++++++++++++++
>  Documentation/kvx/kvx-smp.txt        |  36 ++++
>  Documentation/kvx/kvx.txt            | 268 ++++++++++++++++++++++++++
>  5 files changed, 1005 insertions(+)
>  create mode 100644 Documentation/kvx/kvx-exceptions.txt
>  create mode 100644 Documentation/kvx/kvx-iommu.txt
>  create mode 100644 Documentation/kvx/kvx-mmu.txt
>  create mode 100644 Documentation/kvx/kvx-smp.txt
>  create mode 100644 Documentation/kvx/kvx.txt

Please write this documentation in the RST format (you're 95% of the way
there now) and incorporate into the kernel docs build.

Thanks,

jon

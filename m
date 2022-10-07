Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D85C433FE
	for <linux-doc@archiver.kernel.org>; Fri,  7 Oct 2022 16:26:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiJGQ0e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Oct 2022 12:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229965AbiJGQ0b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Oct 2022 12:26:31 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B38C7060;
        Fri,  7 Oct 2022 09:26:29 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 20EB02E6;
        Fri,  7 Oct 2022 16:26:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 20EB02E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1665159989; bh=SJWDWP3PWkWdNb0CSUN6+ab3g+8ViXpo6IKXaPvUwn4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=PvK9Ai83137s3q/uZSW5RsqUd5Yu8jlqMcEQHEaEmNHhsN7vj3LZRaLnsoFblVgAL
         u6rXGGZcjHnPSSbtAxppk33f7ntYtLqrFNoRHaEEGkdQvmiOGj1mCzFDCQfM9l/Lr3
         L1uvru6P2fxxtPXl9kEVUFGMBm8QO/bNiMSiw1S/xIFYRaqZM0S47HEifTqlwBYyf4
         Oe2RIW5FdxeLN5XlMeUDA2Sag3UYKswjvrsC91HbnX4wKl8wM4KDVwVS3CaRQHUQTK
         EoiLpjNzgdKUy+0MPFQuxXB7PWxqOQNss4GlJpHsup1w0QY0/O8GobYNMzYEdUfert
         HbgyL83VovawA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 5/5] docs: improve the HTML formatting of kerneldoc
 comments
In-Reply-To: <20221005065909.33ba2523@sal.lan>
References: <20221004201222.281845-1-corbet@lwn.net>
 <20221004201222.281845-6-corbet@lwn.net> <20221005065909.33ba2523@sal.lan>
Date:   Fri, 07 Oct 2022 10:26:28 -0600
Message-ID: <877d1bmwgb.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab@kernel.org> writes:

> As I didn't test the patches, it sounds worth mentioning that it makes
> sense to check if this won't badly affect epub and/or LaTeX/PDF outputs.
>
> The LaTeX output generator in particular has a problem with long
> lines with fixed-width lines: if the text doesn't fit into one line, it
> either truncates it or makes the text go outside the margins.
>
> If the container affects the PDF outputs, we need to double-check if
> this would break its output.

So as far as I can tell, the PDF output is entirely unaffected.  I have
not read it all, though!  Is there a place in particular that you know
to be problematic where I should look?

Thanks,

jon

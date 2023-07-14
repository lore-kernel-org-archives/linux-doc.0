Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6E2EB64DC
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jul 2023 19:14:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236064AbjGNTO3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Jul 2023 15:14:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235472AbjGNTO3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Jul 2023 15:14:29 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A671635AB;
        Fri, 14 Jul 2023 12:14:27 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 470425BF;
        Fri, 14 Jul 2023 19:14:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 470425BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1689362067; bh=G1IQitCcy3yp2mr8acmODt7HuEWR/LWNkQXy/GwgKvA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Sib4+clSMEu+WO2ucpToeZJJBtzCxb5T3tkifrRjWvb3ndwsF3YSgEyrWAhnRXj7b
         fbUcvtDL75UTHnnFg9BxV2YZH1sEfBNpufcBtsFyBrV89HjNUvs2uMRCK0VONdI9n1
         UYXtlN5mBnIAZtOjFMXN/LIXK9OMgKiP9mr4BCDiLoou+LBdnOS5zBczl/ONnsVQHE
         2S6EqiPy40gFjEATC75PiMxB96n2+PKm07GM55KxZqz5Kxn6m1Pt0COEVjwoPdov3+
         1Ze63jhLnnXUAVDsqasyA0B+fHfNoUnNh7TNLmGyXaM6WyWhGEIA2Pk3BewOvXln0H
         YPsWIFVwcr7Ww==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: panic: cleanups for panic params
In-Reply-To: <20230704001954.20518-1-rdunlap@infradead.org>
References: <20230704001954.20518-1-rdunlap@infradead.org>
Date:   Fri, 14 Jul 2023 13:14:26 -0600
Message-ID: <87ttu6z4od.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> writes:

> Move 'panic_print' to its correct place in alphabetical order.
> Add parameter format for 'pause_on_oops'.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---
>  Documentation/admin-guide/kernel-parameters.txt |   30 +++++++-------
>  1 file changed, 15 insertions(+), 15 deletions(-)

This one doesn't apply to docs-next; care to respin?

Thanks,

jon

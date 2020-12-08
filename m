Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57C8C433FE
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:55:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93B4823B3E
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 17:55:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgLHRzW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Dec 2020 12:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726810AbgLHRzV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Dec 2020 12:55:21 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D5CC061749;
        Tue,  8 Dec 2020 09:54:41 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3E7342AE;
        Tue,  8 Dec 2020 17:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3E7342AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607450080; bh=vUPe5xnpjeq2RaLybVlar/PVL7nLlPiDhZ3QIs3m20A=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=GRjBzFPvR4kiKNQwFPmmxzQxrkIKDc8YNkpgRVUBRpFnNPj1VzA9PLr4bQRIgYuKE
         nglo3wWpIWrxUfRm8hVM65ug3d/2JtDRi1a54rElPcZWlQRI9zeJXrx9B+mSRGV2CA
         79URsdjyLhoe7OuSb2FsMas1epmkLbhnxH0DhGbYGHIt5ae5WDYzcEOfgP5yLnB+mt
         x+N+/7S/qCEg3lpjZvfCrsfgrpfiPbsUSax6nxY+7VDtWsi2jpVUZE+zpJs9zTWLea
         kzd4eO5Y1htxj1+ioRH51aUPDhvRhu8qfhkmWbXT6kZ0XpoacjzNOODrSzL5qfxFTR
         C/mVTeuD8o49A==
Date:   Tue, 8 Dec 2020 10:54:39 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mathieu Chouquet-Stringer <me@mathieu.digital>
Cc:     Borislav Petkov <bp@alien8.de>, Stephen Kitt <steve@sk2.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        "Guilherme G. Piccoli" <gpiccoli@canonical.com>,
        Eric Biggers <ebiggers@google.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Qais Yousef <qais.yousef@arm.com>,
        Naoki Hayama <naoki.hayama@lineo.co.jp>,
        Yue Hu <huyue2@yulong.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Update documentation to reflect what
 TAINT_CPU_OUT_OF_SPEC means nowadays
Message-ID: <20201208105439.23e2349b@lwn.net>
In-Reply-To: <20201202153244.709752-1-me@mathieu.digital>
References: <20201202153244.709752-1-me@mathieu.digital>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed,  2 Dec 2020 16:32:43 +0100
Mathieu Chouquet-Stringer <me@mathieu.digital> wrote:

> 	Hello Jonathan,
> 
> Here's a patch updating the meaning of TAINT_CPU_OUT_OF_SPEC after
> Borislav introduced changes in a7e1f67ed29f and upcoming patches in tip.
> 
> TAINT_CPU_OUT_OF_SPEC now means a bit more what it implies as the
> flag isn't set just because of a CPU misconfiguration or mismatch.
> Historically it was for SMP kernel oops on an officially SMP incapable
> processor but now it also covers CPUs whose MSRs have been incorrectly
> poked at from userspace, drivers being used on non supported
> architectures, broken firmware, mismatched CPUs, ...
> 
> Update documentation and script to reflect that.
> 
> Signed-off-by: Mathieu Chouquet-Stringer <me@mathieu.digital>

Hearing no objection, I've applied this.

Thanks,

jon

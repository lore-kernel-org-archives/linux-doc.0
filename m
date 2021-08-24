Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89042C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F13561265
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:40:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234649AbhHXTl0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 15:41:26 -0400
Received: from ms.lwn.net ([45.79.88.28]:59474 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229728AbhHXTlZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Aug 2021 15:41:25 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CF4D6867;
        Tue, 24 Aug 2021 19:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CF4D6867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629834041; bh=rpNF4AeVZpOknGCEOMEHy9rnqjdZ6A0XfE2bu7Mn6Z8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=flzUgwEHfqduGsNiRyfp4hkAg/aw7DL+5auRSPtm0d36SOFHUchx+yNInO4bw1huh
         /ir/0yFa6PghQbvj876NLXSTWgLCYFbPW1b1NTNzq3pac4TxOHcLpltzzo2CPcTnIn
         MWohqkRM+5/p5eB6EjVCQE58fC0GpzAxK7KDjLlP0ts1JBc6VbRTXduHYTEpi20nSi
         cTYoe6eqTgaKE5X3iNvyOGUlJg6atsCXtFBupPkJHF0vJ1Lm+PipOdN34jU16ko3Rs
         LCiOZHzBQ9aFEv1K/+v3zSsLJWztSA6DZ32veG0uJg48F70tlz4x+dJnAA4TWozuPD
         9/kpFWdsjEx2Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hu Haowen <src.res@email.cn>
Cc:     linux-doc-tw-discuss@lists.sourceforge.net,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] docs/zh_TW: add translations for zh_TW/arm64
In-Reply-To: <20210821094059.64300-1-src.res@email.cn>
References: <20210821094059.64300-1-src.res@email.cn>
Date:   Tue, 24 Aug 2021 13:40:40 -0600
Message-ID: <87o89mljgn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hu Haowen <src.res@email.cn> writes:

> Create new translations for zh_TW/arm64 and link them to index.
>
> Signed-off-by: Hu Haowen <src.res@email.cn>
> ---
>  .../translations/zh_TW/arm64/amu.rst          | 104 ++++++++
>  .../translations/zh_TW/arm64/booting.txt      | 251 ++++++++++++++++++
>  .../translations/zh_TW/arm64/elf_hwcaps.rst   | 244 +++++++++++++++++
>  .../translations/zh_TW/arm64/hugetlbpage.rst  |  49 ++++
>  .../translations/zh_TW/arm64/index.rst        |  23 ++
>  .../zh_TW/arm64/legacy_instructions.txt       |  77 ++++++
>  .../translations/zh_TW/arm64/memory.txt       | 119 +++++++++
>  .../translations/zh_TW/arm64/perf.rst         |  88 ++++++
>  .../zh_TW/arm64/silicon-errata.txt            |  79 ++++++
>  .../zh_TW/arm64/tagged-pointers.txt           |  57 ++++
>  Documentation/translations/zh_TW/index.rst    |   5 +
>  11 files changed, 1096 insertions(+)
>  create mode 100644 Documentation/translations/zh_TW/arm64/amu.rst
>  create mode 100644 Documentation/translations/zh_TW/arm64/booting.txt
>  create mode 100644 Documentation/translations/zh_TW/arm64/elf_hwcaps.rst
>  create mode 100644 Documentation/translations/zh_TW/arm64/hugetlbpage.rst
>  create mode 100644 Documentation/translations/zh_TW/arm64/index.rst
>  create mode 100644 Documentation/translations/zh_TW/arm64/legacy_instructions.txt
>  create mode 100644 Documentation/translations/zh_TW/arm64/memory.txt
>  create mode 100644 Documentation/translations/zh_TW/arm64/perf.rst
>  create mode 100644 Documentation/translations/zh_TW/arm64/silicon-errata.txt
>  create mode 100644 Documentation/translations/zh_TW/arm64/tagged-pointers.txt

I have gone ahead and applied this set.  I really do have to ask,
though: is there really nobody with sufficient interest to review these
patches?  The zh_CN translators have done a good job of organizing
themselves to review this work; could you please try to do the same?
Otherwise I'm being asked to add lots of material that, as far as I can
tell, nobody has looked at...

Thanks,

jon

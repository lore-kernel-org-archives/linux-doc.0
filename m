Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C249EB64D7
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jun 2023 18:55:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjFRSzA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Jun 2023 14:55:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjFRSy7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Jun 2023 14:54:59 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C370D8
        for <linux-doc@vger.kernel.org>; Sun, 18 Jun 2023 11:54:57 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A8840723;
        Sun, 18 Jun 2023 18:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A8840723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1687114496; bh=DzxsAMuZ7ZP4niSDsH+A8h51O/GHUccOcld3SSNEPbg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=P8upKCnYXiwUC1I9xTPaotzuvAsFRHfoWqPEWuwHjAcD22wIBTX/c0r0TqnoL+v19
         kBOkBJ4AyQkikk7Xv6OvlqoUZP3d6wvXZU/9RwQSsjNqtSpuXQ8cp36HyccdfY99ha
         qU4ZBUsWNSgrMEuQ7+wKepzvZUXgXgEdU3knr+AaqoBrXXkIz5i6N1bGuMHhxZWXdb
         io246UmSzlGE/TSwedIvXkIcQrR50qOasnnYI/GK1tJ8B4D1QN1b1cmo1ACY6qgjHB
         CiQqqD6NxrZmsZo0D1RHDMVA6efvjX8OSmTQmXFOwjHn0hmw91s7wgQ0+/fAly68zE
         nG3jsdCdq9Qhw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v5] Documentation/mm: Initial page table documentation
In-Reply-To: <3045029.CbtlEUcBR6@suse>
References: <20230614072548.996940-1-linus.walleij@linaro.org>
 <3045029.CbtlEUcBR6@suse>
Date:   Sun, 18 Jun 2023 12:54:55 -0600
Message-ID: <87zg4wvbwg.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Fabio M. De Francesco" <fmdefrancesco@gmail.com> writes:

> I question the target audience of this documentation. How can we expect a=
ny=20
> developer working with Linux to be unaware of such basic concepts? Adding=
=20
> documentation about these foundational concepts would create a precedent,=
=20
> potentially leading to further documentation on other fundamental abstrac=
tions=20
> like "task," "multi-threading," and "scheduling" =E2=80=93 concepts that =
are integral=20
> to kernel management. The inclusion of such basic topics could quickly cl=
utter=20
> up the specialized Linux kernel documentation.

Someday, if we find ourselves in the position of having too much
documentation, we can entertain patches to clean out material that is
deemed to be too elementary for kernel developers.  Before then, though,
if we are worried about clutter, we may want to put more effort into
addressing the large amount of duplicated and obsolete documentation in
the kernel now.

Until then, I see no reason to oppose the addition of material that,
even if you don't personally find it helpful, may indeed be helpful to
developers trying to come up to speed on just what the kernel is doing.

Thanks,

jon

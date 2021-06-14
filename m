Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DC3FC2B9F4
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 21:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6066261059
	for <linux-doc@archiver.kernel.org>; Mon, 14 Jun 2021 21:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbhFNVt7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Jun 2021 17:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbhFNVt7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Jun 2021 17:49:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E76C061767;
        Mon, 14 Jun 2021 14:47:56 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 19236734;
        Mon, 14 Jun 2021 21:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 19236734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1623707276; bh=MvUJ+5EiecI6zpctop5SsbtiTktCOl2AJ0Y+lhAM2gM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=C5q0RSfcJdn74DsCaf0QvOETlT+D4jS2I/3njMXfS14whfwk6KR6OkRlAGLnAMkgK
         8OxObgmGiAgrcyHHrTx4gEPSdwr2uOFEMYBK0S4hAYKtrlXWsi7Cr561vrT12UmBpT
         2Wv9664ZiTLR28chuEtt/brdJzGmpYTIEezbSccPBBVqEO6yWFrxmwg6QTE/oHbeG9
         9h8UEbN8FQkKBwLw9AkmCIUG5YY33TOakaug2FgdmJjuRAEdwQP6TaQwwztAIJw7MH
         OvRy6hT3ljODD9/4ZECf9eFtycZ7xjG9JRIHcABu6jzs+u4K6Natyal6f02RTeTHn6
         JH8oFVyd4Um8A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc:     linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com,
        joe@perches.com, linux-doc@vger.kernel.org,
        Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: Re: [PATCH v4] docs: checkpatch: Document and segregate more
 checkpatch message types
In-Reply-To: <20210614141132.6881-1-dwaipayanray1@gmail.com>
References: <20210614141132.6881-1-dwaipayanray1@gmail.com>
Date:   Mon, 14 Jun 2021 15:47:55 -0600
Message-ID: <87mtrs15kk.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dwaipayan Ray <dwaipayanray1@gmail.com> writes:

> Add and document more checkpatch message types. About 50% of all
> message types are documented now.
>
> In addition to this:
>
> - Create a new subsection 'Indentation and Line Breaks'.
> - Rename subsection 'Comment style' to simply 'Comments'.
> - Refactor some of the existing types to appropriate subsections.
>
> Reviewed-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Tested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>

Applied, thanks.

jon

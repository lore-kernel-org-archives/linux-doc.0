Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB34C004D4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 21:14:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjASVOH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 16:14:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230059AbjASVNY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 16:13:24 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51DD2748C;
        Thu, 19 Jan 2023 13:09:24 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 59C8E359;
        Thu, 19 Jan 2023 21:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 59C8E359
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674162564; bh=A5Zz/yiuvjOWBmyGWIOHswcn5ewUhZYXAGNXTnyzqU0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=heZwQbRvrCO3PIAZ/0BIse7NMy6liObuJf1f2xUfP/VDhIr6TM4lXo6q5F12BKuw8
         4lWEFro2Kja1PpVFPi+XaJfETOX/893pTskvht27SuIEZ0C6JaxmrhQGGS4FpVkpdb
         qbou1iIXkY+HIwcE1O4DkMiR5OG9FE04YMKSCL7GuWjn6qyuuEUdRTkl2ztAFegifb
         CQ8GSpBn8VY8wtlGN2pmCSziop96t6UgLYY3sdoxTbePSulSlE+NatIosOZ769Ejrq
         VFXWhjCoOkD/TiFqpTVgAStg4ED+5HD381MRrSv7z7E3nz2mBWOqy+rPVYDyvlBRZ0
         dEJn7WyLoS5TQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakob Koschel <jkl820.git@gmail.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jakob Koschel <jkl820.git@gmail.com>
Subject: Re: [PATCH] docs/scripts/gdb: add necessary make scripts_gdb step
In-Reply-To: <20230112-documentation-gdb-v1-1-09ab556e9124@gmail.com>
References: <20230112-documentation-gdb-v1-1-09ab556e9124@gmail.com>
Date:   Thu, 19 Jan 2023 14:09:23 -0700
Message-ID: <878rhy8c58.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakob Koschel <jkl820.git@gmail.com> writes:

> In order to debug the kernel successfully with gdb you need to run
> 'make scripts_gdb' nowadays.
>
> This was changed with the following commit:
>
> Commit 67274c083438340ad16c ("scripts/gdb: delay generation of gdb
> constants.py")
>
> In order to have a complete guide for beginners this remark
> should be added to the offial documentation.
>
> ---
>
>
> Signed-off-by: Jakob Koschel <jkl820.git@gmail.com>

Applied, thanks.

jon

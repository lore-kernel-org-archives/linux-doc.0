Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3B0C27C76
	for <linux-doc@archiver.kernel.org>; Wed, 25 Jan 2023 19:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233619AbjAYTj3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Jan 2023 14:39:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjAYTj2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jan 2023 14:39:28 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFEA01E280;
        Wed, 25 Jan 2023 11:39:27 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 02FA8380;
        Wed, 25 Jan 2023 19:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 02FA8380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1674675567; bh=FIqmCjYV15WRliKv7kZzO2v+bw7MvCkA3aAXC00Zwcs=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KApvA2dZYLGy4q24c7WHFVZq9cCS2YmkFZZ2w507rHrRdPaX+DyKIIQpH6Ay1k5pC
         ijgSUqtCvftkhaNMItjNREUgKlt5xk6leUmDgHUXIlDXTI9hD0nGO9iZPi6+d60u6P
         Fl5mv1hJR7hfnTYRtZ3hyg+pktEIIaInaG28WbdKAqsJmZLpUEul0IKK4yMMJ7r3O1
         V37gJaBuWFtkqjygEEKO+O6Oj/Nsueq6Wv4Y//17y7sAgKPvalqw0hJYFY+BOaoR/K
         xCFf4c0MwAJ+R0hORWHguv6/GESVvkSwFoSTGXYLaPwhlnJL4n93GeC+/k75/KWcGR
         YMH46xIUZliaA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Carlos Bilbao <carlos.bilbao@amd.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        bilbao@vt.edu, Carlos Bilbao <carlos.bilbao@amd.com>,
        =?utf-8?Q?Ahelenia_Ziemia=C5=84ska?= 
        <nabijaczleweli@nabijaczleweli.xyz>
Subject: Re: [PATCH] docs/sp_SP: Add process magic-number translation
In-Reply-To: <20230125181840.3007341-1-carlos.bilbao@amd.com>
References: <20230125181840.3007341-1-carlos.bilbao@amd.com>
Date:   Wed, 25 Jan 2023 12:39:26 -0700
Message-ID: <87tu0ecsk1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Carlos Bilbao <carlos.bilbao@amd.com> writes:

> Translate the following document into Spanish:
>
> - process/magic-number.rst
>
> Signed-off-by: Carlos Bilbao <carlos.bilbao@amd.com>
> ---
>  .../translations/sp_SP/process/index.rst      |  1 +
>  .../sp_SP/process/magic-number.rst            | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/translations/sp_SP/process/magic-number.rst

There was a series out there to delete this file entirely:

  https://lore.kernel.org/lkml/cover.1668128257.git.nabijaczleweli@nabijaczleweli.xyz/

I wonder whatever became of that?

Thanks,

jon

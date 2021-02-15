Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0B7C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 18:24:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 774A764E05
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 18:24:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhBOSYz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 13:24:55 -0500
Received: from ms.lwn.net ([45.79.88.28]:51920 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229954AbhBOSYy (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Feb 2021 13:24:54 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::e2d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C272B2A0;
        Mon, 15 Feb 2021 18:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C272B2A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1613413453; bh=DUnfItWJCN14J1yb4OPWjTaD3Z5ocs557C6vmLrHVKk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=qak9vLUnqMq8bLcu7aQLHKkOnZtkwA4I4FP8pOl9kKJjToKwUvC5WLlhbiadkzw0q
         IuTZxtkfqHT5mggsIKvNvhlgg0LvC0bXkHWlmeOpyBxm6OAvlTdTNq2Sl+GmfgYNKK
         5UsVJzUKmjqkFpmF6lOlsy4kkdXeWY+e3tMTAwhCzsRUgFgviQL6A1WWMJApuselbz
         Dj7SQ2HS2rzEGmw5RbvJlIX8xZeCPPkWOBTHXAWdc/DxyYIyaPHo6EW47kF+3d7LGo
         aVizhT+u1o4Mrat6PoF1HMwFcmPWzCcM170aoE0fuX+S+fez9bGbGrBmEtKssL2Gme
         rG3DFl2Y5muUA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Aditya <yashsri421@gmail.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        yashsri421@gmail.com
Subject: Re: Issues with kernel-doc
In-Reply-To: <5d519211-987e-3367-2ce9-9d1300445bc4@gmail.com>
References: <5d519211-987e-3367-2ce9-9d1300445bc4@gmail.com>
Date:   Mon, 15 Feb 2021 11:24:13 -0700
Message-ID: <87v9at42b6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Aditya <yashsri421@gmail.com> writes:

> Here, although the compiler may not cause any error, kernel-doc emits
> the error as it probably expects "struct struct_name" to occur together.
>
> What do you think about these issues?
> I want to fix these issues, if you agree that they need to be fixed.
>
> There are a few more issues as well, apart from these two. But for the
> start, I want to begin with Uninitialized $param errors.

There is no need to ask permission before sending bug fixes!  I would be
more than happy to receive them.

Thanks,

jon

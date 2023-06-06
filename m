Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAD4C7EE29
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 14:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236184AbjFFOhA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 10:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237573AbjFFOg7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 10:36:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC62D10D7;
        Tue,  6 Jun 2023 07:36:51 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C75FA2E0;
        Tue,  6 Jun 2023 14:36:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C75FA2E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1686062210; bh=zYE2SZ+7c7ksI/JGJYLLolFbkdSqO4sU/ZNWh6+duqo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=EfIvaUupnnUzvcbQPXt0glC9VDLVYA1X4EHJqzTC+BJK5K4C78CzuBdj9Bd65wb5H
         yH3KnWHvc1lYIi5JFpkWZjoeFC/YXk+afLLujoDTFhdgDtj1VP1l7HoZj023GB2slL
         5+Nzu0KNQq114CFn8g8AROHFv7bLACa4Xc4YOWzJTfeo2Upo+XlJTbnW7jIjq45H9/
         j5aiSLqZ3K7+IK5jfz2iHYg7VzEv9PLVnr8mIzHeZcOPkF5nrpIBfO1ulkbFZln7Ky
         ix0ODYCleuo9Bep/rt8yUBPqKzQJFvyseqy0tEUE6rp/UgJYY1tiHr/11noxddohKY
         n7H0175QBpWeQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Stock image illustration (licensing)
In-Reply-To: <e6047201-7cf1-ecc4-ca68-490142f6f40b@gmail.com>
References: <e6047201-7cf1-ecc4-ca68-490142f6f40b@gmail.com>
Date:   Tue, 06 Jun 2023 08:36:47 -0600
Message-ID: <87fs74y7wg.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> Imagine that there is a new Linux kernel contributor, contributing
> documentation patches. As it is the habit from her company, she adds
> stock images from various sources (which may or may not be related
> to the doc), e.g. freepik or pexels [1], as illustration.
>
> However, on the source file, the image requires attribution. Yet,
> the attribution instruction doesn't mention image license (she
> attributes as "Illustration of foo by bar on pexels"), hence
> all rights reserved. Can that stock image be added to the kernel
> docs (which is licensed under GPL)?

I am rather curious as to why you are asking this question.

Images, like everything else, need clear licensing.  Images that do not
have a GPL-compatible license cannot be added to the kernel.

But we are certainly not in the habit of decorating our documentation
with "stock images", so this is not a question that has ever come up.

jon

Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F282C77B7C
	for <linux-doc@archiver.kernel.org>; Fri,  5 May 2023 15:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232906AbjEEPbT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 May 2023 11:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232890AbjEEPbS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 May 2023 11:31:18 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49103156B0;
        Fri,  5 May 2023 08:30:54 -0700 (PDT)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A9DD12E0;
        Fri,  5 May 2023 15:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A9DD12E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1683300653; bh=+lo1onitVV1iX83ZaCXEymuCSdsb0AmrMt4xe68Qc94=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BdrnCYjP1xc1OqkJ9ctj1/yMFRBY6YZ2Zft+B8XMuVNBcP0KFH0ria7hX80aoWynX
         XZ4j4rMc3lpB7J0iuNRP6zMdLLA7teb4UvWD7TlR1DklgtUsHUMmdynY6m0RB5Q5vt
         dS6xss6rfckPr616or+kmXnyCzrUuwKse3UhtqbZR6dJdITjeU26v9TjQrjtIGGdUV
         Icp+7a7VIHLHI+hI8cjRIhMYMMTHYkG6gnqM0FxfCf9UZfx09x4ehLtPOJ4FprIff1
         1TPkb350gxZdKKWjO67CF/e2mDR9z2EKp4oe4P9ZH+woAMb7kl9SfowxY4YON94g+M
         knEc4gmGF56Ag==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Hongyan Xia <hongyan.xia2@arm.com>
Cc:     Hongyan Xia <hongyan.xia2@arm.com>,
        Qais Yousef <qyousef@layalina.io>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/documentation: elaborate on uclamp limitations
In-Reply-To: <20230505152440.142265-1-hongyan.xia2@arm.com>
References: <20230505152440.142265-1-hongyan.xia2@arm.com>
Date:   Fri, 05 May 2023 09:30:52 -0600
Message-ID: <878re2n6c3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hongyan Xia <hongyan.xia2@arm.com> writes:

> The story in 5.2 about util_avg abruptly jumping from 300 when
> Fmax/Fmin == 3 to 1024 when Fmax/Fmin == 4 hides some details about how
> clock_pelt works behind the scenes. Explicitly mention it to make it
> easier for readers to follow.

So this is a nit, but...

> +Although running at Fmin reduces the rate of rq_clock_pelt() to 1/3 thus
> +accumulates util_sum at 1/3 of the rate at Fmax, the clock period
> +(rq_clock_pelt() now minus previous rq_clock_pelt()) in:
> +
> +::
> +
> +        util_sum / clock period = util_avg

This can be written as:

  ...previous rq_clock_pelt()) in::

       util_sum / clock period = util_avg

reducing the markup clutter and making the document a little more
readable.

Thanks,

jon

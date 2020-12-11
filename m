Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D015DC4361B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:43:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84E722333C
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:43:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728873AbgLKU4Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:56:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729581AbgLKU4H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:56:07 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951B3C0613D3
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:55:27 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 259F92CA;
        Fri, 11 Dec 2020 20:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 259F92CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607720127; bh=t32f+vvSdg+G4nnV8rYbUjKPjawCxy4y6nN3uZMlwSk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=KD748QKWsKlgZkmJ2qDIM6qqRyZFic0iQWQ+00l7DMksXejodrrcw9DAXLQqn/gS6
         ifGxaJN2jds0SwKKy0/djwYTpVlHLFKzuMYZEGmKfjHRrKTHzLsuxtuDWDykkvNSDr
         0ytfBq6qjTQlfZvd8jVa8R2L8FR1s7n7HJCObvWqd3QsULjyn+QpGcFWC97cscAV1x
         6KTX51KcMTSEC5wygW+WweKLGAnOh58iX7VeuozB7BmZj/w6SO9LuCvTY7RHbppBdA
         m3hvt4sqLeD5FcaQMcpHmlrnoqtB3LVspQaStoD4zFy9H1KGCMzQYsrfX4Lv+jgWr0
         0RbdyCsGogWjg==
Date:   Fri, 11 Dec 2020 13:55:26 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     JaeSang Yoo <js.yoo.5b@gmail.com>
Cc:     mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.org, markus.heiser@darmarit.de
Subject: Re: [PATCH] docs: update requirements to install six module
Message-ID: <20201211135526.36877537@lwn.net>
In-Reply-To: <CAHdLnN2pV6yq0iU7T2FiP8Q6i_kRZpMkVgPU_LCaR0uzdS5Qaw@mail.gmail.com>
References: <20201208014628.GA1361@JSYoo5B-Base.localdomain>
        <20201209172903.7990f71b@lwn.net>
        <CAHdLnN2b5viH--nuqEERePQd47inF9cYqFLaThd3VVAvz5u76g@mail.gmail.com>
        <20201210160205.56bb9060@lwn.net>
        <CAHdLnN2pV6yq0iU7T2FiP8Q6i_kRZpMkVgPU_LCaR0uzdS5Qaw@mail.gmail.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Dec 2020 10:15:36 +0900
JaeSang Yoo <js.yoo.5b@gmail.com> wrote:

> Is this meaning that some people are using older Sphinx?
> Then, there's no chance to leave from Python2.

We still support Sphinx back to 1.3, though that's pushing forward to 1.7
shortly.  The virtualenv approach is recommended as a way to get a
relatively predictable setup, but we don't force it on people.

And yes, decisions to drop Python 2 support and support for older Sphinx
versions kind of go together.

Thanks,

jon

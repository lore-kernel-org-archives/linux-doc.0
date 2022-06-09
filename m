Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE65C43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 15:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbiFIPdc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Jun 2022 11:33:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343936AbiFIPdS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Jun 2022 11:33:18 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8954959BA4
        for <linux-doc@vger.kernel.org>; Thu,  9 Jun 2022 08:33:17 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id F0E69732;
        Thu,  9 Jun 2022 15:33:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0E69732
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1654788797; bh=SxR7yHtZhhWPaFAieTyxeA8TYhUUOP5ojQJcC98USxw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lXhEF5ovqB6iYtg9IEZeaSw+qkW6D02h2TcF01p7glNL2eqyA9Hoj168Ou8rR1w/I
         lryeK+tVThZA0QbRjzkauCClVC9Q+hjaS13d8QWxkwXva49MGsv0bpX9Kbz6lwI1yt
         4K1LKtxadhYvyhtsGGvSYDYJMq/pNk17nVlM1sj+oKaueYy/UqVJaiJhlpkqD9zW+x
         8ela6dpy1uxaOFqGyVlT6P1OTI6XrrWt1NS3TNsDNVnm56QFbv5nnSfuHNkfPqvWBH
         1EKbw66Fkv5bpPAv7sj82x5vq1XGNlPPKx1omL99RN7SutWYCcb/va6N8gfwtWsYyP
         VL1WzG3cj/Fiw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Move the HTE documentation to driver-api/
In-Reply-To: <985966be-b7a1-c208-0775-d1cb4ff072cd@nvidia.com>
References: <87a6apj1do.fsf@meer.lwn.net>
 <985966be-b7a1-c208-0775-d1cb4ff072cd@nvidia.com>
Date:   Thu, 09 Jun 2022 09:33:16 -0600
Message-ID: <87sfod4zsz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dipen Patel <dipenp@nvidia.com> writes:

> Acked-by: Dipen Patel <dipenp@nvidia.com>
>
> On 6/6/22 7:46 AM, Jonathan Corbet wrote:
>> The hardware timestamp engine documentation is driver API material, and
>> really belongs in the driver-API book; move it there.

Thanks...I'll push this through the docs tree unless I hear an
objection.

jon

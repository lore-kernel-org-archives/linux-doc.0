Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F989C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:20:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3DDC161166
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:20:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbhEMPVu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 11:21:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:42914 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234788AbhEMPVt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 11:21:49 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DDD83153;
        Thu, 13 May 2021 15:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DDD83153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620919239; bh=1GxC20Eyje0ZIdRmzwDiw8d1/lPC46A2ArGVMZcAyLM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=CQM8/gd15dSYIkGgBcjK1kv6n2vooJuW+Ud8hut6y+hGukgmPgVOxdlGzLYYpho+t
         kDOtmdCHtj5gbe21gndUGTyt4JRx1GBuWxMFV9Ifw8xzrY/iAF8iscCJ+IzVhJGknR
         kjz6/t728GG2VcGT5muMq29ZAgxe4v8u0MFuTG6y+WdxtDNkpD2L05cydXZK8+xuox
         bHHu3jY2lBc06apTHxZAUpHq3cjL58BPbktwZEbdRwtf0ivkX3w4QuQTy12/jgtGyl
         myzUhvoJxBEAfl5D3rypFkXNsC2eh2EVrw4yBrPdOGPPwgVugnxr/eaceEFR8EwszV
         /Aeq6X9Qu0QAQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Federico Vaga <federico.vaga@vaga.pv.it>,
        Sanjeev Gupta <ghane0@gmail.com>
Cc:     linux-doc@vger.kernel.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/2] Documentation/translations/it_IT: switch some links
 to https
In-Reply-To: <20210512082434.timdb2sxntl6mktl@numero86.vaga.pv.it>
References: <cce90d8d.ANEAAKAcMY8AAAAAAAAAAKAiBwkAAAAAAMcAAAAAAA6qeABgmMlr@mailjet.com>
 <20210512082434.timdb2sxntl6mktl@numero86.vaga.pv.it>
Date:   Thu, 13 May 2021 09:20:38 -0600
Message-ID: <87h7j67j95.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Federico Vaga <federico.vaga@vaga.pv.it> writes:

> On Mon, May 10, 2021 at 12:58:29PM +0800, Sanjeev Gupta wrote:
>>Links have been checked to ensure that the old and new URL
>>return the same page.  This is not true for many links.
>>
>>Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
>
> Signed-off-by: Federico Vaga <federico.vaga@vaga.pv.it>

I'm confused...why are you sending a signed-off-by here?  Did you mean
acked-by?

Thanks,

jon

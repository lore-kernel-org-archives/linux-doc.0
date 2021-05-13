Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F165C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 16:18:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CCA961435
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 16:18:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235053AbhEMQTv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 12:19:51 -0400
Received: from ms.lwn.net ([45.79.88.28]:44182 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229521AbhEMQTu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 12:19:50 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A1B811C12;
        Thu, 13 May 2021 16:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A1B811C12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620922720; bh=l25DjLmkgCz45CsShV+ujVrwg8QeKhTDM64XVDSHgXc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mPoGMd5+wG6kNEzJhm9uy1dxPXCyKZvh+hqDBdn0Y7Qw2Af1WW3PQ4NXeym44BQY1
         XCkluwfBi5eDf7TK6iNxhAdrkT77ux5kQaNBirVo1s9EjcLUeVnm03jho/P0oM7TF+
         0q2weUy2EKS8JWkwfm7LEXqz7HPwfttpSoE+fVKlJgHFmBSd+Yj5LhlnLY0RL9IObL
         XCG89A/bpvaGFXeAk6nBE6LIFBVFiaEES7RW1zFYRMN5ySwS8E5oRj2RS8vIGgo85G
         Amwvu1G+QAftGr3eC2yYvSLN3xdr4ot0ABMWQiKxJPPIgOE/2ZHennmMBe/v2YYCcr
         Q5btOMKxS3Qug==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>
Subject: Re: [PATCH v3] docs/zh_CN: add core-api workqueue.rst translation
In-Reply-To: <87lf8i7jbj.fsf@meer.lwn.net>
References: <20210512083341.914-1-siyanteng@loongson.cn>
 <87lf8i7jbj.fsf@meer.lwn.net>
Date:   Thu, 13 May 2021 10:18:40 -0600
Message-ID: <87o8de61zz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jonathan Corbet <corbet@lwn.net> writes:

> I've applied this, but...
>
> Yanteng Si <siyanteng@loongson.cn> writes:
>
>> v3:
>>
>> * Pick Alex'S review-by tag.
>>
>> v2:
>>
>> Some bad translations have been modified as suggested by Alex.Thank you for your review.
>> https://lore.kernel.org/linux-doc/CAEensMwq=i+nek6sNeqOJJMY648Q9ZF8cTKpXdJVuqdQQnMWUw@mail.gmail.com/T/#t
>>
>> v1:
>
> Text like the above belongs below the "---" line so I don't have to edit
> it out of the changelog by hand.
>
>> This patch translates Documentation/core-api/workqueue.rst into Chinese.
>>
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>> Reviewed-by: Alex Shi <alexs@kenrel.org>
>
> I fixed that typo too - it appears to originate from Alex...:)

Actually, I've dropped this back out; it creates vast numbers of
warnings:

> Documentation/core-api/workqueue:398: ./include/linux/workqueue.h:3: WARNING: Duplicate C declaration, also
> defined at translations/zh_CN/core-api/workqueue:3.

This will be the result of the ".. kernel-doc::" directives at the end,
which create new definitions (within sphinx) for all the symbols pulled
in.

In the long term, we may want to try to find some sort of fix for this.
But we're really just recreating a bunch of (English-language)
documentation that's already rendered once; I'm not sure it makes any
real sense to do that.  So I would suggest that, for now, when you are
translating documents with kernel-doc directives, you should leave those
directives out.  Stick in a note directing readers to the original if
they want to see that material...

Make sense?

Thanks,

jon


Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71560C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 13:29:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19D2164F44
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 13:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231161AbhCQN2u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 09:28:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:59972 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230443AbhCQN2d (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Mar 2021 09:28:33 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id EF5CC2B0;
        Wed, 17 Mar 2021 13:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF5CC2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615987713; bh=a8k7q9FHBn/dR7hbs0CE3lJvCgLF42ArBIQpProJ5C8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nKl0m4P33MzoCZC2DAZtGfaXkI+W1U5vXcY1kuQ4qe7hMPpY7sBWDcP7jxNZ3g3vG
         ysIwtPldMqSa54wScq3CcbpaIYSw538fIDsS9cYAqIyya3iytWhtBNyjbYwakTdakk
         G774Fh6Uh2MglngJTvPGU9Lk6FcIB+FfsXvper7Fh76vgZ0X8lAxauwdLW5/NJajii
         BjMmzh0N8a3XwlQxh+rAAgX/PhjsOk6BdmWASHc75be+ZYibtbDPZuzPQnhOtUp5Bq
         Np32xJ9S5rnHOByY4nFqGffpcetzqc5GrAsV734U4v+iiJg4ftXiLk7N2qwojdAQ2W
         G7akImi5l5Y4w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <alex.shi@linux.alibaba.com>, "Wu X.C." <bobwxc@email.cn>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_CN: Add zh_CN/admin-guide/bug-bisect.rst
In-Reply-To: <8beea937-5df0-27a8-1b38-50c8f9cea3dd@linux.alibaba.com>
References: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
 <3311b919-2f86-af05-97fc-ce1d4db277f9@linux.alibaba.com>
 <20210317024944.GA20193@mipc>
 <8beea937-5df0-27a8-1b38-50c8f9cea3dd@linux.alibaba.com>
Date:   Wed, 17 Mar 2021 07:28:32 -0600
Message-ID: <871rcdykn3.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <alex.shi@linux.alibaba.com> writes:

> =E5=9C=A8 2021/3/17 =E4=B8=8A=E5=8D=8810:49, Wu X.C. =E5=86=99=E9=81=93:
>> On Wed, Mar 17, 2021 at 10:29:21AM +0800, Alex Shi wrote:
>>> LGTM.
>>>
>> Thanks!
>> Is this could be regarded as a review-by?
>
> Yes, you could say so for me.

Please be explicit when offering tags - we don't want people (including
me) making them up...

Thanks,

jon

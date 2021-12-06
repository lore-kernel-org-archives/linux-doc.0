Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EFB5C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 18:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbhLFSWb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 13:22:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244449AbhLFSW1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 13:22:27 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962F4C061746
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 10:18:58 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 423A8385;
        Mon,  6 Dec 2021 18:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 423A8385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638814738; bh=9tvQBIU7+0c0TI87DajjXZiWD3w94DcGI2KTGwBs2/g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KEsjAmogJ7TqN6aRv4IlwApLs0yPz5/8L03ZNHj9OSl7qm1Pk+w/N82n8C8fOXMYS
         bjmoH6irLzONXMk9V1RP6U2nIz0AVtoigFtmVLBIwdFoUiD1kO4TI2wNGTQ03W1ZOJ
         I9l/6dNihkjU6APpQ6TtyFSy6oP8szIn4F9SS5Jr4V0s30jRBGBE1pbnfBKVfMJM76
         WrdHGEfpd1BqyB0qtgSqexZxQRmguQ/7EsMvnnqjQWDtyZ3DM9JJPYbHyxpADCAktM
         JLHPTEXg6YXgDEariUkxNhTS1BTk7VuucTBfv2tdCjHXgPI6U3Pf2NxaPuF/3E9QQQ
         Xhgelp9KIlJfw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     teng sterling <sterlingteng@gmail.com>,
        Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        zhengbin13@huawei.com, tangyeechou@gmail.com
Subject: Re: [PATCH v3] doc/zh-CN: Update cpu-freq/cpu-drivers.rst to make
 it more readable
In-Reply-To: <CAMU9jJpOPBkBhgj49qT21Mfu4SZ5pf8cLenb0OweZi2szuvDpQ@mail.gmail.com>
References: <20211202050816.12240-1-tangyizhou@huawei.com>
 <CAMU9jJpOPBkBhgj49qT21Mfu4SZ5pf8cLenb0OweZi2szuvDpQ@mail.gmail.com>
Date:   Mon, 06 Dec 2021 11:18:57 -0700
Message-ID: <87czm938by.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

teng sterling <sterlingteng@gmail.com> writes:

> Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=884=E6=
=97=A5=E5=91=A8=E5=85=AD 22:41=E5=86=99=E9=81=93=EF=BC=9A
>>
>> There are some syntax errors in this document.
>> Also make it more readable.
>>
>> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> LGTM=EF=BC=8C I have signed Acked-by  in v1.

It would have been good to capture this ack in subsequent postings.

I've applied the patch, thanks.

jon

Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15447C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 17:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAAAE6058D
	for <linux-doc@archiver.kernel.org>; Mon,  1 Nov 2021 17:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbhKAR3B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 1 Nov 2021 13:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbhKAR27 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 1 Nov 2021 13:28:59 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD97C061714
        for <linux-doc@vger.kernel.org>; Mon,  1 Nov 2021 10:26:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 29C3077D;
        Mon,  1 Nov 2021 17:26:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 29C3077D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1635787586; bh=nOHdfCaVf82orMW5Q+S2KjOqJvGhs679BlZASt+GvDI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=klvI7YiDFcyjNQAkzn3ssDacgomBdXfroXPI7ncoEB/aGrC7Rz7rdAeu9/A7OWwDg
         Ex5n6jVlhG2EXiECaYAuD1p+0J74kzt5n2pO3DNcbK5Y/DkL05c7mVDd7eoHutSOki
         y76KCBEf+Pk51lfHZ57aUw5HYqsgGk11lofpHe2IEnWM6Idb5PNYt9jl98kPpotWl2
         gIoRGM2WhniP5vfOxUnnNs/bhMILy1e+M8nt3N5dw2wOoOl1i3rMHGILgPUTiqHcy0
         9q8tIqIDR64m+bnux5upDZoJjbfw+lGbnDD0XGsj2AruWLGIL4qGS80s1V/ZYR+ANx
         8uyzuHZ+Em6ug==
From:   Jonathan Corbet <corbet@lwn.net>
To:     yanteng si <siyanteng01@gmail.com>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Subject: Re: [PATCH v2 0/2] docs/zh_CN: add core-api assoc_array and xarray
 translation
In-Reply-To: <CAEensMzpsCBB41+ueHsOVV_qbi6jrBpJ7N0bh04u8W8BFnASFg@mail.gmail.com>
References: <cover.1634358018.git.siyanteng@loongson.cn>
 <CAEensMzpsCBB41+ueHsOVV_qbi6jrBpJ7N0bh04u8W8BFnASFg@mail.gmail.com>
Date:   Mon, 01 Nov 2021 11:26:25 -0600
Message-ID: <87fssf6b3y.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

yanteng si <siyanteng01@gmail.com> writes:

> Yanteng Si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B410=E6=9C=8816=E6=
=97=A5=E5=91=A8=E5=85=AD =E4=B8=8B=E5=8D=8812:25=E5=86=99=E9=81=93=EF=BC=9A
>>
>> v2:
>>
>> * Modified some words under Alex's advices
>> * pick Alex's Reviewed-by tag.
>>
>> v1:
>>
>> Translate .../core-api/assoc_array.rst and ../core-api/xarray.rst into C=
hinese.
>>
>> Yanteng Si (2):
>>   docs/zh_CN: add core-api assoc_array translation
>>   docs/zh_CN: add core-api xarray translation
>
> Ping

Hmm...not sure what happened there.  Applied now, thanks.

jon

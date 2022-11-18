Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA7DC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 18 Nov 2022 16:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235347AbiKRQdH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Nov 2022 11:33:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235327AbiKRQdH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 11:33:07 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 522CD9372F
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 08:33:06 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id F056AB822E8
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 16:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635B1C433D7;
        Fri, 18 Nov 2022 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668789183;
        bh=IqJQioZejkz3+H/MmRXx03w8XCPGGVBE8BoNHDB2CUU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=k6aozHSqaYzjE8vFZuM9O6ILZ+bQjKOs0Ov93IaP1Fi7+9P7DyKseki3P2GeA8gYi
         TSvl1umtkrmKZcgNUDHAJmPYMfIBBwD8mMsl1X5nsseOtq29p05jhYbTCvvZwbnBat
         jlrnfJwgXLwWBWwnudfPa3Pkf4tHkKOKQaI8s12gOsdPhzRK+JuxXZDDcbOKLIo8OJ
         gsBTCPiuFDs25CmHcFdZCtI7dc25vwdRDs65C+iGToQVAUwesTrphdfAE3lycZJJDN
         sHFCucTv+I1T6nDDwbRP/CGoc3N4u+Kvre8CCpgSZNnpcPhQmGPlnJ089qtZpapoSr
         NJfN23OGk7hxw==
From:   =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To:     Alexandre Ghiti <alex@ghiti.fr>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc:     =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Document the sv57 VM layout
In-Reply-To: <da4eaceb-9561-4744-d3c9-459b6a70783f@ghiti.fr>
References: <20221031180230.1420544-1-bjorn@kernel.org>
 <da4eaceb-9561-4744-d3c9-459b6a70783f@ghiti.fr>
Date:   Fri, 18 Nov 2022 17:33:01 +0100
Message-ID: <87r0y0rznm.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alexandre Ghiti <alex@ghiti.fr> writes:

> Very very nit but "+64" is not correctly aligned :)

Thanks! I'll fix that!

>> +   ffdfffff00000000 |  - 8    PB | fffffffeffffffff |    8 PB | kasan
> To me, the kasan start address is wrong, an sv57 kernel produces the=20
> following output for me:
>
> [=C2=A0=C2=A0=C2=A0 0.000000]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 k=
asan : 0xffdf000000000000 - 0xffffffff00000000=C2=A0=C2=A0=20

Indeed! Good catch! Will fix.

> And again very very nit: there is a space between the '-' and '8' :)

I'll fix that in the v2.

Thanks for having a look!


Cheers,
Bj=C3=B6rn

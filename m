Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA00FA373D
	for <linux-doc@archiver.kernel.org>; Tue,  1 Nov 2022 10:26:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbiKAK0A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Nov 2022 06:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiKAKZ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Nov 2022 06:25:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F3EBD120
        for <linux-doc@vger.kernel.org>; Tue,  1 Nov 2022 03:25:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4673B81BEF
        for <linux-doc@vger.kernel.org>; Tue,  1 Nov 2022 10:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05363C433D6;
        Tue,  1 Nov 2022 10:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667298354;
        bh=wuKVljKjoo7CAAmKnvqimj5ML/p0XtMG3b5AT3FNiUY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=LxemJVvdkhMX7mQG7YrD7OhJTl018mDRPPfuNier9VdFZq706+whpaX5vkhxs3RgO
         MW5qG6mHDBbeXex0HU7hCbmqx4qr1Y2f/NiZoPzkZF780j9kmCqxmpqVHi6m6dMoS6
         VTmHWKZQIHkir6qQtrH69BvaSuchdSWItHMjOSoOklExu/VJ8cBkNIXUV8PCOmSl+v
         Ikz80ACkSpSqcDtKrZRgfz0TTmdhT2WdT7Pi8QyTK3B8Pt9HMeUPhJXqXNH3QS7WFs
         PdnrQDRm/eyQtWsmfLSJ/4XUkby64XZRV2mBVkuidUb34gbCsEN3KVs+pl0Vk3opb7
         kTA4oWvf3QSfQ==
From:   =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        linux-riscv@lists.infradead.org,
        Alexandre Ghiti <alexandre.ghiti@canonical.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Document the sv57 VM layout
In-Reply-To: <Y2Dg5fYVfhoJmOX3@debian.me>
References: <20221031180230.1420544-1-bjorn@kernel.org>
 <Y2Dg5fYVfhoJmOX3@debian.me>
Date:   Tue, 01 Nov 2022 11:25:51 +0100
Message-ID: <87zgdbt1hs.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> The memory layout figure above should have been in table format (it is
> written as such, isn't it?):

I'm not sure, given the "::" (verbatim) for the other tables. I followed
the verbatim layout of the previous svXX layout descriptions.

> However, for consistency, other similar figures should also be converted
> to tables (as separate patch).

Yes, that can be done as follow-up patches (and also add SV32).


Bj=C3=B6rn


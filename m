Return-Path: <SRS0=BeNN=4V=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE36C3F2D1
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 00:17:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F13E0208C3
	for <linux-doc@archiver.kernel.org>; Wed,  4 Mar 2020 00:17:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="bRUY6toI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727793AbgCDARu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Mar 2020 19:17:50 -0500
Received: from bilbo.ozlabs.org ([203.11.71.1]:39461 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727429AbgCDARu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 3 Mar 2020 19:17:50 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 48XDwq2GFRz9sQt;
        Wed,  4 Mar 2020 11:17:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
        s=201909; t=1583281067;
        bh=0gG9z5CDBiXtmXaIxYa0LyR+e4XlY+OayNWFzpiYOuQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=bRUY6toIxxNAHgj9QI58MhmnkxVbhV3P/OZhfZlw4m5dX5i4IuyiArxg7loBuB7GX
         84LkFoJPwxepK/CizlCDHMbI+UQaM+YwXdGOuQxQwfIFrhY6Q0tOEsSbDoMugk+pZD
         u5BIxKb7ru3VGvxPGygtSLAaMoo6Q0dcoJ+TxL4PmAc60zzed40KAOAutFNqxGLAWI
         mNQ6IioY92ezKq/+GssCHC5ByLn9KHEDOC+NAcc/mmVAfxTiJv8UJAwYdNsGwoNxOv
         QSPQtv/YvWtcqkCsceB20t9FEE3eeremHL+IkvLTgLfCN6vwvNhKnZVmfgR3AqytuY
         6+evvG0u0cpAA==
From:   Michael Ellerman <mpe@ellerman.id.au>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 14/18] docs: powerpc: convert vcpudispatch_stats.txt to ReST
In-Reply-To: <b85d594912818721b84b3c9a0aafa472d6d4af44.1583243826.git.mchehab+huawei@kernel.org>
References: <cover.1583243826.git.mchehab+huawei@kernel.org> <b85d594912818721b84b3c9a0aafa472d6d4af44.1583243826.git.mchehab+huawei@kernel.org>
Date:   Wed, 04 Mar 2020 11:17:46 +1100
Message-ID: <87pndtq8gl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> - Add a SPDX header;
> - Use standard markup for document title;
> - Adjust identation on lists and add blank lines where
>   needed;
> - Add it to the powerpc index.rst file.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/powerpc/index.rst                 |  1 +
>  ...ispatch_stats.txt => vcpudispatch_stats.rst} | 17 ++++++++++++-----
>  2 files changed, 13 insertions(+), 5 deletions(-)
>  rename Documentation/powerpc/{vcpudispatch_stats.txt => vcpudispatch_stats.rst} (94%)

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

I'm going to assume this will go via the docs tree, unless you tell me otherwise.

cheers

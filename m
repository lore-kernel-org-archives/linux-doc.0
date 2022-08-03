Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74D3C19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 07:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233565AbiHCHY4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 03:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbiHCHYz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 03:24:55 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507D71CFF8
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 00:24:54 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id BCC186601B45;
        Wed,  3 Aug 2022 08:24:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659511493;
        bh=gSmhm9TIwih38Vl9DKl93qZxb8KLW+ot4iOOQ1QMDvk=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=jWATBpIRNp/PmHfDO1PLpFcdyBrMoGHff4tvVgOGCmLv+DXVR3fOpniZznliaQW0L
         BdKnjAVBRVo/tUHw5YgAuokJakwdCJtLAY1C0dNtNfmCYSHww1QQ6nf4XK2AXkyUVv
         9t6TRMmYKHyCgz/UEPNLPmJej9BRf4m7+uI5c5GwcI3wMFsj0PF71y9ZEt4ZhCLvw6
         1EnqZg0uahGntvcPbAMpDgH58GtZZdENWqXaNBO5NZyqlG7rfsr57uHMC4coFPjYJ8
         9ytRc29QXDO4XIGPpLWHfK3I4tB1PsJDQr8mefSCMdDBycQyGHW+Wu98VAkF/NyLkW
         PXAm8fxp2uquw==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com> <YulJQKL22sB31lfU@casper.infradead.org>
In-reply-to: <YulJQKL22sB31lfU@casper.infradead.org>
Date:   Wed, 03 Aug 2022 09:24:49 +0200
Message-ID: <87y1w5rdq6.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Matthew,

On mar, ago 02 2022 at 16:56:48, Matthew Wilcox <willy@infradead.org> wrote:
> You don't need to use :c:func:`foo`.  You can just write foo() and the
> tooling will convert it into :c:func:`foo` for you.

Thanks for the tip. However, I did some tests and the results aren't
quite the same. For functions with kerneldocs that are referenced in the
same document (.. kernel-doc::) the tool does efectively link to the
generated documentation, but for all the other functions using
c:func:`foo` generates a different formatting than `foo`, which does no
formatting at all.

I don't know if the extra semantic info can be used by the tooling in
any other way, in case it doesn't the fancy formatting might not be
worth it in exchange for a noisier source text, but I've seen it been
used in other driver-api docs.

Cheers,
Ricardo

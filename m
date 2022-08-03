Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E4BC19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 07:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbiHCHI7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 03:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232547AbiHCHI6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 03:08:58 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10AC210CD
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 00:08:58 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4FB406601B14;
        Wed,  3 Aug 2022 08:08:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659510536;
        bh=Eve3Lr0Cb9xre2AkLAV1bWZOKV4+4t925HBE9wMRarE=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=JJYt01JngWP5KICr3wnQ+IXrWv7a1PglME1yHLOlQxDp3+V8sUjET+zElYM4pUHvZ
         XmSSq+QqHeVhXfRftslgZrZGOLK2RJ5oNaDABT4uqNb31laQsQ99cQRjX5GlAw/t7M
         Nsja/+0sUmWw+19JQDRqGTkFx/wVPXiI/5iytZ6Jjs8cw8IuKNoEcjr5aHS/ZrDVyK
         xloJEfSUJx0nfzYn3YndAPM2HP0HuJUhgw4pgshC9bCo7NsTviyT5vAm+Xsg+6uuWt
         btNusU4pJQ4Pl53MOSV5Ay+/YuXrnFeOCZILW+VMbtcv6PeRZJgXoqTXzAI/x/RQ2N
         HMtHAq/AuYDSA==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com> <YulJQKL22sB31lfU@casper.infradead.org>
In-reply-to: <YulJQKL22sB31lfU@casper.infradead.org>
Date:   Wed, 03 Aug 2022 09:08:53 +0200
Message-ID: <874jytst16.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

> On Tue, Aug 02, 2022 at 02:42:22PM +0200, Ricardo Ca=C3=B1uelo wrote:
>> +In this case, when the interrupt arrives :c:func:`vp_interrupt` will be
>> +called and it will ultimately lead to a call to
>> +:c:func:`vring_interrupt`, which ends up calling the virtqueue callback
>> +function::
>
> You don't need to use :c:func:`foo`.  You can just write foo() and the
> tooling will convert it into :c:func:`foo` for you.

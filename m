Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438CBC19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 07:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbiHCHpd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 03:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiHCHpc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 03:45:32 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A284FB7E9
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 00:45:31 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 324F86601B45;
        Wed,  3 Aug 2022 08:45:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659512730;
        bh=DDHWG7koKngweOGbXf0eKGpkKl/gQrOomCIhq1xo9zc=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=b1fnFz82szG5hGgXW1uW45eYKZaKxXyE7jqJzEIaVo7aqHHbnjyZMethvKPV5EbYQ
         IBTHvSxBy7eYHY0Y95NrB0kg9W3CMNDkaPaELC7TZgutv+aqKI1V+MIL81lhffWDqR
         bsDL2pukeqpYbQjcXfSN5OqF8QF4m1AtE0TSp1XZF0lYF3MncKLJCtGzYVS9o7/sTj
         qm9HCbz/burlG+2lB9pBU48bEZuFTI3mDOwmiezisQZt0Y/ZgklzfRpvPQUfoKy+uJ
         kP+6Eb+q1dy6dz9sv0djv5NecWLBEclk0TbnXC4oUNImHbYotBNEgIRgS8upZkJoZ6
         Ky6t2xjn/yIyA==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Cornelia Huck <cohuck@redhat.com>, linux-doc@vger.kernel.org
Cc:     mst@redhat.com, kernel@collabora.com,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH] docs: driver-api: virtio: virtio on Linux
References: <20220802124222.3563378-1-ricardo.canuelo@collabora.com> <87pmhi8wsg.fsf@redhat.com>
In-reply-to: <87pmhi8wsg.fsf@redhat.com>
Date:   Wed, 03 Aug 2022 09:45:27 +0200
Message-ID: <87tu6trcrs.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Cornelia,

Thanks for the review. This is my first approach to virtio and I had to
make some assumptions myself from reading the code and the spec, so I
expected lots of corrections.

On mar, ago 02 2022 at 17:55:43, Cornelia Huck <cohuck@redhat.com> wrote:
> I think kerneldoc updates should be split out into a separate patch.

Ack, I'll split them in the next version.

> There are devices that implement virtio in hardware.
> ...
> Please also mention CCW (s390 channel devices), as Linux supports it as
> well.

I'll add that to v2.

> Should be the "virtio-console (...) device when using PCI...", I guess?

You're right, I was focusing on the concrete example I was testing
instead.

> v1.2 is out now :)
>
> (I think it would be better to refer to the base spec directory?)

Do you mean this? https://docs.oasis-open.org/virtio/virtio/
Or should I link the source repo instead?
https://github.com/oasis-tcs/virtio-spec

> Chapter 5 ("Device Types") in the virtio specification [1]
>
> (and add the same reference as above in this file)?

Got it.

> Very important point here: Don't add a device driver for a device that
> has no reserved device id in the spec. Preferably, don't add a device
> driver if no spec is available (it is useful to develop
> devices/drivers/spec at the same time to avoid incompatibilities/fixups
> later; and you can consider a device spec "final" if it has been
> accepted into the spec, even if it isn't in a released version yet.)
> ...
> Don't do that :) You need to make clear that VIRTIO_DEVICE_DUMMY is only
> a placeholder.

Thanks, I'll make sure to rework this and to mention that you shouldn't
add a new out-of-spec device id.

Cheers,
Ricardo

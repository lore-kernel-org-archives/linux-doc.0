Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC61C19F2A
	for <linux-doc@archiver.kernel.org>; Thu, 11 Aug 2022 14:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbiHKOyW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Aug 2022 10:54:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235335AbiHKOyV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Aug 2022 10:54:21 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5C590C71
        for <linux-doc@vger.kernel.org>; Thu, 11 Aug 2022 07:54:17 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 58DC46601C3A;
        Thu, 11 Aug 2022 15:54:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1660229656;
        bh=lLmXmVZBOGq4chrF+Bwz2F2fOlRJ18rg5yKltE5Yy9w=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=DTEX8Uy/bGax52/BP3R+ACOjxNwPfDlWS/dgZ4tAKB/zMg94D0CBVkxQGArLW2ntg
         oWPQ+aL2AZynttvYR/ct/GF1b+LmTE7WM5xnWKbuLhNlLadD4LXBS9pBbQl4B2bbym
         Cqw3xS3m1s3yhFgOnP1KY1XP19zKl8yQ3uCqFvJyPRU31j6SovG8Iyxh1svA4tlcVL
         ZmIkSv5X4sL6KeYlI1EgnVo5E9eazw5CCDU+M6bgCRH40NnoANGNYK9vo2cYwIMeYI
         L6Acvrh048ngw2VwHU5yA4u8aXyDI9hWpENF4yv7VQsj0DVdGyHyTgsaAOvWZEHeYc
         XWw/TS/lFT39g==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com, cohuck@redhat.com, bagasdotme@gmail.com
Subject: Re: [PATCH v4 2/2] docs: driver-api: virtio: virtio on Linux
References: <20220810094004.1250-1-ricardo.canuelo@collabora.com> <20220810094004.1250-3-ricardo.canuelo@collabora.com> <20220811092436-mutt-send-email-mst@kernel.org>
In-reply-to: <20220811092436-mutt-send-email-mst@kernel.org>
Date:   Thu, 11 Aug 2022 16:54:13 +0200
Message-ID: <87czd6rfu2.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Michael, thanks for reviewing:

On jue, ago 11 2022 at 09:32:05, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> which tree is this for?
>
> Applying: docs: driver-api: virtio: virtio on Linux
> error: sha1 information is lacking or useless (MAINTAINERS).
> error: could not build fake ancestor
> Patch failed at 0001 docs: driver-api: virtio: virtio on Linux

linux-next, as stated in the cover letter:

    Tested on linux-next (next-20220802)

I just verified that the patch also applies to the vhost tree
(linux-next branch). Where did you test it?

>> +		buf = virtqueue_get_buf(dev->vq, &len);
>> +		/* spurious callback? */
>> +		if (!buf)
>> +			return;
>
> most drivers need to do this in a loop, this code is only valid if
> there's just 1 buf in flight - unusual.

That's a driver-specific consideration and this is supposed to be the
simplest possible driver skeleton, but ok.

>> +	static int virtio_dummy_probe(struct virtio_device *vdev)
>> +	{
>> +		struct virtio_dummy_dev *dev = NULL;
>> +
>> +		/* initialize device data */
>> +		dev = kzalloc(sizeof(struct virtio_dummy_dev), GFP_KERNEL);
>
>
> I dislike how we set dev to NULL and immediately to a different value
> just below.

This is a matter of style, I think. There are plenty of examples of this
in the kernel code, but I don't mind changing it.


> what is missing here is registration with Linux core.

Isn't that supposed to be done by module_virtio_driver()?


> depending on device you might need a call to device_ready, too.

I already explained below that this is done by default after probe()
(see virtio_dev_probe()). virtio_device_ready() is supposed to be useful
only if you need to use the vqs in the probe function.

>> +		/*
>> +		 * Disable vq interrupts: equivalent to
>> +		 * vdev->config->reset(vdev)
>> +		 */
>> +		virtio_reset_device(vdev);
>> +
>
> you highly likely need to detach unused buffers from vqs here.

Ack.

> let's be a bit clearer here that they must be enabled before add_buf
> triggers.

Ok.

> maybe clarify that they can still trigger even if enabled.
> if you want to disable reliable you have to reset the device
> or the vq.

I'll check that out, thanks.

Cheers,
Ricardo

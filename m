Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F587C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 11 Oct 2022 08:46:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbiJKIqv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Oct 2022 04:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiJKIqu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Oct 2022 04:46:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D9D058147
        for <linux-doc@vger.kernel.org>; Tue, 11 Oct 2022 01:46:48 -0700 (PDT)
Received: from localhost (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 21EC46602356;
        Tue, 11 Oct 2022 09:46:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1665478007;
        bh=3KO2HxBlF5JKCuTvKYUlgaA7kmIP/w4NQL7SdgZeWn8=;
        h=From:To:Cc:Subject:References:In-reply-to:Date:From;
        b=URDhMJ4hgoFFH+EH5GWdVkyApc7nk61sGZo2ToDTUxGX1IGyCM3RjUjIh1npMsuox
         CLGgZ8vByqmogluBZXWY3d9QeIBPoGOEqgLBiHMMeEXxpiVCC0fxPYutLp/oCMKZ1l
         EVa01FEe8IVs/LxzXC29hoI4iP/dJhnCElPqDRYlFaOIH34qPp5Boz8osAcsPw0+9r
         ZWwxzMFNHDvIqPWHlt0bzHZg/7I4sQsEP0BwIPAq3+7WZ1ZKw5/IFZdbwxMRMctA+d
         IxBBL2ehoPVuwtym1x7omt34VnP4U0FHOcqWuo2uSoy5EOVePHGnRE8tpJjvSQTTGm
         yGYb4FMTdbnFA==
From:   Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, mst@redhat.com,
        cohuck@redhat.com, virtualization@lists.linux-foundation.org,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com> <20221010064359.1324353-2-ricardo.canuelo@collabora.com> <Y0QYTq7KW9C731s0@debian.me>
In-reply-to: <Y0QYTq7KW9C731s0@debian.me>
Date:   Tue, 11 Oct 2022 10:46:43 +0200
Message-ID: <87v8oqsq6k.fsf@rcn-XPS-13-9305.i-did-not-set--mail-host-address--so-tickle-me>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Bagas, thanks for the review, some comments below:

On lun, oct 10 2022 at 20:04:14, Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> What link is for [2]? I think you'll need to spell out the link title.
> Also, the external reference pointers should be parenthesized to indicate
> that these are references:

That's a matter of personal opinion and I disagree with it. There's no
consensus across the kernel docs and I'm using the IEEE style, which is
fairly standard.


>  The :c:type:`vring_virtqueue` struct models a virtqueue, including the
>  ring buffers and management data. Embedded in this struct is the
>
>
> Personally speaking, ReST citations should do the job better (these
> links are external references, right?).

I don't want to use a full ReST code reference for that, as that struct
is not really part of the interface for virtio drivers and its
definition is an implementation detail. But I still want to have it
properly formatted in the html and pdf outputs, that's why I'm using
:c:type: there.


>> +It's at this stage that the virtqueues will be allocated and configured
>> +by calling the appropriate ``virtio_find`` helper function, such as
>> +virtio_find_single_vq() or virtio_find_vqs(), which will end up
>> +calling a transport-specific ``find_vqs`` method.
>> +
>
> Looks like the wording at the beginning confuses me, so better say:
>
> ---- >8 ----
> diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/driver-api/virtio/virtio.rst
> index 07fd2d7c51e689..7947b4ca690efd 100644
> --- a/Documentation/driver-api/virtio/virtio.rst
> +++ b/Documentation/driver-api/virtio/virtio.rst
> @@ -123,10 +123,10 @@ When the device is registered to the virtio bus the kernel will look
>  for a driver in the bus that can handle the device and call that
>  driver's ``probe`` method.

I think this is a matter of style as well, maybe a native speaker can
pitch in about the correctness of it.

Cheers,
Ricardo

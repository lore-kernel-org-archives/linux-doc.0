Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC6CBC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 18 Oct 2022 15:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229565AbiJRPkF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Oct 2022 11:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbiJRPkD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Oct 2022 11:40:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CB325D0E7
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 08:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666107599;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=n1ntOmfZrs8dqZ6k2VCqVjRnTeyOx20Q25jn6A/FnCk=;
        b=Iz8HKkNlCgzwq0KK26nLQbI3u0G8Nm24yNZt1gXyoOxe2nPu4xx+MefS6qmJ9hdcz23o0+
        lxy/JImACeYojqHJ/pIDdAFbnlgdxLIeVyGcAb5EnOYt9AwYb4raNk6s3WKkM+OvTxKt6N
        uH/YyRtZ7hkl9r8wm7OxhYZap7G2+G4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-230-tko7lG4uMI213XKHQfmYAw-1; Tue, 18 Oct 2022 11:39:57 -0400
X-MC-Unique: tko7lG4uMI213XKHQfmYAw-1
Received: by mail-qv1-f69.google.com with SMTP id q6-20020a0cf5c6000000b004b1999f94bcso8917957qvm.15
        for <linux-doc@vger.kernel.org>; Tue, 18 Oct 2022 08:39:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1ntOmfZrs8dqZ6k2VCqVjRnTeyOx20Q25jn6A/FnCk=;
        b=pXpaZa9vkwkPBPx3orMFpejwlXP/okEtbR16AoyXmYomx1DULGehkUdKhb3ClxGfQR
         K2tfNJSq0OueSFwt6f3B79HEQa43mpPm9fOTSluRoasjTKsyepCiXZtLvDPphMTfJowP
         +nJt+n+M3QGw0FpRLrQ4Wj1uJ3zNsd3tcp3b5U4EmVL7XjKcZ6vE0gadU6xiHcvRi/w9
         a0WWx+a0uDTpyqD9ZXvpTcg4jPXVlc0tVNnCsBDCC5OYvPJ3Xda+51ZpQ4G069DFT1mL
         ghq3gCdTsih0kkcpxjogdC0n3uCQp/eyVzniy1vG5I5671xdlTS69gVlwDOxMhTrmPxF
         TQ2Q==
X-Gm-Message-State: ACrzQf0CcNUPCLA6qi2rvVcNLBwludvvdu4mWO/ewfwjeu2yoSflFN9P
        48jVC8+lTokoT0HYLhB7/mXXmpVQTnSJ/C+qr++KQ5V+Xr1LBd9xoTSUfVDFdUhcDYTjosPeOik
        soX+hlQwrcNsY6StNgk5H
X-Received: by 2002:a05:622a:95:b0:39c:c9df:8db with SMTP id o21-20020a05622a009500b0039cc9df08dbmr2576334qtw.349.1666107597128;
        Tue, 18 Oct 2022 08:39:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7otvOjB+1WMOHwHy+ISe/cHO3iDr0yYS4pArNJuJCmujDYQmiQUjY8SAsUr16B5Qj+1fUiBQ==
X-Received: by 2002:a05:622a:95:b0:39c:c9df:8db with SMTP id o21-20020a05622a009500b0039cc9df08dbmr2576312qtw.349.1666107596881;
        Tue, 18 Oct 2022 08:39:56 -0700 (PDT)
Received: from sgarzare-redhat ([5.179.166.161])
        by smtp.gmail.com with ESMTPSA id z15-20020a05622a124f00b0039a08c0a594sm2083410qtx.82.2022.10.18.08.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:39:56 -0700 (PDT)
Date:   Tue, 18 Oct 2022 17:39:48 +0200
From:   Stefano Garzarella <sgarzare@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     mst@redhat.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, mikelley@microsoft.com,
        vkuznets@redhat.com, liuwe@microsoft.com, kkashanjat@microsoft.com,
        cohuck@redhat.com, otubo@redhat.com, andavis@redhat.com,
        aadam@redhat.com, stefanha@redhat.com,
        virtualization@lists.linux-foundation.org
Subject: Re: [RFC PATCH] virtio: document virtio hardening status and TODO
Message-ID: <20221018153948.2ocwejx4ut3sf3br@sgarzare-redhat>
References: <20221014042037.23639-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221014042037.23639-1-jasowang@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I'm not a native speaker, so the following suggestions can be wrong :-)

On Fri, Oct 14, 2022 at 12:20:37PM +0800, Jason Wang wrote:
>This patch summarizes the status of hardening and TODO of hardening
>virtio core and drivers.
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> Documentation/security/virtio/core.rst | 49 ++++++++++++++++++++++++++
> MAINTAINERS                            |  1 +
> 2 files changed, 50 insertions(+)
> create mode 100644 Documentation/security/virtio/core.rst
>
>diff --git a/Documentation/security/virtio/core.rst b/Documentation/security/virtio/core.rst
>new file mode 100644
>index 000000000000..b8baa104d7c8
>--- /dev/null
>+++ b/Documentation/security/virtio/core.rst
>@@ -0,0 +1,49 @@
>+================
>+Virtio hardening
>+================
>+
>+The virtio core and drivers should not trust the devices. This means
>+all kinds of input from the device must be validated before being
>+used. This document summarizes the current status and TODO for this
>+validation/hardening efforts.

s/efforts/effort

>+
>+
>+Status
>+======
>+
>+The virtio core and drivers has done some basic hardening:
>+
>+* Config callback hardening: The core makes sure the config interrupt
>+  callbacks are enabled after the driver is ready and disable before
>+  the driver is removed.
>+
>+* Descriptor ring hardening: The metadata of a descriptor were copied
>+  and stored in a driver private memory that can not be accessed by the
>+  device. The eliminates the device triggerable behaviours through the

s/The/This ? (not sure)
)
>+  descriptor ring.
>+
>+* Device configuration space validation: Some of the virtio drivers
>+  validates the fields of device configuration space before try to use

s/validates/validate

>+  them.
>+
>+
>+TODO
>+====
>+
>+* Input buffer length validation: The virtio core needs to validate
>+  the input buffer length validation before passing them to individual

Remove "validation"?

>+  virtio drivers.
>+
>+* Virtqueue callback hardening: The virtio core (or with the help of
>+  the drivers) should guarantee that the virtqueue callbacks should not
>+  be triggered before the driver is ready or after the driver is
>+  removed.
>+
>+* Transport specific data validation: The virtio transport driver should
>+  validate the virtio transport specific data provided by the device
>+  before trying to use them in the probing.

s/in the probing/during the probe   ?

>+
>+* Device specific validation: Driver should validate the device specific
>+  metadata before being used by a specific subsystem.
>+
>+
>diff --git a/MAINTAINERS b/MAINTAINERS
>index 673b9f9b8d8a..b33cc5c751c1 100644
>--- a/MAINTAINERS
>+++ b/MAINTAINERS
>@@ -21516,6 +21516,7 @@ S:	Maintained
> F:	Documentation/ABI/testing/sysfs-bus-vdpa
> F:	Documentation/ABI/testing/sysfs-class-vduse
> F:	Documentation/devicetree/bindings/virtio/
>+F:	Documentation/security/virtio/core.rst
> F:	drivers/block/virtio_blk.c
> F:	drivers/crypto/virtio/
> F:	drivers/net/virtio_net.c
>-- 
>2.25.1
>

Thanks,
Stefano


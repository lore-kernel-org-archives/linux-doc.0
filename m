Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62E7CC4332F
	for <linux-doc@archiver.kernel.org>; Mon, 17 Oct 2022 06:10:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229837AbiJQGKF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Oct 2022 02:10:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbiJQGKD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Oct 2022 02:10:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBD52DAB5
        for <linux-doc@vger.kernel.org>; Sun, 16 Oct 2022 23:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665986999;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=v20PsHQp4Qr88/YGRnhqDCcY6Y/q2BfOq83xhjsjfWE=;
        b=g792YOxNNELLHGMCvgHen3fZ+AAnmOaglvU1UfKi4SO90tifa7JEnG4yDSlpYdmcGLABrW
        dn6mYSZW2fOm8sgAjXBi/efFPP3eabFe2iay/uXI1S06N3GEYQLjHxorORNb0o63NnDeVS
        AJH6Z41dc8/5cfpGtGOqlri1VdD0DRA=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-267-CuPYGkwGPxS85oNcuTa7eA-1; Mon, 17 Oct 2022 02:09:57 -0400
X-MC-Unique: CuPYGkwGPxS85oNcuTa7eA-1
Received: by mail-ot1-f70.google.com with SMTP id q7-20020a05683022c700b006619497e589so4631447otc.22
        for <linux-doc@vger.kernel.org>; Sun, 16 Oct 2022 23:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v20PsHQp4Qr88/YGRnhqDCcY6Y/q2BfOq83xhjsjfWE=;
        b=dSAj1UnAz49T2klXpw/P29VC5PE/5AR2eRNhkmguXLU7NiVsgOvcQwhEve4DYVffBv
         8ugqsHbE8XdM6phSy3Sgel+0gUqPE2Vm93NJmzT3CMYVPW1xfWJs+VOehhceXuPaLSDy
         iPwkRxeoFv9uEk7v8mDvftrAUy0k4q8zzUbiIqogWeR9zqNiNeBgTfrhSQfKhpKgAeWv
         lK0PO/q6ZdAnlm5tlQ+ac4miCPIVqVLMGXlGSZKUSbwUK896GU2eJLD7wj/IelnVpF4w
         PHpLnsyO6Ba9JxvIr/+DtGIlkbO4wyrO3R7Ihi3qmkvuEj5N/7hIR/i6iPGZJoe6ZTqy
         lOwg==
X-Gm-Message-State: ACrzQf3u4jxjzU1Vut/vxkp6zHS8KkPU+9d/Wz5lp8u0e0mcNrelNzfF
        avEyyWkKoG346l/34J9QeX8PRm7e3mLnnvaRLGtSH4gPpXS99pMDKK65mRrcqlkL+Ij+KNqQIF6
        15GY95ZY6ArR8FGVp+QxspZVcGDWMo/JFzlI0
X-Received: by 2002:a05:6870:c1d3:b0:136:c4f6:53af with SMTP id i19-20020a056870c1d300b00136c4f653afmr14165197oad.35.1665986997263;
        Sun, 16 Oct 2022 23:09:57 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM41XKqiAwqq1+LJqy0pjBH7CDaaGUaBJECgFukJbjvEBs+g6HV7XQp1KrgniibZS6klAviHK6cZxtQfuDC2mw8=
X-Received: by 2002:a05:6870:c1d3:b0:136:c4f6:53af with SMTP id
 i19-20020a056870c1d300b00136c4f653afmr14165187oad.35.1665986997103; Sun, 16
 Oct 2022 23:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221014042037.23639-1-jasowang@redhat.com> <87o7ueh5bd.fsf@meer.lwn.net>
In-Reply-To: <87o7ueh5bd.fsf@meer.lwn.net>
From:   Jason Wang <jasowang@redhat.com>
Date:   Mon, 17 Oct 2022 14:09:45 +0800
Message-ID: <CACGkMEuMX2b6pQwaKMQy+OEFoB7BLs0BmxqORYeP-D7oo5irmA@mail.gmail.com>
Subject: Re: [RFC PATCH] virtio: document virtio hardening status and TODO
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     mst@redhat.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, mikelley@microsoft.com,
        vkuznets@redhat.com, liuwe@microsoft.com, kkashanjat@microsoft.com,
        cohuck@redhat.com, otubo@redhat.com, andavis@redhat.com,
        aadam@redhat.com, stefanha@redhat.com, sgarzare@redhat.com,
        virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 14, 2022 at 10:02 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> Jason Wang <jasowang@redhat.com> writes:
>
> > This patch summarizes the status of hardening and TODO of hardening
> > virtio core and drivers.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  Documentation/security/virtio/core.rst | 49 ++++++++++++++++++++++++++
> >  MAINTAINERS                            |  1 +
> >  2 files changed, 50 insertions(+)
> >  create mode 100644 Documentation/security/virtio/core.rst
>
> Do you really need to create a new directory for a single file?
>

Not sure, but I think we can start without a dedicated directory.

> Regardless of where it sits, you'll need to add this file to an
> index.rst file so that it becomes part of the docs build.

Yes, I will fix it.

Thanks

>
> Thanks,
>
> jon
>


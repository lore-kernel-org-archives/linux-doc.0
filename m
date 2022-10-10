Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1277C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 17:11:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiJJRLN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 13:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbiJJRLL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 13:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1FE65D13B
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 10:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1665421870;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P9NfgzGmgVHxFqR0Y0j+fAt5NS/eJLSM6XJubr6jJOw=;
        b=iRApWFDDt56g/SCCtntaWepA0J1SB/cPsaavbFJqwfpvTt36pD0WlvCcgVxeFmDZtPqJgE
        bzz057mDPyiQZtv5IZXjyX8OUmN+mTK0nfj8WXUc5yNuZ7F3TMnTUHwTi0ENyMtgfOnq8t
        eaSCbrZr9Cop0ro1EA56DXe/kQoFTDg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-542-6uCm2uCKM-aqIy3-iW9cjQ-1; Mon, 10 Oct 2022 13:11:09 -0400
X-MC-Unique: 6uCm2uCKM-aqIy3-iW9cjQ-1
Received: by mail-wm1-f70.google.com with SMTP id b7-20020a05600c4e0700b003bde2d860d1so7258369wmq.8
        for <linux-doc@vger.kernel.org>; Mon, 10 Oct 2022 10:11:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P9NfgzGmgVHxFqR0Y0j+fAt5NS/eJLSM6XJubr6jJOw=;
        b=zS6DGL3flY5STVM8CXq5X49dGN1/7lZeIMkEXesIe1XOd4lveWHZlQx4z957Vns7n7
         UeWEGEFPeJBhOWJj3hQjtQw1/6qync0Lrav16tM/MZljWtviRinxJc+8XXGEdvMV8xJ2
         u9aAlcbB2B8jotUfuJWu+EBAkfKbi7iw4E/OmyNFGmmrKnNoZenMItr53YJizVMBf49c
         nG3EfyyS6YHw0W88WnkzJIsIkZMeruyhGZLUXoijXwpRO24swS4VQsTzmH2I2TAxShDw
         EVYCzNiKScQgZREtC21LOW9Jg2j6i7bxqeXnEnwJAAW55r3OWo1Yn80OQbAgARndY+Pi
         gQGA==
X-Gm-Message-State: ACrzQf1XASlibpNuPPdiZlfazSI9vQcv7H+s9eO9l+FRhW730oaOUceu
        qiLmyUVsKSEMrQBQwG1/qDAPyihzqapuqB1vdvY0gerFvq6HG7ogumIkwvA4zYyKbojwhLv0Dh+
        G1ZtIJdgSsRXuxYNCSTXo
X-Received: by 2002:a05:600c:3d86:b0:3b4:b65f:a393 with SMTP id bi6-20020a05600c3d8600b003b4b65fa393mr13839069wmb.0.1665421867815;
        Mon, 10 Oct 2022 10:11:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4paSlcEHu77wmfd4kPloL/5aD3D2LVHIS6yHrVgvgOo7XBb0n0lXt/WK+JV+UeHSyU/3B+oA==
X-Received: by 2002:a05:600c:3d86:b0:3b4:b65f:a393 with SMTP id bi6-20020a05600c3d8600b003b4b65fa393mr13839044wmb.0.1665421867568;
        Mon, 10 Oct 2022 10:11:07 -0700 (PDT)
Received: from redhat.com ([2.55.183.131])
        by smtp.gmail.com with ESMTPSA id u16-20020adfdd50000000b002238ea5750csm11814353wrm.72.2022.10.10.10.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 10:11:07 -0700 (PDT)
Date:   Mon, 10 Oct 2022 13:11:00 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     Bagas Sanjaya <bagasdotme@gmail.com>,
        Ricardo =?iso-8859-1?Q?Ca=F1uelo?= 
        <ricardo.canuelo@collabora.com>, linux-doc@vger.kernel.org,
        corbet@lwn.net, virtualization@lists.linux-foundation.org,
        jasowang@redhat.com, kernel@collabora.com
Subject: Re: [RESEND PATCH v5 1/1] docs: driver-api: virtio: virtio on Linux
Message-ID: <20221010130951-mutt-send-email-mst@kernel.org>
References: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
 <20221010064359.1324353-2-ricardo.canuelo@collabora.com>
 <Y0QYTq7KW9C731s0@debian.me>
 <877d17n699.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <877d17n699.fsf@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 10, 2022 at 03:43:46PM +0200, Cornelia Huck wrote:
> On Mon, Oct 10 2022, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> 
> > On Mon, Oct 10, 2022 at 08:43:59AM +0200, Ricardo Cañuelo wrote:
> >> +
> >> +References
> >> +==========
> >> +
> >> +_`[1]` Virtio Spec v1.2:
> >> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
> >> +
> >> +Check for later versions of the spec as well.
> >> +
> >
> > The version checking should be made comment (not visible on the output):
> >
> > ---- >8 ----
> > diff --git a/Documentation/driver-api/virtio/virtio.rst b/Documentation/driver-api/virtio/virtio.rst
> > index 70b3aa6bcf5518..4f3abbec4e8b2c 100644
> > --- a/Documentation/driver-api/virtio/virtio.rst
> > +++ b/Documentation/driver-api/virtio/virtio.rst
> > @@ -134,7 +134,7 @@ References
> >  _`[1]` Virtio Spec v1.2:
> >  https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
> >  
> > -Check for later versions of the spec as well.
> > +.. Check for later versions of the spec as well.
> >  
> >  _`[2]` Virtqueues and virtio ring: How the data travels
> >  https://www.redhat.com/en/blog/virtqueues-and-virtio-ring-how-data-travels
> >
> >> diff --git a/Documentation/driver-api/virtio/writing_virtio_drivers.rst b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> >> new file mode 100644
> >> index 000000000000..e14c58796d25
> >> --- /dev/null
> >> +++ b/Documentation/driver-api/virtio/writing_virtio_drivers.rst
> >> <snipped>...
> >> +References
> >> +==========
> >> +
> >> +_`[1]` Virtio Spec v1.2:
> >> +https://docs.oasis-open.org/virtio/virtio/v1.2/virtio-v1.2.html
> >> +
> >> +Check for later versions of the spec as well.
> >
> > Same reply.
> 
> I don't think we should hide that in a comment -- unless you want to
> update this file every time a new version of the virtio spec gets
> released.

What do you suggest? Just http://docs.oasis-open.org/virtio/virtio/ ?

-- 
MST


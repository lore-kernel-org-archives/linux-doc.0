Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFD7C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 20 Dec 2021 22:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbhLTWth (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Dec 2021 17:49:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44374 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230395AbhLTWtg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Dec 2021 17:49:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640040574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yxjdrsii06Uu6Yalmn32bZyWE+btTppxgBmmcjw46Bk=;
        b=AzoBgQggQX+LPI+eq6iUUYepA2QkWJbdrZWImStc1lMHuBRa+HW/3DjTPtjmla6dFW56sV
        O+vmAD1BiNxDX3h4iJBWs955npZFBA7fVTg5isQGi7y6OR5IpZ2JSdkX6vhaxRjBnx8ytY
        GnenWb8C7uu5/YCTMbkuT7T1ZQadvts=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-ddmZAzWWN-aseGzPlhY4mA-1; Mon, 20 Dec 2021 17:49:34 -0500
X-MC-Unique: ddmZAzWWN-aseGzPlhY4mA-1
Received: by mail-ot1-f71.google.com with SMTP id l13-20020a0568302b0d00b00570d0da96a5so3787838otv.16
        for <linux-doc@vger.kernel.org>; Mon, 20 Dec 2021 14:49:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yxjdrsii06Uu6Yalmn32bZyWE+btTppxgBmmcjw46Bk=;
        b=qUAWk0DEnOZFWYQ76IsoPiw1OpZr6umKqsvS8WXi6XGW+XYThzyxVHWgdkORzop48w
         qYnsJd4afkmVR23x3Kk40n26FzroO0DEDWNFXJsJuxAagKQAV9E1CNrk8z+4jcJ9E8MV
         iVyncDrq9KMJ1XyrpgM5lkdKl0uENEP/q2sybr2Zvf1PAT/1SUTHh0lzbY1gijQocwrh
         q33lsuH+VtyiFljl+pq14W8fNCYdmdREtPxeSQqO2Kkec6UpMXFs9X/2Y3j4/U/9OaTj
         MLZdqQ8dGZRcBhuK/RKHmwLerwBbNnvC8jBdjp8oex11EJMEJATfynrJgpayo0BnJDbh
         ZDyA==
X-Gm-Message-State: AOAM531DWa1dHP9qWsXRrCNNIBfj6nsaqRsDyA8jCwuLU1BVjh7TpX5J
        B5YxUlu1ek+8Y8NUAkdFU5SnSEIYn/Wo8jBizInn/aVv6EkzLpWIUzDumflfKHdityhTFT3Ryts
        aqqGVHBrnlYVEe47nLwHt
X-Received: by 2002:a9d:5ccc:: with SMTP id r12mr238107oti.67.1640040572675;
        Mon, 20 Dec 2021 14:49:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpo8SkxsdjD66LatXQlf8w+5nAY9jvQykyRKZtRl290x2znLJAdMFUpWV4zU1FZDgNjhXqzA==
X-Received: by 2002:a9d:5ccc:: with SMTP id r12mr238086oti.67.1640040572398;
        Mon, 20 Dec 2021 14:49:32 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id v12sm3406642ote.9.2021.12.20.14.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 14:49:32 -0800 (PST)
Date:   Mon, 20 Dec 2021 15:49:30 -0700
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Cornelia Huck <cohuck@redhat.com>
Cc:     jgg@nvidia.com, corbet@lwn.net, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, farman@linux.ibm.com,
        mjrosato@linux.ibm.com, pasic@linux.ibm.com
Subject: Re: [RFC PATCH] vfio: Update/Clarify migration uAPI, add NDMA state
Message-ID: <20211220154930.071527e3.alex.williamson@redhat.com>
In-Reply-To: <87v8zjp46l.fsf@redhat.com>
References: <163909282574.728533.7460416142511440919.stgit@omen>
        <87v8zjp46l.fsf@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 20 Dec 2021 18:38:26 +0100
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, Dec 09 2021, Alex Williamson <alex.williamson@redhat.com> wrote:
> 
> > A new NDMA state is being proposed to support a quiescent state for
> > contexts containing multiple devices with peer-to-peer DMA support.
> > Formally define it.  
> 
> [I'm wondering if we would want to use NDMA in other cases as well. Just
> thinking out loud below.]
> 
> >
> > Clarify various aspects of the migration region data fields and
> > protocol.  Remove QEMU related terminology and flows from the uAPI;
> > these will be provided in Documentation/ so as not to confuse the
> > device_state bitfield with a finite state machine with restricted
> > state transitions.
> >
> > Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> > ---
> >  include/uapi/linux/vfio.h |  405 ++++++++++++++++++++++++---------------------
> >  1 file changed, 214 insertions(+), 191 deletions(-)
> >
> > diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
> > index ef33ea002b0b..1fdbc928f886 100644
> > --- a/include/uapi/linux/vfio.h
> > +++ b/include/uapi/linux/vfio.h  
> 
> (...)
> 
> > + *   The device_state field defines the following bitfield use:
> > + *
> > + *     - Bit 0 (RUNNING) [REQUIRED]:
> > + *        - Setting this bit indicates the device is fully operational, the
> > + *          device may generate interrupts, DMA, respond to MMIO, all vfio
> > + *          device regions are functional, and the device may advance its
> > + *          internal state.  The default device_state must indicate the device
> > + *          in exclusively the RUNNING state, with no other bits in this field
> > + *          set.
> > + *        - Clearing this bit (ie. !RUNNING) must stop the operation of the
> > + *          device.  The device must not generate interrupts, DMA, or advance
> > + *          its internal state.  The user should take steps to restrict access
> > + *          to vfio device regions other than the migration region while the
> > + *          device is !RUNNING or risk corruption of the device migration data
> > + *          stream.  The device and kernel migration driver must accept and
> > + *          respond to interaction to support external subsystems in the
> > + *          !RUNNING state, for example PCI MSI-X and PCI config space.
> > + *          Failure by the user to restrict device access while !RUNNING must
> > + *          not result in error conditions outside the user context (ex.
> > + *          host system faults).  
> 
> If I consider ccw, this would mean that user space would need to stop
> writing to the regions that initiate start/halt/... when RUNNING is
> cleared (makes sense) and that the subchannel must be idle or even
> disabled (so that it does not become status pending). The question is,
> does it make sense to stop new requests and wait for the subchannel to
> become idle during the !RUNNING transition (or even forcefully kill
> outstanding I/O), or...
> 

> > + *     - Bit 3 (NDMA) [OPTIONAL]:
> > + *        The NDMA or "No DMA" state is intended to be a quiescent state for
> > + *        the device for the purposes of managing multiple devices within a
> > + *        user context where peer-to-peer DMA between devices may be active.
> > + *        Support for the NDMA bit is indicated through the presence of the
> > + *        VFIO_REGION_INFO_CAP_MIG_NDMA capability as reported by
> > + *        VFIO_DEVICE_GET_REGION_INFO for the associated device migration
> > + *        region.
> > + *        - Setting this bit must prevent the device from initiating any
> > + *          new DMA or interrupt transactions.  The migration driver must
> > + *          complete any such outstanding operations prior to completing
> > + *          the transition to the NDMA state.  The NDMA device_state
> > + *          essentially represents a sub-set of the !RUNNING state for the
> > + *          purpose of quiescing the device, therefore the NDMA device_state
> > + *          bit is superfluous in combinations including !RUNNING.
> > + *        - Clearing this bit (ie. !NDMA) negates the device operational
> > + *          restrictions required by the NDMA state.  
> 
> ...should we use NDMA as the "stop new requests" state, but allow
> running channel programs to conclude? I'm not entirely sure whether
> that's in the spirit of NDMA (subchannels are independent of each
> other), but it would be kind of "quiescing" already.
> 
> (We should probably clarify things like that in the Documentation/
> file.)

This bumps into the discussion in my other thread with Jason, we need
to refine what NDMA means.  Based on my reply there and our previous
discussion that QEMU could exclude p2p mappings to support VMs with
multiple devices that don't support NDMA, I think that NDMA is only
quiescing p2p traffic (if so, maybe should be NOP2P).  So this use of
it seems out of scope to me.

Userspace necessarily needs to stop vCPUs before stopping devices,
which should mean that there are no new requests when a ccw device is
transitioning to !RUNNING.  Therefore I'd expect that the transition to
any !RUNNING state would wait from completion of running channel
programs.  Thanks,

Alex


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F153F7AAB
	for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2026 08:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512131; cv=none; b=i5yPltEDrN1Agv687L7cLUFeLgVXxIA35ij4S2CIXBXKg9t1XAVAHUP4SKZ39ZKmHEIkVfX/tWCqnfmpT8dQobp5eQbLq1IGB6jvNtFRQX4I0KlW1wadsGbczC0rvkkeBNxv5UXNencti3S4xThr+VcoHsX6xb2MdN1ExFTGuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512131; c=relaxed/simple;
	bh=4IIv9yG4m7qxm3IqrT9DQAomNx8kM3TWRYVx0cDnJRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MvjwRxu1T2RIgsp/I8dBjjdbpoRkRNeDPJVWzJWa9JIYROEu1a+VMLUxf9ZYCMeBLrqHNwWCng3ZtwACHBF+eb4q23afT6Z+aAg2gBkiByLzVhcTk9Xs42/epgeH7HENP6gtjJSENCOutUKxvwsnXubP3y2EhNUHz9tBMdrQofU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RRRuLrBP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o58eUkTI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRRuLrBP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o58eUkTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788512129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JKkhm4P3owmRu88ixnc//OXNGkRZebTXD50nAJpfW/8=;
	b=RRRuLrBPhKu7UPeBHcLMujz2UbQ8EEKnYBz8Dx7mxA3N4SXNvFO/3bOnmYxvWfkLEIo/bd
	JDL1j3rvpOjKCk/oOu56m/M5l3Bjlsic5O6gAQEC1wjaD+ZUxLQyW/ljqFAtU0x4/bdchy
	dRGRhkoJdFfWgMasxT5QDH6RUSaLm7I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-FP2lvU17MyuDI7SBn5H5wA-1; Fri, 04 Sep 2026 04:55:25 -0400
X-MC-Unique: FP2lvU17MyuDI7SBn5H5wA-1
X-Mimecast-MFC-AGG-ID: FP2lvU17MyuDI7SBn5H5wA_1788512125
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-472c330e555so356460f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 04 Sep 2026 01:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788512124; x=1789116924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JKkhm4P3owmRu88ixnc//OXNGkRZebTXD50nAJpfW/8=;
        b=o58eUkTIn1n+0TfDC3cJwLePSCc3lxOGt53mzUMO95szOJdoGNJIbd00+Z50Ms1qIE
         OXf8GsvptqJSCearHrvKqhxUzWkd1FqpAb+1/js3+sh0WjiRdqFVTq9bLtsQ935dcRU/
         Ibe7le+x/i3zvz8bfRkTl9L2z2uSigEX+oAR6ps+SH9mrg2CCHywAC1YAn1cwwXfxy0+
         9I/L0KesuiyGtapCz9x5Tfq8Hx7WYKN8cb3U7dxOa0Mggagf2o52py96hDUFzTAwozSv
         qbLTLIhLG/It6445uy5/VT01QMKvP9XqWVQJ31uzwsoHO8UtmGmiZfHh6J6wE5t9APx5
         HOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512124; x=1789116924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JKkhm4P3owmRu88ixnc//OXNGkRZebTXD50nAJpfW/8=;
        b=mlRyCzJ57+PhpyiaYvqJoid7VtJq+AzwdbHzsdfv/frHV+EvRu00FMkEfD1W2JarCr
         4fEqFnQjqY91cRU+xHgstqd0djXKim3JJIP0ihUz9IwMFtRM9iZjCcv+yi07QrtzmQtl
         GFqYcrf2rn5zT6wsXbU+DtDEYEga2sbzD4ht1yDZiqfeVJQkEDVB/fT038OOtXNyg5d0
         yDpWiwRS8Y5k5pOxQDW71KMGyl/ylYZF2F7iOGgWynyOQjbdkgOHFDpqM1HxFl6tiHfC
         94yVNZxntUK1sttLLZLXc4J33R/USE9apU1HPS/pV27Ybjpklm3Z+eXR/tWRCjiKri7q
         hyzA==
X-Forwarded-Encrypted: i=1; AKwUvBxtaKNePRBpO5js4iC0nggW17kOpC3ahQzXPXBk9lUyzGBnwendm40jD7eDCqbI+eOeyT19Z4zfXrM=@vger.kernel.org
X-Gm-Message-State: AFuF++kihSANWD4oZH6VDzV51EtW+1Ma1ehRiikUswqornTbZ5q+yNPQ
	cVY9qxOvd/IMyetB4C5d+pRPz//Ners2mRPVDfJBIxyYrj1ZiJoLMHvI7EzNhk6ukM5Dy8fz9rx
	KDDnStJnIfM7kEuwuJ+zdI0pCwolcJiMPQwA+bkoF/mC6/tDmjSQ7SdRSMi3ylQ==
X-Gm-Gg: AYBFou0J/0bfYn0h0RUZ1ogS8PyeGc8y5vEH3uVg8qD2C02+4f8hzb+s/ikPYA/n90M
	+rB7BoAL1a4/84w7ovzmpNLDZewNCfb7DPX+A0uVV1e760iNvEtc0kBhd703uDjujhkhYVj/sWf
	T7cC5SLnSUuxfIBYcNyxwFEyDn2gLDCNH6rDhVKCIHm7RwE1Bn0YRlIhuXHjhkzp+jGfebduohR
	J4z/0R5AH9gK14DB79/5PVcOJAmO8U1N4nG+DfF4lJzNODzYdXHVfGe4Z+7PZnW+v0bZ1DEvTFl
	BzemIvcQRSdnYxzFhuBPmAa44aqe4Q7HvT08su1e1a7TfFGj06cK6yXBPwj6rbF/UD3a5ePycz2
	8SOMh9KudD8IISOhARtH4Ke9t6K0zUFi9BZgMIfu6heQzzQ==
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr18966785e9.26.1788512124614;
        Fri, 04 Sep 2026 01:55:24 -0700 (PDT)
X-Received: by 2002:a05:600c:1c29:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-49cfc6cc06cmr18966125e9.26.1788512123997;
        Fri, 04 Sep 2026 01:55:23 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-11.retail.telecomitalia.it. [79.53.30.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm128248985e9.0.2026.09.04.01.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:55:23 -0700 (PDT)
Date: Fri, 4 Sep 2026 10:55:17 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, sargun@sargun.me, jlinbox@meta.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next 0/6] vsock: assign the guest vsock device to a
 network namespace
Message-ID: <apqGcFDFm9_Wtw4q@sgarzare-redhat>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>

On Wed, Sep 02, 2026 at 04:00:46PM -0700, Bobby Eshleman wrote:
>vsock network namespaces let a host put each VM in a namespace of its
>own. A guest has no equivalent yet. It has a single G2H device that
>cannot be assigned to a network namespace.

Thanks for this, I'll do a proper review next week, in the mean time 
some comments below:

>
>This series lets a guest move that device into a network namespace. A
>new ioctl on /dev/vsock, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, assigns the
>device to the namespace of the calling process. The namespace's existing

Why an ioctl?

I'm asking because I'd like to know if you've already considered any 
alternatives (sysfs, netlink, etc.)

How do you think the ioctl should be used? Should we provide an 
userspace tool, or extending some existing tools?

Thanks,
Stefano

>ns_mode then decides who may use it: a "global" namespace shares the
>device with every other global namespace, and a "local" namespace keeps
>the host connection to itself. The device starts out in the initial
>namespace, so until the ioctl is issued nothing has moved and no mode
>has changed. There is no explicit unassign as assigning the device back
>to the initial namespace is equivalent.
>
>The ioctl requires CAP_NET_ADMIN in the initial user namespace.
>
>Connections that can no longer reach the device after a move are reset,
>so that a namespace which has lost access cannot keep using a socket it
>opened while it still had access. Following netdevs, the device returns
>to the initial namespace when the namespace it was moved to is deleted.
>
>Transports opt in through a new netns_assign_allow callback. Only
>virtio-vsock implements it here.

Why? (Not asking to support all the others, asking to explain the reason 
or ask helps from others to extend it)

Thanks,
Stefano

>
>Patch 1 is just a const cleanup that patch 2 needs. The remaining
>patches are actual implementation and tests.
>
>Based off of Stefano's original series:
>https://lore.kernel.org/all/20200116172428.311437-1-sgarzare@redhat.com/
>
>Suggested-by: Stefano Garzarella <sgarzare@redhat.com>
>Link: https://lore.kernel.org/all/20200427142518.uwssa6dtasrp3bfc@steredhat/
>
>Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
>---
>Bobby Eshleman (6):
>      vsock: constify the transport in vsock_for_each_connected_socket()
>      vsock: add IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
>      vsock/virtio: support guest device network namespace
>      selftests/vsock: add a helper to assign the g2h device to a netns
>      selftests/vsock: test the guest vsock device network namespace
>      selftests/vsock: test the assign ioctl privilege checks
>
> Documentation/admin-guide/sysctl/net.rst           |  18 +
> include/linux/virtio_vsock.h                       |   2 +
> include/net/af_vsock.h                             |   9 +-
> include/uapi/linux/vm_sockets.h                    |   6 +
> net/vmw_vsock/af_vsock.c                           | 200 ++++++++-
> net/vmw_vsock/virtio_transport.c                   |  28 +-
> net/vmw_vsock/virtio_transport_common.c            |  28 +-
> tools/testing/selftests/vsock/.gitignore           |   1 +
> tools/testing/selftests/vsock/Makefile             |   3 +-
> tools/testing/selftests/vsock/config               |   1 +
> tools/testing/selftests/vsock/vmtest.sh            | 461 ++++++++++++++++++++-
> .../selftests/vsock/vsock_assign_g2h_netns.c       |  45 ++
> 12 files changed, 774 insertions(+), 28 deletions(-)
>---
>base-commit: d0ec95a8a4e79f2fd6063fc8932415db8c227689
>change-id: 20260831-vsock-guest-ns-d06af451da67
>
>Best regards,
>-- 
>Bobby Eshleman <bobbyeshleman@meta.com>
>


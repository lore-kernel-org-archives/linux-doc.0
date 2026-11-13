Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575142;
	b=z9T6w/m1WFXGmhbY4NECVg6a7H9WnLuC8kfNOa/yNMDJvD9N+4t85Jh+EyxmN9uNG9m5
	 9pxlpAsufHLyAO+SmAfL3nccCfFhJKQmxiwj8WuxAXWxuJ/AII68c5jxV9Ns8EDLSJH9e
	 Ij7HN73E3V0MUDyll9NrQiCfYYuSGZSNlb90n6cAWMzWSLdZyBU17ESULx6OFWUgGQ4SQ
	 sZ1R6x4uKlWz47piwzQaCSSnS3j9rDunsgReFRw+aPAHUl084XQkj52qy6tfN8GxSScFy
	 Kfca4ZCnTPDjuP7IHOahjor5hgwYARGS9pOMostBYwDlBbwY5ctdFi+5XmQhu2W5vpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575142;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=v4TApKQ2t0hyQZxEXCOTGwfQDcbqzJhHn9ZrRsucxAk=;
	b=0Ayh9ReNL1AQObFu6G79JX8HTv5oI747bTDQVNkB7BkMenrzWLaEkM0tk7+qTQmolW+Z
	 4vtgTQlN/CxIZKbUufc9o89wb1tMipR5BCrES7MLCKwty1bW5C3wk0CMPALgudkFq9/Rp
	 7Gt6XJEkdk+iFWypjCYMQsekxWoCO/PVDqD38Tw7sG81App61umRR1b24xNBv0+w/9PXl
	 VPnq2vOigGOGtS+vF0GHpd1KwO/Tax1YOaZD/xpI4kUEZGyRLyfrqEGmNIK9tXvKfMhZH
	 m6KkIORu6mgy7RpH2GNEchAwqpH6rvsJoAHt8Y8u5QFc/zRUSAz9P9Y3oa9WeXageIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BW39gR3F;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OBz9MajD;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5AB606A8A9
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:05:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5AB606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BW39gR3F;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OBz9MajD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794575141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v4TApKQ2t0hyQZxEXCOTGwfQDcbqzJhHn9ZrRsucxAk=;
	b=BW39gR3Fg/kezsAVGKvDXsYxfzqF0QHATEwKDPkJqNqr/QWxfk+dcxVMEcu3YwNIOB2aqr
	mkkDS9nWCasm/fFkT5l4ek15CNGfGKFiFAamdUDN2vQF/pMHjxRSrb+lPpqyGe+LBSUJqS
	wugR76fjwkMTLCroYDR6WYQaj59gqJk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-pC0Sl-FAORagYL_MvIaQLA-1; Fri, 13 Nov 2026 08:05:39 -0500
X-MC-Unique: pC0Sl-FAORagYL_MvIaQLA-1
X-Mimecast-MFC-AGG-ID: pC0Sl-FAORagYL_MvIaQLA_1794575138
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0389d6f9so514695f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 05:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794575138; x=1795179938; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v4TApKQ2t0hyQZxEXCOTGwfQDcbqzJhHn9ZrRsucxAk=;
        b=OBz9MajDYVenCm8MUwg+HL9hyy/hjg7gXdoLfpQDTEBvcKFk4YaX7Tl44/rlnKnb5v
         srBQjbdSbBWBZPcxn1PCvXeu/Ks6Gvy2Titlk2bQEM78XcpFYAgC/2KkHvwx0b1eMl16
         fJqEP8wyrSh+PTfT8Q5vAzO/lPfDDbIdHdZPyVOUh5NF9jOK5LDk9hPIq/iH9JpeAkue
         raBwYvhyGwVeeSEq4hAtrs8tbzv0KpfcO77sH0pmSsQulx+UF9ep+lWXV/u+w78kH28r
         qz2J8dRVuL5lFl9EeQ8JjcRWpC9ounCRfBmSYjbhUwAFIjJ84CwdJl8oncnERZAetmJ2
         932w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575138; x=1795179938;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v4TApKQ2t0hyQZxEXCOTGwfQDcbqzJhHn9ZrRsucxAk=;
        b=I7Z6pAHGWklc56sohkQ+woXyp+e1eF8iuj139yW1wDR1u0sgZ0n8SYHoSSiIw/5RLK
         rNSxis+efgtXMjwqOtXKwgAmdLJC9z2ZzQRR4kVeuN36u67hQS4i4wBhlQp28vK4rfnW
         73vNR1x0CDHaKt7cZFHIU/tG/ls4ke1iLnJ956YoK5Bxa064rr5Z1MLyLQ5VYI/VMVzm
         4t6aqn/EWnKp/4xMUXjJVvNj5a1uTOPs9bE3o2mxOD7ZZt/bqHQem6zUreFV3f9WFWcK
         6OW8rYWChMvMo/XxWS5JwNnyrxkVr8CIl+BGuU5xFBaci9Z+6Ncadi+Vcy8O9BpMmTa/
         bXww==
X-Forwarded-Encrypted: i=1; AL+hErGeXnAbRvf0DvirXyc5PL675PSrnvGreNjekfQ4wfKozSlsJGBmHFrN28zIvgaiKy/fXn9hHiz0lLA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nXfWN+TX+k58rJH8uZkiyggN9tIIpNWZQKaCwC4qYnU3mSUF/
	1+OC0utKDEryZvjKKAbtm4abynopU+aQDYjK8qBxaiXWLZM83NWMbGjU6Rn0PqZq4q3ookglDr7
	Qse9Ob5BIpjrQbpTKNIgCrZDFoKMx5dhmw1l/5JyGTQNhezUuJvdo5Ammqb5c3w==
X-Gm-Gg: AYBFou2iJ48U5B5E670chTEP5m8exVhxNqj3HuoDgMDgxpiVljRekiXfSGQdsfYp/If
	683fY3a9QnbcN7wevePHuiZc7Kscm17VBWgK6MCD2Iot954ZUr5lgYZgc22YNHCEoEeT8BS6kc+
	IiRMZCff+BSbSJS2Y/o2t6VWSCPnlBqCiiSiajYKd2q+bX5lStnCUeMD1f0QGFaBGFmp19GWHiw
	kUlIXajc/nfv7OPOn4u4TuzUcy9qAFbCzhWaxkPuBvHQEgVx1YpTBmc6lj93V2sk21SLnotCOUI
	Ls05HuoPOGiC/Wwa7gTbsfUs1lpUIQmwbm+fj2qHSOL63tGsQIO9Yulhm4/7w/pMvEQLKxfXPyQ
	pzD819hxHQrMGTkoX8Lu43VbDRFPEbIUU4FU2q7My/g==
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr53874925e9.13.1794575137659;
        Fri, 13 Nov 2026 05:05:37 -0800 (PST)
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr53873365e9.13.1794575136910;
        Fri, 13 Nov 2026 05:05:36 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1511:2900:ff37:b35c:a97:952d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56680ea9sm39056695e9.0.2026.11.13.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:05:35 -0800 (PST)
Date: Fri, 13 Nov 2026 08:05:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Alexei Starovoitov <ast@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	bpf@vger.kernel.org, linux-hyperv@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/8] vsock: add datagram support to virtio and
 vhost
Message-ID: <20261113080506-mutt-send-email-mst@kernel.org>
References: <20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113-vsock-dgram-support-v2-0-bacfc85b71ce@redhat.com>

On Fri, Nov 13, 2026 at 01:47:33PM +0100, Sergio Lopez wrote:
> This RFC adds SOCK_DGRAM support to virtio-vsock and vhost-vsock through
> the existing AF_VSOCK API. It is intended for guest and host services
> that exchange independent requests, responses, or events and need message
> boundaries and sender addresses without a stream connection or application
> framing.
> 
> VIRTIO_VSOCK_F_DGRAM gates virtio traffic in both directions. Each virtio
> send carries zero to 64 KiB of payload in one VIRTIO_VSOCK_TYPE_DGRAM
> packet. On the RX virtqueue, the device may split a datagram across
> page-sized guest buffers.
> START and EOM delimit the message; the guest reassembles at most 64
> fragments and 64 KiB before delivering it to a socket.

where do these limits come from? how does peer know not to send more?

Thanks!

> Invalid or
> incomplete messages are discarded. Datagram delivery is best effort:
> there are no peer credits, acknowledgements, or retransmissions. Send
> admission uses the socket send-memory limit, and SIOCOUTQ reports charged
> send memory.
> 
> Datagram sockets have a separate port space from stream and seqpacket
> sockets. The latter two continue to share their port space. Datagram
> routes are chosen per destination among guest-to-host, host-to-guest, and
> loopback transports, with VMCI as a fallback. VMCI still owns its socket
> handle when it is present; loopback works without a directional transport.
> Hyper-V continues to reject datagram sockets.
> 
> Bobby Eshleman and Amery Hung explored this feature in their v6 series
> and v7 work-in-progress branch. This series is a fresh implementation
> against the current vsock code. It follows the separate datagram port
> space, per-destination routing, and VMCI fallback requirements discussed
> there. For guest receive buffers, it uses bounded fragmentation and
> reassembly rather than full-message buffers or the earlier drop/error
> queue approach:
> 
> https://lore.kernel.org/r/20240710212555.1617795-1-amery.hung@bytedance.com
> https://github.com/ameryhung/linux/tree/vsock-dgram-v7
> 
> A corresponding virtio specification update has been drafted separately.
> The wire format and feature negotiation still need specification review
> before this series can be considered for merging.
> 
> The first patches expose the core port allocator and add datagram queue
> reporting, then implement the common data path, guest and host feature
> negotiation, routing, and RX fragmentation. The last patch extends
> vsock_test with local and peer tests for message boundaries, routing,
> connected peers, port sharing, queue accounting, and delayed reads.
> 
> Testing used QEMU with the F_DGRAM property patch below, an x86-64
> KASAN/lockdep kernel, paired guest tests, and a nested Linux vhost-vsock
> backend. The tested paths include 64 KiB messages, delayed-read bursts,
> feature-disabled ingress, stream and seqpacket controls, and header-only
> guest RX buffers. A temporary userspace backend still fails stream test
> 21 on both the series base and tip; that case passes with Linux vhost.
> Real VMCI and Hyper-V hardware were not exercised.
> 
> https://lists.gnu.org/archive/html/qemu-devel/2026-10/msg08074.html
> 
> Code was written and reviewed both manually and assisted by Codex
> (GPT-6.1-Sol) and Claude (Opus 4.6).
> 
> Signed-off-by: Sergio Lopez <slp@redhat.com>
> ---
> Changes in v2:
> - Keep guest RX buffers page-sized; add START/EOM framing and bounded
>   datagram reassembly (thanks to Alexei Starovoitov and Bobby Eshleman).
> - Preserve stream and seqpacket data when an RX buffer has no payload
>   room.
> - Separate datagram and connection-oriented port spaces, and share
>   receive metadata and queueing (thanks to Alexei Starovoitov).
> - Check negotiated support and destination CID on ingress, and require
>   an exact connected peer CID and port (thanks to Sashiko AI bot).
> - Select a capable route for each destination, retain VMCI as fallback,
>   and support loopback-only sockets (thanks to Alexei Starovoitov).
> - Preserve the connected peer address across temporary parent fallback
>   (thanks to Sashiko AI bot).
> - Use socket write-memory accounting for datagram SIOCOUTQ instead of
>   separate transport counters (thanks to Alexei Starovoitov).
> - Extend selftests for fragmentation, delayed reads, port sharing,
>   connected peers, and capability-based skips; fix the test build and
>   README entries (thanks to Alexei Starovoitov, Bobby Eshleman,
>   and Sashiko AI bot).
> - Link to v1: https://lore.kernel.org/r/20261028-vsock-dgram-support-v1-0-e457cf7cee78@sinrega.org
> 
> ---
> Sergio Lopez (8):
>       vsock: expose the core port allocator to transports
>       vsock: report datagram receive and send queue state
>       vsock/virtio: implement the datagram data path
>       vsock/virtio: negotiate datagram support on the guest
>       vhost/vsock: negotiate datagram support with guests
>       vsock: allow datagrams to use directional transports
>       vsock: fragment datagrams across receive buffers
>       vsock: add datagram tests to vsock_test
> 
>  Documentation/admin-guide/sysctl/net.rst |    8 +-
>  drivers/vhost/vsock.c                    |   51 +-
>  include/linux/virtio_vsock.h             |    9 +-
>  include/net/af_vsock.h                   |   30 +-
>  include/uapi/linux/virtio_vsock.h        |   10 +
>  net/vmw_vsock/af_vsock.c                 |  459 +++++++++++---
>  net/vmw_vsock/hyperv_transport.c         |   11 +-
>  net/vmw_vsock/virtio_transport.c         |  167 ++++-
>  net/vmw_vsock/virtio_transport_common.c  |  164 ++++-
>  net/vmw_vsock/vmci_transport.c           |  115 ++--
>  net/vmw_vsock/vsock_bpf.c                |    3 +-
>  net/vmw_vsock/vsock_loopback.c           |    2 +-
>  tools/testing/vsock/Makefile             |    3 +-
>  tools/testing/vsock/README               |   31 +-
>  tools/testing/vsock/util.c               |   62 +-
>  tools/testing/vsock/util.h               |   10 +
>  tools/testing/vsock/vsock_test.c         |  175 +++++-
>  tools/testing/vsock/vsock_test_dgram.c   | 1000 ++++++++++++++++++++++++++++++
>  tools/testing/vsock/vsock_test_dgram.h   |   29 +
>  19 files changed, 2066 insertions(+), 273 deletions(-)
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> change-id: 20261027-vsock-dgram-support-683a4e0aebe7
> 
> Best regards,
> -- 
> Sergio Lopez <slp@redhat.com>


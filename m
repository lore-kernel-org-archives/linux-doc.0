Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EDF3C196E
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 22:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769033529; cv=none; b=JXzwR5QACtAM4DEq5/VpdKqDwRoLC2jqd/2VRoN7JWEzs/kWm29LCs2TylMixcUHDgcTeOa+G5eZZv7vhZoPoqOuPp6o4e6xFiqTXm29Iw/wwnvFF17SBlj1EQ45tE2oiGwSI4BqkRL2HBcgDg/YNtCheTe1474O/scwAQn3d3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769033529; c=relaxed/simple;
	bh=vD964Lj1wPSOw/16ssWykcRPX0KDwrhlz4wvw7+NTyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jX57dPdM3dWL3K4Z5z2OjdtZuggEM0XX5CE6WKrDvJgkxv13dak2DbqpEFPr5YYdwAE0PL/dHToAZ1eaL+KlZosDVn2Bt6qdQl0ZZ6nKzf9WCYUXjCSTWEqYZeF3TmshiVZqd5j8YOPiBgnhrStg34oaEcUEKAwDA21P+3i2WIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y99EiGsF; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y99EiGsF"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-790884840baso3696577b3.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 14:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769033521; x=1769638321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0yb8kb1LkqAc5YpKYa8ha5gJygHDPK65XDs8oEX3qw=;
        b=Y99EiGsF9tk6R+Itkzxd0coovOKy9u52A1TXP4htixp2HgvCl6iJKdLzALNJZbVNzj
         aJZcvkUY/XMAR+yvEorllUkeZVJ7k7WC6zO1pZIcx8Ql8QQB95xchErZ6Ky0QukvGaAn
         ZStdmxheSgLVJkjkLAxtRJFmIGaW7mqAe9npBxjYaYz7YYCGdaWdz4TfWJEPTEuDt4UH
         zYBc5LesM3ZKR4CSql4qIdUQkNDkGMYmFXAom1jQ7ovREkwAMjGx4hSmomH2LVdtKYdD
         F4WQ0B9Ix79eBtf5yFI6ozINVYcYe1yQk6QNiFgjkMm/M1/ynQOIsw44A/3Sr/regoPl
         No/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769033521; x=1769638321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N0yb8kb1LkqAc5YpKYa8ha5gJygHDPK65XDs8oEX3qw=;
        b=MruqYr0UL5oGtA9KDwBxWguPbOjZUFp+TPS7UyTv9jh9BPF3bVFf9bOy6dFga/yBi1
         8Cylks+Ww4R9lwHTN3K+zgvcyB4vDHELSfFTMe9VT7ejzRvvcbaiPYtN1gTgikP4AKm0
         Lvj5YY6IdNJu7cFSG6udri6CKof2k9tZbsT3br1gyWkGYmGQHM6K7OGk6C9IH0IYesp/
         vs32kU1kGn2uE1zlznHzoZTlStOh6JdXRhyp3UJ1i3V/2PvlOip40z7ePAbAXZ1Nfjs6
         +KHSrwDViM5RjK2HTSmko1MwIEXwysrubj7w4GJxZebGGn+9rE5xgXSwiNAifgk230Wo
         xGsw==
X-Forwarded-Encrypted: i=1; AJvYcCV2T45cR7vqcKWg6aMTm7OXcYXEyQZPPsj3ZjfuNxAMxxsfJHjpe2wX7f2+5PZb8IBbAV01vhleUDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPWCZIXw+HDfM2xo/KyI3dkRkmb/v+fQKgD1Ai1icElIBs7bp
	o534TXH4x6aZdN6LfrXXG5SlsY8t6KzbcfDBYkjxfmknTrwEB0xGzFFe
X-Gm-Gg: AZuq6aI+EFJzgZylgHkqlo7ggo+8YH28A6f8yrXeEUb+jMM+CGlFoCMHKZI00czrEfu
	B4IQ1Vm1p0uxJqJxqxiQUeoFI2i1XklsD6shxZoeaVVaFTNIFOB9ysQaeSbK35h2utOJTWRakCj
	D0+GgnxzO2nIf4Qs+/fjIyw5QalBaOU3lMCdSBOltOmEeH4KX3gesH5Tqe+cKcW67Kmcdwbhhuu
	4vGlKjwfqTLt9qLUsFDnrrLiKqL+fys6T/dftoxA81HICOo1qRlOvFRR87lorDF27IxNFkGQ+Lr
	Twf4UQ8vj1vpTWnMP4ZvVdV+6ZS3caljDrLkQoj2KwC2U92ZpDQa2QDpndZLzdFhXVJVdTQS6CM
	zTDFWBgl+cpBeLlFLE4ePH8V7h6P9vP59QpW7CYvEyZt146DI38nSHWxP0pJCpO2Ryydl6Tqdcw
	eLNZuzoTBh
X-Received: by 2002:a05:690c:4990:b0:794:2ef:a445 with SMTP id 00721157ae682-79402efa762mr75302437b3.15.1769033520799;
        Wed, 21 Jan 2026 14:12:00 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:c::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794295ec411sm5665437b3.15.2026.01.21.14.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:12:00 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 21 Jan 2026 14:11:42 -0800
Subject: [PATCH net-next v16 02/12] virtio: set skb owner of
 virtio_transport_reset_no_sock() reply
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-vsock-vmtest-v16-2-2859a7512097@meta.com>
References: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
In-Reply-To: <20260121-vsock-vmtest-v16-0-2859a7512097@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 "K. Y. Srinivasan" <kys@microsoft.com>, 
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
 Dexuan Cui <decui@microsoft.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
 Vishnu Dasa <vishnu.dasa@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Shuah Khan <shuah@kernel.org>, Long Li <longli@microsoft.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, berrange@redhat.com, 
 Sargun Dhillon <sargun@sargun.me>, linux-doc@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@gmail.com>, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

Associate reply packets with the sending socket. When vsock must reply
with an RST packet and there exists a sending socket (e.g., for
loopback), setting the skb owner to the socket correctly handles
reference counting between the skb and sk (i.e., the sk stays alive
until the skb is freed).

This allows the net namespace to be used for socket lookups for the
duration of the reply skb's lifetime, preventing race conditions between
the namespace lifecycle and vsock socket search using the namespace
pointer.

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v11:
- move before adding to netns support (Stefano)

Changes in v10:
- break this out into its own patch for easy revert (Stefano)
---
 net/vmw_vsock/virtio_transport_common.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index fdb8f5b3fa60..718be9f33274 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -1165,6 +1165,12 @@ static int virtio_transport_reset_no_sock(const struct virtio_transport *t,
 		.op = VIRTIO_VSOCK_OP_RST,
 		.type = le16_to_cpu(hdr->type),
 		.reply = true,
+
+		/* Set sk owner to socket we are replying to (may be NULL for
+		 * non-loopback). This keeps a reference to the sock and
+		 * sock_net(sk) until the reply skb is freed.
+		 */
+		.vsk = vsock_sk(skb->sk),
 	};
 	struct sk_buff *reply;
 

-- 
2.47.3


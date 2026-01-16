Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721CC307AF4
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768598947; cv=none; b=sTMGckiHhiO6B/NEiXZACRK0MH5fIPUgZ+QUC4yXqKskpnAjQXzVIefF7cHg9GpII98UxIZeNOUrMJvrc4Wce9lbd6PIBYbViozETa8rV2rdKyN8gBJZ96TA0uIi8m0XdqIg8H5bKxToDevd2+Ub+58TzjqD2HcdamVstHL/Hgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768598947; c=relaxed/simple;
	bh=vD964Lj1wPSOw/16ssWykcRPX0KDwrhlz4wvw7+NTyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lP3gcQ3dUmsbHFzfSL01ZmuODQz9DylhY690dSD2DwgdaFy/RzwXtyMcvUlsP4Im2MM8Z/HyZMhkXiumcLJh2+Ch3I7YmArJjcSWtaJbKBVH7HwBiAduoCtpGb4CtNBja6Vi3Cvz7uWbqKZUdRwcgRAN2zi2pNEj/n5dWZ8aGN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqwvUnlN; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqwvUnlN"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-78fb9a67b06so26107637b3.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 13:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768598944; x=1769203744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0yb8kb1LkqAc5YpKYa8ha5gJygHDPK65XDs8oEX3qw=;
        b=BqwvUnlNPCKikTxYdL+5w8XOT82LgQ0+ssDXjKCFsQOiOEKeiqpdAFz8/CE93RQl5v
         /GVKF15nii0G6eKA5oQ8s22PMA7hztwgG5qgQDLIW3i5knksl747rL2nTy6hhVXHGHFy
         vQNhM17LwHRwZEtAqwkm6d5i5P1xIbrGPD8eDjNZCCEMNSMK8p6XUwSj1NxI0l7Ym5ZV
         S3Lxo/tw3O96guydkObG3nLyxKn7r9U0oaRjAvCLmJ8qQ1uCYYurSraB70Sj03AnAvXI
         WkOkTK0q3z508sBiWTyQ8VqmEyUTD1pndtwVGYmkBN5icbbVkvQOfNR9KCBiKYMzS1wK
         NxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768598944; x=1769203744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N0yb8kb1LkqAc5YpKYa8ha5gJygHDPK65XDs8oEX3qw=;
        b=iXzus3DDMzhmQNARx63c8iUHiN36ovzyKOc0W+eX2iuTSHE0W29kjiJNP4DiPBJMUN
         NQrCTx6bXMoYZmGNysOZZiEKnQ370KN9bbaM/6dKJpFDe6xVQH2frQHxcFFQkljrx8JH
         tJ0uADsmYBm42nYysIZ53OuxAOYRKDgYIXa0ekTm9SsBwSzG9cS4PYkfUtQRHf4GfjY3
         x3ec8gzN08gsZSlJAt4ESLOChcC5KxOKSrlea4+k7MXad0QLcWrda4S7CVkaxsfK3VT1
         VKkM/v9ShqP/F5kW77AU5rhh6Pm9qBBgMHFzUSYAgMt4LlOitNuU2ZQlOJHRIHHByjBy
         ORfQ==
X-Forwarded-Encrypted: i=1; AJvYcCW63oziA97hqcVYkld2pLcO4rxaoUvg/gmk9+s1VZzt2dXuv9xTYQ5lx2EPl9KkRgI2jOyLe7NSNlc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr8Az33QDDzOOUAAGF8xr1SOrPN+F/PyJx+HW3gsPWyDFzOSKZ
	XJNfyASgenSpV0THylWh+yOEHbNmKbcDtWqV9T/yCn2pctxEU0R1MnBg
X-Gm-Gg: AY/fxX55DmIQ26HpyV688ZR0hwxiXSxYI1kl3iwSYjEGb24nHIDKvKUjX+WI1fGEZh7
	brpleTsHrxvp8PQKgcwE4+E/2TpMGqJpAp5yVV4BzxrAwP+yBYP02kjdbkzPAcNKofI1rDdLI11
	429xBdtGOhLCrdBN2U+aO52G5jnmdeM90BT/c+mQ+QO7tKe+4QGsav8xrf4MxyIa3wlcntcz0MF
	ycgedhDWYavcJuJmv9vbW+J6bm1A5maZnt3PNuPPUG24eNqnZxr5bAdplUmW6Jri/cvOhueBwrh
	aPtntifhrPtkj3NbZNfQI6+fW/9cnAhw2IJBNdXlKHdvjWtfCXt/+uHikwig1yMx6wSOQtSrfcT
	MjAkpOzSF6TSRc8X1+0vpFoZ6LvYTQqNZQxfOesc8JAYwC8CiQ2BUjLRDJzhfC6FA5J9Xu9rDld
	RlZd+1esc51g==
X-Received: by 2002:a05:690c:39d:b0:78c:2916:3f0a with SMTP id 00721157ae682-793c66b8eb1mr33268517b3.7.1768598944439;
        Fri, 16 Jan 2026 13:29:04 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5d::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c729fsm13186297b3.12.2026.01.16.13.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 13:29:04 -0800 (PST)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Fri, 16 Jan 2026 13:28:42 -0800
Subject: [PATCH net-next v15 02/12] virtio: set skb owner of
 virtio_transport_reset_no_sock() reply
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-vsock-vmtest-v15-2-bbfd1a668548@meta.com>
References: <20260116-vsock-vmtest-v15-0-bbfd1a668548@meta.com>
In-Reply-To: <20260116-vsock-vmtest-v15-0-bbfd1a668548@meta.com>
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


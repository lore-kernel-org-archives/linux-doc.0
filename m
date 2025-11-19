Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7904432340D
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763535325; cv=none; b=STKGWkdRRd+UDwpeJrEhQla4uBLsEtx9Ja89g1Uzzqf14nYiHljpztkFwJlUhPO+RruVCWUqxgrJNmLy3NhaoAN0I24ojW8z7JJ5XjFG3MzgfVBxwlWkxxu9a+IWeAWAREsxZWDf8kSXwO8lvcLsN99CXWwY9AHC4cyt4ptaokY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763535325; c=relaxed/simple;
	bh=5iCO5cgXDbfIKEXyC1bd0mdDH+xAR3kAZ5VJbmIKI/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qr5fmRU+wYjZRWwiVDlHTAvOJWek20IkEj7DKMXXf1cKnGaebHRG8qpE+Nv3ykHL1y2GDTE3qiF7HTP1M0dNG/0L9XbwDqjkcN3H9bHxFgUVZAqOX6zStpGZDLGr3VSBSuDscKWu1wFCUsY61vX5KEbflxxO5Ts2UVnLd8rbC3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TboRzDMH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fbtqs4Bf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TboRzDMH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fbtqs4Bf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763535321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zrc/sZ7wD+ZBOSRNsS/SZIC54PvyBbg7yzBkzkUFz30=;
	b=TboRzDMH2TCz+zJ+hQRHrSwPsX3hP7vPeznCO3h+a203opQ7AxxoF1GrTfUQehTQU9hsPE
	3IXS1ByWZkk4KELYZyR1CEFZcfaThwcmiDL5PvtyJnESZVFJYcXFlGeNyQ36FTcQX/ZqjZ
	VC7UXZGLo8b7EmkCHo+kZ0k2p3gF44U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-_-3c5JS3MIW4f4F9DZP1dw-1; Wed, 19 Nov 2025 01:55:18 -0500
X-MC-Unique: _-3c5JS3MIW4f4F9DZP1dw-1
X-Mimecast-MFC-AGG-ID: _-3c5JS3MIW4f4F9DZP1dw_1763535317
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-42b2e448bd9so3981429f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 22:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763535317; x=1764140117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zrc/sZ7wD+ZBOSRNsS/SZIC54PvyBbg7yzBkzkUFz30=;
        b=fbtqs4BfPZDQiLLY9MS5ObUcpOBENbzsVmj8Nz4+qy/jiC9Ddr6yAfhodS0TV0fYsi
         37vek+juO70btI6DjgF6+3e1h+S8AKEuRlUSusKqNuRDu8bJ5HvHq0LUyZ5jfCwDThQa
         mPvFRDSc/DBy8WgLmvNMVFs2mNuW+3mteHOBax149AYSlulL9rYcWoQ0FqQD6XkvYTof
         KWf2wGQCvBXI/HnFrQs56Cfq6CionuUL+7hEsMISd52sv30/Ze/Q9vE8FAedkhyEaAxc
         SYM4TJWwZmaU751xxGOoiFybZCJwFfu29vEJx+pwb9VaGtept8EbbrBCDYd1bhzBLkzO
         J1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763535317; x=1764140117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zrc/sZ7wD+ZBOSRNsS/SZIC54PvyBbg7yzBkzkUFz30=;
        b=jk/6ayDvXrIiwnwLpdXvOjdvzA97s2qtQUaVur62nZKPwKZdxeQz/NkycxLTCVBD1U
         eo6NJma4ZOZQaIiCVrZv4Qkkhmcx8bp+lYxEAFUlksf8vbwzi7gwRh9PHASg8Z6YBG90
         47LFjxXZ1MgtneoO0qRrCBlgckpJfxvJ7aMUdTC5V6DnHlf2r5ln3W0nR04loG8B9lrC
         8foQRKdEI7DNik05SYn3zKVaejpmfamja+R+HHvQg2qw8K1bUCI01gn0rQS6EmLgpORV
         ybxQ/BLS01NMGj7kXnjb/P4wVjae8R0NVoZ0havkN1C+0n7ql+DXKnmzcHL5bMXEplk6
         gjRw==
X-Forwarded-Encrypted: i=1; AJvYcCUz8aorp/lUR2Ludv/0y0Iv8JRpo7kx1YtWwqsX7FZLiCQ4AnGQkPeHL27/SVLgXj98cUwwjrNoRJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0WQKRg2duk9FQ7spvLLDLOFiXvyIMmaEjZOdqBODPPQu8m7Mi
	ogmcc/dG7DgulIKG6J9JdVmA8XHotVCrf2OlS9LchkBJ+WHSWznbxvdu2s6fOHjCxc4ryYJlwMj
	jRX6mURWtO/gslMm2RiPOTKQDESnGaWtZkvSH3gOflWKxyv0HLn4weyD01erc1w==
X-Gm-Gg: ASbGncsiamvEGuAfspPAa7KH9pPXEwZ8Bv72oeNVyHOoVsbBl8Ml7Yc9y5256gOURAv
	U9cmTVvnb2mnM52JzmJcYQ0B6vwqhKNAdojHQgXmkhqbeyFdFm/3NP4slH3waZ91/+6KaM6eI9G
	L0ReWVv8+YreQymk5+bJ8e3GjZj2HvuXQM02l9E4xpLj378+QNpUGvx4XwMuV0ezdRueBj3W3/1
	uUwjSH6g6Lw0reRoYQCrT08JfWAE95ZLPTOQVa8kf+bWEm2cQ9Wkl2EovDzfQk4+JmxgxxUII5i
	xqk740Cocj0IMpvTRCmyph4fzsv/tlydBQ+xiEq6dUVRepy4bby0Oc+6cYl34CEv+4Cy8s/yZ0u
	Td3w7jZHxE39tHikyjS6mBXift2rGdQ==
X-Received: by 2002:a05:6000:2f85:b0:429:9323:2bec with SMTP id ffacd0b85a97d-42b593869a5mr18324472f8f.40.1763535316806;
        Tue, 18 Nov 2025 22:55:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRW82UuLQi25W/cQGXxbC4zhS0AtsqTnIUUKMrow7dNSoBHx8kFNZOLj0xBxxurb7UU0psGg==
X-Received: by 2002:a05:6000:2f85:b0:429:9323:2bec with SMTP id ffacd0b85a97d-42b593869a5mr18324445f8f.40.1763535316367;
        Tue, 18 Nov 2025 22:55:16 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae88sm35392413f8f.6.2025.11.18.22.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 22:55:15 -0800 (PST)
Date: Wed, 19 Nov 2025 01:55:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Paolo Abeni <pabeni@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Mike Christie <michael.christie@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 2/2] vhost: switch to arrays of feature bits
Message-ID: <fbf51913a243558ddfee96d129d37d570fa23946.1763535083.git.mst@redhat.com>
References: <cover.1763535083.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763535083.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

The current interface where caller has to know in which 64 bit chunk
each bit is, is inelegant and fragile.
Let's simply use arrays of bits.
By using unroll macros text size grows only slightly.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/net.c   | 29 +++++++++++++++--------------
 drivers/vhost/scsi.c  |  9 ++++++---
 drivers/vhost/test.c  | 10 ++++++++--
 drivers/vhost/vhost.h | 42 ++++++++++++++++++++++++++++++++++--------
 drivers/vhost/vsock.c | 10 ++++++----
 5 files changed, 69 insertions(+), 31 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index d057ea55f5ad..cb778f2bf8f8 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -69,15 +69,15 @@ MODULE_PARM_DESC(experimental_zcopytx, "Enable Zero Copy TX;"
 
 #define VHOST_DMA_IS_DONE(len) ((__force u32)(len) >= (__force u32)VHOST_DMA_DONE_LEN)
 
-static const u64 vhost_net_features[VIRTIO_FEATURES_U64S] = {
-	VHOST_FEATURES |
-	(1ULL << VHOST_NET_F_VIRTIO_NET_HDR) |
-	(1ULL << VIRTIO_NET_F_MRG_RXBUF) |
-	(1ULL << VIRTIO_F_ACCESS_PLATFORM) |
-	(1ULL << VIRTIO_F_RING_RESET) |
-	(1ULL << VIRTIO_F_IN_ORDER),
-	VIRTIO_BIT(VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) |
-	VIRTIO_BIT(VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO),
+static const int vhost_net_features[] = {
+	VHOST_FEATURES,
+	VHOST_NET_F_VIRTIO_NET_HDR,
+	VIRTIO_NET_F_MRG_RXBUF,
+	VIRTIO_F_ACCESS_PLATFORM,
+	VIRTIO_F_RING_RESET,
+	VIRTIO_F_IN_ORDER,
+	VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO,
+	VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO
 };
 
 enum {
@@ -1720,6 +1720,7 @@ static long vhost_net_set_owner(struct vhost_net *n)
 static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 			    unsigned long arg)
 {
+	const DEFINE_VHOST_FEATURES_ARRAY(features_array, vhost_net_features);
 	u64 all_features[VIRTIO_FEATURES_U64S];
 	struct vhost_net *n = f->private_data;
 	void __user *argp = (void __user *)arg;
@@ -1734,14 +1735,14 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 			return -EFAULT;
 		return vhost_net_set_backend(n, backend.index, backend.fd);
 	case VHOST_GET_FEATURES:
-		features = vhost_net_features[0];
+		features = VHOST_FEATURES_U64(vhost_net_features, 0);
 		if (copy_to_user(featurep, &features, sizeof features))
 			return -EFAULT;
 		return 0;
 	case VHOST_SET_FEATURES:
 		if (copy_from_user(&features, featurep, sizeof features))
 			return -EFAULT;
-		if (features & ~vhost_net_features[0])
+		if (features & ~VHOST_FEATURES_U64(vhost_net_features, 0))
 			return -EOPNOTSUPP;
 
 		virtio_features_from_u64(all_features, features);
@@ -1753,8 +1754,8 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 		/* Copy the net features, up to the user-provided buffer size */
 		argp += sizeof(u64);
 		copied = min(count, (u64)VIRTIO_FEATURES_U64S);
-		if (copy_to_user(argp, vhost_net_features,
-				 copied * sizeof(u64)))
+
+		if (copy_to_user(argp, features_array, copied * sizeof(u64)))
 			return -EFAULT;
 
 		/* Zero the trailing space provided by user-space, if any */
@@ -1784,7 +1785,7 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 		}
 
 		for (i = 0; i < VIRTIO_FEATURES_U64S; i++)
-			if (all_features[i] & ~vhost_net_features[i])
+			if (all_features[i] & ~VHOST_FEATURES_U64(vhost_net_features, i))
 				return -EOPNOTSUPP;
 
 		return vhost_net_set_features(n, all_features);
diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 98e4f68f4e3c..04fcbe7efd77 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -197,11 +197,14 @@ enum {
 };
 
 /* Note: can't set VIRTIO_F_VERSION_1 yet, since that implies ANY_LAYOUT. */
-enum {
-	VHOST_SCSI_FEATURES = VHOST_FEATURES | (1ULL << VIRTIO_SCSI_F_HOTPLUG) |
-					       (1ULL << VIRTIO_SCSI_F_T10_PI)
+static const int vhost_scsi_features[] = {
+	VHOST_FEATURES,
+	VIRTIO_SCSI_F_HOTPLUG,
+	VIRTIO_SCSI_F_T10_PI
 };
 
+#define VHOST_SCSI_FEATURES VHOST_FEATURES_U64(vhost_scsi_features, 0)
+
 #define VHOST_SCSI_MAX_TARGET	256
 #define VHOST_SCSI_MAX_IO_VQ	1024
 #define VHOST_SCSI_MAX_EVENT	128
diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 42c955a5b211..af727fccfe40 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -308,6 +308,12 @@ static long vhost_test_set_backend(struct vhost_test *n, unsigned index, int fd)
 	return r;
 }
 
+static const int vhost_test_features[] = {
+	VHOST_FEATURES
+};
+
+#define VHOST_TEST_FEATURES VHOST_FEATURES_U64(vhost_test_features, 0)
+
 static long vhost_test_ioctl(struct file *f, unsigned int ioctl,
 			     unsigned long arg)
 {
@@ -328,14 +334,14 @@ static long vhost_test_ioctl(struct file *f, unsigned int ioctl,
 			return -EFAULT;
 		return vhost_test_set_backend(n, backend.index, backend.fd);
 	case VHOST_GET_FEATURES:
-		features = VHOST_FEATURES;
+		features = VHOST_TEST_FEATURES;
 		if (copy_to_user(featurep, &features, sizeof features))
 			return -EFAULT;
 		return 0;
 	case VHOST_SET_FEATURES:
 		if (copy_from_user(&features, featurep, sizeof features))
 			return -EFAULT;
-		if (features & ~VHOST_FEATURES)
+		if (features & ~VHOST_TEST_FEATURES)
 			return -EOPNOTSUPP;
 		return vhost_test_set_features(n, features);
 	case VHOST_RESET_OWNER:
diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
index 621a6d9a8791..c7b92730668e 100644
--- a/drivers/vhost/vhost.h
+++ b/drivers/vhost/vhost.h
@@ -14,6 +14,7 @@
 #include <linux/atomic.h>
 #include <linux/vhost_iotlb.h>
 #include <linux/irqbypass.h>
+#include <linux/unroll.h>
 
 struct vhost_work;
 struct vhost_task;
@@ -279,14 +280,39 @@ void vhost_iotlb_map_free(struct vhost_iotlb *iotlb,
 				eventfd_signal((vq)->error_ctx);\
 	} while (0)
 
-enum {
-	VHOST_FEATURES = (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
-			 (1ULL << VIRTIO_RING_F_INDIRECT_DESC) |
-			 (1ULL << VIRTIO_RING_F_EVENT_IDX) |
-			 (1ULL << VHOST_F_LOG_ALL) |
-			 (1ULL << VIRTIO_F_ANY_LAYOUT) |
-			 (1ULL << VIRTIO_F_VERSION_1)
-};
+#define VHOST_FEATURES \
+	VIRTIO_F_NOTIFY_ON_EMPTY, \
+	VIRTIO_RING_F_INDIRECT_DESC, \
+	VIRTIO_RING_F_EVENT_IDX, \
+	VHOST_F_LOG_ALL, \
+	VIRTIO_F_ANY_LAYOUT, \
+	VIRTIO_F_VERSION_1
+
+static inline u64 vhost_features_u64(const int *features, int size, int idx)
+{
+	u64 res = 0;
+
+	unrolled_count(VIRTIO_FEATURES_BITS)
+	for (int i = 0; i < size; ++i) {
+		int bit = features[i];
+
+		if (virtio_features_chk_bit(bit) && VIRTIO_U64(bit) == idx)
+			res |= VIRTIO_BIT(bit);
+	}
+	return res;
+}
+
+#define VHOST_FEATURES_U64(features, idx) \
+	vhost_features_u64(features, ARRAY_SIZE(features), idx)
+
+#define DEFINE_VHOST_FEATURES_ARRAY_ENTRY(idx, features) \
+	[idx] = VHOST_FEATURES_U64(features, idx),
+
+#define DEFINE_VHOST_FEATURES_ARRAY(array, features) \
+	u64 array[VIRTIO_FEATURES_U64S] = { \
+		UNROLL(VIRTIO_FEATURES_U64S, \
+		       DEFINE_VHOST_FEATURES_ARRAY_ENTRY, features) \
+	}
 
 /**
  * vhost_vq_set_backend - Set backend.
diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index ae01457ea2cd..16662f2b87c1 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -29,12 +29,14 @@
  */
 #define VHOST_VSOCK_PKT_WEIGHT 256
 
-enum {
-	VHOST_VSOCK_FEATURES = VHOST_FEATURES |
-			       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
-			       (1ULL << VIRTIO_VSOCK_F_SEQPACKET)
+static const int vhost_vsock_features[] = {
+	VHOST_FEATURES,
+	VIRTIO_F_ACCESS_PLATFORM,
+	VIRTIO_VSOCK_F_SEQPACKET
 };
 
+#define VHOST_VSOCK_FEATURES VHOST_FEATURES_U64(vhost_vsock_features, 0)
+
 enum {
 	VHOST_VSOCK_BACKEND_FEATURES = (1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2)
 };
-- 
MST


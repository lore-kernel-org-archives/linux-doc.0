Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC40286D7B
	for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 07:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763279132; cv=none; b=MOkxisJfbc3w8AIICeedPdkl3JDfUyjmQc9Xv8M6lUGhXdf45ebuzhilfzop3Da/5QShe2+YxySTeWEeaqTTp3SoMgLuD4HS3mTOwZrWm8LYGKeKIFQxchpzBq7PljfX38W1U6TLgGcoZAQwqJrl5oskIsy0CCbYhWwN/AIHnrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763279132; c=relaxed/simple;
	bh=y8wCZBoR8voYmXOKUgsqLzpqBH63+zG9KD2XjWV0Mfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qv0Z70ZdbAduV6MXaNXlCgvJi9vZjYa8IZam8hxSDoDmK6uKlhPDh+Aanub8/YU7uwth1NFknqNmv1Bk82i4emqzV3Q6D9H+a8WI3Ivd5M+w6akuCz13pqyOMoCF+2o5OUkfSAf+DgHGECB7JZtSLDzKulEcXIQK4mV/7+K2azQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bWCErSfU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mOxsfcOV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bWCErSfU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mOxsfcOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763279129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=trQJ3e9sH2/7p6hcj43E7jvSF+i5hK8jJlCsMQnk8Kw=;
	b=bWCErSfU0vtpubxhWwtvIrs6sg1bITNJvVD97hdIcjTGG/FU67KhkjWCNcXlHkEeUVogZq
	XC0sIYPDyRbhDO8ZDMkOroVgqkG+0blko7RR+UNAAzet4HUGHmk2XT/DvOyCl4qdDh+Ai1
	LkCOIMSaw87S/mt/RrwFGSyMh+aMxGE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-lyWOghxaNXO1dT4HdI4kbQ-1; Sun, 16 Nov 2025 02:45:27 -0500
X-MC-Unique: lyWOghxaNXO1dT4HdI4kbQ-1
X-Mimecast-MFC-AGG-ID: lyWOghxaNXO1dT4HdI4kbQ_1763279126
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-42b2ffe9335so3817348f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763279126; x=1763883926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=trQJ3e9sH2/7p6hcj43E7jvSF+i5hK8jJlCsMQnk8Kw=;
        b=mOxsfcOVN7c1Nmpzw6izHM6CsPcO9/erni1F62AwNw7Ls/ckzf6XVbD3dc5VFiaPZL
         Hy/QTk6Ze5z/y8zPXe8CqBLhwy42tj7c1NORelQ+BtpLSfcUIGECxTNuu0oqVZoh5YRy
         YE60X65iaamZtJUNQ/T112Or5La17ci5I2fqvQwsqSV3eTgtN9qS9hX2rvzFgNaPxZru
         cf79SPbkKzhlJfBOXgonl0vm+U5+GhAI1KDs6qsy4Q4TAdBLcSGq9zak+VP7t/DUd/mn
         zoUPNYxLAANUqYHzePFuwubPpbHX5Gfw//O8qzA7sz/SirhqV7GEf1wIvmDGsr7ApsOi
         aJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763279126; x=1763883926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trQJ3e9sH2/7p6hcj43E7jvSF+i5hK8jJlCsMQnk8Kw=;
        b=ei4T5n6zP9rblIG7QL1+oqdy/1IryIbDFxUf5llQAEK4iKaEvKg2cR+2qE/LK5iwMR
         LpbfUH4pgC9tMkzfN+13vNAkS7u6uPnkpGHay+P7WNXmrJ+Lsxw8uq7UmwaYVKbRkVnk
         MMGZ/SKG5K+x3zPyT7X2xWGX5bj9IEXFJTfwI3UL61L5gCSTykE5EDIVdLjzn9YmXOoI
         SUfGy+HMrWZCK8kWk2WllR+z1Or6l3n3+tqol3o6B+j0yfazbPD3KCSxEodPxBvIKglr
         qqNcUZ1Q0a+gusZI5fd1mpS3pGS3ptXOY047ftXQ531R9XO7szZ+8gyCfrzJT8qj0qVa
         6I0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7PxnOYRtDSba8w60HT/R980QahDRzR7J1w257VxlDx/JSmyCBzpt9Monr1cRwCKz1ioW3YZOtQh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDUqOOZYM1Z4v7vLaCtGbsHagzHb/PUqx7ylcaW1Mvp+xkOSSB
	eJSOgS6aLN8oHeg4V5mC28+G+9YW2FrVPvSslsBR1fr1F8P8R6Vt3ECMOfu//56xHk2v+09nqNC
	ongX7qyMxO3wLiY1/theWz03hUACTYiwGwlMbnLu/glGknuhxT+vs7vtjlrEpPg==
X-Gm-Gg: ASbGncs+3owfWZmjoJXKKHJgazfm99VzgDkK1Zan4vBx1qSJkO3N/SvGi90aaVklHtE
	KaPnLxOqiRSqflZUDbvb0vUFYoHUBYN4xEEHlw83+7VtkzIQE1711gIWaxBDmnwoiepuU1+eJG2
	uwAbbe2KtlDXA91uQu3Oo04MGSLkRdqfb9inq0QUnSB3Qw/G/ZWGr7hlwKY9JVFmsIrNVL9Ei+0
	DBo8A4eeYXC0sI3jvc9xAqqw/HvR1DMKf6WccS562ppU4A42BGwhXTvng3VvxCIIlj9J6I1iRxx
	6elY0mqCHCx2SboexOFIo9Kb/+dSVDao4/4blFunkOk0Tc0l67CHiekFoeG3uWnz3DyQLl197UM
	6CmoZv7Ru7ieuS5Ty4Z0=
X-Received: by 2002:a05:6000:61e:b0:429:d6dc:ae1a with SMTP id ffacd0b85a97d-42b59377f5cmr7143986f8f.30.1763279126237;
        Sat, 15 Nov 2025 23:45:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFavbSLEzC3fzGZlFNcbplKoDaGAFf6xm82Dmpuac8kJ0YL87asozxTpPgyhKXE0Otxlq6lXg==
X-Received: by 2002:a05:6000:61e:b0:429:d6dc:ae1a with SMTP id ffacd0b85a97d-42b59377f5cmr7143962f8f.30.1763279125674;
        Sat, 15 Nov 2025 23:45:25 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f2084dsm20221273f8f.42.2025.11.15.23.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 23:45:24 -0800 (PST)
Date: Sun, 16 Nov 2025 02:45:22 -0500
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
Subject: [PATCH v4 2/2] vhost: switch to arrays of feature bits
Message-ID: <17c98c7304b6d78d2d59893ba7295c2f64ab1224.1763278904.git.mst@redhat.com>
References: <cover.1763278904.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763278904.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

The current interface where caller has to know in which 64 bit chunk
each bit is, is inelegant and fragile.
Let's simply use arrays of bits.
By using unroll macros text size grows only slightly.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/net.c   | 34 +++++++++++++++++++---------------
 drivers/vhost/scsi.c  |  9 ++++++---
 drivers/vhost/test.c  | 10 ++++++++--
 drivers/vhost/vhost.h | 42 ++++++++++++++++++++++++++++++++++--------
 drivers/vhost/vsock.c | 10 ++++++----
 5 files changed, 73 insertions(+), 32 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index d057ea55f5ad..00d00034a97e 100644
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
@@ -1734,14 +1734,14 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
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
@@ -1753,9 +1753,13 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 		/* Copy the net features, up to the user-provided buffer size */
 		argp += sizeof(u64);
 		copied = min(count, (u64)VIRTIO_FEATURES_U64S);
-		if (copy_to_user(argp, vhost_net_features,
-				 copied * sizeof(u64)))
-			return -EFAULT;
+
+		{
+			const DEFINE_VHOST_FEATURES_ARRAY(features, vhost_net_features);
+
+			if (copy_to_user(argp, features, copied * sizeof(u64)))
+				return -EFAULT;
+		}
 
 		/* Zero the trailing space provided by user-space, if any */
 		if (clear_user(argp, size_mul(count - copied, sizeof(u64))))
@@ -1784,7 +1788,7 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
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
index 621a6d9a8791..d8f1af9a0ff1 100644
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
+	unsigned long res = 0;
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


Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EFD31618C
	for <linux-doc@vger.kernel.org>; Thu, 27 Nov 2025 06:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225645; cv=none; b=csi+bDdmaHe5xuslz4qKhAlJ+Q8pNSijcLPjSacVK2bzf9LdGTF77rEno8ePmXsesKRdoRg8W0MTh7lOB8NgRePZLBo/n5pZ1mmKXftY5Zoq2ld4DFUfnEaLUSc0JEvBl0CeVavANol58Ul3nQs53o6CabPTbdBugA6a01/KpcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225645; c=relaxed/simple;
	bh=6sJDh7TR0maQBdks2dSRada8nx8D+7jUwjltz8Ik4ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYmwjSa8smTaa8VHkeCa2h0gIEv4YtLewN43ELZ0fe58tTFi62aZcXLYJXw9WS9nkDUjuqT1NRzzn+nS/bevXstPSH/qtOuEGiyD6h8Sm+oqGjKH3R8csBtHE4CDObNKgKkG15vJxC50eVGv6Te13Tt4lyG5YrlKqv0aOjoDJVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PmUgRqi8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=a4bgkbIr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PmUgRqi8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="a4bgkbIr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764225642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=M+AVszRknLoY/jDDQOQpI/1Oya1cYB7+TjwgCKh4fLI=;
	b=PmUgRqi8IdSbhwMxe1bBnNIlYWdAULGcqjOYmLAEk0t2W65wqfdzNo7yOf5TsWupynj6pu
	mE3OxwML2Le0332x2z0ZPucHAIPS2FvU57NawR/LRVBeqUfqVGSfhb9TQiZjoHoqnQID0r
	CSi4D58jZLyuUzt0D7kdabiRhKezvoI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-nqPS-JnxO_K0DBxn112vyg-1; Thu, 27 Nov 2025 01:40:40 -0500
X-MC-Unique: nqPS-JnxO_K0DBxn112vyg-1
X-Mimecast-MFC-AGG-ID: nqPS-JnxO_K0DBxn112vyg_1764225640
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4779da35d27so4726855e9.3
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 22:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1764225639; x=1764830439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+AVszRknLoY/jDDQOQpI/1Oya1cYB7+TjwgCKh4fLI=;
        b=a4bgkbIroaiQLUuX2xEWFOpDIRPbGgpdEJ8ODCSn2M9cWbTHE+D0W8iZyzEZ925Y7D
         WCDFWEUAt7yfRuF74o/X2qZmVD+6yi6DX6NRQ0/Yt3d3nOvY2745ZQMEGGZ9iY1vYeMf
         wxDNJxKujzB5wcwRPPkNsusdAITZ50nDrrhgZPPLs2whEHzlHR9I7+V8LBh6O8NG47HK
         aEbuh3y7u/mQHZlC8nWmDtuJmeeh23QDYFKSE9AcwdktY90D6U4wnOa4T+WsQvFhFSDw
         YoUhhpYY3VMawGdVxVJXWdxGjF0pglQG1kxMO9WMVCjKfTdHr7IQ4X9LM6+RELlQtHev
         vkZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764225639; x=1764830439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+AVszRknLoY/jDDQOQpI/1Oya1cYB7+TjwgCKh4fLI=;
        b=NYBl95GLFHGIuuxmX4i+dc3Bpx/BVygZPKat59KbozOtMjCfAiaH0uqbbefpYeVed8
         7PZroz1c4a46whhdIsA/mvygj372YmpM0vM2y5BcrffnYjMsCUx2bdUvrFacj+IZOSpP
         ijzl7Folc6bFJ3SBZFT8fhSP3JMeOrkF5J50/izx1vTazWv1/56HUmAnFVaNeGv7WhTA
         yQYkWBUIHvzQ93hCwkgQz/6KZtS4iMLW8sgxV4Pv00SiF9JrRYP5blm5RT6Sjqar0bTD
         So8q3S1YAbfOOggq40Gh3zHUZpM9cEqvcd9Gl9s0+OtmaC4RU3u0cCq2Cg6WPDoKD/mX
         1l5g==
X-Forwarded-Encrypted: i=1; AJvYcCU0fjMH4Xy0FEQK63nzyFlP9bdVjACd9TtyaaeYzCHZWr4ZhN8oSBN1XUiXLcj18yl+YiitSvq4+C8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+KPcq6N8yWAJAajrsu3ZKfdXlwSbSo8pWRxy29PNg1+lr3sT
	OiJ/mFhZyL5Gf/8MF/2ek5cwUdHMQOeZovrOZ7a1cHnOI4NwiZXr3NWSe0rSp/DTGeiZg4HMidc
	k2kERuSiGaD9cn1uaGHvYslJBtnuHtLXqM6h0XeS0VQDe0wetaNVuZLfKKVKfXw==
X-Gm-Gg: ASbGncuVLqyDD2tns0/U/zyPshpJ8P0iVLEId97M+bVEIuSOJE/Chn51JjTzFELYkQs
	NBqfNUarSpI9YodHSXgtbrWnr1t8AKQrW4YCepA6STdOBugzWle3VA9hvRcRGqskxw8EWp9SK5z
	GSuPUxMy1RxtKsVardxG1cCx6XUQcrCqRyM3mY+SQ6ItBROz+hV1Fn8SMmii1LdipSVYYNhb2KZ
	+GM08ZlAjmP78wDVjVx/eiS8hro5YMSjpd63+T+y73AWQLyJdyV4WF+i14foYpL4T7hjKE40Zdd
	e6TOLrAZz6IoaHWx0fpeAjShHDfieeK1mrRi2uImjYv7qlTXNatPwSgqnUErC+TrTy2RBRvl88c
	E+tA0vEqJ3Uo+2IlN7njXGpZFfHfT1w==
X-Received: by 2002:a05:600c:4f48:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-47904b2494cmr86356935e9.26.1764225639360;
        Wed, 26 Nov 2025 22:40:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIc2HWl1bEZAW98bVde7+vw9sLlCeonr8va9/QQZdNQY3M7yfM4XWOaGQlBJyuh5tTNCFGXw==
X-Received: by 2002:a05:600c:4f48:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-47904b2494cmr86356645e9.26.1764225638741;
        Wed, 26 Nov 2025 22:40:38 -0800 (PST)
Received: from redhat.com (IGLD-80-230-39-63.inter.net.il. [80.230.39.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0c44dcsm78644225e9.11.2025.11.26.22.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 22:40:38 -0800 (PST)
Date: Thu, 27 Nov 2025 01:40:35 -0500
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
Subject: [PATCH v6 3/3] vhost: switch to arrays of feature bits
Message-ID: <637e182e139980e5930d50b928ba5ac072d628a9.1764225384.git.mst@redhat.com>
References: <cover.1764225384.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764225384.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

The current interface where caller has to know in which 64 bit chunk
each bit is, is inelegant and fragile.
Let's simply use arrays of bits.
By using unroll macros text size grows only slightly.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/net.c   | 19 ++++++++++---------
 drivers/vhost/scsi.c  |  9 ++++++---
 drivers/vhost/test.c  |  6 +++++-
 drivers/vhost/vhost.h | 42 ++++++++++++++++++++++++++++++++++--------
 drivers/vhost/vsock.c | 10 ++++++----
 5 files changed, 61 insertions(+), 25 deletions(-)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index d057ea55f5ad..f8ed39337f56 100644
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
+static const int vhost_net_bits[] = {
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
+	const DEFINE_VHOST_FEATURES_ARRAY(vhost_net_features, vhost_net_bits);
 	u64 all_features[VIRTIO_FEATURES_U64S];
 	struct vhost_net *n = f->private_data;
 	void __user *argp = (void __user *)arg;
diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 98e4f68f4e3c..f43c1fe9fad9 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -197,11 +197,14 @@ enum {
 };
 
 /* Note: can't set VIRTIO_F_VERSION_1 yet, since that implies ANY_LAYOUT. */
-enum {
-	VHOST_SCSI_FEATURES = VHOST_FEATURES | (1ULL << VIRTIO_SCSI_F_HOTPLUG) |
-					       (1ULL << VIRTIO_SCSI_F_T10_PI)
+static const int vhost_scsi_bits[] = {
+	VHOST_FEATURES,
+	VIRTIO_SCSI_F_HOTPLUG,
+	VIRTIO_SCSI_F_T10_PI
 };
 
+#define VHOST_SCSI_FEATURES VHOST_FEATURES_U64(vhost_scsi_bits, 0)
+
 #define VHOST_SCSI_MAX_TARGET	256
 #define VHOST_SCSI_MAX_IO_VQ	1024
 #define VHOST_SCSI_MAX_EVENT	128
diff --git a/drivers/vhost/test.c b/drivers/vhost/test.c
index 94cd09f36f59..f592b2f548e8 100644
--- a/drivers/vhost/test.c
+++ b/drivers/vhost/test.c
@@ -28,7 +28,11 @@
  */
 #define VHOST_TEST_PKT_WEIGHT 256
 
-#define VHOST_TEST_FEATURES VHOST_FEATURES
+static const int vhost_test_bits[] = {
+	VHOST_FEATURES
+};
+
+#define VHOST_TEST_FEATURES VHOST_FEATURES_U64(vhost_test_features, 0)
 
 enum {
 	VHOST_TEST_VQ = 0,
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
index ae01457ea2cd..0298ddc34824 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -29,12 +29,14 @@
  */
 #define VHOST_VSOCK_PKT_WEIGHT 256
 
-enum {
-	VHOST_VSOCK_FEATURES = VHOST_FEATURES |
-			       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
-			       (1ULL << VIRTIO_VSOCK_F_SEQPACKET)
+static const int vhost_vsock_bits[] = {
+	VHOST_FEATURES,
+	VIRTIO_F_ACCESS_PLATFORM,
+	VIRTIO_VSOCK_F_SEQPACKET
 };
 
+#define VHOST_VSOCK_FEATURES VHOST_FEATURES_U64(vhost_vsock_bits, 0)
+
 enum {
 	VHOST_VSOCK_BACKEND_FEATURES = (1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2)
 };
-- 
MST


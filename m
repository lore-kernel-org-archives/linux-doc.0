Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5557825A2AA
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751958623; cv=none; b=iKDJ4F1kG1tYsaB4oRj1khuwcYxSQh0CSKd89KIR4sDq00jZze45lz+8zlCfoa3e0TSJV40u3Q4754HRvRKCyKzPZ0xrp+RXko2bBNHrF5D3LcI0PiaFjiXvk8YVnez+p1F6HBP3j0g8GRWQrjxy9owbsths3688cftolFaC/EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751958623; c=relaxed/simple;
	bh=QrI9odfF/uV7RGTTHzhC9JgwDHOzDCA19DI2FkxGVps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iw0k/VY4Vz1+BBemW0mSc2wcldWZKaRAq6mg5F+bnezuQZG9C7PyBvFT5xdnMl05GGQ1jFlDwgK+HiBlUOAk2BfbB5uEkJ6+BdepFs1dKn+KtRwviKhKNJoPn3GiwDEcxWUTGSLYhrKPctk6W8XaGCAJCsoL4eIkuMTfylVLp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I9UIOzZh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I9UIOzZh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751958621;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6KpFhc4Hj0PEHds6KPRG7PFOojvVhObAvYwpnZczxEs=;
	b=I9UIOzZhOf8uiM15zV75YbOe5bICnQ9IaY2sHfWdpXR3FYfbsPk9NqHJiAfwVsreutr6xE
	2wZGcDBIKSF75ZaDaPWLf0aGAa40fIKcODiCKr98iFkPpz7ATVNSprqHnefq2GX75d/4xW
	fVapJfiMHaepM2cdjXcOwEPCWMJAUNc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-122-53_FhS6iOsmvys9RUoVe6Q-1; Tue,
 08 Jul 2025 03:10:16 -0400
X-MC-Unique: 53_FhS6iOsmvys9RUoVe6Q-1
X-Mimecast-MFC-AGG-ID: 53_FhS6iOsmvys9RUoVe6Q_1751958614
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8238D18011F9;
	Tue,  8 Jul 2025 07:10:14 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.32.252])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E0D34195608F;
	Tue,  8 Jul 2025 07:10:08 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Yuri Benditovich <yuri.benditovich@daynix.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Jonathan Corbet <corbet@lwn.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 net-next 9/9] vhost/net: enable gso over UDP tunnel support.
Date: Tue,  8 Jul 2025 09:09:05 +0200
Message-ID: <161588f943709493b2709ae3cb459548d9920bd2.1751874094.git.pabeni@redhat.com>
In-Reply-To: <cover.1751874094.git.pabeni@redhat.com>
References: <cover.1751874094.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Vhost net need to know the exact virtio net hdr size to be able
to copy such header correctly. Teach it about the newly defined
UDP tunnel-related option and update the hdr size computation
accordingly.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
v3 -> v4:
  - rebased
---
 drivers/vhost/net.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 4aa2930382ad..bfb774c273ea 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -75,6 +75,8 @@ static const u64 vhost_net_features[VIRTIO_FEATURES_DWORDS] = {
 	(1ULL << VIRTIO_NET_F_MRG_RXBUF) |
 	(1ULL << VIRTIO_F_ACCESS_PLATFORM) |
 	(1ULL << VIRTIO_F_RING_RESET),
+	VIRTIO_BIT(VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO) |
+	VIRTIO_BIT(VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO),
 };
 
 enum {
@@ -1616,6 +1618,12 @@ static int vhost_net_set_features(struct vhost_net *n, const u64 *features)
 		  sizeof(struct virtio_net_hdr_mrg_rxbuf) :
 		  sizeof(struct virtio_net_hdr);
 
+	if (virtio_features_test_bit(features,
+				     VIRTIO_NET_F_HOST_UDP_TUNNEL_GSO) ||
+	    virtio_features_test_bit(features,
+				     VIRTIO_NET_F_GUEST_UDP_TUNNEL_GSO))
+		hdr_len = sizeof(struct virtio_net_hdr_v1_hash_tunnel);
+
 	if (virtio_features_test_bit(features, VHOST_NET_F_VIRTIO_NET_HDR)) {
 		/* vhost provides vnet_hdr */
 		vhost_hlen = hdr_len;
-- 
2.49.0


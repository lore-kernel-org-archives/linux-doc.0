Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90D32D5C9A
	for <linux-doc@vger.kernel.org>; Tue, 24 Jun 2025 14:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774263; cv=none; b=iKOmULTvnCZsS+4ZqBpAF3cBGbA6rbsuMyhIMkPn9TEBLF2DQ9QywYpf+deczc8PbVeGQKuZjDXKRD7QogY+BmoLqvdcORBqm3lx8N8s2onvHibXzMDAm5HclnEndd7Dwbc5Z1I5r6f0aXusZxvR4JT5bA/1kTADOEAKMrJ1mtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774263; c=relaxed/simple;
	bh=YCNJ+z+ni7T9i5/PDxBYW+kpkiPpzWbbdHUYmgSRMa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TeSoCziWeYQLbwkmCfx0sCd1l60RelMIBPzNNYlFvHSxGlH+gqy3Kw6LcWcXyRg3oUi2xN/yB944BHgVrb6Oe8spQPSXHLtSauli9iZWYqlot+IKNp2IINcknPQXOxJxzQRccJdTiEiWLKpaz0BHSLMxB1EfWe/Tqxa7JUoizlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KYjMdocG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KYjMdocG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750774260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A/zQttmcnExROycHPtcExuAs5MgShwE2WW9I76fIuPY=;
	b=KYjMdocGk0NldQdnJF1OVK+q2HkzsBwQREl4cKdZdQ4reO+uLXUG5eoeEsjsMKidkJjcnA
	DUREVMF8diZOl6kURBhTJW7e6II/5J1ZSH5MOJ/77j1oZRdgBP+9Ntv80CTe+7Ovxju2Ev
	NN8gvLLqiH8fMQxvsn0lnFJBEVCulBI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-451-EQMhH3rkOOKX1EdQclrdYQ-1; Tue,
 24 Jun 2025 10:10:57 -0400
X-MC-Unique: EQMhH3rkOOKX1EdQclrdYQ-1
X-Mimecast-MFC-AGG-ID: EQMhH3rkOOKX1EdQclrdYQ_1750774255
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6DE3A1956095;
	Tue, 24 Jun 2025 14:10:55 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.45.224.193])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 92397195608F;
	Tue, 24 Jun 2025 14:10:48 +0000 (UTC)
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
Subject: [PATCH v6 net-next 5/9] virtio_net: add supports for extended offloads
Date: Tue, 24 Jun 2025 16:09:47 +0200
Message-ID: <09cfc4bb359ade9d5f432362a18e773e88a24b94.1750753211.git.pabeni@redhat.com>
In-Reply-To: <cover.1750753211.git.pabeni@redhat.com>
References: <cover.1750753211.git.pabeni@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The virtio_net driver needs it to implement GSO over UDP tunnel
offload.

The only missing piece is mapping them to/from the extended
features.

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Paolo Abeni <pabeni@redhat.com>
---
v4 -> v5:
 - avoid lines longer than 80 chars

v2 -> v3:
 - offload to feature conversion is now an inline function

v1 -> v2:
 - drop unused macro
 - restrict the offload remap range as per latest spec update
---
 drivers/net/virtio_net.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 07e41dce4203..ad73863324e8 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -35,6 +35,23 @@ module_param(csum, bool, 0444);
 module_param(gso, bool, 0444);
 module_param(napi_tx, bool, 0644);
 
+#define VIRTIO_OFFLOAD_MAP_MIN	46
+#define VIRTIO_OFFLOAD_MAP_MAX	47
+#define VIRTIO_FEATURES_MAP_MIN	65
+#define VIRTIO_O2F_DELTA	(VIRTIO_FEATURES_MAP_MIN - \
+				 VIRTIO_OFFLOAD_MAP_MIN)
+
+static bool virtio_is_mapped_offload(unsigned int obit)
+{
+	return obit >= VIRTIO_OFFLOAD_MAP_MIN &&
+	       obit <= VIRTIO_OFFLOAD_MAP_MAX;
+}
+
+static unsigned int virtio_offload_to_feature(unsigned int obit)
+{
+	return virtio_is_mapped_offload(obit) ? obit + VIRTIO_O2F_DELTA : obit;
+}
+
 /* FIXME: MTU in config. */
 #define GOOD_PACKET_LEN (ETH_HLEN + VLAN_HLEN + ETH_DATA_LEN)
 #define GOOD_COPY_LEN	128
@@ -7026,9 +7043,13 @@ static int virtnet_probe(struct virtio_device *vdev)
 		netif_carrier_on(dev);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(guest_offloads); i++)
-		if (virtio_has_feature(vi->vdev, guest_offloads[i]))
+	for (i = 0; i < ARRAY_SIZE(guest_offloads); i++) {
+		unsigned int fbit;
+
+		fbit = virtio_offload_to_feature(guest_offloads[i]);
+		if (virtio_has_feature(vi->vdev, fbit))
 			set_bit(guest_offloads[i], &vi->guest_offloads);
+	}
 	vi->guest_offloads_capable = vi->guest_offloads;
 
 	rtnl_unlock();
-- 
2.49.0


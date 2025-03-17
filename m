Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE87B23F438
	for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 10:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209145; cv=none; b=e1LP7Be4KYx6TxPjEmAn4/4SWZARFHe5w5cQDqhZr2gbN4RwBN2h6H0W9VVAyzkAkPmZIx3reHXX6QWkMCa0gi1H0G3F69gBqG4EaKmfQxXc22p7620puCCLL8cOmMQdyVMo0A3NEu37Jw6yeEHs7ijnUoAn0su2Hd4ReJI0KNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209145; c=relaxed/simple;
	bh=ccfXZvxiSAaG5MPb2w/JWrekNXtLfO8PT1kfNykthKs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=Nu5aKrXJrOtqBoivCYlbYh0VS0gudh4rX0CT4RFBFtSJ4KLU8ashiHCEfYghChl7wJSaOshi5PmBLS0lGbBU5ut3zEBNJmlKupgYQNz2Y59qdZ/mNWHlpeYnMGVV9U7lecaH3NP7n+KV88tlm7aBmkt9KrgQUxj74ehZbUcqyPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com; spf=pass smtp.mailfrom=daynix.com; dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b=c1CDWCed; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daynix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=daynix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=daynix-com.20230601.gappssmtp.com header.i=@daynix-com.20230601.gappssmtp.com header.b="c1CDWCed"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22401f4d35aso75372015ad.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Mar 2025 03:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742209143; x=1742813943; darn=vger.kernel.org;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3BkVPEmJoa+6yr2vocUy5kvhLH0cmr2yCWFD5W/C7U=;
        b=c1CDWCedPdAaOwlP1q8hJPZKsmOkK4Xj1sUYqPL8e+3+DLupbzF3zRV6yDcpYPOwaS
         8VI48468PeJQG6NCjB8pZLV/5kO2mPpURfJZiBLkRhHH+2qQJlQ3TTE5sDHZqUZ5U5TF
         ZCMBkvEhLW+Cf38uEQiAuh1esJ6DUlOv245Xi7NHTqTJptZFmfMQN4b1LbjjZ4JHLeLY
         c0faq2d/l4xwY+zORy/sbiRqxU23c12LCgYZBfcmDx3bU2fXniobyukEbSkAODvyzr+S
         itTOxu+1pOm0BpnQ/RWsFBfH0IT8Z+CnrZz5RwhVN2d3vyTLhoalqkSL47zZ4M2neCQr
         IeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742209143; x=1742813943;
        h=to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3BkVPEmJoa+6yr2vocUy5kvhLH0cmr2yCWFD5W/C7U=;
        b=SP+/BbDupXjKprjm+zuKBZFV7Ogt9GlNMZOv446Ao3wSQCQdelpdDiG8EeGUSuXVov
         vQbPhyASnSMODpPLeEwF5dYjebwABX0jj1LHaGYDazGm4OWKiUYV/xHWf2xyrtXHXMmh
         Y5H/kzM+D7hO5r3r/qzx8s6BuqWBSqHBHfqKIJ8g1OtugA0qh4ZWJdncUqAvQMfa/2BN
         PSiZ+FyzgCCKVewg4opjjp/h8MXbiLKlVI949njx3ySgzipWByvK+QiUq3YvLsRJFHhB
         wBidjptWRbQVVFjgtFC1+W1kdA0KqVTjxjAxj8YZzADLAva7g9RYs1AVuExTVLZ/MKq9
         5kKg==
X-Forwarded-Encrypted: i=1; AJvYcCWe5G9vTCGlVBPmV59vivnfxUTaXArur87d6dtk3cLI1yxT0Yg2JseZ9fhwUdYTPzIVlq3GlJdQt2g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzoWjQS5A21DuU1xoiLb3WOJjWzDLgI8zzv7B6K09G/a36h5E1
	4fAdbWyv8QuOd5+jEu1vG2CRR83ujGIGpuk+sdkg/satxofdMHquRNW4HhX+NmAW2CmN9sjQHfC
	Q2r0=
X-Gm-Gg: ASbGncsTIr82ZHDWmyxXTtEPuds2PrLdS1ExgodK7XJKogsyfCiNMmlwazc9XR6ya6l
	qFUXIjoobSlvDXvXtN7Ak4M0vl0V9oB4oE+gSUd6DBS1Zf8304KnH8Xvrwq6EHvHTkXeO9UeNol
	wTXHZZQa0/sy56ZwQ/7s0ymKeW5LCIKj3PjpgzhAkfJxmme3FoKpRzxUBupkR6+/oQ4BoNqBNzp
	YaRORvtPiIGgUubg7SqwOF8uLNeLb9rbxC3t+WXYV3TuqGfJTOVZaJ7h28qBQT57gY9xV65xcHH
	+ja50spDz0DEqg3Jk8GBhhsUJMT9y19r0CCZpI3rnqyYsvQg
X-Google-Smtp-Source: AGHT+IGOao21bnQoF8f7GMJyK43XLi/BXMCK2hiBw4ypcEkYOkj5BsLms/4g5Wmz+GYI5JTnjSMvyg==
X-Received: by 2002:a17:902:dac3:b0:224:1ec0:8a0c with SMTP id d9443c01a7336-225e0a79f54mr144040315ad.29.1742209143268;
        Mon, 17 Mar 2025 03:59:03 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-225c6bbcd4asm72044005ad.164.2025.03.17.03.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 03:59:03 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Mon, 17 Mar 2025 19:57:59 +0900
Subject: [PATCH net-next v11 09/10] selftest: tap: Add tests for virtio-net
 ioctls
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250317-rss-v11-9-4cacca92f31f@daynix.com>
References: <20250317-rss-v11-0-4cacca92f31f@daynix.com>
In-Reply-To: <20250317-rss-v11-0-4cacca92f31f@daynix.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Shuah Khan <shuah@kernel.org>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, kvm@vger.kernel.org, 
 virtualization@lists.linux-foundation.org, linux-kselftest@vger.kernel.org, 
 Yuri Benditovich <yuri.benditovich@daynix.com>, 
 Andrew Melnychenko <andrew@daynix.com>, 
 Stephen Hemminger <stephen@networkplumber.org>, gur.stavi@huawei.com, 
 Lei Yang <leiyang@redhat.com>, Simon Horman <horms@kernel.org>, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6

They only test the ioctls are wired up to the implementation common with
tun as it is already tested for tun.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 tools/testing/selftests/net/tap.c | 97 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/net/tap.c b/tools/testing/selftests/net/tap.c
index 247c3b3ac1c9..fbd38b08fdfa 100644
--- a/tools/testing/selftests/net/tap.c
+++ b/tools/testing/selftests/net/tap.c
@@ -363,6 +363,7 @@ size_t build_test_packet_crash_tap_invalid_eth_proto(uint8_t *buf,
 FIXTURE(tap)
 {
 	int fd;
+	bool deleted;
 };
 
 FIXTURE_SETUP(tap)
@@ -387,8 +388,10 @@ FIXTURE_TEARDOWN(tap)
 	if (self->fd != -1)
 		close(self->fd);
 
-	ret = dev_delete(param_dev_tap_name);
-	EXPECT_EQ(ret, 0);
+	if (!self->deleted) {
+		ret = dev_delete(param_dev_tap_name);
+		EXPECT_EQ(ret, 0);
+	}
 
 	ret = dev_delete(param_dev_dummy_name);
 	EXPECT_EQ(ret, 0);
@@ -431,4 +434,94 @@ TEST_F(tap, test_packet_crash_tap_invalid_eth_proto)
 	ASSERT_EQ(errno, EINVAL);
 }
 
+TEST_F(tap, test_vnethdrsz)
+{
+	int sz = sizeof(struct virtio_net_hdr_v1_hash);
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ASSERT_FALSE(ioctl(self->fd, TUNSETVNETHDRSZ, &sz));
+	sz = 0;
+	ASSERT_FALSE(ioctl(self->fd, TUNGETVNETHDRSZ, &sz));
+	EXPECT_EQ(sizeof(struct virtio_net_hdr_v1_hash), sz);
+}
+
+TEST_F(tap, test_vnetle)
+{
+	int le = 1;
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ASSERT_FALSE(ioctl(self->fd, TUNSETVNETLE, &le));
+	le = 0;
+	ASSERT_FALSE(ioctl(self->fd, TUNGETVNETLE, &le));
+	EXPECT_EQ(1, le);
+}
+
+TEST_F(tap, test_vnetbe)
+{
+	int be = 1;
+	int ret;
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ret = ioctl(self->fd, TUNSETVNETBE, &be);
+	if (ret == -1 && errno == EINVAL)
+		SKIP(return, "TUNSETVNETBE not supported");
+
+	ASSERT_FALSE(ret);
+	be = 0;
+	ASSERT_FALSE(ioctl(self->fd, TUNGETVNETBE, &be));
+	EXPECT_EQ(1, be);
+}
+
+TEST_F(tap, test_getvnethashcap)
+{
+	static const struct tun_vnet_hash expected = {
+		.flags = TUN_VNET_HASH_REPORT | TUN_VNET_HASH_RSS,
+		.types = VIRTIO_NET_RSS_HASH_TYPE_IPv4 |
+			 VIRTIO_NET_RSS_HASH_TYPE_TCPv4 |
+			 VIRTIO_NET_RSS_HASH_TYPE_UDPv4 |
+			 VIRTIO_NET_RSS_HASH_TYPE_IPv6 |
+			 VIRTIO_NET_RSS_HASH_TYPE_TCPv6 |
+			 VIRTIO_NET_RSS_HASH_TYPE_UDPv6
+	};
+	struct tun_vnet_hash seen;
+	int ret;
+
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ret = ioctl(self->fd, TUNGETVNETHASHCAP, &seen);
+
+	if (ret == -1 && errno == EINVAL)
+		SKIP(return, "TUNGETVNETHASHCAP not supported");
+
+	EXPECT_FALSE(ret);
+	EXPECT_FALSE(memcmp(&expected, &seen, sizeof(expected)));
+}
+
+TEST_F(tap, test_setvnethash_alive)
+{
+	struct tun_vnet_hash hash = { .flags = 0 };
+
+	EXPECT_FALSE(ioctl(self->fd, TUNSETVNETHASH, &hash));
+}
+
+TEST_F(tap, test_setvnethash_deleted)
+{
+	ASSERT_FALSE(dev_delete(param_dev_tap_name));
+	self->deleted = true;
+
+	ASSERT_EQ(-1, ioctl(self->fd, TUNSETVNETHASH));
+
+	if (errno == EINVAL)
+		SKIP(return, "TUNSETVNETHASH not supported");
+
+	EXPECT_EQ(EBADFD, errno);
+}
+
 TEST_HARNESS_MAIN

-- 
2.48.1


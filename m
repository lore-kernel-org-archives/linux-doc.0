Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CEE391E45
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 17:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779369; cv=none; b=qKHXXGQGdkxGF/BHmoM5oE9l6MNDTT+/+ka9Pk3OnTJI9sTrmI8ANHWnELVWDBQ09eqtnad8aw0qmjyVMrNFBNj1+mGh38+G4EYHBAPaW0lPQJTAKo4ycrImYPVJDj+kJOSYDK6nir8U8GMraEbOs37puTTS0iq99h89+hIpVCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779369; c=relaxed/simple;
	bh=AUkEXZ9shK/AEw9rish8lLHvzIx+b3il3PP8PxYF4lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u6/c2av+u+yQXuqFuux0SYXby8DvMM+VRPwn/4bzvkUSxq+TtqRdsfBdsTfFDFKYzZx8sFYlzdKqOLmy9uC+31TtXVG4KQjQuIvLY01Ko0Ec1L6MzmycuhoKrz8mvy6615+PIRA3EW5OlHNlBAtOhG1+jwVu/VyFLt+hhqCRC80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hhC9n54V; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hhC9n54V"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba856db1c0so56027135ad.3
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 10:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778779366; x=1779384166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yopC/9MxA39yKranAJ5Os3jyJpUN93ONWaDD2qEA7s=;
        b=hhC9n54VZ84cvwcMzJlpSU1MH0hA1f/oYJpnYy/Q1Bz8o2YAC4g4b1KRCIJFj7jbcG
         17MbTa+7oIHCkTa3U7ukQjglNo2cP4KYEHgqt7DbWkjppbSR2O1yagSEEwfrjbBOq+Gz
         GFg+70CFvzzzzVT48L9ooA+aipUvQwOe7Pnu8GEVIka24yUbXA5Y4pTkCX5s17E9jXd7
         uQif0SqOsAPWI3KFa5IE3rHZW1rgBxNJEHltQ20cCMwkVvA/Kvw1Wd+IvnJQOpF6vNrJ
         t++uC3Eehj9/it/gXWn/eN8FvV9UfvrTgOQz7bPJJ11kXFagMzCIf6BbT8iyr/kniXPU
         tlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778779366; x=1779384166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7yopC/9MxA39yKranAJ5Os3jyJpUN93ONWaDD2qEA7s=;
        b=i2a3Jv+7HGgGD3D2zPSBouQwSHqzDtZsBNUb0s0cBlsQ+soDV2ZsbBKUYQJGGQ0b9i
         0SuRnlAmLNZXpxtcmf6PBRQnywYWEDnGDuw3qg8tcgx1d+ZU8JZeaRWXrlhk6BNWpkMj
         /EJdjFhlsXF9ixTIp0uz8oH46fgUxKeaF8xoJGER4Q0+/fb+vs7EXHXGsmy+SoGiy80g
         UdP25cpDUdlW5gNZeZlOjHmSLLdZS+kkHaeNm8dU/h1OEoJ0vSpRHeVCvhtB3gj2dl5A
         a2Q9zNBXsM0F8QMT26t4TrzvSDDBZ3hpSSRhloNFMhSiW4LgbvZk3yMV4UuqPSXMKp8i
         YMLA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ubv/G+9V//azV0FZhFwiqWy5CAIuo9uLRbgPTsRW9peKtWF/f06HmK7HyL50Oo+Fz6YzS7R2Cy4k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxqbq/wLAkK3GYktxTrFtqjXKkWb9gCQiP3j234y/Q/82t9jFsl
	ktiGcASHpFV5ayuLE8d1dzRvcKH+w7y80nyYOetDWAdJQim1Y88BT46t
X-Gm-Gg: Acq92OE5hhr83t9SPTzQX2ii4DDMGFrZ4TDNgQYr+lihsxzzXRkTcf5Go3mkoy75Pl4
	1gvI70g77fKKQNv4fdK5gq1yAfd/RlikjycbPJsJ6KA0CD6EztC3epdTqQNTkZjU+p+MEHPz3JF
	AwuRpXPunEtS0/LILTTlt18GVnZRssEX9KGvX3Nv8q1rPhWJoeX9er+uv5Gl/UAZVOI1wYSvDhB
	qpNr5o7X11Sl3dI/lQL0IgGdaO3xDPr3Ye76eVmP6ErB4YGNnBJSv3FO7r0TO88d1q+ol7nJVFR
	iOdk2urqnpHxxfen1xCK7+tHFA96Tgc5c8LFpxO3pD0jD8dQ7Zeqh9wJOZBil8nXFuFjjoSPwgF
	cCDYf13EJbigstsjuVagZaIdjnsaalCJmDsXxxCnjyq+ISqEucxy0YZIss4jzNZi8iDgyPubxKX
	V0Atab73dNsdlduuFMns/0
X-Received: by 2002:a17:903:46d0:b0:2bd:657f:3a1a with SMTP id d9443c01a7336-2bd7e77ab65mr5300005ad.8.1778779366071;
        Thu, 14 May 2026 10:22:46 -0700 (PDT)
Received: from localhost ([2a03:2880:f80c:1::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm32152215ad.60.2026.05.14.10.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 10:22:45 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Thu, 14 May 2026 10:22:29 -0700
Subject: [PATCH net-next v5 2/8] net: netkit: declare NETMEM_TX_NO_DMA mode
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260514-tcp-dm-netkit-v5-2-408c59b91e66@meta.com>
References: <20260514-tcp-dm-netkit-v5-0-408c59b91e66@meta.com>
In-Reply-To: <20260514-tcp-dm-netkit-v5-0-408c59b91e66@meta.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Michael Chan <michael.chan@broadcom.com>, 
 Pavan Chebbi <pavan.chebbi@broadcom.com>, 
 Joshua Washington <joshwash@google.com>, 
 Harshitha Ramamurthy <hramamurthy@google.com>, 
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
 Mark Bloch <mbloch@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Nikolay Aleksandrov <razor@blackwall.org>, Shuah Khan <shuah@kernel.org>
Cc: dw@davidwei.uk, sdf.kernel@gmail.com, mohsin.bashr@gmail.com, 
 willemb@google.com, jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, 
 wang.yaxin@zte.com.cn, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
 netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, 
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.13.0

From: Bobby Eshleman <bobbyeshleman@meta.com>

Some virtual devices like netkit (or ifb) never DMA and never touch frag
contents, they just forward the skb to another device. They are unable
to forward unreadable skbs, however, because they fail to pass TX
validation checks on dev->netmem_tx. The existing two-state
NETMEM_TX_NONE / NETMEM_TX_DMA doesn't give the TX validator enough
information to differentiate devices that will attempt DMA on the
unreadable skb from those that will simply route it untouched.

Add a third mode to the enum so drivers can indicate 1) if they have
netmem TX support, and 2) if they do, whether they are DMA-capable:

NETMEM_TX_NO_DMA - pass-through, device never DMAs

Widen dev->netmem_tx from a 1-bit field to 2 bits to fit the new value,
and declare netkit as NETMEM_TX_NO_DMA. Devmem TX support over these
devices comes in a follow-up patch.

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
Changes in v3:
- net_cachelines/net_device.rst: align the netmem_tx row's type column
  with the rest of the table by using "unsigned_long:2" instead of
  "unsigned long:2"
- Split this into a distinct patch (Jakub)
---
 Documentation/networking/net_cachelines/net_device.rst | 2 +-
 Documentation/networking/netmem.rst                    | 3 +++
 Documentation/translations/zh_CN/networking/netmem.rst | 3 +++
 drivers/net/netkit.c                                   | 1 +
 include/linux/netdevice.h                              | 3 ++-
 5 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/net_cachelines/net_device.rst b/Documentation/networking/net_cachelines/net_device.rst
index 1c19bb7705df..7b3392553fd6 100644
--- a/Documentation/networking/net_cachelines/net_device.rst
+++ b/Documentation/networking/net_cachelines/net_device.rst
@@ -10,7 +10,7 @@ Type                                Name                        fastpath_tx_acce
 =================================== =========================== =================== =================== ===================================================================================
 unsigned_long:32                    priv_flags                  read_mostly                             __dev_queue_xmit(tx)
 unsigned_long:1                     lltx                        read_mostly                             HARD_TX_LOCK,HARD_TX_TRYLOCK,HARD_TX_UNLOCK(tx)
-unsigned long:1                     netmem_tx:1;                read_mostly
+unsigned_long:2                     netmem_tx:2;                read_mostly
 char                                name[16]
 struct netdev_name_node*            name_node
 struct dev_ifalias*                 ifalias
diff --git a/Documentation/networking/netmem.rst b/Documentation/networking/netmem.rst
index 5ccadba4f373..217869d1108d 100644
--- a/Documentation/networking/netmem.rst
+++ b/Documentation/networking/netmem.rst
@@ -99,3 +99,6 @@ Driver TX Requirements
    appropriate mode:
 
    - `NETMEM_TX_DMA`: for physical devices that perform DMA.
+
+   - `NETMEM_TX_NO_DMA`: for virtual or passthrough devices that do
+     not DMA, but still support handling of netmem-backed skbs.
diff --git a/Documentation/translations/zh_CN/networking/netmem.rst b/Documentation/translations/zh_CN/networking/netmem.rst
index 9c84423b7528..320f3eacf51b 100644
--- a/Documentation/translations/zh_CN/networking/netmem.rst
+++ b/Documentation/translations/zh_CN/networking/netmem.rst
@@ -92,3 +92,6 @@ dma-mapping API 去处理。
 2. 驱动程序应将 `netdev->netmem_tx` 设置为适当的模式：
 
    - `NETMEM_TX_DMA`：适用于执行 DMA 的物理设备。
+
+   - `NETMEM_TX_NO_DMA`：适用于不执行 DMA 的虚拟或透传设备，但仍支持
+     处理 netmem 支持的 skb。
diff --git a/drivers/net/netkit.c b/drivers/net/netkit.c
index 5e2eecc3165d..0ad6a806d7d5 100644
--- a/drivers/net/netkit.c
+++ b/drivers/net/netkit.c
@@ -466,6 +466,7 @@ static void netkit_setup(struct net_device *dev)
 	dev->priv_flags |= IFF_NO_QUEUE;
 	dev->priv_flags |= IFF_DISABLE_NETPOLL;
 	dev->lltx = true;
+	dev->netmem_tx = NETMEM_TX_NO_DMA;
 
 	dev->netdev_ops     = &netkit_netdev_ops;
 	dev->ethtool_ops    = &netkit_ethtool_ops;
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index b7a4503f7cdb..bf3dd9b2c1a7 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -1797,6 +1797,7 @@ enum netdev_stat_type {
 enum netmem_tx_mode {
 	NETMEM_TX_NONE,		/* no netmem TX support */
 	NETMEM_TX_DMA,		/* DMA-capable netmem TX (real HW) */
+	NETMEM_TX_NO_DMA,	/* no DMA, e.g. passthrough for virtual devs */
 };
 
 enum netdev_reg_state {
@@ -2143,7 +2144,7 @@ struct net_device {
 	struct_group(priv_flags_fast,
 		unsigned long		priv_flags:32;
 		unsigned long		lltx:1;
-		unsigned long		netmem_tx:1;
+		unsigned long		netmem_tx:2;
 	);
 	const struct net_device_ops *netdev_ops;
 	const struct header_ops *header_ops;

-- 
2.53.0-Meta


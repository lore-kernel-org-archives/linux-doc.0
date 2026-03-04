Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA1F35DA66
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640048; cv=none; b=NWhoUVV7r320oqml/jEgQTBcwh2UFGK2Xx6+Fwyqmk7DnZgBpyvdZmXRpClcZpu3ygGvU9Wr3999Gr33Y38+Zn2yQQYyhe4AxUZgic9PlRLPKGgoSxcbQDDpQTmUFf/ZaRtm+710fJDKBmLLlbx2juvFf4/pk+f+eaYGvDhY9c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640048; c=relaxed/simple;
	bh=1WRGLRV1Mf3gtLoQpSz/WpelFSk3nN1ML07ryNxiF/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fyGxDshw/NMaED8S84G2wQ/kzhjo9V5abS0RiG6WQS0n/pZCa5Hqq/5gUG/6swVi2B+WEnuMRc/KOZYz+hloz/uwNqrBUmxWmZ2nVhGXh/pTmTtDttR9Irkyppj7HwOMCE4TS6eYEW3cEIe7KQapAz7bOqsIXmc5yt8ApmwpX7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=DZOczu81; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="DZOczu81"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48371bb515eso105064765e9.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772640045; x=1773244845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPMyjPKUIKGGoXPsQ6f7ReT1eeW8YNhjgt1YhvCXpE0=;
        b=DZOczu81F1YpJZt0v/hbcrxLBV2F3mt8F/FDxiydgHMhEfA6LkKSGkIsT2Gyfn2h5B
         jfFRx6jA9UjgWz/yVI84PRIzZQslfItpsM6aWg1Fh+h1rtBsfVYieIbBCqU7w1COEOqM
         6lbVvq22GjXwU1hxCbVsVaGAqvq+iimirKt1ElPXMyxz5t5r2TYQk+TAjISxaB0jwmq2
         aD1zCXck1RgfGttAgf+xGjhzPbApxbR5zOv4tXkeyiZk4nqop8HzbwDTsyUDqUo69Mpy
         NpJalalKe7JI//WgQR3NBlOFTIq0i1UhwOmlWrPItK/SpLQ52dCbFNuk98Nhi2BbSGOM
         YX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640045; x=1773244845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPMyjPKUIKGGoXPsQ6f7ReT1eeW8YNhjgt1YhvCXpE0=;
        b=OrfeKNclOsHvGqAIrHWBWT6QRw61g2roIgU1hH1LGpA8brXfNDGNCJUuB7J86159KX
         ZMtB4ucJXYwhhfTp22LPs2LMKUIc9pZLGsw+sbwcfHuLrg4RmF7aarX/MRikDMTGjijk
         4N4sfO5vDfVI07oCWr4SilrO43C/kxN1JpPI/hn1j/febPuA75grFS4DyUozUYeaxhzJ
         7pf/vwBGUQeoeAlmMo8LeX4P23ePx3p5aFvS4JYLQFDCrM+tWfMe3sWb7FSiEw2vAvnF
         Xrf/MJD2qLo4X9Dg8kAHFBBuFocZ3GfoPIpadqTeKjF4Pm7oG7L83sWYGoZXc4AG9acQ
         PLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF3qYmNtxfbVEiyFTaX9C0KZ9AF0LrRMJDnIE7TLAdW/M49/zMIQzMWHDg9ap0Z/17Ik8G83pn7qY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPlhP8KnCz/fXIC4I7xXlNb0gZ8K5ffYuV3oFW4h17+AXyjWL/
	SqZqWfqsWuuu6W1E+pw4zxfbtF7Ri3qUNakgHH5t1PjYVTMGq9FexXFHK6TAO0KtJIM=
X-Gm-Gg: ATEYQzzfGUtWDZ/sW4+W6yrGP59DgXnGpPwTlCtCX2QCB2tb4h+msKvEiQBanZ7q6Wl
	5hs5m3iVg1T+AIia1wc/md9a3KOMyftc4mvbG5evSuD4lCwgcNOFouB1hy1BlZR4won7VdV5eEj
	s25wiGL9N4U9+ez9PmDhvsr1y10lGEhk+bxGWWRaO8cS/Bujeefm17zrc25Sygo2/bA+nJYuNa4
	1lbdvuoehPoQIlLbG8PnObCdeQnf4im5fzzihLCJGRVfSboT7WG7lsZNz2mOQVSCKvxQ8cd67GE
	p7fhKuLjWPD5WK0131NEuUnZQDdhWvkM5TP1WWKoLlZue+GczlpoPMrCSGe/HGfN23Z7WiGAQMY
	YtUMoXfuEtO55/bH14gbljd/QiL/f9GPupABBegOogE7eK86fTx1JYyfj5xnOJ1In9M0MLvKHza
	KZ+GJKgvRmBpbngqC1JaDWOfn+DzW+YF5JRGi1f+s+uAioQw==
X-Received: by 2002:a05:600c:1986:b0:480:f27c:6335 with SMTP id 5b1f17b1804b1-4851988f93fmr39508765e9.25.1772640044457;
        Wed, 04 Mar 2026 08:00:44 -0800 (PST)
Received: from localhost (46-13-72-179.customers.tmcz.cz. [46.13.72.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851887fd5asm62598465e9.11.2026.03.04.08.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:00:43 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	donald.hunter@gmail.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	przemyslaw.kitszel@intel.com,
	mschmidt@redhat.com,
	andrew+netdev@lunn.ch,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com,
	chuck.lever@oracle.com,
	matttbe@kernel.org,
	cjubran@nvidia.com,
	daniel.zahka@gmail.com,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH net-next v3 09/13] devlink: add devl_warn() helper and use it in port warnings
Date: Wed,  4 Mar 2026 17:00:18 +0100
Message-ID: <20260304160022.6114-10-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260304160022.6114-1-jiri@resnulli.us>
References: <20260304160022.6114-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

Introduce devl_warn() macro that uses dev_warn() when a backing
device is available and falls back to pr_warn() otherwise. Convert
all dev_warn() calls in port.c to use it, preparing for devlink
instances without a backing device.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v2->v3:
- new patch
---
 net/devlink/devl_internal.h |  9 +++++++++
 net/devlink/port.c          | 14 +++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/net/devlink/devl_internal.h b/net/devlink/devl_internal.h
index 3cc7e696e0fd..cb2ffef1ac2d 100644
--- a/net/devlink/devl_internal.h
+++ b/net/devlink/devl_internal.h
@@ -71,6 +71,15 @@ struct devlink *__devlink_alloc(const struct devlink_ops *ops, size_t priv_size,
 				struct net *net, struct device *dev,
 				const struct device_driver *dev_driver);
 
+#define devl_warn(devlink, format, args...)				\
+	do {								\
+		if ((devlink)->dev)					\
+			dev_warn((devlink)->dev, format, ##args);	\
+		else							\
+			pr_warn("devlink (%s): " format,		\
+				devlink_dev_name(devlink), ##args);	\
+	} while (0)
+
 /* devlink instances are open to the access from the user space after
  * devlink_register() call. Such logical barrier allows us to have certain
  * expectations related to locking.
diff --git a/net/devlink/port.c b/net/devlink/port.c
index fa3e1597711b..7fcd1d3ed44c 100644
--- a/net/devlink/port.c
+++ b/net/devlink/port.c
@@ -976,7 +976,7 @@ static void devlink_port_type_warn(struct work_struct *work)
 	struct devlink_port *port = container_of(to_delayed_work(work),
 						 struct devlink_port,
 						 type_warn_dw);
-	dev_warn(port->devlink->dev, "Type was not set for devlink port.");
+	devl_warn(port->devlink, "Type was not set for devlink port.");
 }
 
 static bool devlink_port_type_should_warn(struct devlink_port *devlink_port)
@@ -1242,9 +1242,9 @@ static void __devlink_port_type_set(struct devlink_port *devlink_port,
  */
 void devlink_port_type_eth_set(struct devlink_port *devlink_port)
 {
-	dev_warn(devlink_port->devlink->dev,
-		 "devlink port type for port %d set to Ethernet without a software interface reference, device type not supported by the kernel?\n",
-		 devlink_port->index);
+	devl_warn(devlink_port->devlink,
+		  "devlink port type for port %d set to Ethernet without a software interface reference, device type not supported by the kernel?\n",
+		  devlink_port->index);
 	__devlink_port_type_set(devlink_port, DEVLINK_PORT_TYPE_ETH, NULL);
 }
 EXPORT_SYMBOL_GPL(devlink_port_type_eth_set);
@@ -1273,9 +1273,9 @@ EXPORT_SYMBOL_GPL(devlink_port_type_ib_set);
 void devlink_port_type_clear(struct devlink_port *devlink_port)
 {
 	if (devlink_port->type == DEVLINK_PORT_TYPE_ETH)
-		dev_warn(devlink_port->devlink->dev,
-			 "devlink port type for port %d cleared without a software interface reference, device type not supported by the kernel?\n",
-			 devlink_port->index);
+		devl_warn(devlink_port->devlink,
+			  "devlink port type for port %d cleared without a software interface reference, device type not supported by the kernel?\n",
+			  devlink_port->index);
 	__devlink_port_type_set(devlink_port, DEVLINK_PORT_TYPE_NOTSET, NULL);
 }
 EXPORT_SYMBOL_GPL(devlink_port_type_clear);
-- 
2.51.1


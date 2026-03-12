Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF503BFE31
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309863; cv=none; b=jZZmSkjozo2GH4NbZycsFralGHjzW38mK8S38efSnGp3K7v9Bz07mMiT6QFFhUmR4/CT7uEJLD0PH1XxlRf0YvomO/8dTl9gTp6g+EvCTX90mQZIlVMQjpHSJcYldfmwsR3yuGyra9WRF97FiqtskeJy0P2FZDD3yugDPhwnSSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309863; c=relaxed/simple;
	bh=1WRGLRV1Mf3gtLoQpSz/WpelFSk3nN1ML07ryNxiF/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B3wWOqXrFgZ6TRhUcWdQoJ3dq26MgAiL/5ldgz4gt8BnrG7wiZc0rpsRmAzPKEQdscXNhEZ2cnWFkcRyXZ+tzobAvKEK6EfVjNpY6LIKsy3V6CGKNNDqJJQZscSQmMp/4zeZ+OquFUaI4F87a9rxjMN+Vu501KxyHzKD/L5kvmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Fg9svybA; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Fg9svybA"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439ce3605ecso665095f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773309860; x=1773914660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MPMyjPKUIKGGoXPsQ6f7ReT1eeW8YNhjgt1YhvCXpE0=;
        b=Fg9svybAcoL/8W3TMV8UD1aita997P0m/lDmRNhHElXkBbE1/WCbgS7iQoLWF2/H5L
         9ALqht8tNXwyv6UehXx0G3Y0kM33W2jUX+egpH/Q/Jjr8nB0srr9XmehLdJF03P8hWso
         IEDck8AQ/u81W/ZsY2i1oRmrTPuOasmrsUHto7QCdwPPz50+4O9QxQ3jLBTan2qHidna
         oX7pa5OGcOzUu2Sla73tAJFcGnMseXEgnEKjf8yS2OIXQQuHqnRU8YmDuv6mG7f8v3/T
         zwSgH2wICBZpf5koM7412QWwXJFyqGNYKrSPgyNQHY+hMfEONAQjyrCALRF8OEj0/8dB
         Chiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309860; x=1773914660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MPMyjPKUIKGGoXPsQ6f7ReT1eeW8YNhjgt1YhvCXpE0=;
        b=Fg3g/Nn+dXX6Zhp4geFuj2uM1eTB7QYQ/Lj4JkFoWHgyBUd+J1wlBZooCWnbClujES
         hRRVQf5F+lOFwqT15+XmxS8PJi1M1n+KSTWI7QgL2i2Hsbyo01g6x3MQliLOS1tLX0Bw
         mpDv/TlYeuIl1AUknU9Er1R9fE0yzynZPpeNBtnwGv9gN3dJQTlm67IqfgM4BEiV4/BV
         szizOsg5EJhcOOjTNquyRdvK0cP7luuvDfWanBcAGU+bTZuezul4p5eVRNJNWZZmnu8/
         WK5lHyoJS1SxK7/4haKby3smk1wqTRs2g7xdDINeXG82rq2USQ5BA1G1h98PSjBXpy6r
         4wfA==
X-Forwarded-Encrypted: i=1; AJvYcCVoH9NouDqnLUpFs2/P+1b4oshPh8WT+XQwJ8TPNFkEQAQJ0OKigO3MqyJm0wWR7UfH0pzlrjroBrA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh6Yun++3HTohTSbf1wsRqGNk71398WTVa7Zp2AuV53bxLbQ+x
	eUCF8eZgT2W1sFV4ubpYHzofBBl1Pq0ITLDfZY0bQ1y2VmD1R0D+r5x/4ALBj+jtVdw=
X-Gm-Gg: ATEYQzx+p9WaWCi08ZY+77wxjsj/Ird3t8HdBPHQDUX11RYMAb2+IWzOKaUdrC1Nudd
	7gHG7rIwWE5LID9Yp60xX1CTYkkwCx8AuTFtmRjyFUzE+JISstToZ36ljBCGKKJ2B9AGuRosOwv
	vT4u7bkeX8asPYHh5pwW0aICP2XzAQcfNtRsJ1ejSJIcR0rqjTsz9negZDVvMAKL58l6OupP+Jr
	iIo9KSYVaoP17q8rf2cK3ndiLin+vPnxXZ3/kwqe5kZjgjwNKq6ly6dfZ9fT0nbedSVUlBVZZGb
	4xo4tRVyw575Mw+W2i03Hf5OxUKpPhUocTiJx3twZRO1mCSgYZlVeMOz9TtxkvkYScfz6cNKTf2
	ylUQ13QBskBN+o0pruKnUYq2r+BcWVfovfJQ/59jFuqOvPBVTUuvNu7Zm9os7s/fMko7nbFAO+x
	nL5QqA4hLR0Lw/4A==
X-Received: by 2002:a05:6000:2681:b0:439:cb9f:d635 with SMTP id ffacd0b85a97d-439f8223054mr10822988f8f.46.1773309859695;
        Thu, 12 Mar 2026 03:04:19 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm6305802f8f.10.2026.03.12.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:04:19 -0700 (PDT)
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
Subject: [PATCH net-next v4 09/13] devlink: add devl_warn() helper and use it in port warnings
Date: Thu, 12 Mar 2026 11:04:03 +0100
Message-ID: <20260312100407.551173-10-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260312100407.551173-1-jiri@resnulli.us>
References: <20260312100407.551173-1-jiri@resnulli.us>
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


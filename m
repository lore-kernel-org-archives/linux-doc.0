Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397A73BF686
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309861; cv=none; b=nk+L0jVnoop8AggMkvHCx/FYaEB8Q1TFQ7z5WRuWlhmjMSN5xe9WUT1M5tXqdzOI1CC8IioVmgsBdi0/nZLuslEr0uMRLvbKuTD5GxtOfiyRknQXrKAU6xvqmvYXVK7/Kssh74QR75soQiA/lXDT04Zlj28jgWMYb8AN1wrnD2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309861; c=relaxed/simple;
	bh=7DRFVjIY+Ygj/L7QkL1uTDqAGAZViCzf/BNmCHn88Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hwbffkAgHRJp51lKFOAwaezCXHhaQa+oXf62UU10yHeEsL6rFFEDM658xWZfnmM9JbRKHRp7hc3Zzqq971rEWElaniTdZU/jkIX/t5BeCE9RQm7pS1jADibWD9ZmNdOrS4Y6pdnjuK8NySZlf/fnhAHzGAp23wr6wxwxJiBccv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=KSIjSVQq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="KSIjSVQq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b78b638eso902408f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773309857; x=1773914657; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n2wY6Op/4DSI4vvkFWBlagxqRGhWF9+RBtWwPNkHP68=;
        b=KSIjSVQqlLM6E+xIK5q2jBSjB/vBFosH4JkpAltGAax2/BQpY0uh1aIsegW2Nlh6SP
         1oAcecgqEZDMO4kmnlNDXbM57TokOVqNZOnU4mUZx+FdZth5alTWSEkDU29xwIXPcsrw
         ZLubgtFlefLPyEFdGd6n9dzhwTfs8ZsQFixqdmQRp9n3GbdZsGgzxx+z5W8qohb99SVa
         xxeRnv1ri7qvVZImf/lEao+JUZ2xFl0lPgdeu2jdTQl6b94N0SuNcWTQO+VF54T1H8Y5
         mIvPVKelhpj4H/G9kgPcz0aUDLe85NIvTNisS47IdEhrhqGrqlxZmkoKe1CfxakbinCS
         7C6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309857; x=1773914657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n2wY6Op/4DSI4vvkFWBlagxqRGhWF9+RBtWwPNkHP68=;
        b=wq70yVGWPTF9h+ov8e9/lbMR0mKJSWGsXOQCv06hivb/XCpBJerRZLSJAxcx50nin4
         Rhsgxaui8MHFmEaL38p8ratHNJSca6EvHSyTn6rBUGLWr0EUltNNdyghINf4QaNTVx74
         WSctRZVO/NHyEp+OyudVBkCVxLYG/T8CJKwPNrrTlUHgBI1LQxx6uXk2y+WD3c4hmHqJ
         4S5jBS8CTUrxM2rfyW0Yy8n6Z97pua3Cw1PpjEuNd8wVV+8SOLyX3vFDFcui8fk1rYLS
         d9hEEQjYAiJI0BA88wMZqC4pwVZDXV3o3rV9OOuupMQnLCpahHY32fnAH7v4nJzCNCxi
         JNwg==
X-Forwarded-Encrypted: i=1; AJvYcCXBTboVKZ/wBoNXlvU3ioqWsTMafaBXyph/VIxdSP0IcRjTThav2XEUoxd/Csn4xp+fzXojpyqRKAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwucyauImfcFN85AizbOVC30BqdM2AhAg/iFJn/JbXFpoEGgVi6
	zWjEnNtNZ3JPs3eQFUjXXorqK9TE5WFq964furvIsWKehMPU96yyFqZfXCZDhAzKvf8=
X-Gm-Gg: ATEYQzy1tf9q04mK2+kHBwume5EUDJxvMfVpaXAxVark7JZKtDZGPN3wNs6GTANWqQK
	0DZymnXUTAivOJR3n9uV3SJ3E47yx7ObrF8LhzApwvj3xZPvvbuemYlvnOQvTtraee2MIdDJxp0
	C2+ZnKGWEyLQBof/E1HPU5s+3s/V1jyRLyqX6WI2uHN61/drMyKAa0OF5F11cOMFWY42tr7x1A8
	hr1h35ZxB+hivJwtfVYgTgfNB3Aj14wfJszMkntCt9jxf2RRL6/x4vO1KBBJz1RbdVV9CvfeXdH
	8LfyGDkQbiKA01+87HxJk28UbwJjO37hlz4SMzdV6pFF+Arcof7EoJ3s7rKmGh6iPknLBFoJ3de
	fltc0n731y8dYaEOY+CTKaPAZyciIuQkhsprcXLqdiOixix/hXoSPjmBm0TD53v0uQzSfA7dWuO
	TwAX8sJ8saFfQlRQ==
X-Received: by 2002:a05:6000:186a:b0:439:b1c3:84bc with SMTP id ffacd0b85a97d-439f81e297fmr11955825f8f.7.1773309857325;
        Thu, 12 Mar 2026 03:04:17 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b4dasm6982812f8f.18.2026.03.12.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:04:16 -0700 (PDT)
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
Subject: [PATCH net-next v4 07/13] devlink: introduce __devlink_alloc() with dev driver pointer
Date: Thu, 12 Mar 2026 11:04:01 +0100
Message-ID: <20260312100407.551173-8-jiri@resnulli.us>
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

Introduce __devlink_alloc() as an internal devlink allocator that
accepts a struct device_driver pointer and stores it in the devlink
instance. This allows internal devlink code (e.g. shared instances)
to associate a driver with a devlink instance without need to pass dev
pointer.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v2->v3:
- new patch
---
 net/devlink/core.c          | 40 ++++++++++++++++++++++---------------
 net/devlink/devl_internal.h |  5 +++++
 2 files changed, 29 insertions(+), 16 deletions(-)

diff --git a/net/devlink/core.c b/net/devlink/core.c
index 237558abcd63..fcb73d3e56aa 100644
--- a/net/devlink/core.c
+++ b/net/devlink/core.c
@@ -418,27 +418,15 @@ void devlink_unregister(struct devlink *devlink)
 }
 EXPORT_SYMBOL_GPL(devlink_unregister);
 
-/**
- *	devlink_alloc_ns - Allocate new devlink instance resources
- *	in specific namespace
- *
- *	@ops: ops
- *	@priv_size: size of user private data
- *	@net: net namespace
- *	@dev: parent device
- *
- *	Allocate new devlink instance resources, including devlink index
- *	and name.
- */
-struct devlink *devlink_alloc_ns(const struct devlink_ops *ops,
-				 size_t priv_size, struct net *net,
-				 struct device *dev)
+struct devlink *__devlink_alloc(const struct devlink_ops *ops, size_t priv_size,
+				struct net *net, struct device *dev,
+				const struct device_driver *dev_driver)
 {
 	struct devlink *devlink;
 	static u32 last_id;
 	int ret;
 
-	WARN_ON(!ops || !dev);
+	WARN_ON(!ops || !dev || !dev_driver);
 	if (!devlink_reload_actions_valid(ops))
 		return NULL;
 
@@ -453,6 +441,7 @@ struct devlink *devlink_alloc_ns(const struct devlink_ops *ops,
 
 	devlink->dev = get_device(dev);
 	devlink->ops = ops;
+	devlink->dev_driver = dev_driver;
 	xa_init_flags(&devlink->ports, XA_FLAGS_ALLOC);
 	xa_init_flags(&devlink->params, XA_FLAGS_ALLOC);
 	xa_init_flags(&devlink->snapshot_ids, XA_FLAGS_ALLOC);
@@ -480,6 +469,25 @@ struct devlink *devlink_alloc_ns(const struct devlink_ops *ops,
 	kvfree(devlink);
 	return NULL;
 }
+
+/**
+ *	devlink_alloc_ns - Allocate new devlink instance resources
+ *	in specific namespace
+ *
+ *	@ops: ops
+ *	@priv_size: size of user private data
+ *	@net: net namespace
+ *	@dev: parent device
+ *
+ *	Allocate new devlink instance resources, including devlink index
+ *	and name.
+ */
+struct devlink *devlink_alloc_ns(const struct devlink_ops *ops,
+				 size_t priv_size, struct net *net,
+				 struct device *dev)
+{
+	return __devlink_alloc(ops, priv_size, net, dev, dev->driver);
+}
 EXPORT_SYMBOL_GPL(devlink_alloc_ns);
 
 /**
diff --git a/net/devlink/devl_internal.h b/net/devlink/devl_internal.h
index f0ebfb936770..3cc7e696e0fd 100644
--- a/net/devlink/devl_internal.h
+++ b/net/devlink/devl_internal.h
@@ -49,6 +49,7 @@ struct devlink {
 	struct xarray snapshot_ids;
 	struct devlink_dev_stats stats;
 	struct device *dev;
+	const struct device_driver *dev_driver;
 	possible_net_t _net;
 	/* Serializes access to devlink instance specific objects such as
 	 * port, sb, dpipe, resource, params, region, traps and more.
@@ -66,6 +67,10 @@ struct devlink {
 extern struct xarray devlinks;
 extern struct genl_family devlink_nl_family;
 
+struct devlink *__devlink_alloc(const struct devlink_ops *ops, size_t priv_size,
+				struct net *net, struct device *dev,
+				const struct device_driver *dev_driver);
+
 /* devlink instances are open to the access from the user space after
  * devlink_register() call. Such logical barrier allows us to have certain
  * expectations related to locking.
-- 
2.51.1


Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895C734CFB8
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640040; cv=none; b=gMfdbnxSilnEJ608h5kfkcyA6Xq7GkpN9teg+EmvXh0pew4QwtMwER6WIbBhJ0d4IW9TE0aLuVom9CeCXgYJqNHsfrHCJNhtXzpTN9Q7pED8ACRcJNOD1eYooiAD23uDZjFwmECM5yJKVs2LRlPUjiQ45qp+bm7fYSfO+7Q+MSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640040; c=relaxed/simple;
	bh=7REG7e7eRo2LxU+1EFfdE+Tg/P+KtVUgE1UdHUpYeqA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lf3BF64KS2o0/AjprnXGRg+QqlsjRxzd1kfncdU1tTr5PBaNzIdE94PssvOfuvnTDco7rOCyoQtyXXAsGjvcVylrXbVuQWnU8cl20l104XD41UQaAWzh3yDnqO85vJ819mArm+0vdN57WC8J6UVqtNG8RPBn+Nftj4LlkQUyrrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=a+mo6D77; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="a+mo6D77"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439c5cce2c6so1095816f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772640038; x=1773244838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p91XYxkA2zwDeIW6zeLvmoR6wJYLphT9dGZNIHh7FC0=;
        b=a+mo6D77gQakkEaolTxn15deziNA3EDNqfo5B2nIYDDcABV5Z2Nr0N30J/A8ht9L7l
         DYR9BzVcDr8OooS+HU5+vXfewsT8+92hnDqcYFvbRQeByGk76a/yd0R+3FRBPW356ZFX
         gUkgSvQ5m44kd9j+1LCFPS+S1WCg3jnGUeEB8kNtT40M+pCXzyNEr3Dz4jfwQeiL0uh9
         8JOvqLdGIMAA44vz4fB1qRO3SQcsWZk4QqsfziHlRhGOj2cTulsVvWFgq26K166QXK8A
         ZLRupfodJOZHzgt5WJQHemEvjGublGRwhIIL37455QhBmqnetUQT4hlq0JkIFwb3Ki1Z
         MwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640038; x=1773244838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p91XYxkA2zwDeIW6zeLvmoR6wJYLphT9dGZNIHh7FC0=;
        b=rrqbIV5wqwH0ygK2sOheyBo5Anet9Awfb842ZInEtIBKH4KigEdMlNB8k3A984w6ps
         I1BubHq7QzRmtvO9LNusuGym2i1kLrUH6Nqn088UjPT15YZ2xtSavgh1cL3g/QScotPz
         H0dmyNnTY5B8adbnx6rYHibvAxnOuckFmKb08xecmMg+Sy9f5ha2H/0iU/mPiEe66pPy
         m2RiJ5BglHgsnvgGek1VqU+24b/GZ0EmZAtuGDMMwYDhyktrPBYesjcbUeJ1jV7XTgCA
         kV+OwDNGyAMq2SyBf66cZlHuCF485hbAy4MF0sGn4tFGqNChB7DJrU0PKcrq4dNDXMra
         rkKw==
X-Forwarded-Encrypted: i=1; AJvYcCVw7A/97kz0T5r3zK6p9+bzGEwNiTes24oiGYBpqMkZiJ8wEZvQ1VCgCpsICWoThVRrVXNoZI8RmXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlBuKJrrY5X+QxiSPC97a+8J5+KbvH63pu2Tc0SVnrt+EGzfOF
	kUFgEusDhJSl7+C0BqWNjiLg4FawaFQpZctOmSMkVtGT/H6nMsc+3OS93XDAcQ4TZG+N7EZ/Icu
	nWlGCbQs=
X-Gm-Gg: ATEYQzw4iccRWciICjWIy1EpUavjF9uV5jIB7lLaWFaM5VoJnT4rqGpiTdYS07n4XGK
	I9tojVPNxVaDUMnGJhukVzJDO8BJMFhshUrjUAUWalVzyPaVwUF4KpeEPX5m23fRvzIKN1I6ZuE
	IDPaiIRneSf1I+9Sf78RX5dtdPm2kfI4MSqiWPOESpESuqNuC1Bsu7ad0tZ9yNZEmBOoZdT2XSn
	+dvmMAQJ9EpCaDz/M0pex/fQsFiQ7vFsL9ZsgPfBCsnD+7voetYG8IgKTQgSKaGfCLPle5SYM60
	270zHM7X/U3ZCiLFxVl07WFUANHbD3nOWqmM/QoIFfosMKbc0lzPjBXBxnhnAgJqdNjjohtKPXo
	+xZ5CEgU2ahFF2Pd1TJfX4wgALU/A4VF+YL09NfN2l1LGF3zdnTDx4v9J3oC4OIU1zztSNPU+fr
	niWSe3SDBNbY9uzyun+YWMNBuLzMz/ilJ/PmmscoCjk8uwew==
X-Received: by 2002:a5d:5f91:0:b0:439:c43a:acb6 with SMTP id ffacd0b85a97d-439c7f64efdmr4412616f8f.10.1772640037350;
        Wed, 04 Mar 2026 08:00:37 -0800 (PST)
Received: from localhost (46-13-72-179.customers.tmcz.cz. [46.13.72.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm42727213f8f.24.2026.03.04.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:00:36 -0800 (PST)
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
Subject: [PATCH net-next v3 05/13] devlink: support index-based lookup via bus_name/dev_name handle
Date: Wed,  4 Mar 2026 17:00:14 +0100
Message-ID: <20260304160022.6114-6-jiri@resnulli.us>
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

Devlink instances without a backing device use bus_name
"devlink_index" and dev_name set to the decimal index string.
When user space sends this handle, detect the pattern and perform
a direct xarray lookup by index instead of iterating all instances.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v2->v3:
- unify return value -ENODEV even in case non-numeric dev_name
v1->v2:
- moved DEVLINK_INDEX_BUS_NAME definition here from patch #7
---
 include/uapi/linux/devlink.h | 2 ++
 net/devlink/netlink.c        | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/uapi/linux/devlink.h b/include/uapi/linux/devlink.h
index 1ba3436db4ae..7de2d8cc862f 100644
--- a/include/uapi/linux/devlink.h
+++ b/include/uapi/linux/devlink.h
@@ -19,6 +19,8 @@
 #define DEVLINK_GENL_VERSION 0x1
 #define DEVLINK_GENL_MCGRP_CONFIG_NAME "config"
 
+#define DEVLINK_INDEX_BUS_NAME "devlink_index"
+
 enum devlink_command {
 	/* don't change the order or add anything between, this is ABI! */
 	DEVLINK_CMD_UNSPEC,
diff --git a/net/devlink/netlink.c b/net/devlink/netlink.c
index e73e39116365..5db931a0091c 100644
--- a/net/devlink/netlink.c
+++ b/net/devlink/netlink.c
@@ -208,6 +208,15 @@ devlink_get_from_attrs_lock(struct net *net, struct nlattr **attrs,
 	busname = nla_data(attrs[DEVLINK_ATTR_BUS_NAME]);
 	devname = nla_data(attrs[DEVLINK_ATTR_DEV_NAME]);
 
+	if (!strcmp(busname, DEVLINK_INDEX_BUS_NAME)) {
+		if (kstrtoul(devname, 10, &index))
+			return ERR_PTR(-ENODEV);
+		devlink = devlinks_xa_lookup_get(net, index);
+		if (!devlink)
+			return ERR_PTR(-ENODEV);
+		goto found;
+	}
+
 	devlinks_xa_for_each_registered_get(net, index, devlink) {
 		if (strcmp(devlink_bus_name(devlink), busname) == 0 &&
 		    strcmp(devlink_dev_name(devlink), devname) == 0)
-- 
2.51.1


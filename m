Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4E3BED5C
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309863; cv=none; b=Kk6o3OdWugj/3cFetp9DDtjUwLeRtxSKfK1oiCFQcOyA1hvzg+U005QYzLfqabMgv9G6srkriLg0hefDRFQuwsEWWr+f56oR4v6tgkL5y6uWw5gP4Ne0Cr1RLX/xpsh2DtowoQohnkyawIzd7J/U5/ARF41xD4yNesbSCx03voA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309863; c=relaxed/simple;
	bh=xLsXwuVt8lGwGVFFyvY2JOLZOXAAfQeVNQWGZqC43oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbS/xHF7Vs2T8I3NxpnnVK/cp/2A2zNdbfMeNeyxTj2nCC1pii/lqaNVTuIrr/X9KDS4NkcgzU6WQ6JbDtJPkKwBqj1WGKxHSA3Sn2Oa0fCYUso5BY5Ye1LN44oxGCYf0yqkZ6lAfn6Qn5HJYWMQE1LBEwI0khmIqIlYdKY1du8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=JUee8Qun; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="JUee8Qun"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso665339f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773309859; x=1773914659; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vCm7aN6GgQ9bQDL2tV38A52iqAWlIVq3d7H/Br7Cpdk=;
        b=JUee8QunVCarJIB7ly32JZiXD6VM53iMNKywSves0VBafjXSVLuOEwENnHsgch2+WN
         KSPyhF3oEu28k8eIFdtUZrgoWExq4+cD03JA/TecfX5dUSyve/bKqIHpJkq4RQhwJw5b
         ALK8ABS+14Db9gLNHv52/d8q/WAKMbenjHqr2+JNgU5TvcfV2s01rVbnuLcpcceZk6qq
         zSDSVyMFD3Mj9o5VWQuSC5CdqU8yYtTrwWiv1DWDXvRwsdkYcwb3662qUrZzkesE/7jK
         1M+7BF6h2x9ifyN9xIGuiweiYVuW9ztzUbl6/qDbfRXK687M1Caq9DvzItNbnUB9J3SG
         jfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309859; x=1773914659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vCm7aN6GgQ9bQDL2tV38A52iqAWlIVq3d7H/Br7Cpdk=;
        b=R+5RKBcFh1nXnzB7B5tsq47NhQeGdOM/em1ahbS/VD4RhGD1Tm0fgZZ0qz/wXAx4ad
         4tBMVfN0Hh0t7XdxOBG8MdJKkEOqxwnBn2mE9IRWyz4LuB9uvig4ZJGCztvY2pVXMlP5
         NpyC0sMOWwddRY7wR9Ku9Iey9lIIRdzBqwBd+IPY7M1ZyFAfmQo6s9Y3jMgnEN9H+Qfl
         Fuwspj6XHYZd4ELGgVAoba2bpRzF+qSPcd4YljjSTxTnguwARbQ6Vg5HgC/uCjcAVoBp
         eJ6bBapdz/cZW6mOumRLDJsjY6r+unWQtrTI3c0kqCBByUaPdHFyG9Ix09RDjjukOc03
         mqKw==
X-Forwarded-Encrypted: i=1; AJvYcCU3KOKUQYre6Bgy/Mv5370PpWsiuk1JCwjMzZPUNqTCOX5nLMLjHcuydInvdretG5cPFUbbN9xjzRA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzywF8EhItUes9XKs8EpK/nEbHVXAy9bmwSvhckpy5PRMhsTyc0
	iE1dkUqfYInSIE1rV0HJfko8jEJNgnyx2dOFzoy8sK2RwFgp8c94NNpAcx2bMawKD8o=
X-Gm-Gg: ATEYQzz0XCr/ZwjshEHbjlzk+R6v3P3YGdY9zlA1T9JtAutax52+ynB2nPlsMVu/6jK
	CuhoE/w2fgbADzGevlt+785cQqzO8utwBcevbMtdm84D05ytNSytzazb1n7+ZKe3pZVpBTqKVw4
	gPx9TJC+eQIvXckO9uh6ZqPklxUy4T2+Ua6p3Rtew8mF4lQEatr7/JThHE5meMRYoaHPtdYt88D
	c9eqaS+3RA8QXqOJN1IrVtq5BO9LvfPxcl9cUpgxPGg+WwPYJgbsHCo5xeOyXXm41dlQ2Yg5v/E
	Jxek84tJFBX+rGo8Mwb4fjxYkTPhMZCqy+hXfSwOtYvHzAr9ZBrAkcI6d0+7nkA4SLE5bZTeCvT
	3J7t5UNivehnfwM6ZQSDTuaLEcy/kQJE4wm3QulHwvnhjUGT1fKNAfrdXcQRAkekOSFQmN9r4TW
	A+7pzJMNqb4jP0KA==
X-Received: by 2002:a05:6000:230c:b0:439:b3a3:7239 with SMTP id ffacd0b85a97d-439f81bdb5amr10514615f8f.5.1773309858528;
        Thu, 12 Mar 2026 03:04:18 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm6943586f8f.29.2026.03.12.03.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:04:18 -0700 (PDT)
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
Subject: [PATCH net-next v4 08/13] devlink: add devlink_dev_driver_name() helper and use it in trace events
Date: Thu, 12 Mar 2026 11:04:02 +0100
Message-ID: <20260312100407.551173-9-jiri@resnulli.us>
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

In preparation to dev-less devlinks, add devlink_dev_driver_name()
that returns the driver name stored in devlink struct, and use it in
all trace events.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v2->v3:
- using stored devlink->dev_driver
v1->v2:
- added missing symbol export
---
 include/net/devlink.h          |  1 +
 include/trace/events/devlink.h | 12 ++++++------
 net/devlink/core.c             |  6 ++++++
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/net/devlink.h b/include/net/devlink.h
index 0afb0958b910..45dec7067a8e 100644
--- a/include/net/devlink.h
+++ b/include/net/devlink.h
@@ -1613,6 +1613,7 @@ struct devlink *priv_to_devlink(void *priv);
 struct device *devlink_to_dev(const struct devlink *devlink);
 const char *devlink_bus_name(const struct devlink *devlink);
 const char *devlink_dev_name(const struct devlink *devlink);
+const char *devlink_dev_driver_name(const struct devlink *devlink);
 
 /* Devlink instance explicit locking */
 void devl_lock(struct devlink *devlink);
diff --git a/include/trace/events/devlink.h b/include/trace/events/devlink.h
index 32304ce9ad15..4f8edf77dfbe 100644
--- a/include/trace/events/devlink.h
+++ b/include/trace/events/devlink.h
@@ -23,7 +23,7 @@ TRACE_EVENT(devlink_hwmsg,
 	TP_STRUCT__entry(
 		__string(bus_name, devlink_bus_name(devlink))
 		__string(dev_name, devlink_dev_name(devlink))
-		__string(driver_name, devlink_to_dev(devlink)->driver->name)
+		__string(driver_name, devlink_dev_driver_name(devlink))
 		__field(bool, incoming)
 		__field(unsigned long, type)
 		__dynamic_array(u8, buf, len)
@@ -57,7 +57,7 @@ TRACE_EVENT(devlink_hwerr,
 	TP_STRUCT__entry(
 		__string(bus_name, devlink_bus_name(devlink))
 		__string(dev_name, devlink_dev_name(devlink))
-		__string(driver_name, devlink_to_dev(devlink)->driver->name)
+		__string(driver_name, devlink_dev_driver_name(devlink))
 		__field(int, err)
 		__string(msg, msg)
 		),
@@ -87,7 +87,7 @@ TRACE_EVENT(devlink_health_report,
 	TP_STRUCT__entry(
 		__string(bus_name, devlink_bus_name(devlink))
 		__string(dev_name, devlink_dev_name(devlink))
-		__string(driver_name, devlink_to_dev(devlink)->driver->name)
+		__string(driver_name, devlink_dev_driver_name(devlink))
 		__string(reporter_name, reporter_name)
 		__string(msg, msg)
 	),
@@ -118,7 +118,7 @@ TRACE_EVENT(devlink_health_recover_aborted,
 	TP_STRUCT__entry(
 		__string(bus_name, devlink_bus_name(devlink))
 		__string(dev_name, devlink_dev_name(devlink))
-		__string(driver_name, devlink_to_dev(devlink)->driver->name)
+		__string(driver_name, devlink_dev_driver_name(devlink))
 		__string(reporter_name, reporter_name)
 		__field(bool, health_state)
 		__field(u64, time_since_last_recover)
@@ -152,7 +152,7 @@ TRACE_EVENT(devlink_health_reporter_state_update,
 	TP_STRUCT__entry(
 		__string(bus_name, devlink_bus_name(devlink))
 		__string(dev_name, devlink_dev_name(devlink))
-		__string(driver_name, devlink_to_dev(devlink)->driver->name)
+		__string(driver_name, devlink_dev_driver_name(devlink))
 		__string(reporter_name, reporter_name)
 		__field(u8, new_state)
 	),
@@ -183,7 +183,7 @@ TRACE_EVENT(devlink_trap_report,
 	TP_STRUCT__entry(
 		__string(bus_name, devlink_bus_name(devlink))
 		__string(dev_name, devlink_dev_name(devlink))
-		__string(driver_name, devlink_to_dev(devlink)->driver->name)
+		__string(driver_name, devlink_dev_driver_name(devlink))
 		__string(trap_name, metadata->trap_name)
 		__string(trap_group_name, metadata->trap_group_name)
 		__array(char, input_dev_name, IFNAMSIZ)
diff --git a/net/devlink/core.c b/net/devlink/core.c
index fcb73d3e56aa..34eb06d88544 100644
--- a/net/devlink/core.c
+++ b/net/devlink/core.c
@@ -260,6 +260,12 @@ const char *devlink_dev_name(const struct devlink *devlink)
 }
 EXPORT_SYMBOL_GPL(devlink_dev_name);
 
+const char *devlink_dev_driver_name(const struct devlink *devlink)
+{
+	return devlink->dev_driver->name;
+}
+EXPORT_SYMBOL_GPL(devlink_dev_driver_name);
+
 struct net *devlink_net(const struct devlink *devlink)
 {
 	return read_pnet(&devlink->_net);
-- 
2.51.1


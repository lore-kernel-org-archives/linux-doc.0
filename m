Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8953B961C
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026475; cv=none; b=KFkaDDLYMNwUX4JBDbS8SZR1jRV0IQahHWRYM1iPxDa+klO10ZBmFj5Vv0I68WRfBvfST0XiQl3SVIPXD7tnl8hLXmVX+ptcYbCQc8e0P0LZf/R0THx8dF+7Vm2TSID+VgxpT7m54tmYetJHasP9CsUDCqjgkbGr1HGRF8sVxuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026475; c=relaxed/simple;
	bh=r67EuCuSEgnlNDiIhyauM9QDSlOGLxMQaLPlJqQlJh0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qI+Fp61hOkZIyDHpE4xO9ScyWr6mKXV3ICTVVZodVQhHd/jWRHTxysw4nKoCNDyeXI0SiqsOllO7o6Ij5qZ0e+aZ9oFcqqBbrYrG+8P8fg512gWgc0y/Gg4Zle2TvkzheB3zrc0SqV6tzBsDb5p98arQtWL7VH/CNTzpHv0EbbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=AOZtH26y; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="AOZtH26y"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439857ec679so1811883f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 05:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772026472; x=1772631272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/FG3Lqra/1XuudAPK85QKV8ahCltY4VeAIS2Wk1ZgA=;
        b=AOZtH26yAWQzenMcaat2LyaeVktBl+Jnj+7qC0HivzbZlq83omf8hSwpOq6FT20g3I
         Wsx6R0ZcIlIDWIUO2smLNtr8eEpHBeYiL0svrDCZkcGogkpnr89jND7jqCxZQV7yHIEu
         7i1c3k5Sga1q3MXVDIJG2JykJ+pjz9OgDbpWmS5q6Zk3qOPKKhNiPANE7XTNSWfxbIwx
         LsUgV5BFPftdNHnnq/8jjMhQaSEtnras5bLxBagybHLb5SNih1BlQZl9fipS0xr6fw9L
         O6DTRPm5tbLxdGTiBIUvjyJkiFR4A0FjaV3iK8WBUMwSWU9P9lye+ufJu23vRjx7XEH+
         rcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026472; x=1772631272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/FG3Lqra/1XuudAPK85QKV8ahCltY4VeAIS2Wk1ZgA=;
        b=mHsEaL598e/aPVH1uCx5b6InZDWN+yomwLC+9mwh4h9h0lvicXvLhW5CvPq9D56QgP
         4U/AS631s9XU1SET92B/2lBGTHhD/a5lRaFywwkJvK1AVUYMnSxb402ouW0qhZ0phb6+
         HrlSA7Uw5gZrmSFZg9aOrbnVioTIn43LyvSkZBQ1wTKySUB3EpAyuE718Q77whAO8jrA
         +xQ5PLgBtBkVq/EHSGDH54NpL/T5F00P4+in60jWiJ3xYvW3gOwoa/PqBJjAODaHYShd
         HgCmMnPnlxJ3R6VCOjxBUyJ6xHR6izdFDmCDx014gOnLickN6zUFIr91s5aDFI+EHviP
         1H8w==
X-Forwarded-Encrypted: i=1; AJvYcCWb0seCh6GHvnXwB0VdEoUI4ns4Atisc4Z87QfeAH17QTKzfqHaB8DscG0c/Yz+dgS/Auc129aTrtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqWig8mD3LXyBa3+KVYymsrKbYnzofKurd9oiF0NSOcKpVEZO4
	qXlqZk1ji1TVXdYnkpclP0aOFjQk/65cAwMyVcoiJTEk4v50zVu6FwQh1CDMGiJcCvM=
X-Gm-Gg: ATEYQzw/Zamumf+RqXtnL7Y4eaxVlEkITfh1ZhP4irJWqDAs9iIrZglBOclnhUrpjPu
	pocDll7juw2reF7k+EDmLFPU7ZvKXchgdZfUiASnxK6yrPJBbVdR+ZW/2pLGBDPh7SKBmYhSPb4
	gy4F+YLFW1FHL8Ki/1enwEXr1cLID+8qJWcyzehNDVrvyjvfbjzf9KW4Vg1++3NaeZD0/sx9X6R
	2cfQcU6Qcy302ChODnmG1Hdceac1m3N7v3uLmwNTa+DQyQRZM9fNbqYQ4I+iNZ02I8FwdcyIJPI
	wMGJa23CTyAOWdDMrLgXHM+C3lXgBYA7l9FpqhIN1wPMoGl/jaQ9HC9JzmyWpT0eTPTB4rYUGrE
	J3N6fLxVewC9tOIBcGR8wIqlMql4U2RlDUJlbJkDGoLVLMiSwGyFnGQB6ZdO8DhyczpadmHdb89
	0JhDFiQWAx3EVyM0PCZJu++jOA
X-Received: by 2002:a5d:5d05:0:b0:439:869a:a15 with SMTP id ffacd0b85a97d-439942fbac8mr908648f8f.42.1772026471792;
        Wed, 25 Feb 2026 05:34:31 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm33063361f8f.23.2026.02.25.05.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:34:31 -0800 (PST)
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
Subject: [PATCH net-next v2 06/10] devlink: add devlink_dev_driver_name() helper and use it in trace events
Date: Wed, 25 Feb 2026 14:34:18 +0100
Message-ID: <20260225133422.290965-7-jiri@resnulli.us>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260225133422.290965-1-jiri@resnulli.us>
References: <20260225133422.290965-1-jiri@resnulli.us>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jiri Pirko <jiri@nvidia.com>

In preparation to dev-less devlinks, add devlink_dev_driver_name()
that safely returns the driver name or NULL, and use it in all trace
events. The trace __string() macro handles NULL via __string_src(),
recording "(null)".

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v1->v2:
- added missing symbol export
---
 include/net/devlink.h          |  1 +
 include/trace/events/devlink.h | 12 ++++++------
 net/devlink/core.c             |  8 ++++++++
 3 files changed, 15 insertions(+), 6 deletions(-)

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
index 2dd6d45bec18..85ea5856d523 100644
--- a/net/devlink/core.c
+++ b/net/devlink/core.c
@@ -260,6 +260,14 @@ const char *devlink_dev_name(const struct devlink *devlink)
 }
 EXPORT_SYMBOL_GPL(devlink_dev_name);
 
+const char *devlink_dev_driver_name(const struct devlink *devlink)
+{
+	struct device *dev = devlink->dev;
+
+	return dev ? dev->driver->name : NULL;
+}
+EXPORT_SYMBOL_GPL(devlink_dev_driver_name);
+
 struct net *devlink_net(const struct devlink *devlink)
 {
 	return read_pnet(&devlink->_net);
-- 
2.51.1


Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073F3BF660
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309860; cv=none; b=D9x/KW2W28omDm3JCNZWjQyxzY0NnOO/8HdXkvMjU9dEpZhlHJiyCCBMeE/1HD+ajmFpkqQJcfGhzfBVdtlRWUrkhPSQVhgnHWT0wozecblEfv893Outk/S7oBWSIGlyUb5vuYLbHjJcNXfgU+zFnjlqlcp7Gp+Kbuz/1JKZTOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309860; c=relaxed/simple;
	bh=i5rKA2YTnTgUVDiLBzobPs30Obw/a9s2IcnxQojxEfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mz4/ci8Ur6w8hGde2c5RUIwAhcMHd8GRboMNwGJduiVhzJKpSOMG+sh9cKYYTl/IfkFCtl+Uaw1kKH7vrTay41RHHMKbE5WQZpg8nnBAS65MjYr9uN/C/LnKeP62bV6j/3nSEkR6dtPlNKSJBKItR2P66ImoQfdI3xgszzUYfYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=F4YA5N29; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="F4YA5N29"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso7052435e9.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773309856; x=1773914656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBxLs1D1zqMnnVRWFJXWayRzzgXR+CS+oaHoE8oyYjQ=;
        b=F4YA5N29K++WxHy794pWtk/N3MZBHTqkQCSOYfI2jSKvOp+Oq6y1hVqSDHhvKfMkl/
         bVOGOaivEoDJaTcN+45eU2MNpOO/J3hi5qxUi+bKZSxemUxtNYxRTv7E3cKAcOwCDWJo
         4KgY0wmOhI8FhJmst3cTOVIwUbk+m8Ddh4NbYFn8MxgwwfI+FTCRh38HsOS0y6v91TjN
         p+wT8uGQFjHmC9l2rRlRKqds52Mu1Kus8YiZYzcjoMjeWUcToGL9L+x2CpfPsgizmHFI
         UU0MZOUrEQTRjij/ek3JwL1UziCAnC0kIpGmytNMPmcb+T3hkIe37lEsiOJ69ypKmueg
         BYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309856; x=1773914656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBxLs1D1zqMnnVRWFJXWayRzzgXR+CS+oaHoE8oyYjQ=;
        b=AFQL9iz7Uhq5/rtpQJW9dnoC6WtxW11UcRFz83wKliYdyTJnEo25XaO+ATSi9BcLa2
         +YN7OQ89h+L89OZ/TRWq2YjntiQMGdAolR3K1rNEXhVV08AUxcmq334yrJkm0e5+2bQp
         z9KTrGgM09WWDT7gcq6n7D88sB7GQVBrArSX8Zt6M8KPw5CyzYFTF/D6RD1cPwJ/sriq
         xWRHBifQHf1TXyDUi5svQgwDFiNoEmY5HOZcWKFgbaHOHm/6noT3sXYxNcfpoaksHd8x
         EegE4mhadKN0RmaKRFJEHYRxKOf+uV0L7iBJwi5advb684Jtc66sPqE7qp/xh7YYVN3k
         DWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdCz8lsKRrhdy06dH6VYt3wYeUjCyCbmQQtwnFNXyrfn1f7WQol6BGjjlGQh4rWsCYal6pAA4aw/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC9U1w+lP1S6UQlX5tlgXIlryKF4ltOyr3fHrvM/AVKevx4MDF
	z2C+09zAsFFtHba/2/5uFdm5SPp9rrHixP4LapbpXlXf/7a2N0aRv6SSeh8UzV6f7mg=
X-Gm-Gg: ATEYQzxQXDYu5kHdPsYmipCYwQe+V65Ei2Ep/aZvWlPWx1FlVf80VMVcRXR2A1oMxMf
	Gk5D5qljx4HfEEHpumhyp1bADGixur2bjTnVhHfZW+f72bJIuc4fa/PHyjvQW0hJg2gbY06/cfy
	5HITlmYtRiAVEQjIO49lx0W7dunRbtnHmf7qAfux1H4cuHLk5DPwPzEDCLQGGkdDx2+KH44lCOz
	LFmKqtuxZwolOQmSLxPPhyogwYmH5Cqc0ZdpvrugCBx1ov4z7EjdutfAOKWqJmGtR7Abtv/WMk6
	6FFpCwJwqbyxC7OPe4aaSVRUGkk3gIjg0wqhWOP2vOuHXFpa9su6BQh+MOWWkD55S4bgiTuIzZU
	zY0InIwVgin3zwwFvP2OokZlZC/PKfEtfs+1Xe4ITj8+OoeTAV+crl3qSfbm5DACi97YXxqVgZ2
	75ayoT/Cm/jaWx3g==
X-Received: by 2002:a05:600c:8b8b:b0:485:2f4a:6ae6 with SMTP id 5b1f17b1804b1-4854b0a5370mr87455915e9.6.1773309856147;
        Thu, 12 Mar 2026 03:04:16 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6e6sm393381525e9.10.2026.03.12.03.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:04:15 -0700 (PDT)
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
Subject: [PATCH net-next v4 06/13] devlink: support index-based notification filtering
Date: Thu, 12 Mar 2026 11:04:00 +0100
Message-ID: <20260312100407.551173-7-jiri@resnulli.us>
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

Extend the notification filter descriptor with devlink_index so
that userspace can filter notifications by devlink instance index
in addition to bus_name/dev_name.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
v2->v3:
- new patch
---
 net/devlink/devl_internal.h |  4 ++++
 net/devlink/netlink.c       | 11 ++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/net/devlink/devl_internal.h b/net/devlink/devl_internal.h
index 395832ed4477..f0ebfb936770 100644
--- a/net/devlink/devl_internal.h
+++ b/net/devlink/devl_internal.h
@@ -205,6 +205,8 @@ struct devlink_obj_desc {
 	const char *dev_name;
 	unsigned int port_index;
 	bool port_index_valid;
+	unsigned int devlink_index;
+	bool devlink_index_valid;
 	long data[];
 };
 
@@ -214,6 +216,8 @@ static inline void devlink_nl_obj_desc_init(struct devlink_obj_desc *desc,
 	memset(desc, 0, sizeof(*desc));
 	desc->bus_name = devlink_bus_name(devlink);
 	desc->dev_name = devlink_dev_name(devlink);
+	desc->devlink_index = devlink->index;
+	desc->devlink_index_valid = true;
 }
 
 static inline void devlink_nl_obj_desc_port_set(struct devlink_obj_desc *desc,
diff --git a/net/devlink/netlink.c b/net/devlink/netlink.c
index fa38fca22fe4..32ddbe244cb7 100644
--- a/net/devlink/netlink.c
+++ b/net/devlink/netlink.c
@@ -73,13 +73,19 @@ int devlink_nl_notify_filter_set_doit(struct sk_buff *skb,
 		flt->dev_name = pos;
 	}
 
+	if (attrs[DEVLINK_ATTR_INDEX]) {
+		flt->devlink_index = nla_get_uint(attrs[DEVLINK_ATTR_INDEX]);
+		flt->devlink_index_valid = true;
+	}
+
 	if (attrs[DEVLINK_ATTR_PORT_INDEX]) {
 		flt->port_index = nla_get_u32(attrs[DEVLINK_ATTR_PORT_INDEX]);
 		flt->port_index_valid = true;
 	}
 
 	/* Don't attach empty filter. */
-	if (!flt->bus_name && !flt->dev_name && !flt->port_index_valid) {
+	if (!flt->bus_name && !flt->dev_name &&
+	    !flt->devlink_index_valid && !flt->port_index_valid) {
 		kfree(flt);
 		flt = NULL;
 	}
@@ -100,6 +106,9 @@ int devlink_nl_notify_filter_set_doit(struct sk_buff *skb,
 static bool devlink_obj_desc_match(const struct devlink_obj_desc *desc,
 				   const struct devlink_obj_desc *flt)
 {
+	if (desc->devlink_index_valid && flt->devlink_index_valid &&
+	    desc->devlink_index != flt->devlink_index)
+		return false;
 	if (desc->bus_name && flt->bus_name &&
 	    strcmp(desc->bus_name, flt->bus_name))
 		return false;
-- 
2.51.1


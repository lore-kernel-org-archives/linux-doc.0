Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773E23B9616
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 13:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026471; cv=none; b=j5FNB6hbyCZuoYdWtQZFANTOAa1nREYztoyD01DtVBX9dMNQjNinw3KUaSJEkNmhxZ1TeyivmHflySSQRLTDSVwJoOg/2JbTkkSPE12xUjcIgRWhBF0T/fW4fGQK6/4PhYE0HRCQIsqAAvISf4snzdlGl50pmLU5Jz9TUBgxdjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026471; c=relaxed/simple;
	bh=PABzC/qYg8Go3kt1GXod1fs3aKuZpPfkbvp4LZZhDPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pe4mmkAfnHI7ahtwjfvqcBB8gX7SCQ1M2sBzfI49ktDNccBggcSTCRgDSmTWgRyUYl4ShENsbyZ3BQG1zAaHDy074SZkxX/r8TvJA5hR9Lr5E9skaw82MuC2ekHO9dOnnP/K/gilLpNEsjhZT9s0O4MlPKC9FxaqFOb82UibqAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=YejnM16x; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="YejnM16x"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso75088345e9.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 05:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772026468; x=1772631268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWhrdo13vFR8MpiWqGIUlMw11zaKiApxbVw47NJoYB0=;
        b=YejnM16xnGU2GKt/KJgJ2dVqhRyS7HDZAizyT2sZHwOUi400ShfwOlv70+hLTHTb0D
         HODTMfMp7yb4lK3hbV0cxnIyW2Z+uBOYiZZn7o3kOGp8HJBt2BLEeKrxuNIJzHqDJX8J
         4nMjzkXVjmAOVJcRGJyVN9chfknHG/sksb1Z9kf6u61FXousetYPthuYXUtAawYGWSfL
         ykcDh5RbPGNnCZCPWprHlq2UlJAhW7SIxBpbngZ4MbAL/05ch1PY3NmP2/ua4aPoxMOf
         qeTWXqDNL61U5db9qiWg6649HeJqmJmuLi74w86ZeZj2lvXokMBvLJdk2NyD91wTW+N3
         aVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026468; x=1772631268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GWhrdo13vFR8MpiWqGIUlMw11zaKiApxbVw47NJoYB0=;
        b=ekT/WH9zcOBkLni4TIVYmRIHoPoIso8X9iWewhIbIrMJeNWCiJMA0pRgqNmvWN2P0Q
         1Pv28pNje3aiQaB+CASlH4wPDut4A80xUPyh01OvANKl7RoG80EtB0pGFdwiSAdq/jkA
         VgSOf/8QL7NQdOLaO2g7vEuSXvBpK95pokzixWl4KQhsFpRZerj+0gAlV3f1zS9lSOL5
         kj9jrngUyNxHGCvcL8/4JI1iWAWNC9FeAhaZHWnLFhFTglkOZL9Q/esJsfoxyxH75DmA
         kqVom24aELxOtMIRnqb9MepRHzbOPtJ/xX2aoOq8UJpWxcqfppS3ZKxQn2s727svbQMh
         tltw==
X-Forwarded-Encrypted: i=1; AJvYcCXVFodsNffNRsgPaEKNeq3KjOlA9VEucvOCgw4yyx6ih78GQvmX/UjkDf1LtL5waerKdHh9hf2ilHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcWXNObZpTdxXLt5M87jPUPlWVUbEGl+DlkHR56kGWM/sopxjz
	0J7FR2j3RMW2LCsFN2WbUmxsScVlSmj2XRvYsHEPCuYzUn/GVSlqzxaTiw80UUSL5XI=
X-Gm-Gg: ATEYQzx7HoSXSLrrG3jMENErTLi82VMS7vpv7jKT3m/XAUSEMc/6X5wKq5Gc5UF0Q9p
	NGQwH3LHsTUuCuPIAkxIZ1yeU5/o6t8H6SwuoPfLrN/vnd+LOH9OSyRq6BA7X3xswWz+VJSEguy
	SwDotpnkOQyzH7r3pc0mWyNsBBOPOHHnVfMYqtdieTIPzrkKLPSFcOEeleyXd96B0/NBcky/M2/
	K50r/J7nF/mtYF49FlniEtRovugNeuu/JTPB0kTZKKAmUMSoCKo6Gubu5+AQnP7LQaZWAc6+Sxs
	+faIwYXFSnOGFjYgzHga/FUdTH4wME71gXa9tt3FyaW1UvHU784uxIGvTSbUFwQs9fVdkZLkd7T
	/ATnwi9eKilhGZkJtE+XyP3fiuqJ2TtDFrgGke2mPhBq1f42JxZk0VT0ey3d7HaK+9mJvcqpBlX
	Vs962YfX5vrYK7kg==
X-Received: by 2002:a05:600c:45c5:b0:483:afbb:a077 with SMTP id 5b1f17b1804b1-483c216a9f6mr9402805e9.1.1772026467742;
        Wed, 25 Feb 2026 05:34:27 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd732eb1sm71670605e9.12.2026.02.25.05.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:34:27 -0800 (PST)
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
Subject: [PATCH net-next v2 03/10] devlink: avoid extra iterations when found devlink is not registered
Date: Wed, 25 Feb 2026 14:34:15 +0100
Message-ID: <20260225133422.290965-4-jiri@resnulli.us>
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

Since the one found is not registered, very unlikely another one with
the same bus_name/dev_name is going to be found. Stop right away and
prepare common "found" path for the follow-up patch.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 net/devlink/netlink.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/devlink/netlink.c b/net/devlink/netlink.c
index 3f73ced2d879..a517d42c7b96 100644
--- a/net/devlink/netlink.c
+++ b/net/devlink/netlink.c
@@ -194,16 +194,20 @@ devlink_get_from_attrs_lock(struct net *net, struct nlattr **attrs,
 
 	devlinks_xa_for_each_registered_get(net, index, devlink) {
 		if (strcmp(devlink->bus_name, busname) == 0 &&
-		    strcmp(devlink->dev_name, devname) == 0) {
-			devl_dev_lock(devlink, dev_lock);
-			if (devl_is_registered(devlink))
-				return devlink;
-			devl_dev_unlock(devlink, dev_lock);
-		}
+		    strcmp(devlink->dev_name, devname) == 0)
+			goto found;
 		devlink_put(devlink);
 	}
 
 	return ERR_PTR(-ENODEV);
+
+found:
+	devl_dev_lock(devlink, dev_lock);
+	if (devl_is_registered(devlink))
+		return devlink;
+	devl_dev_unlock(devlink, dev_lock);
+	devlink_put(devlink);
+	return ERR_PTR(-ENODEV);
 }
 
 static int __devlink_nl_pre_doit(struct sk_buff *skb, struct genl_info *info,
-- 
2.51.1


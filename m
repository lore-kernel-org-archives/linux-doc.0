Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8E39281E
	for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 13:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772026473; cv=none; b=pzy0MSYzm7ZuT4bmLZxYKwUVRvJ9x9dITHQAvQo+HegScoDR9tkBtdyVC4twTS+IAjdqnq2DTDV+yzY9HSwOldABt9uJBov8IRmkakLeccW31xvm2uZiaYwoR9b74crLQMlgOyQz1GI0cF3CooRM7EUJRY3spbVEbimcLijFQG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772026473; c=relaxed/simple;
	bh=cBdk7OS/MqJvfgCd8WjMOg+aNCv6O46a+gTZy5CXlts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BEiDfLxk3N1r8XfyxMuUvJLORXneLaB5S7WCEJPcZ5NrAjkEr6M/OF8jmbz9HlCMyPZSRuBiLsfudvk+kN1TF9U0MHffYQUzy+wx2eY9n+H5+39Du2e/X3xQtcqiPGoyWMPdZnSOUlq+iXMSlXDStLewhTJZSZsrBxvVAHJyDaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=xiSL6goO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="xiSL6goO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4836d4c26d3so57312755e9.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 05:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772026471; x=1772631271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+zgEcbAzOtmZIjmk4/NTF6Huw5yR7HZ4LqFtC8QXVE=;
        b=xiSL6goO+ydywZ0fzuuyNAZq1mr+W3T+rXTnZaW85NBrwDG6raKJeZYgcNGPahmj8Z
         t7N86d5W0jiAt1mO5RM6jsIhTyDFR/mu5Jo9Fv6IMAmrLR3E0DBNqsY1ns+JwnTsdBKt
         0ZBjHt11fdIv82tXTu4UrNjqQVP8mH+sYTbSuy46ekEXtkCtkR3XN/ftgV0ClX06zHu2
         dBxUbUPq4d2ePWfZTZwHbIJsyBjO0+N8gv7bhmc33hKRb2PF1jIB691AdO9+Kj66ASqB
         dMvSZmrYuHsIo7o67ryn5C85snUmXazAPbFp8ccEGmcLFhlXdAgcgYr22PG0wV7vBSi6
         OgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772026471; x=1772631271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2+zgEcbAzOtmZIjmk4/NTF6Huw5yR7HZ4LqFtC8QXVE=;
        b=tAegMZSm0bX4UviLhEYTurM1F79ux7G8h5wClbfYroS40I4JzZiSBfLh2ouqTJX7Yz
         yMoYrZwYn6jvpvblaxIybuoDoJh/cQcu/KE75l2/oj8fsJTsg98R2R+RKtb3FpbKx2K8
         VwI9oZKA4+iL8mr/w5njv+hz+yo86NQPVFwaUMdRopiK9xVdWzXpbh/DiqncZQcMSnIQ
         D3vc4iZ184rH3seqkjJD/aRTDpiHZ/zWi9Mb4Esd0Gc5hTeJc0jI15e0lr72VnCXKe+D
         QHshPpmdUYWQ1SKMQsfpxMjhLoZWr2uua8H9rfbZfC1oumEUdiqyDu6cKkamBunnYWnC
         t+ng==
X-Forwarded-Encrypted: i=1; AJvYcCXyp9WqkElFUTvhAdWbmceHuGnnfADOfn7/LS8qT52NOmq2eWlt9FkTBTGtvyFC4zhpHde3bRUZF+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvSuJYPto99LwAbjoyGXBXoH6EEgdA1jq35+iDU2vuFlxBnWuF
	JFg0g20AiF3d2W8VRUPa0ELDUpSSYplXh6p6KFGvsLbZTzuRqThd9XxnmhltAvondbU=
X-Gm-Gg: ATEYQzzAJlH2AZip+yolOGPQ3K0Fo7uJIQftUi0iyoG4+MnLaZh9tpiFqYRC3cMD7VJ
	hl67Ke5LzSh+cW5y81D+gfkMZcIOf2fnA3gt89fCLryTP0GXx5xMeJS5PWwH2sSAUIEIHGJk+Sx
	daYaCK/7DlCS2H3mOPsXCDWMSUOdOhIqePqdjxQsGrluOlPYQ7Pm+Z36ucMFsDxEW3h1Oh2+X3L
	VlV/VlnmkXqmwakDsyrHk/kXl60s1O3oMEau5MXpn/Lj7pQYCjEAEtXGVKREadHq9yf1DAmLuhV
	qfnBdS5ztyiP28qJtMajEMJdaDKxHOcU0bMUSHIEDKZDT8jMGkHkcabWQ68yJu88uQkyl9OZqYw
	RiXFSFMs27MarW+4MXzwqOoauaO+JOlIUdwdI70YqjqtMLjM4dlvHcshKS8k+1L84Xq7miGjoYx
	Y+f46b8d85a8zgCQ==
X-Received: by 2002:a05:600c:8716:b0:471:1717:411 with SMTP id 5b1f17b1804b1-483a95e9a7fmr276220965e9.24.1772026470590;
        Wed, 25 Feb 2026 05:34:30 -0800 (PST)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9566sm18237565e9.3.2026.02.25.05.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 05:34:30 -0800 (PST)
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
Subject: [PATCH net-next v2 05/10] devlink: support index-based lookup via bus_name/dev_name handle
Date: Wed, 25 Feb 2026 14:34:17 +0100
Message-ID: <20260225133422.290965-6-jiri@resnulli.us>
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

Devlink instances without a backing device use bus_name
"devlink_index" and dev_name set to the decimal index string.
When user space sends this handle, detect the pattern and perform
a direct xarray lookup by index instead of iterating all instances.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
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
index b73cec31089f..127f337489c0 100644
--- a/net/devlink/netlink.c
+++ b/net/devlink/netlink.c
@@ -200,6 +200,15 @@ devlink_get_from_attrs_lock(struct net *net, struct nlattr **attrs,
 	busname = nla_data(attrs[DEVLINK_ATTR_BUS_NAME]);
 	devname = nla_data(attrs[DEVLINK_ATTR_DEV_NAME]);
 
+	if (!strcmp(busname, DEVLINK_INDEX_BUS_NAME)) {
+		if (kstrtoul(devname, 10, &index))
+			return ERR_PTR(-EINVAL);
+		devlink = devlinks_xa_lookup_get(net, index);
+		if (!devlink)
+			return ERR_PTR(-ENODEV);
+		goto found;
+	}
+
 	devlinks_xa_for_each_registered_get(net, index, devlink) {
 		if (strcmp(devlink->bus_name, busname) == 0 &&
 		    strcmp(devlink->dev_name, devname) == 0)
-- 
2.51.1


Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363D73BD656
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773309855; cv=none; b=ndOXy//m1JcLiFHxYqizVmoIF2WZ5DGGgbsKUXwUo5d6S7+0D29fJX6HeVPdaFlnkU8thfnm8fG5zZsTniBmemcyJ1PdgKZo1cXcrGvGk7MexbqmEIabl+4pAqYOnteZjYLHlZcph8CtNF4uUjZNRQ1iEnwB0UF976ZD0Y1QMA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773309855; c=relaxed/simple;
	bh=Vtm80qE6FuR56bwzyqwTxutZyqLSGPZTe2b3PkwM178=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K3StECO5Wj/5QayUUi2W6CiiKZ5ZdChoNcnP7SP8DWVvEcCK07LGd063zLNc4aT41TDfAt1ZU4RROYeuusSv98CCfbTo6Na4Ckz8u9qab1Ezf6aTh/GhJ52f0DpwdFF5jOWQbnyi+ramS4J9YuKdtLx+JimwkAt1+Ih132mYTnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=UuGFrvqL; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="UuGFrvqL"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso6440595e9.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 03:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1773309853; x=1773914653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HEWuug6YBMXUGRBONZQ2DbkIBf5q1GxD8BXyAd3vMMw=;
        b=UuGFrvqLIk2QH17vam2M68KVzf4VxO9Okf4knKwat2Ghw6FJ7A4oAd1vwOtks37Uz/
         olYnXO3NIUYECNqFEbMrULA/rKd+DMX+1LM0KJlB/vWO2xlL5UwOsT4CmmVhYfFc90Wd
         JPtb6eP9wLzHKPOiazn+gr4DCJtiDm2WAyLffki1EwahEsfo20F//LbPU7wWbn5KDSOQ
         5smyc+m62FrVpBUl7FbDlCFbDb9tq7/r8oQHID5EPeXhCs0CkEuP+fT/UC3ES07v9unw
         Edv2a2TzrEOA7CYxIguTkXJAZCjLGXJ6gu8Ez5sQyyQAs5yY0TXKtJoim+m+Juls1B6C
         ki9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773309853; x=1773914653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HEWuug6YBMXUGRBONZQ2DbkIBf5q1GxD8BXyAd3vMMw=;
        b=fdYGXiCR+XaV6C7Rfvwr/Xub3QdC4QzBbKtQpaZELVGwFwtFICKh0+Fszt1rbOHOrf
         SNGP0hjZAAsQP9elqpERgAZ/dhA6MxL2AcBbu+1mJqN18gbQw3fZPgcxmGZ0b6OeuWVB
         hSk+q4uEoSpsjVx9TyJPysFH9/A9Jc+SD61nN3iRZ7jWgQNXW3DNCWbH/o2t6r9AVzy1
         Gvkjkmo4u0XMqk+mSUrRiUX7GPoWbTWP/cfNJ7Q7ivn7hivwKlPzD2w/6Mxhei+WIZBr
         Tq8OojZjEXMxj6Jh9w9cj11QJ6jS9K5R86a2f4qyVmO208G7GcpBtTCD3KqYkrJB7fKm
         kWEw==
X-Forwarded-Encrypted: i=1; AJvYcCWfH1ePXjwkoOd6ljzKI/mPFJPJ0uj0jNDH36mKNKTVCaiM5C2CCH/hY/GwrFMhOluT2BFV7JBz3Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZtp+9d63S+SXJw/kYuhFw2mdjfzG1aOP1h6gR8mrFMZfVFGu
	ImKTRvN+4hjv11dtyRRVtt1NYpKNFGg1HmyGs1Dt6jE15dAfZ/O7T3G2L5TPAWEDGGg=
X-Gm-Gg: ATEYQzyf4PKecZX1eOdfBzvawXJ0Dv1NyPKrgvMRlzOcepf2f/XGQzRJ5hnZdKSTWR9
	YwdeS71/v8+ajMkG0eYheo2Sm24j1Y0lsYiHjTf/rxIolEyGGXT7JuKHl7ILhK4GGegs2chTwww
	H5yC+reqv/4R3ayS3sdGf0fZEBC948+6jLg4QlwB2pgnASDw41OJB1Q9LaqbTq7uuqtXGp3mW9s
	S6ZNdcFcC/GDQaej9Gvnz5066zlwPagtUP9nXdbKTnF46WrVnRxrvcRjkC2z/6ZccYYXMhcJovX
	k/ODXUJwSsJYaucZohw4wTWhdJJIXdoYh7mQmRQlYRlCmFooo7fT7IyIT+En/EdgIga5tgg2pXo
	PFYVKrIy0bKt1/Q4alaNevLceZXvjvo6LF4FiYvAQw4y3XOMc9d3buBD7QVlc/0VuXsyyrRD9Gs
	cg+qlMBhKMhV2a/w==
X-Received: by 2002:a05:600c:458e:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4854b0ac93fmr85263525e9.1.1773309852339;
        Thu, 12 Mar 2026 03:04:12 -0700 (PDT)
Received: from localhost ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm304199535e9.2.2026.03.12.03.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 03:04:11 -0700 (PDT)
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
Subject: [PATCH net-next v4 03/13] devlink: avoid extra iterations when found devlink is not registered
Date: Thu, 12 Mar 2026 11:03:57 +0100
Message-ID: <20260312100407.551173-4-jiri@resnulli.us>
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

Since the one found is not registered, very unlikely another one with
the same bus_name/dev_name is going to be found. Stop right away and
prepare common "found" path for the follow-up patch.

Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
 net/devlink/netlink.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/net/devlink/netlink.c b/net/devlink/netlink.c
index 56817b85a3f9..7b205f677b7a 100644
--- a/net/devlink/netlink.c
+++ b/net/devlink/netlink.c
@@ -194,16 +194,20 @@ devlink_get_from_attrs_lock(struct net *net, struct nlattr **attrs,
 
 	devlinks_xa_for_each_registered_get(net, index, devlink) {
 		if (strcmp(devlink_bus_name(devlink), busname) == 0 &&
-		    strcmp(devlink_dev_name(devlink), devname) == 0) {
-			devl_dev_lock(devlink, dev_lock);
-			if (devl_is_registered(devlink))
-				return devlink;
-			devl_dev_unlock(devlink, dev_lock);
-		}
+		    strcmp(devlink_dev_name(devlink), devname) == 0)
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


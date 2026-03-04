Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DB435DA56
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640048; cv=none; b=X/LGu9vV4IMt9Fx0Hw1lw9Ypb8sAl8CiGUNRNPoIKHdp+O+0i9P7GfQCWwMm7wVjb0ilzSfNLsrI17DDF2rl3pF497brZ7PPQ8OsACt4ukh+W6iUKse8rs9PG7HGL6GzlmtauLQcUZ5mQUQR0/ia6xjrzMmjOorMIRTXxN9YRAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640048; c=relaxed/simple;
	bh=fJzhD58yHbnlYGX5HQnBg/2nPap4L8qe/YePr91l0MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZirawKjM5n+guj8XHXq9gtOy+Adv4L1XkdNoyggtZz3OreHKkeduh+vuQ0ozSN78U9zGGubA/WX9iZHvV4517zyPoiorPBoOCheb/+zj6TvbLGDmQi+fY8QPyF7a9tlz5ta7ABup5B82EPsfKG0UuHM2JuDEinWuwGd2MCcCbkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=VYr1MgHL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="VYr1MgHL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4045997f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772640045; x=1773244845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjTLWhKo8JnJx7lW+15uLvz3vRStk+3vuWmhHzoD9L0=;
        b=VYr1MgHLXxBk495ZOSZox6rKhRufJalFxAWBo44CdkCH0pQpBs0RmOST9oMY5hK5+G
         Mbr1yEpTP+6R9Jt1z9uQ3MuBg9WbOHmG6m51jx3CFMUnWsB6gPj6rqgCN8wpAdAeSJdv
         U+3obFIw33/doWVKBz2XrF5wX+JQddGt48/Fs8ee9cymRU/irTaQuWVjDKAgSyixyboC
         OKLUk54/jtPaojlpmjbwwUspoJaB2LzcXvRg1sGTYsgJ0MUSRVYtqtO+C+lg096/6PIB
         0vzVM28DUfLsn0iZi36nJ3hMokugZdlxeed8pNY2udkS2NW6f/Gm8zeL2NduE4Sqk0YW
         9Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772640045; x=1773244845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OjTLWhKo8JnJx7lW+15uLvz3vRStk+3vuWmhHzoD9L0=;
        b=KfudMcdNeFhHr+3I87JlzS9pO/yuYMNXW28KZ9jgS77zEvQIOK+TFD5wnfy5v4geP0
         J98pJtwPSC2G8ZvHYJTp0JZnoveBtRiictRtOzAgerM82CrUiDr3dKk4fBdEwddZlJon
         VpkCwtb8x2zFT2qJX8Yatp9beKoY0phP4OWyGt8+GRS6m0C8rbe/jT9lXHl8CehjfkyL
         9BpenUYfNgKVzg1Jjeof3qw3OlxBXajdoSUL2Nf15c8Bz9tx1EHUavWVqdlKvHaH5eJK
         ScoK6zRAIW5td2Fv8IkTP2llofc6r0XiBlhOM9mkQmruDWW2I0S/vLx/SZItsUmKBZFH
         kB5g==
X-Forwarded-Encrypted: i=1; AJvYcCWPyEV5ZwxlKQoRtZrxOXvKpKXGN/QCsDAijGCjkNoSX0MqVSt1dyHyJRjiR9deymc0HO/StiH5gtk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxskdo+RmU1zYGmAifHAQJ3xMybmqr/AZeJZjXTziTzjkdwDbp3
	UcezRq6dE0/MgTtNec8lT8PrqxUAmDvDfpbsfRqaiyvrmH9frNdJrccf9sDSweiZXB4=
X-Gm-Gg: ATEYQzxB9gLYWLHOcTNT+tNicyPrM1+U+nmvAuBeHsT83fe0CdbEccKy0N9+POZ64cH
	iByzIkWzwCZd5qYU+Bb8yCFOKGroPlYpBb64iW+n7GggGUXNYKiFgsSQXpz4gGPvZGrtM9a/PXn
	GiosgST4QJZzo8i3im23GL7tuk0FRRCgjCh8diIkgwlGNfUZWQ/Y3UVjMP7Z31XDzTfIpZy+KN0
	3qOvuX+Nyx07qxoHqStn5eiAKEpUuFHa+ZEhTE1dVZrkvtlnudrlSFxEZcoszKOP7/p9elnMfF7
	rqEiKl+hPFMk8Yk6dHGTU/8Ovxgm/7NMOZ0bZTFEN42Z0B6WFhiXvBuGihoviv6hNyQew8wQQ32
	fQMLI9SaHLoQ3J2V+gVRTOyjqsCouZqlVARTzPgZW8iPwJxSYBEpMe9qvVMA87wwByUL8sa7HC0
	LmLX+/9HMiw0T6Qt436qXT1mX+EnjdG7WAgFwh+FvEg1dC+w==
X-Received: by 2002:a05:6000:26c2:b0:439:b541:a092 with SMTP id ffacd0b85a97d-439c7f99765mr5336210f8f.8.1772640039114;
        Wed, 04 Mar 2026 08:00:39 -0800 (PST)
Received: from localhost (46-13-72-179.customers.tmcz.cz. [46.13.72.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439abdf5430sm33042796f8f.5.2026.03.04.08.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:00:38 -0800 (PST)
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
Subject: [PATCH net-next v3 06/13] devlink: support index-based notification filtering
Date: Wed,  4 Mar 2026 17:00:15 +0100
Message-ID: <20260304160022.6114-7-jiri@resnulli.us>
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
index 5db931a0091c..1b00aa1dbcf5 100644
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


Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F80B26C3B6
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 00:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763425485; cv=none; b=hnM7vbcS7BzCRsGKzioF6vakYwOE8QjkWx3fjOpzYitM+BpYdM/rRt5WIflmegzyuMJtwpXvaeMb6f/44u5RqXk7n8IgCTpG2QFnJFb64B54Cyb/XBPHxrMaHEp6dzd9Q4w7d0HjsIxDT85Y2JrmGQekk8iqeyiNQuMspZr9KBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763425485; c=relaxed/simple;
	bh=0T8UVJx47R1toXxTH5zXlqCaQiDCFi6Awm0Ozd2R4M0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/cAqhaK9FIcXH+9/iFNBUPA1eYCCFzQYpVY9HyK632wLDBTIn6i6T7QoZdC8WOjmMWwPlTC4C+Ny6UEx21Knina+Y5cNuIlmew4deQApMjwW/U2ywYHbZVRvF4qmuLELGnchhAjIHicUFpmSE7Bw4ekE8xftJz82Ps/n7RGtps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TOfBpEf7; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TOfBpEf7"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787eb2d8663so70895187b3.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 16:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425482; x=1764030282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Q+D4xi4pZMCXKvcb+ARJAFJMgk4uxgy92qNv9ZisJo=;
        b=TOfBpEf77quYJkrsyoiQeNRnAf6LUS0QBqQAFNaJQnFfnehpODZJqwR2ueAM5DDUVZ
         zGhDgxFephVUSQH4t+ZKKh6TNrCv5A8eC5OwFP+aNEGimidvvy1wAkbzbwvYYBaNgl1l
         x2icW9lpTWZMt2UJTJwREvs3Z2GnrawKf74RQCjh8MMsOO+kSiaQe7i3e1vYDPIYDUo6
         vhLcpdnb3+5XqUG8TDw1C45s2w6qfVUAhYeDjxCt+WoyUgIcqRZdv+zv4/0njMqHT10T
         f/+lzju5LNeZ6EqE1jWHG57Fqyq1o49jzsCFuvBxsCY49Jl06mflqlCM7xv89C8j5O5N
         SrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425482; x=1764030282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+Q+D4xi4pZMCXKvcb+ARJAFJMgk4uxgy92qNv9ZisJo=;
        b=clgcY98l3GLyEWc4oygQ500FsUWTOFYowPkVYq6F53a8SAQVwJvdv3zyeapuPlx6EL
         rKA/aQqdtD7qUDSRpOtDIoRd3z12urbUGXmTZkYb1T0tF6LQ6FXKYy4N/Q/5uCskfBUy
         0TuTYoiIJZwZtpg8PM/44cSr7P6tRFo4MJiu3hwO8UoSDA4UzHlbJoizVXPyhmyBub8d
         yuNzHSucL4EgoDue+3yuFUbJe/KQFuYn2rF9imlIXCkx+tPMpvo08PLiRP4oeq7R3NbK
         C3EI2rU+qTCRRvuXbC8zjMsZfffscR7Y/Ox9LUV0QrBuurZZQyl2dNX6OlOiXmae1R1N
         dwGA==
X-Forwarded-Encrypted: i=1; AJvYcCWwcDE3uCh/9D5it06vDy3J5hef126PMUGr7PVNf6v1n+shy2MaZI0FqzU9talYWZxfbvuTfvXbWKs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/XMgz9GDWP7K7eqm7dmUbgXGPjfoLz1DOj2P7ZexH59ogwuk
	OK2I+fQ4sQ0z8KLafU95SmL4yJnA8iLY+JbnhbUwbfPbmHDGR8b0EzRV
X-Gm-Gg: ASbGncv40CTs0HaWcwHe5q4+bTlP5pR/4IlDUgit6UxhFkgB88UtkVrbfxrY+DZksQb
	0gpcLu/QLyVkTh2z3kMM0nRhOqGmJa8tu+na7RZCp+eeOPPMcMNtSdzv5F7NJ2j2RL2/liZbqnq
	ndzuukvnfVqMb603YzqTE+EbPuuIpEgZXdHhz42bHbFddQgrLwG8bJMEBQL2N/5TdrForhhrnMS
	1ZRuksf9Phs38ot694a+9pARNuIk2BnIJ5KnYfs7IdthBxe/EGv9HZ+lyeL1wpzvdBwKgRWlzk3
	KSSkeEtmmNLe5odI8HzzoANoYaWfTQqbdhCDtBWMtkP1xLoVmqHvhk7GkIREi3TWjpd2geDbW7W
	NGGjq1sMgOi0u/rHgn4LIbhrpqHoD6qV4NviEFf96MyUwU5eho7pQQJFcBlsYfIfQ7rvu7QUszO
	6kM1W/Q0htHJKEi6IYawiIJcwBS17YlQ==
X-Google-Smtp-Source: AGHT+IEWrYQ0g0qi/5xwpjGu9W7qvhXZpmv1KOoNU9mCPzMHy61Lr1L8uLsi/JJJj5Hq8ZPBAmpvgQ==
X-Received: by 2002:a05:690c:708c:b0:786:56ad:f29f with SMTP id 00721157ae682-78964fb9499mr13473197b3.2.1763425482280;
        Mon, 17 Nov 2025 16:24:42 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:d::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7882212561fsm47026437b3.31.2025.11.17.16.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:24:40 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
To: Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Brett Creeley <brett.creeley@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Bloch <mbloch@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	Manish Chopra <manishc@marvell.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Vladimir Oltean <olteanv@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Dave Ertman <david.m.ertman@intel.com>,
	Vlad Dumitrescu <vdumitrescu@nvidia.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rdma@vger.kernel.org
Subject: [PATCH net-next v4 2/6] devlink: refactor devlink_nl_param_value_fill_one()
Date: Mon, 17 Nov 2025 16:24:28 -0800
Message-ID: <20251118002433.332272-3-daniel.zahka@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251118002433.332272-1-daniel.zahka@gmail.com>
References: <20251118002433.332272-1-daniel.zahka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lift the param type demux and value attr placement into a separate
function. This new function, devlink_nl_param_put(), can be used to
place additional types values in the value array, e.g., default,
current, next values. This commit has no functional change.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 net/devlink/param.c | 70 +++++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 31 deletions(-)

diff --git a/net/devlink/param.c b/net/devlink/param.c
index 3dbd023e4c36..3aa14ef345f0 100644
--- a/net/devlink/param.c
+++ b/net/devlink/param.c
@@ -193,58 +193,66 @@ static int devlink_param_set(struct devlink *devlink,
 }
 
 static int
-devlink_nl_param_value_fill_one(struct sk_buff *msg,
-				enum devlink_param_type type,
-				enum devlink_param_cmode cmode,
-				union devlink_param_value val)
+devlink_nl_param_value_put(struct sk_buff *msg, enum devlink_param_type type,
+			   int nla_type, union devlink_param_value val)
 {
-	struct nlattr *param_value_attr;
-
-	param_value_attr = nla_nest_start_noflag(msg,
-						 DEVLINK_ATTR_PARAM_VALUE);
-	if (!param_value_attr)
-		goto nla_put_failure;
-
-	if (nla_put_u8(msg, DEVLINK_ATTR_PARAM_VALUE_CMODE, cmode))
-		goto value_nest_cancel;
-
 	switch (type) {
 	case DEVLINK_PARAM_TYPE_U8:
-		if (nla_put_u8(msg, DEVLINK_ATTR_PARAM_VALUE_DATA, val.vu8))
-			goto value_nest_cancel;
+		if (nla_put_u8(msg, nla_type, val.vu8))
+			return -EMSGSIZE;
 		break;
 	case DEVLINK_PARAM_TYPE_U16:
-		if (nla_put_u16(msg, DEVLINK_ATTR_PARAM_VALUE_DATA, val.vu16))
-			goto value_nest_cancel;
+		if (nla_put_u16(msg, nla_type, val.vu16))
+			return -EMSGSIZE;
 		break;
 	case DEVLINK_PARAM_TYPE_U32:
-		if (nla_put_u32(msg, DEVLINK_ATTR_PARAM_VALUE_DATA, val.vu32))
-			goto value_nest_cancel;
+		if (nla_put_u32(msg, nla_type, val.vu32))
+			return -EMSGSIZE;
 		break;
 	case DEVLINK_PARAM_TYPE_U64:
-		if (devlink_nl_put_u64(msg, DEVLINK_ATTR_PARAM_VALUE_DATA,
-				       val.vu64))
-			goto value_nest_cancel;
+		if (devlink_nl_put_u64(msg, nla_type, val.vu64))
+			return -EMSGSIZE;
 		break;
 	case DEVLINK_PARAM_TYPE_STRING:
-		if (nla_put_string(msg, DEVLINK_ATTR_PARAM_VALUE_DATA,
-				   val.vstr))
-			goto value_nest_cancel;
+		if (nla_put_string(msg, nla_type, val.vstr))
+			return -EMSGSIZE;
 		break;
 	case DEVLINK_PARAM_TYPE_BOOL:
-		if (val.vbool &&
-		    nla_put_flag(msg, DEVLINK_ATTR_PARAM_VALUE_DATA))
-			goto value_nest_cancel;
+		if (val.vbool && nla_put_flag(msg, nla_type))
+			return -EMSGSIZE;
 		break;
 	}
+	return 0;
+}
+
+static int
+devlink_nl_param_value_fill_one(struct sk_buff *msg,
+				enum devlink_param_type type,
+				enum devlink_param_cmode cmode,
+				union devlink_param_value val)
+{
+	struct nlattr *param_value_attr;
+	int err = -EMSGSIZE;
+
+	param_value_attr = nla_nest_start_noflag(msg,
+						 DEVLINK_ATTR_PARAM_VALUE);
+	if (!param_value_attr)
+		return -EMSGSIZE;
+
+	if (nla_put_u8(msg, DEVLINK_ATTR_PARAM_VALUE_CMODE, cmode))
+		goto value_nest_cancel;
+
+	err = devlink_nl_param_value_put(msg, type,
+					 DEVLINK_ATTR_PARAM_VALUE_DATA, val);
+	if (err)
+		goto value_nest_cancel;
 
 	nla_nest_end(msg, param_value_attr);
 	return 0;
 
 value_nest_cancel:
 	nla_nest_cancel(msg, param_value_attr);
-nla_put_failure:
-	return -EMSGSIZE;
+	return err;
 }
 
 static int devlink_nl_param_fill(struct sk_buff *msg, struct devlink *devlink,
-- 
2.47.3


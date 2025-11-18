Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E52737EE
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 00:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763425495; cv=none; b=r4758d+0h3zFPYZUvQmbHNXJjDN505Tam1PDKaTMtsjYWZERa/m1Khls55J2yP6jBwNk9dT8TA5Ko8x6kH4EeNdnqlKpjODgWA+dDOkti3TlluP2x8i3y5Q3/ibsWfCSmhRWDefV8XtnePK/2xKH69J+wZSSd8JcmI7wrH2dqpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763425495; c=relaxed/simple;
	bh=GU2W4Env3pVySzouvOpft34vMD3lKZ1I3nej/UOh/y4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nBxrGDg4zjHWld0qwd1mc/qFqAJlKPonn9v3+2Vj455+vbaAECYnkhuvzaD8//a0aYivGmUMr7VLxhIdIFIl127cAGmX5c7ip1r4lBoXy/GLi2Zg+CDcc0+740D7V1/YG5A3Koph98wMJ4NVtty0ki6r6aziQ5ZWKephhIKpRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRUibDaQ; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRUibDaQ"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7866aca9ff4so49265107b3.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 16:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763425492; x=1764030292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lpm61WVMpXaTS4gWKedINtFRMcV4KgYOfoTCHp0JnK8=;
        b=CRUibDaQhsp+gAFQgFCmRFnf8lP/m/6XOnfCBXDxhpA1lE5ni/dhiJjAQyMS3K5wQZ
         fCNH76cMG0JBGzsGLvGDbjzZo60ukpRrvyLZCDQ9/KHxd3U1S3Sn7gUkXvqTHNKIJHOa
         fOXF8wCEKHY9TBv8e3qhcmC2dRtdgC5NzSmNjjQD5/ceZBly6rZWWraiKFYL/+8+ZeZq
         216AvoAimu0/XhbE97qa17cOHJDcfFnWDqCXuIRUHXugSkjZ0F/pmdw84Xl7GYMYD7sO
         bgdW18rYKF7+Tnjo52cJF9TD7Twy/OU3I6o6vUhRNouRMKbfo7PDAGaRCeY57+Mi61dN
         6qIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763425492; x=1764030292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lpm61WVMpXaTS4gWKedINtFRMcV4KgYOfoTCHp0JnK8=;
        b=G/l3REO2iRxQ3E3mIV9wVO1EAZRsZ4W4gG8QwbUGAc8YJPQfMfoktMlAMQy1MeI/Qr
         JErcuF90b5CO4pLaI0Fcco9No5Pz0yb/Qi5FxHwg6sJQSuMK2GwmmNVF+QOwxhf/zLR/
         zjimQV7fCJcKnyUFVQ43uJAFZxW1TwDJvckUdHahjRaibRqRJMy/LKT2jYmIRY9cOUrk
         VeTh+yLTNzg0LV9vwIxtA9K7GjaoHnzeTzQauvaNAUtMrDuZqJHJwZIZ8gvAiDdlBFX2
         O9jJDE7OnGRnvLxVwLDhjp4ZCHW+KQEZ7LboOEocAkhIil2UfTv4fp5XtxIp97qnRt3m
         wDxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlCe/jBB7c60A/XP4BkW6KeXAIe28Mrbep37hSlt/CyFKoVO5nzYNiQrwPSlzBdYWrZwKERgAf+rU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEMH63I1OzddB03pmsIDM++c/PVtrbozjnIg2wHN6MbqysnVe9
	2YxKpa0schtgOCfUQy4rUxA16C1AGRNOrPJPzjXz77YyUcrlkz1ruL6j
X-Gm-Gg: ASbGncvGMtstLuIVPTYSD0AFQZFuoLTsGWXdYcz1uX3nnngbj/IBuUmIggMiNDFhleO
	rfmWRxh3GCR8qV4/fMz5qKezeBOjLtHeQZwSCrq+JjsHD6Fl+lTMZoo3iZJ/FD9hRzCxnWZrQ4S
	BE7y0unhNP9aRhJvavuRMECXdVLTecnnlm5FH2f5SIHUG6S6UXq212klIUNLg6DpkX/hLJN1yo1
	0ZP4gIPloXGm79r/Zp3wAWcARYM0vTcjTiqbMyp8nZzkxrLvcdRF9YAGK2IKAtcwH0pglB7k4D/
	zbokzJ08FttinM2GbZe0aGW4jJju/fbNtbgSnzLweo9HkzWxbpcqr5nh+Unpd2vYHZHyR5WEsR5
	+TH/rqQ9GXpMz+O4WEIceJzmhYzCw3gte038TkYz5bL9zEjcUiigt9vAJAzqEGamnEEobw5McRt
	CN1u/iwrKqE5OGVLDxYbT6
X-Google-Smtp-Source: AGHT+IG+Fh1oMqCwOWhdJCefG39eiTd3KH357Rm2dtFkemtoWRfvUtMRNQYxOyrW7sTnzPCc3JOpvw==
X-Received: by 2002:a05:690c:c3f1:b0:786:660b:82b5 with SMTP id 00721157ae682-78929e46780mr104068197b3.27.1763425492499;
        Mon, 17 Nov 2025 16:24:52 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:47::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7882214ea47sm46813667b3.45.2025.11.17.16.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:24:49 -0800 (PST)
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
Subject: [PATCH net-next v4 5/6] netdevsim: register a new devlink param with default value interface
Date: Mon, 17 Nov 2025 16:24:31 -0800
Message-ID: <20251118002433.332272-6-daniel.zahka@gmail.com>
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

Create a new devlink param, test2, that supports default param actions
via the devlink_param::get_default() and
devlink_param::reset_default() functions.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
 drivers/net/netdevsim/dev.c       | 55 +++++++++++++++++++++++++++++++
 drivers/net/netdevsim/netdevsim.h |  1 +
 2 files changed, 56 insertions(+)

diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index 95f66c1f59db..3aeb3abfec83 100644
--- a/drivers/net/netdevsim/dev.c
+++ b/drivers/net/netdevsim/dev.c
@@ -320,6 +320,8 @@ static int nsim_dev_debugfs_init(struct nsim_dev *nsim_dev)
 			   &nsim_dev->max_macs);
 	debugfs_create_bool("test1", 0600, nsim_dev->ddir,
 			    &nsim_dev->test1);
+	debugfs_create_u32("test2", 0600, nsim_dev->ddir,
+			   &nsim_dev->test2);
 	nsim_dev->take_snapshot = debugfs_create_file("take_snapshot",
 						      0200,
 						      nsim_dev->ddir,
@@ -521,8 +523,51 @@ static int nsim_dev_resources_register(struct devlink *devlink)
 enum nsim_devlink_param_id {
 	NSIM_DEVLINK_PARAM_ID_BASE = DEVLINK_PARAM_GENERIC_ID_MAX,
 	NSIM_DEVLINK_PARAM_ID_TEST1,
+	NSIM_DEVLINK_PARAM_ID_TEST2,
 };
 
+static int
+nsim_devlink_param_test2_get(struct devlink *devlink, u32 id,
+			     struct devlink_param_gset_ctx *ctx,
+			     struct netlink_ext_ack *extack)
+{
+	struct nsim_dev *nsim_dev = devlink_priv(devlink);
+
+	ctx->val.vu32 = nsim_dev->test2;
+	return 0;
+}
+
+static int
+nsim_devlink_param_test2_set(struct devlink *devlink, u32 id,
+			     struct devlink_param_gset_ctx *ctx,
+			     struct netlink_ext_ack *extack)
+{
+	struct nsim_dev *nsim_dev = devlink_priv(devlink);
+
+	nsim_dev->test2 = ctx->val.vu32;
+	return 0;
+}
+
+static int
+nsim_devlink_param_test2_get_default(struct devlink *devlink, u32 id,
+				     struct devlink_param_gset_ctx *ctx,
+				     struct netlink_ext_ack *extack)
+{
+	ctx->val.vu32 = 1234;
+	return 0;
+}
+
+static int
+nsim_devlink_param_test2_reset_default(struct devlink *devlink, u32 id,
+				       enum devlink_param_cmode cmode,
+				       struct netlink_ext_ack *extack)
+{
+	struct nsim_dev *nsim_dev = devlink_priv(devlink);
+
+	nsim_dev->test2 = 1234;
+	return 0;
+}
+
 static const struct devlink_param nsim_devlink_params[] = {
 	DEVLINK_PARAM_GENERIC(MAX_MACS,
 			      BIT(DEVLINK_PARAM_CMODE_DRIVERINIT),
@@ -531,6 +576,14 @@ static const struct devlink_param nsim_devlink_params[] = {
 			     "test1", DEVLINK_PARAM_TYPE_BOOL,
 			     BIT(DEVLINK_PARAM_CMODE_DRIVERINIT),
 			     NULL, NULL, NULL),
+	DEVLINK_PARAM_DRIVER_WITH_DEFAULTS(NSIM_DEVLINK_PARAM_ID_TEST2,
+					   "test2", DEVLINK_PARAM_TYPE_U32,
+					   BIT(DEVLINK_PARAM_CMODE_RUNTIME),
+					   nsim_devlink_param_test2_get,
+					   nsim_devlink_param_test2_set,
+					   NULL,
+					   nsim_devlink_param_test2_get_default,
+					   nsim_devlink_param_test2_reset_default),
 };
 
 static void nsim_devlink_set_params_init_values(struct nsim_dev *nsim_dev,
@@ -1396,6 +1449,7 @@ static const struct devlink_ops nsim_dev_devlink_ops = {
 
 #define NSIM_DEV_MAX_MACS_DEFAULT 32
 #define NSIM_DEV_TEST1_DEFAULT true
+#define NSIM_DEV_TEST2_DEFAULT 1234
 
 static int __nsim_dev_port_add(struct nsim_dev *nsim_dev, enum nsim_dev_port_type type,
 			       unsigned int port_index, u8 perm_addr[ETH_ALEN])
@@ -1590,6 +1644,7 @@ int nsim_drv_probe(struct nsim_bus_dev *nsim_bus_dev)
 	nsim_dev->fw_update_flash_chunk_time_ms = NSIM_DEV_FLASH_CHUNK_TIME_MS_DEFAULT;
 	nsim_dev->max_macs = NSIM_DEV_MAX_MACS_DEFAULT;
 	nsim_dev->test1 = NSIM_DEV_TEST1_DEFAULT;
+	nsim_dev->test2 = NSIM_DEV_TEST2_DEFAULT;
 	spin_lock_init(&nsim_dev->fa_cookie_lock);
 
 	dev_set_drvdata(&nsim_bus_dev->dev, nsim_dev);
diff --git a/drivers/net/netdevsim/netdevsim.h b/drivers/net/netdevsim/netdevsim.h
index af6fcfcda8ba..d1a941e2b18f 100644
--- a/drivers/net/netdevsim/netdevsim.h
+++ b/drivers/net/netdevsim/netdevsim.h
@@ -331,6 +331,7 @@ struct nsim_dev {
 	u32 fw_update_flash_chunk_time_ms;
 	u32 max_macs;
 	bool test1;
+	u32 test2;
 	bool dont_allow_reload;
 	bool fail_reload;
 	struct devlink_region *dummy_region;
-- 
2.47.3


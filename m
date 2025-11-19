Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0C2D24BF
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 02:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763520649; cv=none; b=YmbRXtCpnCLTZT4AS6RkDwj4+Cwg4MH0NwdqJRKNA8ZFG0b+p/iSGuSnAlHcX0PQl8KAP5QbACdWjsGWqtWuXWbDNKOITZbDnYDqjHbq8+lJD291ZgV7k9Vrec/O9yRmxKSYF94Abuds1DPy2rJk+Bh4oEJzs9IJrw4NqciEMp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763520649; c=relaxed/simple;
	bh=l/PApn1G/c4u9BEsPG1poIW4K3XiIGRyssMDc+QqiBM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yc3tdZICMWm8Lpoj86Pt68edLgyuFLx3iuanOdNQKqGgeLfUyGoJamjZNbxuN7WgfwiJMGohw+C62dIhHzMNeAFsisK5PWi1azwGLGJOa5BLl5LS0ouiYWznwnc6ymWuQSBA0cOVVY3DpAyF64w1D7obb1LoRrg+f9a7LeVozK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mliOOtzB; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mliOOtzB"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63e19642764so5275384d50.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 18:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763520645; x=1764125445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfMYKL1MowanU+ydcWrbRX5x+m+UA3104k+MyV8UJCU=;
        b=mliOOtzBJ34BZeVHA3TxaQTLNzsoWolk7hMB2EGCh1bvYTprwMwxtKXQQn3+9LadLc
         1sdSkciwdi6k/EGBDzW/skQMBgyoxzAqPcqpeorbgkCH9UAIv5AQN2xab7TrN/NqvQxT
         PT1L8k45eL2hqwestEfrocTONhBVTAuGIijieLoBhZe8gCKUJIpBvSDh/CwuSzp6nC2a
         UyLm8A9uXcyQh0LUdl18OIVXBnvjtOVK8rLXHvB6eD+R9ZLVZrk6lARb0l04UI7yz/wV
         ysBgBmApz6uLfSgl42SyVcwAuFiq3e01lOHRBxZSLj0nSFXFJ8OCwG/u9fEfjHbUAEeM
         YPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763520645; x=1764125445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SfMYKL1MowanU+ydcWrbRX5x+m+UA3104k+MyV8UJCU=;
        b=JGMhJrNMdFoaeHK2luqgIlEoRdUNZMIvTkyIOrJ6km3YMLiqvyctwzIWDatDcIJI2I
         fQJerH3DTZ48Zq44/z40Dv2kRgtihLomEsFByz0NFimuECjnB8WIBXlahcYN7TmiXX+u
         hM8LXharVa4ArBamv1xlpA/afEAn8Qju8TiLQyLIt/THdkUT6pQOK9udl41uGrYrC67e
         Ssd9EURXJMIC2b2f1FB+mkA5eflgAF3g8mg8KubFbQMKI7tklCWvf6hVl/viIXBV7YN8
         /WqDuzM5wFZv1gCU1KVR70YFby63iyaa+wcdZXRIAO9+yflwHKNRF97Pynrb8ilmVGk5
         Q1jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSSRWxoBVVcZHaEzqPmf0SzPBaJPg5o6ShmP5qGZ2lV7hZW9czPrQQwAaGeJH3kr96a+fRaCUq+5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMzJwDknkCkIO8cj/eoq1atJb7/tUSNzCMt+CVzMmGCg33oqTY
	E7C9OJfwgz1YhpQfSwQJ2pKr+1wtRSt/99JPgWeW1Mr8stO3X55fu97o
X-Gm-Gg: ASbGncsc6swL07taUXwIgQ+azGt1iEKs+xk+Bn1Rs2eNQOhVDI/LHzD/UQyUtk3BZ42
	0i1WAXx4J3/nTjpHD14NbyUtR86d2Kk9ogUURj8MoNIdKSdmi0/ryWXXKeIH1zV0/x5Kk+sdfxz
	Aw0DDD4O1HFFkCMDk4B1fjAIgfhgBOLhjqf04y4ttc32+DhevXlNwDDUsbeVZqqpOG/BO/ALiry
	1F6IH/0jYQiOr3KhCy10IJZZs3bzzMfJJ+2tcR4TrpX43B7tOKTeNN3wO8/hSjjmtjcIKXiddkO
	baLRnLlr8ZkhJx6p6eVNEGM/FelVoGEDgGgJfcO4gCTE6UqAztVHI+Oax/IvZIrZiWbWV6HpBXE
	AsFl6xRYUUw6uGTPHkL1FBmyCrqIYs78nrCNOSOpEV771FtfGklgytcXeUvN6uNlQT6FbpjPD9r
	VWxqxKEqRkB5HWVKg16+Bvii1HLZA4jqE=
X-Google-Smtp-Source: AGHT+IH0Fq/B03G5Ni+5EL+C2Zjoi3HIOENrIEn4SmPL1fIk2tuLkPEZkquimopS4n2FAt0wQw4oUQ==
X-Received: by 2002:a53:c052:0:20b0:63f:b922:ed79 with SMTP id 956f58d0204a3-641e755565amr13345889d50.14.1763520645166;
        Tue, 18 Nov 2025 18:50:45 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5a::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6410eabb46esm6540895d50.17.2025.11.18.18.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 18:50:44 -0800 (PST)
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
Subject: [PATCH net-next v5 5/6] netdevsim: register a new devlink param with default value interface
Date: Tue, 18 Nov 2025 18:50:35 -0800
Message-ID: <20251119025038.651131-6-daniel.zahka@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251119025038.651131-1-daniel.zahka@gmail.com>
References: <20251119025038.651131-1-daniel.zahka@gmail.com>
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

Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---

Notes:
    v5:
     - don't use magic value in get_default() reset_default()

 drivers/net/netdevsim/dev.c       | 56 +++++++++++++++++++++++++++++++
 drivers/net/netdevsim/netdevsim.h |  1 +
 2 files changed, 57 insertions(+)

diff --git a/drivers/net/netdevsim/dev.c b/drivers/net/netdevsim/dev.c
index 95f66c1f59db..2683a989873e 100644
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
@@ -521,8 +523,53 @@ static int nsim_dev_resources_register(struct devlink *devlink)
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
+#define NSIM_DEV_TEST2_DEFAULT 1234
+
+static int
+nsim_devlink_param_test2_get_default(struct devlink *devlink, u32 id,
+				     struct devlink_param_gset_ctx *ctx,
+				     struct netlink_ext_ack *extack)
+{
+	ctx->val.vu32 = NSIM_DEV_TEST2_DEFAULT;
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
+	nsim_dev->test2 = NSIM_DEV_TEST2_DEFAULT;
+	return 0;
+}
+
 static const struct devlink_param nsim_devlink_params[] = {
 	DEVLINK_PARAM_GENERIC(MAX_MACS,
 			      BIT(DEVLINK_PARAM_CMODE_DRIVERINIT),
@@ -531,6 +578,14 @@ static const struct devlink_param nsim_devlink_params[] = {
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
@@ -1590,6 +1645,7 @@ int nsim_drv_probe(struct nsim_bus_dev *nsim_bus_dev)
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


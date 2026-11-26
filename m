Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725276;
	b=E8Dj5R8guGCH7mLbkzygAeX1fLfl1MKZxZQ5wdkcuupbboKW1SjLpW9hoDCKWp58dV95
	 Gen0re2GhFpsVXOni/x1iVjSmcNY76MmT8u5mJvpJyOu+0EnA0MgA8tnWOTxx5OclqEqg
	 3TckGytq6PYEmCmQmBEsBNMn2u/VsMn9/i+tHsM+WNiZEiYEbPtEPi9QTcdT9lpZNAM0D
	 PFXRE4kh1JCSJNhvQcb1F9u7ePXtHMsSp29FpmU+Jiry/zRXtMNKdAS76d8qZ+R7EVNMs
	 57+wUDj1gf6yBlbLkdbUSqODi25WS3cUc68duVz43bbqEKrUCZdcPNkBbAzXn9a4zrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725276;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=cl9DTQZeHpCM+4EGzLJi2z2GqIhe3p8rfAUQLQ+TbgQ=;
	b=e5bEzZoT5HhpNPMq5Qh7fnw56Zf+JHq3UBCatTIvQzRYmk+/cNGC+GBwzKFG1KpPd0cG
	 oE/RAi7XT4yxAcRyRp/s7SiL8+bLdgQds6BtFKWQU1UNdf7U/qWWYSyX79NAEo73OwYWP
	 1k5Nt2XbLARs8J8V9KQOonE0iKjBNaWBUkLmTKbhg6GPjcA6E3WWOAYzwMqE4WVelcoAj
	 gPfT86zR9NuGrYLaNu8B7aeIE5nPX2J6lPSEF+6CmC/2D8hK/KOYFyvTZ4tXOCm4UO8PF
	 sIWrkIiYY7/35qic5G48btBFFiScPXiLNBsIa12w2r7yk+kfR2FfZMf0v9wPkqNdipA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="MYfRlf1/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD6C606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MYfRlf1/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725274;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cl9DTQZeHpCM+4EGzLJi2z2GqIhe3p8rfAUQLQ+TbgQ=;
	b=MYfRlf1/X2fh7yCGUVTdQxfLzZ+GcQEjwYkirCaneloGEokdl93KG2w7qF/douyutnWRG7
	AfDMVcEHHzVZk8L7XzuHwxOSj/qbvpCBxX8RbngzYstVFc9tQv7rgAY3SW81mmN59ExczK
	SdX++1PyU9xaBihwqYIigB2zcpQV5yQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-664-yrOyYjXDNAauXEUkvNt9aQ-1; Thu,
 26 Nov 2026 20:34:32 +0000
X-MC-Unique: yrOyYjXDNAauXEUkvNt9aQ-1
X-Mimecast-MFC-AGG-ID: yrOyYjXDNAauXEUkvNt9aQ_1795725269
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2C3BA18004DF;
	Thu, 26 Nov 2026 20:34:29 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 15675180197A;
	Thu, 26 Nov 2026 20:34:22 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Min Li <min.li@microchip.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH RFC net-next 16/19] dpll: drop the in-kernel notifier chain
Date: Thu, 26 Nov 2026 21:32:28 +0100
Message-ID: <20261126203231.934632-17-ivecera@redhat.com>
In-Reply-To: <20261126203231.934632-1-ivecera@redhat.com>
References: <20261126203231.934632-1-ivecera@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The only user of the notifier chain from commit 2be467588d6b ("dpll: Add
notifier chain for dpll events") was ice on E825. The driver waited
there for the zl3073x pins it registered its own pins with. It now links
its own pins with them instead.

Drop the chain. The KUnit tests counted the change notifications of
linked pins through it. Count them with a static stub of
__dpll_pin_change_ntf() instead.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/Kconfig            |  4 +--
 drivers/dpll/dpll_core.c        | 43 ---------------------------------
 drivers/dpll/dpll_core.h        |  2 --
 drivers/dpll/dpll_netlink.c     |  5 ++--
 drivers/dpll/tests/dpll_kunit.c | 31 +++++++++---------------
 include/linux/dpll.h            | 18 --------------
 6 files changed, 15 insertions(+), 88 deletions(-)

diff --git a/drivers/dpll/Kconfig b/drivers/dpll/Kconfig
index 6f1ffc3a6e7717..d57696652d450a 100644
--- a/drivers/dpll/Kconfig
+++ b/drivers/dpll/Kconfig
@@ -34,8 +34,8 @@ config DPLL_KUNIT_TEST
 	  while the pins at both ends are registered.
 
 	  The mock devices and pins are registered with the DPLL subsystem,
-	  so user space sees them and their notifications while the tests
-	  run.
+	  so user space sees them and their create and delete notifications
+	  while the tests run.
 
 	  If unsure, say N.
 
diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 9b48d289ec7330..e199342652d163 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -27,7 +27,6 @@ EXPORT_SYMBOL_IF_KUNIT(dpll_lock);
 DEFINE_XARRAY_FLAGS(dpll_device_xa, XA_FLAGS_ALLOC);
 DEFINE_XARRAY_FLAGS(dpll_pin_xa, XA_FLAGS_ALLOC);
 
-static RAW_NOTIFIER_HEAD(dpll_notifier_chain);
 static DEFINE_IDA(dpll_pin_idx_ida);
 
 static u32 dpll_device_xa_id;
@@ -55,26 +54,6 @@ struct dpll_pin_registration {
 	dpll_tracker tracker;
 };
 
-static int call_dpll_notifiers(unsigned long action, void *info)
-{
-	lockdep_assert_held(&dpll_lock);
-	return raw_notifier_call_chain(&dpll_notifier_chain, action, info);
-}
-
-void dpll_pin_notify(struct dpll_pin *pin, unsigned long action)
-{
-	struct dpll_pin_notifier_info info = {
-		.pin = pin,
-		.id = pin->id,
-		.idx = pin->pin_idx,
-		.clock_id = pin->clock_id,
-		.fwnode = pin->fwnode,
-		.prop = &pin->prop,
-	};
-
-	call_dpll_notifiers(action, &info);
-}
-
 static void dpll_device_tracker_alloc(struct dpll_device *dpll,
 				      dpll_tracker *tracker)
 {
@@ -704,28 +683,6 @@ void dpll_netdev_pin_clear(struct net_device *dev)
 }
 EXPORT_SYMBOL(dpll_netdev_pin_clear);
 
-int register_dpll_notifier(struct notifier_block *nb)
-{
-	int ret;
-
-	mutex_lock(&dpll_lock);
-	ret = raw_notifier_chain_register(&dpll_notifier_chain, nb);
-	mutex_unlock(&dpll_lock);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(register_dpll_notifier);
-
-int unregister_dpll_notifier(struct notifier_block *nb)
-{
-	int ret;
-
-	mutex_lock(&dpll_lock);
-	ret = raw_notifier_chain_unregister(&dpll_notifier_chain, nb);
-	mutex_unlock(&dpll_lock);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(unregister_dpll_notifier);
-
 /**
  * dpll_pin_get - find existing or create new dpll pin
  * @clock_id: clock_id of creator
diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
index 3b7e0af7f7ee6f..6e10aadd2123d9 100644
--- a/drivers/dpll/dpll_core.h
+++ b/drivers/dpll/dpll_core.h
@@ -111,6 +111,4 @@ extern struct xarray dpll_device_xa;
 extern struct xarray dpll_pin_xa;
 extern struct mutex dpll_lock;
 
-void dpll_pin_notify(struct dpll_pin *pin, unsigned long action);
-
 #endif
diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index 372de086a7eb3d..6a46130fc687eb 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -6,6 +6,7 @@
  *  Copyright (c) 2023 Intel and affiliates
  *
  */
+#include <kunit/static_stub.h>
 #include <kunit/visibility.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -968,13 +969,11 @@ dpll_pin_event_send(enum dpll_cmd event, struct dpll_pin *pin)
 
 int dpll_pin_create_ntf(struct dpll_pin *pin)
 {
-	dpll_pin_notify(pin, DPLL_PIN_CREATED);
 	return dpll_pin_event_send(DPLL_CMD_PIN_CREATE_NTF, pin);
 }
 
 int dpll_pin_delete_ntf(struct dpll_pin *pin)
 {
-	dpll_pin_notify(pin, DPLL_PIN_DELETED);
 	return dpll_pin_event_send(DPLL_CMD_PIN_DELETE_NTF, pin);
 }
 
@@ -988,8 +987,8 @@ int dpll_pin_delete_ntf(struct dpll_pin *pin)
  */
 int __dpll_pin_change_ntf(struct dpll_pin *pin)
 {
+	KUNIT_STATIC_STUB_REDIRECT(__dpll_pin_change_ntf, pin);
 	lockdep_assert_held(&dpll_lock);
-	dpll_pin_notify(pin, DPLL_PIN_CHANGED);
 	return dpll_pin_event_send(DPLL_CMD_PIN_CHANGE_NTF, pin);
 }
 EXPORT_SYMBOL_GPL(__dpll_pin_change_ntf);
diff --git a/drivers/dpll/tests/dpll_kunit.c b/drivers/dpll/tests/dpll_kunit.c
index 7fb50fe0eea9a5..1804e5836f7db2 100644
--- a/drivers/dpll/tests/dpll_kunit.c
+++ b/drivers/dpll/tests/dpll_kunit.c
@@ -12,9 +12,9 @@
  */
 
 #include <kunit/fwnode.h>
+#include <kunit/static_stub.h>
 #include <kunit/test.h>
 #include <linux/dpll.h>
-#include <linux/notifier.h>
 #include <net/netlink.h>
 
 #include "../dpll_core.h"
@@ -35,15 +35,13 @@ struct dt_dev {
 struct dt_pin {
 	struct dpll_pin *pin;
 	dpll_tracker tracker;
-	int changes;		/* DPLL_PIN_CHANGED notifications */
+	int changes;		/* change notifications */
 };
 
 struct dt_ctx {
 	struct dt_dev a0, a1, b0;
 	struct dt_pin p, u, c;
 	struct fwnode_handle *fwnode;
-	struct notifier_block nb;
-	bool nb_registered;
 	bool p_a0, p_a1, u_a0, c_b0;	/* registrations */
 };
 
@@ -95,22 +93,19 @@ static const struct dpll_pin_properties dt_pin_prop = {
 	.type = DPLL_PIN_TYPE_EXT,
 };
 
-static int dt_notify(struct notifier_block *nb, unsigned long action,
-		     void *data)
+/* Stub of __dpll_pin_change_ntf() that counts the notifications */
+static int dt_pin_change_ntf(struct dpll_pin *pin)
 {
-	struct dt_ctx *ctx = container_of(nb, struct dt_ctx, nb);
-	struct dpll_pin_notifier_info *info = data;
+	struct dt_ctx *ctx = kunit_get_current_test()->priv;
 
-	if (action != DPLL_PIN_CHANGED)
-		return NOTIFY_DONE;
-	if (info->pin == ctx->p.pin)
+	if (pin == ctx->p.pin)
 		ctx->p.changes++;
-	else if (info->pin == ctx->u.pin)
+	else if (pin == ctx->u.pin)
 		ctx->u.changes++;
-	else if (info->pin == ctx->c.pin)
+	else if (pin == ctx->c.pin)
 		ctx->c.changes++;
 
-	return NOTIFY_OK;
+	return 0;
 }
 
 static void dt_dev_init(struct kunit *test, struct dt_dev *dev, u64 clock_id,
@@ -235,10 +230,8 @@ static int dt_init(struct kunit *test)
 	ret = dpll_pin_link_add(ctx->c.pin, ctx->fwnode);
 	KUNIT_ASSERT_EQ(test, ret, 0);
 
-	ctx->nb.notifier_call = dt_notify;
-	ret = register_dpll_notifier(&ctx->nb);
-	KUNIT_ASSERT_EQ(test, ret, 0);
-	ctx->nb_registered = true;
+	kunit_activate_static_stub(test, __dpll_pin_change_ntf,
+				   dt_pin_change_ntf);
 
 	return 0;
 }
@@ -249,8 +242,6 @@ static void dt_exit(struct kunit *test)
 
 	if (!ctx)
 		return;
-	if (ctx->nb_registered)
-		unregister_dpll_notifier(&ctx->nb);
 	dt_unreg(&ctx->a0, &ctx->p, &ctx->p_a0);
 	dt_unreg(&ctx->a1, &ctx->p, &ctx->p_a1);
 	dt_unreg(&ctx->a0, &ctx->u, &ctx->u_a0);
diff --git a/include/linux/dpll.h b/include/linux/dpll.h
index 9eccfe41240418..1e5b940a245a7d 100644
--- a/include/linux/dpll.h
+++ b/include/linux/dpll.h
@@ -11,7 +11,6 @@
 #include <linux/device.h>
 #include <linux/netlink.h>
 #include <linux/netdevice.h>
-#include <linux/notifier.h>
 #include <linux/rtnetlink.h>
 #include <net/netlink.h>
 
@@ -211,19 +210,6 @@ typedef struct ref_tracker *dpll_tracker;
 typedef struct {} dpll_tracker;
 #endif
 
-#define DPLL_PIN_CREATED	4
-#define DPLL_PIN_DELETED	5
-#define DPLL_PIN_CHANGED	6
-
-struct dpll_pin_notifier_info {
-	struct dpll_pin *pin;
-	u32 id;
-	u32 idx;
-	u64 clock_id;
-	const struct fwnode_handle *fwnode;
-	const struct dpll_pin_properties *prop;
-};
-
 #if IS_ENABLED(CONFIG_DPLL)
 void dpll_netdev_pin_set(struct net_device *dev, struct dpll_pin *dpll_pin);
 void dpll_netdev_pin_clear(struct net_device *dev);
@@ -306,8 +292,4 @@ int dpll_device_change_ntf(struct dpll_device *dpll);
 int __dpll_pin_change_ntf(struct dpll_pin *pin);
 int dpll_pin_change_ntf(struct dpll_pin *pin);
 
-int register_dpll_notifier(struct notifier_block *nb);
-
-int unregister_dpll_notifier(struct notifier_block *nb);
-
 #endif
-- 
2.56.1


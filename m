Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725239;
	b=Te0oRM8o4UdqOx6xTBVU3HGtfcDXrp9lC1rmqLKV1eg5vhKG4IjHWWAsG/HknmRxSew+
	 ar4Tk9wNMqXIUyevyzMzVfv3uSVrj8Lj0NEs1k1ZIyXFWAIJl8uiOlEnBZMQgRvZfxu8h
	 i5q/pwFwSLZdsKjUMX5TtkNUdEyq5ixKSUystYaqpyWEevVhC/u5z3kfKGpD05mv6SO8a
	 qazZGqQOIQzhpRiX28JIMcFxY0z26LA5xpog7Oa2aAvMD/c1nHDVtHmwLElmh6Qh586XC
	 naS91vkPiIv0fhlnYeYfb7JRPe5GGNVV8ALzxW9dR49EhobDH4OOjqRycJ68acy9n9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725239;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=EWNSn7/qGLe4P+MNmNuGL5nNMpUQ5CrgVDoViR4hYXc=;
	b=36TaRv5mIBSfPf2GTtXkI2cWTuie7EVSpb6FHalnKmcJ8Jg4lPfUTsABoI2J3RSYZ9id
	 YtUkmCVMKFnd0uc1anwt8mJfV1BV8HSNt5Zqi7GYsjSlBzfnxnqCZGCxLhbcGJ8WZ5V6r
	 uDFC1HY7iDimaAymmw8+SC5zumrjwoj8TwdpAwY5WnPP5W8qP8Uc5BRZit57MKW3ckiOr
	 wCH2zvxoqgfIsVzQmhUpFvizeVGuNEoHd6Ad8LUapxRlKxckNLfJKNaaKonsnOpbBZdSH
	 u0sVPOso4MemTQXMOdvJnECPq+CnIlr1K+6XwUxZ4oQZIUvcViRiXYI4VaS1jY3+HzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJT5mX0i;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675E9606A68B
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675E9606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OJT5mX0i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EWNSn7/qGLe4P+MNmNuGL5nNMpUQ5CrgVDoViR4hYXc=;
	b=OJT5mX0i+vjHOwJk3lqlEbktexk3YDgMrED8Dm0E+F/Pxf0rHMo9q9uKuU0S9ZGMwnTtja
	adNaIAslVVZ+nvPjm1vINxGFE9JG5S097bKGM+FaX0pODDYCG/nK9RjCvUURcUizrVGuC3
	sOSddvM2DM+3MHVgX/goqkxmls1sA2s=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-379-PPslup6RNDuO54EKJcimBg-1; Thu,
 26 Nov 2026 20:33:51 +0000
X-MC-Unique: PPslup6RNDuO54EKJcimBg-1
X-Mimecast-MFC-AGG-ID: PPslup6RNDuO54EKJcimBg_1795725228
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E85B18011CC;
	Thu, 26 Nov 2026 20:33:48 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 464341800286;
	Thu, 26 Nov 2026 20:33:42 +0000 (UTC)
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
Subject: [PATCH RFC net-next 10/19] dpll: drop device events from the in-kernel notifier
Date: Thu, 26 Nov 2026 21:32:22 +0100
Message-ID: <20261126203231.934632-11-ivecera@redhat.com>
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

Commit 2be467588d6b ("dpll: Add notifier chain for dpll events") sends
device created, deleted and changed events to the in-kernel notifier
chain, but no driver ever handled them. The only driver that uses the
notifier, ice, waits for pins with a firmware node and ignores
everything else.

Keep the pin events and remove the device ones.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/dpll_core.c    | 13 -------------
 drivers/dpll/dpll_core.h    |  1 -
 drivers/dpll/dpll_netlink.c |  3 ---
 include/linux/dpll.h        | 11 -----------
 4 files changed, 28 deletions(-)

diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index b1b76856c4a188..2371b81181471d 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -61,19 +61,6 @@ static int call_dpll_notifiers(unsigned long action, void *info)
 	return raw_notifier_call_chain(&dpll_notifier_chain, action, info);
 }
 
-void dpll_device_notify(struct dpll_device *dpll, unsigned long action)
-{
-	struct dpll_device_notifier_info info = {
-		.dpll = dpll,
-		.id = dpll->id,
-		.idx = dpll->device_idx,
-		.clock_id = dpll->clock_id,
-		.type = dpll->type,
-	};
-
-	call_dpll_notifiers(action, &info);
-}
-
 void dpll_pin_notify(struct dpll_pin *pin, unsigned long action)
 {
 	struct dpll_pin_notifier_info info = {
diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
index eb33ae2d6080ab..1b3c74ef4c1b42 100644
--- a/drivers/dpll/dpll_core.h
+++ b/drivers/dpll/dpll_core.h
@@ -113,7 +113,6 @@ extern struct xarray dpll_device_xa;
 extern struct xarray dpll_pin_xa;
 extern struct mutex dpll_lock;
 
-void dpll_device_notify(struct dpll_device *dpll, unsigned long action);
 void dpll_pin_notify(struct dpll_pin *pin, unsigned long action);
 
 #endif
diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index 7b9fadf3b3668a..78017aae19a6f2 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -891,13 +891,11 @@ dpll_device_event_send(enum dpll_cmd event, struct dpll_device *dpll)
 
 int dpll_device_create_ntf(struct dpll_device *dpll)
 {
-	dpll_device_notify(dpll, DPLL_DEVICE_CREATED);
 	return dpll_device_event_send(DPLL_CMD_DEVICE_CREATE_NTF, dpll);
 }
 
 int dpll_device_delete_ntf(struct dpll_device *dpll)
 {
-	dpll_device_notify(dpll, DPLL_DEVICE_DELETED);
 	return dpll_device_event_send(DPLL_CMD_DEVICE_DELETE_NTF, dpll);
 }
 
@@ -912,7 +910,6 @@ int dpll_device_delete_ntf(struct dpll_device *dpll)
 int __dpll_device_change_ntf(struct dpll_device *dpll)
 {
 	lockdep_assert_held(&dpll_lock);
-	dpll_device_notify(dpll, DPLL_DEVICE_CHANGED);
 	return dpll_device_event_send(DPLL_CMD_DEVICE_CHANGE_NTF, dpll);
 }
 EXPORT_SYMBOL_GPL(__dpll_device_change_ntf);
diff --git a/include/linux/dpll.h b/include/linux/dpll.h
index 99118dadb271e0..9eccfe41240418 100644
--- a/include/linux/dpll.h
+++ b/include/linux/dpll.h
@@ -211,21 +211,10 @@ typedef struct ref_tracker *dpll_tracker;
 typedef struct {} dpll_tracker;
 #endif
 
-#define DPLL_DEVICE_CREATED	1
-#define DPLL_DEVICE_DELETED	2
-#define DPLL_DEVICE_CHANGED	3
 #define DPLL_PIN_CREATED	4
 #define DPLL_PIN_DELETED	5
 #define DPLL_PIN_CHANGED	6
 
-struct dpll_device_notifier_info {
-	struct dpll_device *dpll;
-	u32 id;
-	u32 idx;
-	u64 clock_id;
-	enum dpll_type type;
-};
-
 struct dpll_pin_notifier_info {
 	struct dpll_pin *pin;
 	u32 id;
-- 
2.56.1


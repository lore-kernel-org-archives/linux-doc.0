Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725190;
	b=RQHhPQf0AwkiV3grxbMArbcDLCsni8SHpMJrTPkaOIexoX3/O3SYd9A057RIECZYiQX6
	 BgkxNgw7RiFhy1yWtHayqtrIjbbQgHRiZtgL2+Ck+7QNZlA3+6eSSItzRWVSkLbZHf+kc
	 YnrulvAC614ppELhMHXOGtz9PXq67PZzqCJpHuH3MWDKvC9b0bKSK+Ed25KzRAn3JhfNy
	 tGYjLoKLqIdJyPOOBELGRBcKVTQi6SPvq8RxzvPb8AZnYw0Yj6VCpoGw6CqZVzCCsjCh8
	 CEOXIq7zvTTO9+Xg0C+nC6Hrtvgj9F09HzjD1H6voK2BiqKHB1jBb0W0VQbuw0QUDSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725190;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=uNjlnFFHs2yc3bElpWQbMGLuA2UYQGFca2rvsSqyvPs=;
	b=vvL3TFqmHWztVeLyBiYwnF4y+yWvy2PPL64jr1BVdXzmH28/P4abTDtKzxqptngprq5S
	 IIYX5Xkw62Q1rh6nTqhIbLhJ7IfNrBOWUsnFMW3wxky4pxQTNc5dXF4BItb4zbIe/ew49
	 uZHoS+PFIwTEyL1k7kBFxrJ63KxQ5qlrSDhv2UmGBJ+VdioBseuq93xYgRBYuizg0UwNg
	 Ay7CWzU++OwHjetIOAtVzq35FAb1w/E+CfeYVXM4v5BdnIXJvjzSXjb7nUKjp+dfc5PJI
	 lc2iBZ1UqR9MXMjJNoSYJJV46zVDNvJ/n75npMBGiBcS4bvZUJFPbUf1pB02MIWLsCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BCCvHWkS;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59420606A329
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59420606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BCCvHWkS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNjlnFFHs2yc3bElpWQbMGLuA2UYQGFca2rvsSqyvPs=;
	b=BCCvHWkSOgFcTtWt216dChGQw9D30C7+Cb5rFKcTmxf4vtPmD0jmYgfZsLx1AzjfJ8BgEW
	8Bms8UV2p7Uy5K8Kkmhl9gTkLtKJkrKiKaJU/xOU84nyOP8Rx3Thb2JFCEWMRvG0hnqsnV
	+XSSQqob8p1wbAlbZLJ57H63uyXAB3g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-GKHbczCUNMyitkn9CvFwZQ-1; Thu,
 26 Nov 2026 20:33:04 +0000
X-MC-Unique: GKHbczCUNMyitkn9CvFwZQ-1
X-Mimecast-MFC-AGG-ID: GKHbczCUNMyitkn9CvFwZQ_1795725181
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 244261800620;
	Thu, 26 Nov 2026 20:33:01 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E36641801977;
	Thu, 26 Nov 2026 20:32:54 +0000 (UTC)
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
Subject: [PATCH RFC net-next 03/19] dpll: notify linked pins when a pin is registered or unregistered
Date: Thu, 26 Nov 2026 21:32:15 +0100
Message-ID: <20261126203231.934632-4-ivecera@redhat.com>
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

A link is reported only while the pins at both ends are registered. When
a pin gets its first registration or loses its last one, send a change
notification for every registered pin linked with it, so user space sees
the link appear and disappear at both ends.

The notifications follow the registration of the pin. A link also
disappears from the report when the last registered dpll device of
the pin goes away, so a pin with a link or a firmware node has to be
unregistered before its dpll devices, as zl3073x and ice do. The
documentation says so.

The notifications are sent from one helper, under dpll_lock like the
other notifications. The message about a linked pin is built with the
callbacks of its owner, also when another driver registers the pin at
the other end.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 Documentation/driver-api/dpll.rst |  6 ++++++
 drivers/dpll/dpll_core.c          | 24 ++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
index aed92693d9e604..7b083a59f0122d 100644
--- a/Documentation/driver-api/dpll.rst
+++ b/Documentation/driver-api/dpll.rst
@@ -370,6 +370,12 @@ each of them with the id of the pin at the other end:
     ``DPLL_A_PIN_ID``            id of the pin at the other end
   ============================== ==========================================
 
+When a pin gets its first registration or loses its last one, the
+subsystem sends ``DPLL_CMD_PIN_CHANGE_NTF`` for the registered pins
+linked with it. A pin with a link or a firmware node has to be
+unregistered before the dpll devices it is registered with, otherwise
+its links disappear without a notification.
+
 For example, an output of a DPLL chip wired to an input of a network
 controller::
 
diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 6c61801a293b7e..58a5a4a41a0b72 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -929,10 +929,30 @@ int dpll_pin_link_add(struct dpll_pin *pin, struct fwnode_handle *peer)
 }
 EXPORT_SYMBOL_GPL(dpll_pin_link_add);
 
+/**
+ * dpll_pin_links_ntf - notify the pins linked with a pin
+ * @pin: pin that was registered or unregistered
+ *
+ * A link is reported only while the pins at both ends are registered, so
+ * send a change notification for every registered pin linked with @pin.
+ */
+static void dpll_pin_links_ntf(struct dpll_pin *pin)
+{
+	struct dpll_pin *pos;
+	unsigned long i;
+
+	if (list_empty(&pin->links) && !pin->fwnode)
+		return;
+	xa_for_each_marked(&dpll_pin_xa, i, pos, DPLL_REGISTERED)
+		if (pos != pin && dpll_pins_linked(pin, pos))
+			__dpll_pin_change_ntf(pos);
+}
+
 static int
 __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
 		    const struct dpll_pin_ops *ops, void *priv, void *cookie)
 {
+	bool registered;
 	int ret;
 
 	ret = dpll_xa_ref_pin_add(&dpll->pin_refs, pin, ops, priv, cookie);
@@ -941,8 +961,11 @@ __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
 	ret = dpll_xa_ref_dpll_add(&pin->dpll_refs, dpll, ops, priv, cookie);
 	if (ret)
 		goto ref_pin_del;
+	registered = xa_get_mark(&dpll_pin_xa, pin->id, DPLL_REGISTERED);
 	xa_set_mark(&dpll_pin_xa, pin->id, DPLL_REGISTERED);
 	dpll_pin_create_ntf(pin, dpll->clock_id);
+	if (!registered)
+		dpll_pin_links_ntf(pin);
 
 	return ret;
 
@@ -1035,6 +1058,7 @@ __dpll_pin_unregister(struct dpll_device *dpll, struct dpll_pin *pin,
 	if (xa_empty(&pin->dpll_refs)) {
 		dpll_pin_ref_sync_pair_del(pin->id);
 		xa_clear_mark(&dpll_pin_xa, pin->id, DPLL_REGISTERED);
+		dpll_pin_links_ntf(pin);
 	}
 }
 
-- 
2.56.1


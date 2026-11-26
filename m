Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725175;
	b=ILTao1ly7l23yDy4q0KLYU9AytpJfLavdOm+/E/au/c7//WB9p9wrsJCbdDchySAC4Jp
	 Kp1iAKG+u6Uec9HguRZZgOeHR44+7Kpj0tvX/7xxdkVXneV0iMqEUyFxYCo/0F7/mh0MJ
	 8l05o+uOQuJXi/xBJmNKsGtW5UmeUXKNPnW+Pg1Rl7CxAjcErTVhBukInQ4sBZAMj2Bpf
	 NRSL/aMCEUsa2L9mZEnQFCegM882aaWgSp6cPPZhgMOazQdOLY1jkqWoFKXqA2RAnmN7e
	 s4s/aHR8QLwHykBFxW/C0q/yFaNw3Klq4gQxG22VmpwU4cm43IUkTwAJdiT4FvP9ekw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725175;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=NIxE4m8l1izRwK6ahSUGuo2vdx0Q2NKrDP6SB3rfqu0=;
	b=X0L/XIWJnjgw8+1pgzPNyuw2nJNsiMUJeeTT8YAiXnB0M1QzgS7c3ITB4AzM+1CmFvL6
	 wun9RVrSCO68WRN6DXHRH7+H3uWLx/gs+pMZnnOaE506RWYz7avW6O/uwkt05V8u0frWa
	 0FPjrC0h3V875cpMEGF1U83etn72Dvh3XnMdKttmjXrDhuGiC0U2UYNUaxs1h2p0Vr4Rs
	 /HbB7xKqHsntUGmfms36Vxn7tAoKXTNlQHNRuSbQU2+AuUaVvKSCq500js8jyBIin1goO
	 0/0sjIiIIDfyuJv665rbthOhOk57BB9pRyZOMM8h86jnNZgcIlbaGx2GGt+NjkfDDfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gtZ4cY0Z;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D5606A32F
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C6D5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gtZ4cY0Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIxE4m8l1izRwK6ahSUGuo2vdx0Q2NKrDP6SB3rfqu0=;
	b=gtZ4cY0ZOee5Qi2tzml+KEzbiN7T9XTeGYD0NEkeTco8d5XA/NKIlH+EX5QWD+hpSl8nrg
	0olAOcr4ZCcS2cmn3XE9L4chycOyghAaAMh7rGag0V2E//1FvJAv/Ce4naOHkBhvlAa8Gc
	8sbzRMAiEchk99LY3FiwlD7f6Nb7oFk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-wPBfipf-POCTfNY6iEcjow-1; Thu,
 26 Nov 2026 20:32:50 +0000
X-MC-Unique: wPBfipf-POCTfNY6iEcjow-1
X-Mimecast-MFC-AGG-ID: wPBfipf-POCTfNY6iEcjow_1795725168
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D032180057E;
	Thu, 26 Nov 2026 20:32:47 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD006180197A;
	Thu, 26 Nov 2026 20:32:40 +0000 (UTC)
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
Subject: [PATCH RFC net-next 01/19] dpll: add pin links
Date: Thu, 26 Nov 2026 21:32:13 +0100
Message-ID: <20261126203231.934632-2-ivecera@redhat.com>
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

A pin is a pad of the chip whose driver registers it. When a board wires
a pad of one chip to a pad of another, for example an output of an
external DPLL to the TX reference input of a network controller, a
driver now registers the pin of the other driver with its own DPLL. The
pin then has two owners and a request about it runs callbacks of both
drivers.

Add a link that describes such a wire instead. A driver adds it to its
own pin with dpll_pin_link_add() and names the pin at the other end by
its firmware node, which the driver of that pin sets with
dpll_pin_fwnode_set(). The link holds only the firmware node, so the
driver needs no pointer to a pin of another driver and that pin does not
have to exist yet.

Links are added before the pin is registered and are released together
with the pin. Adding an existing link returns -EEXIST, also on a
registered pin, so each user of a shared pin can add the same link. The
next patch reports links to user space.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/dpll_core.c | 71 ++++++++++++++++++++++++++++++++++++++++
 drivers/dpll/dpll_core.h | 12 +++++++
 include/linux/dpll.h     |  2 ++
 3 files changed, 85 insertions(+)

diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 277692d12d3d1e..4d871542ddf762 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -147,6 +147,16 @@ static void __dpll_pin_hold(struct dpll_pin *pin, dpll_tracker *tracker)
 static void dpll_pin_idx_free(u32 pin_idx);
 static void dpll_pin_prop_free(struct dpll_pin_properties *prop);
 
+static void dpll_pin_links_free(struct dpll_pin *pin)
+{
+	struct dpll_pin_link *link, *tmp;
+
+	list_for_each_entry_safe(link, tmp, &pin->links, list) {
+		fwnode_handle_put(link->peer);
+		kfree(link);
+	}
+}
+
 static void __dpll_pin_put(struct dpll_pin *pin, dpll_tracker *tracker)
 {
 	dpll_pin_tracker_free(pin, tracker);
@@ -155,6 +165,7 @@ static void __dpll_pin_put(struct dpll_pin *pin, dpll_tracker *tracker)
 		xa_destroy(&pin->dpll_refs);
 		xa_destroy(&pin->parent_refs);
 		xa_destroy(&pin->ref_sync_pins);
+		dpll_pin_links_free(pin);
 		dpll_pin_prop_free(&pin->prop);
 		fwnode_handle_put(pin->fwnode);
 		dpll_pin_idx_free(pin->pin_idx);
@@ -665,6 +676,7 @@ dpll_pin_alloc(u64 clock_id, u32 pin_idx, struct module *module,
 	if (ret)
 		goto err_pin_prop;
 	refcount_set(&pin->refcount, 1);
+	INIT_LIST_HEAD(&pin->links);
 	xa_init_flags(&pin->dpll_refs, XA_FLAGS_ALLOC);
 	xa_init_flags(&pin->parent_refs, XA_FLAGS_ALLOC);
 	xa_init_flags(&pin->ref_sync_pins, XA_FLAGS_ALLOC);
@@ -838,6 +850,65 @@ struct dpll_pin *fwnode_dpll_pin_find(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_dpll_pin_find);
 
+static bool dpll_pin_has_link(const struct dpll_pin *pin,
+			      const struct fwnode_handle *peer)
+{
+	struct dpll_pin_link *link;
+
+	list_for_each_entry(link, &pin->links, list)
+		if (link->peer == peer)
+			return true;
+
+	return false;
+}
+
+/**
+ * dpll_pin_link_add - add a link from a pin to another pin
+ * @pin: pointer to a dpll pin
+ * @peer: firmware node of the pin at the other end
+ *
+ * Describe a fixed board connection between @pin and the pin of another
+ * device that its driver associates with @peer by dpll_pin_fwnode_set().
+ * The other pin does not need to exist yet. The link is kept until @pin is
+ * released. An existing link is reported also when @pin is registered, so
+ * each user of a shared pin can add the same link.
+ *
+ * Context: Acquires a lock (dpll_lock). Must be called before @pin is
+ *	    registered.
+ * Return:
+ * * 0 on success
+ * * -EEXIST if @pin already has a link to @peer
+ * * -EBUSY if @pin is already registered
+ * * -ENOMEM if the link cannot be allocated
+ */
+int dpll_pin_link_add(struct dpll_pin *pin, struct fwnode_handle *peer)
+{
+	struct dpll_pin_link *link;
+	int ret = 0;
+
+	mutex_lock(&dpll_lock);
+	if (dpll_pin_has_link(pin, peer)) {
+		ret = -EEXIST;
+		goto unlock;
+	}
+	if (WARN_ON(xa_get_mark(&dpll_pin_xa, pin->id, DPLL_REGISTERED))) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+	link = kzalloc_obj(*link);
+	if (!link) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+	link->peer = fwnode_handle_get(peer);
+	list_add_tail(&link->list, &pin->links);
+unlock:
+	mutex_unlock(&dpll_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dpll_pin_link_add);
+
 static int
 __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
 		    const struct dpll_pin_ops *ops, void *priv, void *cookie)
diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
index da8a369556ed11..26a16df2b6410d 100644
--- a/drivers/dpll/dpll_core.h
+++ b/drivers/dpll/dpll_core.h
@@ -47,6 +47,7 @@ struct dpll_device {
  * @module:		module of creator
  * @module_name:	module name of creator
  * @fwnode:		optional reference to firmware node
+ * @links:		links to other pins (struct dpll_pin_link)
  * @dpll_refs:		hold referencees to dplls pin was registered with
  * @parent_refs:	hold references to parent pins pin was registered with
  * @ref_sync_pins:	hold references to pins for Reference SYNC feature
@@ -62,6 +63,7 @@ struct dpll_pin {
 	struct module *module;
 	char module_name[MODULE_NAME_LEN];
 	struct fwnode_handle *fwnode;
+	struct list_head links;
 	struct xarray dpll_refs;
 	struct xarray parent_refs;
 	struct xarray ref_sync_pins;
@@ -71,6 +73,16 @@ struct dpll_pin {
 	struct rcu_head rcu;
 };
 
+/**
+ * struct dpll_pin_link - wire between a pin and another pin
+ * @list:		entry in the links list of the pin
+ * @peer:		firmware node of the pin at the other end
+ **/
+struct dpll_pin_link {
+	struct list_head list;
+	struct fwnode_handle *peer;
+};
+
 /**
  * struct dpll_pin_ref - structure for referencing either dpll or pins
  * @dpll:		pointer to a dpll
diff --git a/include/linux/dpll.h b/include/linux/dpll.h
index 7a6f8796cda2ad..e252d3c6b4334a 100644
--- a/include/linux/dpll.h
+++ b/include/linux/dpll.h
@@ -301,6 +301,8 @@ void dpll_pin_put(struct dpll_pin *pin, dpll_tracker *tracker);
 
 void dpll_pin_fwnode_set(struct dpll_pin *pin, struct fwnode_handle *fwnode);
 
+int dpll_pin_link_add(struct dpll_pin *pin, struct fwnode_handle *peer);
+
 int dpll_pin_on_pin_register(struct dpll_pin *parent, struct dpll_pin *pin,
 			     const struct dpll_pin_ops *ops, void *priv);
 
-- 
2.56.1


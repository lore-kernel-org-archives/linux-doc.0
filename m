Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725184;
	b=VrO5CQ7LwR/z7B5KtyIrFihSjW1xKzrvJdNRkhxpPeF8d2QsDh+UtWUz9IwjancaIhzA
	 lB8G/z0om1ZlPxLz4eZuqLNUqdD/lWCqz+mAzgTX8c4FWka6n4mPBCgpSD+5lDzag6iqZ
	 T3lcJCxOY66RmA43tfGP6Qb/UlLkcCCumjTNc40DCNu7un2hZxPg+MX+1S5WlhpIGwcq/
	 SUQM3FxyXhLhQEvp6VzHok2eJ71qdoFNJKG4a1kxAUEgHhZn6XgZCADiDXpywvZUzVcGW
	 LpngnW6pFwBasdKu6rmIA9d4SXiy+e4MGsxJ9qJSebKMJkF6VzHwkLSR/2LMtw95N0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725184;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=uL3GKmxXgacpEmcqCBB9fDe9Sv8DBeIPEmj7m/Vwq5Y=;
	b=z/2bL/N6az4P+ncYhPc2WBi3I/Sb0jb/8wDbKchQs8QRJHnipw+4FRknlkydOfwsAgTr
	 f6MiqxspuJJOXJh/8E0fefcoe24ihZ9eoSvAaCRDcNvE32MVCm2g+jYpWIJq9DfGrczp2
	 9K0wH0iHPUo71o8NCMyyuDM1EMZneKpV2AxWVmbyW+QN/JAVMlrGhDujTFYeUjIj583rY
	 JhNXpSGUfbd5x7/61bJPrBVeh88E1TkT9IfkAGXPplORC2xCNO0VjUA+QXNtAvikq7VZ6
	 6tj1914i75Q+2I4t0sCGMnRbVLGUy4jvwfmDfRvPp28lAKfmZWLm1pIdANgKZJ7n9cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MPWyWnSW;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C559B606A330
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C559B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MPWyWnSW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uL3GKmxXgacpEmcqCBB9fDe9Sv8DBeIPEmj7m/Vwq5Y=;
	b=MPWyWnSW/2Jd3H04XnhZlvScfB7MGsm1F2xs+COTrqUzTUeOZeBN71uR695EJ+yPku8Hzo
	bAP6bgpVBEsXZNnhSDahBGyw4a1OUuumLCKuMkH1XIyCzjNLDMcsBVbiwfybWuQ8obQpbU
	/4Cc5sq9G42DvsDQRLrxndPYyceBsrQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-c7tyOwM-N32_YXMsqgzQJQ-1; Thu,
 26 Nov 2026 20:32:57 +0000
X-MC-Unique: c7tyOwM-N32_YXMsqgzQJQ-1
X-Mimecast-MFC-AGG-ID: c7tyOwM-N32_YXMsqgzQJQ_1795725174
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82345195605B;
	Thu, 26 Nov 2026 20:32:54 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B888D180197D;
	Thu, 26 Nov 2026 20:32:47 +0000 (UTC)
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
Subject: [PATCH RFC net-next 02/19] dpll: report pin links
Date: Thu, 26 Nov 2026 21:32:14 +0100
Message-ID: <20261126203231.934632-3-ivecera@redhat.com>
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

Report the links of a pin in pin-get with a new multi-attr nest
DPLL_A_PIN_LINK, which carries the id of the pin at the other end. The
link is reported for both pins, the one that has it and the one whose
firmware node it names, and only while both of them are registered.

DPLL_A_PIN_LINK is a nest rather than a repeated u32, so that
attributes of a link, for example the delay of the board trace, can
be added later. The message layout is uAPI, so a flat u32 could not
be extended.

Links name a pin by its firmware node, so dpll_pin_fwnode_set() now
refuses to change the node of a registered pin, which would change
the reported links without a notification. Setting the same node
again, as zl3073x does for each of its DPLLs, still works.

Pins with no links and no firmware node are not affected.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 Documentation/driver-api/dpll.rst     | 38 +++++++++++++++++++++++++++
 Documentation/netlink/specs/dpll.yaml | 15 +++++++++++
 drivers/dpll/dpll_core.c              | 26 +++++++++++++++---
 drivers/dpll/dpll_core.h              |  1 +
 drivers/dpll/dpll_netlink.c           | 30 ++++++++++++++++++++-
 include/uapi/linux/dpll.h             |  1 +
 6 files changed, 107 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
index 7c117ae37cc1bc..aed92693d9e604 100644
--- a/Documentation/driver-api/dpll.rst
+++ b/Documentation/driver-api/dpll.rst
@@ -350,6 +350,41 @@ bound to only one other pin at any given time.
     ``DPLL_A_PIN_STATE``         state of Reference SYNC connection
   ============================== ==========================================
 
+Pin links
+=========
+
+A pin represents a pad of the device whose driver registers it. When the
+board connects a pad of one device to a pad of another one, for example an
+output of a DPLL chip to a reference clock input of a network controller,
+the driver of one of them describes the connection with
+dpll_pin_link_add() on its own pin. The link names the pin at the other
+end by its firmware node, which the driver of that pin sets with
+dpll_pin_fwnode_set(). Each driver registers only its own pins and the
+drivers may probe in any order.
+
+While both pins are registered, ``DPLL_CMD_PIN_GET`` reports the link for
+each of them with the id of the pin at the other end:
+
+  ============================== ==========================================
+  ``DPLL_A_PIN_LINK``            nested attribute for each linked pin
+    ``DPLL_A_PIN_ID``            id of the pin at the other end
+  ============================== ==========================================
+
+For example, an output of a DPLL chip wired to an input of a network
+controller::
+
+        'pin': [{
+          'id': 7,
+          'module-name': 'zl3073x',
+          'parent-device': [{'parent-id': 0, 'direction': 'output', ...}],
+          'link': [{'id': 21}]
+          }, {
+          'id': 21,
+          'module-name': 'ice',
+          'parent-device': [{'parent-id': 5, 'direction': 'input', ...}],
+          'link': [{'id': 7}]
+          }]
+
 Configuration commands group
 ============================
 
@@ -467,6 +502,9 @@ according to attribute purpose.
     ``DPLL_A_PIN_CAPABILITIES``        attr bitmask of pin capabilities
     ``DPLL_A_PIN_MEASURED_FREQUENCY``  attr measured frequency of
                                        an input pin in mHz
+    ``DPLL_A_PIN_LINK``                nested attr for each pin linked
+                                       with the pin
+      ``DPLL_A_PIN_ID``                attr id of the linked pin
   ==================================== ==================================
 
   ==================================== =================================
diff --git a/Documentation/netlink/specs/dpll.yaml b/Documentation/netlink/specs/dpll.yaml
index 8fa789a502732a..c81e4dbe65d73e 100644
--- a/Documentation/netlink/specs/dpll.yaml
+++ b/Documentation/netlink/specs/dpll.yaml
@@ -542,6 +542,14 @@ attribute-sets:
           Operational state of the pin with respect to its parent DPLL
           device. Unlike state (which reflects the administrative intent),
           operstate reflects the actual hardware status.
+      -
+        name: link
+        type: nest
+        multi-attr: true
+        nested-attributes: pin-link
+        doc: |
+          A pin connected with this pin on the board, usually a pin of
+          another device. Reported while both pins are registered.
 
   -
     name: pin-parent-device
@@ -591,6 +599,12 @@ attribute-sets:
         name: id
       -
         name: state
+  -
+    name: pin-link
+    subset-of: pin
+    attributes:
+      -
+        name: id
 
 operations:
   enum-name: dpll_cmd
@@ -741,6 +755,7 @@ operations:
             - esync-pulse
             - reference-sync
             - measured-frequency
+            - link
 
       dump:
         reply: *pin-attrs
diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 4d871542ddf762..6c61801a293b7e 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -806,13 +806,19 @@ EXPORT_SYMBOL_GPL(dpll_pin_put);
  * @pin: pointer to a dpll pin
  * @fwnode: firmware node handle
  *
- * Set firmware node handle for the given dpll pin.
+ * Set firmware node handle for the given dpll pin. Links name pins by their
+ * firmware node, so the node of a registered pin must not change.
+ *
+ * Context: Acquires a lock (dpll_lock)
  */
 void dpll_pin_fwnode_set(struct dpll_pin *pin, struct fwnode_handle *fwnode)
 {
 	mutex_lock(&dpll_lock);
-	fwnode_handle_put(pin->fwnode); /* Drop fwnode previously set */
-	pin->fwnode = fwnode_handle_get(fwnode);
+	if (pin->fwnode != fwnode &&
+	    !WARN_ON(xa_get_mark(&dpll_pin_xa, pin->id, DPLL_REGISTERED))) {
+		fwnode_handle_put(pin->fwnode); /* Drop fwnode previously set */
+		pin->fwnode = fwnode_handle_get(fwnode);
+	}
 	mutex_unlock(&dpll_lock);
 }
 EXPORT_SYMBOL_GPL(dpll_pin_fwnode_set);
@@ -862,6 +868,20 @@ static bool dpll_pin_has_link(const struct dpll_pin *pin,
 	return false;
 }
 
+/**
+ * dpll_pins_linked - check if two pins are linked
+ * @a: pointer to a dpll pin
+ * @b: pointer to another dpll pin
+ *
+ * Context: Caller must hold dpll_lock.
+ * Return: true if either pin has a link to the firmware node of the other
+ */
+bool dpll_pins_linked(const struct dpll_pin *a, const struct dpll_pin *b)
+{
+	return (b->fwnode && dpll_pin_has_link(a, b->fwnode)) ||
+	       (a->fwnode && dpll_pin_has_link(b, a->fwnode));
+}
+
 /**
  * dpll_pin_link_add - add a link from a pin to another pin
  * @pin: pointer to a dpll pin
diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
index 26a16df2b6410d..f158785bf401b6 100644
--- a/drivers/dpll/dpll_core.h
+++ b/drivers/dpll/dpll_core.h
@@ -108,6 +108,7 @@ struct dpll_device *dpll_device_get_by_id(int id);
 struct dpll_pin_ref *dpll_pin_own_dpll_ref_first(struct dpll_pin *pin);
 const struct dpll_pin_ops *dpll_pin_ops(struct dpll_pin_ref *ref);
 struct dpll_pin_ref *dpll_xa_ref_dpll_first(struct xarray *xa_refs);
+bool dpll_pins_linked(const struct dpll_pin *a, const struct dpll_pin *b);
 extern struct xarray dpll_device_xa;
 extern struct xarray dpll_pin_xa;
 extern struct mutex dpll_lock;
diff --git a/drivers/dpll/dpll_netlink.c b/drivers/dpll/dpll_netlink.c
index e5380d95f238b3..016f3026d2f2e5 100644
--- a/drivers/dpll/dpll_netlink.c
+++ b/drivers/dpll/dpll_netlink.c
@@ -709,6 +709,32 @@ dpll_msg_add_pin_dplls(struct sk_buff *msg, struct dpll_pin *pin,
 	return ret;
 }
 
+static int dpll_msg_add_pin_links(struct sk_buff *msg, struct dpll_pin *pin)
+{
+	struct dpll_pin *pos;
+	struct nlattr *nest;
+	unsigned long i;
+
+	/* Only a pin with links or with a firmware node can be linked */
+	if (list_empty(&pin->links) && !pin->fwnode)
+		return 0;
+	xa_for_each_marked(&dpll_pin_xa, i, pos, DPLL_REGISTERED) {
+		if (pos == pin || !dpll_pins_linked(pin, pos) ||
+		    !dpll_pin_available(pos))
+			continue;
+		nest = nla_nest_start(msg, DPLL_A_PIN_LINK);
+		if (!nest)
+			return -EMSGSIZE;
+		if (nla_put_u32(msg, DPLL_A_PIN_ID, pos->id)) {
+			nla_nest_cancel(msg, nest);
+			return -EMSGSIZE;
+		}
+		nla_nest_end(msg, nest);
+	}
+
+	return 0;
+}
+
 static int
 dpll_cmd_pin_get_one(struct sk_buff *msg, struct dpll_pin *pin,
 		     struct netlink_ext_ack *extack)
@@ -780,8 +806,10 @@ dpll_cmd_pin_get_one(struct sk_buff *msg, struct dpll_pin *pin,
 		ret = dpll_msg_add_pin_dplls(msg, pin, extack);
 	else
 		ret = dpll_msg_add_pin_parents(msg, pin, ref, extack);
+	if (ret)
+		return ret;
 
-	return ret;
+	return dpll_msg_add_pin_links(msg, pin);
 }
 
 static int
diff --git a/include/uapi/linux/dpll.h b/include/uapi/linux/dpll.h
index 8c71fc3f986343..02e9004426f49c 100644
--- a/include/uapi/linux/dpll.h
+++ b/include/uapi/linux/dpll.h
@@ -289,6 +289,7 @@ enum dpll_a_pin {
 	DPLL_A_PIN_FRACTIONAL_FREQUENCY_OFFSET_PPT,
 	DPLL_A_PIN_MEASURED_FREQUENCY,
 	DPLL_A_PIN_OPERSTATE,
+	DPLL_A_PIN_LINK,
 
 	__DPLL_A_PIN_MAX,
 	DPLL_A_PIN_MAX = (__DPLL_A_PIN_MAX - 1)
-- 
2.56.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725285;
	b=U81iC+ji4LEvDC4OtVkESQOwK7AnD8kzjnWGpsoffSacDrB0YLdktb0hkRVn6u7hXAxV
	 J/PBqOFS62wbXgdsPAzoM0GL97fmMLYiP99gyz4i4oihnrKen0UV9LjXMaZYwC0imakcf
	 zB+sawNb8iPThu0e41mIx1eP6n3JtWB+/UdqV2Tk4MASTLjjiFaNZq9AQ9/6nwj4EeKpN
	 l3gniwzwYzBZuIiiCwFLbNNi+Kh/0xMd6nw4DYM/ySERHRJ5vFCMjdFNVWCNh09NuTtPZ
	 xPtJ4kzQLbgF4x29Q84r2fo0yZjLOa0suCIGdUZbjgTTsRTlgyiyvEVqQxjYjTXvTKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725285;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=GuGdWNAUUamhyAvRSygUN7vwSXLvTQpL3xsjy8x1md8=;
	b=Fe5m56UmFgjoIJeApaPd251xnpA7BY6SAcZWLwAc41zyI8kHc5KiOZvVavz+3QUklN01
	 Z6hH/mwFigBLWpjuVFUQjP35lYq2y/e5MLbJSmbA+s7ih1ALSiMgfzaX8znxWqawCW6fi
	 Hn5VFg6emZmiTHXSq3yIZVkfsfilqx8gQXQyIuqRfVcZlt2r5mzZXsKkvxWMYOFDKae8k
	 PL/wUp4cU8++nvsZ773avYuVuBfGy460eyef+63k/RSxNLZGNXAgAHw9IOmAZ+mbHwVus
	 fvewmWrmIfJ70tOwnNhyR+nJUKBVd9JDvYtcxrGYK+N6PSoDMuB803U3HoBFo+FKekg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VyGjngbg;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE2F606A32E
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDE2F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VyGjngbg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GuGdWNAUUamhyAvRSygUN7vwSXLvTQpL3xsjy8x1md8=;
	b=VyGjngbgtdr/znNcylUif0dAny+inI4mIfjOfkf1yFti5qi4k+Low153Hie6ugyNXBGMOu
	jQjFug9ksF+XKERpEpWMdJSsvomYcDIAuo4dWQ1RYnOmNt1KtJ4XgKFoA9i3c1qNgEoJ1t
	bygLYdRTmI62xv8L0HdllEkm48+2ABM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-SRtIgN-oM0KY7fSWuT2aaA-1; Thu,
 26 Nov 2026 20:34:38 +0000
X-MC-Unique: SRtIgN-oM0KY7fSWuT2aaA-1
X-Mimecast-MFC-AGG-ID: SRtIgN-oM0KY7fSWuT2aaA_1795725275
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB9D8195604C;
	Thu, 26 Nov 2026 20:34:35 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8E6B81801971;
	Thu, 26 Nov 2026 20:34:29 +0000 (UTC)
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
Subject: [PATCH RFC net-next 17/19] dpll: require a registered DPLL for pin registration
Date: Thu, 26 Nov 2026 21:32:29 +0100
Message-ID: <20261126203231.934632-18-ivecera@redhat.com>
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

Since commit 33f016b23a21 ("dpll: fix NULL deref in dpll_device_ops()
during teardown race"), dpll_pin_register() accepts a DPLL without
registrations unless the pin has measured_freq_get, and
dpll_pin_on_pin_register() registers a pin with the DPLLs of the parent
pin without a check.

The drivers register a DPLL before its pins. Reject a DPLL that is not
registered in dpll_pin_register() before its ops are requested, and a
parent pin with such a DPLL in dpll_pin_on_pin_register(), and document
the order.

The pin paths keep the tolerance for a DPLL without registrations from
that commit. On E810, ice registers the recovered clock pin of a PF
without the CGU under the input pins of the PF with the CGU, and so with
its DPLLs. The pin stays registered with them when that PF goes first.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 Documentation/driver-api/dpll.rst |  2 ++
 drivers/dpll/dpll_core.c          | 17 +++++++++++++----
 2 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
index bc34fc83882fac..75ebed0bb95e96 100644
--- a/Documentation/driver-api/dpll.rst
+++ b/Documentation/driver-api/dpll.rst
@@ -634,6 +634,8 @@ of pin callbacks, and private data pointer for calling them:
 - dpll_pin_register() - register pin with a dpll device,
 - dpll_pin_on_pin_register() - register pin with another MUX type pin.
 
+A dpll device is registered before its pins.
+
 Notifications of adding or removing dpll devices are created within
 subsystem itself.
 Notifications about registering/deregistering pins are also invoked by
diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index e199342652d163..af61c4882c2b6f 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -925,7 +925,7 @@ __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
  * @priv: pointer to private information of owner
  *
  * The @dpll and the @pin must have the same owner, they must be created with
- * the same module and clock_id.
+ * the same module and clock_id. The @dpll must be registered.
  *
  * Context: Acquires a lock (dpll_lock)
  * Return:
@@ -951,9 +951,13 @@ dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
 
 	mutex_lock(&dpll_lock);
 
+	if (ASSERT_DPLL_REGISTERED(dpll)) {
+		ret = -EINVAL;
+		goto out_unlock;
+	}
 	dev_ops = dpll_device_ops(dpll);
 	if (WARN_ON(ops->measured_freq_get &&
-		    (!dev_ops || !dev_ops->freq_monitor_get ||
+		    (!dev_ops->freq_monitor_get ||
 		     !dev_ops->freq_monitor_set))) {
 		ret = -EINVAL;
 		goto out_unlock;
@@ -1039,7 +1043,8 @@ EXPORT_SYMBOL_GPL(dpll_pin_unregister);
  * Register a pin with a parent pin, create references between them and
  * between newly registered pin and dplls connected with a parent pin.
  * The @parent and the @pin must have the same owner, they must be created
- * with the same module and clock_id.
+ * with the same module and clock_id. The dpll devices of the @parent must
+ * be registered.
  *
  * Context: Acquires a lock (dpll_lock)
  * Return:
@@ -1073,7 +1078,11 @@ int dpll_pin_on_pin_register(struct dpll_pin *parent, struct dpll_pin *pin,
 	if (ret)
 		goto unlock;
 	xa_for_each(&parent->dpll_refs, i, ref) {
-		ret = __dpll_pin_register(ref->dpll, pin, ops, priv, parent);
+		if (ASSERT_DPLL_REGISTERED(ref->dpll))
+			ret = -EINVAL;
+		else
+			ret = __dpll_pin_register(ref->dpll, pin, ops, priv,
+						  parent);
 		if (ret) {
 			stop = i;
 			goto dpll_unregister;
-- 
2.56.1


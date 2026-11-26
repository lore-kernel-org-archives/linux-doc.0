Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725218;
	b=DOnRUk+MONbCrpNnWEoMP0ISUxNgfYNaknU33/2U4+/5XBMSXAE38KTIq+/bYg2dtFC0
	 B5WX+VC9yu8hFCjDf3s5CEDVDM+EBkXXMfZLcXMHzlENKe6oTqqLvF7Y0+6JEDZKSLZSL
	 dnPWgRA2TW51305qfNjyhF+0v8vRdw9L0TF5MBfvHm2iqV2p4K7UwUaOQHGK6REGexgrw
	 V1paSH/yUxP6OJJEoLMpxl69/fzaiMktRqnr6MeqRHmpT1fLKRm7luU6ATvh0GZTMlxw5
	 O4FumD15tyVNNSD986xTX3MY2tNe0UWTyvMM7bG0Jsq9kdNcO7Nr/FBi6D82HWuuI0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725218;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=YNczEMn85iEzJ9tHP2sIt8DhX+H62qmfbpLilMNh1DQ=;
	b=fhm5nf6RTkubwz842Uu3hcwRFHJZKu0AkC9zmntRSXZixxTKUqzjpAH98oyrh7BMGcD1
	 RsG+HWwnTwTm742M2fKnBJUt3Y9wwQst9L/V/J3o+2ldYItLWsrDIIcQM98iortQ5m8uC
	 L67h/cUK7HMfK7rZDgbRMSRTR5mE4mJIVmo4lCi2zOa4n+7umsC+cTnjQl5Fvl/LWXWC7
	 v07x17nu9nmDgIof5WYpSh6m121Tb1aErKwyAWRLSGT7Ritj/h96slv2yLsC55pzTVcBJ
	 iyg+oPWwRUqJWuMDGrylA70t7TCClGlAfgkpzkDLJAIWhRVNprKa1pRBekt6/CULnjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WPPuXB+F;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C43606A330
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5C43606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WPPuXB+F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YNczEMn85iEzJ9tHP2sIt8DhX+H62qmfbpLilMNh1DQ=;
	b=WPPuXB+F/swo9r7z/rRxhjj1g/+0cE7kekKIESutThrRmxVykGdYrQDWxDemjJ5iXJRFfV
	vqSC04AkkzAxBcd+m6TDMGLoZRycey5ZIRwuSt/g7Z6+gtt8mENsDDjvyAnZ+1zijzJ5MS
	nJFOevgAG/mEGAE95GZXysjXTsnP3bU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-C6c1jGXPN4mtFHbqkoWlpQ-1; Thu,
 26 Nov 2026 20:33:31 +0000
X-MC-Unique: C6c1jGXPN4mtFHbqkoWlpQ-1
X-Mimecast-MFC-AGG-ID: C6c1jGXPN4mtFHbqkoWlpQ_1795725208
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93432195605F;
	Thu, 26 Nov 2026 20:33:28 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 037F51801A6D;
	Thu, 26 Nov 2026 20:33:21 +0000 (UTC)
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
Subject: [PATCH RFC net-next 07/19] dpll: register pins only with a DPLL of their owner
Date: Thu, 26 Nov 2026 21:32:19 +0100
Message-ID: <20261126203231.934632-8-ivecera@redhat.com>
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

Commit c191b319f208 ("dpll: allow registering FW-identified pin with a
different DPLL") allowed a pin with a firmware node to be registered
with a DPLL of another owner. Its only user was ice on E825, which now
links its own pins with the zl3073x pins instead.

Require the same owner for every pin again and document the rule.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 Documentation/driver-api/dpll.rst |  8 ++++++--
 drivers/dpll/dpll_core.c          | 12 ++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/dpll.rst b/Documentation/driver-api/dpll.rst
index 7b083a59f0122d..90c88fcf21b385 100644
--- a/Documentation/driver-api/dpll.rst
+++ b/Documentation/driver-api/dpll.rst
@@ -350,8 +350,12 @@ bound to only one other pin at any given time.
     ``DPLL_A_PIN_STATE``         state of Reference SYNC connection
   ============================== ==========================================
 
-Pin links
-=========
+Pin ownership and links
+=======================
+
+The owner of a dpll device or a pin is identified by the module and the
+clock_id passed to dpll_device_get() or dpll_pin_get(). dpll_pin_register()
+accepts only a dpll device of the same owner as the pin.
 
 A pin represents a pad of the device whose driver registers it. When the
 board connects a pad of one device to a pad of another one, for example an
diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 7fd84b0e90e993..57eb4ff2c320e5 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -983,6 +983,9 @@ __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
  * @ops: ops for a dpll pin ops
  * @priv: pointer to private information of owner
  *
+ * The @dpll and the @pin must have the same owner, they must be created with
+ * the same module and clock_id.
+ *
  * Context: Acquires a lock (dpll_lock)
  * Return:
  * * 0 on success
@@ -1015,13 +1018,10 @@ dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
 		goto out_unlock;
 	}
 
-	/*
-	 * For pins identified via firmware (pin->fwnode), allow registration
-	 * even if the pin's (module, clock_id) differs from the target DPLL.
-	 * For non-fwnode pins, require a strict (module, clock_id) match.
+	/* A pin of another owner is connected by a link, see
+	 * dpll_pin_link_add().
 	 */
-	if (!pin->fwnode &&
-	    WARN_ON_ONCE(dpll->module != pin->module ||
+	if (WARN_ON_ONCE(dpll->module != pin->module ||
 			 dpll->clock_id != pin->clock_id)) {
 		ret = -EINVAL;
 		goto out_unlock;
-- 
2.56.1


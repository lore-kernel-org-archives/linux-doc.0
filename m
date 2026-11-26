Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725212;
	b=DBpoHVLJB+Dnr5zZfOzhS4udt+NH1MLov17DGHp1paAyHhXV0vzNhlE5ZWHBqh037wzc
	 +Em/n9KjsqVaIL9r7N4T2OSI+Y7DNjrmiYkRLt3rsEFUZFvv34rjrLH7ozB+3w2uKu3q0
	 WqxZ6uomMc/nTh+ZhJi+Aqg3DgYpdS4lNDlTvRq7umBxiw4Jnw+MNqMby+sZ59BVDNXU0
	 +VX/0Ud1Jlue5dIGRKGPkG/yc7alPQEMF6VchDQT/tsG+3l+htFJzUYLX7FliDyk0f+f5
	 eNyVeOQ054AEFCFs+PZ5iRT/Zia7/DRec2Anw+TYSE6nZMgHS+Q+kQYzjZx75x5pwMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725212;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=gC34gMSRS9jwecTckCv4gD5v5wmtn6vJzIZIyuuibwc=;
	b=FmmauArqbZD7K2pV4R6TtX6M+B6bMoTYevrQJdmsmYzbInDtwq0xqtWBRloEQononRVN
	 glHJJovVMeY3o6g/TDYAzU9o2+8BZ1PaeUaKfniQVP6oTgAI2Wwk0samgTxAKgOL9/ve0
	 ORzrS1tln+G+PzSKthyr+bgAcHGEIX1tZ3FuWo6kzCHLOI7v/xmFXUQ4fjqu5BfiBLuBM
	 rTcNIu3MEeXw62PVZeJQglMenERd4X3gqG2r3jaM8uag2y3Bk2YcVxjMNkIr+1N7Pljb/
	 ijSqO44Dpuwa9+RKKcHnbyPpFUTfgWWAiJn+aK3f1S8JYEqCP9SJ06g3qLBv7aXcYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LC1E48ky;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E562606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 20:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E562606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=LC1E48ky
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gC34gMSRS9jwecTckCv4gD5v5wmtn6vJzIZIyuuibwc=;
	b=LC1E48ky2oTjN6ygQo1Nlkoyr3uEZwCUkr+99kUId+6kMJUqXuuwVGybSkNUJjIw7uPuDO
	Iwjm2cYm8v9QZG8rmhH+56ugn17NuTcwoYATyg1hNMZtUvjwCZvDfulLujxP4Q6YJIXj5W
	THABYprd1qmLAfcUt1QhDpTQMCPg/0k=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-FKiK85zXP4G6HzIpTEhQxQ-1; Thu,
 26 Nov 2026 20:33:26 +0000
X-MC-Unique: FKiK85zXP4G6HzIpTEhQxQ-1
X-Mimecast-MFC-AGG-ID: FKiK85zXP4G6HzIpTEhQxQ_1795725202
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 95C6319560B2;
	Thu, 26 Nov 2026 20:33:21 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 377521801977;
	Thu, 26 Nov 2026 20:33:15 +0000 (UTC)
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
Subject: [PATCH RFC net-next 06/19] ice: dpll: drop the filter of notifications from own registrations
Date: Thu, 26 Nov 2026 21:32:18 +0100
Message-ID: <20261126203231.934632-7-ivecera@redhat.com>
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

ice_dpll_pin_notify() ignored the pin notifications that the driver
itself caused when it registered the zl3073x pins with its TXC and
TSPLL DPLLs. The driver does not do that any more, and the recovered
clock pin that it registers under a zl3073x pin has no firmware node,
so no notification caused by the driver matches a watched firmware
node. Remove the filter.

Tested on a GNR-D platform with a dual NAC E825 and a ZL80132B DPLL,
with the rest of the series.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/net/ethernet/intel/ice/ice_dpll.c | 34 -----------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
index 15b5f4a15af915..ccbe34abf74661 100644
--- a/drivers/net/ethernet/intel/ice/ice_dpll.c
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
@@ -3098,32 +3098,6 @@ static u64 ice_generate_dpll_clock_id(struct ice_pf *pf, struct ice_dpll *d,
 	return pf->dplls.clock_id;
 }
 
-/**
- * ice_dpll_is_own_dpll_clock_id - check if clock_id belongs to this pf's DPLLs
- * @pf: board private structure
- * @clock_id: clock_id from a DPLL notification
- *
- * Match info->src_clock_id from a DPLL pin notification against any DPLL
- * device this PF has registered. Used to suppress self-notifications
- * generated as a side effect of our own dpll_pin_register() and
- * dpll_pin_unregister() calls on the fwnode-backed SYNCE and TIME_REF pins,
- * whose DPLLs (TXC and TSPLL) use MAC-derived clock_ids on E825.
- *
- * Return: true if clock_id matches one of this PF's registered DPLL devices.
- */
-static bool ice_dpll_is_own_dpll_clock_id(struct ice_pf *pf, u64 clock_id)
-{
-	if (clock_id == pf->dplls.clock_id)
-		return true;
-	if (pf->hw.mac_type != ICE_MAC_GENERIC_3K_E825)
-		return false;
-	if (clock_id == ice_generate_dpll_clock_id(pf, &pf->dplls.txc,
-						   DPLL_TYPE_GENERIC))
-		return true;
-	return clock_id == ice_generate_dpll_clock_id(pf, &pf->dplls.tspll,
-						      DPLL_TYPE_GENERIC);
-}
-
 /**
  * ice_dpll_pin_ntf - notify pin change including any SW pin wrappers
  * @dplls: pointer to dplls struct
@@ -3877,14 +3851,6 @@ static int ice_dpll_pin_notify(struct notifier_block *nb, unsigned long action,
 	if (pin->fwnode != info->fwnode)
 		return NOTIFY_DONE; /* Not this pin */
 
-	/* Ignore notifications that are a side effect of internal pin
-	 * registration/unregistration calls. E825 uses per-device
-	 * MAC-derived clock_ids for the TXC and TSPLL generic DPLLs, so
-	 * info->src_clock_id may not equal pf->dplls.clock_id.
-	 */
-	if (ice_dpll_is_own_dpll_clock_id(pin->pf, info->src_clock_id))
-		return NOTIFY_DONE;
-
 	work = kzalloc_obj(*work);
 	if (!work)
 		return NOTIFY_DONE;
-- 
2.56.1


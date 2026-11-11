Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415286;
	b=jU9f1Y44LXaxxyqKVfW1MsjJq2jF1Dm2OE19ux1XVjsaJ/ypEIqqKkcZVDkznxkPCeGb
	 RZrIS125R3XpDWvemxvuaAHrZw4N1BbuyX6Xbdfs1E32/eEeQcmHDTr1MUjSebp4wg+BV
	 wOYF2lkHCjzrAkjYt5NY/6hSLDqsv6ZNrKNqZCGxM7KWt3KdgPbYBUeXeezI5su1YMhQm
	 VIBeRg5AEA8ia4inwoTtG20nae+g+16LfTojKuNfEHQ8rYavcqJp3kDxqnUAcPo0Y6yh8
	 +3wk1UIP4FYE34SrNIJ/T+XPezR0P8MOAP6z2Qydk0ALHCQtlRSPg8iJtvYBSNXmAOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415286;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=NX9FKH6K+UEomRB8px05FQHC/CI9W13+rfvS8/4IDW0=;
	b=hU6MjgkTUc3N/7UNHQYm8GeaVXa8bexpns4be9tc0+be+yCIUlcEVpkzn9ZJ8wqgMUTs
	 dl2heJM60aBaIP55WNaSIUsVbvTP9i1AZqJ0KB17E8wr0VXXZO5n67pG0HIM371GuUb0A
	 cRs+CeaeR0i0oPrMHoLUUh24G9U4zRlKFIsFKtueO6hMlI5Fh8VklLzX3UGbgaAZSubmC
	 V99N4N3FEvyK09Rbrpi1l16ORhgcFdxaINfWGF397NFA0oMwNAwWqkgA9swuhc4o8EBCB
	 9LbZNdrtdSSm/M18BS4iQrQwo+igOCp1pnarf11dsz3T3GKDUUJYrRYD7mIUfXPkjyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hc+XRMYj;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350FE606A888
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 350FE606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hc+XRMYj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794415285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NX9FKH6K+UEomRB8px05FQHC/CI9W13+rfvS8/4IDW0=;
	b=hc+XRMYjA1Y4mQditgYfLuw82IEwLFJ5WxR+gYn++ZXGdmPkAeVkHkcKuPnptXGhW/4Yzi
	QVRpsuwjcu193Bk9mkyBg70extd3M6+QU2DUUH/UwcxOCQwMFvhmMCtKKQK08EEB8t5+YW
	iT17YQsk1VsnuC06dOfdV9rB2brM3Cs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-478-udOd2yd0Nz--KgahitOCoA-1; Wed,
 11 Nov 2026 11:41:20 -0500
X-MC-Unique: udOd2yd0Nz--KgahitOCoA-1
X-Mimecast-MFC-AGG-ID: udOd2yd0Nz--KgahitOCoA_1794415278
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D9C981955E7E;
	Wed, 11 Nov 2026 16:41:17 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 593AD410;
	Wed, 11 Nov 2026 16:41:12 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Min Li <min.li@microchip.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH net-next v2 8/9] ice: dpll: update locking comments
Date: Wed, 11 Nov 2026 17:40:19 +0100
Message-ID: <20261111164021.273409-9-ivecera@redhat.com>
In-Reply-To: <20261111164021.273409-1-ivecera@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Callbacks run under the DPLL core domain locks instead of dpll_lock. On
E825 the TXC DPLL, the TSPLL DPLL and the other objects of a PF are in
three domains, and callbacks of pins of an external DPLL run under the
domain of that DPLL, so only pf->dplls.lock serializes them with each
other.

Reviewed-by: Petr Oros <poros@redhat.com>
Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
Changes in v2:
- Described the three domains of an E825 PF (Sashiko)
---
 drivers/net/ethernet/intel/ice/ice_dpll.c | 4 ++--
 drivers/net/ethernet/intel/ice/ice_dpll.h | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.c b/drivers/net/ethernet/intel/ice/ice_dpll.c
index 0877827a6521cc..5d0a52d86f03e8 100644
--- a/drivers/net/ethernet/intel/ice/ice_dpll.c
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.c
@@ -1178,8 +1178,8 @@ ice_dpll_input_state_get(const struct dpll_pin *pin, void *pin_priv,
  * peer via dpll netlink learn about the update.
  *
  * Context: Called from dpll_pin_ops callbacks after pf->dplls.lock is
- *          released.  Uses __dpll_pin_change_ntf() because dpll_lock is
- *          still held by the dpll netlink layer.
+ *          released.  Uses __dpll_pin_change_ntf() because the domain lock
+ *          is still held by the dpll core.
  */
 static void ice_dpll_sw_pin_notify_peer(struct ice_dplls *d,
 					struct ice_dpll_pin *changed)
diff --git a/drivers/net/ethernet/intel/ice/ice_dpll.h b/drivers/net/ethernet/intel/ice/ice_dpll.h
index bce0bea9a664bc..c522c5fcbcce52 100644
--- a/drivers/net/ethernet/intel/ice/ice_dpll.h
+++ b/drivers/net/ethernet/intel/ice/ice_dpll.h
@@ -164,6 +164,11 @@ struct ice_dpll {
  *     tx_refclks usage map), acquire pf->dplls.lock first, then
  *     ctrl_pf->dplls.lock. Skip the second acquire when pf == ctrl_pf
  *     to avoid recursive locking.
+ *   - The DPLL core serializes callbacks per (module, clock_id) domain. On
+ *     E825 the TXC DPLL, the TSPLL DPLL and the other objects of a PF, such
+ *     as the RCLK pin, use three different clock_ids, and callbacks of the
+ *     SYNCE and TIME_REF pins of an external DPLL run under the domain of
+ *     that DPLL, so only @lock serializes all of them with each other.
  *   - @txclk_notify_rwsem is held for read across
  *     ice_txclk_update_and_notify(), including the out-of-lock
  *     dpll_*_change_ntf() calls. ice_dpll_deinit() takes the write side
-- 
2.56.0


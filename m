Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3D430C160;
	Thu, 20 Aug 2026 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211144; cv=none; b=nhUt60mpCQtcUGZVGnNgojrjJOOjIwmcyWypPJrbRxt6lnPfaokKAvI0+U1/lr+v+VNZmYJKsKWjy/ZaPONz/nMPfnk3CwtfspS+mlhUEHdQU0hI921KZ4qig/vHpFs96VIpPPRCRCMM7zIDHAF5liHi1XZdAcvjfpOKbyJTvFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211144; c=relaxed/simple;
	bh=HOkJzEkBMETe+uT6f45jBqKDjwjsvVCYVg1kvaxa8sw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CRmXOvjAWG7JTY/zrFvqfno95hTbGtP6vzjVe6gXzac05GUUmr2kw+CgPScE3Yvisji0f/Ozx6sY7fApJFyFfkmnoDoUCOEknUscgwJDro7aHnLkHTBZ6JeuOjJeC1zkkwmzBiRVMslsS14+nEcFDQkI5n96IYJ2+3u6M2weLwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=BUaKDt7x; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="BUaKDt7x"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787211142; x=1818747142;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HOkJzEkBMETe+uT6f45jBqKDjwjsvVCYVg1kvaxa8sw=;
  b=BUaKDt7x3i3O1kkNJm0bNJwDf1a0R2B/liuN/UDjc9OmKHbTwYKq5opG
   ZlmrR9km4Z5Ac6OZgKP1cE4rfpsZQnW+FfbFfa/14sTChPZP4UakxTfaX
   MaNUx1w0dAuKCl97PPrXSu7ea8Iq9dH37URGhf4nrHGwpKG6QpHKllDgZ
   Q=;
X-CSE-ConnectionGUID: j5L/wBpHQm+iPmq6mVyOIg==
X-CSE-MsgGUID: OgU14aDxQ9yeSY++Kpgprw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105431057"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105431057"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:32:20 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:32:19 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:32:19 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:32:19 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Topic: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
Thread-Index: AQHdKzdIpVH7yibg9keh3oZJFvnnIbamkPWw
Date: Thu, 20 Aug 2026 07:32:19 +0000
Message-ID: <cc933d88b77b4fb5ad8f22720f08bb19@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGkgTWlxdWVsLA0KDQo+IFRoZXJlIGlzIGFuIElEIGNvbGxpc2lvbiB3aXRoIHRoZSBjaGlwIG9m
IHNhbWUgZGVuc2l0eSBmcm9tIHRoZSBKVg0KPiBmYW1pbHkuIEJvdGggY2hpcHMgYXJlIHZlcnkg
c2ltaWxhciBpbiBwcmFjdGljZSwgaXQgaXMgbW9zdGx5IGEgbWF0dGVyDQo+IG9mIGVsZWN0cmlj
YWwgZGlmZmVyZW5jZXMgKG1vc3RseSBwb3dlciBjb25zdW1wdGlvbiBiZWluZyBsb3dlcikuDQo+
IA0KPiBBcyBhIHNpZ25pZmljYW50IGRpZmZlcmVuY2UsIFJWIGNoaXBzIGlkZW50aWZ5IHRoZW1z
ZWx2ZXMgYXMgc3VwcG9ydGluZw0KPiB0aGUgbmV3IFNGRFAgKHJldiBGKSBmaWVsZCB3aGljaCBm
b3JjZXMgYW4gYWx0ZXJuYXRlIHdyaXRlIFNSMg0KPiBvcGNvZGUgKDB4MzEpLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCj4g
LS0tDQo+ICsgY2F0IC9zeXMvYnVzL3NwaS9kZXZpY2VzL3NwaTAuMC9zcGktbm9yL2plZGVjX2lk
DQo+IGVmNDAxOA0KPiArIGNhdCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkwLjAvc3BpLW5vci9t
YW51ZmFjdHVyZXINCj4gd2luYm9uZA0KPiArIHh4ZCAtcCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9z
cGkwLjAvc3BpLW5vci9zZmRwDQo+IDUzNDY0NDUwMGEwMTAwZmYwMDA4MDExNzgwMDAwMGZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KPiBmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYNCj4gZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmDQo+IGZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KPiBmZmZmZmZm
ZmZmZmZmZmZmZTUyMGY5ZmZmZmZmZmYwMzQ0ZWIwODZiMDgzYjQyYmJmZWZmZmZmZmZmZmYNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl4NCkp1c3Qgbm90aWNlZCBzaXplIGlzIHdy
b25nIGxpa2UgcGF0Y2ggIzE4Lg0KQkZQVCBEV09SRDIgYWR2ZXJ0aXNlcyBtZW1vcnkgZGVuc2l0
eSBpbiBiaXRzICgwLWJhc2VkKS4NCkluIDEyOE1iIHBhcnRzLCB0aGlzIHNob3VsZCBiZSAweDA3
RkZGRkZGLg0KTmVlZCBwb3N0X2JmcHRfZml4dXAuDQoNClRoYW5rcywNClRha2FoaXJvDQoNCg==

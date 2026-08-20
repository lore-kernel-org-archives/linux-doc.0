Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D6A37F8C2;
	Thu, 20 Aug 2026 06:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208278; cv=none; b=itbTyIIZGXk0LXLPZJBzlQGee2uHHlrIlYdPMZoNXmzr1TJID96Af+1enDB5eYOKTCXU3nxHkL2hg7fVubZJkNxM/NWNPepy96A3meilXD1B0A03zyHT2Lq3ezm/ue7+2EtbLWrgTG/bI/+xsFNyR14S15IEGyBnZ6LJ9AUZU50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208278; c=relaxed/simple;
	bh=uqadmPJge0Xy/YQ6o8YBnC+Imza6A1lLBBMzgWO73F8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LCxg6FBYBmktyXN1dKne2r3WlM2yA55xxcgNyE4Hd/XpA2SCQT+gbghi/xGEX/MXZgEajvEdEvW/0ASfuNviz8SMfkK4YOU/Qm+9g1YEmCEWUlpwdVlc7hlnOQ/87XlWyr08kPMxuNitmSc63wPUtqOkCvKmYMGwHKfn5eSoKz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=ketcRvWz; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="ketcRvWz"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787208275; x=1818744275;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uqadmPJge0Xy/YQ6o8YBnC+Imza6A1lLBBMzgWO73F8=;
  b=ketcRvWzrkBpvdalIsYqDcIM8jNZiVghHvu01cgZfnxDz2amsDSEqjho
   vobR7eqVds8h6BslUu4MSnnFqTT5En6iNeTT/QtSfN5hTVCG9Kshppg5B
   6AuhcosIAQP3b4ncN1w2cs3XRpPaJxekgl98LXyrlGK63dD1JLOskAraF
   0=;
X-CSE-ConnectionGUID: pVd/7Kx7RwCMPHwI6x+cjg==
X-CSE-MsgGUID: 2pPypu75Q12MdMZNrdt4zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173553957"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173553957"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:44:32 +0200
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:44:31 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE820.infineon.com
 (172.23.29.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:44:31 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:44:31 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 18/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-M
Thread-Topic: [PATCH v3 18/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-M
Thread-Index: AQHdKzdZvgsYuAZvr06GheipzTEvC7amhBRA
Date: Thu, 20 Aug 2026 06:44:31 +0000
Message-ID: <889b2fa10c5e4c6ea22ede16baa22b44@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>
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
DQo+IGVmNzAxOA0KPiArIGNhdCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9zcGkwLjAvc3BpLW5vci9t
YW51ZmFjdHVyZXINCj4gd2luYm9uZA0KPiArIHh4ZCAtcCAvc3lzL2J1cy9zcGkvZGV2aWNlcy9z
cGkwLjAvc3BpLW5vci9zZmRwDQo+IDUzNDY0NDUwMGEwMTAwZmYwMDA4MDExNzgwMDAwMGZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KPiBmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmYNCj4gZmZmZmZmZmZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmDQo+IGZmZmZmZmZmZmZmZmZm
ZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZmZg0KPiBmZmZmZmZm
ZmZmZmZmZmZmZTUyMGY5ZmZmZmZmZmYwMzQ0ZWIwODZiMDgzYjQyYmJmZWZmZmZmZmZmZmYNCj4g
MDAwMGZmZmY0NGViMGMyMDBmNTIxMGQ4MDAwMDE0MmEwMTAxODZlMTE0YzFlOTYzNzYzMzdhNzU3
YTc1DQo+IGY3YTJkNTVjMzlmNjZkZmZlOTMwZjg4MDAwMDAwMDAwMDAwMGFjMDAwMDAwMDAwMGY3
ZjVmZmZmMGYwMA0KPiAwMDAwMDYwZDQ0YmQyN2VkMDgwZA0KPiArIHNoYTI1NnN1bSAvc3lzL2J1
cy9zcGkvZGV2aWNlcy9zcGkwLjAvc3BpLW5vci9zZmRwDQo+IDk0YjUyZDZlOTAzYTIwNDZlMTQ0
ZWFiMDc2MDM4NGI2OTMyYzZmZGJmZWMxN2ViNzMzNmYxNzc4YzM4OThkYWYgIC9zeXMvYnVzL3Nw
aS9kZXZpY2VzL3NwaTAuMC9zcGktbm9yL3NmZHANCj4gKyBjYXQgL3N5cy9rZXJuZWwvZGVidWcv
c3BpLW5vci9zcGkwLjAvY2FwYWJpbGl0aWVzDQo+IFN1cHBvcnRlZCByZWFkIG1vZGVzIGJ5IHRo
ZSBmbGFzaA0KPiAgMVMtMVMtMVMNCj4gICBvcGNvZGUgICAgICAgIDB4MDMNCj4gICBtb2RlIGN5
Y2xlcyAgIDANCj4gICBkdW1teSBjeWNsZXMgIDANCj4gIDFTLTFTLTJTDQo+ICAgb3Bjb2RlICAg
ICAgICAweDNiDQo+ICAgbW9kZSBjeWNsZXMgICAwDQo+ICAgZHVtbXkgY3ljbGVzICA4DQo+ICAx
Uy0yUy0yUw0KPiAgIG9wY29kZSAgICAgICAgMHhiYg0KPiAgIG1vZGUgY3ljbGVzICAgMg0KPiAg
IGR1bW15IGN5Y2xlcyAgMg0KPiAgMVMtMVMtNFMNCj4gICBvcGNvZGUgICAgICAgIDB4NmINCj4g
ICBtb2RlIGN5Y2xlcyAgIDANCj4gICBkdW1teSBjeWNsZXMgIDgNCj4gIDFTLTRTLTRTDQo+ICAg
b3Bjb2RlICAgICAgICAweGViDQo+ICAgbW9kZSBjeWNsZXMgICAyDQo+ICAgZHVtbXkgY3ljbGVz
ICA0DQo+ICA0Uy00Uy00Uw0KPiAgIG9wY29kZSAgICAgICAgMHhlYg0KPiAgIG1vZGUgY3ljbGVz
ICAgMg0KPiAgIGR1bW15IGN5Y2xlcyAgNA0KPiANCj4gU3VwcG9ydGVkIHBhZ2UgcHJvZ3JhbSBt
b2RlcyBieSB0aGUgZmxhc2gNCj4gIDFTLTFTLTFTDQo+ICAgb3Bjb2RlICAgICAgICAweDAyDQo+
ICAxUy0xUy00Uw0KPiAgIG9wY29kZSAgICAgICAgMHgzMg0KPiArIGNhdCAvc3lzL2tlcm5lbC9k
ZWJ1Zy9zcGktbm9yL3NwaTAuMC9wYXJhbXMNCj4gbmFtZSAgICAgICAgICAgIChudWxsKQ0KPiBp
ZCAgICAgICAgICAgICAgZWYgNzAgMTggMDAgMDAgMDANCj4gc2l6ZSAgICAgICAgICAgIDguMDAg
TWlCDQoNCklzIHRoaXMgY29ycmVjdD8NClRoaXMgcGFydCBzaG91bGQgYmUgMTZNQigxMjhNYiku
DQoNClRoYW5rcywNClRha2FoaXJvDQoNCg==

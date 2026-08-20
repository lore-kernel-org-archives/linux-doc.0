Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F54376A09;
	Thu, 20 Aug 2026 06:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206706; cv=none; b=lxsEGMndWYsZFOpmo44m/TSsrKn0fkkMenhO2rLWiO5IzoBMnS1De9YGHO2e6CNoKD42GDoJRNjnAAcOwPS0raibMETGV/HlslF9W1WilQrFISSzZOY0jeO/lYF/UYgyB9lBaz1zNv4GfNr4V2LBMPl4RLw43mHhpuc/+cwHW9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206706; c=relaxed/simple;
	bh=Ip4PDGMrpZEu3HCJLdL+aBJ9D7NGYmTHQuK2MeL1HOE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l81SmtRot3NHG2Q1uuB3Vd3HhtM+GpdraR1/elIS0yIwnH4MUuY/UEeF+8Xu156u0ZxkVq6UscNcrlnIkr0QCi31RjoKZWzGndwWIRzQ9U1EHsUns6dRCdujW7Ye8SSFcsX6RuA/D1CEksZooFcZZu1VzeN+26jwP/6cSBBnJEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=BcrmSWC6; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="BcrmSWC6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787206706; x=1818742706;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ip4PDGMrpZEu3HCJLdL+aBJ9D7NGYmTHQuK2MeL1HOE=;
  b=BcrmSWC6u9mGSnGDfLOPnGHirKLXrLh+FuutljYXZmeXJM+txwILt7FR
   v/Pe+Zndnw3/LyCRRde8+riBGMqdLIdrZoPQ6Fm7iWPqrDd7joMmllmNQ
   TFNYF3YlTDMG5ckzw+v68eINxjD8GfX+0sOmko7d2DpCEhenQKF7Dym+Y
   o=;
X-CSE-ConnectionGUID: EFRnncL4SHCmkkdcXbIAmg==
X-CSE-MsgGUID: QL3SOuhdSpuHSFl/YUX4+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="142734583"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="142734583"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:18:23 +0200
Received: from MUCSE813.infineon.com (172.23.29.39) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:18:22 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE813.infineon.com
 (172.23.29.39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:18:22 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:18:22 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 15/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
Thread-Topic: [PATCH v3 15/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
Thread-Index: AQHdKzdYgZD7ATgWRUKQB1xcsStmCramgOFQ
Date: Thu, 20 Aug 2026 06:18:22 +0000
Message-ID: <2556eaef1ad346518e169552d60474ed@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
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

PiBUaGVyZSBpcyBhbiBJRCBjb2xsaXNpb24gYmV0d2VlbiB0aGUgSlYgYW5kIFJWIGZhbWlsaWVz
LiBCb3RoIGNoaXBzIGFyZQ0KPiB2ZXJ5IHNpbWlsYXIgaW4gcHJhY3RpY2UsIGl0IGlzIG1vc3Rs
eSBhIG1hdHRlciBvZiBlbGVjdHJpY2FsDQo+IGRpZmZlcmVuY2VzIChtb3N0bHkgcG93ZXIgY29u
c3VtcHRpb24gYmVpbmcgbG93ZXIpLg0KPiANCj4gQXMgYSBzaWduaWZpY2FudCBkaWZmZXJlbmNl
LCBSViBjaGlwcyBpZGVudGlmeSB0aGVtc2VsdmVzIGFzIHN1cHBvcnRpbmcNCj4gVGhlIG5ldyBT
RkRQIChyZXYgRikgZmllbGQgd2hpY2ggZm9yY2VzIGFuIGFsdGVybmF0ZSB3cml0ZSBTUjIgb3Bj
b2RlDQo+ICgweDMxKS4NCj4gDQo+IFNpbmNlIHRoZXkgc2hhcmUgdGhlIElEcyBidXQgbm90IHRo
ZSBuYW1lcywgd2UgbXVzdCBoaWRlIHRoZSBuYW1lcyB1c2luZw0KPiBhIGZpeHVwLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3YW5vQGluZmluZW9u
LmNvbT4NCg0K

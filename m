Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484F19F115;
	Thu, 20 Aug 2026 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787206881; cv=none; b=ZGy2wKBi7CClRree42WRvJmD/M3yzZHPKXoyfpgm4gIX1voCmUVLUK+HOfTqyi5XFW6OHl6C5BAnZO+XlIRsjLIn5DB4993AYabQv8aVGNJs583sfvD8WDgqZoreH1Oz+9u5F8hOyZ45z8YspURg+riHsIKDog7d26GhgIIw+ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787206881; c=relaxed/simple;
	bh=U4W08LkUkt2oaIkOGVmzCX+wp16zz69drgER1UF8oEk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iRBHJE+aG8mxrTXGMZuhiD60bYT+Lo/F64+iJaJyXgVozsBjUQKjrEgoLe6RDqLWWWhrBa4wDW9YPbPUJxFcUDNbdLNGJ9pV3SW74SVQy4zLnm9rX/G/25f/LwBe1wfcDTg6k1/8fWeo/kcb6F4aXNOPildmkG8v0xnwmHK8t+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Qmvar6UN; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Qmvar6UN"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787206881; x=1818742881;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=U4W08LkUkt2oaIkOGVmzCX+wp16zz69drgER1UF8oEk=;
  b=Qmvar6UNl8n8i++OIzfJbsTbMNp0XpS/FSE36P20gt7JyZAIabASEcwF
   XuNAvXjRL64ZNuZtL1usySnjolfoYT5NJdaOYb5IWo7gU5Vsthy+atOgx
   JP6GCik7dXGN8BypTG8F87cLGMNxX1sT3H3dFQvS62jAgIorfvB1dYjGm
   4=;
X-CSE-ConnectionGUID: pdjrJqr6TniHZHR4RBtmNw==
X-CSE-MsgGUID: c+kmAZulTF659+F6vcl6vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173550215"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173550215"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:21:18 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:21:17 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:21:17 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 17/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-M
Thread-Topic: [PATCH v3 17/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-M
Thread-Index: AQHdKzdX4kaN31gU5E+a+aZJ4KB29LamgY3Q
Date: Thu, 20 Aug 2026 06:21:17 +0000
Message-ID: <1607509688694e31872d1b6cc373bc7a@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>
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

PiBUaGVyZSBpcyBhbiBJRCBjb2xsaXNpb24gd2l0aCB0aGUgY2hpcCBvZiBzYW1lIGRlbnNpdHkg
ZnJvbSB0aGUgSlYNCj4gZmFtaWx5LiBCb3RoIGNoaXBzIGFyZSB2ZXJ5IHNpbWlsYXIgaW4gcHJh
Y3RpY2UsIGl0IGlzIG1vc3RseSBhIG1hdHRlcg0KPiBvZiBlbGVjdHJpY2FsIGRpZmZlcmVuY2Vz
IChtb3N0bHkgcG93ZXIgY29uc3VtcHRpb24gYmVpbmcgbG93ZXIpLg0KPiANCj4gQXMgYSBzaWdu
aWZpY2FudCBkaWZmZXJlbmNlLCBSViBjaGlwcyBpZGVudGlmeSB0aGVtc2VsdmVzIGFzIHN1cHBv
cnRpbmcNCj4gdGhlIG5ldyBTRkRQIChyZXYgRikgZmllbGQgd2hpY2ggZm9yY2VzIGFuIGFsdGVy
bmF0ZSB3cml0ZSBTUjINCj4gb3Bjb2RlICgweDMxKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQoNClJldmlld2VkLWJ5OiBU
YWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20+DQoNCg0K

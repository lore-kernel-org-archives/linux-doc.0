Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3703B14CE;
	Thu, 20 Aug 2026 06:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208505; cv=none; b=ekkDjnbG6sl2ZoYhg9tKdt9Q4BMT60PkV7BrURo5jyzYB3tb89JMO8QnE14pg+XWDUwIN1UpE3ZeS2oUGs8OzKViNxtNavXvlfZXQDcweSbEODNxWOe1mdJfz95zGXBVypJWx1e416lY8W/1kTlaxwubVN5unq4OV5KOBBaxXbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208505; c=relaxed/simple;
	bh=u6nnStvPEFbyY7Htslo0ENX4rktquD6YXC5DcbylmnQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GS622fn7zYx01qN6fLOmNYoBHXd24lptIn8hG+/THBnfrPBhgDppb5l3UcmZjByzGuT3YjudlRunakU4/SGAUl9ffubLXbmHmJBxFUhHAyz/ia+LqaMIalQGri294fmTLE2iJxAFRsYAlJO35O2DL8AFyn1KxGcVEjJaDPu9V0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=ExQmmXqk; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="ExQmmXqk"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787208504; x=1818744504;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u6nnStvPEFbyY7Htslo0ENX4rktquD6YXC5DcbylmnQ=;
  b=ExQmmXqkUHbNwLdBUC/RQr/rsMurc67i5UpnTpdolk5BTvqABcYcoppE
   LcqG2rf3HrGnelQJsp/LoarquPZCgOxThx+68IY1QjYTQhXE77iKxOjCP
   VkV+DD9b4tnZ5BK7zQu6QSkN2uwgx1KwHteXfDc2X90/G+HAtnf4Nlv3x
   w=;
X-CSE-ConnectionGUID: 8DGPpDhSRtWogBcRyrS8+A==
X-CSE-MsgGUID: 8Guibs51T++G7KjXMaagWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="156710967"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="156710967"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:48:21 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:48:20 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:48:20 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 19/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-M
Thread-Topic: [PATCH v3 19/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-M
Thread-Index: AQHdKzdaZyHdizrdxkawS3savx+5ObamiT8g
Date: Thu, 20 Aug 2026 06:48:20 +0000
Message-ID: <96751e6445544105be6ec8cd93d498b5@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-19-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-19-b637cf120d5c@bootlin.com>
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
YWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20+DQoNCg==

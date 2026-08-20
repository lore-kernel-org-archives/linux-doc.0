Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AED440637;
	Thu, 20 Aug 2026 05:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205201; cv=none; b=JkLvPCV+hkaPCzTMhenD7ShoBPe7GoozcIc6evP/M+Kx54rr649UYOf2/KXqmrtKjnHc5lP7NKoUmzLMCddnq8VuYODQZs9eAF0Wc3t5a4vDotIsEAszvQc9XTL8dsbhv4ZSnSi+c0ahJLHJ5ivHiGc1ZaJvZhuVQ5jsNOucYiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205201; c=relaxed/simple;
	bh=37ZW8YOnm60ojTL8ISRSzVGScSuVacERLLcfcy5t1XI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HZya7zDunV5VGS+VhZCp8UzMdRIpuwDZ+hnllpM2TLm80itPvEfXn8n8jrLUUUjsFW7wCxqniSyzJcOeMUKovJshUsBWpRfaOMToRgIAGLa7shaAEBj1LQlc6f6MVJDjU24SV/HKI1OmIwlKBRLT258hCXat0j+H2byqBslOc38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=hilC+Npt; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="hilC+Npt"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205199; x=1818741199;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=37ZW8YOnm60ojTL8ISRSzVGScSuVacERLLcfcy5t1XI=;
  b=hilC+NptxnmSngSfwl65uFJzxcGMJKMtQDfdLqkrvhlunyEbpwzRvlUb
   RnbuONJBFemSRb8bGiyltptMpJ0StUvEga74XviROcRQn7VX1oEBK/YIU
   ZVoYRT1xfSD7F03BbE5Af+1EILB4Ni7u+mNeQzG2nyADwWTZU6aOLurE8
   M=;
X-CSE-ConnectionGUID: wStoZyi0SLOQcxFSTJKt3w==
X-CSE-MsgGUID: SVZ2c4O8Svmn710HkLRf7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="156701291"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="156701291"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:53:16 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:53:17 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:53:16 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:53:16 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 04/23] mtd: spi-nor: Add support for the new JESD216
 rev F QER field
Thread-Topic: [PATCH v3 04/23] mtd: spi-nor: Add support for the new JESD216
 rev F QER field
Thread-Index: AQHdKzcucGwXu1ZOE066BGny6n0Soramedtw
Date: Thu, 20 Aug 2026 05:53:16 +0000
Message-ID: <c209ecaf857b40519b921e4d73ae29b6@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
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

PiBSZXZpc2lvbiBGIG9mIHRoZSBKRURFQyBKRVNEMjE2IHN0YW5kYXJkIGluY2x1ZGVzIHlldCBh
bm90aGVyDQo+IHN1cHBvcnRlZCBzZXR0aW5nIGluIHRoZSBRRVIgMy1iaXQgYml0ZmllbGQ6IDEx
MGIuDQo+IA0KPiBUaGlzIHNldHRpbmcgaW1wbGllcyB0aGF0IHRoZSBRRSBiaXQgaXMgYml0IDEg
b2YgU1IyICh3aGljaCBpcyBhbg0KPiBhbHJlYWR5IHN1cHBvcnRlZCBjYXNlKSBidXQgdGhpcyB0
aW1lIGl0IG1ha2VzIGl0IHZlcnkgY2xlYXIgdGhhdCBib3RoDQo+IHJlYWRpbmcgYW5kIHdyaXRp
bmcgdG8gU1IyIGlzIHN1cHBvcnRlZCwgYnV0IG5vdCB3aXRoIHRoZSB1c3VhbA0KPiBvcGNvZGVz
LiBUaGUgd3JpdGUgb3BlcmF0aW9uIHVzZXMgYW4gYWx0ZXJuYXRlIFdSU1IyIG9wY29kZToNCj4g
MHgzMSAoaW5zdGVhZCBvZiAweDNFKSBhbmQgYm90aCB0aGUgcmVhZHMgYW5kIHdyaXRlcyBtYW5p
cHVsYXRlIGEgc2luZ2xlDQo+IHJlZ2lzdGVyIGF0IGEgdGltZS4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQoNClJldmlld2Vk
LWJ5OiBUYWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20+DQoNCg==

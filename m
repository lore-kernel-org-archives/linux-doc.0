Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E143C3BEF;
	Thu, 20 Aug 2026 07:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787211758; cv=none; b=R1X6o1bfuC7AwN3K9sMxGn0Gcz1hCGHeTe6hPNFUxD2oQApjZqYPXzC0dnK/UJAcxTXhtkIMj4XQXk0eLCtwJarDav/9Vlrb5tsPvomx3q27jNidGbWp5VWJ9GjQD9fBhZmnCWjjNNAiv3c5MZZDcevg8WlKUESvydk+T7TOPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787211758; c=relaxed/simple;
	bh=cUrPJyM6gL/q3YPxoWb9BwFgr6uWjIw/EG2VK3UDrHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aYrem5XQf5HiBSzCuPArfAUWDF6ZKdvgGqN2rCkt6KMIQcMzoUX8ueabY/bY4rlI2miNDOc/RPsabDD5hye6r7adkFoTBSGtMsy0BiIAOMqVIxJWQANOklNTjOo4Xc6NsE3O06ryE1gGL/n3q5lSTJw4QxgV+WSiWZM6l10T3S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=hsoM/tGV; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="hsoM/tGV"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787211755; x=1818747755;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cUrPJyM6gL/q3YPxoWb9BwFgr6uWjIw/EG2VK3UDrHQ=;
  b=hsoM/tGVeZcfkOU2zL/5/GlQUe0q6/tow2RM/6+UQdTsfWyoiup+h2wy
   Dn8yzmIDzSSBDEqj5k6GofCObxFQo1kQlZjWnd9gKayK/nBZwlW1W33Wq
   VLvXhOTaAGin5BKzfMbJkiTaH5df3YrlYTeQGPOO40Y3XYVEH9+cEa1T3
   0=;
X-CSE-ConnectionGUID: lCqHMEPnSrKdVMxckNyj4A==
X-CSE-MsgGUID: 4xZULP0yRByH5K+2AZu/ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173565685"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173565685"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:42:31 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:42:31 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:42:31 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
Thread-Topic: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
Thread-Index: AQHdKzdeUgXLNx85nkGFTDayVR9si7amlcrg
Date: Thu, 20 Aug 2026 07:42:31 +0000
Message-ID: <516e6eb78d3741e7bf5127e928bbe597@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
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

SGkgTWlxdWVsLA0KDQo+IEkgY3VycmVudGx5IGRvIG5vdCBoYXZlIGFjY2VzcyB0byBhbnkgY2hp
cHMgZnJvbSB0aGUgVzI1UTI1UlYNCj4gZGVuc2l0eS4gWWV0LCBJIHN1Y2Nlc3NmdWxseSB0ZXN0
ZWQgdGhlIGVudGlyZSBKViBmYW1pbHkgYW5kIGFsbCBvdGhlcg0KPiBjaGlwcyBmcm9tIHRoZSBS
ViBmYW1pbHkuIFRoZXkgYWxsIGJlaGF2ZWQgc3RyaWN0bHkgaWRlbnRpY2FsbHksIHNvIEkNCj4g
cHJvcG9zZSB0byBuZXZlcnRoZWxlc3MgYWRkIHRoZSBtaXNzaW5nIGNvbW1lbnRzIGZvciB0aGUg
c2FrZSBvZiBjbGFyaXR5DQo+IGFuZCBjb21wbGV0ZW5lc3MuDQoNClN1YmplY3Qgc2F5cyBXMjVR
NTFSViB0aGF0IGluY29uc2lzdGVudCB3aXRoIHdoYXQgeW91IGNoYW5nZWQuDQpBbmQgaXQgd291
bGQgYmUgbmljZSB0byBoYXZlIGEgVzI1UTI1UlYgY2hpcCBhbmQgY2hlY2sgU0ZEUC4NCg0KVGhh
bmtzLA0KVGFrYWhpcm8NCg0K

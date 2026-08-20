Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5F53515CE;
	Thu, 20 Aug 2026 05:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205544; cv=none; b=M140ZIgXqi0zBF3N4duBwsgz129AUBUYyzebc2MkPGii0wjEh4KvsAFskejaP1r+nuIWR/C+GK2ygoJQsV7mqzYhmn+RdWd3317R+7FofUVJAEVsH13TtymwdRIeW21Kc5Zap7r3ZXDdMnWYMz1qYKMoTBlpgq4XQvnkSiAomKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205544; c=relaxed/simple;
	bh=Qe8FKlZhSpcuo4F/GPBPV4eCBlhrPJ5e3vrOBNcgGIA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iQeqJ0SNLq7zusNFGU1vIsTauJsJ3XCWJsZc6eLDxtDvrxAulcmtylinaP0I8DdebgzTlotz7LhkBkOo4o5DHXl0rcWNqrch489PzCdeKIEUIlQHfEBOElKkZvQPMD7u6/pXQZ8wNRNLEqpf4MMNbJug+0X1Of4dzLPUhIk/WJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=RjQurZGO; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="RjQurZGO"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205542; x=1818741542;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Qe8FKlZhSpcuo4F/GPBPV4eCBlhrPJ5e3vrOBNcgGIA=;
  b=RjQurZGOtqGXzKsNo5AFQaC8sXv6GfQXeZqZoplsXeFCLBSTOQoXF/1v
   0rbCBKqav27CvWDxFIb0y21CAwq/wF4j5lv7h7TEkjyPgJ+8nOsufAw4T
   djCpQixgpPnfGi6pa03axoB3lb8qxbMdDT7VWFYa7P9VptoaZifryht22
   s=;
X-CSE-ConnectionGUID: xT6esWTyRY2U0JVNUEzQwA==
X-CSE-MsgGUID: yiniqULCTga91r315KvwQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173544398"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173544398"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:58:59 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:58:59 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE815.infineon.com
 (172.23.29.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:58:58 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:58:58 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Thread-Topic: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Thread-Index: AQHdKzc8iS3M3S4Pl0ajaTH9fJZ747ame0sg
Date: Thu, 20 Aug 2026 05:58:58 +0000
Message-ID: <fca9748398d1496e9e1dbdac19cab2dc@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
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
LCBSViBjaGlwcyBpZGVudGlmeSB0aGVtc2VsdmVzIGFzIHN1cHBvcnRpbmcNCj4gdGhlIG5ldyBT
RkRQIChyZXYgRikgZmllbGQgd2hpY2ggZm9yY2VzIGFuIGFsdGVybmF0ZSB3cml0ZSBTUjIgb3Bj
b2RlDQo+ICgweDMxKS4gVGhleSBhbHNvIGRvIG5vdCByZXF1aXJlIHRoZSBtdWx0aS1kaWUgZml4
dXBzIHdoaWNoIG11c3QgcmVtYWluDQo+IGFzc2lnbmVkIHRvIHRoZSBKViBjaGlwcy4NCj4gDQo+
IEZpbmFsbHksIHNpbmNlIHRoZXkgc2hhcmUgdGhlIElEcyBidXQgbm90IHRoZSBuYW1lcywgd2Ug
bXVzdCBoaWRlIHRoZQ0KPiBuYW1lcyB1c2luZyBhIGZpeHVwLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCg0KUmV2aWV3ZWQt
Ynk6IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3YW5vQGluZmluZW9uLmNvbT4NCg0K

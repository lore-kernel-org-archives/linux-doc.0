Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4940346A0D;
	Thu, 20 Aug 2026 05:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205442; cv=none; b=sBpuzGPi8stcSN9MDo/8KJq714AoEr4lqWB0jSUCGVVORr8GnV7V2d5ek8s6vhH0OB/GcrA/XXgcUU2HbN+iyA2MRoZJ/q7zgcnVEUA2jtjVCc+1MFpwyU8ZusnK20FYrt+6xrCCWryfzElUTBYkd2ns2iyAWTwOUBvYz+B1yZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205442; c=relaxed/simple;
	bh=rCMCnlVm4+ZYRv/IwB6MsayWprzl+dNBwx5Ic+qtN5Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TpWZEbR0PBQJ+CqSG/9ROdQ8fasg9wBRgTMjkAI65HvF7k68YA8YrPgS62wV4kCn1Sl/sej8sK2FuSULAUCJDIIxxmFRm0X0hCr74kubESJxVyCUgHIoMQbwGEemyWZFkGk6tjhGCnu/IV6OSY/xcZtm7CRz3Q5T8qnldtx1jHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=HiyZRZbW; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="HiyZRZbW"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205441; x=1818741441;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rCMCnlVm4+ZYRv/IwB6MsayWprzl+dNBwx5Ic+qtN5Y=;
  b=HiyZRZbWJoRyyXuASB57ykvcrN5DvD3qyok6YzMm8jpPPgxtifSekDoZ
   GDHKHwuvH97Zx14znotQ4m0c25CIds97TnvmXvc5fkmbPwUp9OnTerZC2
   9k5Yay01TFYoOxaTcK+r4T5IeCyEB/nIX1N36av6z15urM65kiChuQaFl
   U=;
X-CSE-ConnectionGUID: Bo52KQ4+T6miXnf+yps28Q==
X-CSE-MsgGUID: vXOrP4HDS8Sp+50fT9gIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105416088"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105416088"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:57:19 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:57:18 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:57:18 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
Thread-Topic: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the part
 name
Thread-Index: AQHdKzc1AHXJ+KOQ0UmpAsXDUzHYBramevIw
Date: Thu, 20 Aug 2026 05:57:18 +0000
Message-ID: <b8197d8e5f7d435397536b0187a4297b@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
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

PiBXZSBjdXJyZW50bHkgcHJpbnQgdGhyb3VnaCBzeXNmcyBhbmQgZGVidWdmcyB0aGUgbmFtZSBv
ZiB0aGUgcGFydCBpZiB0aGUNCj4gLm5hbWUgZmllbGQsIHdoaWNoIGlzIGxlZ2FjeSwgaGFzIGJl
ZW4gZmlsbGVkIGluIHRoZSBJRCB0YWJsZSAob3RoZXJ3aXNlDQo+ICIobnVsbCkiIGlzIHByaW50
ZWQpLiBUaGVzZSBJRHMgaGFkIGFuIGludGVyZXN0IHVudGlsIG1hbnVmYWN0dXJlcnMNCj4gc3Rh
cnRlZCByZS11c2luZyBtb3JlIGFuZCBtb3JlIGV4dGVuc2l2ZWx5IHRoZSBzbyBjYWxsZWQgdW5p
cXVlIEpFREVDDQo+IElEcy4gQXQgdGhpcyBzdGFnZSwgYSBuYW1lIHRoYXQgd2FzIHRhaWxvcmVk
IGZvciBhIGNoaXAgc29sZCBpbiAyMDE2IG1heQ0KPiBubyBsb25nZXIgYmUgcmVsZXZhbnQgZm9y
IGEgY2hpcCBzb2xkIGluIDIwMjYuIFN0aWxsIHNob3dpbmcgdGhpcyBuYW1lDQo+IHRocm91Z2gg
dGhlIHZhcmlvdXMgZmlsZXN5c3RlbXMgbWF5IGNvbmZ1c2UgcGVvcGxlLCByZW1vdmluZyB0aGVz
ZSBuYW1lcw0KPiBjYW5ub3QgYmUgZG9uZSBzaW5jZSB0aGV5IGFyZSBub3cgcGFydCBvZiB0aGUg
dXNlciBBQkkgKGJlY2F1c2Ugb2YNCj4gc3lzZnMpLg0KPiANCj4gSW4gb3JkZXIgdG8gYWxsb3cg
b3ZlcndyaXRpbmcgdGhlIC5uYW1lIGZpZWxkICh3aGljaCBpcyBwYXJ0IG9mIGENCj4gcmVhZC1v
bmx5IHN0cnVjdHVyZSksIGxldCdzIGNyZWF0ZSBhIHNwaS1ub3IgcG9pbnRlciB3aGljaCB3aWxs
IGJ5DQo+IGRlZmF1bHQgcG9pbnQgdG8gdGhhdCAubmFtZSwgYnV0IHdoaWNoIGNhbiBiZSBjbGVh
cmVkIGluIGZpeHVwIGhvb2tzIHRvDQo+IG1ha2Ugc3VyZSB0aGUgbmFtZSBpcyBoaWRkZW4gb24g
bmV3ZXIgcGFydHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwu
cmF5bmFsQGJvb3RsaW4uY29tPg0KDQpSZXZpZXdlZC1ieTogVGFrYWhpcm8gS3V3YW5vIDx0YWth
aGlyby5rdXdhbm9AaW5maW5lb24uY29tPg0KDQo=

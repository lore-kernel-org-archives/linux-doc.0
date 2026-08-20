Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C63AE191;
	Thu, 20 Aug 2026 06:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205870; cv=none; b=rmE1ZRws1H2HBMs8JTDZhN5qjtaWzIa93McCu8b93l59MrA+frYvjnHPJh8eJZqDXFIV3vq0wn+eJl1bLsmZjL2v6Rwccb8Lgt9jMdC4w1k4aLYR83FXkZ7QALuJuSwpf81x+14SfP8LM1D9KPsQp7h8lSsnp/o6B6PqxCtgCAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205870; c=relaxed/simple;
	bh=u6nnStvPEFbyY7Htslo0ENX4rktquD6YXC5DcbylmnQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k3eb2iV0bpXhpf//8Ta+RwX2E/UOPh5okF89j40ZfshTklbugYtU4O9FhS1tl34EftHlWlYHqYNvjO30HHjY4gA1I+mtKbCrtyHfKAsBFl7YmUFAXNiNymEzCLAOI2FwLT2MRerumwF8KP08XO6KHzWJO5hhmQUzqrhBp4gjq70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=jQgD8fKS; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="jQgD8fKS"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205869; x=1818741869;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u6nnStvPEFbyY7Htslo0ENX4rktquD6YXC5DcbylmnQ=;
  b=jQgD8fKS4pwDqtoLApSYHLLye40IRYrKA8YP5ysNf2OfsvUpfOCJARzi
   3xhTN9TI1c92yySmShfPvCMQ+p2gcHKqAnnnHPWLIRS1HkofkvDZS6TOj
   Q5q0x7d93dl6ocYiheMt91l7nXjWYY1RZOFmNqL4E+W1lrcIEp7FM6NVd
   k=;
X-CSE-ConnectionGUID: VdNJ1033QtCpvYH9LSyp9g==
X-CSE-MsgGUID: IvKWu1wnSsimmlz7DGl8DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="156704490"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="156704490"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 08:04:26 +0200
Received: from MUCSE817.infineon.com (172.23.29.43) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:04:26 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE817.infineon.com
 (172.23.29.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 08:04:25 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 08:04:25 +0200
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
Thread-Index: AQHdKzdIpVH7yibg9keh3oZJFvnnIbamfO+g
Date: Thu, 20 Aug 2026 06:04:25 +0000
Message-ID: <4679ea5e945a4f6c8e743d3543e000b5@infineon.com>
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

PiBUaGVyZSBpcyBhbiBJRCBjb2xsaXNpb24gd2l0aCB0aGUgY2hpcCBvZiBzYW1lIGRlbnNpdHkg
ZnJvbSB0aGUgSlYNCj4gZmFtaWx5LiBCb3RoIGNoaXBzIGFyZSB2ZXJ5IHNpbWlsYXIgaW4gcHJh
Y3RpY2UsIGl0IGlzIG1vc3RseSBhIG1hdHRlcg0KPiBvZiBlbGVjdHJpY2FsIGRpZmZlcmVuY2Vz
IChtb3N0bHkgcG93ZXIgY29uc3VtcHRpb24gYmVpbmcgbG93ZXIpLg0KPiANCj4gQXMgYSBzaWdu
aWZpY2FudCBkaWZmZXJlbmNlLCBSViBjaGlwcyBpZGVudGlmeSB0aGVtc2VsdmVzIGFzIHN1cHBv
cnRpbmcNCj4gdGhlIG5ldyBTRkRQIChyZXYgRikgZmllbGQgd2hpY2ggZm9yY2VzIGFuIGFsdGVy
bmF0ZSB3cml0ZSBTUjINCj4gb3Bjb2RlICgweDMxKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1p
cXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQoNClJldmlld2VkLWJ5OiBU
YWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20+DQoNCg==

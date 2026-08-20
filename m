Received: from smtp11.infineon.com (smtp11.infineon.com [217.10.52.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCE43ABD80;
	Thu, 20 Aug 2026 05:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205208; cv=none; b=HjybMvFtSW6KCvLGGDfzJ2odpORpGMgcuY05IPEsPS8pwZJ37rUbPNJDHjX14zzf6D/cFQf0UBtploNo73sqZbE2FH8zKXDS1lqiZpbEq+pn+VmOL/Cb5wNufzNahAwctBXIZmvAFW2s8PgX3WVZHz8xDd9VS69n/5zXiOVBVA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205208; c=relaxed/simple;
	bh=D+3GNmh1yOZtivo+s78FLEik/xOcGS18TsuSqjh9ss0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XXD+/YcuL+y6qq1uMFFil2dw4/R0AkAo2OXZpE0BMQncMTX5/gv8Tca3oYqg3dIwbT9PRgDmT+mqprA2ONBOwN9FdjZCxudN4mQyN58+/3ONojlBIP8uMK9UlTslTyrL0QQO0tquVWaWp2K33u/0LUCvAuUae2kbk1r/0KL7Asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=dT08+2Ts; arc=none smtp.client-ip=217.10.52.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="dT08+2Ts"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205206; x=1818741206;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=D+3GNmh1yOZtivo+s78FLEik/xOcGS18TsuSqjh9ss0=;
  b=dT08+2TsSvoZyju4EqdYiLuTV/OZABIBQMQDvjGuC9ivvmpHqD1fgWWw
   UUCRNeOtKF6e4ac73T8Eb0aD/uHj69pQL8M1kOv1N8AVVKo5UxZXDmONZ
   CGcCugFj/ymQnlIn1vd1PxfM6BxNa6QBUK+IkTvJO1fpSO2nnIOshFO/t
   I=;
X-CSE-ConnectionGUID: Ui2XMQjFQ4CgFbp+PS6UJw==
X-CSE-MsgGUID: /0mau9jjT/G61PmdvflxYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="156701181"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="156701181"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE814.infineon.com) ([172.23.29.40])
  by smtp11.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:52:18 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE814.infineon.com
 (172.23.29.40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:52:17 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:52:17 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 02/23] mtd: spi-nor: Create a structure containing the
 flash opcodes
Thread-Topic: [PATCH v3 02/23] mtd: spi-nor: Create a structure containing the
 flash opcodes
Thread-Index: AQHdKzcn1MP1V+y9ZUuiJHx2Cv1ozLameVcg
Date: Thu, 20 Aug 2026 05:52:16 +0000
Message-ID: <e1c58d4707274cde88e81c02fd1e1549@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
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

PiBDcmVhdGUgYSBzdHJ1Y3R1cmUgbmFtZWQgb3Bjb2RlcyBpbiB0aGUgZmxhc2ggcGFyYW1ldGVy
cyBzdHJ1Y3R1cmVzIHRvDQo+IHN0b3JlIGFsbCB0aGUgZmxhc2ggc3BlY2lmaWMgb3Bjb2Rlcy4g
VGhleSBhcmUgdHlwaWNhbGx5IGRpc2NvdmVyZWQNCj4gZHluYW1pY2FsbHkgdGhyb3VnaCBTRkRQ
IHBhcnNpbmcuIE1vdmUgdGhlIGRpZV9lcmFzZSBvcGNvZGUNCj4gaW5zaWRlLiBMYXRlciBvbiB3
ZSB3aWxsIGFkZCBuZXcgZmllbGRzIHRoZXJlLCBsaWtlIHRoZSBzdXBwb3J0ZWQNCj4gb3Bjb2Rl
cyBmb3IgYWNjZXNzaW5nIHRoZSBzdGF0dXMgcmVnaXN0ZXJzLCB3aGljaCBhcmUgYWxtb3N0IHZl
bmRvcg0KPiBzcGVjaWZpYy4NCj4gDQo+IE5vIGZvbmN0aW9uYWwgY2hhbmdlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCg0K
UmV2aWV3ZWQtYnk6IFRha2FoaXJvIEt1d2FubyA8dGFrYWhpcm8ua3V3YW5vQGluZmluZW9uLmNv
bT4NCg0K

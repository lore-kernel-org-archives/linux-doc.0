Received: from smtp2.infineon.com (smtp2.infineon.com [217.10.52.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A22D0C64;
	Thu, 20 Aug 2026 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205545; cv=none; b=hRlcjid0ftMNRR0Xf+/+lwTQ2M4Gl80U73oyZN0ls/rjs0wX9kyuu6LEKvNUFsDdHDb5xbNjT1CR/Fcblxle4/K13TmKyP/BXt0uymWBYsd9Q2bKLXgs1vBjLc68JLZOakTqDyy/msSZJI3IbeaQ+hstLGtI1u+gGjJaoTIIk5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205545; c=relaxed/simple;
	bh=dal/F5zZKg3SwPFB3iSmdSiiTJ6MM+edl5Snp947p2E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=V+Oxa8zmowzaNBksU0fTMdCg5ossgBSxzgU1HJUo+Kyw2RGK1k1cp2/m2ScNJnm2zKDYBvteB/MAjIV7FZIZslD5I7aXYShokaT+AL0m4RW8DViTBZazmeZiMh2lIt8uyU2uu9xUeFKgSNQYqlr4lYLGt4skAv4X8Soefdpwj3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=ImN84dwe; arc=none smtp.client-ip=217.10.52.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="ImN84dwe"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205544; x=1818741544;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dal/F5zZKg3SwPFB3iSmdSiiTJ6MM+edl5Snp947p2E=;
  b=ImN84dweEE55sedeOQmAKcSpgUwsZihfp0QRV0glZNmRNE92xaazX80M
   N/DyRnRcXZw021ONWSgm5f2y8/dvrSZSa9CILaH9b0FIRt0Q5kZY9UHo2
   H5E98UcnajVhJQ4Xb7DctBkDH2hiFkFomauXqcH2yKPIHKb99JBtPGaM8
   M=;
X-CSE-ConnectionGUID: aCAruB/LS0mYuCfy6i39vw==
X-CSE-MsgGUID: MT8cv8FSSz+GIoMFeJnL6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="173544264"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="173544264"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE822.infineon.com) ([172.23.29.53])
  by smtp2.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:57:52 +0200
Received: from MUCSE811.infineon.com (172.23.29.37) by MUCSE822.infineon.com
 (172.23.29.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:57:51 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE811.infineon.com
 (172.23.29.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:57:51 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:57:51 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 07/23] mtd: spi-nor: Move the SFDP header structure to
 a C header
Thread-Topic: [PATCH v3 07/23] mtd: spi-nor: Move the SFDP header structure to
 a C header
Thread-Index: AQHdKzc5S3N7+d5VvEWXzZZn39xq07ameygw
Date: Thu, 20 Aug 2026 05:57:51 +0000
Message-ID: <c21838d45aed4ed99364646db69958f3@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
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

PiBUaGUgc2ZkcF9oZWFkZXIgc3RydWN0dXJlIGlzIGN1cnJlbnRseSBkZWZpbmVkIGluIHNmZHAu
Yywgd2hlcmVhcyB0aGUNCj4gc2ZkcF9wYXJhbWV0ZXJfaGVhZGVyIHN0cnVjdHVyZSBpcyBkZWZp
bmVkIGluIHNmZHAuaC4gSW4gb3JkZXIgdG8gZWFzZQ0KPiB0aGUgcmV1c2Ugb2YgdGhpcyBzdHJ1
Y3R1cmUgb3V0c2lkZSBvZiB0aGUgc2ZkcC5jIGZpbGUsIG1vdmUgdGhpcw0KPiBzdHJ1Y3R1cmUg
dG8gdGhlIHNmZHAgQyBoZWFkZXIgKC5oKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBS
YXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+DQoNClJldmlld2VkLWJ5OiBUYWthaGly
byBLdXdhbm8gPHRha2FoaXJvLmt1d2Fub0BpbmZpbmVvbi5jb20+DQoNCg==

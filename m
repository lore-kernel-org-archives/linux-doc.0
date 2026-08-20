Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DE23AB5DE;
	Thu, 20 Aug 2026 05:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787205129; cv=none; b=SsYA2Pa8WO3u3pKTQyc9KNMuqruxv3cMnNzg3PHEoct/41KOd/rCDbPdvTWdYSwiFrNdBzJxqCWYy0qLaXLcNQa4TysYeHh8jSYhnORfpm0jSO6xc5WqDJJa33xhe72zVD6kEsrvFwa4cbPgzDpWjmg2dpLpTfDTlOzn0d3E3vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787205129; c=relaxed/simple;
	bh=ahpxrhIzwwIAbwOr+R2KucV63JvnpiADURbuUKzU5hc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GT9uKT1hLYc2YjOf/+ORtZXYiIxyUmd1YX5OWyhob46njXQY5x3to0fLUy5mHgyZLIkWDyTJkOi6vAUIxQ1R1+KZPqmYG4AB7eemVD9N1jCYIQn8RdvHB5lB0NrR+7U6NWMQzV1XKhHIJkwBXKzRf1+pmyo0lceba7VslNyTDHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=Tzv9vdFP; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="Tzv9vdFP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787205128; x=1818741128;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ahpxrhIzwwIAbwOr+R2KucV63JvnpiADURbuUKzU5hc=;
  b=Tzv9vdFPehmsFaB1UR8sVXb8UQv91fEcYIwdpw0paSV94ia0VgnG+Kp9
   z5bfkLORGj8I0AFoKji8WU5JpZ/DTsQSknwQZNO/1DtGvzzwZulw1zKj2
   1iYGFHDtkLkn+hhbnf5mjlTguecoQ7Z3CiD3rT2DnuEP1sc2hXUMshjBH
   k=;
X-CSE-ConnectionGUID: 7zVRjOo+R9WeBIwxbZHEBA==
X-CSE-MsgGUID: kFU9UMleT+aI19KSF7xBOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="142730413"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="142730413"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE803.infineon.com) ([172.23.29.29])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 07:50:56 +0200
Received: from MUCSE817.infineon.com (172.23.29.43) by MUCSE803.infineon.com
 (172.23.29.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:50:56 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE817.infineon.com
 (172.23.29.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 07:50:55 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 07:50:55 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
Thread-Topic: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
Thread-Index: AQHdKzcjyw4WlRlF90aItjoNCif4ULameOMQ
Date: Thu, 20 Aug 2026 05:50:55 +0000
Message-ID: <c7e7f557f17647b1b7134facaa1cefc1@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
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

PiBUaGUgX0JVR0dZIHN1ZmZpeCBpcyBub3Qgc3VwZXIgYWNjdXJhdGUuIFRoZXJlIGlzIGEgYmVo
YXZpb3IgdGhhdCBpbmRlZWQNCj4gc2VlbXMgc3RyYW5nZSwgYnV0IGl0IGlzIHNvbWV3aGF0IGRv
Y3VtZW50ZWQuIFRoZSBmYWN0IGlzLCB3aXRoIHRoaXMgUUVSDQo+IGZpZWxkIHRoZSBzdGF0dXMg
cmVnaXN0ZXIgaXMgY29uc2lkZXJlZCAxNi1iaXQgd2lkZSBhbmQgaWYgb25lIHdyaXRlcw0KPiB0
aGUgZmlyc3QgOCBiaXRzIChTUjEpIHdpdGhvdXQgdGhlIG5leHQgOCBiaXRzIChTUjIpIHRoZW4g
dGhlIGNvbnRlbnQgb2YNCj4gU1IyIHdpbGwgYmUgYXNzdW1lZCB0byBiZSAweDAwIGFuZCB3aWxs
IGJlIGNsZWFyZWQuDQo+IA0KPiBSZW5hbWUgaXQgQkZQVF9EV09SRDE1X1FFUl9TUjJfQklUMV9O
T18xQl9XUiB0byBhbGlnbiB3aXRoIHRoZSBvdGhlcg0KPiBuYW1pbmdzIChfTk9fUkQpIGFuZCBj
bGFyaWZ5IHRoZSBtZWFuaW5nIG9mIHRoaXMgZmllbGQuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNo
YW5nZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxA
Ym9vdGxpbi5jb20+DQoNClJldmlld2VkLWJ5OiBUYWthaGlybyBLdXdhbm8gPHRha2FoaXJvLmt1
d2Fub0BpbmZpbmVvbi5jb20+DQoNCg==

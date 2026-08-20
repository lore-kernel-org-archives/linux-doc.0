Received: from smtp9.infineon.com (smtp9.infineon.com [217.10.52.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928713B0AD4;
	Thu, 20 Aug 2026 07:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787209431; cv=none; b=Y8E62kZylPK9093Nf9kscSjWXRNavELFinMcx3W2AVDSI0NY11yz0UrwZ763qVNNw6/YBsNCYX9ey5+IfG2ovgRkqxmfcOXvJGnoQ1L2TICTV45oQF+1LPlhBAYiG5LPohu8rQ/cBKduOgrFxu5p5DE8+B2eMN/mlgTrin6eyDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787209431; c=relaxed/simple;
	bh=8uBJ8Mta62b6RmQf7dtw94ndHIb5OKy4XaY6DIy9lLw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l8qBnFK2MejakhVYUu/SQBeOLl+AQtnOdkzymW5l2YLKx4pcRgUEQS7FZR9nVFdJs+EQO3ndIeQsrwt2QrwqWu+Vxtxst8MZ3uyg8kjz9KPv0tQrpfda3m8MPrt8aTBjR51GzVp7k3m/uCb4AcgaNViNsKcWlefIXkfLUYQNQdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=C9lYzc9R; arc=none smtp.client-ip=217.10.52.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="C9lYzc9R"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1787209430; x=1818745430;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8uBJ8Mta62b6RmQf7dtw94ndHIb5OKy4XaY6DIy9lLw=;
  b=C9lYzc9Rt/YOAnF+Hw4LFy/nhln79tp6DAgP9mwQ08/tUIxTiPhmuPti
   TuwqMZKxaVjvId3J4N4WQvE0k6oIJT5ZgQhfWIPZvys5jE8AGV5j3VSAC
   3I6R6wXMD9wNAvj6L2R8HyPkB5QTEYFCjb7Z8dgWSbTbWG+D7AB8nBWcz
   8=;
X-CSE-ConnectionGUID: ABJj3vDsQVOZ22lUpvgejQ==
X-CSE-MsgGUID: wBy2RtI/QkmwESO3DyWbYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="105427185"
X-IronPort-AV: E=Sophos;i="6.25,232,1779141600"; 
   d="scan'208";a="105427185"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE805.infineon.com) ([172.23.29.31])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2026 09:03:45 +0200
Received: from MUCSE818.infineon.com (172.23.29.44) by MUCSE805.infineon.com
 (172.23.29.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:03:44 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE818.infineon.com
 (172.23.29.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 20 Aug
 2026 09:03:44 +0200
Received: from MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14]) by
 MUCSE815.infineon.com ([fe80::ed10:a720:3031:ca14%12]) with mapi id
 15.02.2562.045; Thu, 20 Aug 2026 09:03:44 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <miquel.raynal@bootlin.com>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<richard@nod.at>, <vigneshr@ti.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<corbet@lwn.net>, <skhan@linuxfoundation.org>
CC: <STLin2@winbond.com>, <hsinyi@chromium.org>,
	<thomas.petazzoni@bootlin.com>, <linux-mtd@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-doc@vger.kernel.org>
Subject: RE: [PATCH v3 23/23] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
Thread-Topic: [PATCH v3 23/23] mtd: spi-nor: debugfs: Expose SR opcodes and QE
 mask
Thread-Index: AQHdKzdfZ2b8fOyMyk+wKDEcGW2sy7amjJxQ
Date: Thu, 20 Aug 2026 07:03:44 +0000
Message-ID: <2bf142b04caf4c578cfbc57740490632@infineon.com>
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com>
 <20260813-winbond-v7-1-spi-nor-rv-addition-v3-23-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-23-b637cf120d5c@bootlin.com>
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

SGkgTWlxdWVsLA0KDQo+IEV4cG9zZSBTdGF0dXMgUmVnaXN0ZXIgb3Bjb2RlcyBiYXNlZCBvbiB0
aGUgZmxhc2ggY2FwYWJpbGl0aWVzDQo+IGRpc2NvdmVyZWQgd2hpbGUgcGFyc2luZyB0aGUgU0ZE
UCBRRVIgZmllbGQuDQo+IA0KPiBWYWx1ZSAnMCcgaW5kaWNhdGVzIGFuIGFic2VuY2Ugb2Ygb3Bj
b2RlIChub24gc3VwcG9ydGVkKSwgd2UgZG8gbm90DQo+IHByaW50IGFueXRoaW5nIGluIHRoYXQg
Y2FzZS4NCj4gDQo+IFRoZSBRRSBiaXQgaXMgYWxzbyBkaXNwbGF5ZWQuDQo+IA0KPiBFeGFtcGxl
IG9uIGEgVzI1UTAySlYtTToNCj4gDQo+ICQgZ3JlcCBvcGNvZGVzIC1BMTAgL3N5cy9rZXJuZWwv
ZGVidWcvc3BpLW5vci9zcGkwLjAvcGFyYW1zDQo+IG9wY29kZXMNCj4gIHJlYWQgICAgICAgICAg
IDB4ZWMNCj4gICBkdW1teSBjeWNsZXMgIDYNCj4gIGVyYXNlICAgICAgICAgIDB4ZGMNCj4gIHBy
b2dyYW0gICAgICAgIDB4MzQNCj4gIFNSMSByZWFkICAgICAgIDB4MDUNCj4gIFNSMiByZWFkICAg
ICAgIDB4MzUNCj4gIFNSMStTUjIgd3JpdGUgIDB4MDENCj4gIFFFICAgICAgICAgICAgIFNSMiBi
aXQgMQ0KPiAgOEQgZXh0ZW5zaW9uICAgbm9uZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWlxdWVs
IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4NCg0KUzI1SEw1MTJUOg0Kb3Bjb2Rl
cw0KIHJlYWQgICAgICAgICAgIDB4ZWMNCiAgZHVtbXkgY3ljbGVzICAxMA0KIGVyYXNlICAgICAg
ICAgIDB4ZDgNCiBwcm9ncmFtICAgICAgICAweDEyDQogU1IxIHJlYWQgICAgICAgMHgwNQ0KIFNS
MiByZWFkICAgICAgIDB4MzUNCiBTUjErU1IyIHdyaXRlICAweDAxDQogUUUgICAgICAgICAgICAg
U1IyIGJpdCAxDQogOEQgZXh0ZW5zaW9uICAgcmVwZWF0DQoNClMyNUZTNTEyUzoNCm9wY29kZXMN
CiByZWFkICAgICAgICAgICAweGVjDQogIGR1bW15IGN5Y2xlcyAgMTANCiBlcmFzZSAgICAgICAg
ICAweGRjDQogcHJvZ3JhbSAgICAgICAgMHgxMg0KIFNSMSByZWFkICAgICAgIDB4MDUNCiBTUjIg
cmVhZCAgICAgICAweDM1DQogU1IxK1NSMiB3cml0ZSAgMHgwMQ0KIFFFICAgICAgICAgICAgIFNS
MiBiaXQgMQ0KIDhEIGV4dGVuc2lvbiAgIG5vbmUNCg0KUzI1RkwyNTZTIChubyBTRkRQKToNCm9w
Y29kZXMNCiByZWFkICAgICAgICAgICAweDZjDQogIGR1bW15IGN5Y2xlcyAgOA0KIGVyYXNlICAg
ICAgICAgIDB4ZGMNCiBwcm9ncmFtICAgICAgICAweDEyDQogU1IxIHJlYWQgICAgICAgMHgwNQ0K
IFNSMiByZWFkICAgICAgIDB4MzUNCiBTUjErU1IyIHdyaXRlICAweDAxDQogUUUgICAgICAgICAg
ICAgU1IyIGJpdCAxDQogOEQgZXh0ZW5zaW9uICAgbm9uZQ0KDQpTMjhIUzUxMlQgKE9jdGFsLCBu
byBRRSk6DQpvcGNvZGVzDQogcmVhZCAgICAgICAgICAgMHhlZQ0KICBkdW1teSBjeWNsZXMgIDI0
DQogZXJhc2UgICAgICAgICAgMHhkOA0KIHByb2dyYW0gICAgICAgIDB4MTINCiBTUjEgcmVhZCAg
ICAgICAweDA1DQogU1IyIHJlYWQgICAgICAgMHgzNQ0KIFNSMSB3cml0ZSAgICAgIDB4MDENCiBT
UjErU1IyIHdyaXRlICAweDAxDQogOEQgZXh0ZW5zaW9uICAgcmVwZWF0DQoNClRlc3RlZC1ieTog
VGFrYWhpcm8gS3V3YW5vIDx0YWthaGlyby5rdXdhbm9AaW5maW5lb24uY29tPg0KDQoNCg0K

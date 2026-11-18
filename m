Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=59.120.207.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969865;
	b=wrla70JUpC2ZJKhROdr+bU8pSnuu2ewPXC4OonXPTW2E/m9PbNWKQMf1//U/p7mjHHtn
	 BNasNP20hY/eqaIsr5uXvshp2ic3P7gfecSPFUfvepfCzA6HZa8tKcbwA5fU9rWVaa+bm
	 6tEieY1XxLom5gLd1jqLDFqJLRDFjTcIdMwNWoREOt92fBYZHRWHqD2kBWOWKLR0mU/FV
	 juaWbP7TJkmobn/VTRK4o6E03Lvc2Llq2LPrLpTKvlYhg900K1mOpVnSXqO00vRS0QRCJ
	 WKI9AFuhsAY8BG8A15rmmFJibYR5uyn2YroEYcnLxxhDhp8u+dExzywQgCNWueIW10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969865;
	h=DMARC-Filter:X-UUID:X-CID-P-RULE:X-CID-O-INFO:X-CID-META:X-CID-BVR:
	 X-CID-BAS:X-CID-FACTOR:X-CID-RHF:X-UUID:Received:X-UUID:X-CID-P-RULE:
	 X-CID-O-INFO:X-CID-META:X-CID-BVR:X-CID-BAS:X-CID-FACTOR:X-CID-RHF:
	 X-UUID:Received:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-originating-ip:x-tm-as-product-ver:x-tm-as-result:
	 x-tmase-matchedrid:x-tm-as-user-approved-sender:
	 x-tm-as-user-blocked-sender:x-tmase-result:x-tmase-version:
	 x-tm-snts-smtp:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=oMefaorIZiUogAbzrZGQsijpnbTZQvZuo03f8L5h/WU=;
	b=ocSknWLtxQgcQN7/dSQfuS6/F6ZqQDSHKyppcN6AY4riyxN7Bb/vwiXWt0N7Lrkf1CO6
	 DGDxH4QRpshOiCdDobhErt1i2/8/C+gdOW5DRv5au6iO0ZLx433FVeScaiGRAcN0aZUq4
	 0XHHvNDlF1+mVoIFbTwEW4VzKD1D+Q74TYGszgejrEkUck6Acgo2rqr0vzbYlfhoCwXoG
	 GNNWWrpKcf4H1ysC67aH1T9VqQjEJ/Duisswz3yqUdnNhdO7wiZ/bmXW4nhy0TseFuwur
	 wybIuJADvj6CkbCQSeqIlugYwiLxkVQKdlqFe9L3U+VMt6fsIa96uUAJYzs/k+Pl63w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=compal.com;
	spf=pass smtp.mailfrom=compal.com;
	arc=none smtp.remote-ip=59.120.207.196
Received: from tpecef21.compal.com (exmail3.compal.com [59.120.207.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466E606A31C;
	Wed, 18 Nov 2026 02:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B466E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=compal.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=compal.com
X-UUID: f2983024e2f911f1b2470fb4f881575f-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.20,REQID:f170eca6-d699-4792-a78f-b5699100d9d9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:291e20b,CLOUDID:99627166-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:80|81|82|83|102|110|111|836|865|888|898,TC:-5,
	Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f2983024e2f911f1b2470fb4f881575f-20261118
Received: from sdmg11.sdbg.compal.com [(10.113.168.9)] by tpecef21.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 226442796; Wed, 18 Nov 2026 10:44:16 +0800
X-UUID: eefb6b70e2f911f1907ca11d1ee29896-20261118
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:35fdb544-3d0e-4e3f-9b29-cc40f44af535,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e276073,CLOUDID:1f580031-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|110|111|836|865|888|
	898,TC:-5,Content:0|15|50|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS
	:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,A
	RC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: eefb6b70e2f911f1907ca11d1ee29896-20261118
Received: from sdbmbx13.tpe.compalcomm.com [(10.113.2.137)] by sdmg11.sdbg.compal.com
	(envelope-from <jackbb_wu@compal.com>)
	(Compal Mail Service with TLSv1.2 ECDHE-RSA-AES128-SHA 128/128)
	with ESMTP id 1439997463; Wed, 18 Nov 2026 10:44:10 +0800
Received: from SDBMBX13.tpe.compalcomm.com (10.113.2.137) by
 SDBMBX13.tpe.compalcomm.com (10.113.2.137) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 10:44:08 +0800
Received: from SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf]) by
 SDBMBX13.tpe.compalcomm.com ([fe80::23a8:5ed2:f09e:3abf%11]) with mapi id
 15.02.2562.056; Wed, 18 Nov 2026 10:44:08 +0800
From: "Wu. JackBB (GSM)" <JackBB_Wu@compal.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>, Johannes Berg
	<johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Wen-Zhi Huang <wen-zhi.huang@mediatek.com>, Shi-Wei Yeh
	<shi-wei.yeh@mediatek.com>, Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	"Yu. Robert (GSM)" <robert_yu@compal.com>, "Chang. Jeff (GSM)"
	<Jeff_Chang@compal.com>, Eric Dumazet <edumazet@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>
Subject: Re: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
Thread-Topic: [PATCH net-next v12 2/6] net: wwan: t9xx: Add control plane
 transaction layer framework
Thread-Index: AQHddwavvOJ1mLklYEStYpskeCH+dw==
Date: Wed, 18 Nov 2026 02:44:08 +0000
Message-ID: <e415240553f24e198df67b0f7e0779f7@compal.com>
References: <20261117-t9xx_driver_v1-v12-0-e181b616b820@compal.com>
 <20261117-t9xx_driver_v1-v12-2-e181b616b820@compal.com>,<CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
In-Reply-To: <CAFEp6-2Ru8=dMA=ra3r+ShvxWoLAa0i-xw0e8vhQ+QxRah3f3Q@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tm-as-product-ver: SMEX-14.0.0.3239-9.1.2019-30326.003
x-tm-as-result: No-10--9.178900-8.000000
x-tmase-matchedrid: tkB2VEODQ1cuv++HU7VXryRFbfQbCufdN0X64jGy2dZJTOxleK2tZuZd
	NI5cmL7EqJ63gZLKrOBDdLXYWGnDb52vFMfvZjTGGG92L3YEEC4s49QZH9p6LPpmoO1x9E9p2Z8
	68ZgqJNhpKrf9DoF7ZnlvhmQt/TMQLIEf+lIlZyG5kTI8BpRqcp7EkV3V/yv7YuYLFlhZK0K5Qh
	5TcoREqjf8MHPNq3cEyrzRjZhtElOvngkjHjojpGwZG2qI2OBsWa6vTkKxwrLRSbyPS2HFdyJsZ
	0L4JGotA5sjMuzcYBZ5MplrLPgz9xWgiVbWBq4sc6LF+MWe8KcoPxmxIqavtbN5EjB1voyEzdMI
	eHnsyjs=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--9.178900-8.000000
x-tmase-version: SMEX-14.0.0.3239-9.1.2019-30326.003
x-tm-snts-smtp: 6BEE0141DC73C40C042717AA9F8E2E6F52367E4909DBB822EF41C843FAF952AA2000:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

SGkgTG9pYywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBUdWUsIE5vdiAxNywgMjAy
NiBhdCAxMTozMSBQTSBMb2ljIFBvdWxhaW4gPGxvaWMucG91bGFpbkBvc3MucXVhbGNvbW0uY29t
PiB3cm90ZToNCj4gPiArI2luY2x1ZGUgPGxpbnV4L3NrYnVmZi5oPg0KPg0KPiBJcyBpdCBhY3R1
YWxseSB1bnVzZWQgaGVyZT8NCg0KWWVzLCBpdCBpcyB1bnVzZWQgaW4gdGhpcyBwYXRjaC4gIFdp
bGwgZml4IGluIHYxMzogdGhlIGluY2x1ZGUgbW92ZXMgdG8NCnRoZSBjb250cm9sIERNQSBwYXRj
aCwgd2hpY2ggYWRkcyB0aGUgZmlyc3Qgc2tfYnVmZiB1c2VyIHRvIHRoaXMgaGVhZGVyLg0KDQo+
ID4gKyNpbmNsdWRlIDxsaW51eC9saXN0Lmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9za2J1ZmYu
aD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+DQo+IFNhbWUgcXVlc3Rpb24uDQpB
bGwgdGhyZWUgYXJlIGZpcnN0IG5lZWRlZCBieSB0aGUgbmV4dCBwYXRjaCBhbmQgd2lsbCBtb3Zl
DQp0aGVyZSBpbiB2MTMuICBJIHdlbnQgdGhyb3VnaCB0aGUgaW5jbHVkZXMgb2YgdGhlIHdob2xl
IHNlcmllcyBmb3IgdGhlDQpzYW1lIHByb2JsZW0gYW5kIHYxMyB3aWxsIGFsc28gZHJvcCB0aGUg
b25lcyBubyBwYXRjaCB1c2VzLg0KDQpUaGFua3MsDQpKYWNr

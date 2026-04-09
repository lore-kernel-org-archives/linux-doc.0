Received: from outbound.baidu.com (jpmx.baidu.com [119.63.196.201])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 5D3B035C1BC;
	Thu,  9 Apr 2026 02:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=119.63.196.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775701155; cv=none; b=DSTd0bs6rUpeacP61LwvweVhVf3/kj2d5KAF1+GuoWj4vZx+4YCv9rYFOVIg+Dh5oR0JDqslad4UTYSZArmWP0XAR27ZgU1o7ZFbb68SnjbAarXJ2PlTgT7ZFbhl9yaeRgqsKJQL90EVd/GyNsRv9azragPxOdscWt+kcAixytY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775701155; c=relaxed/simple;
	bh=6xOjhOLSHUpIfcsPl7XZ47j2Aog4CGA50Vcf8tsgzms=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kixKECxESc0ob5mG1OlDSRdSRkIKFDkPhw/R9iE794oh29n9oggxMjitSohhqTvvQF2PbT9hZtsi+0t6EBt6BBnAwiDpv976lUehYf2oL0Mry2zuzucxbSN7vLmnTZFpHqxiCqdNaRx5CDTfrQlQRXQQYkKFQng9vqe++hvmeuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com; spf=pass smtp.mailfrom=baidu.com; dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b=Cln1iO63; arc=none smtp.client-ip=119.63.196.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=baidu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baidu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baidu.com header.i=@baidu.com header.b="Cln1iO63"
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.48
From: "Li,Rongqing(ACG CCN)" <lirongqing@baidu.com>
To: Jonathan Corbet <corbet@lwn.net>, Andrew Morton
	<akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Randy Dunlap
	<rdunlap@infradead.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>, Peter Zijlstra
	<peterz@infradead.org>, Feng Tang <feng.tang@linux.alibaba.com>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Askar Safin <safinaskar@gmail.com>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Sohil Mehta <sohil.mehta@intel.com>
Subject: =?gb2312?B?tPC4tDogW1BBVENIIHYyXSBEb2N1bWVudGF0aW9uL2tlcm5lbC1wYXJhbWV0?=
 =?gb2312?B?ZXJzOiBmaXggYXJjaGl0ZWN0dXJlIGFsaWdubWVudCBmb3IgcHQsIG5vcHQs?=
 =?gb2312?Q?_and_nobypass?=
Thread-Topic: [PATCH v2] Documentation/kernel-parameters: fix architecture
 alignment for pt, nopt, and nobypass
Thread-Index: AQHcwDRlnxv43Q2StE+OgyPTkIqs67XWDd1A
Date: Thu, 9 Apr 2026 02:18:55 +0000
Message-ID: <f563557f63214ee2ae7327036a1e8e43@baidu.com>
References: <20260330105957.2271-1-lirongqing@baidu.com>
In-Reply-To: <20260330105957.2271-1-lirongqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1775701142;
	bh=6xOjhOLSHUpIfcsPl7XZ47j2Aog4CGA50Vcf8tsgzms=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type;
	b=Cln1iO63fMdi3BuYOPpgwZciErnJv0VFYExx914HrmmnQKIwuvEwiSEV0bsswvBy2
	 vaRrcH/gmrubwz3LO8mWY0jc5lbfe+pGsNeyoVkQ24rbbJdiB45tan6+YEUpC9ziBn
	 0gnh0rYrQvtNUigd2Z0eIemaDddIzmCD+nvhz1dnDk58gu5dZNiKetOckEQb8UG3nW
	 AeKRCgWSA4fValXExL4UeWrBXuonR5STNLb+ma5zq5mjtf8HJqsOBtCZrxXZrLrxCv
	 ualOyXl5BHCyE89IsYNx4u9BT/+RLYUdRJ7G4xVQSmjrUwMk9HqXTHpqNBMuGIvdAx
	 2W4sEfR6B2buw==

PiDW98ziOiBbUEFUQ0ggdjJdIERvY3VtZW50YXRpb24va2VybmVsLXBhcmFtZXRlcnM6IGZpeCBh
cmNoaXRlY3R1cmUgYWxpZ25tZW50DQo+IGZvciBwdCwgbm9wdCwgYW5kIG5vYnlwYXNzDQo+IA0K
PiBGcm9tOiBMaSBSb25nUWluZyA8bGlyb25ncWluZ0BiYWlkdS5jb20+DQo+IA0KPiBDb21taXQg
YWIwZTdmMjA3NjhhICgiRG9jdW1lbnRhdGlvbjogTWVyZ2UgeDg2LXNwZWNpZmljIGJvb3Qgb3B0
aW9ucyBkb2MNCj4gaW50byBrZXJuZWwtcGFyYW1ldGVycy50eHQiKSBpbnRyb2R1Y2VkIGEgZm9y
bWF0dGluZyByZWdyZXNzaW9uIHdoZXJlDQo+IGFyY2hpdGVjdHVyZSB0YWdzIHdlcmUgcGxhY2Vk
IG9uIHNlcGFyYXRlIGxpbmVzIHdpdGggYnJva2VuIGluZGVudGF0aW9uLg0KPiBUaGlzIGNhdXNl
ZCB0aGUgJ25vcHQnIFtYODZdIHBhcmFtZXRlciB0byBhcHBlYXIgYXMgaWYgaXQgYmVsb25nZWQg
dG8gdGhlDQo+IFtQUEMvUE9XRVJOVl0gc2VjdGlvbi4NCj4gDQo+IEZ1cnRoZXJtb3JlLCBzaW5j
ZSB0aGUgbWFpbiAnaW9tbXU9JyBwYXJhbWV0ZXIgaGVhZGluZyBhbHJlYWR5IHNwZWNpZmllcyBp
dCBpcw0KPiBmb3IgW1g4NiwgRUFSTFldLCB0aGUgc3Vic2VxdWVudCBzdGFuZGFsb25lIFtYODZd
IHRhZ3MgZm9yICdwdCcsICdub3B0JywgYW5kIHRoZQ0KPiBBTUQgR0FSVCBvcHRpb25zIGFyZSBy
ZWR1bmRhbnQgYW5kIGNsdXR0ZXIgdGhlIGRvY3VtZW50YXRpb24uDQo+IA0KPiBDbGVhbiB1cCB0
aGUgZm9ybWF0dGluZyBieSByZW1vdmluZyB0aGVzZSByZWR1bmRhbnQgdGFncyBhbmQgcHJvcGVy
bHkNCj4gYXR0cmlidXRpbmcgdGhlICdub2J5cGFzcycgb3B0aW9uIHRvIFtQUEMvUE9XRVJOVl0u
DQo+IA0KDQoNClBpbmcNCg0KdGhhbmtzDQoNCltMaSxSb25ncWluZ10gDQoNCg0KDQo+IEZpeGVz
OiBhYjBlN2YyMDc2OGEgKCJEb2N1bWVudGF0aW9uOiBNZXJnZSB4ODYtc3BlY2lmaWMgYm9vdCBv
cHRpb25zIGRvYw0KPiBpbnRvIGtlcm5lbC1wYXJhbWV0ZXJzLnR4dCIpDQo+IEFja2VkLWJ5OiBS
YW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogTGkg
Um9uZ1FpbmcgPGxpcm9uZ3FpbmdAYmFpZHUuY29tPg0KPiBDYzogSm9uYXRoYW4gQ29yYmV0IDxj
b3JiZXRAbHduLm5ldD4NCj4gQ2M6IFNodWFoIEtoYW4gPHNraGFuQGxpbnV4Zm91bmRhdGlvbi5v
cmc+DQo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KPiBD
YzogQm9yaXNsYXYgUGV0a292IChBTUQpIDxicEBhbGllbjguZGU+DQo+IENjOiBSYW5keSBEdW5s
YXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gQ2M6IFBldGVyIFppamxzdHJhIChJbnRlbCkg
PHBldGVyekBpbmZyYWRlYWQub3JnPg0KPiBDYzogRmVuZyBUYW5nIDxmZW5nLnRhbmdAbGludXgu
YWxpYmFiYS5jb20+DQo+IENjOiBQYXdhbiBHdXB0YSA8cGF3YW4ua3VtYXIuZ3VwdGFAbGludXgu
aW50ZWwuY29tPg0KPiBDYzogRGFwZW5nIE1pIDxkYXBlbmcxLm1pQGxpbnV4LmludGVsLmNvbT4N
Cj4gQ2M6IEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwub3JnPg0KPiBDYzogTWFyY28gRWx2ZXIgPGVs
dmVyQGdvb2dsZS5jb20+DQo+IENjOiBQYXVsIEUuIE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5v
cmc+DQo+IENjOiBBc2thciBTYWZpbiA8c2FmaW5hc2thckBnbWFpbC5jb20+DQo+IENjOiBCam9y
biBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPg0KPiBDYzogU29oaWwgTWVodGEgPHNvaGls
Lm1laHRhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tl
cm5lbC1wYXJhbWV0ZXJzLnR4dCB8IDYgKy0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dA0KPiBpbmRleCAwM2E1NTA2Li41MjUzYzIz
IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0
ZXJzLnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0
ZXJzLnR4dA0KPiBAQCAtMjYxNSwxNSArMjYxNSwxMSBAQCBLZXJuZWwgcGFyYW1ldGVycw0KPiAg
CQkJSW50ZWwgbWFjaGluZXMpLiBUaGlzIGNhbiBiZSB1c2VkIHRvIHByZXZlbnQgdGhlIHVzYWdl
DQo+ICAJCQlvZiBhbiBhdmFpbGFibGUgaGFyZHdhcmUgSU9NTVUuDQo+IA0KPiAtCQkJW1g4Nl0N
Cj4gIAkJcHQNCj4gLQkJCVtYODZdDQo+ICAJCW5vcHQNCj4gLQkJCVtQUEMvUE9XRVJOVl0NCj4g
LQkJbm9ieXBhc3MNCj4gKwkJbm9ieXBhc3MJW1BQQy9QT1dFUk5WXQ0KPiAgCQkJRGlzYWJsZSBJ
T01NVSBieXBhc3MsIHVzaW5nIElPTU1VIGZvciBQQ0kgZGV2aWNlcy4NCj4gDQo+IC0JCVtYODZd
DQo+ICAJCUFNRCBHYXJ0IEhXIElPTU1VLXNwZWNpZmljIG9wdGlvbnM6DQo+IA0KPiAgCQk8c2l6
ZT4NCj4gLS0NCj4gMi45LjQNCg0K

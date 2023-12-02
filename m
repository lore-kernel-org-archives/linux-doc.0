Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83CEB125
	for <linux-doc@vger.kernel.org>; Sat,  2 Dec 2023 07:52:06 -0800 (PST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-270-fdBml9uHNSOD5Hu3Vx4AmA-1; Sat, 02 Dec 2023 15:52:04 +0000
X-MC-Unique: fdBml9uHNSOD5Hu3Vx4AmA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sat, 2 Dec
 2023 15:51:52 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sat, 2 Dec 2023 15:51:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Waiman Long' <longman@redhat.com>, Jann Horn <jannh@google.com>
CC: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: RE: [PATCH] locking: Document that mutex_unlock() is non-atomic
Thread-Topic: [PATCH] locking: Document that mutex_unlock() is non-atomic
Thread-Index: AQHaJGdmWd9hceM5t0qWKvuVqma2ELCUtpLQgAAMJ+GAAADgMIAACSgAgAFVFvA=
Date: Sat, 2 Dec 2023 15:51:52 +0000
Message-ID: <f98b04e05c964b57bc27fb895810aaaf@AcuMS.aculab.com>
References: <20231130204817.2031407-1-jannh@google.com>
 <06c05c8b-9a3b-4c04-b898-0f82e98da70f@redhat.com>
 <CAG48ez1a=VuEWwPTjcXFAwCyt9bRH-WzAfw0uP-qVu83kdxkZw@mail.gmail.com>
 <28b147c3d7354d1a8ff0b903da9b54f4@AcuMS.aculab.com>
 <CAG48ez1bOwbqEbD_ycC2fyWK_tW4rqr=gogJbQOx5CECyPGZcg@mail.gmail.com>
 <1bcee696-d751-413c-a2ec-4a8480bae00b@redhat.com>
 <780e652ff52044d4a213cacbd9276cf8@AcuMS.aculab.com>
 <501501ef-137a-4797-9d43-48ea68851147@redhat.com>
In-Reply-To: <501501ef-137a-4797-9d43-48ea68851147@redhat.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

RnJvbTogV2FpbWFuIExvbmcNCj4gU2VudDogMDEgRGVjZW1iZXIgMjAyMyAxOToxNg0KPiANCj4g
T24gMTIvMS8yMyAxMzo0NCwgRGF2aWQgTGFpZ2h0IHdyb3RlOg0KPiA+DQo+ID4gUGVuZGluZyB3
YWl0ZXJzIGFyZW4ndCB0aGUgcHJvYmxlbS4NCj4gPg0KPiBQZW5kaW5nIHdhaXRlcnMgY2FuIHN0
aWxsIGJlIGEgcHJvYmxlbSBpZiBjb2RlIGRlY2lkZXMgdG8gZnJlZSB0aGUgbG9jaw0KPiBjb250
YWluaW5nIG9iamVjdCBhZnRlciBhIGxvY2svdW5sb2NrIHNlcXVlbmNlIGFzIGl0IG1heSBjYXVz
ZQ0KPiB1c2UtYWZ0ZXItZnJlZS4NCj4gPg0KPiA+IFlvdSBoYXZlIHRvIGVuc3VyZSB0aGVyZSBh
cmVuJ3QgYW55LCBidXQgdGhlIG11dGV4KCkgY2FuIGJlIGhlbGQuDQo+ID4NCj4gVXNpbmcgcmVm
ZXJlbmNlIGNvdW50IHRvIHRyYWNrIHRoZSBudW1iZXIgb2YgYWN0aXZlIHVzZXJzIGlzIG9uZSB3
YXkgdG8NCj4gcHJldmVudCB0aGF0IGlmIHlvdSBvbmx5IHJlbGVhc2UgdGhlIHJlZmVyZW5jZSBj
b3VudCBhZnRlcg0KPiBtdXRleF91bmxvY2soKSByZXR1cm5zIGJ1dCBub3QgaW4gdGhlIGxvY2sg
Y3JpdGljYWwgc2VjdGlvbi4NCg0KSSBzdXNwZWN0IHRoZSBkb2N1bWVudGF0aW9uIG5lZWQgdG8g
YmUgbW9yZSBleHBsaWNpdCB0aGFuIGp1c3Qgc2F5aW5nDQppdCBpcyBub24tYXRvbWljLg0KU2F5
aW5nIHNvbWV0aGluZyBsaWtlOg0KDQpUaGUgbXV0ZXggc3RydWN0dXJlIG1heSBiZSBhY2Nlc3Nl
ZCBieSBtdXRleF91bmxvY2soKSBhZnRlciBhbm90aGVyDQp0aHJlYWQgaGFzIGxvY2tlZCBhbmQg
dW5sb2NrZWQgdGhlIG11dGV4Lg0KDQpTbyBpZiBhIHJlZmVyZW5jZSBjb3VudCBpcyB1c2VkIHRv
IGVuc3VyZSBhIHN0cnVjdHVyZSByZW1haW5zIHZhbGlkIHdoZW4NCmEgbG9jayBpcyByZWxlYXNl
ZCAod2l0aCB0aGUgaXRlbSBiZWluZyBmcmVlZCB3aGVuIHRoZSBjb3VudCBiZWNvbWVzIHplcm8p
DQp0aGUgcmVmZXJlbmNlIGNvdW50IGl0c2VsZiBjYW5ub3QgYmUgcHJvdGVjdGVkIGJ5IGEgbXV0
ZXggaW4gdGhlIHN0cnVjdHVyZS4NClNvIGNvZGUgbGlrZToNCgkuLi4NCgljb3VudCA9IC0taXRl
bS0+cmVmY291bnQ7DQoJbXV0ZXhfdW5sb2NrKGl0ZW0tPm10eCk7DQoJaWYgKCFjb3VudCkNCgkJ
ZnJlZShpdGVtKTsNCmNhbiBsZWFkIHRvIGEgJ3VzZSBhZnRlciBmcmVlJyBpbiBtdXRleF91bmxv
Y2soKS4NCkhvd2V2ZXIgaWYgdGhlIHJlZmNvdW50IGlzIGF0b21pYyBhbmQgZGVjcmVtZW50ZWQg
d2l0aG91dCB0aGUNCm11dGV4IGhlbGQgdGhlcmUgaXNuJ3QgYSBwcm9ibGVtLg0KDQoJRGF2aWQN
Cg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZh
cm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYg
KFdhbGVzKQ0K


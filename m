Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BB73806BD;
	Mon,  2 Feb 2026 17:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054563; cv=none; b=hjT3uY6lAQ7VV+XmcA//d7KPAkdukQN+oFdNTEciC9xp0ADxjzdzzl0i1Mlz/vQIDx+9VUdkM+uXCld4UwCsEE6Md4zeSis1JIAokqX6kAYRysrlUPWLL8O1UxzLANB1fRRf+95sB+s8QaFfhnGNtg0pgwntBmn3eKPZPSwwxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054563; c=relaxed/simple;
	bh=WbjAZRrEsrpqlbZTrPrIZ2KI90tSkIv3uHXWcKxEEX8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=T3g1xLqGKYIV7LMXDkXB3HXA/NBfAtPsjrcZW0h2f4Ae2fRM06rVbf32BGxtQrcMQvYjrCFSCpFm1hhfy+aPDfzuBP7W55QYacvI2kQ8+1pRaZ7VTaFKlAQO9wN+/+cFjk0xVg7LSlpdAi1+cgFDoUwiqHWxuwckMWDizEVElk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=jgkKRxFx; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="jgkKRxFx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770054562; x=1801590562;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=WbjAZRrEsrpqlbZTrPrIZ2KI90tSkIv3uHXWcKxEEX8=;
  b=jgkKRxFxZYEVtp2za+PzH7FopNgI0I+plL78SmddQhwUAnXZF1GFq66+
   q6n1u6qxF9EDiZDCt9xF1tvFrw6mSempMKXlK+mTuSkPP9fYI/lnOirVp
   HaKxcVqnr0xWR5P2WDYgmRB0IvZPch2Tqy7tB/0ucjLMDbdsgLffbv2JZ
   6GmHzCSNbXA7NXmgal0QYcGYQeILBuaZH4+CCR8sdbPv8incQmlqnDm8c
   T7nXFB8fi7vexQRDRfHmd6AOdsvmt0ElpYysD+xMq7U7kGcKRiMHIHXVZ
   LbFus/SrYF4LuN1waA5hOSxfrAxiHB+xCSQlffi8cateSVb1jmLjSLQMq
   g==;
X-CSE-ConnectionGUID: 1/i0WIESR9Ca/rFbREMRNg==
X-CSE-MsgGUID: rH4Z0bntRb6tfrtNIwqhnw==
X-IronPort-AV: E=Sophos;i="6.21,269,1763424000"; 
   d="scan'208";a="12113048"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 17:49:21 +0000
Received: from EX19MTAUWA002.ant.amazon.com [205.251.233.234:22198]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.0.174:2525] with esmtp (Farcaster)
 id 4f1001dd-00ac-4dc7-a284-44d55b01adbe; Mon, 2 Feb 2026 17:49:21 +0000 (UTC)
X-Farcaster-Flow-ID: 4f1001dd-00ac-4dc7-a284-44d55b01adbe
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:49:20 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Mon, 2 Feb 2026
 17:49:15 +0000
Message-ID: <e38c5244-9e8f-467c-b3aa-8098f288a2c3@amazon.com>
Date: Mon, 2 Feb 2026 18:49:13 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add HPET NMI Watchdog support
From: Alexander Graf <graf@amazon.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Clemens
 Ladisch" <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
	<mingo@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, <nh-open-source@amazon.com>, "Nicolas Saenz
 Julienne" <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>, Filippo
 Sironi <sironi@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>,
	=?UTF-8?Q?Jan_Sch=C3=B6nherr?= <jschoenh@amazon.de>
References: <20260202174316.65044-1-graf@amazon.com>
Content-Language: en-US
In-Reply-To: <20260202174316.65044-1-graf@amazon.com>
X-ClientProxiedBy: EX19D042UWA004.ant.amazon.com (10.13.139.16) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDAyLjAyLjI2IDE4OjQzLCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPiBUaGUgY3VycmVudCBO
TUkgd2F0Y2hkb2cgcmVsaWVzIG9uIHBlcmZvcm1hbmNlIGNvdW50ZXJzIGFuZCBjb25zaXN0ZW50
bHkKPiBvY2N1cGllcyBvbmUgb24gZWFjaCBDUFUuIFdoZW4gcnVubmluZyB2aXJ0dWFsIG1hY2hp
bmVzLCB3ZSB3YW50IHRvIHBhc3MKPiBwZXJmb3JtYW5jZSBjb3VudGVycyB0byB2aXJ0dWFsIG1h
Y2hpbmVzIHNvIHRoZXkgY2FuIG1ha2UgdXNlIG9mIHRoZW0uCj4gSW4gYWRkaXRpb24gdGhlIGhv
c3Qgc3lzdGVtIHdhbnRzIHRvIHVzZSBwZXJmb3JtYW5jZSBjb3VudGVycyB0byBjaGVjawo+IHRo
ZSBzeXN0ZW0gdG8gaWRlbnRpZnkgd2hlbiBhbnl0aGluZyBsb29rcyBhYm5vcm1hbCwgc3VjaCBh
cyBzcGxpdAo+IGxvY2tzLgo+Cj4gVGhhdCBtYWtlcyBQTUNzIGEgcHJlY2lvdXMgcmVzb3VyY2Uu
IFNvIGFueSBQTUMgd2UgY2FuIGZyZWUgdXAgaXMgYSBQTUMKPiB3ZSBjYW4gdXNlIGZvciBzb21l
dGhpbmcgdXNlZnVsLiBUaGF0IG1hZGUgbWUgbG9vayBhdCB0aGUgTk1JIHdhdGNoZG9nLgo+Cj4g
VGhlIFBNQyBiYXNlZCBOTUkgd2F0Y2hkb2cgaW1wbGVtZW50YXRpb24gZG9lcyBub3QgYWN0dWFs
bHkgbmVlZCBhbnkKPiBwZXJmb3JtYW5jZSBjb3VudGluZy4gSXQganVzdCBuZWVkcyBhIHBlci1D
UFUgTk1JIHRpbWVyIHNvdXJjZS4gWDg2Cj4gc3lzdGVtcyBjYW4gbWFrZSBhbnl0aGluZyB0aGF0
IGVtaXRzIGFuIGludGVycnVwdCBkZXNjcmlwdG9yIChJT0FQSUMsCj4gTVNJKC1YKSwgZXRjKSBi
ZWNvbWUgYW4gTk1JIHNvdXJjZS4gU28gYW55IHRpbWUgZ29lcy4gSW5jbHVkaW5nIHRoZQo+IEhQ
RVQuIEFuZCB3aGlsZSB0aGV5IGNhbid0IHJlYWxseSBvcGVyYXRlIHBlci1DUFUsIGluIGFsbW9z
dCBhbGwgY2FzZXMKPiB5b3Ugb25seSByZWFsbHkgd2FudCB0aGUgTk1JIG9uICphbGwqIENQVXMs
IHJhdGhlciB0aGFuIHBlci1DUFUuCj4KPiBTbyBJIHRvb2sgYSBzdGFiIGF0IGJ1aWxkaW5nIGFu
IEhQRVQgYmFzZWQgTk1JIHdhdGNoZG9nLiBJbiBteSAoUUVNVQo+IGJhc2VkKSB0ZXN0aW5nLCBp
dCdzIGZ1bGx5IGZ1bmN0aW9uYWwgYW5kIGNhbiBzdWNjZXNzZnVsbHkgZGV0ZWN0IHdoZW4KPiBD
UFVzIGdldCBzdHVjay4gSXQgZXZlbiBzdXJ2aXZlcyBzdXNwZW5kL3Jlc3VtZSBjeWNsZXMuCj4K
PiBGb3Igbm93LCBpdHMgZW5hYmxlbWVudCBpcyBhIGNvbmZpZyB0aW1lIG9wdGlvbiBiZWNhdXNl
IHRoZSBoYXJkbG9ja3VwCj4gZnJhbWV3b3JrIGRvZXMgbm90IHN1cHBvcnQgZHluYW1pYyBzd2l0
Y2hpbmcgb2YgbXVsdGlwbGUgZGV0ZWN0b3JzLgo+IFRoYXQncyBvayBmb3Igb3VyIHVzZSBjYXNl
LiBCdXQgbWF5YmUgc29tZXRoaW5nIGZvciB0aGUgaW50ZXJlc3RlZAo+IHJlYWRlciB0byB0YWNr
bGUgZXZlbnR1YWxseSA6KS4KPgo+IFlvdSBjYW4gZW5hYmxlIHRoZSBIUEVUIHdhdGNoZG9nIGJ5
IGRlZmF1bHQgYnkgc2V0dGluZwo+Cj4gICAgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfSFBF
VF9ERUZBVUxUPXkKPgo+IG9yIHBhc3NpbmcgImhwZXQ9d2F0Y2hkb2ciIHRvIHRoZSBrZXJuZWwg
Y29tbWFuZCBsaW5lLiBXaGVuIGFjdGl2ZSwgaXQKPiB3aWxsIGVtaXQgYSBrZXJuZWwgbG9nIG1l
c3NhZ2UgdG8gaW5kaWNhdGUgaXQgd29ya3M6Cj4KPiAgICBbICAgIDAuMTc5MTc2XSBocGV0OiBI
UEVUIHdhdGNoZG9nIGluaXRpYWxpemVkIG9uIHRpbWVyIDAsIEdTSSAyCj4KPiBUaGUgSFBFVCBj
YW4gb25seSBiZSBpbiBlaXRoZXIgd2F0Y2hkb2cgb3IgZ2VuZXJpYyBtb2RlLiBJIGFtIGEgYml0
Cj4gd29ycmllZCBhYm91dCBJTy1BUElDIHBpbiBhbGxvY2F0aW9uIGxvZ2ljLCBzbyBJIG9wdGVk
IHRvIHJldXNlIHRoZQo+IGdlbmVyaWMgdGltZXIgcGluLiBBbmQgdGhhdCBtZWFucyBJJ20gZWZm
ZWN0aXZlbHkgYnJlYWtpbmcgdGhlIG5vcm1hbAo+IGludGVycnVwdCBkZWxpdmVyeSBwYXRoLiBz
byB0aGUgZWFzeSB3YXkgb3V0IHdhcyB0byBzYXkgd2hlbiB3YXRjaGRvZyBpcwo+IGFjdGl2ZSwg
UElUIGFuZCBIUEVUIGFyZSBub3QgYXZhaWxhYmxlIGFzIHRpbWVyIHNvdXJjZXMuIFdoaWNoIGlz
IG9rIG9uCj4gbW9kZXJuIHN5c3RlbXMuIFRoZXJlIGFyZSB3YXkgdG9vIG1hbnkgKHVucmVsaWFi
bGUpIHRpbWVyIHNvdXJjZXMgb24geDg2Cj4gYWxyZWFkeS4gVHJpbW1pbmcgYSBmZXcgc3VyZWx5
IHdvbid0IGh1cnQuCj4KPiBJJ20gb3BlbiB0byBpbnB1dHMgb24gaG93IHRvIG1ha2UgdGhlIEhQ
RVQgbXVsdGktcHVycG9zZSB0aG91Z2gsIGluIGNhc2UKPiBhbnlvbmUgZmVlbHMgc3Ryb25nbHkg
YWJvdXQgaXQuCgoKU29ycnkgZm9yIHRoZSByZXNlbmQuIEkgY2F1Z2h0IGFuIGlzc3VlIHdoaWxl
IHNlbmRpbmcgb3V0IHRoZSBzZXJpZXMsIApoaXQgY3RybC1jIGJlZm9yZSB0aGlua2luZyBhbmQg
c3VkZGVubHkgaGFkIGEgaGFsZiBzZW50IHNlcmllcy4gRGlzY2FyZCAKdGhpcyBvbmUuIEhhcHB5
IHJldmlldyBvbiB0aGUgcmVhbCwgZnVsbCBvbmUgOikKCgpBbGV4CgoKCgpBbWF6b24gV2ViIFNl
cnZpY2VzIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKVGFtYXJhLURhbnotU3RyLiAx
MwoxMDI0MyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RvZiBIZWxsbWlzLCBBbmRy
ZWFzIFN0aWVnZXIKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50
ZXIgSFJCIDI1Nzc2NCBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDM2NSA1MzggNTk3Cg==


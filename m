Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C366C318ED6;
	Tue,  3 Feb 2026 10:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770115499; cv=none; b=jmif+XDYC72IkKI5Qi4q+XZelkzhsHShKaJ8ydK25t4iz5dqryHLsjHetigZxeFfFDBUjwLBx6GnXCJlAJm7F8ihG6xji+cjkorRE6jo/zWVKcpExrVv26D12Fzg0w5dNGSHlJbzqXqMB7Zn0kKRMwyOxHEosj1vBcKpL6qsAzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770115499; c=relaxed/simple;
	bh=SZmrpJQ2iEeCZ+n759XgT6tihlcZEXe0vvB4NvD0B/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AIbDyRXHG5H4lczw1Jm+u4NoYZE+qTCMkuOEWWfPJEOXlGw+Pk6F5ONxZuE4Dx8rdV2DVW5lhGCnlM0Plq34lOV+U/9K37axg7CpynxSFvZxuw9rlQ7pNm+Gvqy7x2b6m4NQMNjV2+FfIrsETO8rMZcMF79Tb1kOVo+PIps3nJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=RiLYj1Go; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="RiLYj1Go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770115497; x=1801651497;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SZmrpJQ2iEeCZ+n759XgT6tihlcZEXe0vvB4NvD0B/s=;
  b=RiLYj1Gob68B5xUrP5zZeHAnOmnX4pycSpeInu8Xez9oTbUELnFxvP6c
   zCxucJFs/MZ4afE3fGPJsYq9f9NcCFF0jsx3uNa4gzFTwx0VrFAhieGZc
   1mhYLTeZvsXn2K+/UyUKCmCISIWBCDY9X5awWPvbCnYTgYvX2zcDu+eAc
   txA2me/InrHGc781WmUb/A3TMgdLN+vzvSRlfjzjwO7xeJf1zk1isoiBw
   y4/wIkz3/DxLaeZIjhVEVbo5l2wQuW9xNuPjB9JVVbtjlVfLeaaXLdUAC
   RLdW2kqLQNUfoHbfPtgMQwKQ+E041jNAbQZ8z5c2cXigvVcEhqNnh3MUz
   g==;
X-CSE-ConnectionGUID: Ye6OeT3LTJ+o12L8pzS2Rg==
X-CSE-MsgGUID: B8miwbOETKOhaufwLZttFw==
X-IronPort-AV: E=Sophos;i="6.21,270,1763424000"; 
   d="scan'208";a="12183553"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 10:44:55 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.104:26306]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.59.190:2525] with esmtp (Farcaster)
 id 3cdc8d1b-b345-49c1-9e4a-c43113ad086f; Tue, 3 Feb 2026 10:44:54 +0000 (UTC)
X-Farcaster-Flow-ID: 3cdc8d1b-b345-49c1-9e4a-c43113ad086f
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Tue, 3 Feb 2026 10:44:54 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Tue, 3 Feb 2026
 10:44:50 +0000
Message-ID: <14b61a77-98ae-4285-a1e1-a61fe1221f9a@amazon.com>
Date: Tue, 3 Feb 2026 11:44:48 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/ioapic: Add NMI delivery configuration helper
To: Thomas Gleixner <tglx@kernel.org>, <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Clemens
 Ladisch" <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
	<mingo@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Paolo Bonzini
	<pbonzini@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	<nh-open-source@amazon.com>, Nicolas Saenz Julienne <nsaenz@amazon.es>,
	Hendrik Borghorst <hborghor@amazon.de>, Filippo Sironi <sironi@amazon.de>,
	David Woodhouse <dwmw@amazon.co.uk>, =?UTF-8?Q?Jan_Sch=C3=B6nherr?=
	<jschoenh@amazon.de>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-2-graf@amazon.com> <87ldha3zs5.ffs@tglx>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <87ldha3zs5.ffs@tglx>
X-ClientProxiedBy: EX19D039UWB004.ant.amazon.com (10.13.138.57) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDAzLjAyLjI2IDExOjA4LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gT24gTW9uLCBGZWIg
MDIgMjAyNiBhdCAxNzo0OCwgQWxleGFuZGVyIEdyYWYgd3JvdGU6Cj4+IFRvIGltcGxlbWVudCBh
biBIUEVUIGJhc2VkIE5NSSB3YXRjaGRvZywgdGhlIEhQRVQgY29kZSB3aWxsIG5lZWQgdG8KPj4g
cmVjb25maWd1cmUgYW4gSU9BUElDIHBpbiB0byBOTUkgbW9kZS4gQWRkIGEgZnVuY3Rpb24gdGhh
dCBhbGxvd3MgZHJpdmVyCj4+IGNvZGUgdG8gY29uZmlndXJlIGFuIElPQVBJQyBwaW4gZm9yIE5N
SSBkZWxpdmVyeSBtb2RlLgo+IEEgZnVuY3Rpb24gd2hpY2ggdmlvbGF0ZXMgYWxsIGxheWVyaW5n
IG9mIHRoZSBpbnRlcnJ1cHQgaGllcmFyY2h5Li4uCgoKWWVzLCBqdXN0IGxpa2UgdGhlIGRldmlj
ZSBpdHNlbGYgOikuIFRoZSBIUEVUIGlzIG1hZ2ljYWwuCgpMZXQgbWUgdHJ5IGFuZCBzZWUgd2hl
dGhlciBJIGNhbiBqdXN0IG1ha2UgdGhlIEhQRVQgbG9naWMgcmVxdWlyZSBNU0kgCihGU0IpIG1v
ZGUsIHNvIGl0IGNhbiBnZW5lcmF0ZSB0aGUgTk1JIE1TSSBtZXNzYWdlIGl0c2VsZiBhbmQgcG9z
dCBpdCAKd2l0aG91dCBnb2luZyB0aHJvdWdoIHRoZSBJT0FQSUMgaW4gdGhlIGZpcnN0IHBsYWNl
LiBUaGF0J3MgcHJvYmFibHkgCmNsZWFuZXIsIG1vcmUgc2VsZiBjb250YWluZWQgYW5kIGhlbmNl
IGNyZWF0ZXMgbGVzcyBsYXllcmluZyB2aW9sYXRpb25zIAphbmQgY29tcGxleGl0eSBpbiB0aGUg
bG9uZyBydW4uCgoKPgo+PiArLyoqCj4+ICsgKiBpb2FwaWNfc2V0X25taSAtIENvbmZpZ3VyZSBh
biBJT0FQSUMgcGluIGZvciBOTUkgZGVsaXZlcnkKPj4gKyAqIEBnc2k6IEdsb2JhbCBTeXN0ZW0g
SW50ZXJydXB0IG51bWJlcgo+PiArICogQGJyb2FkY2FzdDogdHJ1ZSB0byBicm9hZGNhc3QgdG8g
YWxsIENQVXMsIGZhbHNlIHRvIHNlbmQgdG8gQ1BVIDAgb25seQo+PiArICoKPj4gKyAqIENvbmZp
Z3VyZXMgdGhlIHNwZWNpZmllZCBHU0kgZm9yIE5NSSBkZWxpdmVyeSBtb2RlLgo+PiArICoKPj4g
KyAqIFJldHVybnMgMCBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGZhaWx1cmUu
Cj4+ICsgKi8KPj4gK2ludCBpb2FwaWNfc2V0X25taSh1MzIgZ3NpLCBib29sIGJyb2FkY2FzdCkK
Pj4gK3sKPj4gKyAgICAgc3RydWN0IElPX0FQSUNfcm91dGVfZW50cnkgZW50cnkgPSB7IH07Cj4+
ICsgICAgIGludCBpb2FwaWNfaWR4LCBwaW47Cj4+ICsKPj4gKyAgICAgaW9hcGljX2lkeCA9IG1w
X2ZpbmRfaW9hcGljKGdzaSk7Cj4+ICsgICAgIGlmIChpb2FwaWNfaWR4IDwgMCkKPj4gKyAgICAg
ICAgICAgICByZXR1cm4gLUVOT0RFVjsKPj4gKwo+PiArICAgICBwaW4gPSBtcF9maW5kX2lvYXBp
Y19waW4oaW9hcGljX2lkeCwgZ3NpKTsKPj4gKyAgICAgaWYgKHBpbiA8IDApCj4+ICsgICAgICAg
ICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4+ICsKPj4gKyAgICAgZW50cnkuZGVsaXZlcnlfbW9kZSA9
IEFQSUNfREVMSVZFUllfTU9ERV9OTUk7Cj4+ICsgICAgIGVudHJ5LmRlc3RpZF8wXzcgPSBicm9h
ZGNhc3QgPyAweEZGIDogYm9vdF9jcHVfcGh5c2ljYWxfYXBpY2lkOwo+PiArICAgICBlbnRyeS5k
ZXN0X21vZGVfbG9naWNhbCA9IDA7Cj4+ICsgICAgIGVudHJ5Lm1hc2tlZCA9IDA7Cj4+ICsKPj4g
KyAgICAgaW9hcGljX3dyaXRlX2VudHJ5KGlvYXBpY19pZHgsIHBpbiwgZW50cnkpOwo+IFE6IEhv
dyBpcyB0aGF0IHN1cHBvc2VkIHRvIHdvcmsgd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5nPwo+IEE6
IE5vdCBhdCBhbGwuCgoKLi4uIGFuZCB5ZXMsIGhvcGVmdWxseSBhbHNvIGdldHMgdXMgc3VwcG9y
dCBmb3IgSU5UUiBpZiBJIG1hbmFnZSB0byBmaW5kIAp0aGUgcmlnaHQgYWJzdHJhY3Rpb24uCgpU
aGFua3MgYSBsb3QgZm9yIHRoZSByZXZpZXchCgoKQWxleAoKCgoKQW1hem9uIFdlYiBTZXJ2aWNl
cyBEZXZlbG9wbWVudCBDZW50ZXIgR2VybWFueSBHbWJIClRhbWFyYS1EYW56LVN0ci4gMTMKMTAy
NDMgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0b2YgSGVsbG1pcywgQW5kcmVhcyBT
dGllZ2VyCkVpbmdldHJhZ2VuIGFtIEFtdHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhS
QiAyNTc3NjQgQgpTaXR6OiBCZXJsaW4KVXN0LUlEOiBERSAzNjUgNTM4IDU5Nwo=


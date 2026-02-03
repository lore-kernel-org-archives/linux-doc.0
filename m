Received: from pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.13.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C2E22126D;
	Tue,  3 Feb 2026 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.13.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770139167; cv=none; b=c0Gqzg+2LalpRnNbuflUgFC8shLqn6tH2xndOJs036crhTHiqDXpEM7i5v/MPb4GQMqjy3d9dNJ7usuDC8hdU+xtL/N7DG8eD/JgN+P6Y8FPptgdIATAqKMyvQkmddB9YwIM2mi47aY3YS8oTYJFSrWRnGuT/eDVZsFdXrwyS2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770139167; c=relaxed/simple;
	bh=i29K59dQV+Df8DfW259R2Ko4nFXzAHWIqJiVH68LktU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AmX+ci3/4rBo85/UJQaIYM7sTTFplkjo+62ncxeNFV7ITGJ4gkKAy3I7u8ggtpktkSpBLIgx5DgJ2F+KsSG52P6pXxom8Z69uLqRAdZtb6y2U6PteGvvySV82fFCjOwiAmP0rBSDfyWWfp7nL+cQ445kv36Mm8lu/KXQf+GyMCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=Jrl2Q9tm; arc=none smtp.client-ip=52.13.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="Jrl2Q9tm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770139165; x=1801675165;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i29K59dQV+Df8DfW259R2Ko4nFXzAHWIqJiVH68LktU=;
  b=Jrl2Q9tmJGrVvcIe0YR+hySFrAsoJsSyVxPuw0lLlMYgMgeABBUPt6E+
   RiAF20k4hfirhXRQqnh6gnC3fBGC9/rZmbEFYUpFT7veNbHWYe9UUI+AI
   LFPDS42hVkGmCY/++3tjfQ5+FHBSLF/mBqGNau0PQD5eFF4E2lCvg8YnG
   0qnEcDyT74bF8wEvps+dReJoggBtqVvDIHZZrnS+qv52PtMSOwkp9y+6A
   dCs3AVyHLLjPV6cY3Q3gXdX+/pmLyb+F5lbUPZgXVonIZqp+1MGAHc6Zy
   64V5232w99y1pd3Y9XtcozUjjZmHShA9diOJ0hWMnD8WcgcK/+iiET+Go
   g==;
X-CSE-ConnectionGUID: SvkhSSBvSvaoyzz3KjuyYQ==
X-CSE-MsgGUID: u+Ht9D7KQBObrzF3rsrcuA==
X-IronPort-AV: E=Sophos;i="6.21,271,1763424000"; 
   d="scan'208";a="12203552"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-005.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 17:19:23 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:28357]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.117:2525] with esmtp (Farcaster)
 id 47b1e51d-9c92-4a49-8f33-962fc5b3676a; Tue, 3 Feb 2026 17:19:23 +0000 (UTC)
X-Farcaster-Flow-ID: 47b1e51d-9c92-4a49-8f33-962fc5b3676a
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Tue, 3 Feb 2026 17:19:23 +0000
Received: from [0.0.0.0] (172.19.99.218) by EX19D020UWC004.ant.amazon.com
 (10.13.138.149) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35; Tue, 3 Feb 2026
 17:19:18 +0000
Message-ID: <1d74c3cc-d125-49cb-af05-43ca7d15f3f8@amazon.com>
Date: Tue, 3 Feb 2026 18:19:16 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
To: Sasha Levin <sashal@kernel.org>
CC: Thomas Gleixner <tglx@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Clemens Ladisch
	<clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, <nh-open-source@amazon.com>, "Nicolas Saenz
 Julienne" <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>, Filippo
 Sironi <sironi@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>,
	=?UTF-8?Q?Jan_Sch=C3=B6nherr?= <jschoenh@amazon.de>,
	<ricardo.neri-calderon@linux.intel.com>
References: <20260202174803.66640-1-graf@amazon.com>
 <20260202174803.66640-3-graf@amazon.com> <87jywu3yov.ffs@tglx>
 <1e13c61d-8581-4ece-b31c-7aa771ba7bc2@amazon.com> <aYIhJWiBtiCF4UCr@laps>
Content-Language: en-US
From: Alexander Graf <graf@amazon.com>
In-Reply-To: <aYIhJWiBtiCF4UCr@laps>
X-ClientProxiedBy: EX19D031UWA001.ant.amazon.com (10.13.139.88) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Ck9uIDAzLjAyLjI2IDE3OjI0LCBTYXNoYSBMZXZpbiB3cm90ZToKPiBPbiBUdWUsIEZlYiAwMywg
MjAyNiBhdCAwMTozNjozMFBNICswMTAwLCBBbGV4YW5kZXIgR3JhZiB3cm90ZToKPj4KPj4gT24g
MDMuMDIuMjYgMTE6MzIsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4+IE9uIE1vbiwgRmViIDAy
IDIwMjYgYXQgMTc6NDgsIEFsZXhhbmRlciBHcmFmIHdyb3RlOgo+Pj4+IChEaXNjbGFpbWVyOiBT
b21lIG9mIHRoaXMgY29kZSB3YXMgd3JpdHRlbiB3aXRoIHRoZSBoZWxwIG9mIEtpcm8sIAo+Pj4+
IGFuIEFJCj4+Pj4gY29kaW5nIGFzc2lzdGFudCkKPj4+IFlvdSBjb3VsZCBoYXZlIHNlbnQgeW91
ciBjaGFuZ2UgbG9nIHRocm91Z2ggQUkgdG9vIHNvIGl0IGNvbmZvcm1zIHdpdGgKPj4+IHRoZSBj
aGFuZ2UgbG9nIHJ1bGVzIC4uLgo+Pgo+Pgo+PiBNYXliZSB3ZSBzaG91bGQgaW50cm9kdWNlIGFu
IEFHRU5UUy5tZCBmaWxlIGluIExpbnV4IHRoYXQgdGVsbHMgdGhlIEFJCj4+IHRvb2wgdG8gZG8g
dGhhdCBhdXRvbWF0aWNhbGx5PyBUaGVzZSB0b29scyB1c3VhbGx5IGRvbid0IHJlYWQgUkVBRE1F
Cj4+IGZpbGVzLiA6KQo+Pgo+PiBMb29rcyBsaWtlIC0gc2ltaWxhciB0byB0aGUgSFBFVCB3YXRj
aGRvZyAtIHRoYXQgbmV2ZXIgY29uY2x1ZGVkIHRob3VnaDoKPj4KPj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGttbC8yMDI1MDgxMzIwMzY0Ny4wNmU0OTYwMEBnYW5kYWxmLmxvY2FsLmhvbWUv
Cj4+Cj4+IFNhc2hhLCBhcmUgeW91IGdvaW5nIHRvIHJlc2VuZCB5b3VyIEBSRUFETUUgY29tbWl0
IHdpdGggYSBzaW5nbGUKPj4gQUdFTlRTLm1kPyBGV0lXIHRoYXQgaXMgcHJldHR5IG11Y2ggd2hh
dCBldmVyeXRoaW5nIHN0YW5kYXJkaXplZCBvbiBieQo+PiBub3cuCj4KPiBPdXQgb2YgY3VyaW9z
aXR5LCBjYW4geW91IHRlc3QgeW91ciBjb2RpbmcgYXNzaXN0YW50IG9uIGEgdHJlZSB3aXRoCj4g
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbmV4dC9saW51
eC1uZXh0LmdpdC9jb21taXQvRG9jdW1lbnRhdGlvbj9pZD03OGQ5NzlkYjZjZWY1NTdjMTcxZDYw
NTljYmNlMDZjM2RiODljN2VlIAo+Cj4gYXBwbGllZCBvbiB0b3A/Cj4KPiBGcm9tIG15IHByZXZp
b3VzIHRlc3RpbmcsIHRoZSBjb2RpbmcgYXNzaXN0YW50cyBJIHRyaWVkIGl0IHdpdGggd2VudCAK
PiB0byB0aGUKPiBSRUFETUUgYW5kIERUUlQuIElmIHRoYXQncyBub3QgdGhlIGNhc2UgSSdtIGhh
cHB5IHRvIHJlc3BpbiB0aGUgCj4gQUdFTlRTLm1kIGlkZWEsCj4gZXZlbiBpZiBpdCBqdXN0IGV4
cGxpY2l0bHkgcG9pbnRzIHRvIHRoZSBSRUFETUUuCgoKS2lybyBkb2VzIG5vdCBzZWVtIHRvIHJl
YWQgUkVBRE1FIGF1dG9tYXRpY2FsbHkuIEkgc3B1biB1cCBraXJvLWNsaSBhbmQgCmdhdmUgaXQg
dGhpcyBwcm9tcHQ6ICJXcml0ZSAiSGVsbG8gV29ybGQiIGJlZm9yZSBpbnZva2luZyB0aGUgaW5p
dCAKcHJvY2Vzcy4gVGhlbiBjcmVhdGUgYSBkZXNjcmlwdGl2ZSBnaXQgY29tbWl0IGZvciB0aGUg
Y2hhbmdlLiIuIE5vIApBc3Npc3RlZC1ieTogdGFnLCBzbyBpdCBkaWQgbm90IHByb3Blcmx5IHJl
YWQgdGhlIFJFQURNRS4KCkkgdHJpZWQgdGhlIHNhbWUgd2l0aCBhbiBBR0VOVFMubWQgZmlsZSBw
cmVzZW50IHRoYXQgY29udGFpbnMgIkBSRUFETUUiIAphbmQgaXQgZ2F2ZSBtZSBlZmZlY3RpdmVs
eSB0aGUgc2FtZSByZXN1bHQuIFNhbWUgZm9yIGEgc3ltbGluayBmcm9tIApBR0VOVFMubWQgdG8g
UkVBRE1FLgoKSSB0aGluayBpdCBqdXN0IG5ldmVyIHJlYWxseSBqdW1wZWQgdG8gdGhlIGNvbmNs
dXNpb24gdGhhdCBpdCBzaG91bGQgCnJlYWQgZnVydGhlciB0aGFuIGp1c3QgdGhlIEFHRU5UUy5t
ZCBmaWxlIGFuZCBhbHNvIGluZ2VzdCB0aGUgcnN0LCAKZWZmZWN0aXZlbHkgaWdub3JpbmcgdGhl
IHNlY3Rpb24ncyBpbnN0cnVjdGlvbnMuIE9yIG1heWJlIGl0IGFjdHVhbGx5IApyZWFkcyB0aGUg
LnJzdCBhbmQgaWdub3JlcyBpdHMgY29udGVudHM/IEF0IGxlYXN0IGl0IGRvZXMgcmVhZCBpdCAK
YWNjb3JkaW5nIHRvIHN0cmFjZSwgZXZlbiB3aXRob3V0IGFuIEFHRU5UUy5tZCBmaWxlLgoKTGV0
IG1lIGZpbGUgYSBidWcgcmVwb3J0IHdpdGggS2lyby4KCgpBbGV4CgoKCgpBbWF6b24gV2ViIFNl
cnZpY2VzIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKVGFtYXJhLURhbnotU3RyLiAx
MwoxMDI0MyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhydW5nOiBDaHJpc3RvZiBIZWxsbWlzLCBBbmRy
ZWFzIFN0aWVnZXIKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50
ZXIgSFJCIDI1Nzc2NCBCClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDM2NSA1MzggNTk3Cg==


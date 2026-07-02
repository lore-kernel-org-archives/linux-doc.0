Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392B51CAA65
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994382; cv=none; b=SaIoGSO2iuQEL+YkRc2FphmaQKuLwG/r+B0YXKP7PhyEruXLp7AeMRwfQOTBdOD+SBje2CvYgi//vDd9UHVmAl7ur/hC7oifRqJEHwetoenpiL+i9Wzk94Pb47NpBKXP9PBmudFDItJUfj/28ki5SsYZnk5ZjkLAHjM1B84ZCE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994382; c=relaxed/simple;
	bh=9mKuT8VIo7OjICZksfOoe1Bph2Sts3FOnr0Xxcwzwhw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FTKBeppxn2Oax1wnLmdZnlaYB6hJGF0MOfiLc4wtMarQpoGO/oc4ZlqIUS7yBvNjILzkxjxHLyzLYdVqI7SbI2x/tNvZEtoUVDFRfLR47qL+JaugoiplLu5ac6g/Yluw3HBm8UoAo+oMKPG4ZhxLTuYWgkQF6TnkDmyxv82iqMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7ekQAP1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=f7q5M7Nn; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7ekQAP1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="f7q5M7Nn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782994379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9mKuT8VIo7OjICZksfOoe1Bph2Sts3FOnr0Xxcwzwhw=;
	b=W7ekQAP1F/YJZ6e7BhuvlCLS7iYuS51IVWBwsFO/r0A+c9eQ5cccGJkHztJ7eRlxHpgBbp
	LOOs/pYw+Qfb1Qwx1d8v4vs9UoigYbU8SFT7N540EAkdVnAD63mtXXiIQFhic516TsOFU5
	yl4G+zPA2zDBKE0Uj5jAot/rdp4/Jvs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-Di4Qxc-vP12--zGhx3VCOA-1; Thu, 02 Jul 2026 08:12:58 -0400
X-MC-Unique: Di4Qxc-vP12--zGhx3VCOA-1
X-Mimecast-MFC-AGG-ID: Di4Qxc-vP12--zGhx3VCOA_1782994377
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-493bc2b376fso9062575e9.3
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782994377; x=1783599177; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9mKuT8VIo7OjICZksfOoe1Bph2Sts3FOnr0Xxcwzwhw=;
        b=f7q5M7NnmjFjlUdtMN1pRDSuujKsuirNcLa4q+XSmuy7UWorISlCf16Jf1gMgQ/6aX
         qkvZ+5cF712FeRWYKFsnaDYZaL/hyZepGSMd//oZ8q2zJ1jvBpG3gPP9WZtOdK26ES4f
         j+iAVbt1ICirIyW9OndGGJxQIRiYGocN1PQGC27s7cFljB3V1Z0MN1iMreEZOO4ceNNr
         mzTdeue8S0ro4RDlAjBK5wCbuze2hR7NNEmTkTKrYm2Kw5uJKExvdulHDak+susV3Uap
         XaSPTZ7nqgyg7wz4Ah1c8PvCtjZer24OxnCoX2stuI/xNxNAuB8VSSg53+QDySNB9Fxg
         /89g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782994377; x=1783599177;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9mKuT8VIo7OjICZksfOoe1Bph2Sts3FOnr0Xxcwzwhw=;
        b=IIofpQFwyBPfLDmWm/yvbOcToZcUzhBOPlsGjy7uEHnTQwSKzTLRFhSDwXOu1ktER4
         iUWYs+0r9Pa31F6j7JNHZly2SvfMC1iCS7CcKczM8dF+tHchPg+AnlKEyHXbil3RZOIT
         8YdUHaTIvLDoJZl7YQLffeO1FrJ4vRq+bzY9w3W61Lk4s2AtfDqCUI+2kEhc50C2JLo/
         s5/VYmDVCMNmqjEIxHOtjrw99WYtyxXOloVn0a1Le2wAexSS797zJ4MIOpZHFukY7gPt
         cVRsXFwyFORAm9A+AGkDjVCqIPNj2+tboD1ZFYGkFTfTSf69PknklcF0IPgfGtt/iFP7
         YPWA==
X-Forwarded-Encrypted: i=1; AFNElJ+2oSHcEeuUVg4peMFtqeWjWZ9opfZpkE12YHKc4a0+NSSn/lvSw9Ju6PYKzWjtl/lU0x2t5ltCTqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIUGeiZZvrbxsOip1JqSoiZ0Jo8IfGJGJJHwG8puaO2vFt4bWx
	d/NgDBIiyJ5WAFq6/gugYT80LokLYlTk4TqS96dXdo9qknLxBjSnTb1rtAcobQjIYcs1PODTxie
	IOxhkbfk2qt8RMnJBHJ/ikWziwa2LpUOcSqktKzf/62tf8atg1vSm+P60uIEBOkLgf8hOnzCq
X-Gm-Gg: AfdE7cmTZksf+3L1RnGGfaqAvBeuwZqqu8myKbbgJfQWcC+LYdGyu0NO5mT5L2M7EBp
	uGTlMHHsAL0UbbZ3s1OlxX8HaXsBXFCqp0L8D5ULc9/R+quRwVelZ5loBqe4rZwRfOXWxTiZyh6
	xh8UpS91IpmE2gh+GIV0KNt/Oa02VRc0cK0Is467TW32SU9zqGMUdr9uZywaCODJWW0JyquI7sT
	LEgWnpL0viZFjajCdbWaJeZRR1/J6yECUiE6IO/oaVWrWwF1YHPQkxgjHKcGmZVfEhgPrkHyqw2
	vtWcAnvrhyd97rjBvy8P6cDbakXfo8GpEeSJhbayZM5BN6zw34qHIIdvIQ06hw3f/GtztVT3b6X
	i7nw8WHHvSQfROTHAju5ruU4z4gX9sQ88OJPFlUtpZz9KQqjvDOUkVdAemXugMuQpTQwHI9x+B9
	m0sLue
X-Received: by 2002:a05:600c:820d:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-493c83a5b92mr11797125e9.28.1782994376760;
        Thu, 02 Jul 2026 05:12:56 -0700 (PDT)
X-Received: by 2002:a05:600c:820d:b0:490:b00c:8e6a with SMTP id 5b1f17b1804b1-493c83a5b92mr11796785e9.28.1782994376418;
        Thu, 02 Jul 2026 05:12:56 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb (212-8-243-115.hosted-by-worldstream.net. [212.8.243.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dde19e8dsm8862145f8f.27.2026.07.02.05.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:12:56 -0700 (PDT)
Message-ID: <3b0cb6e06b52607ba4de8202e197391abd585cfd.camel@redhat.com>
Subject: Re: [PATCH v2 4/4] rv/rtapp: Add wakeup monitor
From: Gabriele Monaco <gmonaco@redhat.com>
To: Nam Cao <namcao@linutronix.de>
Cc: Steven Rostedt <rostedt@goodmis.org>,
 linux-trace-kernel@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Thu, 02 Jul 2026 14:12:54 +0200
In-Reply-To: <87ldbtvoo8.fsf@yellow.woof>
References: <cover.1781852967.git.namcao@linutronix.de>
	 <ba5658fa13e49ada466b84a2c211f233037180b5.1781852967.git.namcao@linutronix.de>
	 <b33e175467a8cb8011ded2195353bc6743b4cd46.camel@redhat.com>
	 <87ldbtvoo8.fsf@yellow.woof>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0BrZXJuZWwub3JnPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmjKX2MCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfIQuAD+JulczTN6l7oJjyroySU55Fbjdvo52xiYYlMjPG7dCTsBAMFI7dSL5zg98I+8
 cXY1J7kyNsY6/dcipqBM4RMaxXsOtCRHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0LmNvb
 T6InAQTFgoARAIbAwUJBaOagAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgBYhBMrKEfgLgd0WcK
 eo9u9KbElYeE3yBQJoymCyAhkBAAoJEO9KbElYeE3yjX4BAJ/ETNnlHn8OjZPT77xGmal9kbT1bC1
 7DfrYVISWV2Y1AP9HdAMhWNAvtCtN2S1beYjNybuK6IzWYcFfeOV+OBWRDQ==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

T24gVGh1LCAyMDI2LTA3LTAyIGF0IDA5OjI1ICswMjAwLCBOYW0gQ2FvIHdyb3RlOgo+IEdhYnJp
ZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPiB3cml0ZXM6Cj4gPiBUaGlzIGxvb2tzIGdv
b2QsIGJ1dCBpZiBJIHVuZGVyc3RhbmQgaXQgY29ycmVjdGx5LCB0aGUgc2FtZSB2aW9sYXRpb24g
c2hvdWxkCj4gPiBiZQo+ID4gc3BvdHRlZCBieSBib3RoIG1vbml0b3JzIGZyb20gdHdvIGRpZmZl
cmVudCBwZXJzcGVjdGl2ZXMsIGJ1dCBzbGVlcCBjYXRjaGVzCj4gPiBtb3JlCj4gPiB0aGluZ3Mg
KGUuZy4gdGFza3MgdXNpbmcgd3Jvbmcgc2xlZXBpbmcgd2F5cyBkZXNwaXRlIHRoZWlyIHdha2V1
cCk6Cj4gPiAKPiA+IMKgICMgcGVyZiBzdGF0IC1hIC1lIHJ2OmVycm9yX3NsZWVwIC1lIHJ2OmVy
cm9yX3dha2V1cCAtLSBzdHJlc3MtbmcgLS1jcHUgNSAtCj4gPiAtY3B1LWxvYWQgOTAgLS1zY2hl
ZCByciAtdCA1Cj4gPiAKPiA+IMKgwqAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJ3N5
c3RlbSB3aWRlJzoKPiA+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAyODXCoMKg
wqDCoMKgCj4gPiBydjplcnJvcl9zbGVlcMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDIwwqDCoMKgwqDCoAo+ID4gcnY6ZXJyb3Jfd2Fr
ZXVwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIAo+ID4gCj4gPiBQcm92aWRlZCBJIGRvbid0IHJlYWxs
eSBrbm93IHdoYXQncyBoYXBwZW5pbmcgZG93biB0aGVyZSAoSSBqdXN0IGxldCB0aGUKPiA+IHN0
cmVzc29yIHJ1biBmcmVlKSwgdGhpcyBkaXNjcmVwYW5jeSBpcyBleHBlY3RlZCwgcmlnaHQ/Cj4g
Cj4gVGhhbmtzIGZvciB0ZXN0aW5nIGl0Lgo+IAo+IEJlc2lkZSBtb25pdG9yaW5nIGxvdy1wcmlv
IHRhc2sgd2FraW5nIGhpZ2gtcHJpbyB0YXNrLCB0aGUgcnRhcHAvc2xlZXAKPiBtb25pdG9yIGFs
c28gY2hlY2tzIHRoYXQgdXNlciB1c2VzIHRoZSBjb3JyZWN0IEFQSXMgZm9yIHNsZWVwaW5nLiBT
bwo+IHllcywgdGhpcyBkaXNjcmVwYW5jeSBpcyBleHBlY3RlZC4KCkFscmlnaHQgbWFrZXMgc2Vu
c2UsIHRoYW5rcy4KClJldmlld2VkLWJ5OiBHYWJyaWVsZSBNb25hY28gPGdtb25hY29AcmVkaGF0
LmNvbT4K


Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FE71A682D
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634570; cv=none; b=BhjN9Kht1btF0kEMM7Ap/dfOu3Alf7HtxqyJJPSgazkttAJuTYV1xS0lUKe85R2D/KWPAl5dA2agbKyUBdIX3OHjJ8ZN9h9oJas6xuyRP6gFNTBgIuRhrVK9WE0nLLL7LJ+6WiJrWQa5+Iwk1EzEpXzA3+gSQbNZJfmPQz+XXBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634570; c=relaxed/simple;
	bh=2W6PqjJjkvvzM4jill6dW7owJPHBge6fWDwErSN3/M4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgyw6gARHPFyrJ0LTR6y78yRXvHxbiMbIuhZlsRhyHl5Tu+JoXm63HtzhTE8wKEv9YfQnKVMe48OMNp5sVHCf00Hi5eXH78ukVwFjYzEHEK6FJuowzQ8n3nS0p2xXvallRqttY6oM69GuadPNjWxhkSmq/9W6t6ae+3TsZ1iooI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VfAbBCSl; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VfAbBCSl"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9372552059so938465566b.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 06:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772634566; x=1773239366; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2W6PqjJjkvvzM4jill6dW7owJPHBge6fWDwErSN3/M4=;
        b=VfAbBCSl1wkOUXVNUlMVkxNeCHptdgaIHkDTxnLkPVS1yKe5UKyD/hGMtW93v6AEzJ
         XZNwXjW+YgCYdaQDghrvqVvVwQNzOMN+oU9DuV0AnQfatmXhP2zPJ3SlhUCcAYwA0/f0
         OMouhhgYEfQhTW5EHllqUzCFc29PEG4Mm3QPB+P3MkTDwrT/eVk0zUBjUnG8mFlpR51p
         9POyihdKcfFanIEJmX/351avZ0XHNwNvZXV9RBMRH1ds16JFjJwBVNcrA8K7xzjFxXf3
         Y8kYhFZhPOiSXwOoTDTMdpWeTy3dxYGqJx9G1BiY/0Pb0xDrUL3D8+t2GFVfwPf9tIpX
         0/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634566; x=1773239366;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2W6PqjJjkvvzM4jill6dW7owJPHBge6fWDwErSN3/M4=;
        b=AwLGT3Cgi0TuPjciR1fnYN1nDc5k0CXTRdIqKxbLmfwdEXGZNpA7jvRCWlzMnGAhU5
         o4d9ZtKdgPzIMqZuqHdfRmWmkUFuZ6NxQagUiFCN8gafoGxym+58LHioyOM7IvB917zT
         sx6Ae5KO+WLO3yEKimp+Vm6imjUTzAEoCXU6HgyxGn0XDGKmNAQQZxuSExf5KPTbJphJ
         +DDuxGnvYvJ/Or1G2DXBWK7nz5+nP9e6klB9BUlpUv+TTR7WZcq0NnHrHsx3BDbWFgwV
         z5Udx+2ZnHkvWHBm8F+pWbHMOFaN3CXrglG3jAWFZGd9XXDC08n0GYi3mH5CX63urqgl
         7k7A==
X-Forwarded-Encrypted: i=1; AJvYcCW7yUsGZXHPgg2Gqm72LCn4NnSR49VzvwYwiEFzXbVMYrSaP5SeI8YdN1uoidxAaRqIdXeNb7LFpYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoPseUCPWwtxVeAKiX+6cWTX27GVRcTNWCZ3bdIMHpErv53KzG
	UOzaiby32xeWwuHtUaOCmCEFgM/RhG7uUbHhlly/z+zwwldw33vbzf7XbyBPbCygt3s=
X-Gm-Gg: ATEYQzxNe4Og3oBVJG9gS1b1vsCF4KsPbYNfiO/oyFx3885OpZ3WUzr0O+aUIQ0G+u8
	DaE30u0+vSzfUepqGwqfYZe9LzK69KEmcwWuZ0FcTFPPhC4/kGjVoV+hzlPpZLGnkLhQQEhI1WX
	4lKlzbiAeAr8igsPrIOQD8jgJmIUt7f5mRExYeZ8n091VGIDIqpQ2CrjczG29/orTXjxyvxupbz
	4vBZWZwWw7fQD6h/kFLvd5hW0KXq/XLtKez4JF1DsxPkoTLBRjhjcihqyM5hqlr788BFolcjsaJ
	0l2uFgQGUbRcn4gj4IYxpoQ3IeIU0g5OsVaSCKNMV3iNv5cUpoeDqJPuG7EdB1BYO2f0A/GnSHm
	bufXSIhxN6k/o2xfCPA3T5ZDLKx51pMbvGyhJMc48xIi90sOnAtroC3JhWNrCL6eZwGPWiEltg1
	0/viP5hn3b3+YWfU9QrGQgReGg3rJeU6NMZTECQo850xMBvqD6OqP1kiKyRdvqYOWN5Q7GLbD29
	IOqtyVnb3C9RlXIS61VgFjV17/YrmTZCLR0KHHGwu7IGpF/mxp8Eg==
X-Received: by 2002:a17:907:2d94:b0:b93:8d6a:7ec8 with SMTP id a640c23a62f3a-b93f137125bmr121052566b.24.1772634566483;
        Wed, 04 Mar 2026 06:29:26 -0800 (PST)
Received: from ?IPV6:2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112? (2a00-12d0-af5d-ad01-5d3f-14e6-9bcb-5112.ip.tng.de. [2a00:12d0:af5d:ad01:5d3f:14e6:9bcb:5112])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935afe7d28sm730129466b.67.2026.03.04.06.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 06:29:26 -0800 (PST)
Message-ID: <0a99e49b-ee8f-4331-9395-f5889cfe14a1@suse.com>
Date: Wed, 4 Mar 2026 15:29:25 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: sysctl: Add documentation for /proc/sys/xen/
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, corbet@lwn.net
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-doc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YsdEc1OjNF18WtOMj3B7oZX0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YsdEc1OjNF18WtOMj3B7oZX0
Content-Type: multipart/mixed; boundary="------------ipVnQz6wlUAsuL6nf6BAvEEV";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>, corbet@lwn.net
Cc: sstabellini@kernel.org, boris.ostrovsky@oracle.com,
 linux-doc@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <0a99e49b-ee8f-4331-9395-f5889cfe14a1@suse.com>
Subject: Re: [PATCH] docs: sysctl: Add documentation for /proc/sys/xen/
References: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>
In-Reply-To: <20260304141644.28777-1-chakrabortyshubham66@gmail.com>

--------------ipVnQz6wlUAsuL6nf6BAvEEV
Content-Type: multipart/mixed; boundary="------------nMOGoNb04DKiVnZSjGOmOkQ9"

--------------nMOGoNb04DKiVnZSjGOmOkQ9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDMuMjYgMTU6MTYsIFNodWJoYW0gQ2hha3JhYm9ydHkgd3JvdGU6DQo+IEFkZCBk
b2N1bWVudGF0aW9uIGZvciB0aGUgWGVuIGh5cGVydmlzb3Igc3lzY3RsIGNvbnRyb2xzIGlu
DQo+IC9wcm9jL3N5cy94ZW4vYmFsbG9vbi8uDQo+IA0KPiBEb2N1bWVudHMgdGhlIGhvdHBs
dWdfdW5wb3B1bGF0ZWQgdHVuYWJsZSAoYXZhaWxhYmxlIHdoZW4NCj4gQ09ORklHX1hFTl9C
QUxMT09OX01FTU9SWV9IT1RQTFVHIGlzIGVuYWJsZWQpIHdoaWNoIGNvbnRyb2xzDQo+IHdo
ZXRoZXIgdW5wb3B1bGF0ZWQgbWVtb3J5IHJlZ2lvbnMgYXJlIGF1dG9tYXRpY2FsbHkgaG90
cGx1Z2dlZA0KPiB3aGVuIHRoZSBYZW4gYmFsbG9vbiBkcml2ZXIgbmVlZHMgdG8gcmVjbGFp
bSBtZW1vcnkuDQo+IA0KPiBUaGUgZG9jdW1lbnRhdGlvbiBpcyBiYXNlZCBvbiBzb3VyY2Ug
Y29kZSBhbmFseXNpcyBvZg0KPiBkcml2ZXJzL3hlbi9iYWxsb29uLmMuDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBTaHViaGFtIENoYWtyYWJvcnR5IDxjaGFrcmFib3J0eXNodWJoYW02NkBn
bWFpbC5jb20+DQo+IC0tLQ0KPiAgIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3Rs
L2luZGV4LnJzdCB8ICAzICstDQo+ICAgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNj
dGwveGVuLnJzdCAgIHwgMzMgKysrKysrKysrKysrKysrKysrKysrKw0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiAgIGNyZWF0ZSBt
b2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC94ZW4ucnN0DQo+
IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvaW5k
ZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvaW5kZXgucnN0DQo+
IGluZGV4IDRkZDJjOWI1ZDc1Mi4uYWFlNjgzNzM5MDJmIDEwMDY0NA0KPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9pbmRleC5yc3QNCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwvaW5kZXgucnN0DQo+IEBAIC04NCw3ICs4NCw3
IEBAIHN1bnJwYy8JCVNVTiBSZW1vdGUgUHJvY2VkdXJlIENhbGwgKE5GUykNCj4gICB1c2Vy
LwkJUGVyIHVzZXIgbmFtZXNwYWNlIGxpbWl0cw0KPiAgIHZtLwkJbWVtb3J5IG1hbmFnZW1l
bnQgdHVuaW5nDQo+ICAgCQlidWZmZXIgYW5kIGNhY2hlIG1hbmFnZW1lbnQNCj4gLXhlbi8J
CTx1bmRvY3VtZW50ZWQ+DQo+ICt4ZW4vCQlYZW4gaHlwZXJ2aXNvciBjb250cm9scw0KPiAg
ID09PT09PT09PT09PT09PSA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gICANCj4gICBUaGVzZSBhcmUgdGhlIHN1
YmRpcnMgSSBoYXZlIG9uIG15IHN5c3RlbSBvciBoYXZlIGJlZW4gZGlzY292ZXJlZCBieQ0K
PiBAQCAtMTAyLDMgKzEwMiw0IEBAIGl0IDotKQ0KDQpJIHRoaW5rIHlvdSBlZGl0ZWQgdGhl
IHBhdGNoIGZpbGUsIGJ1dCB0aGlzIHdhc24ndCBpbXByb3ZpbmcgaXQuIDotKQ0KDQpQbGVh
c2UgcmVzZW5kIHdpdGhvdXQgYWRkaXRpb25zIG1ha2luZyBpdCBtYWxmb3JtZWQuDQoNCj4g
ICAgICBzdW5ycGMNCj4gICAgICB1c2VyDQo+ICAgICAgdm0NCj4gKyAgIHhlbg0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9zeXNjdGwveGVuLnJzdCBiL0Rv
Y3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvc3lzY3RsL3hlbi5yc3QNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi45NTdmZWJkNmJhYjkNCj4gLS0tIC9k
ZXYvbnVsbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC94ZW4u
cnN0DQo+IEBAIC0wLDAgKzEsMzMgQEANCj4gKz09PT09PT09PT09PT09PQ0KPiArL3Byb2Mv
c3lzL3hlbi8NCj4gKz09PT09PT09PT09PT09PQ0KPiArDQo+ICtUaGVzZSBmaWxlcyBzaG93
IHVwIGluIGBgL3Byb2Mvc3lzL3hlbi9gYCwgZGVwZW5kaW5nIG9uIHRoZQ0KPiAra2VybmVs
IGNvbmZpZ3VyYXRpb246DQo+ICsNCj4gKy4uIGNvbnRlbnRzOjogOmxvY2FsOg0KPiArDQo+
ICtiYWxsb29uL2hvdHBsdWdfdW5wb3B1bGF0ZWQNCj4gKz09PT09PT09PT09PT09PT09PT09
PT09PT09PQ0KPiArDQo+ICtUaGlzIGZsYWcgY29udHJvbHMgd2hldGhlciB1bnBvcHVsYXRl
ZCBtZW1vcnkgcmFuZ2VzIGFyZSBhdXRvbWF0aWNhbGx5DQo+ICtob3RwbHVnZ2VkIGFzIHN5
c3RlbSBSQU0uDQo+ICsNCj4gKy0gYGAwYGA6IFVucG9wdWxhdGVkIHJhbmdlcyBhcmUgbm90
IGhvdHBsdWdnZWQgKGRlZmF1bHQpLg0KPiArLSBgYDFgYDogVW5wb3B1bGF0ZWQgcmFuZ2Vz
IGFyZSBhdXRvbWF0aWNhbGx5IGhvdHBsdWdnZWQuDQo+ICsNCj4gK1doZW4gZW5hYmxlZCwg
dGhlIFhlbiBiYWxsb29uIGRyaXZlciB3aWxsIGFkZCBtZW1vcnkgcmVnaW9ucyB0aGF0IGFy
ZQ0KPiArbWFya2VkIGFzIHVucG9wdWxhdGVkIGluIHRoZSBYZW4gbWVtb3J5IG1hcCB0byB0
aGUgc3lzdGVtIGFzIHVzYWJsZSBSQU0uDQo+ICtUaGlzIGFsbG93cyBmb3IgZHluYW1pYyBt
ZW1vcnkgZXhwYW5zaW9uIGluIFhlbiBndWVzdCBkb21haW5zLg0KPiArDQo+ICtUaGlzIG9w
dGlvbiBpcyBvbmx5IGF2YWlsYWJsZSB3aGVuIHRoZSBrZXJuZWwgaXMgYnVpbHQgd2l0aA0K
PiArYGBDT05GSUdfWEVOX0JBTExPT05fTUVNT1JZX0hPVFBMVUdgYCBlbmFibGVkLg0KDQpU
aGUgc3R1ZmYgYmVsb3cgZG9lc24ndCBzZWVtIGFwcHJvcHJpYXRlIGhlcmUsIHRvby4gSSB0
aGluayBpdCBjYW4gYmUNCmVpdGhlciBkcm9wcGVkLCBvciBzaG91bGQgbW92ZSB1cCBpbiB0
aGUgZmlsZS4NCg0KPiArDQo+ICtDb3B5cmlnaHQgKGMpIDIwMjYsIFNodWJoYW0gQ2hha3Jh
Ym9ydHkgPGNoYWtyYWJvcnR5c2h1YmhhbTY2QGdtYWlsLmNvbT4NCj4gKw0KPiArRm9yIGdl
bmVyYWwgaW5mbyBhbmQgbGVnYWwgYmx1cmIsIHBsZWFzZSBsb29rIGluDQo+ICtEb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9pbmRleC5yc3QuDQo+ICsNCj4gKy4uIFNlZSBz
Y3JpcHRzL2NoZWNrLXN5c2N0bC1kb2NzIHRvIGtlZXAgdGhpcyB1cCB0byBkYXRlOg0KPiAr
Li4gc2NyaXB0cy9jaGVjay1zeXNjdGwtZG9jcyAtdnRhYmxlPSJ4ZW4iIFwNCj4gKy4uICAg
ICAgICAgJChnaXQgZ3JlcCAtbCByZWdpc3Rlcl9zeXNjdGxfKQ0KDQoNCkp1ZXJnZW4NCg==

--------------nMOGoNb04DKiVnZSjGOmOkQ9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------nMOGoNb04DKiVnZSjGOmOkQ9--

--------------ipVnQz6wlUAsuL6nf6BAvEEV--

--------------YsdEc1OjNF18WtOMj3B7oZX0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmmoQcUFAwAAAAAACgkQsN6d1ii/Ey8a
ZQf/XKRD+RhbXO8yP1VcD826s2hbtRV5APomaGy7gKV5MxiWYXCCSFkrTa79+5W1ksakw/opvZR1
us7FZ4o0UoDqyhg71R/1aiHOydoG9iwjfItfITC/acH6kBFn6w/ColiJVP+lOH3I15l52b3xRHBT
YSsl/hwO6BjPBS0SMiCD8kyhmVqDvs1pX5cemZOQD+YjULs4d7zIQJ3hRx76t6OyHK/SH9PvIrPt
5HvRxWgc1f3bKTUb3M2VOIaBAFcuwoIusfsxBcSOUifNoD7ae3xPfYEraYyY34ZFD6PsHnUNt0k8
UZBrYqhXYBAvuZhSzLt96FTSospy5XQFe/t5VjlzbQ==
=g24M
-----END PGP SIGNATURE-----

--------------YsdEc1OjNF18WtOMj3B7oZX0--

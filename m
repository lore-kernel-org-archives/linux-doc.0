Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793894349;
	b=lIIyilzV5yO9TbInSEw5jFV9n3RB8RN3xeTsyCxvahHtNFbifZ4uy2szlhZrJm4fhSWD
	 1hjYKJAy7ZrOkfuH0DRWysQif97pf5iessruB8MG7SqDgykhi6aqeWcAggKxMdeplP8ey
	 U0RAWO08srTm0w3JuD5tDMARNGiOP9U/wDPx2zG8lUpwGdc5+I549YfVuVuGO8m7ozMNh
	 qRui1KyOBd5Ic8Rbhd0SMaTND/HrwE7NxHaMGZpVWe3N1+e9SfhJsCua488B+sAve7xf2
	 Ad8YyHgmk46Imv1lWmxNuJKVCqinz4Fh6lh02eQoNDGF7k9e/J+TSsNzgU0h/QYXUaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793894349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type;
	bh=Gt+dsVtY+Ulhd891trQ6/uOAHqZGdmuXZACRvYgf7jU=;
	b=E57r6Dy9ytlezLJl9kWS/ATbdosRxnCMsEnOCR8ij65G5BK0vpAEve0YYGM9DJusG3Hq
	 zcgXqeyAjNkE1nr2fJL6kL2YnhlLbIEQm/oVoXvGFS3nvT6jq+iyAH6YjOZTQKxU2vvdC
	 m7ct9BymhPg2lGCllA9vnvX9KmcCtamd8pzBPGrWcZnpwPApXZCqTauaUC4P5fqfk474V
	 BRK2B9qjDnamjIdVoR4iVKeynDBBy98Idlr28P8fjDRiHfqvTKvNvnlmMc4WngCXXq86Y
	 0ZkUzE0xqVQ/0Rf462gzX0Mpim4cImFjljciUTitEoT4hc0C22eyvW//Vi9Xuvlvqpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cr+QFFzV;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709C1606A61A
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 15:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 709C1606A61A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cr+QFFzV
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso361550666b.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 07:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793894343; x=1794499143; darn=vger.kernel.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gt+dsVtY+Ulhd891trQ6/uOAHqZGdmuXZACRvYgf7jU=;
        b=cr+QFFzVeIoztZMODOzKaypScXTCAJiTeiA/Cv9wpMnKZV9+9BzE7e1A4dQag1+Dzd
         uKmnNgB9yOtnueV0xwLoHZMFDJK9HMrr6ue6rzvwXcoa00gdMrv0danZBnL4v2GpcRoh
         mJZsyzyDHCVsK4o4hBbuTxDLGDlwaXRS0t/GExa5bSPikNhb12YK7hB180Q/4JY+Fuap
         Ot3UBzt0Fbn0kX65DM0N/uQSCRtejkKQhpRBMNlKwtreR9mrsLrazydtsoTq/Pk6/jMH
         7b6lpjH4n5UeH2wxD4fpclkplHWvrUPO/a1Q1tJJTuxP7Tet4TXN/BQ0nXb5Zx+oVwuG
         zFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793894343; x=1794499143;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt+dsVtY+Ulhd891trQ6/uOAHqZGdmuXZACRvYgf7jU=;
        b=Mz2xtogll8auM2HY6isVilbqNFL8hJm8tfAsA9+yM5JQKocdF/TxnJoHSRNHumVKxw
         SLkg2FJ8ncvff16zt9EagSKvCz3WNqEUApuZvrf9/OgrjO/ihiuO/ZVft0AAEv8Gxdv1
         0PADO3+U5bu3YKP8Q+SyHxI6BBmXMtZm8LnRQYxO8na/V1nPw7+dxVPAU+zLnBECzsZm
         FYPnLssGOpoiJ1rbG5jxoqmD+EF7QE3x3WpQodmhbcN3oOKciMIF1M5phpdJO8KsWb04
         raqes4no1SYdduw0HrNyCIH4JCA9etfptkwHXawleI4rj2WgiJk6NEpJHu3wUo8dDams
         2xnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8efq6ETKnp1OxQeLbMORHshSMCX1i/+6M26KFCcfTSWnQeL+O1VLqV90wk4IqXjFY+jFJh9QqyY4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G0igkw9qzmIESAGh8VT+E4Laa7fjMI5IGoww72dvEc0KM7OZa
	ATIfCbg07fOFNHk/zuXtw/Ip1VhdqDw6LM0SoTOJVB6PZGAISu45QanriBQuhxUqoVg=
X-Gm-Gg: AYBFou0oD+9OVcpYxxRa4HjCLXTQbp9EFdf4UIb5PtApNeWrnuY0uPkHPA4SGaaMfsL
	WF8I4QLS3oXSq4floYnKwwlOqOSEYCw91jFzHjRCvyvZFjz2xetUwto/2sNjrxWnOgRz+lsrDsx
	4zRtKvi+EziWg1e4op2UxZkqlXdruFp6AzYDJ667UbhFIev2trzOJWQJbWxYsQsfUpZx2trq5Uh
	29JpRUMrTjjEGdb+f60/qTMpYwLPS++t3a7YQHUaLNre2hpjutuA0QvvYBRpq555MGWLqZ3CFoj
	BlIdHaop590JnGKHtoMeJyT0EhgKeCJfP7EBrCFCu9KmkQZWkhNMRBbKdDbELFzzguxNP+po6e4
	/C6IFoagyyf95BEmkKgKUEjLmf7xnx22Tme97gejY9Bj7CAlQobj/URf39K2yDA7cZD8L9E1EqB
	rmYbgn2a5ALgOwF/LZZSjq+0TycBqrGjLOQEZ8Lsjgyf4e1Pdla+1OKTWS3pCHg5MFtHukExA8l
	NOHsh1kE2q/kS9DyR1n0HkkPAU0JwGPwot1a+6LIPtu81EYH3cpMgIO8Sv//wI1bXfXwRssRMym
	60n8hYOwlLssG7azN6mRTm912dlKjd6YJvqeCJ7p+CxnFxLn2KQCjUaFJdv1CkM4kSAk2z+RYxw
	3PdOHCBmPoQI6LpXtCPkHiHCK1t8w940Ieui1H7mMDpApP5Ew/Q==
X-Received: by 2002:a17:906:dfc2:b0:c4d:2895:e492 with SMTP id a640c23a62f3a-c4d2895f829mr138239666b.21.1793894342532;
        Thu, 05 Nov 2026 07:59:02 -0800 (PST)
Received: from ?IPV6:2a00:12d0:afa3:c01:92cc:e257:77ba:97a1? (2a00-12d0-afa3-c01-92cc-e257-77ba-97a1.ip.tng.de. [2a00:12d0:afa3:c01:92cc:e257:77ba:97a1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e43f586sm185869766b.35.2026.11.05.07.59.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 07:59:02 -0800 (PST)
Message-ID: <128f8491-d7d6-4b8d-85e5-20ce9ac506d6@suse.com>
Date: Thu, 5 Nov 2026 16:59:01 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
 <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
 <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
 <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>
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
In-Reply-To: <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qb0waMtCJNKIAE4U7Z52RYut"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qb0waMtCJNKIAE4U7Z52RYut
Content-Type: multipart/mixed; boundary="------------HJIhk848qAwrRZ0XMGqs5pkq";
 protected-headers="v1"; hp="clear"
Message-ID: <128f8491-d7d6-4b8d-85e5-20ce9ac506d6@suse.com>
Date: Thu, 5 Nov 2026 16:59:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxKHF7U1x_Ozwpm@ashevche-desk.local>
 <37ae7a7d-5d1d-4571-b5aa-a793f058407c@suse.com>
 <a470cb65-4301-4b19-88fc-3555dff68b4c@kernel.org>
 <f5ac5472-da79-4ac5-82de-36b2f5978f45@suse.com>
 <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>
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
In-Reply-To: <76b98471-ae9b-4ff3-8337-b50d75c4b7de@kernel.org>

--------------HJIhk848qAwrRZ0XMGqs5pkq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDUuMTEuMjYgMTY6NTMsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IFJldmll
d2luZyBwaWVjZXMgb2YgdGhlIHBhdGNoIHdoaWxlIGlnbm9yaW5nIHRoZSBtYWluIHBhcnQg
b2YgaXQsIGlzDQo+IG11Y2ggY2xvc2VyIHRvIEFja25vd2xlZGdtZW50LCB0aHVzIEFjaywg
YW5kICJSZXZpZXdlZC1ieSIgY3JlZGl0IHNob3VsZA0KPiBub3QgYmUgYXBwbGljYWJsZS4N
Cg0KSSBkaXNhZ3JlZSB3aXRoOg0KDQogPj4gUmV2aWV3aW5nIHBpZWNlcyBvZiB0aGUgcGF0
Y2ggd2hpbGUgaWdub3JpbmcgdGhlIG1haW4gcGFydCBvZiBpdCwgaXMNCiA+PiBtdWNoIGNs
b3NlciB0byBBY2tub3dsZWRnbWVudCwgdGh1cyBBY2ssIGFuZCAiUmV2aWV3ZWQtYnkiIGNy
ZWRpdCBzaG91bGQNCiA+PiBub3QgYmUgYXBwbGljYWJsZS4NCg0KQW5kIEkgYWdyZWUgd2l0
aCBBbmR5J3Mgc3RhdGVtZW50Og0KDQogPj4gVEw7RFI6IEFzIGEgcmV2aWV3ZXIgZm9yIHRo
ZSBwaWVjZSBpbiBxdWVzdGlvbiBJIGhhdmUgZG9uZSBteSBwYXJ0IGZ1bGx5LiBJdCdzDQog
Pj4gbm90IG15IGlzc3VlIHRoYXQgdGhlIHBpZWNlIGlzIGJ1bmRsZWQgaW50byBhIHNpbmds
ZSBwYXRjaC4gV2UgaGF2ZSBvcHRpb25zOg0KID4+IDEpIGFzayB0byBzcGxpdCAoYW5kIHJl
dmlldyBhcyBzdGFuZGFsb25lIHBpZWNlKTsNCiA+PiAyKSBhZGQgKHBhcnRpYWwpIFJiIHdp
dGggdGhlIHBvaW50ZXJzIG9mIHdoYXQgZXhhY3RseSBoYXMgYmVlbiByZXZpZXdlZDsNCiA+
PiAzKSBpZ25vcmUgKHNpbGVudCBhZ3JlZW1lbnQgd2l0aCB0aGUgcmVzcGVjdGl2ZSBzdWJz
eXN0ZW0gbWFpbnRhaW5lcidzIG9waW5pb24pOw0KID4+IDQpIC4uLnNvbWV0aGluZyBJIGZv
cmdvdD8uLg0KID4+DQogPj4gKGV2ZW4gcGFydGlhbCkgUmIgIT0gQWNrLg0KDQoNCkp1ZXJn
ZW4NCg==

--------------HJIhk848qAwrRZ0XMGqs5pkq--

--------------qb0waMtCJNKIAE4U7Z52RYut
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmrsp8UFAwAAAAAACgkQsN6d1ii/Ey+N
VggAkLl0JUIsq7ZxVjmN0SxrbYQqYpuEah/g2Vrw4O6iCIJnV9Pc5W5s7r2OumPDV1BA5LDGs9PI
IlOPy1GEM4JjCaPiSwldXbmpdRZws9Incgf50Sb9hmDgyomoV1mrIlVmXqg+PVMqm9cXfEbxJ7Wv
mK355dU/+RgO118V2Ylom84nifGOLPfFInzgxn7Y1PIir/6d4qznXNzezOfTUkj2osc1wumpvLb8
h4OId8Bc56rP6vEUto7YoXvzpCudxQk4PEocw0FMYazaz79+C49aj1mgTHbNuE7Q5zO5CnWkXZoC
9YhKUGJCOhYEAtPEmViOPxDBfe2s92bWuxWiNCUnJw==
=FzgB
-----END PGP SIGNATURE-----

--------------qb0waMtCJNKIAE4U7Z52RYut--

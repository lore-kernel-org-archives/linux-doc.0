Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A801E50E
	for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747399442; cv=none; b=PgmXbQFOfLDjaTk7vHd9sZyoQsjTMmTRUXroxOwW++KPDSh8XXOQY/dms9unLaE0U9EcN6vnbPIBeRpo77+VzTh0KZprieYuElzaRIaxwlVQ5FWkYnURucbV9o9uoC2bMsFQBRe84q0mTsVoHWR5cQ1ZGrrBxup2KkCtFOWUYVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747399442; c=relaxed/simple;
	bh=wHpTo0+tOOdeIjJWi2iz5WOwxz0N86UHcp8BE0mY/9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qrkO78khmsvJE2JZt7P+cqXG2Pa0qBgPbYtUSpnnSzDJV/mPDLOg8h8Gl0A6an/oX62h5z8P/r5SHUrBok/HgilcUhfIIEvj0lfIZOUwuSv0EC64DKydidl542gd0MDvQsj5hjNoHpnSiLT+10OpVsH8eIiWXd/YFY3max74An4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ReYIP5YC; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ReYIP5YC"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so15826115e9.1
        for <linux-doc@vger.kernel.org>; Fri, 16 May 2025 05:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747399439; x=1748004239; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wHpTo0+tOOdeIjJWi2iz5WOwxz0N86UHcp8BE0mY/9M=;
        b=ReYIP5YCP+CjJ9sNSsPbQLAU8WvlVM4pBJmCEWujavm4yV95Q4z4GsVlp8gJIaT9zv
         JhKGOkgucc1Z55D372LU0PuAqIfu9bFVC47WTJwa7X4/rfc5tbSATZGKN6b8kEufSUxK
         lmJz3F+5FGgCBX0PVj6ALfe4bazhhk7DXvjrTraFSYZYq6AZOmiF47FlnqPCgEYJDfh6
         i0VL7mNQqfwNdV6H5Zm/rSFsYNaR3B2YbaoCNzl0dtAqCklP4EzAp26ndC29IGGv3Wdt
         pKDuYbzNd1X+n7ulS6vxyQv/qn3BHoe4/kqaf3ALbru87CnkJGcT09MY1K9mwFVUb8aN
         AmNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399439; x=1748004239;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wHpTo0+tOOdeIjJWi2iz5WOwxz0N86UHcp8BE0mY/9M=;
        b=Riyih9LU21WfJLTq1cUtbH8Bnd3xaEqrxlJsx85kG2JF/WIrurUp0NA4+J1a9SBjLY
         /hTDZNM02Z3aeVx5fVD7Vy5FpIHuZejY21E/NUj27PaPmrlVSSWCdI41f+wRmEB7mthr
         L4NFJOonufMwMwxc+O/61QgtnUfC42uEaV+xBxo3heMzmrBj4xnZNMUhHq+TqJxvg90q
         J+c7Wv41igRE4kydHicu2Fd8FXkS/lVcegK7WVzeN39wOty1UYxl6u8jjk0QyTyfdyJv
         zprE58/Nq+pVyqmdRDJnBv452/Zif5qQC6HL+x0i3F5x3YHzW0EM8vcvgIHUTNKH1IOM
         yYLA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Clfn6SnAxUYjnC7odyiNnjsodFFYn8dgLYvfezp2trV+UuVG2KCuCMPEjOI25YXMQmsEhzuL8s4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAuLCrqsts9Y1BduSrpQPDYuc5FX/vPkkCrO1/PrRszrFuaPVz
	B+24hgBdB8IsxN1VOSS5DpApx2D2CoMXxDR9mxU45Ai1f0IbOdbP+9X/TReTlt23Ogg=
X-Gm-Gg: ASbGnctuV8r6qwBzdSinubFc+zKYN/7aijYe60eJ1HXP5d4kbJng/jSmhnXIZOaz4i+
	RigKp9hszdP0FQzbFR4CYqkXTHInzNxBggmuWvHkNNTMnXr15LaUMNziYJaXmQANW1N4cQa6pio
	e5K+zTGLuHbObImOHmhMckgwA4LL0+T3Z0vjrrn4w/Dvfv1qeX8XmHqwoGZB5wYLcUwBQeRcHoV
	TpNevn6fF0cYHQxRJXO3yh1oqnAVqFfmkHuDlka/kjg+feagUyis9upqo4BkyMY26H3xnYBMTVf
	brnKSmUhVxJEF3EWInsRT+xR0RUGJg1Tj1jTVr7URphWxXs0CvAH70FEqzHZBvPca4mMP5bSUvT
	4NBKEIOeA1xQCBePd9hYvWl9NdOW2qTQUjv+SrEmGmETddwJBgiIdr1kanEATTBPpd0Ape9GKQk
	vr
X-Google-Smtp-Source: AGHT+IEMx2rKeXHRSwncbvfN2lmNXuPA3SzyKDAWFZ5mS7vnSOQ0umojgm1MTb4MIyuUTfPB8wY3Gw==
X-Received: by 2002:a05:600c:a014:b0:43d:ac5:11ed with SMTP id 5b1f17b1804b1-442fd66f08emr33757945e9.24.1747399439134;
        Fri, 16 May 2025 05:43:59 -0700 (PDT)
Received: from ?IPV6:2003:e5:872a:8800:5c7b:1ac1:4fa0:423b? (p200300e5872a88005c7b1ac14fa0423b.dip0.t-ipconnect.de. [2003:e5:872a:8800:5c7b:1ac1:4fa0:423b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdc19sm32694835e9.5.2025.05.16.05.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:43:58 -0700 (PDT)
Message-ID: <b208fa08-a028-4bc8-a455-b37aa016cfb8@suse.com>
Date: Fri, 16 May 2025 14:43:57 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv3 4/4] x86/paravirt: Restrict PARAVIRT_XXL to 64-bit only
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Michael Roth <michael.roth@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Sandipan Das <sandipan.das@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org, linux-mm@kvack.org
References: <20250516123306.3812286-1-kirill.shutemov@linux.intel.com>
 <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>
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
In-Reply-To: <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Te3kJ0f9tyKynZeXJ78zBYfl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Te3kJ0f9tyKynZeXJ78zBYfl
Content-Type: multipart/mixed; boundary="------------UGAGx2sCcO3HYQB1B9io4MeE";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ard Biesheuvel <ardb@kernel.org>,
 Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>,
 Michael Roth <michael.roth@amd.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Sandipan Das <sandipan.das@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-efi@vger.kernel.org, linux-mm@kvack.org
Message-ID: <b208fa08-a028-4bc8-a455-b37aa016cfb8@suse.com>
Subject: Re: [PATCHv3 4/4] x86/paravirt: Restrict PARAVIRT_XXL to 64-bit only
References: <20250516123306.3812286-1-kirill.shutemov@linux.intel.com>
 <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>
In-Reply-To: <20250516123306.3812286-5-kirill.shutemov@linux.intel.com>

--------------UGAGx2sCcO3HYQB1B9io4MeE
Content-Type: multipart/mixed; boundary="------------dCI97no869vba6acO80MKIME"

--------------dCI97no869vba6acO80MKIME
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTYuMDUuMjUgMTQ6MzMsIEtpcmlsbCBBLiBTaHV0ZW1vdiB3cm90ZToNCj4gUEFSQVZJ
UlRfWFhMIGlzIGV4Y2x1c2l2ZWx5IHV0aWxpemVkIGJ5IFhFTl9QViwgd2hpY2ggaXMgb25s
eSBjb21wYXRpYmxlDQo+IHdpdGggNjQtYml0IG1hY2hpbmVzLg0KPiANCj4gQ2xlYXJseSBk
ZXNpZ25hdGUgUEFSQVZJUlRfWFhMIGFzIDY0LWJpdCBvbmx5IGFuZCByZW1vdmUgaWZkZWZz
IHRvDQo+IHN1cHBvcnQgQ09ORklHX1BHVEFCTEVfTEVWRUxTIDwgNS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEtpcmlsbCBBLiBTaHV0ZW1vdiA8a2lyaWxsLnNodXRlbW92QGxpbnV4Lmlu
dGVsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4NCg0KDQpKdWVyZ2VuDQo=
--------------dCI97no869vba6acO80MKIME
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------dCI97no869vba6acO80MKIME--

--------------UGAGx2sCcO3HYQB1B9io4MeE--

--------------Te3kJ0f9tyKynZeXJ78zBYfl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgnMw0FAwAAAAAACgkQsN6d1ii/Ey/1
Rgf8Dfw9klieTIfSSxXhZ1fVOqPJSPIKODfsEQ7IKY2hhyk5t1WheTcM8/Nzl7OV4xfjjTJZFgIe
NCqY+CZConnWHRwESBtO+j2N72GxDh4odoF1so9fiMFxUaMBTUBoLUf8h5Zbj4tV5Vk/GEyNldVF
/aNmC136448wQGaxuPMRLf2TcEwBzJK8ak1t/qCWToMv/hUNC3EKgIyWbpDIM82R4SKDv9PO94/F
aBvBZuVQYM/O5kCJlbBneAV5ihh7u5t0gtFBZZFUV1eyZ1h/KdzKK1HVD+Y2jFLggMfsVPastexG
xD6Q8yWfMbMpfefU6ZZdoL0pRHWGJgpqauows+mecw==
=Gnh1
-----END PGP SIGNATURE-----

--------------Te3kJ0f9tyKynZeXJ78zBYfl--

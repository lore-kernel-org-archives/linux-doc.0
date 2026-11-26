Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706187;
	b=hEoxlfgiUD1g3S11exuodUqJR0EkNDdI+RqwlcPNpTvqwQCaIeNSDyrAJA8YQjKHIq91
	 PtP0FYshGiN0IdNSrATEIF+UQHn4MVIJrtHMJQqZP72xMsqFq2loTxB+W2R7NrNoTAgOI
	 ZgpkvpQ0YNJ3Om23fQm5THU9VxrqI8Klq96YWXAM+1GUa/XSnR+z6UTtJvNx9qLqhMXHj
	 5fA4ZGrdXuLS1JZAjOCeknbVA8BMhsM5CYYuXV4u473g5YiUXakgWU/yV4Edq+u37awn/
	 QanpHg8F02IX1SxsYgQNgvgVkez2+cAor0XozyDCexDnfRgFEqSi+jbqFddH7jwCpbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
	b=rXsJSA7H8giiAu/UShIvHnX01um1OwicNLyRhqNZ8GNrPwLx992TFkmvZBP8dhPJWVXp
	 rLADlTWyk2vR4OfVOGbZqtSvW8h14Kz67bkpz5Yi1yhRW/E8g2A9FG2NRl6eK+mCDry9E
	 kTqdnW66MVnDIxSJzbGHqdRRvQjen8PCQkQjKvFkfD1p7eXF3JNwCWrvPfQD7gI0AiLtO
	 eTWrKBnrAClmHM4e6b2tUR15KPZnkkl4Q750mYboyxepgrcXvO9sTxr9/Iznvh21BLNjl
	 CWTH55Iz06SzBx2KBSvxwXDDpE7bFEJOLDDkOqCIqJrnQpUqgpvwEGq5C47VeuOJfJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C77606A327
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C77606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0bF0rIll
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eadef147ffso5560046e0c.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 07:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795706186; x=1796310986; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=0bF0rIllZMds9r3Rg/X9Bi+iVHdHNqm+S1vsVtFnT5IDmowjopX6s5Jm6OZvmfydcf
         w5lvVkXo+toCwdm7KFyah1q0wvuXDdthl4mtV1SMGemFDmdUaV9OtHEJzjgNc31QkRUQ
         QP2gJ5cVLG7u5Nv8uQCm8VC/oH67MbE9JLud1EqvFxMpaMMjQ7Q8lA5/TkHO5H85HMem
         3q2/EbLhzaNpqlvkN9/vPueWbZyrRHUPorRN9t/t5ttzUwBv44QccQe1Tm1w4LMh/dh1
         7dTGRzrwRiAAyCCCvPvRbgc+3gzRd+mc53T0xG7X1PAECRZEYWDSMxWBOeh2Mgr2Oe/b
         PZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706186; x=1796310986;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73RhbSCzzEXErQpCoUjkNFQF+UmJqC718yIoC62o/2I=;
        b=WGdNciBKwZTmf3+PfFzlE14o8b4oI5M4DE6nsx7fZAmEKCBpF+92yc2PkZGM1MA119
         GpcWQGeaKaT9E9UtGuBogSg0eEUojXc7k+egUhwmgyEez2AMxgMXCH1+PDjAgxeUifSg
         kLI/KFbg8Z7zi3Ms+wwpS7IVgMFws6S2Z7/cxbNkcT/g1nHRdAKnX0Iiw4iaT5/H+cMq
         Cfv1cNPDdahAcpkasP8fH9e7/VMwbc5BYLsOId+sy4AMa4YgxXPgocA5+hsKbQqEegRm
         PmKO2N1CtQXoXaoms+N6NnmlMIcuaHPrnHrKKYe7dss8/VwgelKK2oj3PAYbkJtExLsn
         Beiw==
X-Forwarded-Encrypted: i=1; AL+hErHMA5nUCHqqJByeXvN7KCK4EDbiqxQ9O3zyBXbZBnXOC2t1Bj7IQNxemT+kcne89GkoxclSI/Z1eqU=@vger.kernel.org
X-Gm-Message-State: APuU4Z++v29WgXNhKTv7l6UJvxn4Ig6kgI08NDacnMMZCIU7G5egRJwR
	XOmOJVeoZja1jYBbjRbWphpvOoM/tW98asgNayGiKjVBtBmpRybEdrI=
X-Gm-Gg: AZFdTZc9BLGtHoPOOshswXT9eqrXH7bhbRu6FYLtGhI2lX5uN0ghGoJ1DY2rIgumlJP
	9gVwGC0LBpdidLti8AvHEzAzrAvWZFKY25ksdlaiRbCjtRYWC4uJb3X1lsz0cTxuqgeVk1dbIFX
	9bYimuyky74YNkHeuRT0uMI38njvk3xVrjPdjrAmhJzB5s3JHDDY8B2Y+JSf9L7V6lTrC52CUra
	nXGMq0gFwXjkhrD08G/5ImME3CQsGX2qyOC6R8VWveuXh8GNPY8f0KqdNs9Nd9sabT78YC/QJ3T
	EomyrXGY1yKYa/BFMWcX9ZIrtBmmOunXsuheJefpw+0PuZIOBGaYJDFhwQVkltF71QHKNeEy1bP
	jSRs5WIrPfp5A+f60mwfUZxulLsFIGyY8ZOaXb2op9ei1MT2Ny6WGuQrqhwOZnieI7KTPskVhwx
	XCOiGTZk+xX3zHVU237Yr/72PcjBQW5RqlCJ1FyfM1gDgvEV57wqnT6g5tM9054j//QfVHvPHFc
	O6h2GRaQ7ANt3REaEwnsauA8zaPVzq3D0EILYHZH57gTsBU54Uy/+jzYxZpuCasZ/WVHONeDGKk
	YZkU/x7DOv98R8bGVFJ4vboQUdvqKWcuweBkPErOq3x0dsnZuaPIMG7n64oIvscWMQ==
X-Received: by 2002:a05:6122:8c8c:b0:5ec:e6b8:ebad with SMTP id 71dfb90a1353d-5ee8af4a759mr12322188e0c.10.1795706186471;
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee91a4e0cfsm19662910e0c.13.2026.11.26.07.16.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:16:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 12:16:18 -0300
Message-Id: <DN58PQ0UNTCV.2C8E5QAXJ53I7@gmail.com>
Cc: "Shuah Khan" <skhan@linuxfoundation.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Burak Emir"
 <burak.emir@gmail.com>, "Rae Moar" <raemoar63@gmail.com>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, <kunit-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: kunit: add #[should_panic] support
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "David Gow" <david@davidgow.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Benno Lossin" <lossin@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Brendan Higgins" <brendan.higgins@linux.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Danilo Krummrich" <dakr@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.20.0
References: <20261113-rust_kunit_v6_send-v3-0-0d7832c07166@gmail.com>
 <20261113-rust_kunit_v6_send-v3-1-0d7832c07166@gmail.com>
 <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>
In-Reply-To: <0e68f60e-e9e0-4443-8189-72180ff07a14@davidgow.net>

On Mon Nov 23, 2026 at 10:36 AM -03, David Gow wrote:
> Le 14/11/2026 =C3=A0 02:20, 'Nicol=C3=A1s Antinori via B4 Relay' via KUni=
t=20
> Development a =C3=A9crit=C2=A0:
>> From: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>>=20
>> KUnit tests in Rust are written using user-space like syntax. This patch
>> adds support for the `#[should_panic]` attribute, enabling the user to
>> test conditions that are expected to cause a panic and report the test
>> as successful.
>>=20
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>
> Okay -- this looks good to go to me. Thanks very much for all of your=20
> effort!

Thank you for the reviews and explanations! I'll be sending the
implementation for `#[should_panic =3D "message"]` once this lands.

There's a sashiko observation [1] but I dismissed it because before this
patch `KUNIT_ASSERT_NOT_ERR_OR_NULL` already aborted before setting
`priv` and executing `kunit_init_test` and `kunit_resource_test_exit`
performed the frees without any check. I assume that this is acceptable
in this context, but let me know otherwise!=20

> I'm not 100% happy with how pushing the attributes into struct kunit has=
=20
> balooned into all of the different kunit_init_test() call, but I think=20
> all of the other options are either worse, or involve even more invasive=
=20
> refactoring. (That being said, I do think this might be the thing which=
=20
> finally makes me look into refactoring how we handle the struct kunit /=
=20
> struct kunit_case dichotomy better... :-))

Yes, this was tricky! The alternative I thought was setting attrs
directly when declaring `struct kunit ...` (right before the two calls
of `kunit_init_test` in `test.c`) but I was not sure if it was the right
place (we would have avoided passing the attrs in all the calls if I am
not mistaken though).

Regards,
Nicol=C3=A1s=20

[1] https://sashiko.dev/#/patchset/20261113-rust_kunit_v6_send-v3-0-0d7832c=
07166@gmail.com?part=3D1

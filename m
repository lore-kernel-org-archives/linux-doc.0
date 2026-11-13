Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794535694;
	b=xTuVahu0yd22zlsjmqHjH4UBMpfvg9PxjmszIacA+TYAjF/Clf3jIjDEeKrg1KP6JCDR
	 Dc59R+3X0+GUs00fHwAZlnfHmmJ5miHxLQijhFLlYbnzRIU/AnmSESxtIdpFz0tvbcHdo
	 z8wg1T1J4+rY/wnMoOx6JCR45JbH6WeayoeUQkP335JtrWj6XF+7PFsDFI0hkPx4RXGBW
	 zVK/jJT8Le8kbPzGIk3CorMvHdPcuK/hz4BvJs+JVRneN26N2LF5ECJTcWxYtk1U5vqjO
	 eSBe15DKxHJ4ngM6sBufSUNxUA+tT9ue33ia+RU649kPBWx7+h/82NMNwOPZrwIzmjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794535694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
	b=SZoCn+epumHYwSJ+3ztqZyJk5ppsZEUrt8yhzcXU5kQocjIw/RjJr9apT1mp+iMsojkO
	 9INlDGV+h9gDHV9kmCRHyZ5WVx7zEY2nw7rJuhz2DsDHiGR+kXa+SpqB0V3JYilLEnu8C
	 +1FDOF0/yP9JcYTkK7YqoNnQAeFYJuZTVQdG/pidghLLk6zl/oOuLpln/Rbj/ZvDzRqJx
	 7BCIQy7mh/iM07DJbuzfqhEUPgq/TfV7cnwSuoE1JK+Y5mKeiyVs9CnXC+ScCNc6OZnEE
	 xTlso9oQE8WJFXKoyrQbw2QG6UgjA/HpvNO/UsonDXMuW4TL2eJdUx1CP1ANf8Vv7Dw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="klQO7//Q";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884C0606A89F
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 02:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 884C0606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klQO7//Q
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so419109a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 18:08:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794535693; cv=none;
        d=google.com; s=arc-20260327;
        b=Y64V8JQ3CbOnbyRZ11p8D8H8O+u35PuNqOFoj6nTQ1ntZ/m2Yv9nXQrzPro3z9Ptjq
         dvmfueQC0MbKzJc5PC5+EaMRVxo++68ZSTIEGSwJ4CE8Or7bKS1nSMmS47v+gMjiPbw0
         zz0MKG9l/CKETDfH04zFl8bAdaITPGplsN601QX4e31skx18wtF6gOHOupO/y+B6YnVC
         akAHllrv+VT9/FUFFSQW3wyPFo6N2NTXWZs+durcq6NfLYtNqBYHcpJ1nsBR+fBkicwT
         3Q3+BF/jNuyzjj7EGMx/0g4Hw2nLKQAGy6NuYSGy5bZLJvbwOCNGTIekzf136Zcl45hz
         H0TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        fh=jMJxk9yF6nSq4m1PEIkYvhEA11757ngmM7dalB77L1Q=;
        b=E4I2yqO5tcsxjitGp8SA4zJ1WMo1kZZ2xOsi3aHt7I2hP3CuJOoJ/BJx+BoLdAoBqz
         WJKIo+I5AKxMZZN5JDs92ufr3Wq9s9khOG5vYsGFSgiCU9E9/0/6KEEI6KCULjerkloS
         g7CQ2eFZIa5iSvMoZNaxmNRmWtA2tGwQasSErBxklxJkN9YiYl0T5fgmP3zwKETsHzk7
         Ir2ocnE/kO0txo2qIJkxsn4dexMv2Uvh7BHKsTeiDYX2Uu+rxi0bUiiqNO+qeu2Cvswc
         CnjGc0KyYv289YXeS2w8I4ToJujW2Wp20765xl5e1bd9r5ODbRNXp2Hn1+U7kMB7ZnF1
         +fqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794535693; x=1795140493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        b=klQO7//QtkDbV02g+GY1OMb3W1hSic4rJYk88HUuiEVnV5r3FG8JRUJwSbhV5qSD3H
         94P8F+D343ui8GrXJY04mxHXR7wzUoT143X+PFLuNOdHLlD/wDspORt0zXmfjzw4Rfxd
         9ZsjoGKCwSc7P2wgZ+mSbb3J0pe4iZ41gzBoMpkWh6H8WXjrUPN1iLp/1W+H/wjp4pEu
         eEv5gQb3IRLvhJD4mpelZiS9eY/kYinkX9ozq3pVHofOIWGBpjQtjj4+RIqgAShakbxp
         NbrKDUFqRIGjIB5DVRd/NpXdbKC8nSbem+IczdCrPWDPH0rU/D0gLNAP+gl86bjvJjA2
         symA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794535693; x=1795140493;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNvdaJwzrU7dKbL8hglaP0KiPMauObfmKP0USfT2P2w=;
        b=DgGVNnPD4pisj792tTK3LZj+XD7DVvzf0O9kXEEimsvay312veMv/J1LGdUEtGUPw/
         QKAhi/bWgYb8L6frt2fqLakuslWyjzy/qjKOORkWUpW9cc3ygNXJJ/y0WAbMv/Qm+lL8
         2yH9L7YIxBhPB6WcuNBZ4SCRqzyt9bKwqfgEQ5SdnCTqesSAiK0Nx2NLttqst9jBFq7B
         yeRY3NVF0QiqilelNKIteQ4q82ByxvUSnV5C0SQIPLCykEg0XXDjqaBoX73z/CXKqzz4
         +7bi+Aeud3Omvo84Rrummm2QSfuX6b4bfGbINTpWi5hZjR8oyab2jC9MB6tJV9RdkI/p
         aKmg==
X-Forwarded-Encrypted: i=1; AL+hErENVc0UHQw29q4CxxwYbPrZG8Rz4w4bq2HQMqvT+w9YPtdlKq0pqlUXV+4J5ZZXR1JYOAuvKrUiHR4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lFNZUV/9iEt7GyFvqMPqsxzHdf6sU86R41NmGGfDCcHDu6Uo+
	UIkLBKbElSm1krr/f1xoUiufm8Q3ZpFv/Yleqs8U6mU0oQ5x927CyF+dz7XJFYIzOz873vzbE6e
	7rY3NIM9HS2Fo6PXs+dxm3k4MzdKrLz4=
X-Gm-Gg: AYBFou2PV/h/Q0lxloayq+20/Slk/7JqlWYh9zdyqCvlOXJf0VGFsiEj9+DB9clyZbC
	gHvqWoWTTyrnEMy0pKrjMDnGnCwW3r8fJPcDyJ3kuSMa8ki0rwvLepwXwhO1BPOa7bRC2627nkA
	nyOGI7OTmr5ht3aPlzYWRN3Q3qkf6uF9j2FxWx7cqD6Y8t9tZYKJySxITsEcUDYeYVT3OrkQEnY
	5KekEGG7+I0sUQCKjyzkjdwYCwD2CC5TCHPloSsze+ulo+o3NT7iKd/9bMHbJqbVmpzBMYKT+0+
	tV03TfIvwIF6ieWSNTUrCSk8avqQ+R7WmjeS3cwnN2PT2fSSqfttdTHzzUrrnwC67fBCslqiVdu
	m0DBO9qQ51vl6k8KCKwJE3m+h1HhRNOtqxv2DEC/nVS+7p0RY1Mxol2eNUSkw/x79p5h2a5k=
X-Received: by 2002:a05:6402:1f82:b0:6b4:21f6:ff48 with SMTP id
 4fb4d7f45d1cf-6b7c08adce2mr1021917a12.3.1794535692714; Thu, 12 Nov 2026
 18:08:12 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev> <20261112-powervr-sgx-v1-2-c69b84bac011@telaak.dev>
In-Reply-To: <20261112-powervr-sgx-v1-2-c69b84bac011@telaak.dev>
From: Gabriel Gama <operatingsystemsdepression@gmail.com>
Date: Thu, 12 Nov 2026 23:08:01 -0300
X-Gm-Features: AclHuK_17nK0vdrM7hFH-08XQ5C2OxqtJhKel7UqIVpBLviQdlvTl_RWXYPiYVU
Message-ID: <CAFGNeagBWpdG7a9A-c6WRiPsd4oPXcWai9o=xnkZDyY+axcniw@mail.gmail.com>
Subject: Re: [PATCH RFC 02/13] drm/gma500: Publish the Cedarview SGX as an
 auxiliary device
To: Joseph Telaak <joseph@telaak.dev>
Cc: dri-devel@lists.freedesktop.org, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
	Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Joseph, I noticed that gma_sgx_set_irq_handler() updates sgx_data
before publishing the new handler pointer.
During unregister, could an in-flight IRQ still be using the previous
handler while sgx_data is being changed?
Would it make sense to clear the handler first, call
synchronize_irq(), and only then clear sgx_data?

Otherwise, the auxiliary-device approach looks interesting, especially
for keeping the display and render responsibilities separate

ty,
gabriel

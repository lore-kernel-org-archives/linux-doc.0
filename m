Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794168330;
	b=cwBiHrP3Oiu87+ctZzU2/ieg7ca44S0du4SodbF1gLEZx1qsrCcknR6ONU3U87DfbfDq
	 J3SvfIO4ehOnl4gsiNhQNLQ8F322TY5ZXjrjEWbg1Kr+6vwyoEe06a6CcSJ+z9yjUWw5l
	 vcQc1+wfbQjeYbWIfm8fk3bF/5PyJMfLsM20S5SnHgbDmFrhjwGRSdSDFhnzChJQBGfFl
	 zpZ/2DxXefC6JWFGHvZ39xJPh9WhQ6/1U3DqpEY24rrJiSyFafn9VDMWRDDOYxPPf0Hlw
	 zIv+bs0BlIy8QyZnsD9sNwsv8leLR9pKQ5mU5C4vi4KPRyYCvwqPvycjXZqE+gi4/GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794168330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
	b=WVoT5aHdooyICYQFzvESMfoiDudXcmgmCVE260BwR5hjZITFe+WEHqZEtiSzaf/auOWW
	 oPRUBPR89blsl9v75kIQqMYf2q1HtyVMAj2VOMlIyvV1tyvyTB+f6e9dne9Xnk/Ozlg9v
	 7D/G2Bq6GGkCTmDpPHyv6k7GIADejsaxeKA746TUgfr6EeR19TSEdnvx5Dl3sTLJlLXz/
	 Kjxv/gcdxntIZGdSm5NZU47ZBsTVXRLhePSWF7qLIprDYn+WJmbgH0ni4gQ8LTrH/rNmY
	 8uH15ygeEc5gThJuxbGiVZaYAN+J5lyte3HBAuK+wWlqihhQMEgaYxzT7ucOS49G5fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ib7c6P66;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50715606A322
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 20:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50715606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ib7c6P66
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso2051705e9.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 12:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794168329; x=1794773129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=ib7c6P66JcABRQVIYvbAfEuMzOdspSzPtZfn7p5hZaB2Rr9aWYVjAA8lHghOcTHkfP
         W1IBKWn61CtXgoJPbCEozcqCpgRPGxULcN94D7ITtmHErVGmr3isoGCQ02nfNqhbH+4n
         lUM22s4MKp/l6fyffg7/TutUQVALjesHSFnC4w+1WVPSvW0J5rknAYGDJAl4xvCRXDT5
         fBdxAtmJXU6SiF6lguNdvRiiwtq6Km8nyFGsRU6Tq+7fwVjsnnI/ZpxcJdUfsPAfNVOr
         BXFpKVyK/3a7Qj/Qjq4EwXbAdcjWWztzIsYea9a0P/MiY6n2EtEGPByGhhhA0f0X0qYJ
         P5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794168329; x=1794773129;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsI7ZZLkYjCZutUVEg7TJNtNpCk2xGDMbVs7o+8cm3Y=;
        b=ojVpx4UUjIxQU4nCvd5Wa7+EarJ55NheqWYTyVxUyOqInzPW2/ErGN62DyBDdiI9dx
         MvIRZKeIQ2eOx0yBIALragSLzw+gM0U5f+6TCF+T3XIBC+1CDkYZsweDXCE6UP/rMMqf
         AJ5LHXwRTj04/QaeFECj9DNu2RNU/kHTgcIXnIYvnHonKq4LAj1g4VmFBKytEd6APgjy
         czyysrYNhZKr4pP3OtGAXpqk4/WdcWwpi2EeR0xT2E8rPiR4Xo8WaXy6qetiE5C4o+zh
         QsoYU1V4oHERi64WBMHjtQm1cZlXTtmSYC2Ao/TlH65fa3+SkP8FSueeRhVUttmv287Z
         QWmA==
X-Forwarded-Encrypted: i=1; AL+hErEt/mprVoeaImDQjMczIb4b7jHuAhV01oG5MFdVX3qgO2xB6HpVghlWmDHqB75/oF/ecYY6dAyUw+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IlGMHBEXoeo2Uqp4JRzcbaVMt1zEySXHEM3W2CRXuIudrx4u0
	wRV9oQj1X4Q/dGnfUX6E66LaCUuZPJqoEKFooIGxDe0SjIWEtIJ4+G+3
X-Gm-Gg: AYBFou3LHZ6igjgmm1/MWb14+im4DSAMA5Y05UCxirKgOxQbSQ8LVWDiz6LhF3wWg15
	HvMY/fYPM3+ZQa4WDwYcRH1VzHa3i7LowBJCkmsNTOIbabqbu3rEln3untz4SK29pc700nrGLxm
	z1UoVZieIsKNM9NGE3Qr0BU0hve/hJxbO9qiZhE2b5xO/ZYZwrhVKPAbPLXRp4hTODX8jNnSOC5
	42tmtN/g8jJ9kT0drcvQNXChzeEnWcOXhSwdFnB+NgdKGh89lXz6YzopYsjLKXwJHCRY4PGCYb/
	Fi2YboENuguXFEZY4bkysPW8LWVvKWO5y9bkjbqMcoYSXI1UKF0CbrUZzsgOe/ELbPk+ie6mK1j
	NUDcdFmPbJH7knMsQYPMTCOSXBUr+9obTohZRyv+u9HmMDpgAfpMwiXM5lZp7TU7zC8L0eTOdo0
	pA4dQ18+U1zWIMSE7nZkxgZayWNs7kV68rUK0OYvCiSh9hgsLjwIw7OQKJ0urOQ0ItCaOB/5rz1
	4rUEQw06mHdKi7piOt5QVfYdGo95rmioJeiVg70w3SCOej9j/iVwBahQLgqWub5kkFwC9VwT/J4
	EZG9yrH8CmQUFHnZ/U4CHA5dgv9f/4nxIEPMg1qZaRv/NEIF2CB/+gPsaUdYn/DtdptWpL47/B1
	sw1QucMcaBw==
X-Received: by 2002:a05:600c:1c0c:b0:49f:ce78:3562 with SMTP id 5b1f17b1804b1-4b963c69d23mr43591205e9.19.1794168328561;
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597186ec5sm5768522f8f.33.2026.11.08.12.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:05:28 -0800 (PST)
Date: Sun, 8 Nov 2026 20:05:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Hannes Reinecke <hare@suse.de>, Jarkko Sakkinen <jarkko@kernel.org>,
 David Howells <dhowells@redhat.com>, bpf@vger.kernel.org,
 dm-devel@lists.linux.dev, fsverity@lists.linux.dev,
 keyrings@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-security-module@vger.kernel.org, Alasdair Kergon <agk@redhat.com>,
 Alexei Starovoitov <ast@kernel.org>, Alex Shi <alexs@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Andrii Nakryiko <andrii@kernel.org>,
 Benjamin Marzinski <bmarzins@redhat.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Dongliang Mu <dzm91@hust.edu.cn>, Eduard Zingerman
 <eddyz87@gmail.com>, Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, James Morris <jmorris@namei.org>, Jiri Olsa
 <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kumar Kartikeya
 Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Paul
 Moore <paul@paul-moore.com>, Randy Dunlap <rdunlap@infradead.org>, "Serge
 E. Hallyn" <serge@hallyn.com>, Shuah Khan <skhan@linuxfoundation.org>, Song
 Liu <song@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>, Yanteng Si
 <si.yanteng@linux.dev>, Yonghong Song <yonghong.song@linux.dev>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v5 2/3] KEYS: Replace assoc_array with rhashtable
Message-ID: <20261108200526.43579e2a@pumpkin>
In-Reply-To: <20261106090516.GA1973@sol>
References: <20261105031401.956609-1-jarkko@kernel.org>
	<20261105031401.956609-3-jarkko@kernel.org>
	<27015846-0161-4700-b810-4643e1f7b63a@suse.de>
	<20261106090516.GA1973@sol>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 6 Nov 2026 01:05:16 -0800
Eric Biggers <ebiggers@kernel.org> wrote:

> Side note: fips=1 actually has little do with security, and in some
> cases it actually decreases security.  See for example
> https://lore.kernel.org/linux-crypto/20261026183332.11402-1-ebiggers@kernel.org/
> where I'm fixing a vulnerability caused by fips=1.

Then there is the 'fips compliant' server we used for routing 911 calls between
TDM and VoIP.
Any kind of PCIe error gets routed out the the motherboard management module
which then proceeds to inform the kernel with an NMI.
At which point Linux crashes.
The NMI is too late to stop the kernel having to handle the ~0 from a read.
And even happens when there is no driver using that device.

David

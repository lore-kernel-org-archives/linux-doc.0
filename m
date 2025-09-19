Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF0A3093CF
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758279986; cv=none; b=ej7n7LS48/0TIgliq2lKprqzIX1s4XQ0QSu+tcG98lx6+SA/jBdWoWgwWFDIIgbqGz46Wdn6h9+DaE0Jr07Oe1VTa8JYqe3LfdcvtuNxHnP0/2gmW96xE9thSaml3Y+mRLjRi73nKfCzJKl+bSzh4hwfnEq4nbkuQuoyXx07mpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758279986; c=relaxed/simple;
	bh=FeRgsSRi/iWOgqISnP+r+zKDQoLdP8inVV16qsd7MGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=buFdKlEjR92cfVQebbcxGBbDbMVDSBYO0HYNsPpAEcPyqy9i1XQ+TkuOp0HCBVLDb1jJ+OEyTwA2hd11cVVXFpi3bChUYdrK1KcQJqOQQVAILz4H2cCTwiDd/NRSIuqagw0SJVX8/ITSc5fpH3TtQEqvR7588E3AdrKNkxj1EGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8SC6C39; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8SC6C39"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so897597f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 04:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758279982; x=1758884782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E0gpwB10/6E2U+Sby0w+MPfG8NeegflF3tJftb7joqA=;
        b=Q8SC6C39HSzMllgd/UNkS5pHqobCWsVLBjBEoSNzLAi1wsLTx93PZqvd4EabCCHfh6
         cMHspRcNaxe1EUOPs1/THG2wDGA3vz51R9eOdzC/3l3r4e/iQd7To8YerJGalNMfVJqC
         uiTF0rDFb5fx5D9veDlLBTYsbpNcME9/bbEld9/ZGMIf1TlCyonJUAKCmx5vMZkm7D7X
         tQXLJa+AwBiM/GRvYgxFU7pDgyWOKdyD2J/kznrNiArhSTDytaR7xmFm+cCYX1LDG24o
         /8c/T8JCJDl3Yhlwn41FOJWVLglJoXkfu4FjDDbjHn/fkX+AsKjHR5nWxq05trMcuq1A
         eOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758279982; x=1758884782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0gpwB10/6E2U+Sby0w+MPfG8NeegflF3tJftb7joqA=;
        b=N3i6C4ccF0xZTMrSWRxEAgLuoJp1y4wdaWl0WbjOA0Ez5VXtnT7PhfpOyPwzGF+5aq
         mlxSD6X/lQZwvLkPIfipW+YxenAn28DhtUibM6bXLAVtG+i6YkZAk8mvoFb+AGoEncqU
         raVE10BhmwARcOFG1uDizrlZv7xcW/n45colpr96aN3B6YJ2X/FuJwccNc0Qjj7Fgq4G
         sNGr4g2dT8nvewllDTPJm8MReGdGDOxuF7/6PwWL6o6uOeYh1PmxFAeKIGjMzqGq2weC
         6RcdazL5GpC5YNYpzXZh4nDAeZq51xwe9Pj6N41BESzUKrm2bik8GtiEHx6D8uNCoKTB
         GIEw==
X-Forwarded-Encrypted: i=1; AJvYcCWXA5w+ecGlym0bSS57vdD7gmJI1DwQ21nMAALhuXML0gN/N/pjzC/8cbsuWS4HbaHjJuqCvsPgHy8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO9X6thq18qjrE5yKVTiaYoHpDyS5bS38wlsLirmYkW4463+2S
	CkM4OXwqcEr6kzu+ZkmQQXBUEDK3c5V2WgUVtOnut7osIiUwEtn27Pg7
X-Gm-Gg: ASbGncvOcjT35gUDF7lo2CrHuG8k8TN1V+3mpQAvWVqP28CNEMEQq9DqCIBGF/QBvmJ
	N/L5GwxF//yN7RdDcK/cUywZv90y+MeZ+A4UwazPK50Lg9Lrjsu7frkpVes5wyyAJOAC/CUmj3y
	jVwztdl6bfIrDNXTaS+DgWq5VkrJYBshQlt31S90WME0Gki9bjMDbYyoKJfyFTf3rjdfKMGo8fC
	g3OBBfS+LVn/i+pzzpijZSnD5HYAI+2P+3tJnCn6Ww6OJvwrQi8O8dnu+03mTDOmwabcBymbvGi
	H6i9yUCH/neCVPMYNtC8wH3mEjLC4/ifTgP/UxEb2QrJtFNUHqBS/JqPDDm1QJGX1xWo8Pi6a+9
	O7SkzyncD9ccv501B5wVY
X-Google-Smtp-Source: AGHT+IF2Z0bInAWZqDYYETRVnCkFEjbkAn2Fex4pkyig1CAMuVquXF5ao4cQ8XxsbTLy1k2XXr+50A==
X-Received: by 2002:a05:6000:2881:b0:3eb:dcf:bfa4 with SMTP id ffacd0b85a97d-3ee868a75b0mr2033940f8f.54.1758279981950;
        Fri, 19 Sep 2025 04:06:21 -0700 (PDT)
Received: from andrea ([176.201.192.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46138694957sm139550595e9.4.2025.09.19.04.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 04:06:21 -0700 (PDT)
Date: Fri, 19 Sep 2025 13:06:15 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, will@kernel.org,
	peterz@infradead.org, boqun.feng@gmail.com, mark.rutland@arm.com,
	ajones@ventanamicro.com, brs@rivosinc.com, anup@brainfault.org,
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, apw@canonical.com, joe@perches.com,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [External] Re: [PATCH v3 0/8] riscv: Add Zalasr ISA extension
 support
Message-ID: <aM05J6FU0xG3SBzR@andrea>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
 <aM0qlTNPiaQRY2Nv@andrea>
 <CAPYmKFsP+=S56Cj2XT0DjdvBT_SY84moM4LVeqxHTVWbtq4EVw@mail.gmail.com>
 <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPYmKFsV_ZPifJBtvPOdqM6_Mzhac9A4-PH9zt8TirOqAwKGhw@mail.gmail.com>

> > > (not a review, just looking at this diff stat) is changing the fastpath
> > >
> > >   read_unlock()
> > >   read_lock()
> > >
> > > from something like
> > >
> > >   fence rw,w
> > >   amodadd.w
> > >   amoadd.w
> > >   fence r,rw
> > >
> > > to
> > >
> > >   fence rw,rw
> > >   amoadd.w
> > >   amoadd.w
> > >   fence rw,rw
> > >
> > > no matter Zalasr or !Zalasr.  Similarly for other atomic operations with
> > > release or acquire semantics.  I guess the change was not intentional?
> > > If it was intentional, it should be properly mentioned in the changelog.
> >
> > Sorry about that. It is intended. The atomic operation before
> > __atomic_acquire_fence or operation after __atomic_release_fence can
> > be just a single ld or sd instruction instead of amocas or amoswap. In
> > such cases, when the store release operation becomes 'sd.rl', the
> > __atomic_acquire_fence via 'fence r, rw' can not ensure FENCE.TSO
> > anymore. Thus I replace it with 'fence rw, rw'.

But you could apply similar changes you performed for xchg & cmpxchg: use
.AQ and .RL for other atomic RMW operations as well, no?  AFAICS, that is
what arm64 actually does in arch/arm64/include/asm/atomic_{ll_sc,lse}.h .

  Andrea


> This is also the common implementation on other architectures who use
> aq/rl instructions like ARM. And you certainly already knew it~

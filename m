Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7F8214A64
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852110; cv=none; b=Ilv87leV7mpqnzX58fIA9/wIhO+i81yGMfsFQti5iS7ad73L7UZXxJeYfulAqIlrzpegrUw5yGBXplTEM+JooZEL14YE0cATFgcJw9p78OzH7Tq3EzKGLEjCPVeRbtW436zbsBzab1LAwbisbwy3YEOAWhD+etfnk6TZ6Ub5bsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852110; c=relaxed/simple;
	bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lhi9bWkoPX8LCAF0HbnQnZohBR3B/bWmYs3kLWSyNYxqvDV7OUnpqqBgoi56zN/fGpCBQet9QhA7dxht2RMrfZu5sOgRP0XiHt9HS4q2lqx1fvzYHyOfmPxA3QsDQrQxtc6teaT3EeaXDhSjsxh4ItFLn9whdgal7roOkVX6wQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=re7owBYY; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="re7owBYY"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8823e39c581so33060126d6.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852107; x=1763456907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
        b=re7owBYYJrPTlSNKQcwaizDxrcmieeRuYuQ41APdnT5aR3nqNB71/0eTrKHKW25OEP
         jTynEBUFpZV66AhtMhI4jLnGlfZIyJUVU4EXJ28JpI+PZkDvTnFJWHV+dI+G7fSkkBl0
         Dkq+syf8qK7jZJwla9m/9JurteW6JeSWRIUkJQ6wehbDMLDroCObvJY7rj8Ia3x9jzEr
         UShxa6heHm1cRyWSTdS3baRg9U6ikWYyBl8Gm8psmNKIBh6X4j3lkN2OAhpPlNZP9AWe
         Ub7W+NwTMX75zZuf3tosBVf37Te4F/toDtjYuVISvXTwJj3CuZVop913uiuMZaWwE2LT
         HmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852107; x=1763456907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+mH9+7PNLYr6Z/2ln9TuMbRS+qcoVyhy39YsWeg6dI=;
        b=KFxTTvAdQGzu09eznnGwixcDgnsnaI36LPpbufAsdba4Nj9RLPJUKRUF9+UH2vA0yJ
         mLIy/L2BAs7ZmA4cCW7fu0G4nj4D9vVmaeU3ew0ZD3j8kWE7ROxp5pdihsLORj0DGO01
         CiUVweHRPkOa6P12pzIPo4+uSSlUuM+PXmU/zCfPe4r45c35MijPoJVMFDMeS/owBPPK
         OnC57ygGIPV8XS+BpLUGvJx6zib2cckoEgJgJSNfo3zdf+0XZvQMJLeoo3g2IQzBE6zC
         DdvGk90M0MzbNY1c33mEobe6ayGRW7vF/1QQDdar1xMc4uJvwQZe6SOZSwasWSzq/bRz
         dM3g==
X-Forwarded-Encrypted: i=1; AJvYcCUYAmE0XqgwCmxiXxLX9kXPy8Zp+FC1XPkV7lBLrdpAwFfqhcVzIDBOL12hvP+cc6Id+xF25kbApLM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5YocytaC1AZRv5KSmShOzvGpz7iwYrzT9Ykt5fiJQElyTwYlV
	SdjFIK8qWC+LQOXS6sxmwYVTpRu8aiJiGdHm4wsvwrtZxPIU8mgfaSRrhjjG6rZdAtDo3SXDb0V
	4TjsuVa9I6unhCofrmMaYq3na24tWt5l2hVYFCU2P
X-Gm-Gg: ASbGnctPmpsfY/jCksQp/+lyhJMLPpY19ON2ldbe0Ff65XPPiAsMbNIyjrL7JEAeK6N
	hLD84iUMxtnTkUCX/ogV6+40iqJLm5Yrd0No33g5aM3HMYTwQ7NkvJTFK7eD6X+VNcW9UA0OJp+
	11vrd+dTplZKNeUrx3DjOyCb/pPb9pUcWp+ka1VyZ8eSS8RzjdEiRLyTTSxcRrutaT8GRWAZDE8
	pueOusxWzjox3CeJ/gQhN4l7oQu4tFOVVZ7TVr+5zmdtjuMEhNiU9k+NuPec4YVy1M6eWI7SPTn
	RbYqpLOUUPCg9+AuoY708wt6FI1RDjPRV3j1
X-Google-Smtp-Source: AGHT+IGGiGzNQ2eAyJqdaO9JyMrXkP7w+emfDXwZMPoyyY2gy1i/zUBgnLRf870LMq5UXpv/uG8YRTM2WfKUuwW/Bjc=
X-Received: by 2002:ac8:5751:0:b0:4ec:f4be:6b12 with SMTP id
 d75a77b69052e-4eda4fd3621mr141844221cf.72.1762852106635; Tue, 11 Nov 2025
 01:08:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <56d9203b1fcb6281b0d29b44bc181530e5c72327.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <56d9203b1fcb6281b0d29b44bc181530e5c72327.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:07:50 +0100
X-Gm-Features: AWmQ_bksKNIR8oRrvQW5ElnBBjqadCFUKWpQKwYmKonXZ13JEF-XHOSa5ehktsY
Message-ID: <CAG_fn=U3SLOoy_K-2ShOMYf80i4AE1tB1AL4w7wcJAXBxi+PtA@mail.gmail.com>
Subject: Re: [PATCH v6 12/18] x86/mm: LAM compatible non-canonical definition
To: Maciej Wieczor-Retman <m.wieczorretman@pm.me>
Cc: xin@zytor.com, peterz@infradead.org, kaleshsingh@google.com, 
	kbingham@kernel.org, akpm@linux-foundation.org, nathan@kernel.org, 
	ryabinin.a.a@gmail.com, dave.hansen@linux.intel.com, bp@alien8.de, 
	morbo@google.com, jeremy.linton@arm.com, smostafa@google.com, kees@kernel.org, 
	baohua@kernel.org, vbabka@suse.cz, justinstitt@google.com, 
	wangkefeng.wang@huawei.com, leitao@debian.org, jan.kiszka@siemens.com, 
	fujita.tomonori@gmail.com, hpa@zytor.com, urezki@gmail.com, ubizjak@gmail.com, 
	ada.coupriediaz@arm.com, nick.desaulniers+lkml@gmail.com, ojeda@kernel.org, 
	brgerst@gmail.com, elver@google.com, pankaj.gupta@amd.com, 
	mark.rutland@arm.com, trintaeoitogc@gmail.com, jpoimboe@kernel.org, 
	thuth@redhat.com, pasha.tatashin@soleen.com, dvyukov@google.com, 
	jhubbard@nvidia.com, catalin.marinas@arm.com, yeoreum.yun@arm.com, 
	mhocko@suse.com, lorenzo.stoakes@oracle.com, samuel.holland@sifive.com, 
	vincenzo.frascino@arm.com, bigeasy@linutronix.de, surenb@google.com, 
	ardb@kernel.org, Liam.Howlett@oracle.com, nicolas.schier@linux.dev, 
	ziy@nvidia.com, kas@kernel.org, tglx@linutronix.de, mingo@redhat.com, 
	broonie@kernel.org, corbet@lwn.net, andreyknvl@gmail.com, 
	maciej.wieczor-retman@intel.com, david@redhat.com, maz@kernel.org, 
	rppt@kernel.org, will@kernel.org, luto@kernel.org, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	x86@kernel.org, linux-kbuild@vger.kernel.org, linux-mm@kvack.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 9:08=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> For an address to be canonical it has to have its top bits equal to each
> other. The number of bits depends on the paging level and whether
> they're supposed to be ones or zeroes depends on whether the address
> points to kernel or user space.
>
> With Linear Address Masking (LAM) enabled, the definition of linear
> address canonicality is modified. Not all of the previously required
> bits need to be equal, only the first and last from the previously equal
> bitmask. So for example a 5-level paging kernel address needs to have
> bits [63] and [56] set.
>
> Change the canonical checking function to use bit masks instead of bit
> shifts.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Acked-by: Alexander Potapenko <glider@google.com>

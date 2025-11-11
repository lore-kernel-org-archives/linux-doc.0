Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E9D334C27
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851798; cv=none; b=e7tMspbJKnTq64XfsjDCXCD0Fn4CRUnKVEQ2xGoGocobG6B3Ey3uP2X2KBrdFFNw3quis43N8k4ICM7J2KHsOxwcblrdPDttVzqS82NaCA4vuhv6WqJq8AKDW1ZGYygjqax7+7vXbgOYO2ruli5aKOzTkJbXKxmZgYAe8k0OafE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851798; c=relaxed/simple;
	bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VU4ewTh7KC6p6/OQTE7DHDgtnAYhshAY/N9+j7qVIZ/UEiv/9l2uTD7JWTK40wbqtyTXqSGuNvak2RThbA6EncVbIDW1L/BFgHRZCYrF9FokisK713o6vWdcgfNitoiBZDQPew6SiLSIKZB//sd6neMdw4ezVQ3uEiE2VOI6828=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UyFSIlwB; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UyFSIlwB"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8824ce98111so25193246d6.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851794; x=1763456594; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
        b=UyFSIlwBqni/WK3LjDAS7FYlHe741djJ/Stxqtrp4ECcr4d/ij7y2e20TxB3pNOE+k
         nVia7+QMOCM/Q2YE+Rcr7hm3DxiSdycZMJxdWQ3w/e4fxYc+YL4PgyfYtyh2Nk74m5Sj
         4GXBl7vlsL2zQ8wsjKeVsGxPCucHzPthtHmBV6EAQwE1UYTPYpUtJBmxcNHfMS+TrEBR
         SctNhE1TA2PahMS60wiuRST29P3fpeV19FuNarur0ywSqk8o94qPIRKDAAAa65D4EKT4
         90Tb4cRFDRw/f5wbBH1i0ofeNF+vuIiZUMJL9xxHY364kD5UNSXD16yOW7drnppEwCuM
         R9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851794; x=1763456594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pvNoy8QjEGF5vDREzb9JJ0U69eI//OHw5iW0XV0TScg=;
        b=uJCSSTSZFMDw+VORZI2xowBPpQ4XByXQO1oDdt3RHv8lvrChnpelRnYHzMlWmVuMTY
         dZu02JjZYYLyHx+BRFvACzb8KQpu4GBK16qYYSQEa2bpTIiljprwc+janyUFZ5Wl2ULD
         BHiIhbF+N+l2PtPSx2YZlGNWKg5fISILjsubj48TRb6jsjBFOXmuGcenX8/QNKc/52MV
         n2vxQRsi88OjJcMReGHOQ2yM+pLcAVZVhhTSv5N6+uZBeBJ2b1OD7peF2MJjFj4BLkkw
         y+6Ney7VGiNyOD4kE+R0YEUINMwqwMa5ctWm3s7qTeCs21fz+dyGH7hGdehtr7Vy3+s1
         LpBw==
X-Forwarded-Encrypted: i=1; AJvYcCVvfkUKZ+9RsWT4nOxhKYldq7uL9bdW8UrOh1WIt0qTpfkQeuRpAllfB0CpcAAczlrZnfQvRzCCAUQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxb8WGSdDsrJfR/ffc9gEzour3hleHdOlNvIrFcmefaby6htHV
	T/akBSvImT/a35+fHPcsLCuVp/de5q1sJpfR+uNgvfOyvuUUzSfMeREQuN7GyoDnwvG74wZ+yaP
	0PCeRqPIg1zPhqR03dHyxAKBKfWLLTKQrAnmStZ6o
X-Gm-Gg: ASbGncv7DshKJa2by3JuV+oN/B5+xCkROuFejiuLzTrh+ZvrGL7CFmdNVeBFo5GQn0I
	LxW8VyvqHp6zdX0SILiP15yTEm0KGYZrDS2GxFIQadj2SeX+0umBEA0qSGB2I8l1qKvIZvn+JxU
	MvB9jyVcG9/SvAOkuD1UHCPC8CUZZChw5f81FH81DJXltWcyxi9AAfVk1rXU+hiVijPoTE/JymE
	KJRMumsxqdYbk22sjI26JNxSDCpF68ALo8U4ZGC3E3ml0Sec2HrGEepnyhlmIAELmZMnE7o4cvi
	wxgkVMoP59OGHLpt6Xg2tl65NA==
X-Google-Smtp-Source: AGHT+IH4F7Ckq32jrbiUxtB1JJ5uFrJqHGgUMRdrFl5ONAv3USRRzhM1TtECqM3yfM33Ue560sqRvq2+UhD4VMC4pSM=
X-Received: by 2002:a05:6214:e42:b0:880:51ab:a3e3 with SMTP id
 6a1803df08f44-882387621d9mr168741746d6.67.1762851793588; Tue, 11 Nov 2025
 01:03:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <0a21096d806eafa679798b9844ec33bf8a5499a4.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <0a21096d806eafa679798b9844ec33bf8a5499a4.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:02:36 +0100
X-Gm-Features: AWmQ_bncs5LVtJN1ReProGRqJJIZk54xNH4kh3rOCX8uWFHvQkLT6YYoepdGREs
Message-ID: <CAG_fn=XQPbZb4MTBUgkJ17gfQL5K1QMahaJ39Mw7Hv4zm1crXw@mail.gmail.com>
Subject: Re: [PATCH v6 16/18] arm64: Unify software tag-based KASAN inline
 recovery path
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

On Wed, Oct 29, 2025 at 9:10=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> To avoid having a copy of a long comment explaining the intricacies of
> the inline KASAN recovery system and issues for every architecture that
> uses the software tag-based mode, a unified kasan_die_unless_recover()
> function was added.
>
> Use kasan_die_unless_recover() in the kasan brk handler to cleanup the
> long comment, that's kept in the non-arch KASAN code.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Acked-by: Alexander Potapenko <glider@google.com>

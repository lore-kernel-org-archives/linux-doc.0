Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEDD254AE1
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762851700; cv=none; b=aPQpUkD/zKB9wjrbTi7qqtEwUadFH8t4AHJa1xmwRQ29VSo+lvcYYI7RzAC33UtIuB2GGyv/1MSSG8eqvoiFZEeuw2VasI7nrYnFbUBZn58mIx9Ri311oXXabM0lEx0GX1HWxpF/JYQnMyBDBhLeAjvVXZN/gDyXMp0XTvv/f/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762851700; c=relaxed/simple;
	bh=LQ/YVcrasx9+XZH+uzfM5+gmHZwPvR4UMJFJLgRCMmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTWLstIig1w4coD73xY41LigByRwRNRxrAB1t1/jL8/kguPdNnW1y7dncQlIUMghoIlAFBvAtLE2dL4Pkw4zOl5D6OiLziXYchNR5JMkgFMvqpdQqcJ4tUW7gYwMaR6E92DwSkHQg5u6h7rJYHlDVVAkvz+xSTgo127p2ZHMCiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bl1d6VmE; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bl1d6VmE"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-89ed2ee35bbso517136785a.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762851697; x=1763456497; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3GiAAjmzQ/VspCqloDpIt+ugCtvSToogOEL/VpV0Ws=;
        b=Bl1d6VmEn9R1tjzMZVvrqqf6DUSUrdoBGOZciAEvr6DaunbsmRO2Q4flGJvTlWK6zR
         nxhEbyb76+SEsLvEJsJwi5YkE/T+9p2hvpx4jxOqdt0USIIpPpfnTl4QnuIBjFMLSD8b
         pUNsPWFoRkX6fd9KP4hPGkOrOJeqQlXK3LmfAxCW4UlQgCYA+cHuBAhcg105DNmp+3yA
         PPQj4hK4GsPMJffmnYkpq37s2Q3mjv34n8P4lcEiVi6hhjGov7yrLoTC2B3FGuwmDU7o
         KudfRMc/26zAiG00BxD0MUFz1swyRPTGf7n7HlDce4f2I4Z9FDyRBMkW3zZJwOF1v4hn
         xyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762851697; x=1763456497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s3GiAAjmzQ/VspCqloDpIt+ugCtvSToogOEL/VpV0Ws=;
        b=Qpep+A9+h+Lvt8sNASEfkuFnoFc6rAv96gAl2POBeVuhMRx/7OxZqMXc+/GQp8tFsh
         tSZ4rZvHNKf6hY1qSfLclthXxiyOwH5UV2uDMFp1KnHXKThr1ljaYayM8UtgBzu+IXbw
         Rm9yXnOit0uDVBldrMfScV/aPHvEsIXCdFBXI+WT0OjVoqAblCWVCqBMmS8+fRomlKlr
         anko+9kXpId0Gyf6PQxbfqA9p/eVFcQkqAWY2wFzWrtd2vZuov0Jqf2Zs42GnCQQzjh3
         0Ox66sgUqfVhTY9OzJq+MmgvywZbOFGzfZd7tggV7shtq8qAGEUdWeh7RdmIRnOxI7uw
         lQ7g==
X-Forwarded-Encrypted: i=1; AJvYcCUleAScUo/cK5gNTHUsWvboYNuwRURRUcAxulBQfrYI1k8GSVXZxOSi9pxW+PebcC76jGHHTl9QnqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFw5eQqQqiWJZ6B681Gg2xQ8xbK3aWmu1tQKt8b+vll8Ed6p5C
	NhQdGYeKUMacFCcMT8KTFWVug4cw6MI6clptSQpfD+KRR92JELsn6ZFdZcQOfwWSYAhbAHItf/P
	EUJLBQg2cSq1ZH2ZEN7kv7DeQ59XFKFxMi72AMJ3C
X-Gm-Gg: ASbGncswwTP4LVeQ5xw7hawkW6URfqwg3uKYzl7T8QyfHDvMamgd2q3EFjui2hgDvXF
	EwyW9dyuEWvXdOyNlTpiWjs+S8jaAdL6R7Sd7d391F7IoYTYCfQHCaHaC7uZu23uhsvfShpDLHD
	UmOja0E7SGZzTqk6Ro8RjI3Db2ILRcJezG83cI4vgMhQCmADeqsWU+bMnTUjceQ9/mLcIIVunM9
	IrSZpWGyr8UblVvj0/Dv57IhVXoLSgpVr+PF+7PUxmJVqTVUdKOdPeQAyXzRO3DVzMCTlb6H0w6
	fAHPPl7EndbiQ5WmZyHEr5qYzGw7QLHS6UzM
X-Google-Smtp-Source: AGHT+IHmbNWz4nrBYzIA6dULAnEplmbnkhIWWkrftwGIkZuDmlgOtFs93CqEkgKXIfWxtOJB7Fa7kj8HnLkgxuZShy0=
X-Received: by 2002:ad4:5f07:0:b0:880:42a7:7730 with SMTP id
 6a1803df08f44-88238731aaamr156015206d6.53.1762851696507; Tue, 11 Nov 2025
 01:01:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <d98f04754c3f37f153493c13966c1e02852f551d.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <d98f04754c3f37f153493c13966c1e02852f551d.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:00:59 +0100
X-Gm-Features: AWmQ_bku8cq-CFmbh2Cbwbizm47o3PsCv7pQitKRdKmveqfrADnJlpnymR3GFhA
Message-ID: <CAG_fn=WPQZ4ti3Lb+A3jSXFWLtn6291sTKJBwKBiLD2E9YbuKA@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] x86/kasan: Make software tag-based kasan available
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

On Wed, Oct 29, 2025 at 9:11=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>

> -   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory
> +   ffffec0000000000 |  -20    TB | fffffbffffffffff |   16 TB | KASAN sh=
adow memory (generic mode)
> +   fffff40000000000 |   -8    TB | fffffbffffffffff |    8 TB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________


> +   ffdf000000000000 |   -8.25 PB | fffffbffffffffff |   ~8 PB | KASAN sh=
adow memory (generic mode)
> +   ffeffc0000000000 |   -6    PB | fffffbffffffffff |    4 PB | KASAN sh=
adow memory (software tag-based mode)
>    __________________|____________|__________________|_________|_________=
___________________________________________________

> +       default 0xeffffc0000000000 if KASAN_SW_TAGS
>         default 0xdffffc0000000000

Please elaborate in the patch description how these values were picked.

Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482332BF00A
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762852313; cv=none; b=f4MeSY1sThvwUsTCGUmLRtrg0qKQcqEVf7dkOMjo0lz9ibHE48P/VMEgq3PfiEIngnX1reg7U4qMnn8DtPsmsYCuStGmaw7Q7GP3PaQW2gDhGefq0RUBShKqlBgX62Ky+8rM1nWCXsnOwFiy3He24BWONqBnrlvW2RC9hArr/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762852313; c=relaxed/simple;
	bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q+hCet89jeCNZZf26LgnaeHKkoRnNgBSMbJG61h7Od/wqUIv87VsLfmMfEhdr6YEDLROFX4Cul76C4KbRTsth38xOh3d9QjdvrV6SEe+djJgTDrg4FucQgCvkUEHJcYFf8fSr45t/XgPQSP1HjpIl/gipma1r7ZVVHSf25v0ZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SKVSTcn1; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SKVSTcn1"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8823dfa84c5so31589416d6.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762852311; x=1763457111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
        b=SKVSTcn1nqhQszrNr1vdsVjq8dSl9VoDABDmD7if+9Te7wJ6J6rDS7S50aJ5F69y5E
         k4E9UZLYEurZWvTFPpJtJmpQVO3sKLOFk33oROWR9PjaRKPOsNd9aIYs2Y4bP40twuFV
         y1wrJMuvjyGBhkWCw3NnHtMMBsAFT6HV5rwS0nU4gPbq3bG2iZG/R2yPw1hk3j+U4wY4
         bsViKBtjl6JHn12zl48f6GCXe8krAM52fMG1bqA0czRerGWV5m+KbPcl9pnvA5BYIhhw
         DYQCwvEA9PdZfsUncWAr0Lmvzq5AS371Eb5x39GczPqGUwPamAPNdAGl6KWLGNK/6P4W
         kvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762852311; x=1763457111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wMAn9oTbF3Zv6YZXMFgD9SCNTI8yFt+ADFGBD5EQzqY=;
        b=hhdwIhpHakKYTovjYCKMfunvTqwTRduxvbAeOxtBbK1FG/sALkEV9zPE/CDF8Up1WC
         8NhrD8obJnc0yTGWloOGeMPa9vmfSzM71i0P44OKl1KjZmXa3e2A0Dt3hN3NMpvrzEsH
         WbLdVUxzDD7cltqsS9DEayiTeueF0dvF8996B2xP5uRLaXFTUEft6Wqbb7peGuaU6tbW
         grLh1idliyFOCpJJ3aG+zk81dKRFRs9tJvYndRrosnscA8TWP7cxqxIMQISf/COk5Rey
         XFKrc40INIUl9zIULG8QxiwBp36mjnggsQVWkVtbpTykbAqR807sb9s9qgaRQuEFl2WF
         ilYg==
X-Forwarded-Encrypted: i=1; AJvYcCWi+jkMZ1B1BSsnsRqVxTRMwXN8AOKGw9e9o7om7tsB3CJtaBOqaHGAT+ICf8dvBePRkgOV/Q2mW4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4ZBqn5WbMQFs4cGyp5oeH1HL4pFca1HlFSjY1PZhI8JGENs0
	5TkXHOGleuSlPY9QYHAjM/sFSjjmEpPXG5AqNEPfiGIciSaMhbK/aPw2jojH4rD6joxK3uvlvFb
	Tado+K1jEDDkKeYHGJ+QicvkO7Aw1N4wWV5vNrNff
X-Gm-Gg: ASbGncugniWCBgexZ0A+dY71notY90qFW7Ks2Z2RsEbm2L2pjPURCXaxQX68UsOhwyu
	fm014tUnvTQK9mM9IMByT0Pvb0A+T0j6utEwWrTyYS61zjBNaCWolCMBEcnQh/tjh998kWcZg1t
	A60LZzrxgPRhL8owgCkzSFkU1gdj+XC4qLST6lGbVvhzDpzkCcRYXoGgqKPIQsPM8NcL+w33xuw
	PWDBK4OdkknBWwAlkSVf7lxqtzGeEheh9jFZvsE/jXD4HgsffJuIK80s2Y0TBt3rlDMp+MQ7dbe
	oNQgoLpsmIl+mOZLjLTmOT2VeyX2ReWLLEuN
X-Google-Smtp-Source: AGHT+IH+IyV5M3UDNVO30prt5PPyyx1n6sQAkg8H+r/cXESUVZ9Sxny0Upk5iwgOz2Gyh93ucwAfPrYSF2wYVT/cQJo=
X-Received: by 2002:ac8:7f84:0:b0:4d3:1b4f:dda1 with SMTP id
 d75a77b69052e-4eda4ff2f1fmr126391511cf.61.1762852310737; Tue, 11 Nov 2025
 01:11:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <f533bb094a566242ec196afbde222796c6d6c084.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <f533bb094a566242ec196afbde222796c6d6c084.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:11:14 +0100
X-Gm-Features: AWmQ_bnrR-pK5Rc9D-XEScjrYr9MOeawukkWZRpWJ1yHRGagV2Ym8rHVDa4nqXc
Message-ID: <CAG_fn=X-FB6vVtDC8WhQzF7cNePS5AtmC4W1-YfTce+5jOc+wA@mail.gmail.com>
Subject: Re: [PATCH v6 11/18] x86/kasan: KASAN raw shadow memory PTE init
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

On Wed, Oct 29, 2025 at 9:07=E2=80=AFPM Maciej Wieczor-Retman
<m.wieczorretman@pm.me> wrote:
>
> From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>
> In KASAN's generic mode the default value in shadow memory is zero.
> During initialization of shadow memory pages they are allocated and
> zeroed.
>
> In KASAN's tag-based mode the default tag for the arm64 architecture is
> 0xFE which corresponds to any memory that should not be accessed. On x86
> (where tags are 4-bit wide instead of 8-bit wide) that tag is 0xE so
> during the initializations all the bytes in shadow memory pages should
> be filled with it.
>
> Use memblock_alloc_try_nid_raw() instead of memblock_alloc_try_nid() to
> avoid zeroing out the memory so it can be set with the KASAN invalid
> tag.
>
> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Reviewed-by: Alexander Potapenko <glider@google.com>

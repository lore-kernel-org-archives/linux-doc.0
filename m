Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C912ED151
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 09:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762853514; cv=none; b=uezhWL1KqpqDgKon4We3jFLMQsBya7xdlPiv2xfgK66kjNH7FGZxz5yy91AcGqNKWZBO8XOECJzCoHjCeMI72kIp8DaPFmjUqntwHB8n5NbzUM3JCPMqu4TM/+1XiLFklye5pBHRnSDSI6QCDGAaBOOBOg/omKqHmFr1ONULhdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762853514; c=relaxed/simple;
	bh=r+hEOA78AhLgodINgHVsRcE9W9flQIP3sthYAhVWiZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVBxFe09sTbta7Kj2fxxymbvdeUuapyXozuWq3zbDE2vCZOHgoF1rI7zX2MTMWcUsn/MN1dDGmWgOCqd2bTSELNOiSFeQvGuUf5MY9HmNh/kIiUDOuqEUkGXek/p/fPwt77cTTp/j8SzGSN04Lmb4mmqL+6rC9g5C3RCQwhP/HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UyxKrVF1; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UyxKrVF1"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8b144ec3aa8so429087885a.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 01:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762853510; x=1763458310; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mcuXePJv9UMRmDbNyzI2WPi4AQ0WM2JROyTQZuxeHnI=;
        b=UyxKrVF1AS/kVZBURRcGHjTs0a/5e+WDKrcGcnXCx6xsKsVn6AttveT8qo2nyT2nnT
         a0qjpZoSVv/XxnJLBgWKk7jiRVOwhBeMMo+TOQVj961CLFIZqTR3KfLQNf7IW5zNBq7d
         7Qfs3v46dkWkzPRbrIljuSmN73tDazUJJZpYDhPMd/nL5u5XBhLpLk53fi80L3fHPy3Z
         HFZ7NWb9E4vWYJcQ7NZC8ZruLEQ4VINj3a3FztJersXBrK26ZsULuTK7cCuBAd7f77qy
         FdxLSm9FH/gnmtiYWfkz/I8bmY6DLMCptaqhsDwGXde9WyXYcMWeF3znVRYG4pZpggjP
         azqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853510; x=1763458310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcuXePJv9UMRmDbNyzI2WPi4AQ0WM2JROyTQZuxeHnI=;
        b=i1utIULnGSgcjb+CIoDjKiW7c7e7k7uBxZgQtAyFRKxeBtP4MbE6ZMw3WUX9/j/ZGa
         KRXWAhLItF/WDav3El1XloppOAnGcIsvn/HLlAZpQRzFQjLXOVM/eGT5BhfkNLLmL/2d
         BN1b9bYqWrbd4/TvieKL/NttLenfHHGXfPeRGui3VeAYItcduiyqB37Mt6VzNHCoWvIb
         XLxGxGXZLB6MpHTHIByBTyVxYc602YXgrvXR2L0UxxXULnlKKxYkPFP2t7v8hDqUfLYv
         8dkgbBgMQ6JFKNKSR5UF/ViDJ8rCiOVwolGaQiK8nm1nxJ2F2pHNdhlbANPeZNTaI2Bg
         aM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEaoHw4rB9VpLd+qzPnEeb5fq+M1yD7qJBJSHCHGHfaYQNhW9P+hgt3/rChe0ZR/W2i6ZX8Qv3vKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHuWopfAdaujEq2VuaM8ajZfmatic8PCvnwfY6hNbMoDGoym0
	Z2ihlCPLuxpnA7mLfV5pzV3+Wub1o24Bu07Wmh+TsiiYy9ZCJ1cvWLAPmXky4y2Ed1mW/+Bq6RG
	3UPJqRIKnR5OG+2F0BAF/2q4XuKtPg+DZbH1h6AjP
X-Gm-Gg: ASbGnctePp/0SkZisDn3QzzPu0DP162wIympQxSIkhbykHMsrIZh29DPOHzsOtGmpV7
	aZ8cM46GnMVOMOQxcHIe8+C7dl7FnoyYtBcDB8GgilWQnrtrGpMU1mde+PWHqx+hzDvlPTSHHZV
	z+JXVF2LxztADXkyQeTvlL4VF+G8a0S+vyCWHB0bZc1V5jbiWZrXpY9jMlM+/c7gk5jyYEheanc
	8zKW3xnHmaQpuGwke1qZodWVrqYvNxKpUbJ0t3Ytagn4wJOc9Qpv/Lxm35FlDtrC0QY2yxVexUU
	h5vcQRHhLY1qsUoYA6ngmmgF+0lkSg5i0/Ie
X-Google-Smtp-Source: AGHT+IEzr91NsU9OUC24gjDEzFi/WJBgPa8H1cJUF2UmeUnuLOth+gagFxzFFCqIthcpMbxe1OUruDtNQIgW1/7rFEY=
X-Received: by 2002:a05:622a:2c1:b0:4ed:6d2c:dbf2 with SMTP id
 d75a77b69052e-4eda4edae35mr142374501cf.32.1762853509963; Tue, 11 Nov 2025
 01:31:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1761763681.git.m.wieczorretman@pm.me> <5be986faa12ed1176889c3ba25852c42674305f4.1761763681.git.m.wieczorretman@pm.me>
In-Reply-To: <5be986faa12ed1176889c3ba25852c42674305f4.1761763681.git.m.wieczorretman@pm.me>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 11 Nov 2025 10:31:13 +0100
X-Gm-Features: AWmQ_bnBejbyt9xhMGcc96j04H3RtNf27KB78uQcmIocgSxJqcCqkGPoQwhXWUQ
Message-ID: <CAG_fn=XFXFAvKS2+bc66FR+gw7rfSybETAOBUR_vneaVdF5F9A@mail.gmail.com>
Subject: Re: [PATCH v6 06/18] x86/kasan: Add arch specific kasan functions
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

> +#ifdef CONFIG_64BIT
> +static inline void *__tag_set(const void *__addr, u8 tag)
> +{
> +       u64 addr = (u64)__addr;
> +
> +       addr &= ~__tag_shifted(KASAN_TAG_MASK);

KASAN_TAG_MASK is only defined in Patch 07, does this patch compile?

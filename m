Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495CB1DDC15
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288454; cv=none; b=BZ2mjA7LL1nae1nuPCKeY2jYIShbuXKVzsv018oPaF0CKcweRLa34dJBufQlv0nIXRLJdHhwxJNpZfg2Ps6mR3G8y1OU8+hoq0bL+aBCdur0uw/U6U6/Bm9RtHDMi0QlP6fo6q6L9ITNfzaOFnC9PlfOPd++pDtenZ9E2lJfzzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288454; c=relaxed/simple;
	bh=auc9jjfBR0pJGmOxvxfAmYDcKoS37G5b9kYn+O7PffE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oZ+AQlxZimDt5fmbp5nSgrB4DuxUNEHI5MAd0z8Vp80DPCjzQBLnIqaH31k9zvXnvmg265RRDDWqAlFLNYVi+WMa/BaaoveeMqBOz3PZJX/9s3+WbFpbpSRBBlfj7oRwwyiCjiauVC//mPGlVOsljYnTwUCz6PxCUXTzWY89CPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=cMz/KWHd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="cMz/KWHd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso9115410a12.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 02:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742288447; x=1742893247; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wr4dUiqaKywBCUa33frJJ04baPImRwSaV0A/LlSiREE=;
        b=cMz/KWHd06iaaU/MRfvfXUXeeF66lHNq75wWkopvw92M60yU4TzpwP0h2hu+IXiM14
         k/6WS2kR2sa/X1n/fvtTMn+4Oci8jRpkAsQ5rAekYBGNmrzTh4x1AFWt8Y9K2xWkf0a1
         5FkX2rx+UngHAhWuo9D1Qpg4sqoDC9/rVYEG6CBAsDyCHnHNbi++DGqcoTmYkuXBqOqW
         XI1K8b2+XNGlOEdIy5yRQgLYRUTqkwInW4zbokrx0Dp7sAD9rGcaznSn14CdTrneZN4w
         H3V1qADY+pCwaZfQRbcBMT42LLXHsd1zB7MDX0V1qSg8YwkRq4ogGldiObTHYMXv/CFi
         j02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288447; x=1742893247;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr4dUiqaKywBCUa33frJJ04baPImRwSaV0A/LlSiREE=;
        b=n2CThKOC5zh5sETh6XHdAorlODchAc0hT7zKu1SQTbaAaecBYjd0QulSLfwWhIQ1es
         wg614ifYAxPE2tt235gJE/3F5VMUV0qexvxsNhMHqyVT3+9Mpe8VGtGwhUzih6hKeaDA
         SeAmpaRIGm3LChNRUk5FqdHLApUrw1il6Dhzo1VfY5Sbh0iTTBkojA1QrvKIz+v03mHW
         DOT6ab+i2qWmO+JvTNmKT2IDHvRUyLgh+wi+0wqjWKjMipEagObngsI1X4xbaBW9JDhO
         PaigjdYJbvmmbVOSTarxAzzet5hXD90QI5VNn7bVhxFx9e+lxV/w7VbUnax9SVBhA32p
         1x7A==
X-Forwarded-Encrypted: i=1; AJvYcCXJedB7tqEnvCjKM/bUlYj50N15NXTawSZNsVCp0EsjN6Nn/eeuH2vGCokcQIYUYBqSW6s9Sf3uHd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQea1Th4J9QmGx9DPhVOSpqQ3GX23EAlY4MgANFXA0C4vahIns
	jLC8vngI9VNrXZL6VHJeHN5anzwo4i/aVYnOGweb6rNt1vpC8G3nE60/xyloUyc=
X-Gm-Gg: ASbGnct1j49dEm/MAYnEzJ8EILcQkbT22XdB1UyjSQGB/gCHsvC4bf25HafOtCXLDN0
	L+MWk4iP4GzJpTGzLVN7rJ7eImpKm5i08uWooq2264EU+lpnnlTBbktOapfrWUe9eIteckiPCqe
	jO3yTHwz1Kao1xpMn3Gac6QQ9ou9qn+ObkCLAlGjOxDEz9aMdIU/5U2mbvonqMvQjOSIbBt0YEo
	qGyxBbUpx+GXYqZEuG1pykud0iRrf5PfWYxYem5Z9qIeZ3dkEUIu7tIy6jAg1CY64o/zzqqwCTf
	R+u3CCagFZTKfYHSPUgYCAsKp7x6OgeHzmDPFolmEs0=
X-Google-Smtp-Source: AGHT+IGBsklbulm+vYAotQHhh8oVdp47PW9k6WK8XOOUPLWd/0Ehy9b34njTBzMzUsYjAPB/A6Vdow==
X-Received: by 2002:a05:6402:51ca:b0:5dc:c943:7b6 with SMTP id 4fb4d7f45d1cf-5eb1dec1a1bmr2420615a12.3.1742288447279;
        Tue, 18 Mar 2025 02:00:47 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816977a5fsm7228660a12.32.2025.03.18.02.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 02:00:46 -0700 (PDT)
Date: Tue, 18 Mar 2025 10:00:46 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-61be6a5455ea164b45d6dc64@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250318-1b03e58fe508b077e5d38233@orel>

On Tue, Mar 18, 2025 at 09:48:21AM +0100, Andrew Jones wrote:
> On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> > Hi Drew,
> > 
> > On 04/03/2025 13:00, Andrew Jones wrote:
> > > Allow skipping scalar and vector unaligned access speed tests. This
> > > is useful for testing alternative code paths and to skip the tests in
> > > environments where they run too slowly. All CPUs must have the same
> > > unaligned access speed.
> > 
> > I'm not a big fan of the command line parameter, this is not where we should
> > push uarch decisions because there could be many other in the future, the
> > best solution to me should be in DT/ACPI and since the DT folks, according
> > to Palmer, shut down this solution, it remains using an extension.
> > 
> > I have been reading a bit about unaligned accesses. Zicclsm was described as
> > "Even though mandated, misaligned loads and stores might execute extremely
> > slowly. Standard software distributions should assume their existence only
> > for correctness, not for performance." in rva20/22 but *not* in rva23. So
> > what about using this "hole" and consider that a platform that *advertises*
> > Zicclsm means its unaligned accesses are fast? After internal discussion, It
> > actually does not make sense to advertise Zicclsm if the platform accesses
> > are slow right?
> 
> This topic pops up every so often, including in yesterday's server
> platform TG call. In that call, and, afaict, every other time it has
> popped up, the result is to reiterate that ISA extensions never say
> anything about performance. So, Zicclsm will never mean fast and we
> won't likely be able to add any extension that does.
> 
> > 
> > arm64 for example considers that armv8 has fast unaligned accesses and can
> > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though some
> > uarchs are slow. Distros will very likely use rva23 as baseline so they will
> > enable Zicclsm which would allow us to take advantage of this too, without
> > this, we lose a lot of perf improvement in the kernel, see
> > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org/.
> > 
> > Or we could have a new named feature for this, even though it's weird to
> > have a named feature which would basically  mean "Zicclsm is fast". We don't
> > have, for example, a named feature to say "Zicboz is fast" but given the
> > vague wording in the profile spec, maybe we can ask for one in that case?
> > 
> > Sorry for the late review and for triggering this debate...
> 
> No problem, let's try to pick the best option. I'll try listing all the
> options and there pros/cons.
> 
> 1. Leave as is, which is to always probe
>    pro: Nothing to do
>    con: Not ideal in all environments
> 
> 2. New DT/ACPI description
>    pro: Describing whether or not misaligned accesses are implemented in
>         HW (which presumably means fast) is something that should be done
> 	in HW descriptions
>    con: We'll need to live with probing until we can get the descriptions
>         defined, which may be never if there's too much opposition
> 
> 3. Command line
>    pro: Easy and serves its purpose, which is to skip probing in the
>         environments where probing is not desired
>    con: Yet another command line option (which we may want to deprecate
>         someday)
> 
> 4. New ISA extension
>    pro: Easy to add to HW descriptions
>    con: Not likely to get it through ratification
> 
> 5. New SBI FWFT feature
>    pro: Probably easier to get through ratification than an ISA extension
>    con: Instead of probing, kernel would have to ask SBI -- would that
>         even be faster? Will all the environments that want to skip
> 	probing even have a complete SBI?
> 
> 6. ??

I forgot one, which was v1 of this series and already rejected,

 6. Use ID registers
    pro: None of the above cons, including the main con with the command
         line, which is that there could be many other decisions in the
	 future, implying we could need many more command line options.
    con: A slippery slope. We don't want to open the door to
         features-by-idregs. (However, we can at least always close the
	 door again if better mechanisms become available. Command
	 lines would need to be deprecated, but feature-by-idreg code
	 can just be deleted.)

Thanks,
drew

> 
> I'm voting for (3), which is why I posted this patchset, but I'm happy
> to hear other votes or other proposals and discuss.
> 
> Thanks,
> drew

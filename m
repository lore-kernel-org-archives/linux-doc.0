Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E3120E00C
	for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 15:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742310604; cv=none; b=uRm+LQhqIPjiRor9gnU8ULCLKTfo7Nnm0PTe1ZEdAJUBtv9ip7n8yaCgg53FdugJMBycKwHMFEn3gy037T9c/cuEYK25sokLTzar2jKzrWFas2RaNr+7RR7xoyOMyM9fPJYFDhkk5xPqvDYQw8TTHD8uztcwbYW8RPiq2fNkXyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742310604; c=relaxed/simple;
	bh=9g8qG8scRkPPYmIXfvAFFthP/Lv8qrSHb6e/cFtOGTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QORM3N1z09WkgWdWEggSrVj+XOcplAeor1ofA+eSlKnGQDlGTWNXwc6qgbuU5h0TOHv5TkJ+Sw4t8Xw2ww6fxdBa0dTMV20mFdKSKwa3BRYB/6NfEyk7vdFGTZYofI+UlNCTCs6wilsVe2LDR9VW+nVCpQwics7iih4VcLfCoNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Q1wkqIXw; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Q1wkqIXw"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43948021a45so34788255e9.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Mar 2025 08:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742310597; x=1742915397; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pi9+EclVOPrZYJ8BNIPSTKMUS248Uk1Nqe/ZKkcV2oE=;
        b=Q1wkqIXw01YLjD30Swh3Hfy8N5F8JZSC8+hvubtihKmqyHw6OOrZAMHXN0Fan6JqNR
         yTwMQG0eiYXLs83odBtUy9AHRRG6quBg/UQcIQFdCJnB76WodRAV9CWW7W/G1u2MNnWi
         yVPSWnEII8rlUgcwhvWQKbFP7SToEyPTxa3VzwrmMuqGRy+ECSRlotkd7OIeXxmUi6aL
         lgjGCkQug+MUj55qsF6KNXULkro4OsXuBDt2ASjq4gFXAU8pVtHk1uR/TQZNzPgWhHcZ
         2chvf9UBmWSE5AQYv5rcNmGtCyPD8ajGo88wVgVRmf3uRMHAzdY5c28aG3PqlLmEDWGw
         jenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742310597; x=1742915397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi9+EclVOPrZYJ8BNIPSTKMUS248Uk1Nqe/ZKkcV2oE=;
        b=M+cM9ipHdef/qGS7TaXbD43f7d/Nw5kRK9suz0gRusrGEWBURTQXERiVrXhljKVshu
         g/96GrxMAG2i+i0vX14qcmJ/FQ4m7OS8sTgOntgnQ/dx44jeW9W03HLzUfR4zxAKE6DK
         wqAFlLE3AJjFIQAJoe2Hg3sSjuVfgn7QP9Eri54e87Tiepv4kJa2ToulbHQuMjYSonRV
         apeyH2srLIzzUXOt/qaObTf2h0Zwewbz1wWCsdpqisfKUfkYm5Cjga0z5QrCSORLZhpb
         2mROqc4av5y2KlwagX+qeQcfBAFRDx3NNRSUxqlDzNZ1ErlJ6xinaw9L/R1SD0FI7VxL
         jcRw==
X-Forwarded-Encrypted: i=1; AJvYcCUbh3AImYDvoIYCxPZt7roQqnFWJUEVabkYjNnTjT5PPcNkqsLhGpv1M51XmdwRJBjHRk5gWQkaPAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlbJSNQ78ZmdZoqtXOue0cqk7IFDjADV6DEs2i5OK+Htqp4WoL
	v4YTEjOjG96ucwdnJwUQXAMWs1PRoPEQYEow3m+LF3K+HjZ4xSGHrxl4kqV7p51J5mtj7F5oh7o
	f
X-Gm-Gg: ASbGncv0NMNEQaFBYqjT9Ix2SiJBI7IvAGQgXEG7Z4MC+53+DIgR7G70Pzr5KASUd+D
	5dQgVavTzJOug3ya7nD47q9bnyklKGv3Ra8dRuOQ+CnQ9aijbKvi3iOMxOH/tw8Rqj8ooxCnyBa
	4/KjuEXJ9U8IPF1VkudsySvavY18PpUXZ2/HVn6V8lWKcqbYSUXsPJ4Y0Llp2ZzHBRjGNtOBW11
	pWjm3HJKRMmOWHw+qmI1iletNgcXVgAlWpmJCHdUIg8yUSWLYaGwBrPflSGSz70v85iabierEKI
	eMKEQDfGBWRIxd9Km2E7r7UwdS/oJ26bgE4f+fOj9H0=
X-Google-Smtp-Source: AGHT+IGR/8SFcCBDGiWMbZof8cTzlXY2ErSUJPc9XQCrBR5S4X8kUHjHc4wgiiNvzdvuRJwdCPzyPA==
X-Received: by 2002:a05:6000:1f8b:b0:391:1458:2233 with SMTP id ffacd0b85a97d-3971d235022mr18693931f8f.11.1742310589615;
        Tue, 18 Mar 2025 08:09:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c888117csm18119516f8f.44.2025.03.18.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:09:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:09:48 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	charlie@rivosinc.com, cleger@rivosinc.com, Anup Patel <apatel@ventanamicro.com>, 
	corbet@lwn.net
Subject: Re: [PATCH v3 7/8] riscv: Add parameter for skipping access speed
 tests
Message-ID: <20250318-bf7e13879b2073c610d32bae@orel>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
 <20250304120014.143628-17-ajones@ventanamicro.com>
 <1b7e3d0f-0526-4afb-9f7a-2695e4166a9b@ghiti.fr>
 <20250318-1b03e58fe508b077e5d38233@orel>
 <c5e174e4-4fce-4c7f-821a-cf3781becab4@ghiti.fr>
 <20250318-18b96818299ef211ef8ca620@orel>
 <d7a04d06-766b-4b43-8c42-2b681629c35d@ghiti.fr>
 <20250318-ec2a990d55378039a863b94b@orel>
 <44304bca-b30a-4c0b-b242-3a54ac021e40@ghiti.fr>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44304bca-b30a-4c0b-b242-3a54ac021e40@ghiti.fr>

On Tue, Mar 18, 2025 at 03:09:18PM +0100, Alexandre Ghiti wrote:
> On 18/03/2025 14:04, Andrew Jones wrote:
> > On Tue, Mar 18, 2025 at 01:58:10PM +0100, Alexandre Ghiti wrote:
> > > On 18/03/2025 13:45, Andrew Jones wrote:
> > > > On Tue, Mar 18, 2025 at 01:13:18PM +0100, Alexandre Ghiti wrote:
> > > > > On 18/03/2025 09:48, Andrew Jones wrote:
> > > > > > On Mon, Mar 17, 2025 at 03:39:01PM +0100, Alexandre Ghiti wrote:
> > > > > > > Hi Drew,
> > > > > > > 
> > > > > > > On 04/03/2025 13:00, Andrew Jones wrote:
> > > > > > > > Allow skipping scalar and vector unaligned access speed tests. This
> > > > > > > > is useful for testing alternative code paths and to skip the tests in
> > > > > > > > environments where they run too slowly. All CPUs must have the same
> > > > > > > > unaligned access speed.
> > > > > > > I'm not a big fan of the command line parameter, this is not where we should
> > > > > > > push uarch decisions because there could be many other in the future, the
> > > > > > > best solution to me should be in DT/ACPI and since the DT folks, according
> > > > > > > to Palmer, shut down this solution, it remains using an extension.
> > > > > > > 
> > > > > > > I have been reading a bit about unaligned accesses. Zicclsm was described as
> > > > > > > "Even though mandated, misaligned loads and stores might execute extremely
> > > > > > > slowly. Standard software distributions should assume their existence only
> > > > > > > for correctness, not for performance." in rva20/22 but *not* in rva23. So
> > > > > > > what about using this "hole" and consider that a platform that *advertises*
> > > > > > > Zicclsm means its unaligned accesses are fast? After internal discussion, It
> > > > > > > actually does not make sense to advertise Zicclsm if the platform accesses
> > > > > > > are slow right?
> > > > > > This topic pops up every so often, including in yesterday's server
> > > > > > platform TG call. In that call, and, afaict, every other time it has
> > > > > > popped up, the result is to reiterate that ISA extensions never say
> > > > > > anything about performance. So, Zicclsm will never mean fast and we
> > > > > > won't likely be able to add any extension that does.
> > > > > Ok, I should not say "fast". Usually, when an extension is advertised by a
> > > > > platform, we don't question its speed (zicboz, zicbom...etc), we simply use
> > > > > it and it's up to the vendor to benchmark its implementation and act
> > > > > accordingly (i.e. do not set it in the isa string).
> > > > > 
> > > > > 
> > > > > > > arm64 for example considers that armv8 has fast unaligned accesses and can
> > > > > > > then enable HAVE_EFFICIENT_ALIGNED_ACCESS in the kernel, even though some
> > > > > > > uarchs are slow. Distros will very likely use rva23 as baseline so they will
> > > > > > > enable Zicclsm which would allow us to take advantage of this too, without
> > > > > > > this, we lose a lot of perf improvement in the kernel, see
> > > > > > > https://lore.kernel.org/lkml/20231225044207.3821-1-jszhang@kernel.org/.
> > > > > > > 
> > > > > > > Or we could have a new named feature for this, even though it's weird to
> > > > > > > have a named feature which would basically  mean "Zicclsm is fast". We don't
> > > > > > > have, for example, a named feature to say "Zicboz is fast" but given the
> > > > > > > vague wording in the profile spec, maybe we can ask for one in that case?
> > > > > > > 
> > > > > > > Sorry for the late review and for triggering this debate...
> > > > > > No problem, let's try to pick the best option. I'll try listing all the
> > > > > > options and there pros/cons.
> > > > > > 
> > > > > > 1. Leave as is, which is to always probe
> > > > > >       pro: Nothing to do
> > > > > >       con: Not ideal in all environments
> > > > > > 
> > > > > > 2. New DT/ACPI description
> > > > > >       pro: Describing whether or not misaligned accesses are implemented in
> > > > > >            HW (which presumably means fast) is something that should be done
> > > > > > 	in HW descriptions
> > > > > >       con: We'll need to live with probing until we can get the descriptions
> > > > > >            defined, which may be never if there's too much opposition
> > > > > > 
> > > > > > 3. Command line
> > > > > >       pro: Easy and serves its purpose, which is to skip probing in the
> > > > > >            environments where probing is not desired
> > > > > >       con: Yet another command line option (which we may want to deprecate
> > > > > >            someday)
> > > > > > 
> > > > > > 4. New ISA extension
> > > > > >       pro: Easy to add to HW descriptions
> > > > > >       con: Not likely to get it through ratification
> > > > > > 
> > > > > > 5. New SBI FWFT feature
> > > > > >       pro: Probably easier to get through ratification than an ISA extension
> > > > > >       con: Instead of probing, kernel would have to ask SBI -- would that
> > > > > >            even be faster? Will all the environments that want to skip
> > > > > > 	probing even have a complete SBI?
> > > > > > 
> > > > > > 6. ??
> > > > > So what about:
> > > > > 
> > > > > 7. New enum value describing the performance as "FORCED" or "HW" (or
> > > > > anything better)
> > > > >       pro: We only use the existing Zicclsm
> > > > >       con: It's not clear that the accesses are fast but it basically says to
> > > > > SW "don't think too much, I'm telling you that you can use it", up to us to
> > > > > describe this correctly for users to understand.
> > > > But Zicclsm doesn't mean misaligned accesses are in HW, it just means
> > > > they're not going to explode.
> > > 
> > > They never explode since if they are not supported by the HW, we rely on
> > > S-mode emulation already.
> > Exactly. Zicclsm is just a new name for that behavior. Profiles try to
> > name every behavior, even the ones we take for granted. Unfortunately,
> > like in the case of Zicclsm, we don't necessarily gain anything from
> > the new name. In this case, we don't gain a way to avoid probing.
> 
> 
> I understand your point but given the misaligned traps exist, I can't find
> another meaning to Zicclsm than "I'm telling you to use it". Zicclsm can't
> be used to describe an OS behaviour (ie the emulation of misaligned
> accesses).
> 
> I'm also insisting because we need a compile-time hint which allows us to
> enable HAVE_EFFICIENT_UNALIGNED_ACCESS in the kernel and Zicclsm is great
> since it is required in RVA23. if that's not Zicclsm, that must be another
> named feature/extension.
> 
> What do you suggest to make progress here?
>

I guess you mean besides listing five options and posting patches for two
of them :-)  We can't force semantics onto Zicclsm and I doubt we'll get
agreement to make another extension with the semantics we want. So (4)
is out. I agree with Clement that (5) isn't good. That leaves (2). I
guess we should start by trying to understand what issues there were/are
with it.

Thanks,
drew

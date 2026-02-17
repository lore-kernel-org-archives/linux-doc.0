Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D849352F9E
	for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 12:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771331516; cv=none; b=TByhLFTGplL55qd3m0Ua9if/EohyvV3M4wU0EhHTx1Y1MMHKGtSzfYoZG7IIzkREJeJ5oK7c3t3CgJ97uEgrHJ7VEasGpDb2+A1u3ytzXebhRTmN8W6IJRsa1oRq8Ua0qs5RqveYISsAEQpvzB8dVWuo3WHL2XEK+OZqh++r9q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771331516; c=relaxed/simple;
	bh=N4KITk41eWpTiRkSrTiDRNUPwuswMLRUYYcncwNq0/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFkSQZ0eTnqwQXRrPD5S1B2qA3odSqLuibw35bAZmAzNYkE0v//haW1mbMEo5YAvxEgrKxcQJxHvitUV5vYnMFB2qwzim5xoBPiD5iH4qcko9Rlg3jhcU9nToOu+upVu0SwxMTT9GC8yXYuaX5GKDh08WPhy8lhC5CzDqZLsxx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fmYyAPqi; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fmYyAPqi"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b8849dc12f6so526892166b.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Feb 2026 04:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771331514; x=1771936314; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSA69J8HH5ShQtT6NEI1mo38t8hiGEa6yEjtV86V/Kc=;
        b=fmYyAPqiZesnDaYUnlTvDBz5tdtpNydTRIYi/dAt1p844y93edJroEMtMDQ2uYEPZQ
         SXUfs9nCabiIGP/Cy/4AkoXjNJUcpixzBG01CXOkF3gyK/QLdLNR8vnyeUW2C5JxUJDv
         OPlvoq2uCDbVVXN3Jo5E9OgqUAdjdJHd/DkM8w7Xu2u2pjsrLmP5u+bOJxHjep5tk8AH
         IVZG+tg/3hsqpy71R9Kh7WLfak5HHpC2UFwTEfVnVMh5yvoX7qEPufC12vikg8NUoTFG
         VwY7CbsY8/s65pmaCd8kgqlKPxali/xHbD02vu6lOtYFTvV1Ph4ZOKK5MGN4WqjAvU2c
         BZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771331514; x=1771936314;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSA69J8HH5ShQtT6NEI1mo38t8hiGEa6yEjtV86V/Kc=;
        b=mQ7xsfqmhJW+zyoFmhO6BA0611Cil/deM8sXIi9wvtYQErKO/B+btH9vMSjbVvERfE
         O7gXSbysbICf3VTzdGx3i29YmuwP9ucDAlRogus2udEkF/2CaqEGNgCdGVYXTvy/XGHc
         aUHf67E3uFDkM2vajtUAQMM4y6+NpjQRrVMf1VJvu4FoKUhUafFLqA6dFZkoOq/BQK0S
         fxofD2RS70mlllAAjIt0zV8q/T8hmhit3gQZcwCcviSaEg5Hmci+N4XMUKgndZI5Sdp8
         vBPrYZeSnGCp/6PzMzvlDhwnlT5mEtap8QgABNwT6/+mV7UoPdlxy/J5Fp+i0tSR58sC
         vHCg==
X-Forwarded-Encrypted: i=1; AJvYcCXwm7vnTMNu6yXDrWsb04W2l4Ac8MnCr4RJdIzb0q4ztD6t7acJqBsvxc47HETgYNyohmU5zq/9UQA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5wSKrcKWW/cjxf0me/x9lKnVORstVmn5rJmBdni+AekUpbmk
	81ErYnK7PKaasjtbOVjFgeEsdTqXBTuBjSTUj4GmuY182pIomvPpYpNkBfLpfLUDBw==
X-Gm-Gg: AZuq6aI3+LZT+eqwt9nU61sxOoO4opoERO40DfpRCIykWn7u4tgchIQdkUEFTxfj4PB
	aeD/fOcixLNmg+PsL6mW3IWj5T6rgv9d5hxF1altBFhvKLkXESSALZ36ebu2tBbmFZF8zfJh27L
	H2olzcKf4rmHiYfyddscqCMGom2tGs5dKWdZT5Ld2v9yBe+WrZ60F7NL5a1L6/cNfSuRNs0oOR/
	03gEBclezzwgYJPZNcibH4v49MaXHps5xQCtbdDP5hkbyl74NeY++YjUREeMr2gEXE7alKnhHxw
	ceVGOAj4arBW48zQPbER5fLy0xlvloI/e8KluVKoe/tgiziq5uadGb9oVg1Ju+3/rBr9Bmz/vyo
	T03vaQYZfsVZSH947XTPUQFT6uIRB3CTXYfGSMolZJ3oa9rebq7WiTRWkvjUzrlkhwE1mWwMdvM
	DQDniKBB8MYnhVKaeVlAef4gpl/40TNlsJxmuvMh8nhgQ9/E6ie1TkhDauY+SAGLwseF/tmWM=
X-Received: by 2002:a17:907:3ea1:b0:b77:1b05:a081 with SMTP id a640c23a62f3a-b8fb4392456mr767722666b.27.1771331513280;
        Tue, 17 Feb 2026 04:31:53 -0800 (PST)
Received: from google.com (105.165.204.35.bc.googleusercontent.com. [35.204.165.105])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc73f7c24sm352630166b.30.2026.02.17.04.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:31:52 -0800 (PST)
Date: Tue, 17 Feb 2026 13:31:49 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, suzuki.poulose@arm.com, 
	maz@kernel.org, corbet@lwn.net, yee.lee@mediatek.com, ascull@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <2evhrm4tg52nxru7xeegs5ut7alnnczv5w2xsgkvhgbdlxdrht@shdj2wb4wcql>
References: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
 <aZRIHZ2Wq81S-FZY@arm.com>
 <p7wloz3ospiwaytzzns43hbyfrxfjoca6ljols3dq4hpha5y2v@weadvhpdng7a>
 <aZRY9UTSgw0Zf2Y-@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aZRY9UTSgw0Zf2Y-@willie-the-truck>

On Tue, Feb 17, 2026 at 12:03:01PM +0000, Will Deacon wrote:
> On Tue, Feb 17, 2026 at 12:20:02PM +0100, Pierre-Clément Tosi wrote:
> > Hi Catalin,
> > 
> > On Tue, Feb 17, 2026 at 10:51:24AM +0000, Catalin Marinas wrote:
> > > On Fri, Feb 13, 2026 at 12:51:07PM +0100, Pierre-Clément Tosi wrote:
> > > > Although it is currently possible to fully disable MTE on MTE-capable
> > > > CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
> > > > userspace (with kasan=off), there is no way to limit the use of MTE to
> > > > the kernel because CPU capabilities are traditionally exposed directly
> > > > to userspace.
> > > > 
> > > > To address this, introduce a new cmdline argument (inspired by the
> > > > existing arm64.nomte) to only expose the MTE capability of the CPU to
> > > > the kernel. Combined with KASAN, this results in only the kernel using
> > > > the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
> > > > field are hidden from userspace.
> > > [...]
> > > > +	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
> > > > +			support for userspace
> > > 
> > > Why would we need this? It's a user-space choice whether it uses MTE or
> > > not. It's not like the kernel is forcing it onto the user processes.
> > 
> > Correct. This patch is useful when working with a pre-compiled distribution to
> > ensure that a MTE-enabled userspace falls back to untagged allocations, without
> > the need to introduce system-wide policies (and ABIs) for said distribution,
> > which would also be inherently less robust than this kernel-level gating.
> > 
> > In Android, we can simply append the flag to the kernel cmdline instead of
> > relying on sysprops (or similar early userspace concepts) and hoping that all
> > users are properly gated on that sysprop, etc. This can be used for A/B testing
> > of the feature or as a highly-reliable "remote kill switch", for example.
> 
> Why isn't arm64.nomte sufficient for that? It seems weird to insist on
> tag-based KASAN support for the purposes of userspace A/B testing...

For a given architecture (and product goals), profiling of MTE might lead to the
performance overhead being acceptable in the kernel - where security concerns
are more prominent - but not in userspace, resulting in tag-based KASAN being
required while a robust switch is needed to disable MTE in userspace but
arm64.nomte is too coarse for that.

-- 
Pierre

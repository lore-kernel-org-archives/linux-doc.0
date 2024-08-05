Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED915F30D
	for <linux-doc@vger.kernel.org>; Mon,  5 Aug 2024 18:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722883698; cv=none; b=jLTx1Lg0USjucLiSks6o4u1nzm90pD/1fWi3Eny1RKoM3ZOFl+Bmkipo4cIz/yikpkTpTKQ2NX57jr0MuCVxlilBRbjveDvp389jrUiCrX48ndsZqUsbC4Rpq9diGdjs711kIKrII2G4Lg8somMfSf1E2c6okBOfC+JU73Cn850=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722883698; c=relaxed/simple;
	bh=3NXXA8hukhtstN66FzQ0NmXrdGI3V97ghb3YIaG1hkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWzoMNJi87V9xDEoyU9NeD416Ko9TD8WWzy422Q0euSKIW8JhF03KPlMH5QRm2zG0o+e0RTTE3/5KXvUuePdW1mFmQ5wQIHpkkczwgCzm6TO+ZFAjKT6n5Ua541AAlBZQX3X2rfarl3C/OoS9eyqBQE+/KpkY1lZpEf/goX/a70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=uEF79wg6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uEF79wg6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc5296e214so91438135ad.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Aug 2024 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722883696; x=1723488496; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CWiE5Gt/81O/McaIBD85wwCe3mZnLm7BjL3ftw4B+HM=;
        b=uEF79wg6Me2dZ6JQGWv/CHhng8lCxQGIBMXRwXEKd+di0EACxmls7am/ct/WojDWUP
         F0pTowCDI3WjgBzySqqstAX0TgQuvkcBaJU8zdBuZ+PZSqgoAsHRmUBV9PSRVLmyp9Kw
         C9y+BHPXzWYCb3j+L5N2HIgVoI05QjHELiJut2GMhDUnazn7smv2v4PkBUeyWmMq5WbZ
         3e9hWxeY8kwFYvYNAQGT3bLgz0KZVyI4AMF7YiFOoQYj1denpD0mstT6/ZWGtIqFu9Sv
         4EwVdSbit0DEzPr4zKAv6s8kD+8DPp9P0YwY08Sf1Zi9Lo4LD7bUfuXtiXZ6q6fxC3v7
         y71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722883696; x=1723488496;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWiE5Gt/81O/McaIBD85wwCe3mZnLm7BjL3ftw4B+HM=;
        b=EHgbvn+5BCLddGyw/VyQQIuUze5uEthVXOxJNzKXYqycMABh6aG9vurLwMZvqR39Ju
         rlclP5eeWeG6rRll5tgVBU+SAydh+VCFmxLUhqiyKb9ASx41mt57FlRDr7X28X+TuCV1
         N/za0e2U0eKcI+x5d3CFsiQ2rmGgvodGceXUU6EsJ0DRjiCgRttzbiw63kWH25pppo4x
         Ygd9AkIsqHdmPuo08tGGnJXw3y+g8B1n5D8UcM+hzrazjaPsa+InGmwn3x4F0RKdyEPW
         Vaa/w7tml5Z+DIZSbLAy4iAiuWf2WKTUTk2xCFl/HVcUktghfJZUsjp3CW/A1WbP0OgB
         RFdA==
X-Forwarded-Encrypted: i=1; AJvYcCXAFOL5Cl3XP4S4pCNXBakkQMiXqE9AX7EpKEdeU9XUuxCklvDwsM1SuDQhPT/W8vDFrbz+pRiNSolnMBtz/8m7pltvKhDKD8ww
X-Gm-Message-State: AOJu0YzOZeofXFo0QvE39JiM4uBuKGGtSvd2HKdmzGjEYUG3LAOLzJxh
	qitGdXgqkI3JNrc322uZ14f8anKFtP62HfseSIHRjOrsIh9LRNww7MdIGYp6hbE=
X-Google-Smtp-Source: AGHT+IFlG8VhZGgwoNGP9WjMsD0WO4HK22QdL7Ggcd2eSX0CNB+lJyh9+cv8ryXXl69OuOhZ/LNPNg==
X-Received: by 2002:a17:902:c949:b0:1fd:6bfa:f59 with SMTP id d9443c01a7336-1ff572743b3mr140884975ad.19.1722883695945;
        Mon, 05 Aug 2024 11:48:15 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592b3643sm71467005ad.290.2024.08.05.11.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 11:48:15 -0700 (PDT)
Date: Mon, 5 Aug 2024 11:48:12 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/1] RISC-V: Add parameter to unaligned access speed
Message-ID: <ZrEebH2wdjRgfYCB@ghost>
References: <20240805173816.3722002-1-jesse@rivosinc.com>
 <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALs-HstYwwgPAOP22V1A6iTX85eRqRp4b4039pewsDHus_dLgQ@mail.gmail.com>

On Mon, Aug 05, 2024 at 11:38:23AM -0700, Evan Green wrote:
> On Mon, Aug 5, 2024 at 10:38 AM Jesse Taube <jesse@rivosinc.com> wrote:
> >
> > Add a kernel parameter to the unaligned access speed. This allows
> > skiping of the speed tests for unaligned accesses, which often is very
> > slow.
> >
> > Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> 
> How come this is a command line parameter rather than a Kconfig
> option? I could be wrong, so I'll lay out my rationale and people can
> pick it apart if I've got a bad assumption.
> 
> I think of commandline parameters as (mostly) something end users
> twiddle with, versus kconfig options as something system builders set
> up. I'd largely expect end users not to notice two ticks at boot time.
> I'd expect its system builders and fleet managers, who know their
> hardware and build their kernels optimized for it, are the ones who
> would want to shave off this time and go straight to the known answer.
> Anecdotally, at ChromeOS we had a strong preference for Kconfig
> options, as they were easier to compose and maintain than a loose pile
> of commandline arguments.
> 
> The commit text doesn't go into the rationale, intended audience, or
> expected usage, so maybe my guesses miss the mark on what you're
> thinking.
> -Evan

There was a brief discussion about this on Jesse's series about vector
unaligned support [1]. The original idea was to use Zicclsm to allow
people to set the unaligned access speed on pre-compiled distro kernels.
However Zicclsm isn't useful so the alternative route was to use a
kernel arg. There is already support for a Kconfig, the kernel arg is
just another option for users.

Link:
https://lore.kernel.org/lkml/af3152b6-adf7-40fa-b2a1-87e66eec45b0@rivosinc.com/
[1]

- Charlie


Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB73259497;
	Sun, 29 Dec 2024 05:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735451929; cv=none; b=QERQEKOd1fvUV02X8+zPCPFK41E7AGnJ9zaw7wTQSCQ2uhks9Xn3gjEjuJN177H532MG0zXATN03SIDj5C1Lsl85LnjdhtLIOIVKTnlGGfcZtvjQKOhq7bGNpGHbqgDtzFZIX9aNFPItwMNSN7xjs5D+6pUSQ148bXs93Y04YIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735451929; c=relaxed/simple;
	bh=ADQiDv89xAW2ZGevAegOSNUFw8Erb3kCWI4O2dv/s60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhd5+270gJwxxDGYdHoJeC497qjPeF7nEbNqriBrnq4WqGXNyg/3rpKS/3g9qdibqXDZLkc4ypy6CafiuslYfRnALcSesWyFbOBkENtz7sE9EyfMGYF/tKowMalMHFh7AbsT/hNlwsPgGzdLyEluqmap8whX5JO5hGNoMjL+t18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEchKH7U; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEchKH7U"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-aaeecbb7309so678498766b.0;
        Sat, 28 Dec 2024 21:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735451926; x=1736056726; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOaO3GIHJbTPnVowygmPizFspt+znwbY2af+UA4iMaA=;
        b=NEchKH7UQXwp+KCsV38dljtjpG4136GASM0jEJVlarusw+G9Cqay3PXBoskU9RvaM/
         Uck5y6Ib3umQPEbfzLjmaoEwegGU5EydLzTAGIWEmpSRRGEG4XS4lEg264HG5aUY9QlC
         tPruATNkHUr8MVlfCXADg8vn07a9wedkrBfOQbaZ/uwCSn76tK0SXudfU7SCbFk+CdUg
         BUu1loKwgqZ4Kwt/bR6sz0If3eiP/nNHgNqF+vGVwKgMwFYUSIOj4pJemOGG9W5BGz11
         vfyvMRnPdtJg1OYVkBRdJN6KifmUNaSoQ6EeRoRQutqgPib0oGRxFr+OziGL4xe9UwUx
         QZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735451926; x=1736056726;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOaO3GIHJbTPnVowygmPizFspt+znwbY2af+UA4iMaA=;
        b=sANrmLoUc3FgyjXD2R8EKxmLI0iMoE1V8HFH+vyhh+k4P3lGVc2yyBGSIM6f+Im4ZM
         R3VpeWdxGlRf+OjwdJkc0+z4zLyn4YZy0rJqSHgggbXSq8H0SOVzGz05QIphAFILwDe9
         185xK+oNQl0hvJudq3Z+0Ip0X7xAPUOG3e553rSI07cNLAqUhUy5+I8btzqnyEUx6Y2u
         gJ+BVrN9Q+TXN6vmZkLudTm75dJVVEhztnd0Ci+XwYY4S0LNoQKVwv2fpT4fSgqCEMVR
         khGkNFvyKbvxI4e/JtK7k0ficIxmXqV+fKwec7pU/o8/M8bA4xX1ZWihwaE3nDVpguW1
         hdlA==
X-Forwarded-Encrypted: i=1; AJvYcCUFPSLfBVFCEtL/HptIzoRx0v6j/sLHsTBD1CE/LUe8FO5qcI03Fx0TRXsNnx2kFmGYAP2uimdjnEKrLRUb@vger.kernel.org, AJvYcCWOhmqTiZCzcby27VdMYjSeFUg8rsuLptDFNHQvqq7qUJbve2fsFPBPs2bw8c9CHjV5xGnKD1vx9B0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1QE6FnLnuvwOVVdsmOwXFdoaNpU2lxqN6TwXMd3XXiU3z6Mn+
	5NJkWq7kcddWK8T2UigDYaB8nY1kBTtJDfJjEZ3tWqLTsa3b1hWZ9lCe0hlWWlgJoXOwJSiSO1a
	BsYGv1eWkBSbyem6Qt0xVusX2bryAMRiBugCWh8OPg+U=
X-Gm-Gg: ASbGncv+L0oFsE6QtuWDXhoZ5jgz62QZLOg29cRKgpnIcb6PiRLYL/CHkjMDciCfE4C
	LkI2st/IrATPoUadalU+qVVizyTY1Btji+Wo=
X-Google-Smtp-Source: AGHT+IEghvvIfQoPMz+PP7ZizlnBePaNWLdNkAgdkNoTrqc2EavOIh9PBwbfodDJWb7eX7EGgiuA/PAZW4tAhIbrPO8=
X-Received: by 2002:a17:907:86aa:b0:aa6:5eae:7ece with SMTP id
 a640c23a62f3a-aac33549659mr3223500366b.43.1735451926000; Sat, 28 Dec 2024
 21:58:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241229042758.163842-1-shixinhe6@gmail.com> <qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
In-Reply-To: <qfagx4fjlluq4fox7fw5ltx63wxpifnr7lp3nkt63jm4wbtzp2@mna6znzgfqv2>
From: newBox shi <shixinhe6@gmail.com>
Date: Sun, 29 Dec 2024 13:58:34 +0800
Message-ID: <CABEB809afGY_ha6aXwDm28U7j_b8mHLycxp=PNfUdi017KtAaw@mail.gmail.com>
Subject: Re: [PATCH] Documentation zram: fix description about huge page
 writeback example
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: minchan@kernel.org, philipp.reisner@linbit.com, lars.ellenberg@linbit.com, 
	christoph.boehmwalder@linbit.com, corbet@lwn.net, 
	linux-kernel@vger.kernel.org, drbd-dev@lists.linbit.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I just changed 'incompressible' to 'huge'. I thought huge page is
incompressible but incompressible page does not just include huge
page. Given the example is `echo huge`, it may be better to use `huge
page writeback'.


Sergey Senozhatsky <senozhatsky@chromium.org> =E4=BA=8E2024=E5=B9=B412=E6=
=9C=8829=E6=97=A5=E5=91=A8=E6=97=A5 12:36=E5=86=99=E9=81=93=EF=BC=9A
>
> On (24/12/29 04:27), Shi Xinhe wrote:
> >
> > Corrected the description to accurately reflect that huge page writebac=
k example.
>
> But what is the correction?  In zram huge page is incompressible page.

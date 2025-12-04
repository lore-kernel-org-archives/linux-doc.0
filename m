Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E30827F749
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 14:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764860223; cv=none; b=U0wG15PSipvUSjARfZh6joVbiutKyTqQZCLP2kgngLFR+cqfJfoRs7/XlpfHvTsYILeRN2kbZiJCeGuR5TUkqKLZzt6gB+8NuEo5UKxZfV0ymludMoEvOiIuHRldUsiN+sb5vO/Z6iOfxGXR4F6pF4Xf/UUvaHUj782nA0cZgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764860223; c=relaxed/simple;
	bh=DmGA7BObSUj1+jIGm2JkkYZJxXyx0jrdxG5OhKc0kls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjI+KRHHQXF5zy6/dec59S5M6npRaADrDgQK4LMLVCPu5b4EOOvWD85KXG3hgn1VpGOhZJib+zZ6srhX1KL0YiF41oreUbO++CWvWOz35atTAWLyxG3kGV7LodCn0+frbGaNALmaMcMPVMXbEBX/6n4XcMumSR7k5AEeW4dINEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JG0T3Fh3; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG0T3Fh3"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-295548467c7so11946005ad.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 06:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764860221; x=1765465021; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a8pMVI5Er56IlfICxxOmm0dvDCyFgiwBCg6aWLDR4js=;
        b=JG0T3Fh3JG7fbKr/+Kkt2A+4MLUsP9scPw3Y4z3fijdYeCGpYR0NUx262qMKUSJsqb
         aa8AByFistbaMpwv0zOn4pvSyJgb89GNmqQX8IX6bCC7WMELFosD4AX+afA83K1CAEqk
         ZXX054rltIBPCgshL2sEIDYF09SPkihGVAPbeUHz/6ZnkA4OexGh5B1PNHx7/pE+2AO5
         rAv9xXn+0Lu56Tf7PGwH9ERKsomX4dMFl2yG+XTOJht/JVy/P/jCaOXJfbFCvIT9Sn0m
         9BHJAM4mOJnKhoHiey+xJr3hVmPsoPgSqTRs9gYyYYpyo/zztBC/jLUV4eiH10NaS9jr
         mO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764860221; x=1765465021;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a8pMVI5Er56IlfICxxOmm0dvDCyFgiwBCg6aWLDR4js=;
        b=lBS6VOXFOMtYynSlLXgnX+f0hTNt8UfqyCPqzDx3NGuDRxH626Zb7w1QP2Mzs8oTUW
         b/qXQFJi1MYyZwG1aPbvxAqeGpmttzu5Fkee0C40cdKJlg6tXAkvRdyRLqgecMLw4Gk+
         11tILbxzMzMX4SbTs9bXhEdG4M1wpMy17hibSj7NWVvxTFUVzLfha2v5yenw4611kqUM
         atntYqfd0EWBkYWFlKSdNQChNphhjfutIrj4+11IXfcUk+VhzLi3Fjw41QAYG53hNp3w
         zTjkYQlwwrt1ZC20vsOWnoQkH4iy3qR1lSw9kzeY6PqubCBNUIYRgjqr1uSF+CATA/SX
         cCww==
X-Forwarded-Encrypted: i=1; AJvYcCUOVsmyXrmAhZafHXNA+Bb1Sh42EOLwWjHBR+05YsWp079dVhdyotgXkKVovlv4slC+S+ZJZTgCPa8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/nkdarRGElrwd8hyXISpRDeMi2s0atZpcXfStYzT0zzspb+zR
	LV5wuasGuvb8THBwgGUHMa/gFVqqAxHXDwcWztxUke61Fm6WnlaWETRW
X-Gm-Gg: ASbGnctEBdpI47AAYmd5JAbjVOWyahyxeRcz9Z9honnkuOq1dceEREcEHGnuL1dNo0F
	MuYRO8G74HfHMNDn7nUlTT+ZnhANZsVX9iaAXWVad3Yq2cL/MzZix4+xQfkxFRBo7jweqvEoVgA
	8jzu/UvOvBorxXZYUlrTeI37un9xfme5aCbI06ieYN4fTDn4imk11NZLbJSZ6zZ976Cc+4GeuQr
	kqUp6DzD+FKDfOc9Q/c76J9guglNohfbTQK9DkRXwztmDEslraq6mh1KJVJI+Gh26Dcu9xF3M0C
	Wsv1bFDDdI2iL0AplzDuvEmLusKIYrKBdgc65FNu66eEnKo+hm9yCHnnMuEbgKP5Gqd/1AIEp/7
	JepvA/l3JUnCNuJDcvpvHZdu5sFt8Tn3Pghab74vpmctxBHYds0LZqpqqEwbaTX+g7cfGvKNR7+
	q22TLj3aTn8ml6xH4WLxbkiz9jzotDzg==
X-Google-Smtp-Source: AGHT+IFSFj9LiSB/ZQRNyTtaPIMQVQOWKHnwdBDVXSz1iz5nNQ4hgnCsZfBc6hoHlPzvzqzMWY7GiQ==
X-Received: by 2002:a05:7022:429a:b0:11a:29e5:12e5 with SMTP id a92af1059eb24-11df0c3cb64mr4968973c88.30.1764860221504;
        Thu, 04 Dec 2025 06:57:01 -0800 (PST)
Received: from localhost ([2804:30c:941:4500:2e30:10b5:73b0:4b74])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-11df7552defsm8413736c88.2.2025.12.04.06.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 06:57:00 -0800 (PST)
Date: Thu, 4 Dec 2025 11:58:34 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v3 2/3] iio: adc: Initial support for AD4134
Message-ID: <aTGhmgsRmphZY92X@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1764708608.git.marcelo.schmitt@analog.com>
 <c189c25b1c46f406c3f7942e5ac4cdb0b964ee52.1764708608.git.marcelo.schmitt@analog.com>
 <CAHp75Vf7p=aPy2ofC_zVz1PURA3R9i0WZCG63-dCEXO=xKJ0FA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vf7p=aPy2ofC_zVz1PURA3R9i0WZCG63-dCEXO=xKJ0FA@mail.gmail.com>

On 12/02, Andy Shevchenko wrote:
> On Tue, Dec 2, 2025 at 10:55 PM Marcelo Schmitt
> <marcelo.schmitt@analog.com> wrote:
> >
> > AD4134 is a 24-bit, 4-channel, simultaneous sampling, precision
> > analog-to-digital converter (ADC). The device can be managed through SPI or
> > direct control of pin logical levels (pin control mode). The AD4134 design
> > also features a dedicated bus for ADC sample data output. Though, this
> > initial driver for AD4134 only supports usual SPI connections.
> >
> > Add basic support for AD4134 that enables single-shot ADC sample read.
> 
...
> 
> Bart converted it to be an aux driver and it should work. Please, give
> a try after v6.19-rc1 is out.
> 
Ok, from yesterday's disscussion I see I should give rest framework another try.
For now, I'll rebase on top of linux-next to experiment with the new reset gpio aux device.

...
> 
> > +        * interface. Now we read data from all channels but keep only the bits
> > +        * from the requested one.
> > +        */
> > +       for (i = 0; i < ARRAY_SIZE(ad4134_chan_set); i++) {
> > +               ret = spi_write_then_read(st->spi, NULL, 0, st->rx_buf,
> > +                                         BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));
> > +               if (ret)
> > +                       return ret;
> > +
> > +               if (i != AD4134_VREG_CH(reg))
> > +                       continue;
> > +               *val = get_unaligned_be24(st->rx_buf);
> 
> Hmm...
> 
> In this case it might be better to  use
> 
>   if (i == ...)
>     *val = ...
> 
> but it's still unclear on how many times the conditional can be true
> in the loop.

The if != ... condition was true on three iterations of the loop and false
in only one iteration. Updated to if (i == ...), the conditional is now true
only on one iteration. 
The AD4134 has a built-in feature that flags when data trasnfers don't run
enough clock cycles to read the entire data frame (i.e. the data from all 4
channels in this case).
Since this is not expected to be a time critical method for acquiring data,
I coded it to avoid that error flag. I added a comment about that for v4.

Thanks,
Marcelo

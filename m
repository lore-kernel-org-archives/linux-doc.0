Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D708B212F89
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 01:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068607; cv=pass; b=RVAE+zEvWax5th3zj2g0tzA0a8e3TRayoe5lKGqlbj6g3bNaiIi6y62bUTlHMX6RTwsxZhssArcHOhGqBD0YM2oEI062aaKzQZPoqG6JUj/ofForU38GSxT11Mw43/CGvI3TrC9ggeNMz11Tofoh9kHavJjuXnqJZbz/KfZIX3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068607; c=relaxed/simple;
	bh=yNkI4YWmaAljUXNb/JaJlb6xE3bkHC16f5NuG+JMwV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MoXYoJqbUvT1I+HN3FgmVz5Mhto21uSPcX5A6gqhVoPegg0BNZl83JJ7iZj+qzrkKRgVsqzD8GqLYQhHt/kD34gfn0WpGQGOVQlstzI5lAWTMnMbHsaLugzhzbq/C+KssOIBNkDhXw/cqZkXeXMQPHmdSMuIH9iGblset7rs9BQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KdpumB+C; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KdpumB+C"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-126ea4b77adso408070c88.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Feb 2026 17:16:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772068605; cv=none;
        d=google.com; s=arc-20240605;
        b=UoNEZRhIRYtRbP4KmdYv/Idv0K2zM9X7d624+Ascu78HSFiiz1VLlShkNYF9CpCs+T
         4If7jjlkT79viaQWEtzYvQ5kc4Yy+FPNOPsqyJkvwZQbamKe05eKwrc2pReStvsB8pVW
         7G2ekjnGDT1LYGFKHDRutP+U1o1xiw5DJKo3xOw0foWEy818LtrmuptF6SC552WSAL1h
         6aDDTNLu9p5JwK5zXkbA3vOdMrzShx4YEZsuzeGEY2ReZu5CrfnFf9SIITtuaLLJ7+F+
         Ctid5ckfW2GwkBuNYeMxsf78V/0qB6uhmCAauR9Pgh602Wxin66xowXjTHEBS7kkq7gm
         /A6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vRCpYCv9LhOitz1IfzI25VOPlvd9PoDqej+x+FrWu+Q=;
        fh=BVsf589vljfTBkAKgn81jGRPtUoBr1Qgk7XqurwGIGI=;
        b=XfSbochDuj8QvCDo6vG/8/V0/qQsH+2922GugvreCbmQ80hGPR4W2NBDaaami/3X3T
         M++hDmfRZsT3nLUuK3LiLyTsOn3lufYtWtRnhXuD6djanoSwKGUMf3bFroSN6xbPljjh
         ahFwqsE/MpfNrOudmyXNUsSvnks+CbYUqCs20LEGrZv1Cd/W8cbcTAbojmHSRN/SYUkK
         ywFLb+xxA67vlIpm/h54vr78lvbw2VjYV5sTsyX1DtEtxHysJGfS4Bepsupd9CQVAAQB
         yvFEByHswQbUzcPQYpBOEa0apXpmmX3P+OBxwJgM0zcW2q58Ya5dYBw1as21iJovUacy
         M/eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772068605; x=1772673405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRCpYCv9LhOitz1IfzI25VOPlvd9PoDqej+x+FrWu+Q=;
        b=KdpumB+C/BgZn8/iBWqtDE6WQga9ze3cQ00eb/x5wkKRiOlQtDA665nqae13H8Wopa
         wv/FzIwB4sGLRa0Vi1LzgXVQOlSN3cVOLGZQVpKQWdtU2Tzgg1q2Fn9nLQSGAFVLCueN
         LVBNPPfwq4+zuUGAA54h6xa2WnNZzgIaond0DwIntoiBeNZyQrsqH8yUKDaP0TBEhlIG
         sCel2lbnDs/ieP4ybYfiOCFcxYsshTHB2JlBrjppOu6lFKMNucPw/FNmZttLBgFl4PPs
         Kq9vQg8MbrNEB/rwpy9IJ+Y/FFute6qqs5uSkByDbb7BNus1QPzOqvJlojt60m1+salp
         B8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772068605; x=1772673405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRCpYCv9LhOitz1IfzI25VOPlvd9PoDqej+x+FrWu+Q=;
        b=QsM73TqDFu9quT2Py0EKvCtFFXK8MPOco8SSwJleYa7DeBfkTjBZTSKfd5JKhTLVEg
         bzXyZ0GK3cY7JZW/9cWAEYsSFRU4Mil+2c6bTRUd7s87HylnwloLsfZvlgpCYVBkZcVE
         xNKbllKA/b/2MVGc79ab65hnVgbrMkPCzc1b6F8URGdPuep4veua4096rc9ybOegZHGc
         OKtMQ6bSRs328kf3CU7RUgMtQ0gPu9siLKx//6nmGGI7aUDSQmwDSHQudVBVhggMN606
         508CAkowCPqyhDagyAckZymGsOoTcwzqCgGiWZ6ou/RSYfWllJJS2x5AsesUkLCQvEOH
         oGWw==
X-Forwarded-Encrypted: i=1; AJvYcCVa/tNFv7zlFGQbRI5vWCSrEJSC3VpjsrZavg1OV9KMF6oQs7feEbwDbC4bZygJI6u7Bzj5HY4oiew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbx926AxGXkMmJ0KBl2/KGSkxV1JfBG/cP/SYAqX5CVMym81TM
	TNIPlVUL8XjlpDwvLmSEJKKtaUYzjh9nZ98BGYmAz7T8dRMN9gXiA5JEvAl2B/kKpSgtDBGKUGR
	+5xjIKvzrbskL7E05VNxCdS34rM7W4XSUelbhN6K/pUw/X+Vb8LaRn1uC
X-Gm-Gg: ATEYQzzaq+CvPt9PfD9qNifvE1gnQS0OKWjFHiSbQsGUYdCQXfCsCxd1J/z2ycSyhSC
	RLC9l/6ej9+OsptH/lcZjlp5Z4IxREPi3mG3i5QQoEJY58+9uXWPi8U7LKid7/n8UyC8Q+SwHZV
	R5nktA+TTy3euDdVtm2h8cTx1ejqgWhPjAHtJhU4AWRPSJSrNeksPvyjvTuuoppq/vCUkM9Oudz
	91ysFCyNGGXYFl/BDrFPE+1Ah+osI+6I8VTAEUOer6Ts1pWwyGXeL4r+kA5OAIwc6vvQ8rxAYyZ
	QhfQFQlvg7uvPtIOYDdFfbYZdHEDkTuS6s5sMOg=
X-Received: by 2002:a05:7022:48c:b0:124:9fd8:4b99 with SMTP id
 a92af1059eb24-1276acbdfbfmr8853747c88.14.1772068604514; Wed, 25 Feb 2026
 17:16:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225203639.3159463-1-elver@google.com> <9476ab2ff783c77ff4f1d323fad3e356bb172fcd.camel@surriel.com>
In-Reply-To: <9476ab2ff783c77ff4f1d323fad3e356bb172fcd.camel@surriel.com>
From: Marco Elver <elver@google.com>
Date: Thu, 26 Feb 2026 02:16:08 +0100
X-Gm-Features: AaiRm52Q6kRNA7CHrMLsOWSgdbnXUE5vCnkOPGyFzwQOTRVlJEfjChemViCldxw
Message-ID: <CANpmjNM4kwRGU7mxZPtPnD2-Q2u2E5K9bLuHiZYkPkB4JETeJg@mail.gmail.com>
Subject: Re: [PATCH] kfence: add kfence.fault parameter
To: Rik van Riel <riel@surriel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-mm@kvack.org, 
	Ernesto Martinez Garcia <ernesto.martinezgarcia@tugraz.at>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 25 Feb 2026 at 23:26, Rik van Riel <riel@surriel.com> wrote:
>
> On Wed, 2026-02-25 at 21:36 +0100, Marco Elver wrote:
> >
> > +static int __init early_kfence_fault(char *arg)
> > +{
> > +     if (!arg)
> > +             return -EINVAL;
> > +
> > +     if (!strcmp(arg, "report"))
> > +             kfence_fault = KFENCE_FAULT_REPORT;
> > +     else if (!strcmp(arg, "oops"))
> > +             kfence_fault = KFENCE_FAULT_OOPS;
> > +     else if (!strcmp(arg, "panic"))
> > +             kfence_fault = KFENCE_FAULT_PANIC;
> > +     else
> > +             return -EINVAL;
> > +
> > +     return 0;
> > +}
> > +early_param("kfence.fault", early_kfence_fault);
>
> The other parameters in mm/kfence/ seem to be module_param,
> which make them tunable at run time through
> /sys/module/kfence/parameters/*
>
> Why is this one different?

That was my first thought too, but after much thought we should not
make this changeable after init, see below ...

> And, does this one show up as /sys/module/kfence/parameters/fault?
>
> Having the ability to tweak this behavior at run time, without
> requiring a system reboot, could be really useful for people
> unexpectedly triggering kernel panics across a fleet of servers,
> and deciding they would rather not.

It's intentional - having the ability to switch it after init means
we'd have to remove __ro_after_init from the kfence_fault setting. We
risk having the system administrator's choice being overridden by
accident in the exact situation where we do not want it to happen:
either through memory corruption overwriting that global flag, or it
might give an attacker the ability to circumvent the oops/panic
setting, if they manage to reset it. KFENCE is not a mitigation, but
this setting is meant to give a knob to reduce the risk that someone
takes advantage of KFENCE's heap layout - until now, KFENCE only
reports and continues - the actual buggy access happily proceeds.

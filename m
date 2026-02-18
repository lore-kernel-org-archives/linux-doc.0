Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637ED280327
	for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 20:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771445022; cv=pass; b=S3WOjPI2d5Sg5CzNBfBMAIJtpp2YYu2Ur+bmxTBUoaCJb/2h/8RSwI9UZhXlAn94dV/WKe1vZ+p/hI3OrRruZjTl6VlEGOZ7DQRES7SzUqEFDKq2i3xzV+08GxCc6u1xCKn/GWAis26Mcf/32hecNnszrqEChoJ/NqnxQWPqlkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771445022; c=relaxed/simple;
	bh=A9RFDZyZgqlQJkBPPEH0bt0olncW7jJuhWCZ9JoO/s8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mp75ljHIVJ52kEn7xS68wE5JuBqwirY9lm+I/3qZ1BGa/6l9tFhr3vanCf/oefOT6jFPxTZ+cjo+CpKPHPU4C+SsFqMQeuOWeaa4St3xHR3gOz4E6/sig+KGCwA3XSpr/T3nUgnGF3AHpQRFC+nQ0s6GpqoBw/p1zqujbSMeiv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net; spf=pass smtp.mailfrom=amacapital.net; dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b=OpxqkiwA; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amacapital-net.20230601.gappssmtp.com header.i=@amacapital-net.20230601.gappssmtp.com header.b="OpxqkiwA"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e6b736b84so269724e87.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Feb 2026 12:03:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771445020; cv=none;
        d=google.com; s=arc-20240605;
        b=aHKVpagu6IbUuDPzAaNQw0DmQQOdFgXU1le7jRHYq1+4phNzJ/dPrD2elboJxfDBUO
         6OWAwvkDE6kQB0L44Qtz4YxKRnApMQ+AB+F7fI/x6vp616dmCls0m8UnahTPWlmN+8x7
         s47ekcJQEbWGOpKoGG5wNzqovkesN582PVV8T+xVQmlPxdAGXoJs0p8FvcTD5giluz0g
         4s3Zfs7fhL4heNPmnqIHzGrJ53xp+nPGfdBPy2HHm2RzqQWP2hkynL6AwMbticOOXnWY
         9w5/bZICKPsiWiEFi4i0rxnEhKku3RnbYOaMvPQJ8/5NYqu8xTk5PDUPTptHVaGQDxVv
         10ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vcy7R/11wcjfKOQI7WogUozCzX0mH6u0BCoPreJyb8U=;
        fh=SpzCXCCk7QbpWAaPVeTTV4IcMIyBJiksuU4XpeiuQ0Q=;
        b=JnLnhoqnu+PQAEqf0XZeBw/Fmd7JqYPYlHnsyDBjazGiaLshoaEHvq6Lj9tdpcN4v7
         mGVqoKDdUR8VMubly9uM2CYlG7whRH/UzPtGrmB7TMHdwTKAPNiYnD2WOAEhc1SbmqUC
         dd7GIWE2EQiFWKmFR+y14NEG2mMotaabWwOQ7gCT7oLOnpETvZjL1iITokj/GZk/d8IF
         w9jgsEf61nHNu5JhKRexlcp9gJZfaIq2B2HC9jP0ZfnM0Ad8ytFGMjsHL+qkj24Fq1hW
         cSdTeB7LYM9TEFi0j8eg81uvI7ev1KXnL/ZqYOxlijl2/Oksoz/sY0O95sueNaZMOFPG
         Smqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20230601.gappssmtp.com; s=20230601; t=1771445020; x=1772049820; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vcy7R/11wcjfKOQI7WogUozCzX0mH6u0BCoPreJyb8U=;
        b=OpxqkiwAUUWIfdMsKeV4jtOeUyJ54S5Q3gIl6IWomGB28pWLQ43/VZ2PPrPiJLFn6l
         geHXyDnsYHJCBuvKcKva6n0DQffN04OwxU/4M7eC72DW8P+FW9TGf76yQTqVcGZ39RB9
         xSDwuctxDlLpZnWMrM5/OMqLl4fuqhU/Np7zLrUC/rK+nDca8x9sisN+VjggnR/U1YVf
         BBaMNVWeYHdlS8zYxYiGoqtDsVTeqXx6Ku5JCJYMqYMej/Cvi+xikyOHdKCyULiuHfKS
         +s/YQnj8cyCckPBiCdB4cJhUF50hvTz95aJYnjMKO+epQEN4w6GWsNcRW1q7xuJ1RV2C
         VEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771445020; x=1772049820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vcy7R/11wcjfKOQI7WogUozCzX0mH6u0BCoPreJyb8U=;
        b=h8/lFfyCFst/WuCwFRyxDhvFvaKcvHnVTHW13b7eQ4HRxiLLJ89bk9x7CR/GYPOtc4
         sl86rTbfoemz4ZEqR9NPdmqAk7G8jeTmzcoMQ81ck/wtAkaHDLbnudFg33OSXVnzd3B9
         JoyXJBjagpq032bCMrmTEtLOdIY37Z2054/T9d2XXIBOPkWeuu+Wb0O5cH0rH4wjFT0l
         NIiji4Tcv4+lQqnpZrQ7sijiXpKDrfG8JNP33WHO8+IfFNDtlQh7U1aOk9UPLkcgD/0a
         DTjrUnyq+1NDx8b0VvM7lImgHdkSAjXTl8b2RpEUItC/CNvecvxb22uIizsN5hydGR7M
         ZomA==
X-Forwarded-Encrypted: i=1; AJvYcCWw6RvCjH7jQ8OqjWmVcKsrJh3n1J9A2ag5ls6n/hEqOt0N/0V0GxbCoKVHzSACAF/BYX2QZ62vGkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFYVn2t/xP2oIMqJl+QT3OyZhng2iBxthfHHj+N3BTmoQnh4sN
	aAZAUoCPN24E6bkvHt/V5GiEAER+Cg4fcgeQmp72VU9A5rH3htarP+UGRX9WONfgIZeE6vf+lDF
	kOS7SNNOGqcZagGMhdGVvJMhMchbT5LWpibUYsyik
X-Gm-Gg: AZuq6aKNvuu/2Jp2CP2+R3bAhhiCY0lcQdZpXkFibi+bNAXTwdsqBAY8AVSJa+9atE8
	yRPDjhvJkv4V2iSehGs0LG5nJO/fbg+Qim8WKBuKJ0KGB0ow1gsBaCh4wvMy+ugkFK2oa7DS5QN
	xLxq/kx2abQ1NYnXaKaPNq5CO5/aiewA3a/dh/8oHHVqTjjXsavx6tg391Yqhc4IVw8o924MqHn
	/Kzg23G/p0Kx4vC5IfgdNbfkKniBLfFNI67UpE/AM0bwmprki3+2K5fY2j1kM5XLc/Zqza5yfBT
	yd3dWzfPbmz4tIA=
X-Received: by 2002:a05:6512:3992:b0:59f:6edb:b7ea with SMTP id
 2adb3069b0e04-59f6edbb86bmr4081097e87.42.1771445019417; Wed, 18 Feb 2026
 12:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215233316.1076248-1-ross.philipson@oracle.com>
 <b5f2b5a5-b984-4ed3-a023-c06d634f9146@app.fastmail.com> <1ffd3cb5-2c76-4371-a067-3e4849907d80@apertussolutions.com>
 <49d169bf-0ad2-49be-b7d7-fceb9e7f831a@app.fastmail.com>
In-Reply-To: <49d169bf-0ad2-49be-b7d7-fceb9e7f831a@app.fastmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Wed, 18 Feb 2026 12:03:27 -0800
X-Gm-Features: AaiRm50K0AfYUHogK4D4rjv3z3w5Xga5sdt_IpbZg6dO6uXxKWdtAoPp16KXxJI
Message-ID: <CALCETrUE8c-dxRWhtHKz_PojwZuWMXJSzOsFQf2vt5LS3ATwpA@mail.gmail.com>
Subject: Re: [PATCH v15 00/28] x86: Secure Launch support for Intel TXT
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	Ross Philipson <ross.philipson@oracle.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-integrity@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-crypto@vger.kernel.org, kexec@lists.infradead.org, 
	linux-efi@vger.kernel.org, iommu@lists.linux.dev, dave.hansen@linux.intel.com, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	"H . Peter Anvin" <hpa@zytor.com>, mjg59@srcf.ucam.org, James.Bottomley@hansenpartnership.com, 
	peterhuewe@gmx.de, Jarkko Sakkinen <jarkko@kernel.org>, jgg@ziepe.ca, nivedita@alum.mit.edu, 
	Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net, corbet@lwn.net, 
	ebiederm@xmission.com, dwmw2@infradead.org, baolu.lu@linux.intel.com, 
	kanth.ghatraju@oracle.com, andrew.cooper3@citrix.com, 
	trenchboot-devel@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 12:40=E2=80=AFPM Ard Biesheuvel <ardb@kernel.org> w=
rote:
>
> On Thu, 12 Feb 2026, at 20:49, Daniel P. Smith wrote:
> > On 2/9/26 09:04, Ard Biesheuvel wrote:
> ...
> >> Surprisingly, even when doing a secure launch, the EFI runtime service=
s still work happily, which means (AIUI) that code that was excluded from t=
he D-RTM TCB is still being executed at ring 0? Doesn't this defeat D-RTM e=
ntirely in the case some exploit is hidden in the EFI runtime code? Should =
we measure the contents of EfiRuntimeServicesCode regions too?
> >
> > Yes, in fact in the early days I specifically stated that we should
> > provide for the ability to measure the RS blocks. Particularly if you
> > are not in an environment where you can isolate the calls to RS from th=
e
> > TCB. While the RS can pose runtime corruption risks, the larger concern
> > is integrating the D-RTM validation of the Intel System Resources
> > Defense (ISRD), aka SMI isolation/SMM Supervisor, provided by the Intel
> > System Security Report (ISSR). Within the ISSR is a list of memory
> > regions which the SMM Policy Shim (SPS) restricts a SMI handler's acces=
s
> > when running. This allows a kernel to restrict what access a SMI handle=
r
> > are able to reach, thus allowing them to be removed from the TCB when
> > the appropriate guards are put in place.
> >
> > If you are interested in understanding these further, Satoshi Tanda has
> > probably the best technical explanation without Intel market speak.
> >
> > ISRD: https://tandasat.github.io/blog/2024/02/29/ISRD.html
> > ISSR: https://tandasat.github.io/blog/2024/03/18/ISSR.html
> >
>
> Thanks, I'll take a look at those.
>
> But would it be better to disable the runtime services by default when do=
ing a secure launch? PREEMPT_RT already does the same.

So I have a possible way to disable EFI runtime service without losing
the ability to write EFI vars.  We come up with a simple file format
to store deferred EFI var updates and we come up with a place to put
it so that we find it early-ish in boot the next time around.  (This
could be done via integration with systemd-boot or shim some other
boot loader or it could actually be part of the kernel.)  And then,
instead of writing variables directly, we write them to the deferred
list and then update them on reboot (before TXT launch, etc).  [0]
This would be a distincly nontrivial project and would not work for
all configurations.

As a maybe less painful option, we could disable EFI runtime services
but have a root-writable thing in sysfs that (a) turns them back on
but (b) first extends a PCR to say that they're turned back on.

(Or someone could try running runtime services at CPL3...)

[0] I have thought for years that Intel and AMD should do this on
their end, too.  Keep the sensitive part of SMI flash entirely locked
after boot and, instead of using magic SMM stuff to validate that
write attempts have the appropriate permissions and signatures, queue
them up as deferred upates and validate the signatures on the next
boot before locking flash.

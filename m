Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5684DA531
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 12:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192840; cv=pass; b=sY0m/xPwMdYBC56Q5uTaCfGGp18EZ8pvZOyxj3nvUnoxKIo/vHh9ro3RJeI546HOZGXtktz7F/fv8h3liW8X37k7b0mrinj2V2xLVfhTjxkFR2xoLyoVKjEtCQxEw4MnD+Ok+WBdR9kNd82/1EXYEHpZox3TiREnqm3jemMFL7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192840; c=relaxed/simple;
	bh=7VWO4tOJZLIbfUwVyMsF0ej608m9OlSJbClLH5Q+eyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O51T07TnrWHz3hbY8qu3JTI6k1PdKdBs5YqxD8iHVtykPgekgmjke4Z2LaW1rS+81SkCS3UUmJrlJfpVYTCjm1rP2EBdXXRJeynLBv2/qAtz1dk3oOrMBy9h0g4hRYBoNo8RFz3yvn3sqsSragf2kk5X6YuthlCrN9GMW31ykzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XfZeg9X7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oSSZ/qsq; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XfZeg9X7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oSSZ/qsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779192838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
	b=XfZeg9X7vDiJpEuifeO7F6TCiVDeiVt0XAidrSq088+v8elJUP21MtG5es/8jrTWhs+Tqp
	qHyCuAlPr5mghgo/17gkkmCqgb3dvvnOiTTWKqFPqbXLeVsGqXEcAJw4fDYQfeZRGxNDdH
	XgIRM4mhUhv05gN0NLveFAoiR/SnqvI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-599-b-gy-NymMVqTnHbk-y280w-1; Tue, 19 May 2026 08:13:55 -0400
X-MC-Unique: b-gy-NymMVqTnHbk-y280w-1
X-Mimecast-MFC-AGG-ID: b-gy-NymMVqTnHbk-y280w_1779192834
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-44a71109b94so2667407f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 05:13:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779192834; cv=none;
        d=google.com; s=arc-20240605;
        b=ANvivcltP+t3Rjv9ZifSCF6X6XW4x4leOqYnZD9zN44X4B8jZR/ZDJLtuBQOzEwRm4
         4Hvv42SXwKCa2eL+wCkTO8vx/VcSS5dLqpDo2dlC5How8Og/cmXqh/LaRg20mKqRwSq4
         ZDtrOrm3mlhdnpk62VSwqViJVPIFoNvHSjl9Yj+HIZW+fueJgDRtpzPO+jTA6N6f7IpL
         F75lIlGVVhZOH0s6jrvfek2x6JlZ+wrzsN23D6wV76Bvw/8+3X3EAFnP0347InuReETe
         eMqtGWXsQJ5YGVbv95hpcMDX4dKsLA1RflbhBs9bthyVerzXwjyzYI6DngVNIbIfeAYG
         AQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
        fh=kRjWismdhAM3SuW7FdxJhbSs8JrUS8ETzfruTaaGJ88=;
        b=gYZPxQdOO7cD+sUyy/2f6rKP6ZYPnYJvttrUc9J4nq1lCY7tA/3/jOR0hOOvM2Hj1n
         /dK3zdZHzPRsAf/9mjSGLifyc7AysH/aenWx/zFL7FhcJ4gZW9hQ19phS4pWFIZr9QOO
         ajkzFMVyrU63YOxuCTlllQ1okYQyEEBh7j8Wtu+q++i3HXh6cEyosRkXVhbt+f84xoLC
         xuYH1xczW8K5hsAJ/uwES4AVZc+HaEiGFEQEbwfGZvwT+uh9iOfuhd3yFkQKk5Th/xaK
         1IQ31Fq/XtbI4AkbETL54dqc7XHWCLNkaaUQcuOl6La3/ad9WF8bGiyVC6sLSVtX6x3y
         feHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779192834; x=1779797634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
        b=oSSZ/qsqcKkqKxC8ODU8GcNDRe+Uc7J4PKACXx0mFXW5Ue/v+2XS9uqt5QG39wfa6A
         s1uNo8VJF+DtmK0vKgJH1ChGkDzhN+0U88hzwRYIMdzrwjk8IjdbHWu12/RggeDksJf2
         hCAxcHoXDOQ/CvegmlSYedIEo5/KgrPA70XQUVmcYkCAG960RW4Ru8vwC6uHrk3/Dhci
         SZ8Wgp26VGsJU4Wu2DRahvV9ghVuxtFVvbS7NiAqj8G0qsLLDp8m/CwXKAKZlUPLhMVt
         SBDd39P2EHtTtQKRvcKdvjvrpgF+W1QZuCU8WG15MTENZFXWFpDnMYaYIzYTLXodnxOg
         N/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192834; x=1779797634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
        b=M0gpARkUUYhRVxgP9QQ0+uuXizc3llIcn0pFfXpY/Wxcd+g+5mHrUTxSOLOnTxJ/PT
         zyCCdY9KT2nSokaI0peJn0VZNrF+qT/RK6rT25yOf0AR5bXDPrTB8VsICr1kKCREf3p6
         K3tuPMGwSToT3TXelz/Ru0O5etZASYanR1cqJQczhDtwf5wC+Bs1GBuG7zwHown9QcYg
         aqEtesKaYI6XqjxMHgto3vfrXegd9Jb9TmY7ymdJ8r1CflU+Hj4Vbd4vE0LfIdCOlD6M
         cuql96fLMY2eAS2dmR067WB1QRJaJS4B5GT4JfnLQmVC9emdnhyD0vr6ZKCQzecdlg9g
         DvFg==
X-Forwarded-Encrypted: i=1; AFNElJ/BQR9MIlL9NwRrAAXOA/SxjvI4RDSNA2fcM7a7+U7laqrfvmAhURvHnMGa7R/BuWfsPNmQMq4VogY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRpcyQhKfn2PWVfXsGV9azCGKMK8Yg0lHl5dr0jN+z6Cx3ZNWv
	i6Ecrj4HfNDGGg6aQXry5UCbBQvGoJUepPVrNnrHSh5FNDC4YN6KYQFgIuuTOMjCLEEgEZJWGX4
	AT+DOaZYv85QkaBidey4jovdYSbVbofQcRGLwGD8fyal8G0AHPrbdMbhrWY0X0B/PX0OoQBukVk
	3/g7DBhODpm0UdIqlBRXmFwaWEyhg4acH66jtFOHQp2p40f1UugA==
X-Gm-Gg: Acq92OEFmw+trIGTvatSS3NYahDCRDYBBeE0AfprCCdItxIxAgP5b/4A6JIzJvy7uNE
	nLC+1brGndB+J7m9bsb3EqSR26voZdyRueQ+L1vb+thVqU5TPMvAm7LhqM5mpDA7FgGXEHK6zSh
	RxrMraiEUWSvkJDc8uMC9hDRiJksoAqc/caN0DaV2iSA0yYOgYQ/Gm+0i6Vl02HMUPwgURvMV7W
	JNReXBYnAnnWOYAT4QQoSNic7OW2iqa6ikoZTCSZMQR3Inkbi8TQbY/vxG39YfnshCEmzAPJKGf
	/5XHHA==
X-Received: by 2002:a05:6000:2207:b0:45e:73eb:2a75 with SMTP id ffacd0b85a97d-45e73eb2ab3mr19018196f8f.16.1779192834240;
        Tue, 19 May 2026 05:13:54 -0700 (PDT)
X-Received: by 2002:a05:6000:2207:b0:45e:73eb:2a75 with SMTP id
 ffacd0b85a97d-45e73eb2ab3mr19018142f8f.16.1779192833807; Tue, 19 May 2026
 05:13:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com> <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com> <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com> <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
 <CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
 <3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
 <agxFbniU_6eQ98t2@willie-the-truck> <cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
In-Reply-To: <cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 19 May 2026 14:13:41 +0200
X-Gm-Features: AVHnY4KnZP7vwbtgqcU4-2-Suro94ZjhbnxjZ4Hm6Me_3CnnH2LMZ4Ptbe46Vgg
Message-ID: <CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
To: David Woodhouse <dwmw2@infradead.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvm <kvm@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kvmarm@lists.linux.dev, linux-kselftest <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:44=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> > > So... what next? Is one of the other KVM/arm64 maintainers going to
> > > speak up? Paolo would you consider taking the fixes through your tree
> > > directly?

I admit that my knowledge of Arm is really limited, and I do not
understand which IIDR values have architecturally allowed behaviors
and which (if any) were made up by KVM; but even if I cannot honestly
remark on the code or even the approach, a compatibility knob is the
right thing to have.  That's a userspace API design matter, not an Arm
or GIC matter.

I hope that Marc provides a better explanation of why he believes
https://lore.kernel.org/all/20260511113558.3325004-2-dwmw2@infradead.org/
shouldn't be accepted, because I am more than a bit puzzled about
*why* that patch is being rejected or (in v3) so far ignored. Marc in
this thread wrote: "If userspace is not a total joke, it will read all
the ID registers, and configure what it wants to see, assuming it is a
feature that can be configured (not everything can, because the
architecture itself is not fully backward compatible)". But in this
case there's an ID register that tells KVM if userspace wants the old
or the new behavior, independent of whether that old behavior is
architecturally valid or not.

I will certainly take this patch, but I won't override Marc. However
I'd like to better understand his point of view, because right now I
just don't get it.

> If KVM on arm64 doesn't aspire to maintain guest compatibility across
> host kernel changes =E2=80=94 regardless of whether the previous kernel's
> behaviour was "blessed" by the architecture specification or not =E2=80=
=94 then
> it does not meet the expectation that we have of KVM implementations in
> the Linux kernel.

I agree with the "aspire" wording. Even if it's not going to be 100%
achievable, KVM *needs* to aspire to maintain both guest compatibility
and architecture precision. Sometimes it's impossible, sometimes there
are constraints that require you to trade off one for another (e.g.
via quirks, or by breaking behavior that no sane guest would have
cared about). But in general as a maintainer you don't *get* to
choose.

Paolo

> Or indeed the standards that we've held for Linux kernel ABIs for the
> last 35 years.


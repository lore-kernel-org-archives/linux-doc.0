Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F34341AD7
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768467791; cv=pass; b=itwxt59GN7h9KmmaNOWT/GafAj2A/WwvIXupTkGCaC+eyaBaUMg4fEtVXOQi2xLV+oalmXUXkUCxrygtThDglTLC1j8Ww+u8pk+zptmCg2qrGSBDmtGCacFCzRReOagmwlf4rd2j1+9UDsHSde1h+4CCy3UsNTH+4mQSACeFBm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768467791; c=relaxed/simple;
	bh=03g5GHo7VUuroNdnNffpeJG0qnrQfvR4X6uMf/z1OKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqwlZRNoT+D/XX4vzuuj2yUd7aFPuG2S3eyPJUfZbOi5liGhW4KGaeoDERi3c79wALN82CoNFFNO8kVBvaAj1hXGz42VfA0zng1AKTH4PEBJxjT3I+60Za26C+DAwvhNMyKQCod7+ZQFpz89Obqrtmvl+6JPTmuIoaZeNqTKFh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+TIzgsj; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+TIzgsj"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-501511aa012so446301cf.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 01:03:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768467788; cv=none;
        d=google.com; s=arc-20240605;
        b=XrIzcIulBKAGx3veK1svkvYexg298n7VQtu5VNcSNqcES/E7XT3NPsTLk+CwZ7r4Eb
         AJqZkBbz43cEfqKYgp2R1zYA+QH/S7JfoIaLjontu9hRX40WAdkCxAlyOwmZQJW87mHy
         q6xkQc/m+kzdeSej2tHOSfh/cd6gV2HDFeebhFUKaB21WXyRfWH/Px+RCsSjcMGnYZA6
         /umccuzdIjvUU2fPtXn9vK9mKw+URg9GeL4oE/hn7vK1d7QCZw2jgJQN+2PmlqmitFPj
         TRMf+hxt8z7UhZKXFFJpM+0cOFd5QlEEwQiWFFPJf/733VDnpUDfuYtfkUtGsPCc+pjm
         tO6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jaHTBHlKT0XpapwOdZ2HklxNZ/MZMO/Ynn29Wqw5zNk=;
        fh=J1tJBemr2X5XJhcN0KaaKEd0KJd1AfhLIlhTZPStoTo=;
        b=fKI3FHlmfPatlqWVFihAJycGrx9KyBzZjbmGH5yDSXMAGWiBCdMoWD49y+FwBLLucA
         zQWPL7bGQNLsK/ORzHCSMGcnoRHgatzMFi/n3wpertTk4fmw6thpY7XgfajRpgz6EmPz
         LtuHuM6EwIlMT8yivf93x7SA+mfa3mGVFhIU+Hf+dLibYoWbSaUekZI3853S9zEzVm6r
         nuRHC5Xc9tEEgOY7cIHeBPSdYLlXVDfx4mJj9CHAS9CvTkZVoLVmg4Qkk0MFLWaEkbx+
         LehfywBHIV523/WgtB+XdOCtQ5wX26e8UmRNS1wDXaBVimVL9O4GXcEzHDJF3NygXnbT
         jaqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768467788; x=1769072588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jaHTBHlKT0XpapwOdZ2HklxNZ/MZMO/Ynn29Wqw5zNk=;
        b=Y+TIzgsjwX0wqyLVxHk1V9ZPIbOXuA9OZSYYibpJez1wFrkQujaRFOo5p1sGkl6fgj
         LU6bpaiZtR9+7pL1gjOyJyuMOP3+ihoibFETGmuyNoIdjWuuJMXbCyr4Z0P90eaN3eQB
         h9hvaEOE47igHK8xd1x0aJZVoURBgg5zQ7CWNpwwoIkD6AXlhTuUDHnNPS+rm+VV+NH9
         8rZx9qCAkzjg7MVA5OjbSq2lhVvt5AN48pR3jVKYjqHQbBmAnYwClOtgLMh9YaWZ83Ui
         JF5XEiFMQsi2pbet37O5LZz/pNq7yUnZnGk3uMpUT9MGOrDvvI6oquIOHZwLBBodRCBc
         rtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768467788; x=1769072588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jaHTBHlKT0XpapwOdZ2HklxNZ/MZMO/Ynn29Wqw5zNk=;
        b=MW8OFxKX/bgif4ICdyCpZsPYmOAGzPP6KRzvhE3zPhyPyOjCdxjQqGSBEGFKiKiGHu
         tVQHSKu+ye6QwLYU+qYzFm0X6BPZErabO3490u+SHGpjx+nuLYN03LEMA+8vNJ0YFvTB
         pa7Jz/QbxqAT+WbGlG2NpN5BgfBWTo3DBC0KjeFtk3PnRlDlkgKpA1yTrLiEsNhRasC7
         O7XySPhkGVjzFadQ0qE1LhPkr06SMCvgD8+0+taHOPi+4tkPjpPboJ3hrGSbSOmvACKM
         3Vf/VtzcdkYXM1xfRMrYB/618zk9XAQevsGgPZhuJ/murYllQuaAk0ptrm0dMC9qEviI
         t7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCURUITBWYvw1eL8tUvhNuDg573t14gNW28VzSSDzUyTQj8VGXcvR2JGDaBDaGLOcV3TOqY2yt29ntw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ3tMPYvq8acjCEMYXbbKg0HAyFfGHSYF7MG1NoffL80WzKWs6
	+VEmxL6e6gvOIHFV1X1eKAWlhGIhwGi2x1+yoB3Nl9qsRNDZjl/0ZTyoIne4h924bVIBdJrLJyF
	c6594pPryn2EGZoFSB0PUCISycSbQhFLQOavaT82U
X-Gm-Gg: AY/fxX7L6TjvHluER7WR0uxT9wRM21Ei0OGJ4uAen7exOa2lug3JqYnMX7LwiJNZm2u
	BE+IzyFfP4qU++RTrU4vsHwAfDszgigFWus1goLPG52QEZF200o2jbeGfQrSy/EwynbYuEajHkA
	7jkOXGyI10UGAbfNj9HsNA3fysQ4Hv+9FHjcnCWlb2awPJ19uVzEhC9oQMyHihG5S41LXLUWJWH
	WBEr/9Ed+2Ng7dBFkdLXavRpt1z+8FiNZu4BnuAm/ER30rH+nCTtrWmXOGBZhpWs130O6s/
X-Received: by 2002:ac8:5dd3:0:b0:4f0:2e33:81aa with SMTP id
 d75a77b69052e-5026ed4f925mr5343061cf.11.1768467788106; Thu, 15 Jan 2026
 01:03:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org>
 <20251223-kvm-arm64-sme-v9-23-8be3867cb883@kernel.org> <CA+EHjTyYcrWwBR0AwwdWFfOSwbmTMOhSee7y_-vrMfOxphrvqw@mail.gmail.com>
 <5a053bb6-5052-4664-b0cb-f05d56d4679d@sirena.org.uk>
In-Reply-To: <5a053bb6-5052-4664-b0cb-f05d56d4679d@sirena.org.uk>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 15 Jan 2026 09:02:31 +0000
X-Gm-Features: AZwV_Qg4xCZRn6ebTpsQyf1oiKPYkQGhv7VLsovgzCpdoBOU9QpCHpXoiLQKrWU
Message-ID: <CA+EHjTwMs6BzZwtcNjyZnxLb9Gs01B1RcDvo1RB-f2w98eMzFQ@mail.gmail.com>
Subject: Re: [PATCH v9 23/30] KVM: arm64: Context switch SME state for guests
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>, 
	Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 17:28, Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Jan 13, 2026 at 02:24:56PM +0000, Fuad Tabba wrote:
> > On Tue, 23 Dec 2025 at 01:23, Mark Brown <broonie@kernel.org> wrote:
>
> > > +#define sme_cond_update_smcr_vq(val, reg)                      \
> > > +       do {                                                    \
> > > +               u64 __smcr = read_sysreg_s((reg));              \
> > > +               u64 __new = __smcr & ~SMCR_ELx_LEN_MASK;        \
> > > +               __new |= (val) & SMCR_ELx_LEN_MASK;             \
>
> > Similar to what I pointed out in patch 15 [1], I think you need to
> > preserve the other bits, since SMCR isn't just about the length.
>
> This does preserve the existing bits?  It reads SMCR, masks out and then
> replaces the length.

You're right. Sorry for the noise.

Cheers,
/fuad

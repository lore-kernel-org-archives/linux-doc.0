Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DE03ED3C6
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 13:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779198834; cv=pass; b=VcMyguY6WVQNKU4SCLwBBiU0FVKFM8946QJRQ3LLOI8rkM0vQhhd7Q27jAaHi1Xi6iFtynEJt8ik67C71Qzpoisl6cRTW+1S0sYIR6Bv/SPsrirbIfoYKmtnpnqh6VZZuIVLvYaEn1Sf6gZ8Ub1NE4RNIWo267Ffd+BIXO+NJE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779198834; c=relaxed/simple;
	bh=YzdHAhYUrbTCX46WUv58l87g2Iwam1VpditQTACnMS0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eTvhI+pk6NT+TI/bEY4+DXC9SpIcjfScogN2KNG+V8YtCX0mj81nitSrCR5wv0a9MA2krNzodP0PYbtZsMhqelWZUO/2wkEFNnNF9y3LVn6kuU36kP3wzlyO1cOfDAeWySh3dxUsDwXsNGuItj+SPZHLPhLhwUi50GeUDBbjbz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iAOyXM6o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lf+bsMZA; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iAOyXM6o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lf+bsMZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779198830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMJunAX4GgTUnfdlT58BrIL66UezK+YQZcmeEHYrE2w=;
	b=iAOyXM6oQKGCs3i0/y0cFzEni5dv8jqdIw6V7e2MBE0bkr3xUNRQbr9iHLp+yR5eaN4SqP
	NqxK9BdUgdRY0+n+QnyRh3mFZTxJcTRDbRajQ4xnj6AEbG9oqqNdc6067SEQCBkqGGvFZ4
	zpgi17kDbrbtBPPjwyJIMkKWNTkANfA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-HjRhuT6qPrGYZrs7T_HAcQ-1; Tue, 19 May 2026 09:53:47 -0400
X-MC-Unique: HjRhuT6qPrGYZrs7T_HAcQ-1
X-Mimecast-MFC-AGG-ID: HjRhuT6qPrGYZrs7T_HAcQ_1779198826
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48a589c7879so30396815e9.1
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 06:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779198826; cv=none;
        d=google.com; s=arc-20240605;
        b=AGchXV833ARPWil0swzq9n/meShjNLF/S+3Hfpsq0En1NFgojkf9PltIFXiCBPAy2I
         GLpHwOPx2bXhKRpOjKYG8etoiKfn2VE/LGi5rRCC2Ty68Bl300OMDUEtD0JxfRu2TnOu
         kcvzVpv9A3U9qx/FuTMEMzdkpyGvaPNj4z3JsRoMetZ0HsiGOVxhSB/IG98t3NObBF4D
         CRSRT4XH3gutMdQIY4ZgBv3QKBVyvxYmdIfkw4X9Re2XntOIsLW0ino/D54rlDURxdwn
         gx/vqnZicry0Tx+UsNjwHjQCgu472n0j7kiLs/jRM6koLSgBisXoMkPUCEUOYT9BFBr9
         axmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gMJunAX4GgTUnfdlT58BrIL66UezK+YQZcmeEHYrE2w=;
        fh=HYszDUitN2KKqH3hFNZGHVkXdbNqEhYNJQJmJKXBtoE=;
        b=DLZZQbACupwgigqE6BEnnlsMv0GWBrADO9g++spFOZtgPc9cpCO+T+MuLWewIbZko1
         R/gXNh029pY45v2WpZqjwThz/3jwVHclgvEwb2JCUEWYVLB1pFpLBQUuvniTK4yJS6ht
         jjJyez6YxQgBRrzylkqiGdRFcN5/KJLNGYQ3cddbUhzcUH/RyHKDNm7Gd4sNG03RU/kG
         NZXhq2xVcK6wPl9jFQx2qEGIfUm+KJiKM8MgF5ElLov2p/ycgNy/eu/t5BwcgODHbFXd
         yr2PJabv0iw5diNIl2aJhca9U5pSWHYjMIHz7sRwImYP+uEZeH3JnRP3ttXZsttet70Q
         L0Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779198826; x=1779803626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMJunAX4GgTUnfdlT58BrIL66UezK+YQZcmeEHYrE2w=;
        b=Lf+bsMZAXbnC39c7RHH+LcfzXLWB49fqiRtduik4NRRfs8PaWKKVq+l5ZPVCCigUw8
         6BNamJIPAnXG1pkfQ00cr3rv0p8XNdh2K9Dw0V0+N77TxcRPbtblKE2LX2/k3L/7ij3/
         toEXYxggaxGyelUcnJ0F1z5kfA6M9UxKXBvfXx5jWqjBBjMzSCXpXavrZBm2umlegWCh
         Jc2RKEanpHA7ijDxwwzL1CYS3Fa/qlyQl+N+SleJpudgXWStQxf6YhRs2JbcvyZft+Vj
         ePtLbFk6/psX41kk5+e+X4U2vdft13b+9Y8bBi7QPH+JZ+sQh3SUbbwzkIOrNby4Uknb
         hFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779198826; x=1779803626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gMJunAX4GgTUnfdlT58BrIL66UezK+YQZcmeEHYrE2w=;
        b=YI749NwZmAvEi2BZA9qML10xh1jejD4mnOcLbXsyeaGFADKoW6JzMVWhQcY/KvboaC
         hkfrdtVPuCr9lY4QBynJppjFt9T1G2jWBnrprd1nqkKwPFmKu+JHKKC+zKjV+3mWbZTT
         TPCko4Ig9sg+8HOivtHDRWcSf5DUEWc7C/RQyaH5wlqcKqo+NC6qE6N3B/bNTEt5eouC
         nEc65bVziA9+q/LJkveSIMO+fsnSrATZWezo55lhPYDnc37V4J9Xf03P7HU2ujVAAXwe
         xp15RNzYlu6FE5t5H0uiH62duiAcRTUzxYpCUQoEsoqaJ7POe2N3XUtbf74L4OujYpS/
         Qxyg==
X-Forwarded-Encrypted: i=1; AFNElJ+NcRPStTvQqaKZS3cUm217A0u7ZFaFp7gDzYFHsJ0/L9vsvdMFpdzZQmbfLGLySY9d6VO2YLdk2P8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+P6IYc45l5tNLSHna0TzVUplsLITWs2WPEXNXqH+Miyzp+uAO
	JMIXm/uiv9QVWzpX0hqndYmz/tv/tPebu9FSF05VaIHeA53hkdJ6/tg2UxoiRg7ZXxCSTN/7o2K
	jPP7LEzZIkoQp80DCVTGymJo1p5L/Fpe4oSRoSkyWB3V++nYSMlgsa3V4HhWRp9BFqYtxrAC6Fe
	2d0OIE8sOfvxBC+7Hg+H56+PlOvTGzak3fluRr
X-Gm-Gg: Acq92OF7BsBP0cMBgalIAylbjl3+JYfXZw8Y2PCWMbgRgDohL2UsfUdxRAETyhQ5Yvt
	HDcIDnJqCgZ9EZnlSDL800GUTGCQmysvY/kMS4xiZYWnhUeGJJ5XEw0JmW5YB1G80fvr5hiQ9Vq
	xxXbXS+kdYTTLXsKwmJEgNwxrTXRCOR0Jp8x5C0c3gxGwzOsCd1vk7+SAqQIqmC2NpQHehOqIBF
	Zch9W7KWGVOO2IPnWkeP1ohu+SouF5xyZo3YdPwTK1mjp9pOOGZKeFbhF+m8SVBn4Y4tE83Dz5O
	rF8q/Q==
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr159587255e9.7.1779198826432;
        Tue, 19 May 2026 06:53:46 -0700 (PDT)
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id
 5b1f17b1804b1-48feea99dc7mr159586875e9.7.1779198826081; Tue, 19 May 2026
 06:53:46 -0700 (PDT)
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
 <CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
 <86qzn7wp3y.wl-maz@kernel.org> <593a782c50f3c8656e13b36dfb975a67d43a908e.camel@infradead.org>
In-Reply-To: <593a782c50f3c8656e13b36dfb975a67d43a908e.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 19 May 2026 15:53:19 +0200
X-Gm-Features: AVHnY4J8OrpUxEzodEMJc7lM9sDn1bgq4nXZ_hmQu7D8CU-GrOTBpsMt27h0TJk
Message-ID: <CABgObfbS-z3OphDna5W_JQPvw+OK=yXJurVMHp1ANZ5uGEgVhQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
To: David Woodhouse <dwmw2@infradead.org>
Cc: Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
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

On Tue, May 19, 2026 at 3:00=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> Or some guest configurations which have only ever been tested under KVM
> could have a bug where they *rely* on the registers not being writable,
> and write values which are inconsistent with the rest of their
> configuration. Which breaks the moment those registers become writable.

Yeah, just having guests that worked by utter chance - but you still
don't want to break them - is the case that is most likely. Crappy
code that runs only under emulation/virtualization appears with
probability 1 over time.

Is this likely in this specific case---probably not, honestly.
Christoffer's patch dates back to 2018 (commit d53c2c29ae0d); *back
then* KVM/Arm was a lot less mature, and people developing for Arm on
vanilla upstream kernels have moved on from Linux 4.19.

I would still lean towards accepting the code considering the limited
complexity of the addition (in fact I like it more now that it uses
IIDR instead of v2_groups_user_writable, but that's taste).  However,
there's a huge difference between setting expectations based on 2018
vs 2026 maturity, and perhaps that's why Marc overall is inclined to
put this in the category of pointless bug for bug compatibility?

In any case, there's no arguing over this documentation patch, which
is already a good thing to know.

Thanks,

Paolo

> And those hypothetical cases *do* happen. All of the time. There's a
> massive zoo of guest operating systems; not just the major players like
> Linux, FreeBSD and Windows but a whole bunch of embedded home-grown and
> network appliance kernels.
>
> Nobody is claiming that we shouldn't fix any bug ever.


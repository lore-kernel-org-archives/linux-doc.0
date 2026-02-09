Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654637E2F8
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 15:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770650337; cv=pass; b=o7qUgKnFp2+AFD8enlI1reEl8ehH3xD/utl2NcfqdPXg9cmvbJw2VJAzdGgbOb+kx8y8MwjlBrjwgHqJ14/qRShNYoZtGbvLRx/US+wmkTzlPDE/Q1SCtABC4j9fF9jeFAhb9r9+3tywJ2kEyP8jZW0cfkkgdraYeFg+pT0E1Hc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770650337; c=relaxed/simple;
	bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sLu5vUwsbyoH+rTqvPQ6N8CuoH9FM4eBR8Kkcm7XC0u94jjtuZ0IHoEYOUpvFXg1cr2LfYfyxdRG0FuBMHGL5KVdXOz/18V8jWlLHaqy09UHkMqmFrCyir8PbSf6V8TJCk3s7DSoWf0oVQi+LrKs+ReoDQ7SRCIDMTlVtJ6urXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LKoGnH63; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LKoGnH63"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7927b1620ddso64526467b3.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 07:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770650336; cv=none;
        d=google.com; s=arc-20240605;
        b=GZA2PYO4BCsgxEyxrRoFiHaCZuBeECHkp2/k9SFAKXdBmXEh+iTBdO5ax4tUgNLrmR
         p512B6DunVbEFFAGrPDNuito819vbQ1ZVPTdBVNJKsCg6kwdnuevhJuYWuG0guIXmXPD
         OkQS499o9Vo6IhHFKnmPQ8zig2kZgCkvbHmhxQ4woB6fqZawbbeNUuOb2mu49n3Z89gJ
         RMuLDMHN5sWX5aCwTy9kOK8iXMyCcNpW10gxfHvo7HBg1gou2u+MvwA8COWCehjTkS22
         D2vkkjf0UR30mn6/u7pw7TAtdBGyhm6+VmccRfUoJelB4dYrUuFWWd4TZO7+tvYHw2pB
         p2KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        fh=WsHOXDl5JLbhX9qaaXvpQwnGNYjPqkvJTzEkrF2mbfA=;
        b=JNokxtvFon1oAzfeTimh+47DxKKGOegS+xIPo2BGDDtWgdIrq4+E6wbUC/LerYAJS+
         CMbrKW829pCanLdGESFQdYRpW95AWP26/JENb+T8ecg2nvzT2ETi5kWzS6YePunbvcf5
         90282ue9Pr8t+mFC2pONB8AEdHv7CqQQaMOWqfZhmzytymr0hChbJF64jGl4v4i5YwBK
         5bzC+ts+3RVWuesIGnArw2yRnEdizOU0T8Mc6n3sBtr6FYTrWSwcCZ3oonKpmOJxf16e
         iAKcyM6PV4aSpYOelMxq2TquSsn2evtG3lOclLN+lkLIWIW9C3OkiFoslqOpWkH1awWq
         8dcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770650336; x=1771255136; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        b=LKoGnH63YlYTTc2EIEVciBLSbEozVqYrEQBhkRJIkpiAtwcmgege5rWCHdYgIz6CZ/
         KLC73lgO1wpVMp19dGD4PfVCAYOqFQp2HSFIVPmRT8QvDvj7TyOx/yF6xGUATLAYJv+f
         Yp6XuheWTZhNVWe49qlpUGI7GTWmO0Xk1BFbILzHm2bwipWkLNrgoiQKQJumvOU5b6c9
         tkLIYzmYePQJL7+FxatCuXFWFpujuYzclSemiCpYhtI++E8QWZzWB9rn+yBWUw9aa2gN
         6GVNeQpMCdNB9i3So36vnniCPXmys1AjdIHqNp1BPExc8ojus28BCkacoD6wR+CUBb0P
         JtOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770650336; x=1771255136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3bUDvDDCERCxLHccqCKh5cXslCrqGzgEb8uS+QsJ98=;
        b=BHf9o8/+9euK+KvxsIJuPJChS2Nsh30TQg3kuZazZYqPQiVPQKFP4jDYJlf4JB8p15
         pQqS669JdRDNMP88qRahlVeBpSxuhRgtqXTNgcpPR8cOwwie6JSvbjj9wjRWs0c6hWyY
         F6zlA0t4H0SZkLQf2oIWutri3oxkmRPGeFxyKe43jA1kshA7EWC8Di9dedvgn5OHCXZj
         0AHVMh4apXlurltgaeBPjIM+8YejZt0hk4Akp9myKCqrOzXcbQz1he6LjEvhNzYRXuXG
         wvV+UGgO5Uj25Kfvy3WF2r6xD+v4hrGgHKEqSNZG+0truhZPmK2ENz+7B0wBepcPDoG/
         PIeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRvkvIlb2mMsvZEkOtzQ9P41Z4Mx0U8+BNomAGfLAARv3VOdmFc1C179tT4D1m23OObiHtdZsl4sM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjJrQBSCDkb0fk8ltKATQPddDmD2SjRcUwMjm+JE2suovB2M0G
	rVKUfE/rc0ABfPB8nWXeV/3mze2gIL9/pcdJjrfOOqHO9w4s26ykHySEqU61AEt81b3adlfuAOg
	Wii9ZD5mkf51LXg+GzR0+Y4fMv6P1BQ+NcEoRmxRlhQ==
X-Gm-Gg: AZuq6aISe8pMq69GaIWaSY6lfSwkwIKdQmOxtqgi+HJVgVcxdFM+o41wO4MqOSn0+oR
	G9y1UiJ7Y1+ehwSrCVOzwR10iVcRrZrTGXXImUr+N2cjl+wUjEAjw6rMeMEGQsi2gihAyPJ80xa
	/ni7DkIfE3r8s0UYvYEHBZwzO8Ai6Fh265/r2GXZOIrKKLZPgKW+cuAYP/nksN+VU1OInv1PwXD
	WlueOH9ARb1oZUOPMxI3FISSC/seUPst0+CBfuimN7RA0Pa0Hddw1gQkvnrHnWRmAK9aOpIWG+Y
	dm+tQE+Ud5HEblNYJWgo8DQkfec7cnz9tGWc/SrA1jhnsGAvppxUiRs=
X-Received: by 2002:a05:690c:e08:b0:794:87bf:76ef with SMTP id
 00721157ae682-7952a63ec7amr99106367b3.7.1770650335943; Mon, 09 Feb 2026
 07:18:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-kvm-arm64-sme-v9-0-8be3867cb883@kernel.org> <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
In-Reply-To: <20251223-kvm-arm64-sme-v9-10-8be3867cb883@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Feb 2026 15:18:43 +0000
X-Gm-Features: AZwV_Qj3JfZxsU8iVNrT9S4IUwlHEkuMD3WG7W3HRrHxULDnwFPH-_uH0mM-meA
Message-ID: <CAFEAcA-nhHdwuQODmT4-dBCEuiut-jbHsCGVYByoMF77-UWbCg@mail.gmail.com>
Subject: Re: [PATCH v9 10/30] KVM: arm64: Document the KVM ABI for SME
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>, 
	Fuad Tabba <tabba@google.com>, Mark Rutland <mark.rutland@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Dec 2025 at 01:22, Mark Brown <broonie@kernel.org> wrote:
>
> SME, the Scalable Matrix Extension, is an arm64 extension which adds
> support for matrix operations, with core concepts patterned after SVE.

A late reply, but I just noticed that the cover letter says:

> Userspace access to ZA and (if configured) ZT0 is always available, they
> will be zeroed when the guest runs if disabled in SVCR and the value
> read will be zero if the guest stops with them disabled. This mirrors
> the behaviour of the architecture, enabling access causes ZA and ZT0 to
> be zeroed, while allowing access to SVCR, ZA and ZT0 to be performed in
> any order.

but the doc patch itself says:

> +Access to the ZA and ZT0 registers is only available if SVCR.ZA is set
> +to 1.

Which one is the intention here ?

thanks
-- PMM

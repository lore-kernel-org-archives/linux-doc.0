Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD21415EFDB
	for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2024 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713973495; cv=none; b=Zmrcnc6hOT6wzqRSBmray2LaOEuxkygcL6I0/rxeIbqI/PAaRtL7jGkWxxyCM2EiW8i9Lzh4piw8lBWCT7l4uZV9TQqQlKf1+uHcR4ppaifWD2mNAQGg45Fbw90/0SLU6lZWvpfgTLiOGRIA+Bs5tg0Lledq6Bh9MlcUr/pAo+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713973495; c=relaxed/simple;
	bh=i+7ca9F3R2iODML9OguZS+G/rK7IFeFMp6FII54jhQM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ADg0SVm5n1ud5pDQ83meMP1nUo/YF6kVP9M4HJ4RasRe8ZvgYyo/OW/fACAxybG5LAT6PMZgv+CHDcA9zRf+pNJ52HTllZUOkH3s0KGWa1xkBLj0H4gjmlQxy/UzyLAJT21E/0njAWHWNVm0iSjMRcW9tpHdcpEyMUS8Acz59rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xUGT+1kw; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xUGT+1kw"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6edddd0375fso41457b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2024 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713973492; x=1714578292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isygqxg1DADtvvMpbUH5H9PRVRX6wRPPjYc9YMzxz5g=;
        b=xUGT+1kwxEzpMO+O7wS1ziGG9K2H/oUFR7Sjkm1ASnzzl167N+t2sa5pNS2aX5trdE
         rAkedHiECe05XtwIaPeWAYpNC1rZn/jJRJ+Li5R+WhGLG3nKqHGm/diT08GXCeeZgJrB
         6AsjghV6g2LGmo/XYbas1sIWU7Zknc0A5N04cEFYZTyqByNrn1JtlHnkju9UBQ98eaiU
         vK2cUKf+WC3GAl9Cb0aIItgxJ3qy7/tiRBoZs2HJwcb8oI0397cd6tLt9n2ZZdh+ZSEk
         Aao6DWFijn0is0JoFHGVt/7Dt5nRbusadufSYj7kBy7+ruvU9dvI/MJrNa2Ky5/o08wa
         YhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713973492; x=1714578292;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=isygqxg1DADtvvMpbUH5H9PRVRX6wRPPjYc9YMzxz5g=;
        b=u8saM4mV/o5/HzJWuDzPW274P43V9DuXZGVxdV6S9PYijs+7q95SrzRqtkT07jYSry
         MjFMISnLLHjmEId/hdHikX8O1ve3h6erSd/R+nERs3M/pWa8vs5RCDAJRAp9+tXEAliZ
         i+NXkwgAAPRNQykx6ad1J/uitfQLw9+EDZm4veKJ1izZCkDUGSzbpUpTPJ83BQByBHR8
         REMHwD6PjtPU/jaJNui6aTo6+GXTjSwr9NmIvGm3JVlwhkuqYgZqfRitNknXqFlghl+K
         koIthZP8FEId6FNk0JWbDAX2pX0iHqH2AFjLL6aQkl+/9s027XMq5dO0cG3Jpj4m5kY/
         iubQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxSiy1FUEq3X5s8fcAJSebubw37c29vtVR669jnSbcwarxdq+mZHDlLXaXpQHVaxG8XoEXmGI3yonarCcgqfO4kt53G/HEca29
X-Gm-Message-State: AOJu0YxPevUYlL4B8WFz0oN/XnT/6wcetDwYjmz2hlV6ITBuU7DLCtrA
	oZ9KEYQTQwSjGaOKjCF/BnEuiOXpeVzkvjBZjeYyY34h4orCaiqTE0Ie+gDairZCi8h/2Cbr0Jq
	jbg==
X-Google-Smtp-Source: AGHT+IHS0BxqB9PcoPfboy3NmQMn9RV38ybNDU7Su++NB70GwISBmSLNZI5ND+4qFNSlwp+C1XSavho+YNM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:4656:b0:6ec:f5b8:58cc with SMTP id
 kp22-20020a056a00465600b006ecf5b858ccmr437835pfb.6.1713973492116; Wed, 24 Apr
 2024 08:44:52 -0700 (PDT)
Date: Wed, 24 Apr 2024 08:44:50 -0700
In-Reply-To: <20240424103317.28522-1-clopez@suse.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240424103317.28522-1-clopez@suse.de>
Message-ID: <Ziko8vNhTeOdfXNu@google.com>
Subject: Re: [PATCH] KVM: fix documentation for KVM_CREATE_GUEST_MEMFD
From: Sean Christopherson <seanjc@google.com>
To: "Carlos =?utf-8?B?TMOzcGV6?=" <clopez@suse.de>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024, Carlos L=C3=B3pez wrote:
> The KVM_CREATE_GUEST_MEMFD ioctl returns a file descriptor, and is
> documented as such in the description. However, the "Returns" field
> in the documentation states that the ioctl returns 0 on success.
> Update this to match the description.
>=20
> Signed-off-by: Carlos L=C3=B3pez <clopez@suse.de>

Ugh, copy+paste fail.  Good job me.  In case want this backported,=20

Fixes: a7800aa80ea4 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-spe=
cific backing memory")

Reviewed-by: Sean Christopherson <seanjc@google.com>

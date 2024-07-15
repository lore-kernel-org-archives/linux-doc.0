Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656283AC0F
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 21:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721079480; cv=none; b=pNhPQ2urlI52l7nMXeC9A73jh2pSwUz2l1dKbZoUTJ7d/aT/LccOs167bXybvVfYJW5RU37iWBSJC5NGzBQao9gDC2Pwe12cRXHtTgC+2oYV+A8v0o5K0SKrcYCDN28P+tZaRP0+XcF/O50H5anGHu/pno1nLp3ea7yJilEfbvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721079480; c=relaxed/simple;
	bh=XdO7wIyX46Gc6A4zpOoYKHrIE5C8ZCiQW+adQqLkIOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IfSlyGj2KuZmnzKny1jrKF61AH7tI/oZrFHPN3WAzwZWZ/JMRInCS9QH4Uw4i12CZIu8L8xh8gORUIMU0axkkSx2mb3+xYFiiI+zUe+LJFSwAvf7SNNsqvzl1Msc1iGYXNUttbjKsrRu38O6YQYxuu6z9sRgfoENnFW8y5h4OWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gt7UYiuZ; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gt7UYiuZ"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-25957dfd971so2375999fac.0
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 14:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721079478; x=1721684278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYT7RZte+jpSY6YDB1OuEYOLCT1GQosdmk1JeVvIqQo=;
        b=Gt7UYiuZMpSUFOAnI2A2VIqiLf3ai6Ckptsck00+Y7szPSRsJC9D5MxdZP3ttNTWmf
         8ULv4xWypebnfH1Vvci17QIHiAL0Fr7HrWie0erviyGsyhiR/LgtVtWG+PCJNfP6ZsbC
         W3Trv4vA6mByS2pI9aUpQv5Fj6bMUv/3JQuIqpE8BZh5bAs58kvCMh935p233MsS3lWZ
         76lTjTJwEXWlf34RRjn0DLOJVmB0skICLhe4hsnl2PffhANYFKxpy7E2QeUD2QddKmLb
         QAnmLWjWRx0ZaEZ924rxXx8hiw6PBdbSUj2WMQDbs5ToPxEGP4ZPofV3g/gxUIK8gIQW
         nlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721079478; x=1721684278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYT7RZte+jpSY6YDB1OuEYOLCT1GQosdmk1JeVvIqQo=;
        b=MDTNhIzBJofJN6qdkpZyTHs/asyOd/6fxjkmtpbMKia9+z0vRFIHVuQMFSIoh3h9AG
         DjZezxJSph8+zTFTUYKum3Z0FW6Qqos3w1GzuMRDbfkNGIhu0jLsaGorbSRGq0wgi9E8
         hZtoWRVsXTkohTuc5j25stGxjp4xzDHG669++WlBebo36RnfTo7hiJV5uwwzt+8M2qsB
         Imzo3ZEVT/2J2mnuUXnhTv08aEewPZXAViyXAy0JXexuk2vIytDpZsTApLFAelH7kL0N
         NsqEjpgsRrFQgWg+IoQUS7V4ifPE6H0PgZsFmnrpnA0uKu00B5RHg4aXYvhcxMXJf9gj
         Ru1g==
X-Forwarded-Encrypted: i=1; AJvYcCU3nsk2cl68yObZAcMGSUznEOqtxW56Au8HECmyWuGG2fWy63ssB5fbJOnCx/vaA8ewLsmVuMOgj4y0EuIQEafR7o/KuIi/2lJX
X-Gm-Message-State: AOJu0Yz1hdYM4OvwWkjVteCBl2v+tbD9RcwI5MqUghJvuGblYCeOxWhz
	nBFRFIyqzM9MWyw7PhynLCywLnWpXfmBc5Qj3N4A6tKnSn1+XsQrFNueAQjNRqvQfF0nwN5+Ea0
	tvMmpqdp2ONbtFgXLnD1DcAyDKjzTuVLp8sHj
X-Google-Smtp-Source: AGHT+IFo5Jg9Iet8BbL/iNTVTBM9bSolkTbUgSvwA/5qBUXi+M06ocwSdrUcSEL7avW0kur1t8VRn6Y+Ut7Wj828r/M=
X-Received: by 2002:a05:6870:390a:b0:25e:bdf7:2883 with SMTP id
 586e51a60fabf-260bde68931mr39462fac.25.1721079478153; Mon, 15 Jul 2024
 14:37:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com> <20240710234222.2333120-3-jthoughton@google.com>
In-Reply-To: <20240710234222.2333120-3-jthoughton@google.com>
From: Anish Moorthy <amoorthy@google.com>
Date: Mon, 15 Jul 2024 14:37:22 -0700
Message-ID: <CAF7b7moeOeJEv+zPQ-VQrP8M+O7r8Ru3GZjfrAKj25Hc0pQGnw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/18] KVM: Add KVM_CAP_USERFAULT and KVM_MEMORY_ATTRIBUTE_USERFAULT
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Peter Xu <peterx@redhat.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, David Matlack <dmatlack@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not to nitpick an RFC, but since the stuff in this patch seems less
likely to change I think you should avoid using #ifdefs

For instance

On Wed, Jul 10, 2024 at 4:43=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
> +static inline bool kvm_userfault_enabled(struct kvm *kvm)
> +{
> +#ifdef CONFIG_KVM_USERFAULT
> +       return !!rcu_access_pointer(kvm->userfault_ctx);
> +#else
> +       return false;
> +#endif
> +}

can be

> +static inline bool kvm_userfault_enabled(struct kvm *kvm)
> +{
> +    if (IS_ENABLED(CONFIG_KVM_USERFAULT)) {
> +       return !!rcu_access_pointer(kvm->userfault_ctx);
> +    } else {
> +       return false;
> +   }
> +}

(however kernel style tells you to write that :), the cap-supported
check can be moved into kvm_vm_ioctl_enable_userfault(), etc

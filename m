Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83D416C879
	for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 23:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720741987; cv=none; b=CwGiFta1U79jeLRBjSVpYn9E5Mt++0g2Mg2CEMI5ma3pnjziApX4UEW67puBA0t0043fInoe3dGcvTN1qxmdk4CSupeFvvzyBXrX2cc+h8+txqWJL02PXnc+egQZypriDMeq1f98akgyO00eFz1894Egw6DG70ehdpjZ76S5Iw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720741987; c=relaxed/simple;
	bh=eHwJddF+i82eOhfzBTfbWQn49KtPf7X+mrBUinBbdfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l3NivrjAXyLC3AZpW0AX6ki588tbzzjBs1iY61KEiT4d/x/plsNDi++6GdTeYA2VHBaeTBEPdHJ2sPomoJQjkwAH4K5THGdY2E1kSjEcyyy+YxhwaZ0xgvZ+hOVDxw6uBdW45LoSM/xc03yfipiE7IYBA00tMrDs4E/U333iOfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S+/L+bZg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S+/L+bZg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-58bac81f3f9so1824628a12.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Jul 2024 16:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720741984; x=1721346784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1ii8KLMLxRl5UF5VTiJZsw30BNj3HWI5MJg1fOCFrg=;
        b=S+/L+bZgkdvJz05Cm9iyiIJDNm355VyPSA9HsiMLiZePQFhWs/DcuEv9Z0lRvRBJXp
         guoj09t5IIQW2MpNUCgrlm5qgH3wF6HThmSWHv0ELUuBD5V0vSRXXX5U5Vbmb614S1lF
         9XgXKONT+TSjTnLj/MJxJUSV3h6nWye1mLgO9OK6JEsGV8r+hymtICdfta7Cb1GWWAhO
         OppbjFfIfhJZ86SzrewF/axThpXAlVYvncLP7Qz60FObvN80dBBPn69O8VeuiS+WRT8y
         +cRp2OSB2287rjKizRLGuA1nSo6RaI2FiaEIdA26v6OudFPv/q8yfkFmYNHlkzuhM+gP
         5v2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720741984; x=1721346784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1ii8KLMLxRl5UF5VTiJZsw30BNj3HWI5MJg1fOCFrg=;
        b=PFkBhmo6xLMHsK1zVdsFlSsduwPQIlk0CuXMo8gde40IYnCuwRhZhfZ0aQVHq7YbYW
         tgSnNS/n9QGcB3LWeWNx1sjvJLaNoRo35i78W4Xm4uSezpqNAz0GmMzFoZGFAMbwcKTX
         PoOFqiiukb21Ipzc2qHzrY7hdFXsJD75Dn4/cKaZ6BENF5D6ajiZfhOtBlBbF0VdBBuW
         1Skilc6mR5xBCwc00TBKsBmfNT4Q53pKX6SK+DmzDUIepOucl7AwMj3KfmygdFIVpXUx
         X+290Ki74EdVZJZL/sPMjXKXpz4zk0FsIRtHH3yJHaF98VjtsktkP7RKbYaU5HGx9nEL
         eQag==
X-Forwarded-Encrypted: i=1; AJvYcCW4WgTklXMfYar+Qx8seAK2huw//b/Yt99aQ87Nv0jBpztSiZ0McOu1jIBlmvHq/KoWrXTKYOPKiwYuu9D3XM5zjAafjDIdhTg/
X-Gm-Message-State: AOJu0YyfJ5xIjWcUjKWOplOZ2ekk8RIHxPHxv/ZEcjW1DoXgCXBvNcse
	fxVfyjev02xgcSN1hko5EFfXcHFe1Ee8pLBk+/h0qWOrtvuehgiWwJMddz6lWRcDRuPhjKMi1fe
	kxgWdgGdsr0DIGd+7FGUM4HRXScavYVRXYtyQ
X-Google-Smtp-Source: AGHT+IGg/L+LIOLGS8JdBlkXQAM9OjIKvUIv0USQWI0ixWzGE8fSPNkcsknZoKiaKzNv9LECa/JaMTAQzxubG6QsFVs=
X-Received: by 2002:a17:906:cc9a:b0:a77:c7d7:5ece with SMTP id
 a640c23a62f3a-a780b701683mr557985866b.35.1720741984043; Thu, 11 Jul 2024
 16:53:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710234222.2333120-1-jthoughton@google.com> <20240710234222.2333120-15-jthoughton@google.com>
In-Reply-To: <20240710234222.2333120-15-jthoughton@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 11 Jul 2024 16:52:38 -0700
Message-ID: <CALzav=d=LaVCFTLxzJD8C_=6+fxjsoLxdKOnxKBgn_QdNDOoXw@mail.gmail.com>
Subject: Re: [RFC PATCH 14/18] KVM: Add asynchronous userfaults, KVM_READ_USERFAULT
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, Peter Xu <peterx@redhat.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 10, 2024 at 4:42=E2=80=AFPM James Houghton <jthoughton@google.c=
om> wrote:
>
> +       case KVM_READ_USERFAULT: {
> +               struct kvm_fault fault;
> +               gfn_t gfn;
> +
> +               r =3D kvm_vm_ioctl_read_userfault(kvm, &gfn);
> +               if (r)
> +                       goto out;
> +
> +               fault.address =3D gfn;
> +
> +               /* TODO: if this fails, this gfn is lost. */
> +               r =3D -EFAULT;
> +               if (copy_to_user(&fault, argp, sizeof(fault)))

You could do the copy under the spin_lock() with
copy_to_user_nofault() to avoid losing gfn.

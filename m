Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4230A28BA98
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 15:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445036; cv=none; b=Rhgw/s6Ue1DDgiPZ4P7eJj7J/yCSgTBO+HFtfnVkOspBUAP/+q9UDqyUVU/4Td3Te3oHt1hddl7xXj8Iql9GtoAjhdTx0B/tL7DW/cNXJhO+dkPa1q+bjiG2xZg55B6kMkAWchFTY0YQv1a0rh6gb5U/pireh3yfokY1teXnV10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445036; c=relaxed/simple;
	bh=oRij2I0TpTX32X/NhxasXgfEJxa8A5RThaAlheT8LBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YM2wP07+7QRFd9Sf3m+cQPkZxI60W+LoFacyuy+Ovlds5BQ2hiSQpJZA1PB4A/iRaTYASjB+891xYJp5nVOGXZlx0rj0nP7YdKnnWDzniZSb6PkeOYRdrrTuQA0vOMmHOtiN7MTZ6dAm3vIhc1rvlK6krKJC09s2ozrNZa+5eGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XSHUHdzh; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XSHUHdzh"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7dcd60c092so1440559276.3
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748445034; x=1749049834; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mkOH/F0mBjSGdYPCUEiDsSIcD6SIWcpvbL1Z7KSMawk=;
        b=XSHUHdzh4M3Tz1CxqHeZu5QTLHzRV3Z8TIcZdNftoj7tZJUy1qxF7vAtEIvnAlUmTE
         JdJ/7C3uWpNaHD7A0OgWrMpPOQSSOCNiRkVqlgam5TmRHWM4uNeLXI4FgN4H6pg9dvOc
         /YNI8k4NDPiydQqZD4S9zOl+A5gQDsBNgNtowZwexAva5z9XQKZLChtezIFfZ061EFpY
         aTQxb3ee98rHEGg85oBwRrIFAsYtUYTDRDOXQOgCJGmEmWCg3qr8Ez/LcFK8QZoqDMEJ
         rvqjRx5+n+1UF3ppt/Do5fixTZf9bDsTo9IdGYvIVYoXkmMrod0ABMGWssVFg2SXP5JO
         1yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748445034; x=1749049834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mkOH/F0mBjSGdYPCUEiDsSIcD6SIWcpvbL1Z7KSMawk=;
        b=aJiM5gRrWMS3V5dsN68BVliSyESukwbyWuORilIMskuF4MeRHOqJlj1ZHqNcIR1INI
         L3+HQm75l56WTWsKFbfyfrwPdQTpDZcZ+E3uAIMkxSJWTCTG0KyZAUyQZYossMVTKKp0
         4IpLNyixZTkOApLkURLknE2NGJxGjTQkKOZ5V21YGXdFdkcPC+4bpcekEAAsF2ow3898
         qe34ultRbNrhCUZdQ3aXg7Kq8S9Wl+fw3j0Ro15gHa5wY99DmtjaxUiDI9Wyv+z3cf4i
         RRob826EVBVyKjR/v4g8GLvUkyXcsgyY+xsgSC3nduksG36UNDkwI9D/tfCQrZlPaR6y
         re3A==
X-Forwarded-Encrypted: i=1; AJvYcCU6mOkZxAKzBcPK/UtesezpUrQJA6xjczuty8N9jfcTcMZ++qGSwyqo/nZ3YSxx+ZJ5Rpq332ZCXjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYpJQOQvWWCeDudYnM5kxgXyI4YZZagmS3dfDGi883xkWt8ijS
	IV667V7TO3iSwuY/kgwPEzs+9XK4jsuWADYktkbHiqCGNbcIxQN93msQUbc0hvfk1UD8L9nY0y1
	p1QuFC4AnyEoX1IvNG9JQmfQU62uNxpjR/T1BAe5l
X-Gm-Gg: ASbGncvr5MR7Ej32YfErom+BABi2+/jHMipa+LODDxsFowAgbqT+17/wm20jErceJ79
	fVJX+nGdoSiggfy9RdFkQ26srvstU1rb0p86vnvdNzztV7ELxeZCz/IpZ5p1yjbw2sn75K4nVq5
	P6ovrkMYgEAmnkA5RsxWdgUpMFPlm2EoNCRK3SK78mFvf7pLQpacLQ55I82w/mCsFBSYq+M7ciz
	fYbIdkmpuWaa9VF
X-Google-Smtp-Source: AGHT+IGR99lWrX4uBQGr2kH0bGfT4JkEfaCzPmaHW/nbBCSd4QahIO99ZAocGBZAuHyfUiwPf1Ucb1uKFWWP5NDU59M=
X-Received: by 2002:a05:6902:2841:b0:e7d:6fe3:fc81 with SMTP id
 3f1490d57ef6-e7d91b459aamr21754237276.30.1748445033884; Wed, 28 May 2025
 08:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109204929.1106563-1-jthoughton@google.com>
 <20250109204929.1106563-7-jthoughton@google.com> <aBqkINKO9PUAzZeS@google.com>
In-Reply-To: <aBqkINKO9PUAzZeS@google.com>
From: James Houghton <jthoughton@google.com>
Date: Wed, 28 May 2025 11:09:58 -0400
X-Gm-Features: AX0GCFt9PLVfklSGC-mOnCNW0mGP_16cIQYPD6tP1ev5K3PmI8fYxDutOCJrYcQ
Message-ID: <CADrL8HXDDRC6Ey5HYWvtzQzjcM2RNX7c7ngGyjUsD3WiBF3VYA@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] KVM: arm64: Add support for KVM_MEM_USERFAULT
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 8:06=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Jan 09, 2025, James Houghton wrote:
> > @@ -2073,6 +2080,23 @@ void kvm_arch_commit_memory_region(struct kvm *k=
vm,
> >                                  enum kvm_mr_change change)
> >  {
> >       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> > +     u32 new_flags =3D new ? new->flags : 0;
> > +     u32 changed_flags =3D (new_flags) ^ (old ? old->flags : 0);
>
> This is a bit hard to read, and there's only one use of log_dirty_pages. =
 With
> zapping handled in common KVM, just do:

Thanks, Sean. Yeah what you have below looks a lot better, thanks for
applying it for me. I'll post a new version soon. One note below.

>
> @@ -2127,14 +2131,19 @@ void kvm_arch_commit_memory_region(struct kvm *kv=
m,
>                                    const struct kvm_memory_slot *new,
>                                    enum kvm_mr_change change)
>  {
> -       bool log_dirty_pages =3D new && new->flags & KVM_MEM_LOG_DIRTY_PA=
GES;
> +       u32 old_flags =3D old ? old->flags : 0;
> +       u32 new_flags =3D new ? new->flags : 0;
> +
> +       /* Nothing to do if not toggling dirty logging. */
> +       if (!((old_flags ^ new_flags) & KVM_MEM_LOG_DIRTY_PAGES))
> +               return;

This is my bug, not yours, but I think this condition must also check
that `change =3D=3D KVM_MR_FLAGS_ONLY` for it to be correct. This, for
example, will break the case where we are deleting a memslot that
still has KVM_MEM_LOG_DIRTY_PAGES enabled. Will fix in the next
version.

>
>         /*
>          * At this point memslot has been committed and there is an
>          * allocated dirty_bitmap[], dirty pages will be tracked while th=
e
>          * memory slot is write protected.
>          */
> -       if (log_dirty_pages) {
> +       if (new_flags & KVM_MEM_LOG_DIRTY_PAGES) {
>
>                 if (change =3D=3D KVM_MR_DELETE)
>                         return;

Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C762F189906
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751958096; cv=none; b=FpeBi539cHU1lpKS0ZwrZGJKJ7Mpz1/qqiWeViYZ/7lCcAFSr3CTy0/uqAy5q2vulXNb54dSlVU9UQX7nxJvoWXg2LVQK7kTJ+MHopOZD4Re1M9Mm4JIz2bs4X4CR4wI7fjG16SYCJjJlBRFV0Gf8vV3zi5N3bEQkfXipEvq2G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751958096; c=relaxed/simple;
	bh=GVI35VAUAT2OMmnoqbZKkT6T+kvJP7awaxKgP9GoC/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhBuvJxt7+/tnHLF7JW3qKjQxrR+a4l+WtEV7fPefWCWap3Y8hkUtJdP+TOpW0n6JxdMaYE8J3e01Xbpjg+DSNaLl17aDbbFD+OsXZpnW9Y9xUG/8S4bBIhcokbR36u2ypSRW7dY1DpfmEJn2k0rreWczsbuqMn2MxI/176eOy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pQCr5zfx; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pQCr5zfx"
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-886c8de5d90so1052013241.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Jul 2025 00:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751958093; x=1752562893; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVI35VAUAT2OMmnoqbZKkT6T+kvJP7awaxKgP9GoC/g=;
        b=pQCr5zfxLUBk3cePF5zhqVC1h4DRrhEkEgYNP7h9lEJ3t/gChCO0E8O4bf8Gi96Ou4
         Bty9k4MjKuub72j2/JwrHVXs9rrN0ivE07r3xkLc1cHCRMpx82T79coSb998D722HT6e
         46UlbaKebC6BRiOmE4fwqeD5Jxc0EZBKBP8g04kXt1lpoAV005InLwKu/AV3AMkVWiMN
         gwjFcBNEnsurn8FOtopmENHXPMQElrEH7NuH/S+1idHXXaPbRRgCX1MXCS69JUF9VnHC
         tDMOM+HrWNCLTJFrwwYALcMPiHUaXOdT3zxehgGKFoynhF3xzClTaM7zLvuLw+/uHMbC
         SFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751958093; x=1752562893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GVI35VAUAT2OMmnoqbZKkT6T+kvJP7awaxKgP9GoC/g=;
        b=U/K2kbX+ce8jcL6OzmG3R3b+Kq+OSwxg/EmCqWoamZ8L8LW8Og3YKKGuyYULZNqmeW
         y7xnxC+DvhWqxgKnW54RGUR5trh3FWaEfuzCY+kg3i8khmZnjZFDWLZhaMR7n0W3WxUE
         S0ouuMYltht2tA63QBt5ONkN/bduBosxGkGsAAv3vVC3rVDllb1lHJpfZ0bQaSzoOJrl
         ++fUBHUp9DD7ysxy6IEXWiHj9r5R4O7R3jtFojlOEQfjv1eYFbx1pbw1xR5lxB4F5sJ1
         PVvl/kMpJdo+xVpf1oDMryUI5/lB7nIDaUwPUPmlCCFrVXyDUOHV7i3EP69RXLUtdtOB
         bH2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdQH/mmpxeUH9D9mVSoQeLm8mPl7j+l7qQSvf4N3qisoo2BnBHeK73hfiOemT+XeMzVddSs3DoKk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQeivm/ERY6ROYF7eLTc73yWmTrWsGLxGNGG84XVngF6xzqhs2
	phBF8jKO4j/MFfHjkIU+1LGDzOpF6BHsR22np6y2VWuT8XnBKWeRwyC/niTndaH105/Keq1MJVM
	T5P6bJeMWNa4ePutPthvAmUWunpVHdXfanjFI/INS
X-Gm-Gg: ASbGncsagtPXl7y4su7qoAMXg24J019hlu9INvYu27P37ysxcpMnWagfunghD6FqBzv
	dGbhSum78AowLwBhQjerP/VsiY4DENUO8J4i5TXa67gekxlZ4XJr3Fm5Nf34by8NOIG7htskb8y
	+nuaEYayHE0TAt7BPYxU6dk28zp8yGcsI6Ozdahpm+sDM=
X-Google-Smtp-Source: AGHT+IERc0LWrrJqbY+cXwFfEV1cbyKesjk8HzVKFdW+ImlmD5ADGt4VqW++1iX27GDXD4M44DAWL7sS4hlCdVzDmKA=
X-Received: by 2002:a05:6102:4b04:b0:4e9:bae0:7f9a with SMTP id
 ada2fe7eead31-4f2ee1ab639mr11116754137.12.1751958093290; Tue, 08 Jul 2025
 00:01:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707105205.222558-1-daniel.sedlak@cdn77.com>
 <CANn89i+=haaDGHcG=5etnNcftKM4+YKwdiP6aJfMqrWpDgyhvg@mail.gmail.com> <825c60bd-33cf-443f-a737-daa2b34e6bea@cdn77.com>
In-Reply-To: <825c60bd-33cf-443f-a737-daa2b34e6bea@cdn77.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Jul 2025 00:01:21 -0700
X-Gm-Features: Ac12FXxC4-Jc2OAV5RNVFrqcHyVllz1xzGsaQWzti7pEOlInSotqzWFdDeN3SBg
Message-ID: <CANn89iKQQ4TFx9Ch9pyDJro=tchVtySQfJTygCxjRP+zPkZfgg@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: account for memory pressure signaled by cgroup
To: Daniel Sedlak <daniel.sedlak@cdn77.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Jiayuan Chen <jiayuan.chen@linux.dev>, 
	Christian Hopps <chopps@labn.net>, Sabrina Dubroca <sd@queasysnail.net>, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, Matyas Hurtik <matyas.hurtik@cdn77.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 7, 2025 at 11:45=E2=80=AFPM Daniel Sedlak <daniel.sedlak@cdn77.=
com> wrote:
>
> Hi Eric,
> Thank you for your feedback.
>
> On 7/7/25 2:48 PM, Eric Dumazet wrote:
> > On Mon, Jul 7, 2025 at 3:55=E2=80=AFAM Daniel Sedlak <daniel.sedlak@cdn=
77.com> wrote:
> >>
> >> Currently, we have two memory pressure counters for TCP sockets [1],
> >> which we manipulate only when the memory pressure is signalled through
> >> the proto struct [2].
> >>
> >> However, the memory pressure can also be signaled through the cgroup
> >> memory subsystem, which we do not reflect in the netstat counters.
> >>
> >> This patch adds a new counter to account for memory pressure signaled =
by
> >> the memory cgroup.
> >
> > OK, but please amend the changelog to describe how to look at the
> > per-cgroup information.
>
> Sure, I will explain it more in v2. I was not sure how much of a
> "storytelling" is appropriate in the commit message.
>
>
> > I am sure that having some details on how to find the faulty cgroup
> > would also help.
>
> Right now, we have a rather fragile bpftrace script for that, but we
> have a WIP patch for memory management, which will expose which cgroup
> is having "difficulties", but that is still ongoing work.
>
> Or do you have any suggestions on how we can incorporate this
> information about "this particular cgroup is under pressure" into the
> net subsystem? Maybe a log line?

Perhaps an additional trace point ?

bpftrace would require to ship a separate program...

Ideally we could trace the cgroup path, or at least the pid.

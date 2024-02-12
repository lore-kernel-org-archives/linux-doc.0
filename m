Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698383FB30
	for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 18:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707762072; cv=none; b=eYy0JEslWXEoLM2SvwCRr141w1dKq1gr2A9eo6RxpgwS6dFK/XszfT6TSjlYX9jzleDwdCUwTpOnI/tiry51N5xtzp39XNE5PBemOzakcPLySqFgKwqY2uBmXkD9FPr0Jj25WxwCIFq71jEtxxhepiSuW5VsPNVCEsFPjxcyDvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707762072; c=relaxed/simple;
	bh=Quv90+T3dAOOagaLIeJ9QrwDVUG7gl85SK8F/SFSmzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HInaGU6/fDK8B8yBJgyg94hhRbr+kTtlrf8WMgAuNjYIp+YrLW50ppphfob4smSYpB/Asb8OjZDYtDJkVtFMvJJexNNrhBaeLhbvBiAPspJuz7FZqV0fW+1Rd4H254PRKJSi70OJK4pTVqIXtxT0BrLklD+AWW9LtN8NxwpB+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f0uugqXo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f0uugqXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707762069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Quv90+T3dAOOagaLIeJ9QrwDVUG7gl85SK8F/SFSmzs=;
	b=f0uugqXoJPkquoaCcGoacbG7o8hauqg+O+XrM3LlTfbAFlsC73S5byPI+H2uZi6+eS2Jgx
	GwKNiQ5utJM0+8AI2zKdG1oyFd4/H+4OqzBuDH2ptRZ3bSRoczFoYD/G2LIIlfWasgPQZn
	l6Iy6idSV5xD+H7dAeXgiR0sMoiJg8c=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-mFg-6I6bMxCPdwMAdCtg8g-1; Mon, 12 Feb 2024 13:21:07 -0500
X-MC-Unique: mFg-6I6bMxCPdwMAdCtg8g-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2d08eacba7aso38032341fa.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Feb 2024 10:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707762065; x=1708366865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Quv90+T3dAOOagaLIeJ9QrwDVUG7gl85SK8F/SFSmzs=;
        b=B0AZh7fMyQILRXaq2opQRnW/FjapQeydzr2CCP+rooWE3pdRbochb0tKCCaO7d7hA8
         q9DdTqXxuJRA249fUbP1WRUtgWv7P8yXzbhJ6BzTrJ8B+lIo33nKkeuisiHyktj/SluP
         0q0VZFRgjBmW93KjhFL9j7Kol12pdVE3s5oMEOiG7K2txYkl6aQ4cxl8U0qWFCCsGQKE
         VrxLqv7dNw3sqccTK8plBLMPYz+1l3THzMfOYHoHXNkzvZNx2HxJ7nIjU1ne99LLhRB3
         Ge7gI8EFKYZ3vDVHXB6YgHDPEISbPlTfhjYLklsxXU69dOPcZdRR4Z6u/TMXQBUjFCWp
         D3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCULUApS+nFNW1/pdLybQY9krOaVZgfKdAEQX27GjwIyAT1MDlF84JATIBtUPb7rR/AtBXSmgj1/PHoPe2Xsx6FaMvEifhiX1jzl
X-Gm-Message-State: AOJu0YySniZX6u94T8ovrq2ryf4ECXNiwy8pPyGaq2cLPAZGyRRBw70n
	HWZoI6Z4XOqN3nm5IvZ8FRsdIKk1a8oJ6n+MKPrCV+gDxpSksdZRntzb9cZI53JkFXFGMohERPq
	++LT8yDsM/au63JJgKP9Y7O2WGph23DPyqYMWq3O/9MzGCm6kCIQGU1acLQd+NN7glexLkzKNMK
	D92jQ0OkhzeuYIXuo6x/VrKv9OmJkrMD5i
X-Received: by 2002:a2e:9d02:0:b0:2d0:cc80:dcad with SMTP id t2-20020a2e9d02000000b002d0cc80dcadmr5146932lji.7.1707762065702;
        Mon, 12 Feb 2024 10:21:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVDBBNbKf4ImXQwE8JyZ3fQX074ArrUpqN5YepxpJCPLGSsPy5C7PupjtXSTP89q24mqDNrC0ALqCwbaA+eQQ=
X-Received: by 2002:a2e:9d02:0:b0:2d0:cc80:dcad with SMTP id
 t2-20020a2e9d02000000b002d0cc80dcadmr5146906lji.7.1707762065378; Mon, 12 Feb
 2024 10:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209-hid-bpf-sleepable-v1-0-4cc895b5adbd@kernel.org>
 <87bk8pve2z.fsf@toke.dk> <CAO-hwJ+UeaBydN9deA8KBbgBiC_UCt6oXX-wGnNuSr8fhUrkXw@mail.gmail.com>
 <875xyxva9u.fsf@toke.dk> <CAO-hwJLvEGNRXc8G2PR+AQ6kJg+k5YqSt3F7LCSc0zWnmFfe5g@mail.gmail.com>
 <87r0hhfudh.fsf@toke.dk>
In-Reply-To: <87r0hhfudh.fsf@toke.dk>
From: Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date: Mon, 12 Feb 2024 19:20:53 +0100
Message-ID: <CAO-hwJLxkt=THKBjxDA6KZsC5h52rCXZ-2RNKPCiYMHNjhQJNg@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/9] allow HID-BPF to do device IOs
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: Benjamin Tissoires <bentiss@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, KP Singh <kpsingh@kernel.org>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Jiri Kosina <jikos@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 12, 2024 at 6:46=E2=80=AFPM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>
> Benjamin Tissoires <benjamin.tissoires@redhat.com> writes:
>
> [...]
> >> IIUC, the bpf_timer callback is just a function (subprog) from the
> >> verifier PoV, so it is verified as whatever program type is creating t=
he
> >> timer. So in other words, as long as you setup the timer from inside a
> >> tracing prog type, you should have access to all the same kfuncs, I
> >> think?
> >
> > Yep, you are correct. But as mentioned above, I am now in trouble with
> > the sleepable state:
> > - I need to call timer_start() from a non sleepable tracing function
> > (I'm in hard IRQ when dealing with a physical device)
> > - but then, ideally, the callback function needs to be tagged as a
> > sleepable one, so I can export my kfuncs which are doing kzalloc and
> > device IO as such.
> >
> > However, I can not really teach the BPF verifier to do so:
> > - it seems to check for the callback first when it is loaded, and
> > there is no SEC() equivalent for static functions
> > - libbpf doesn't have access to the callback as a prog as it has to be
> > a static function, and thus isn't exported as a full-blown prog.
> > - the verifier only checks for the callback when dealing with
> > BPF_FUNC_timer_set_callback, which doesn't have a "flag" argument
> > (though the validation of the callback has already been done while
> > checking it first, so we are already too late to change the sleppable
> > state of the callback)
> >
> > Right now, the only OK-ish version I have is declaring the kfunc as
> > non-sleepable, but checking that we are in a different context than
> > the IRQ of the initial event. This way, I am not crashing if this
> > function is called from the initial IRQ, but will still crash if used
> > outside of the hid context.
> >
> > This is not satisfactory, but I feel like it's going to be hard to
> > teach the verifier that the callback function is sleepable in that
> > case (maybe we could suffix the callback name, like we do for
> > arguments, but this is not very clean either).
>
> The callback is only set once when the timer is first setup; I *think*
> it works to do the setup (bpf_timer_init() and bpf_timer_set_callback())
> in the context you need (from a sleepable prog), but do the arming
> (bpf_timer_start()) from a different program that is not itself sleepable=
?
>

Genius! It works, and I can just keep having them declared as a
syscall kfunc, not as a tracing kfunc.

But isn't this an issue outside of my use case? I mean, if the
callback is assuming the environment for when it is set up but can be
called from any context there seems to be a problem when 2 contexts
are not equivalent, no?


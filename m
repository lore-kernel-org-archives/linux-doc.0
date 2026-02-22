Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8BB2749DC
	for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771787491; cv=pass; b=raRLVlvc1qD1UCWBwA/QiyZS0jXOY/gvNou02dshdzfSvPXK287Hj3fskZrLLa9I6HSxvMrmeHicfbZ/5QguXAkfQsNaywLuaPdbtBzAJn1lDSWwOnG5rOi6j9FbMNZxD6QmyPnAkkdqs+I8jHypsZXGQyHFkyGxZMLTcI8HqoU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771787491; c=relaxed/simple;
	bh=s/YD0OLVc6+h/cuK+yNzdFi8vPgttaGJW9YhqP9hbDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nQMym8/67B++PTwY6pQYi1G0omCjj2VSZ1kd3r77G71bj2W80Al9zCO9mibIdQpImYvJrZeAEEToXPusMESVOhf++JSs6XVbg+6axJ5k/OSgs/tkPTL4QDmcwhtfz93r/lGTkhbx/JLZzDq1TGmMBWDDmQPSaF3BjE14g20tZHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C+740L7Z; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C+740L7Z"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ba7eb6022eso73349eec.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 11:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771787489; cv=none;
        d=google.com; s=arc-20240605;
        b=G+q+XFJksulxBXzh7zliClI7WbzwLeOK0Tt5U/jvLEIDSweSR5ISVHQi+WJ957SkLy
         grDnOktL34N9iZEWt1eKXPr2KR3xH4QrVxwYgE/cIW0F2MnmCN6iOBWokS1gIw7LQ3jg
         Mab3k6FFEHAbcQncpiatE6ra+NR8UBV7P0JjLuQB++XZ7T2ns1KOcvW2mSi+XY6FaIFY
         i1zDq59RRykBChtDqV0KrWoUOUq3jwcl8b/ZTT9V2Ka5vWCoAqjdz23Ih1iE+q6qfx1t
         NPOA9kCknIGQPPb67GjhJ47zGZ2ppOr7jcQU9ME2AnQtOg+W2uJi/Kr9y5zVnc/esnXf
         /Xbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        fh=+mg2Hh6zfdk0lQmp32G/+wS5oBzrqQHVPUlkycH/cIs=;
        b=RsPP2rsLTbt0PlhAkVBk/uxXtTnro7oiRgxauaJ/Ir+Dqrw1zvXgSBmCveTT5sqxI9
         8HSj3eo5jbmak1oUO9f+fUh4PnWgkB0yT8w3QUAcO5yFI1L+Zp04hCrsEu6iN6AIYe7g
         P9amjzd6qg6uDsJQIpf56AgFigtV63/CAd4qD5kTSv/YYtPTpMtVNiQTh7yUPtiicksm
         KulRKP3vUYPC9E7uce5S7Mm0ragv7+BAnmSyK87djtcv/EYtnqDnBoEN+RQvDOIz8PDA
         hvg6nMfXXElJAQ6uivZQabzoqph53bSZSLtBMoCJTLdwFoCF7p5znkg3tYwhD6S2A6GA
         qS7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771787489; x=1772392289; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        b=C+740L7ZI+ARrHZpUBT4/Bzp7+mcOI9e4c8rOOKNCos7cPFrHt1dVuimCMbzVXJz0j
         Z7PMhyPsndmkPw+KUtxGyDN+nnow1wlJzbiS9MfwB4x7IOoyZuRi+51VKALc+o48IP2p
         ASLsT13DTq+zvp35lzvjGeD8YRffLJtofHelrve6QXioAS2b4ryls2xnYN06U15aFE0t
         VPKJz8dSNbNCcz9M+KWYfnGHpvmUTssvKC7NKhjMz6GgYPNK83sSztx7lVqZ/4xLY2YM
         5p6OwXoP05urEJjMRVP1zHqSKcc+sZdgiw7s9A1M2ZZQLjQ+QIFU2FLEK9usHxoKh654
         +FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771787489; x=1772392289;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YEfRoAIWjupjNUOZFtJHLhbd771aYMAh/CpJMSay5VU=;
        b=n7IW1ejDNCtx5MuFnlkBFxjYzLnG8W6xwmi4H1xbSSxrzAZ0vDaEWM8xbXPy6QY8rK
         woucN0sSVSyjLrxaHcpC60ddrUXNdcd6cVLFiI/+xNh7lgfzck9W0qTsT6uKdNXv0rHO
         toOyWew1QVbW27CpJsWoRIwy6iEenzURsHaBpu3jIjWqYAalDqCuo6JyHg6F/HK1DiE/
         k/CbIrgpUhvBj5yVAAyl4JgIkB3DVGSKDiVH278ysxbtKhXk4DuWOIc7vR/a401lG0l0
         UvfxJcSXPwZ7LwgUl6ambz9PX6I+GXZuAdI5uUga+BHiMdEGoDwhnKukB/tubiBdntRM
         UuKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV14WBxscRZAKichrizZZbavJBXfX8NEj/OxoHbeVsy+CTUqh2kpU2gOptbnt46jSeXj4ZO0zr11TE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuveqrerzssrr88hVm0p0laK0uIPYYhgCRvQ7hWcrfnLQcU96I
	v2i1zL1fwdo7fCOXDOqFM3H5/MnLdtyKr4arHGntMZ/NpOiFN7Tek3MJ+AWOguwy0+LcUusn31n
	VpnX/j3Xe1eJlwrJVA+9+tGAd+hpL10A=
X-Gm-Gg: AZuq6aLuUJp/hyPxBIJ4AsLOEiPipOqmBgSRxg4LrRF+Y4ZgVcnbSAqRlrjooxRFzAQ
	3Wh+u2VHGcOvMKeHA4ejKBx0pFcS9XyaHxnKfmctxAEUeHgMbIkCin6bGenqhO74Viwk+M828xT
	knJUkesEnp0bEEcWLa6MQtSOUp7PERmSiK00m7pfdVa+h+gylr+Xj26FqdLKwNugIeANErbhB0H
	7iYHy6aWJ3BZR+RXPi9WDfj1QccRsZBBsNeCjJKC2n/JSDjfndYOKtAN1IQHR5XnYHyY3Xz8jiX
	80s+UoONlZr/fJ05bjZyxC963YXbKyvVX27A4NZ7YuQbD4+xHlUXOEqEIqJNjmvjT96gU9RtZDu
	xzzO/hIWV/g5hovifNQlmKlmxHkjkPAn1XPs=
X-Received: by 2002:a05:693c:25c7:b0:2b7:f145:a70 with SMTP id
 5a478bee46e88-2bd7b9ed182mr1491522eec.1.1771787489452; Sun, 22 Feb 2026
 11:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210090023.2587534-1-mkchauras@gmail.com> <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com> <aZtT4MH0Q8Ic9ZiM@luna>
In-Reply-To: <aZtT4MH0Q8Ic9ZiM@luna>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 22 Feb 2026 20:11:17 +0100
X-Gm-Features: AaiRm53bLm8BaSMJ6yUOF3BzlMMZn0BBot3u7XXipnBmPLeFtS2Lh6iTAtxhJHc
Message-ID: <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: Alice Ryhl <aliceryhl@google.com>, 
	"Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 22, 2026 at 8:07=E2=80=AFPM Link Mauve <linkmauve@linkmauve.fr>=
 wrote:
>
> Should we come back to describing the target like I did in my first
> patch[1] in scripts/generate_rust_target.rs, or should I bring that to
> Rust to create a powerpc-unknown-unknown-softfloat target upstream?  Or
> is there a better third solution I=E2=80=99m not thinking of?

We are trying to stop using the custom target specs, so we should ask
upstream to give you a built-in target you can use (or equivalently, a
flag to do what you need, but I think the idea is to not have such a
flag).

i.e. even if you used the custom target JSON, we would still need to
ask, since the goal is to remove that script entirely.

Thanks!

Cheers,
Miguel

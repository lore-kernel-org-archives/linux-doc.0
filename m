Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB63DA5C5
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070704; cv=pass; b=pXgEhAWEuTaVdWlS8vFza/FzeuwzR+D4we27BBsVIJg9Kv6NqRMfDt32attH9dzva7FNR9U0XLw9la5Si1aegS4HLQWn/ThMzYOYIFxXzgRS5idhzt7KmspNGcje9r9mw6xVYp8oIe6KZ9Yh95LzuJ6ttHWZkxKPishUsF/qYQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070704; c=relaxed/simple;
	bh=i7JNzfUe6L71617rex6z8v70eZaGxtMc7Eehjt1ygA4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlRLdov2jRD9ySyNx3rJilfL5QvexPxNNMKuwsMiDYVNR4NMHE7QiYn9t/W+i3v5Iw2X1jWe6RPQYkRrPtbqjTSuTfZ6Xw4Zv5Lke5H5uATN/WfqoEYBOdLWfktZmd7eIy6tpR8NiwEgORHBVRPtigxoqywF6Fmyv+3kTmvYqXE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTgs9dCS; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTgs9dCS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48540d21f7dso3892255e9.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 08:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773070701; cv=none;
        d=google.com; s=arc-20240605;
        b=Ah3fvTfOC95PMBhRuX1h95Y8TZIyJpHfDTgKtRguftOUDeHKC9vvvgI0x8QZB6rVrR
         uRBqPSTV85r5lEvVxuJLkDe4+nWXahmaewRj1ER1SDi9jTpces+xgQVwqRhskMPa9F3O
         rB/D/WaOQnv7xr4L2TeXYpGDS3J6+k9vByFY7pMNnh9v63QBon8Asap7qfmTHCgkro6s
         zGGqcNImpHTc2kgTwaAAVBFqHyHwhX2FMsoSQFnz7jHy9P9m82R7y9cMk0ZGbVeGc02K
         vVMbUj8dZrVxxkKl3V3G1YVwh1Xo2X/zL6NyJ/DdL7tSRKdSjeo1r8iTHtDnCStUrUEj
         mNRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i7JNzfUe6L71617rex6z8v70eZaGxtMc7Eehjt1ygA4=;
        fh=mFbtRonE7rx0HRoO4VVhL84Xoj5ydFrnbvRvmT2VmCg=;
        b=KOJK3ZRwQjLDQVX5v3jLS/m0avC7Ahw36ZRym2pbuC/xRtxAcugIM1vIEkE78nuzsM
         Y2DExUX33eJm0pHQ5LRNO4b11MEgz8fUnMMFD4dIOag3u3eSUz4vwgnKZh5jrwUJVq8t
         YomT+TnqOLhvTC+Jrgn/rSjRrgdIbvZv/Z1ZpZ3UNGBGTgwFC1BbZSxhWSaKP0gVtNLe
         CxAdEf1ByNJI8woPKztru7Wmy4SigUaunooM4FCAT0Z1hnMBWs6fKMdkqsN1yFqqf0eV
         HcmOZUmSBDUWwVB5VhHFz/0GeVQKZLF4ht0ld1y+wcPD6veJkEYJgS7NHRMyzNigFkQz
         G9Jg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773070701; x=1773675501; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7JNzfUe6L71617rex6z8v70eZaGxtMc7Eehjt1ygA4=;
        b=UTgs9dCSN9J1VFSBF+pF2Rd0qYO7d6F+7+ilEf9e1FSzbRDMf1bWzjsm91pXB3tqX6
         EvWU03LHBkbZ4f/FskdKNXJdL3f/zITzKLnhKaZjrmF4USYesZVPNb2WQisjSgne9nU0
         4XIJUtgan65BjxHhBkcFU1enkunoAAiuZ7S+TpVUjI97HhVYDiA6SKJ/5IxPuDIGs3eH
         CN6RtBT12pOc+5jvPqqyujG/UM9lKBlIj0r6rOL+e4isRwUgMSwBBkkxxRsxIL49s31F
         eBqClmmzYxUyGj1xgFE8bjd1NM3/o5Ak+4UoC3x9Z9XY5MvcsEAcxon9CVUINY+f7ZOK
         R1+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070701; x=1773675501;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7JNzfUe6L71617rex6z8v70eZaGxtMc7Eehjt1ygA4=;
        b=epOJmvy+GfTEMwARD1dgWZnYrojsw32mjY53rnG9BXQJ3GqNn2AmxG//FfCJOxKM8y
         nVa2XD9sGxsPb+gIif5HEC0/om6kXS2KAZD/1fkF+JNrGIvMFoa+GNbxOrorpxR5Gwys
         Xo26btb+qauOLDCTxsO7iKEMEplr71GJH75+3bt9FMk0Bp50avqDmlZb3f3tpN9zZURT
         nCdg4aekXvAWVufwSHKKp/gjwn9Gkg8UMsPw8DZez7Q4H0M+hVRTl1DbaPm2MMIXN7ln
         qy+wzf90P6XDEWOmeSi6fXt59O3pCnHDPSBYhJUUYdLcXk65A4aCcJ4V0+I2JzSXq6q9
         FcKw==
X-Forwarded-Encrypted: i=1; AJvYcCXg67MBXq0r3BSqZ4vd6omMKpUGJMM7i7+yXMjpSsmGH4+3w1/LvQOrD+TD3LjLZydUPM3NDmGSZFQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGAH8kf4psKaxSdC8RIpZz6jZjfCA51Hi3B356iKKOP4YlGZo
	mxqsAHlTdr1hUqHkG35a8PDcy6HOPaP8A4DWEJY/a9YtwcoN+8M56L03CKbriHXpC79JofqKmfu
	nHTolQEb9yztssA+KFZMOPUlmtMgIm0U=
X-Gm-Gg: ATEYQzyb4GSaPqRNM/lJzsotFSOfSBP2PpnF7fUQiBB556uoFdCKIc6nj/E6cmTMUG+
	hvmNlnhY9sdc7G7zz9eawJJ/xcYzcicQKEwgAVgFsya6PNb2loRan4ndJ+oCXc0JjFo4f6ZyUq0
	+btui8EPCBlBD74/4COXhjL8/jhD32VBOrtxDC9T+V9ryVJCnKRrCppcSCY+rdoIvZu+HOnLEEM
	BkJNyBaAQ5Kb3lbaUuW/RTaquBSjOD3C9UDrU7s7AHRco/i9KDe34viehFa2amHpWtLp7DUwvLG
	dSfdbkJ7IgWPMEUz5wQ3hDtf+rOIa4FAdl3EhokcKA8tXb05avB9dmXQ2MbY74I+LFvq8m97ykY
	L+xg+NXSqkYZEmYRlmocDHwNFaQ==
X-Received: by 2002:a05:6000:186b:b0:439:9282:e728 with SMTP id
 ffacd0b85a97d-439da654ce4mr21389898f8f.2.1773070700491; Mon, 09 Mar 2026
 08:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309121033.2594457-1-bqe@google.com> <20260309121033.2594457-2-bqe@google.com>
In-Reply-To: <20260309121033.2594457-2-bqe@google.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 9 Mar 2026 08:38:07 -0700
X-Gm-Features: AaiRm53_ONUz9DQEgma8C2U4sA8fACZSWuQaDwS63ajlIU5qL_RrY73qp24EXW8
Message-ID: <CAADnVQKNiSm44Hv_o81CQ3Phv9t0M3aXcWDdsNm6qvjFzSJN0g@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] bpf, docs: structured docs for the verifier
To: Burak Emir <bqe@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, bpf <bpf@vger.kernel.org>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 5:10=E2=80=AFAM Burak Emir <bqe@google.com> wrote:
>
> Multi-part docseries (verifier-formal-*.rst) for BPF verifier.
>
> Provides some background that helps get a structured overview of
> the static analysis that happens in the verifier.
>
> The documentation covers:
> * Part 1: Abstract Interpretation
> * Part 2: Abstract Domain (Value lattices, tnum, pointer provenance)
> * Part 3: Data Flow (Transfer functions, ALU ops, bounds tracking)
> * Part 4: Pruning (State equivalence, subsumption, liveness)
> * Part 5: Advanced Contexts (BTF, concurrency, reference tracking)
>
> Signed-off-by: Burak Emir <bqe@google.com>
> Assisted-by: Gemini:gemini-3.1-pro,gemini-3-flash

Pls don't waste the maintainer's time with this.

pw-bot: cr

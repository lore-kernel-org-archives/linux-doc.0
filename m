Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681F43DD539
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 23:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937710; cv=pass; b=JTI9dzPyL2AwEgmQ0LLGNA+qy6PU5QCR/P3KG45g8U978A2TCmNk2H7qdkQg69eikwUqDGjXaoVOLKXrzQtoSsy5PV/qlKYYqXDacleFrkYpnNlRbEvmcnRQGHLpFpijf0aswM9HuYQIOXljDo2Yi57F+BFEG+pJqk0480xU79I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937710; c=relaxed/simple;
	bh=lhTkP7P7am6OCUvEIk3FCi/LrUvUpfqf1XXnxsvXLPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9R8u+tc8Z7nlFCIegbrjwBEqg8NYtFDwkZ+0MFArNUoOTUZ3acOVWwDSYQpsL5xPrGczdOUk/bxn0a5xO76ZHi1/J9+G2+ze12ytmOQcqaSAFLwVshofqGfdSBwrLZTb6JhSo5zR7xfkOycjHfcQIvqQpCFuwvxAaGdWpCzGSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keaE9rqv; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keaE9rqv"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so263200eec.1
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 16:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777937708; cv=none;
        d=google.com; s=arc-20240605;
        b=f17CtW0z9ZWXNG4mVHfyV5o1jZn2D6NqFH0Ftq2iGUqPqUyqtDJ7mmQ78bz6PGvge1
         sYIOA7Lw76KMUoChBXD0IkGE8jMBCEiLcKfaBQRDKLKBmUTipxk00qExt+vqLiZPjxHc
         V/r+kjJPr5BMAMgvsJhMMyRIK5s3Kz7gDbtGbNQm+hdTtloLj3Qhujf4T0mzXGixzORl
         ZhFF1BoK0XbJYVtuEX4rT4NYcAHWyFIqkgsLqHzvihRR4OimegQneGkOOZGD1wcKYqgl
         joEQxS+wnSuP9Zkp2Dq7L0N7wrGGsNbVMBc8OjXULDzlx7mulGGdJttJF+OY/uC8Gvms
         /BVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=486uzKHHh57TN5FqW6hEx3732Gh28wUWwcwI/eKhvt8=;
        fh=LaupI8BLp8uOmUMAxrIc05BCo3MZNNhSm2z3ibtvsgc=;
        b=UaPWG2Pon1s0H36fbD2isEOij1btgv++ITk/Ifo0PidC08OOOoJOyoLJ8zXkIo6BBZ
         9BUzFU5byLTJS81bxr5PzyyAM6/3zyUtCpNoAXzOno7F2PK1e9TqATAvWuO6OHwYs8my
         JCipNtokqlxJtDP+yXOThavQ/mv8TpIeIN1kf8tdf9HDTloROODkDrGd/FEOkkxqc910
         3vtVF7mSMKlxvoQdnXgaPT3k/ytYmJyXvlBae6d0G+7JavO+0kM2jAyC8X1MkJ5W67mk
         NVDK1AcgGuRZsyUbs3dYsZnxVXQruxTvClsHgF830SjKbCGO/quBEz6xztmcg0hpcA7a
         Dkug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777937708; x=1778542508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=486uzKHHh57TN5FqW6hEx3732Gh28wUWwcwI/eKhvt8=;
        b=keaE9rqv5hFv2w2KOC8VR+95ar8zkuJMvdaEW7wfCPzBw36H/SkGoLXrcajg9vgKmi
         1Si5t7pyAbqBhxCjBSPIsRgqHUogdFjabcYvL4qvjjUJcLYHhDtTBVWt9d0VSyHBbOiR
         UjXZwr836L0BnvdhiK8R66o8rgX2rebnGIs6QPqsZR1CRPUKg0BxD6JfdPbLtER73/DB
         sS8X93ROjPF7OKztY5+ErwE5qtBuzjdjsSfj2hnmXsZ7c1hcGFwfLRyAjLMwm9fM1bvY
         w6in+3CqqhuMShjEyZqD0Cw+PDdiC/PtTfqrEPPRl0UUcvvq70qz7PqYDMmUr2B+nDEG
         G8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937708; x=1778542508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=486uzKHHh57TN5FqW6hEx3732Gh28wUWwcwI/eKhvt8=;
        b=T2SFryyH3bnEWr3fItuUMrnYcllRp+NmiPITSkhmefkFVo4xzQfMYlSP8Wlb7O0eZg
         ULymnTubCEU0pWgvWyPv3aYN15vyyfJauiurTpPkSwlHF6h4X/EO0F+2xsNIVIexKswE
         1zNzQLwO6oDMYXBzkIIihMZoyfWJbEDmLKxoswWuGwPGjwsGzjAC2hotba4sXfR9K1W6
         ZUuRwuCUVkpVcw5ryOhKHYf/PWu3gqfyJ5qAMyZaCLzw0j5aHdbKv3wJYVVtti/Il4vh
         xIlqLjro7CTxopBk8wtQJsYbMXxzWCoXHh4obcbgHOFAHU7SF5Q/u9BEMVew+QFp+U5D
         kpEg==
X-Forwarded-Encrypted: i=1; AFNElJ8LQlLhvxs6rv5SpZztrPmTDcbBB6IqVH//qkhaTar1k55ztFaebMNZdCzNvnL2Ix1YU+Vdaq9hhoI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmX4i2OGVdet1pFBmfR6wO19QQwqJSXjUmAVjZ4+xoHoTLXQ2J
	NKIhlYvRgn1/km5Q7KYcbkjEDB3K40L2uwlpk1JwmvjbwR75x9dQnOVI1qsx80usgq7qsMOkk4Z
	Ori8wvegQHxy94rJRK21YqGsug7nnCm0=
X-Gm-Gg: AeBDiessAifYWJoFawUvq8yzTkMiy4aJ466XTPerqzxFXRT1F6HY5AN9zXTWr6N1B/x
	CP23d7TJA3BDZAw7AgkaXiHhoRR6Gz/fjeRbSQtDf9FxbNeuwEpkrWM30i3fih4oNKPLFCGQrqq
	P2FuDzEPwIqr8f6h0Pee8JMRSdEVan6p8BT9T2TudSMlwa3/OBwfcrMy2pXPENmw6D9+LRriFbw
	D153B830KqGkPLTe0qChDC0NSA0AsXNUjXtN9P2+sibktV5a7wHoipyKAlk3fqgr83Eoq8+bcPJ
	eGkF+9JdJe8FoPr0BLPoUqOMYO9bjzqmd4lx4JLqD8CBl6JaUYgu+rFt9OzPYYCXfHAc5+BHHVF
	ZyAnRPrbWAAo8e/0wroeWgAIt1gavGwh7uDGCIpnCcypV
X-Received: by 2002:a05:7301:2b08:b0:2d9:244e:be20 with SMTP id
 5a478bee46e88-2efb9c88d13mr2515125eec.4.1777937708427; Mon, 04 May 2026
 16:35:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
 <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com> <20260504222637.176edc7c@foz.lan>
In-Reply-To: <20260504222637.176edc7c@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 01:34:55 +0200
X-Gm-Features: AVHnY4JJei3yp_JdLb5wR9_gc1RN9p3tBaAm1AmA5OTTR-eOrhmVbleLQqGndbY
Message-ID: <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 10:26=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> It is not written there, but by file, it would actually be expected
> a file within Documentation in ReST format ;-)

I don't know! :)

You are right that we encourage rst in Doc/, but for vendored stuff,
it makes sense to allow other paths (and other formats).

> I'm afraid that this is not possible. Sphinx doesn't allow
> hyperlinks to point to files outside the documentation root
> (which is Documentation/ when SPHINXDIRS is not used).

Hmm... That could actually be useful for other things (e.g. links to
particular source files).

> IMO the best would be to run:
>
>         pandoc -i rust/pin-init/CONTRIBUTING.md -t rst -o Documentation/r=
ust/pin-init-profile.rst
>         sed s,rust/pin-init/CONTRIBUTING.md,Documentation/rust/pin-init-p=
rofile.rst, -i MAINTAINERS
>
> This way, it will generate a proper hyperlink.

You mean on the fly, or committing it?

If you mean committing, then I think it would be best to avoid
modifying vendored files.

If you mean on the fly, then that could actually be quite interesting,
and we recently discussed e.g. whether to have a particular file in
.md vs .rst and whether we could handle the conversion out-of-tree
just for that reason. So if it could be done in-tree, even better. But
pandoc is a heavy dependency to request, no?

Cheers,
Miguel

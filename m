Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9866A351C27
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 13:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775481690; cv=pass; b=RV0slX2zI2ZrMkjdjGJjgxVYfJlfgN5llaW0LTOzEwSzjhOBcGLg1JdZByBa/Wbs1f5zaGVpMAg0X6Xvfr4sDxX+Hl1FcDdYbCEHZoG5qcRCGHdyzW1H+Y0A9p2DGfRwmP71T6BQSEC1R+iRCoX4I4eNTnX/hyRNOc5FX1rP868=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775481690; c=relaxed/simple;
	bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Od3Sl8y+EfuNZoKTasErAdkBA/FOiV3IxSZoya0HTYw0UtPDhFDnDOJ/KMSK5JO+qpeDC4G0zbRwLySXQIMPO4HNAJwUT1tkms9skAd8MNOZrbclNPVueDTd60sVUEm0ZefSgaGN8IM/gP55sNB/RUKKgjDdgbkngFkawaXWY0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q3tAGxOy; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q3tAGxOy"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12736a0147cso216401c88.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481689; cv=none;
        d=google.com; s=arc-20240605;
        b=Z4YO8P+fbg/tPH+TnHIZoqKw+Q5P3BygcJv1HsPqBcp5xB5FsesKoEotSQvlk5XtpG
         vGZaW9OxJ1z/RelDi66WuMT/7gw4tfNyjlb00Ob9GiF93ZzMjCpYHtkzmxcSj8n6KjWE
         5YBjWsIwjkuWeiXInF9d6zItuELNdecPcZZibDs5oUKkKLZSf5OggSD4jXpIVHD6GXto
         3wfOTfCDGtTe3ZtOqehPdXJEqn4h+GuroHdV3tHl1h/hoLjvCjiBhD72eyw7hOyv6EF6
         Xglt1ng0LptaLr1q70kUsdz4x3OYZ2bSXAOh/L8wLeZRIZOAvD9SpYCKWj0qKCn9rIzK
         Jdcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        fh=W5lvWi1OpoTyXnAdCSK9X1OK6TuSSfvVd1n/v5BmBio=;
        b=edOK3C4XvmEoOirwabESNhN57sA3vB4icEFWjLirMpnPBTquanc+texJJMwO54WfLa
         ZbDATz87UZWGObiUy5mfEQp2F01ZZ7XSSKTLaqynaIBcaWA3Kt9/zKNzD3oZ9bEv8KQ+
         GGoClUlfr4s2NR7Bew6RtkYrbIpwefh2J9SeB/Zkn24gd9Fmy+4hv9r9zyL7CWqvtgxv
         ZmmrHYSHV5GfxavWQ/HpgP6J4FghZHMnAErOKgK6a6yTDQmd79zu+ESaJEpp25JwzlsL
         3TCZli/mXiRyi/633M3NuniGo+hAIyr7uVCDBXNC0ZgjQhN9uELsGr2MK+Ov2UnYM8V8
         lPrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481689; x=1776086489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=q3tAGxOyAaMZ92oiBATu8FQ/6qRm0r9euxaNK8TPoIYKXv+sip60zW3/mf/067CojG
         I91sgXn7EWKEojoel0sfV0c2x47kc1MhplILMewUkwkZaBCCr0pwNk93ApwnYy0wO6yk
         wzk4NsK4gNw4WQ5HLxHU+akS5jt/VzZUPL7mw5Z8fzT8N/hLAXQzM5TXL+PsqtJbutvi
         8uYoJs3WHDvwOVOtXEYQeWWHvCxe1gwgZnfpVYwrKTEHNlI01LkDdq0Wvn9M2UetAjbD
         lUoBO1OKkgxrsLb7uoE6JiAt9LFTPTHQt2L5Jm/D7L6biFMlveXZMrm6ibprSlWxXpbe
         +9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481689; x=1776086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=s/97tBcpAz1SHs0ODDFZTZq0DSt+kGPYblSh1Y7GvwPDZj+ZikmeWmmojnutzBx1oQ
         72ViM9kX1zKkoQIwT2k3Ma7WGjSpKtFcbye7MjaDea7cIG0A8SIgHvksi7zhmaw1vO9y
         Rd8uSNEy/auNjGHTJznjORKQmm7Y8DyXfU/qDaxX/mesXK3LDrUd5tvkiqhal3HP+149
         VtF3moROth9nEna7UIZYkXkv9f1It8B5z6KkBVhvSMAF40mVmxBkNP3axicqBsb3aEbo
         kcPluSqFbZjHa7rEzrnZqbDxhVG2fTOu6IZfWYp4TjVcSrNMbvSeKvdM8+o7KqrDzd0S
         bQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCW8WgFhJxQvYEP+xDf5jH8Slf4zIOTUnwv8M5Lvh+Kjkls/iNpFkH8lr05D+qIT4hJSxkVfJ3fO6zA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5ChyQ+fMxg0uadWpZNsvzzuvarXDnHgBEhEOGpPF6eokkGaXD
	xLTG2mfD6Dh3TY/Ae+ShStcUsPVRXZQjbpf5hnKBjx89+DY+D/fchdIeT2dfl9VzQZl1zflY36r
	oWzpyEjYJQSyRT1fGuS4bWe2IODiZhr8=
X-Gm-Gg: AeBDiettHJkD06NoHAvHQbSySvVluCM119TSDoL4qWB4XWwtsso99wpvKr7FsmjBUcA
	0V63nvLO762IurazMMWv/x8OViQZXHIUp3wlYAEi0swhIVIPP+AWpx+CE65a3fEdH9bKxTInEo5
	2m0JsV5nckFm4wzmw2GPL/p60P7QWL56M5JD5jSQkEOL8ZgXGKpGbeQopcnlEbhn+vdR5qIWkcG
	nfcFmqijb+SkL8pcPsa3k2uHytLVeUoWyj4eBRI4u9rsyhqX16CVAdpufrP2lcBFN/ps7q0cmQr
	YMnq89/LinSqhD+DkKuqltNSVIrdnD2eIab05sgWAFfiYDDJ1mTjuaT9mbCw9Xi6gWio9zD/kix
	IDpgT8t2ATZwTUDh8TigU3Uc=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2965052eec.3.1775481688630; Mon, 06 Apr 2026
 06:21:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-34-ojeda@kernel.org>
 <177508434476.73816.11744805605122440072.b4-review@b4>
In-Reply-To: <177508434476.73816.11744805605122440072.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:21:15 +0200
X-Gm-Features: AQROBzA0LUfPYuEZWH9uKj1KexaW3DTNKfQ_If4tWD7xnq1YUXDcYUMRbV47V4E
Message-ID: <CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 1:02=E2=80=AFAM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> Might be good to retain some of this in a code comment.

Bah, I missed this note among the rest, sorry (I didn't reply to the
ones where the commit went away due to the changes in v2) -- I agree
it wouldn't hurt to remember why it is there, even if it is already in
the Git log.

I will probably add it for tomorrow, especially if I have to rebase.

Thanks!

Cheers,
Miguel

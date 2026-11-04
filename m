Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802197;
	b=TEca7jBDD6n5yO1P6I5E4VyLjHFMvwHzh481C1dp6npp6RxJ0fN0oA45Dz3yTAYASaUf
	 G8U28FLPGpJ4uk1U8liwZe0uccreDEr+1HrwVzrl7eiULP+mT0gysDIXgT97i88tMzPRc
	 hvlm9BP3HqVG+mLV4c5+1f1FBs9ckmA0WBLWyUcFAsFZE575HzmlR/2piJD9rFr/DTrdG
	 NswEaoV1AVCcD88Vju7T/oKFrFJKrE+KZ66BjE7IyOvI3YCjgaUc9NRHB5fH6Enu4q0B2
	 +/+ZpaHNlB5JWgMZkbcwc8HgcUZNR/iq5+n1SMjYamFj+nXry/0Vh44Fc2IkFpDQYUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
	b=Gm6EgtZVX1fgDGC0ZlkHOSmBrwn2RBJZYQCe7g48qCOJ7I+2CXy84Jld4LeY7N+k1jln
	 sqrQXGVRXP7Pvl24XF0AiyhT+ps2nEcOM6JEL+659OtzHKBwAvixSUM01KmpzACAscyfY
	 fo2d+i32npRAsu0L03iQfd24z0tid16TWllRzK6SWXNwvz8LoHqcO+//PxPPhLa5OgMBA
	 4RMDqoEhc2MjZk5l7Vt+nn0I/h/Y76GZpmeTR/9wp/8gJbBJxz/GYilJm9BMA82Cq5FV6
	 DTHGKHiYg42TU6XLRRUvGz1V6UXomNrQY0I9vzszM6+WR2V03Kts0MgyUU1u9r1WkYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LsVrB1R;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F24F606A334
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 14:23:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F24F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0LsVrB1R
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso8051285e9.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 06:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793802195; x=1794406995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=0LsVrB1RbPjDtXwX3qjLB1A3vbWVpqZ7HZf5pVQXVp4B7btdszFS1RljBh17d4QysC
         BS3cixxniLqtiMaPPHJK5cPfu73HovzOQC3aoX+YmxViTbcNeU+xrWcrtDpOK3olBzbq
         8BYj61J6NvVpkQGghxMoUWWxHaUL3v2+0S7dfFQuuTth1J1asNB7GdDfzPs5Ij5j1Fma
         CAHQ0lbRdCK0qEiS0+sQqrIdPbDnjliso64JP9yRZdlJQLMNlR49y+Q1lop64YIK2xJG
         yr/u0N5gPgEp75e1VVKhayMcmVrXJMOLfY8AaES0WpLtJCBYs28K3LQlgCNZwXYwAbjv
         QTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793802195; x=1794406995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ipCVhzNjz3bkUh3HIH/dC2V084l64YZgYq8uC+CfKVA=;
        b=ov6q9UZCqh4u/oW5rXBLKv5skSNq+3W/pzjE4OSmQdNzntCIl+wGJh6DaJRWlrpS5t
         qd21Pk0PHYxcFdu4Bh0mw7V8PKrK1CVXLld0qJb4vZkBLzfPievs6os5Vtyy3rXwU4W9
         u/tKBEU2Edwtd+iyTvLZDKbn5+6/S8sHZSHwlv8z5ppzLin9wtRGPoBSX8hPkjufi4zv
         0xeHhdp7rjoaP4RDM/EdWaaYpKnpwaLKphs0809UJVbuya1qY3WBSCuBpvkGqeZPCmvQ
         emEAbZaV2A80jF6t9r6WqYU7rWmADmasO/YX3AYor3GXYrglOBExxAhyls0DxDBBrPv5
         VL8w==
X-Forwarded-Encrypted: i=1; AKwUvBzWMNKJe7MrQrfEqxooVfvgTd1iBYtNb9N50HC+/e9XtYimFOJgsmDUtYlrOtF89OwmDiB/8VtfsY0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sM/maNFuBic7s0m797OwCZ3/y9sIuV57CqMvXJnM/P6SzkdSe
	VhevDdM+NKbEUQ6MN4nJuHLSeiAsH9sqaBVk5qwGehXo31nb/qi9yukC
X-Gm-Gg: AYBFou0cGjGgY63NwYyXl3f7FQgL/DThLdJFGqnJU4e1J8l3iE3TYhfAJ6CgO/zFXEm
	mmdqdnLkG9gjPjfhsdHCUEQoQ8ZO3m9QcFnHGIMZyKSJvP3PG09CUpMDD0lNHbSiHdhH6Mh5gKt
	UtD+H9CuVhPRkYOw56yCo75EY55uBuu0UY6RGH/WGaTqaQLbWkFjCnYvjwCcKFWuzZnxjjV4wW1
	4a5DA/4V42nayx2BaM7SQBeERxmzSDFhfBteuTLtZ3OEwuVjSs8j3AkNtJJ0oze5AzxynNnZ2Md
	T5LtDQr9YCK6VB2klCQoKjeDGljY2So7LiwH9WUWVGHHkW+izvEQrWQochvsIbfQ0vwRK6TyyhI
	YIzsDg99hpzaYM1TwwKCR9NpWulhAxiH1BkEUP55alnNSup6yBjo+I+PI9/39oo0xFP+f2RYImb
	uXqwogu44kK5cUUO6Mr1wrrYJb5+h3gYh0UR9rUDZNWeg2xMsF7SuRNhSTnLDel0p/gU8neDUp6
	ml5Me0QLjox3z1iGJkH9eOhB9hcK/sA990pKBr8etPBrvCO4R6tAihXFdExJH4IuIubkywUB+ts
	EVBUg8PsJkGqHXhzmOcKWT5ZgiWOWlbUF14Fc5Nc7C1fZPge7ZWAdNXn8rOyfkuf
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr406397685e9.17.1793802195353;
        Wed, 04 Nov 2026 06:23:15 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c7480e3sm87089165e9.7.2026.11.04.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:23:09 -0800 (PST)
Date: Wed, 4 Nov 2026 14:23:07 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko
 <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai
 <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261104142307.431fc12f@pumpkin>
In-Reply-To: <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<20261030100215.6f8e0d4f@pumpkin>
	<CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Nov 2026 17:14:26 -0800
Samuel Wu <wusamuel@google.com> wrote:

> On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Thu, 29 Oct 2026 15:05:45 -0700
> > Samuel Wu <wusamuel@google.com> wrote: =20
> [...]
> > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > would be different symbols at different addresses. Please correct me
> > > if I'm missing something here! =20
> >
> > Only that the user might really want one of the copies.
> > Sometimes there is only the copy. =20
>=20
> Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> pagination to cover these. A prefix query for "foo." also finds the
> copies when plain foo does not exist (expanded on this in my reply to
> Andrii's Oct 30 mail in this thread).

I'm busy rebasing my patches - they got stamped all over :-(
I should get a v3 that applies by the end of the week.

I will add a 'prefix' variant for you.
The 'next symbol matches' flag is exactly that (actually it is a
this symbol is a duplicate to avoid issues at the start of the array).
So in this case that application would always need to read
the next symbol (by name).

I think it might be more sensible (less pitfalls later on) to return
the symbol number - not that of the next one.

David

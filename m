Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793930452;
	b=P0Zf6IM6+DACetiY2vAh8NedbG1/0g8CZ+AxwHSH9xALvTDlZ01fWWcgDek3lQtN9PlV
	 kDus+uzeDG6H0rwD+rrYa12Qfecx7pN6XlHZ+CbohUuV+Xive77ouoFJN1OnTuVRYpE71
	 0gRRqAwXdJ2ifEfqt5bem96+wpgJlucRTzBUcLQKRR+3LVQZ08Ma+B0NDF5NjK7kdRX+K
	 ZZNbx0n4FMYHhwWk2U7hrHdOzCycXWMwdxMOIyOnxdyZWUL+jO7btngSPGqHMlNmRLIE3
	 zvp0w3HZn3KZwLpcfJ19om6muT4ldTOqbKZnQnXb7VhEgFca2z+Ke7KrAHV/aGJa4OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793930452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
	b=rczAYIQfjoFy+DgwFQaw0G+e/02yPUcASovwnSjUwxQg3yDTYMe6iJQDo1hZYIsTvXNX
	 P9or7awUHyELx1Pm8XAqYcsC0XnDGQU/RuPcTkVwyjzpnkt3HvGzBT2vckaJpC/Z7niBw
	 u5N8rGa4BXbK+h8ce/afZJ8ijIBg/4m0+zV0N2pS20vPhtiI45Y4JOEdt1CXTpus3fkAs
	 xspxU/xcobxoCCEP6TY900pgSeH/La4DhFAKlywvz/1MYopQq3Bwdo5Lg1rgppZrSG8Bn
	 tFSSLP6iwP9fNcfpzUZZSqfwWHrSUyLMWYfgL2LIXrW1nD6RnViJ1okrt/bB6qefo2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n0sfVB8H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C6606A32C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 02:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 633C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=n0sfVB8H
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c34bff61551so20454266b.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 18:00:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793930451; cv=none;
        d=google.com; s=arc-20260327;
        b=UpfCfqnqjIA3SvKcGmdrhzKFNOXGCdP3Ol748w2ZWpEg96Sgvn9YcBKl/5b/z7W5FP
         jbAS1oa/n2CKK5YMOABZGKaF/gtVjEdgH9v4M6LWMYWSPPFD6xyH0oDrXLh2VTUsXXvf
         Tw7+3b/UAtlWu3e5XmoF+xRH8F/KcXW+BG5OlgDprs6+fPXIH/gG4Ui4WN1w7kd4+3YF
         LBTAETeq9FxBEzifXK9MHvybMfj/l3cTOakIYqnKGBDyfk/Sm9opohK3NakEIGjGrqoN
         gUMUxXqkQl7FZ4zP6TosNL7EckScGmjiTrAMcQ8wsF7oIFAE5rKAQURY/I4oWO225HeS
         El8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        fh=BNbiByMhgsZrGvu6ZCTQx+jhcIWSN3XjBY2Fw4ZCnEE=;
        b=ZbmZh/3uJsOrjHW/tGhr2WVSqI7XeA059stD2kOeiJpW8u5nAkrSikTZxFG7NtBjO0
         tNh0gGQkSAvYK0bQQRh89Dp4ShSmw45jxUwIs8zyRP8uL30ERSOLg0vJWCDmtad4HRou
         19sqVT4YgMQ/DahmXcUmxPCg+ps2UjC/qDPVuC+duLsjKkWMBGLiExsOFvVI7yMT1os9
         FKQpnmuNvbFwexXxAmR1m0Mdk0d+jrhwhseh1ZuVleOz6Kinlakl2rhZADDoODg0fKyV
         M63WDAjVjj/2d70+l9hmlc/oHKCdpmtHQtNh8q0xWUUrNcteDLmKWwj64slguVqUTXty
         7iEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793930451; x=1794535251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=n0sfVB8HDMUIuXTocfcJVzoho8pZXk6bz0tzYjFzYmhSx1pFhTaSZo2yumVp+d748k
         EF4jR91ea7ibNEGxROUSMHM011PgzTAI8L1qWD0ISoyr1JcQCXHPqNvsMWVFxbt9wB8L
         pVWLUNSqw5HdxDBqekaiiz5oT5qSjOrJE5ODDKZ/VB3w6uZmeyx/0kQYDZapcUrltRdZ
         8fR0loS/DvGXRU6jX9KX9o6p1Ldw8G7WKpqq2NCoD45ROybfLxtqHAL0Tx2xU7De+KLh
         gi5zSg4xLzZZYLvuMhcffDFLNETBzEZCobr2lGt0WTB8BXHid6mc2feh+qdplGHJNBHS
         He+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930451; x=1794535251;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s7c/qg88c8erx5Dvpd9/JaL1ilkeZNtkbNUxPsE3zPs=;
        b=1UkUBEs0IH2tx5pIzONbwtYZOpx8WbuwyYE0w5JPITG1s/ApJ6drIk6FcjEQE+e+xQ
         2azXK+2aagFfH4blJfto90fvdims3ckzRze8mc1lqHTw/NlUSlRbIV1iG7JQ3QeLQiie
         I6BYnFc2aAL6QnPALnadaBG5Eas6NXweRVcl7kcmrOc6l691fnl4ifmFTGBHwO7KSFDq
         BT8ExO86LuzVLnIbW9uqg3gDMS8oiS9SuS0nOYqjT+nLIIcUPYHmzG2CrIUjBb4TJoPJ
         Ha3RDwHy/E9HmGcdmhhQkSVqdFhD2dhT9KICdLW0tt+27vcgF7r/W77KuBVIe7lUMBJm
         DO2A==
X-Forwarded-Encrypted: i=1; AKwUvBwVrqDHMrSzFdHCMrR7mOqTxun3c0ylBfV7EqqR/uLoUzGo8+qY0aWU1Yn11sZoPSW3YWx1S+mnqLE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f01YkZOhxU9kfqDe/G1izIMKcCAPQByYjuxjmBez3p+aWhW/J
	TU/qTEe3CNNxTDpLdtLVY1n8ujHxicjH6j8aw+aeyOB91kgeig5hoUffNlxEXp9ilVrN4VegrQ5
	ZxejFMjIBCyk1zYoxgEJGataoxnfo+kcxRUzKNmYG
X-Gm-Gg: AYBFou2j2r6XgoLpMTEVgbTd6pfKQjvjXLmyUjf7hPbdDuih9uJrwccHZo/hiWYX/uQ
	0csVYRQ9h9K6SJxd6ddBHa8IKw/A489v4iqQfoOUxkXuxJwj8lHZSZKyCOCMHoRLyiZsI01xDoH
	CEOFWh/I9UKpZcRd1NJZKkgMosD87yYnIutZW+k47+qkG0Yi/r5X5GgcXNd+Fw5bQ3197sEu/SX
	lsh2MAs3LErri5/OoDQiTa0JmFomrm7zBn5o3DVuwv5qFDxgAjDamky6LOLGxG9X/H4Bu98xuCh
	16knmcRqJ0B8X0mfbrWqQXisIJOUvzwP4ab2B2z8BeJnuoXKIDoqMMnxiriUeWrJVkSsl9nZ5DC
	Q0QnsXcr9ihgILMuetMmHvsS3J5bkCgTpdOa5ZyuBpSxaMpWOX/775Qs4k0JKUIenWN1ogNM=
X-Received: by 2002:a17:906:ef04:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c4d3468f9f2mr101330766b.7.1793930450357; Thu, 05 Nov 2026
 18:00:50 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-9-wusamuel@google.com>
 <20261028134012.01d52e94@pumpkin> <CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
 <20261030100215.6f8e0d4f@pumpkin> <CAG2KctqdPq6NmK6rB13s2bgM7kP2w4OMMy2hdp_OFMVYYhTnZA@mail.gmail.com>
 <20261104142307.431fc12f@pumpkin> <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
 <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
In-Reply-To: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 18:00:37 -0800
X-Gm-Features: AclHuK_AXTODf6fbRoRayz3qqp4e-qEs_ls_rSieFkkllrojC2ZFyUBK4KHwxAM
Message-ID: <CAG2KctpBEtBxwb6Tayg8z5na39TVe9GQ1+Bk5ts6eL7VaKjKnQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: David Laight <david.laight.linux@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:32=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wr=
ote:
> >
> > On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Tue, 3 Nov 2026 17:14:26 -0800
> > > Samuel Wu <wusamuel@google.com> wrote:
> > >
> > > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > > <david.laight.linux@gmail.com> wrote:
> > > > >
> > > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > > Samuel Wu <wusamuel@google.com> wrote:
> > > > [...]
> > > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so =
they
> > > > > > would be different symbols at different addresses. Please corre=
ct me
> > > > > > if I'm missing something here!
> > > > >
> > > > > Only that the user might really want one of the copies.
> > > > > Sometimes there is only the copy.
> > > >
> > > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > > pagination to cover these. A prefix query for "foo." also finds the
> > > > copies when plain foo does not exist (expanded on this in my reply =
to
> > > > Andrii's Oct 30 mail in this thread).
> > >
> > > I'm busy rebasing my patches - they got stamped all over :-(
> > > I should get a v3 that applies by the end of the week.
> > >
> > > I will add a 'prefix' variant for you.
> > > The 'next symbol matches' flag is exactly that (actually it is a
> > > this symbol is a duplicate to avoid issues at the start of the array)=
.
> > > So in this case that application would always need to read
> > > the next symbol (by name).
> >
> > Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> > approach so the two series stay independent, but I can switch over
> > once your series lands, so there is only one search over the name
> > table.
> >
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
> >
> > Andrii, do you have a preference between the two?
>
> no perfect solution, but given you don't always care about duplicates,
> I'd probably return the found symbol's position, which can be used for
> further pagination (if necessary, user just does +1). so, let's return
> current symbol index, and have way to say "find by name/prefix 'blah'
> starting from position X", where X will be previous symbol index + 1?

Ack, seems reasonable to me. Thanks Andrii

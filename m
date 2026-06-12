Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBD43242CA
	for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249464; cv=pass; b=XziM9h0/N3C0IG/R4OwYVP1N6NZ4AcgS7ppEl/nqCwOB3fcnWwhVD02nnkTm7CMtJv9IP/W598Smrhv1eV/ddeNFi8pUa3359YsUz+dTKm/39NuSGV6Al0dnenAqEWmVB/bhvi7NyaiVLi+X+qAJEO49ot34IBsH3+suDnXBhFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249464; c=relaxed/simple;
	bh=TJhwC0TjtETgO7UDDcPQsbkdSGcQTc0ybmTI+jD//dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xec5gRO8t+48/PTZjilkSzjyLvucWHo7BSymRV/Z1VjPWJVaV6kve8EleFX5OJcC/NZArEkns+tjjidoatey/I5fTjH98ge9T4GyOIyS+ZLUwLz8hSEC5mqZXXrxEovfh3YnQQWTZJP2FO8rvRh7tqNl5o5qgT+KZ9ngedOioe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L58aOBc1; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L58aOBc1"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so1199540a12.0
        for <linux-doc@vger.kernel.org>; Fri, 12 Jun 2026 00:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249462; cv=none;
        d=google.com; s=arc-20240605;
        b=DeQwdHz7ALu6neS0U18rdeUc6q8jqzFzZ4j/oGUJ4UieTTv9W1WKlES+9i6iygcOXY
         FK5IkjrA23UxFEFLe6NEf8OFlDoK104VbDBj9sb5fC9sspbYKt9Pagakz/LNieGyD0T7
         vuktiCtMhEfICb51xC5fg8gNrM5T0Z3W84DVUf/jLatAbHB1N3zyCEq8TE8PFsM7klFy
         3SQwou+k7GToLc9yRzewgM4TiS+xphc2xVMKUYcpSKUJ5tQ9ZGI9CNKW+u4/bUNYVMwC
         JBMx9zkmo3fdBRYia9svfR/de5jv2BZBUMZxJmyzRwPvp0d3TJXSjo3rQNmuhKHvErDj
         03kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        fh=7aZWi63kXy9YsusoO6XbvImfTNH6vnVR9oys6VLecPY=;
        b=NkzivXfKPRacaWaR8LQPg6YPt3vNhKjlVYUauXwu2rOvvwNxEbkAcyJCZFm2mD7yQU
         pPdDIsu6X/12Lu/ICK2MIp5XcdWTQ8DH1vzd8gREguUNi0EpbEfRf42MjwndakQP+bA8
         MG5wGpCLDENlHmbS3AsrtZkf7rdHLRqwhY0OAj0BPZUGfjkW5OhihUDDiUSrji+iahkK
         2ERsN3wBlAUW9/x3Hfwsu7iek4XE2BHUl2iHGhS+zwLPBs9ZRdt6pJn/IQYVrR9+dIQc
         tMpQ+ota1MfJYMZEzCVmTYD0fRFp4dARgjefZTSyr319rQ6T0D3XGnUvTCjwuf2SU+rP
         NF7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249462; x=1781854262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=L58aOBc1t+GGEQcW9ZUCClwQvWRVSfh0l0dwUX8RnHUPdAiHfoAgoY/hLcJF5PqmDz
         wD8Dm+3RibTWmuGetriZAkwjyoP2m+Q4jWl7sqx5+R0KFi0niCRZuAdEfb7uJHjaLBIs
         buBnyvjXmSXIzid5o7u60MGJ5+6TJrjvLQfTIaiUjxT7msImLvAEluy5rwmU3flVIOmT
         6gWjbSPp4E9eYP8MuxGF+1HB8FU2Rwrdd5LhA+49UXBs0si3uKubqA6+S+ONUEfSN359
         OEJcXHBCDuoFF8wcGR8XNKobiWWA3Bo0w18RacL+2ijuRLf/mOQ6KqaZNYaAj0u6AMh5
         5/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249462; x=1781854262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=AbAwU6ch+T5IY20J+VnQAgg+2qQlx64GjsWkdrOgY3f8hwjsWb6fNujpQpeLjtZf+V
         iwYNk7nYA4anw8Mt19hFBRqMplgtDP64dSdaau0wxX1RGhxyeDqruocBrW4PgYXwJhNB
         bjdBVt1xhKcPvsmp+t7uKyodTEiQ8C+iIw2HDhAXbm/Fn3O8b20CcXzzLjbNOilSOxMY
         TR3EiRvgODYHMpepl+MnwV594j3nWFWAehJQvYgmatP34z+dA3TdshpYeuVR8x7C1tJy
         nTM6ejmRxPkb6qATEgl40Pnx+0zA80PbHwFSW9eiQnbAJhZbM4XB218UhHe5QplCAg5h
         hjkQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FVAqI+tgujAXEWebS9FrBSL9XCBfTO86A63L13pUrmY6dMV5/M/6WAhdWJxB3YPJl+2Sl6xdrS0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvKC7i1G8LtC9S3QOEqJ8PyjR/BpHbPHw0mlh5JYv1e/Gs0jsx
	G42YWcRogBYhW3LS9uwpV1wmgu93ISN0kamSFsvuzFLGBuDOYA7FglgmLexwTztTPruLlQiBsuq
	PSZrhD9vrzpKOuVMPI75eQlSR9di8EfbqcL13x6hv
X-Gm-Gg: Acq92OHI23wzxr/YUjWI4CCTvz8cICW9azM1HAlrzcLOtJTaz64AbYR1dS9YIaZiS56
	jV+QCfodV4wKGUG1bbbw3noH9qeeNPbM7sOv1NI+9ilMOPRDjuvYGHdbQkmurmQ3OL75nqhOFpC
	hPjy6DwOvqC5KpCfj/0AmTM02pAVFXUzYcKcufk8tsoukihFIjGzMp9X5UskQ+NiUPocW1S6vyb
	SZU+ad7mJ7NQ/dXoqFA0qppk+yoJt8aEKogFrZQroOAe7Q/M1EDKAGQ61r/xIYe+fUWxxddfCdN
	d/U0843EBh+Kop+gqteM1OuFYIKrygukYcD3fw==
X-Received: by 2002:a05:6402:360e:b0:691:ad29:ea33 with SMTP id
 4fb4d7f45d1cf-693779d1edfmr692502a12.12.1781249461160; Fri, 12 Jun 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:30:22 +0200
X-Gm-Features: AVVi8CevQ1ha7IS1m5wrojNeqF7AokFDz6V9vLKSYwmszS5cFjeqHBoSGHAAq9c
Message-ID: <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in kcov_df_write
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
> copy_from_kernel_nofault() or other called functions are instrumented
> with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
> can be reordered relative to the function body, making the protection
> ineffective under optimization.
>
> Add barrier() after setting the guard and before clearing it, ensuring
> the compiler does not move instrumented operations outside the guarded
> region.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 2 ++

Please merge this patch into the one introducing kcov_dataflow.c


>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index df7e8bf70bfa..5248293280d5 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c
> @@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *=
ptr,
>         if (t->kcov_df_seq & (1U << 31))
>                 return;
>         t->kcov_df_seq |=3D (1U << 31);
> +       barrier();

Please make sure barriers have comments explaining which barriers they
pair with (see kernel/kcov.c)

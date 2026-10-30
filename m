Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793385762;
	b=dV1Q3lWjnEtOGaHnApDzPsObyifItNAYY/nc06Io9vxLHZtqYxg0u2CRnsv5v6yoIw2h
	 qbSWcbYXetfOcnpicdwh2lYr1kkIZZNAGaEjpmKC0a+wGe/xklEjZ9zPeuoITjIUWokJy
	 ThhzAVPoakKbAxen9cl8bjYdYJtabHXbFW1TTsuKJJfj+O+2/d+MtJ3VyqhXaouk6V4ME
	 LHykn+r3KsgSBj1MSDngB0NM8Z5Ac9YShKw2AthZ3umzgGlPqS7KOEsw6PwfGVp32GQ8D
	 bFEVfuS26n3AKzyIFTPw8vy0brz22REwME5SH8oyhBlp9V9HR0+4MmpBQHG0ig3HXWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
	b=bu5AA8hs1MMRZGntyx7wG7WcBAk+HLSI+OnvJ5GfvdfpzqSoQYvYBYHd6ZTQA5lF+QSu
	 kUHzZU0cmw7Rpvvbb8M6uvKHmhFpLB07hgLffhieF5f1ZHLysN7c8nD2WRocQDe/6tyFP
	 tbe4OBC7uqsRNbjuizMmblwFXXxdMiCIO1WtV6A71PFfEH4yC0jWOlFd6xdrRfVwzTlKE
	 1frfBarGSNEdgmlKJHEDce8e10YChB+0XS2FPDAn5t749/D076LJSSoFJNF7Lht9mcIQC
	 LeN9KSp3k8YwdSHgFmddkFaoOybJeGKQ/ry6fAzMcAD1GkxLWxHG+nOZpRIe8iHpQLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilhiRFdm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32B5606A31C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 18:42:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D32B5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ilhiRFdm
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so706834a91.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 11:42:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793385761; cv=none;
        d=google.com; s=arc-20260327;
        b=RDOsZ3SUq1CrvhYRi3KO6YXmoajhddyMslfFdWi/2dEs6J1glbqLRW212LMabj5ja+
         J4I/sa5aXISdsHNz4ThcpM6wC/D9656DkdFLS93ed9gGYXubWuDG8LRlag+V5EbgTUc7
         qtjMsdTvX30e3gXQqKS3jQ4c9s+Ar4bllTnzBohtReeel8MsKbDZxxfswXIBklCTVuEI
         6Pk/s+dM4speE+m8WFaFFLN4esFAjdEUMkKreRaCTDWu8TQySH+FvscaJ/5CsER1SQLg
         deHYKXKWEdw7UuemVu10n5WATBqf5ptYHNoOzZHdfBT19Jpzi3j70mQi9zSVdgHJaQgY
         xo8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
        fh=ZCDe05djSzuBL729AcIWdSd1mvf2zx6iirC1hyNgPWE=;
        b=W/VlA2GSpvYEf+7gIib9ALec5CJP/GRLH/QyxCYR430pQj3/+/Ju5hlm/rJURHl9kj
         zQ7mozzOQIxfR7BcSH4gecvCiJhjo8usJTmnwDRZRWf59eupH1IqKOhSuxnEuMrkpHOV
         /lC2ltiMJpBRFqsZXEIxY5BgU/46zxOHqZF3qO4zxEv4miK/jTS/gxKa1UF68QPcKAC7
         1xxRd5xhWZN0vdLkeiXOQWeULUYvuR/gPnMrVsUGAoVi8JKW3lEaFVljKQjipNs0qIFd
         +uPqecn16MSIkymPlnugEp6Sj4FW9LaKv83McZmGWTmDt861NTsaZbQKiyKU0orEqqPd
         GZuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385761; x=1793990561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
        b=ilhiRFdmDF7b2CCOVYg3yrhn1I/DSoWRa475WOgAruostyli6ZMqjZ8ESu/yy5CChS
         ORPsHXhLPSB1d8qNrTp62GpyH8yrD+KcK/Sl4X0TBIun9uQC8HbkSLeOQxdSLJiYuFMf
         XQv6Iyxweil5+vEvXvkSgud6DAU4epItDzW6UJ1rlDcLV2A5Mbef3YHl3NS1jQUpnBCz
         cXtS2Y1FhBsB8+HetmFOuYCQG3xb3XiaIZrXChQ1r6BwCboqJU6zWBFLaNgS9KhzrizS
         BIhSTD4xZXL4O7bpS/UEY3kl5bLzYJWvjxr8L2bxTLch81x4AItH1ByoYLZFjTdsOMix
         sxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385761; x=1793990561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArYrG0SZmM4/M6BZSvCDJn/YoiUDh8QaQvrAG71KqZI=;
        b=WagZVWNPpQbn3TgbIw1DYqp7RUAZcorAwce6sbREpQw3yA5zGhdOCTWXDaIrotPiUd
         ZGyUWXz78LhJoaaWJ5x1xVZZO/qlvV7K2RrMo66WoLYHQEmuDXb/zw/Y5Jp0v/pPBJFt
         /z1eFxXdGX4eofeXSsOHziP0kGmoNKXc8LzrFruAVAed2xAArmvetgOaK8p7+jYGbDqE
         zu/31rJpGCaZcNLDTO+aQNISAmfUjwM3eZWQcXJ95esSnZFo4OPHhq8BhkuCFP6nxcT7
         Wr83hvnSF+FuU0EoebwUXUUrjv8obMNUSV/cGcWsfHssi2rtRFPufpnQ3yDyKFJ6Cu4R
         9q5A==
X-Forwarded-Encrypted: i=1; AKwUvBwpzkjz8GUocjxqcrmZzBn5PiFt9YEvJpjZZiHw/OwOmKoC91PPfcHIgxcsBTGJMKo9aOJdJ7infX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJU6CGUOGeipK5CAnLtzIemfXV5gxcxVR8FwwqR0Iq7BJ9HIVa5
	9uYFGBxo8x+ljXvpsZZpNdNw47EHf1mjvVQKhJt9AuX6F6/hy1mF+4tdU+fUhBWkPjvKo3YnYO1
	uT0l2+cP/pwUWTyuxXpZ9z9aNk6jUo7g7WA==
X-Gm-Gg: AYBFou0H42cHJqWWSXO89mUfA6p/SnMoj8XBbNOwyGReSTRklqY+Sp8QmdFVJOQxadH
	wMkzuHrV0Tgb7ye99+EAmzGfQOlzvuZSL6lvCxoMdSNMG4oNh/n/tcbVSNZZZwkBVYy4sC/gaNJ
	RHJlRlRUzqIkKiOr2BkV95ej1YzhqrGLGKjXg7jYmpeAl41xTmZmrkTEhfOw+KuwYgAPJHxCHy6
	bi9cgiVwBzvAcyZFJ2i5dwAow1aXrGtFCBMJ9V0NSXGHWSa+lxzf7Qr7tEWE5pdHf448A5SEi4J
	/wM+Tyle1OpwTd6vZvptODxX5D9O1hcfosGHyW3vOIz6DfwUzizIh075j10jrDh0ILxz9dPxVEy
	2OHacIZ8RR34wGPgiKC+dga9c39qDjzLUgx0kza2cJWKNGMnxFgQnoAQIAErshvOdhsxmq2xCQV
	PLqWLLqSBHmDaoh7PuLkG5OUFW8CAqEu713T032yKBOLTUViUaV4JwGKY=
X-Received: by 2002:a17:90b:54cd:b0:3ab:2737:3392 with SMTP id
 98e67ed59e1d1-3ae897a87admr2747287a91.53.1793385761164; Fri, 30 Oct 2026
 11:42:41 -0700 (PDT)
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
 <CAEf4Bzb--Jzz696u057G9_CgQN7zf6ksvoL80KJacKO2CorsnQ@mail.gmail.com>
 <CAG2Kctojb7xiOqTmwWqoAKFaNUECjOzXVc_t6KbG13Pqm2dbng@mail.gmail.com>
 <CAEf4Bzbs8F1DPBz=WXVTExrrNjzvaFsi4L+HEj+zbUTpPSTX5g@mail.gmail.com>
 <CAG2KctpSTCyWQHgJ8GyFEhHPdFawUa6zy0g7rkfCcujJRN6f6w@mail.gmail.com>
 <CAEf4BzbyqPC=RQGWEdpkqu1WDQ2_S0H8pZU2i=_gLuSDQtpFbg@mail.gmail.com> <20261030153528.0d5113e7@pumpkin>
In-Reply-To: <20261030153528.0d5113e7@pumpkin>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 30 Oct 2026 11:42:28 -0700
X-Gm-Features: AclHuK-VjFk5niMzo0il-rDmeKs0ZQg3btwvPCyolGTPblfqirktPQXtvuort7I
Message-ID: <CAEf4Bzbw6hZ3T6uO-ah7c0+K9_kc+k32hV88YFP=qPnHos+-AQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Samuel Wu <wusamuel@google.com>, Jonathan Corbet <corbet@lwn.net>, 
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

On Fri, Oct 30, 2026 at 8:35=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Oct 2026 15:54:01 -0700
> Andrii Nakryiko <andrii.nakryiko@gmail.com> wrote:
>
> > On Thu, Oct 29, 2026 at 3:36=E2=80=AFPM Samuel Wu <wusamuel@google.com>=
 wrote:
> ...
> > > > > Makes sense, but I'm thinking v3 doesn't need pagination or batch=
ing.
> > > > > I didn't see any performance wins when profiling libbpf, and it c=
an be
> > > > > added later without breaking UAPI.
> > > > >
> > > > > > on input I'd also add module name as optional input argument, w=
ith
> > > > > > "vmlinux" limiting to just vmlinux, set module name to just tha=
t name,
> > > > > > and NULL/zero meaning "we don't care"
> > > > >
> > > > > Makes sense, so here is a possible plan for QUERY_BY_NAME:
> > > > > - Optional module filter: NULL =3D any, "vmlinux", or a module na=
me
> > > > > - Returns the first match by default (vmlinux first, then modules=
). An
> > > > > ALL_MATCHES flag searches everything and reports the number of ma=
tches
> > > >
> > > > searches everything as in all modules, or you mean just full linear=
 scan?
> > >
> > > I envision ALL_MATCHES to do some form of lower_bound() +
> > > upper_bound() on vmlinux since it's sorted, and then linear scan of
> > > all modules. Of course, just one of the two or both aforementioned
> > > things depending on the module filter (any, vmlinux, module).
> >
> > no point in upper_bound() if it's sorted, you just start at
> > lower_bound and go linearly from there. I don't think it's realistic
> > to assume large number of duplicates, so I wouldn't optize for that,
> > one log(N) lower bound + linear scan will be faster in most cases,
> > probably
>
> Doing a system call for each symbol is probably fine and scales nicely.

Yep, I agree, for BY_NAME case it should be totally adequate. And I
agree about not needing to do full count, just whether there is more
is good enough, good suggestion!

> Just return the symbol number (in the by-address list or by-name list)
> so that the application can request the next one.
> While the application probably isn't interested in symbols with a
> lot of duplicates, some symbols get duplicated thousands of times.
> So you have to allow for them.
>
> (My kallsyms patches get scripts/kallsyms to mark when a symbol is a dupl=
icate
> of the previous one, but after a short linear scan for the first it falls
> back on the binary search otherwise looking up some symbols takes a long =
time.)
>
> ...
> > > > >
> > > > > > tl;dr, this is the right direction, but I think we should polis=
h API a
> > > > > > bit more to be more universally useful and extensible
> > > > > > > +
> > > > > > > +#define KALLSYMS_QUERY_SIZE_VER0       40 /* sizeof first pu=
blished struct */
> > > > > > > +
> > > >
> > > > [...]
> > > >
> > > > > >
> > > > > > PROCMAP_QUERY uses offsetofend() for the last defined field, an=
y
> > > > > > reason to have this #define and BUILD_BUG_ON here?
> > > > >
> > > > > David pointed out that the size field in struct kallsyms_query is
> > > > > redundant. In v3, I can drop the size field and use _IOC_SIZE(cmd=
),
> > > > > keep the *_SIZE_VER0 define (since we need minimum size). Perfect=
ly
> > > > > fine to switch to the PROCMAP_QUERY style though if preferred.
> > > >
> > > > I'm not sure how size is redundant, I don't see ioctl subsystem
> > > > accepting argument size as a separate parameter, so the size has to
> > > > come from the user and be embedded in user-provided structure, if w=
e
> > > > want any sort of backward/forward compatibility. At least looking a=
t
> > > > PROCMAP_QUERY I don't see how we could have avoided it, so not sure
> > > > how we can do that here.
> > >
> > > My understanding is that the size is encoded in the ioctl command
> > > itself: _IOWR() puts sizeof(struct) into the command number when
> > > userspace is compiled, so _IOC_SIZE(cmd) is the struct size of the
> > > header the caller was built against.
>
> Yep, I think that was added by the BSD kernels (but not SYSV) when they
> changed from 16bit to 32bit.
> Linux mostly uses it, but not always.
> If it were used consistently (or the high two direction bits are guarante=
ed
> unset) then the ioctl syscall wrapper can do the user copies.
>
> You'll find that _IOC_SIZE() is used in many places.
> Amongst other things it can select between 64bit and 32bit compat structu=
res.

I see the trend to stick to fixed sized __u64 and __u32, which allows
to not worry about compat. I'd go with that (we have used that
appraoch extensively in BPF syscall and it has never backfired, as far
as I know)

>
> > oh, interesting, I didn't realize we embed struct size into ioctl cmd
> > and match it exactly. I see that pm_scan_arg has the same __u64 size
> > in the struct approach, I'd stick to that, and when we extend any of
> > them we'd need to make sure to either ignore or hard-code the size
> > part, hm..
> >
> > > That said, either way is fine. We could mirror PROCMAP_QUERY style fo=
r
> > > consistency.
>
> There is nothing to be consistent with.
> These are the first ioctls for /proc/kallsyms.

consistency in the sense of these ioctl-based interfaces into
otherwise historically text-based interfaces.

I'm intending to fix PROCMPA_QUERY's embedded size (so that to
user-space it stays the same no matter the evolution of PROCMAP_QUERY
interface). I really think we should start with embedded size zero
here and have size embedded in query struct itself. This is another
thing that we've been doing in bpf() syscall for a really long while,
and given how dynamic and complex that syscall is, we had a great
success in building and evolving API in such a way that user-space
code doesn't have to care all that much about multitude of different
versions.

I'd really-really want us to not have
KALLSYMS_QUERY_BY_NAME_{V1,V2,V3}, it's just a pain for user space.
The evolution logic for versioning is simple: if user space provides
too large struct, unrecognized (by kernel) fields should be zero. If
user space provides too short struct (for initial version we can
enforce minimal supported version from the get go), then we just not
touch any fields added after that size. That's all there is to it.
User space, on its part, just provides its knowledge of struct size,
and then kernel will implicitly assume zeros where appropriate.

really, this is a good way to evolve API

>
> I'd also point out the _IOC_SIZE() is limited to 14 bits.
> There is much less scope for applications causing grief with very out
> of range values - indeed you don't get past the switch statement.
>
> David
>
> > >
> > > > >
> > > > > Thanks Andrii for all the thoughtful feedback!
> > > > >
> > > > > > > +               return -EINVAL;
> > > > > > > +
> > > > > > > +       err =3D copy_struct_from_user(&karg, sizeof(karg), ua=
rg, usize);
> > > > > > > +       if (err)
> > > > > > > +               return err;
> > > > > > > +
> > > > > >
> > > > > > [...]
> >
>

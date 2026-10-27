Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793138878;
	b=eaQNXBMZCRdIbMvHAer7GhyFSOaj7fT9INKg/5d3B7T57aexJLK5r4UKKyu84p/j9+kL
	 FZvMeVGpv8UfPudjNwWVDfh1re/dwUBnlTwRHU7+/JUKcJHGtTv1bPybPmJ1gd2z6fkdA
	 I27BGRIFnqgV3VHBSbcaQrR1/Yi3RQ+VTJHz1Ht/1M5i77TSvDLd759XB74Hh2BKIMNMv
	 2g7REs5MTjUK2cooaVbE4lpxU5in2Kg71c8Bw5EBW9leD81YTOo53egtuJRPiScUuFzGm
	 vUqWOqEUiYfn1J2IbG6CylNxeUjfPJhjZf6prf41D+G259pb3j14rGReJbyoc4o/iVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793138878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
	b=Id5FUJkaDw0vwbfWpMLF7WSfsl+VtBX0tC9G63iYXIr+m/h8RexRwlB9MtULr39xUtZO
	 2g31mJnQn3ywNWL07Dj53jG0R6fMhbMqiekMec3j4iDN+ypMELkLgOod5rvQLuQS3kgQT
	 eizaoTUVOGOQIQEMy/qF9zzBJgTNlhZaCQ9X5yl4GHJLQhd5XU4UxQIAxe3I98Eg8nepY
	 /WCR1Z4/mxSonUHEKf8LzaMWHdSL29Lv4SimomsGLW1ZTn3fbFOLK2E71U3eZOT5nWcLN
	 yLt2BRkweleLZyHZpg1Ivpx/YCX/uspJFOBfU6XbPAXRrNSHGvGvaMC8HI4fuEWeY/A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JndHwKJi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCFF606A31A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 22:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCCFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JndHwKJi
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so225467066b.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 15:07:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793138876; cv=none;
        d=google.com; s=arc-20260327;
        b=disHp2nqdJfWNSLEsEYa+bu0/fC6k2yq2WFGRjhnceL1vQ2CLafJmUgbbI46akWtTs
         GGU4Ul/gc/LP72uAPC/pnY+jg5znu8sD5xJOD5eqjWEgQpcmd/LG52Y32q5Fp2V/oo47
         +4hQNuaYWCwM90e5mM/JNw7fXBouG4yoVbBdm6Gar3yQlUxPueeB1q+7/DcpVsO0yX2e
         trQMXVxK0TOH3co73p0TF6O25rVoAbIAxoN/ht+vDwkB5kLz9ErWRIxsIfDLWzFmsKlU
         3O+uILPHdZ4KkLtlcoMMnOTZtS0UAxLZRPeSWV2d7caQAza6gZXN4QhYObyUUxPffW2h
         Iu0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        fh=nUdw4JNVyJ/Tx05Ymkmhgior2loeLYDwK6MXFrNyKTY=;
        b=JCz+PrVLG1pSKqYFN6O7uR+2npfQjnbWeC26MqRm4Ajf12pQBoZ7rMIYbNFu9QxDGm
         lvGOOUI+friIY2munI1ih3TTsK5hCZRUAb56De6YFTHFLjDMCnSMHBoZ9/fxHfSy7hpm
         AE4PXa0oUC5A69U9aDuXcs6V0upq+g2kmtM3qMfaFDitvenx1fEsslch3p24CK/lIePg
         ETopx5LsHFfSslFTcsoCPCJD4Z6gt0zP6v8wJIWzIObE8reLmMyTbjSqDIUI4hBzs+kY
         ygbHHFz/0I+v5nlkLWbLcaJNoKRMFMWnj4uU2gi9biYVsto/aK5gzRJHlpNqoFkTNJAn
         a5zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793138876; x=1793743676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=JndHwKJiqoQdimfnFC/tOH0NOP9CxQKxSiHFIN7R0ytrfsF1otC25j8OT21ypOBaw0
         SeH274c5gs94bjO0YMSWpQNXnGDmaTecGn12SItZKlKn2t20O71XSnnuJyjslHTVxzrE
         aAuZ1VDMdN0s8JEith1PGtfJvP5bQ3t6fw0A06t14GU6kC17bHFf55OjmQW375eIxizr
         i2JTJ5g1ClaP/isCuqEeFHpCWCC9L8W2JDWntColXyJVJbpXJhsN0FnMsx/BvsZ43C79
         9prCEcfErHTtXqtmR20XD7L0Eg4tfpbIY/LNsw94YqE/9dDt2m4t1kDcuTu9qRDguQ/g
         fS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793138876; x=1793743676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ca2YyfdF81F97G9Km6YN3E8m5/e8rC9hjJrfVgW4DSM=;
        b=NFAAuihiU73h8i41h4dusmEkKMIFCJYmW3L98Nq0q9M6tItJeQt8P1yz+DSg0HYZVE
         ytB62wKdylm21567WoWsQcceYzvMd6O8nwQJMcw946l0o025wTrNQtSn2UKqUmKypDV/
         /MoYKqJ86Q+psfcliuZ8oKrgumWtjxFEDQmcLXvkdn84TUq84Qi3FQU0MTCdQHyX2GPh
         wiR5tJry+QzP5agKiVtHQOuHnDHlglaDb2MTd+XIL5sOCkYZrlmjdLDmrDBjSqtmBNNQ
         eY0tBy97F3pm6lYmzj6BYICCTTUkrBxkNF/E7Ch9gRlBo60FsA6h13o2Y49A14DqbWR0
         zmzA==
X-Forwarded-Encrypted: i=1; AKwUvBxZ5Pq/q06GW1qEdzEHzJ4tm3sJtS1eWj+527OhwOOclTU4Wix4RTOmKs/Kc+8TA0DbUdtxxF+8qws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7yRwcpy5hzn+aGO8nDeQp6793H7C5NCAdidNPKc9z+E13uIHf
	BKmq0SNtRTJ41Z45Q3cVko7lFRyeDXXLcJxPOdHuCYu2kh2K2DeT4zBNw40ElzyU7Mww9AO/Pb+
	1a+f9DPsh3SoQnQ5GZ28wSiAGmnp4RPXU6M3hWXAZ
X-Gm-Gg: AYBFou20pwVzd1r8OtEgEW+WYkId4vNwDfOo6tqclgcbjZ5YZ1ENRkHbk2u9jb+Q+5l
	g5tM/LW0jORLkUk95JCpAzcLzOmyW6mosMP0k+WQzEOxd1g6SaVAHpYOEv5E2y3rrsj5ePTLETD
	gCUPF6xswOvJglVI3BfQPG/JUHB7aEmS/AkJr2IBeOJR/9EfF6mShMU5fNTnqt3IpEJn6LDiB0H
	3Ct8dE6BZV5cvTMPk3PONo3WTDl3ntsVBqE/bS2l1LvJQXcxSBQBoVbJlg9aovAcjR+s8y+AnG6
	Rg6Tk3Ft6WomgDV0rTf5n21g5segefHddowrayMki9NRhDvwQtg1ZoSlFhkTihU1tdJaNVRgPyp
	3pvs0vu9wZaDDazh0f3WkJiv4gbOSfI5bfGXK8kb0WvKHojy4PzSuHRV6sCHknHFj4oLej+uuay
	dNJfrmCoRmE6rk
X-Received: by 2002:a17:907:97d5:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c49bd9e20e9mr50496066b.0.1793138875790; Tue, 27 Oct 2026
 15:07:55 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com> <20261023001603.560210-12-wusamuel@google.com>
 <at8dNNb4vwovNZcZ@krava>
In-Reply-To: <at8dNNb4vwovNZcZ@krava>
From: Samuel Wu <wusamuel@google.com>
Date: Tue, 27 Oct 2026 15:07:44 -0700
X-Gm-Features: AclHuK_4ySi3E2heiJLIOqDTOIX20dmWcYWcaizjPHfB4zOsCZlZ7RMy9jhhzuA
Message-ID: <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> wrot=
e:
>
> On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
>
> SNIP
>
> > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > +{
> > +     struct kallsyms_query q;
> > +     struct extern_desc *ext;
> > +     int err =3D 0;
> > +     int fd;
> > +     int i;
> > +
> > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > +     if (fd < 0)
> > +             return -errno;
> > +
> > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > +             ext =3D &obj->externs[i];
> > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > +                     continue;
> > +
> > +             q =3D (struct kallsyms_query){
> > +                     .size =3D sizeof(q),
> > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > +             };
> > +
> > +                     err =3D -errno;
> > +                     if (err =3D=3D -ENOENT) {
> > +                             err =3D 0;
> > +                             continue;
> > +                     }
> > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > +                             pr_warn("extern (ksym) '%s': resolution i=
s ambiguous\n",
> > +                                     ext->name);
> > +                     break;
> > +             }
> > +             ext->is_set =3D true;
> > +             ext->ksym.addr =3D q.sym_addr;
> > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0x%ll=
x\n",
> > +                      ext->name, ext->ksym.addr);
> > +     }
> > +     close(fd);
> > +     return err;
> > +}
> > +
> > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *obj)
> >  {
> > +     int err;
> > +
> > +     err =3D bpf_object__query_ksyms(obj);
>
> hi,
> we could also add similar support for libbpf_available_kallsyms_parse and
> probably in some other places like bpf_get_ksyms.. which makes me think i=
t
> could be useful to have KALLSYMS_QUERY support for multiple symbols
>
> thanks,
> jirka
>

Thanks for lookiing over this Jiri!

Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
number of tracefs symbols, and n is lines in kallsyms, with n >> m.
But AFAICT, libbpf_available_kallsyms_parse() would only be called in
pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
functions with addresses in available_filter_functions_addrs); so this
ioctl could never be called.

And regarding bpf_get_ksyms(), it loads all traceable functions and
needs the full syms table, so a /proc/kallsyms should fits better.

I did profile a slightly different form of querying multiple symbols
at once [1], but didn't see much benefit. struct kallsyms_query is
extensible via size and query_flags, so we can update in the future as
needed.

[1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS_1HJ=
1wSm7sJ1w@mail.gmail.com/

[...]

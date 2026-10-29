Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793309750;
	b=QK2ZYr5DuLidagPMh3dsv9TuqEaVQKh4//ieyNbTQD1mGcevXaiQXqufzyk0dyrbM9Xw
	 vq2nmlY8QEn+348rVFMiNezyOSd6X+ZiQ+fd+lR+6RE6+faw2iQxWBtwdIPD34pxM5YN5
	 f/mceKo/akVt9NHy3u95GT/Gljo5odNkuCE79iwSg47Z8sP01O6LZYxhyZYIJPL+ltOi/
	 gwZhhtSXP7LnJ5E+4eSm7LOAKxtFlNLA/RBqX08J7Gqrde6yYWZLvXxpwmPuvgbNyp9cy
	 sYu2PWiXG3fqLDVgwsC7B1T/Dr7K4Tp+NaaxyNNMjxdAcKFhwg9i/4yIiCFFYKfevRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793309750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
	b=TwkFcwSzbpuHvzcUiPXxVeNWwmLuT5JB0GeSG0UAeaB5nAGm/FUDXFmUrDeyAypdd5Z/
	 lyJoxx26Enx9jC5kyDnHr4TrxU+cZtWeRTJRFyU95qfpD9WpmWkVPK86s0OTOj0uHMPs1
	 tS0d642VmWy1NZ7JJGXeadTVVJTFvOR2qhO29T7FGaFdojf4sSMZYICxR/WcoQCy6wfhB
	 X7uP2z53J/Q9WK38DXu85xd4aqfQZxmbXg+midHierUIs8rfVJoyW4VSdHXNBGfbUJHjJ
	 sf7Z7k/zu/A8YuZcUAW3YaGURul1f2zZWseaPd3Fz4eKGttkT4fLMOdAg/hr+C5G9Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ny4Qf79m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21A4606A31D
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 21:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C21A4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Ny4Qf79m
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c3f04e0e65fso488666b.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 14:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793309748; cv=none;
        d=google.com; s=arc-20260327;
        b=eA0TQphhzGmFMzZGS30VJmOGpBmHjuNmDKTKuIKo0udagt71mBqCmrKC3mh4bDpnNe
         vnEnTJG3iEWJ4urtVnDqb0clxUOCb2mkVyB4f7USphzv/2sIjewPE1q23yQIz9p1nvDE
         zTcfhzgmCJCNXhRawzziRtk5r5Ye+NYBXZ1u80OAIk8/Y5hLef2hnt79mxjbcH9NkcuZ
         uDfvFIPfR/owsK8tmHAp3JNKkwBIJbGEVaya8PWVyG1NjYHepkCVuZa7Crl2J5OUAPZw
         RD6M+QxIgc+tb3fzgVoDboWJdi2pnL4v2k+lzrstYASgz7BYsRCM8ZUeaNxVyfNv4jV9
         saVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        fh=K9dNZIpdi8AFQJAwDkmTtCDwKJpIBnwrLsDsEGCMwHw=;
        b=Ah9WGcEnDshaazJxIHrh6GFo2bI876URL1d0WCQuN9c33C+RYJAQWPNQCivW1ZfNr8
         CWQbKJJIrH9Xt3PfLkdCwcg52YHOiktXjM9x9IurRMTNZkLBedbQT3QqKGsdnSevIBgD
         gZXp9NPbTOSbLKaNOvsfgNowD9clyqwAoNIvlIc9Tc/ggnGX7rKM0/pgJWcR3O3ZfJB3
         Ym0pYh6dPigYW83xtu7NR/t0e/zaNLl3FhhGm8Vt+jwvoALtf3zvkinljBspqZOf4W+S
         UfJJqeK/dLUMsBRBMMlVTZ6cIidTw/Zo3WqwudPwJdFzfUPPQ6WMlZIAXOOspiKY7iOX
         jiQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793309748; x=1793914548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=Ny4Qf79msA3Ol1Y6e8/IcUAH9yOvaHBe2q/r2VBC2ELpk56XQeNul05malBDOFT8ku
         3iNV5LUh1WN6OSi58GJtPL1CdzJ6Gfdq1EwPPwQTHQ+fJYrr4uuUNxUlmh+B6VBLkI3H
         ZEj0B1DaLGuydvsPOrmNnyN+V5M9uzXhIOuB8IAfuS4x7RzFZc8EHwvHkIbq2HZsSAXO
         f8K9v16/gbB/xNpURIL1Ixe+3ZCyFOiwul7kpsyeMIznZ8WtYjV+3pMV90juEncbUJ39
         jANFHK4YH+YJxQHzX5N4bA9Y7nUKExBRqIOMrQJ2r0F5nLrYhReYCpQZmLjrgHbgSrOi
         AU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309748; x=1793914548;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjT67sODfv8LIA3zVwUGB//ZCy/sHbwEFOtaC99aW5g=;
        b=e2K4A96nnjDBiJm5tqQNR53Pg4OhwHBTvU4Fx0kNiJWM/RLPVxCI7yxPWsVhDRU+ZA
         3h788KhSn1xDAIcVY8MqiS5VrWi/b7k2Jo6pBbWoS5/AHnrOtOqZZaOmN/se4HNLlZr6
         DUdqVaj512lx894iIXPn+K6swAvQd7fcGwD0+s2gcMvd92gtN/phAZf3TzuKkxso6RYs
         WQ4z74+NbvyxgwyYyEvSyYiqTsuM62Ze3v9DjVbvcKuasyapnMgnFDTO9kgPbt/DaMI5
         0HqIaG7be+SfClUE1bkpjhrGFfDbJ/UtSBTwXEe+IAawTnqLuNhgpG+Y4SV/uG9Xb0mO
         ka/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxASzKU7lz6xPwPSBtMCF5iqMHB3c/TmimPRlWNPP99w11RRgIp5Oa2OMPtBx7dtnMrJRCDudwfs2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQJa2qav5LgmgPWtwPImURdYXDSnf9R4Kdh0vAlKwYyB0LQDrj
	PmPhNSim0UcyngLGkMdUZEbFdUagzpYGdn9Y3yPtk7PaEQI45zxUS4tkuHEB084vOSskQUzFsF5
	LpN4U+tW8HWrP45kMiv0cUN+ItHCIpmqXHFbwZbzq
X-Gm-Gg: AYBFou3t35JBmgB6m+R6HYcw67Iti4xDcN1SpfnKHvvJmJfgbDuW+MvcI9MHDW/N/OE
	H0HGkYrDA/4/2wPVVgu45R7faTh8YSrzSduzvKcQRYbL+Ktj91zoRxHiZ+ZyiTesKERdSVh3/ls
	2t6QUInqPihPuvCqJ5a55mqfaLf33A0qbR9MQAIj75qwpPyOc2VfNwk0mlQHbAei155r6oHOzyl
	TelSs/nSJcnwOGbAtYH5nocFuv24uYtW3RwGK0gMZB1PBfBUqSI4m3bk7N4tjkuMr062PwkGhCQ
	UxWhkdmyP5VxtndAjhFMXYqbCS95so5L8TEayitnaRDX94GaIAym+eS66CWk5UtumaG4ncSubhf
	1gUhruCQvZhic+5ao2evZLKAZknCnfM2is3NjggVTyG6vHkQqUHRCtMG1JjI72O2JvRMKR/0=
X-Received: by 2002:a17:907:805:b0:c3f:a728:b437 with SMTP id
 a640c23a62f3a-c4ca7ac07eemr32967066b.45.1793309747666; Thu, 29 Oct 2026
 14:35:47 -0700 (PDT)
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
 <at8dNNb4vwovNZcZ@krava> <CAG2KctpMEuK5OJSedSFshNMSwOqe1g87m2ZOKBhn=Z5iCA45Aw@mail.gmail.com>
 <20261028140127.7bfeab46@pumpkin>
In-Reply-To: <20261028140127.7bfeab46@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 29 Oct 2026 14:35:36 -0700
X-Gm-Features: AclHuK84Rx0Zv6bqYRMUgm-AA1OaD1X9ao32PPa3PHwJ78sUr0bqSyZbITTizzQ
Message-ID: <CAG2Kctra0GYjkzggB0cdMxPK-b9U9x-m+gR6E8goAYvhsNXEdA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 4/6] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY ioctl
To: David Laight <david.laight.linux@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Emil Tsalapatis <emil@etsalapatis.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 7:01=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 27 Oct 2026 15:07:44 -0700
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Mon, Oct 26, 2026 at 2:28=E2=80=AFAM Jiri Olsa <olsajiri@gmail.com> =
wrote:
> > >
> > > On Thu, Oct 22, 2026 at 05:16:05PM -0700, Samuel Wu wrote:
> > >
> > > SNIP
> > >
> > > > +static int bpf_object__query_ksyms(struct bpf_object *obj)
> > > > +{
> > > > +     struct kallsyms_query q;
> > > > +     struct extern_desc *ext;
> > > > +     int err =3D 0;
> > > > +     int fd;
> > > > +     int i;
> > > > +
> > > > +     fd =3D open("/proc/kallsyms", O_RDONLY | O_CLOEXEC);
> > > > +     if (fd < 0)
> > > > +             return -errno;
> > > > +
> > > > +     for (i =3D 0; i < obj->nr_extern; i++) {
> > > > +             ext =3D &obj->externs[i];
> > > > +             if (ext->type !=3D EXT_KSYM || ext->ksym.type_id)
> > > > +                     continue;
> > > > +
> > > > +             q =3D (struct kallsyms_query){
> > > > +                     .size =3D sizeof(q),
> > > > +                     .query_flags =3D KALLSYMS_QUERY_BY_SYMBOL,
> > > > +                     .sym_name_addr =3D ptr_to_u64(ext->name),
> > > > +             };
> > > > +
> > > > +                     err =3D -errno;
> > > > +                     if (err =3D=3D -ENOENT) {
> > > > +                             err =3D 0;
> > > > +                             continue;
> > > > +                     }
> > > > +                     if (err =3D=3D -EADDRNOTAVAIL)
> > > > +                             pr_warn("extern (ksym) '%s': resoluti=
on is ambiguous\n",
> > > > +                                     ext->name);
> > > > +                     break;
> > > > +             }
> > > > +             ext->is_set =3D true;
> > > > +             ext->ksym.addr =3D q.sym_addr;
> > > > +             pr_debug("extern (ksym) '%s': resolved in kernel to 0=
x%llx\n",
> > > > +                      ext->name, ext->ksym.addr);
> > > > +     }
> > > > +     close(fd);
> > > > +     return err;
> > > > +}
> > > > +
> > > > +static int bpf_object__resolve_typeless_ksyms(struct bpf_object *o=
bj)
> > > >  {
> > > > +     int err;
> > > > +
> > > > +     err =3D bpf_object__query_ksyms(obj);
> > >
> > > hi,
> > > we could also add similar support for libbpf_available_kallsyms_parse=
 and
> > > probably in some other places like bpf_get_ksyms.. which makes me thi=
nk it
> > > could be useful to have KALLSYMS_QUERY support for multiple symbols
> > >
> > > thanks,
> > > jirka
> > >
> >
> > Thanks for lookiing over this Jiri!
> >
> > Using KALLSYMS_QUERY for libbpf_available_kallsyms_parse() would
> > theoretically by O(m*log(n)) instead of O(n*log(m)), where m is the
> > number of tracefs symbols, and n is lines in kallsyms, with n >> m.
> > But AFAICT, libbpf_available_kallsyms_parse() would only be called in
> > pre-6.5 kernels, for kernels without commit 83f74441 (ftrace: Show all
> > functions with addresses in available_filter_functions_addrs); so this
> > ioctl could never be called.
>
> Isn't that code also O(n*log(m)) ?

Yes, sorry maybe I wasn't clear before, but the current code is
O(n*log(m)), and the ioctl approach would be better since it's m
lookups of O(log(n)) for vmlinux symbols, where n >> m. However, this
is a red herring because that path only runs on pre-6.5 kernels, which
won't have this ioctl.

> I've got a patch (I might send it after the merge window) that changes
> one of the ftrace functions to look up every symbol by name, not just
> when only asked to look up one.
> It can also use the 'callback' function to detect duplicates.
> That should be massively faster - especially with my ~18 fold improvement
> (also waiting for the merge window to end before posting a new
> (not much changed) version).

Excellent, I'll keep an eye out for it!

> Does look the the code could do with getting the 'symbol name table index=
'
> for the symbol so that it can read the entries sequentially from that
> point onwards.
>
> David
>
> >
> > And regarding bpf_get_ksyms(), it loads all traceable functions and
> > needs the full syms table, so a /proc/kallsyms should fits better.
> >
> > I did profile a slightly different form of querying multiple symbols
> > at once [1], but didn't see much benefit. struct kallsyms_query is
> > extensible via size and query_flags, so we can update in the future as
> > needed.
> >
> > [1]: https://lore.kernel.org/all/CAG2KctozPSev+EXSpHitM3JWfjufQaEjsPJHS=
_1HJ1wSm7sJ1w@mail.gmail.com/
> >
> > [...]
> >
>

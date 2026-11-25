Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795638315;
	b=n03rQfCJWr2ndE23Gw2BYai9fgj31AOX3LeWPmM9/k+IG88BKk9C7REWOqmp5wD3mncF
	 1haCQROhQ0s7iqnuW3gXuaycR+Jn82sCAZMBwazFwlfIuYUmads8FxCb/KfeRO8nLAsWj
	 oT3NLJKlbc3iZ9dxKcaR6B6TED7ypeVYOAHGW7mAdsjScU/UKhny9ThLs84IyR3l2IWIq
	 dC71CoZ31vkklkWFZ89as0fQlwkv8re8Qqeh6xpWYsqKmP4o5KUz0lIA5M2wtNsVkuU7n
	 qrE7lM5yzZBi6cFZUx7uAJiGgB85LwUW0IrZG+y+cbVebYYNH3CJktl9pVnna6rfyKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
	b=GZU8STIt3KhPLYm6e9Ar/6Qzscyws2/Wx6IpWIxcUU+7Q+xWp9WosKxym/7BFdjY8P56
	 Hxw0Oh5PFXvwbvrJYF1upsOIu3MHGjX2M9/8p6NlEx284ywsr/Vo9W9vlFhOvls4V/n7X
	 kkPihjGuTmKSkuwQnekOmaSKQnJjm/N8hdwSw+vgLFuyaWwpIt7UMtFa7ex0z9q/S6PhE
	 IkB80+d1cGkJY0ATaB/Qg1bv6l9XB/Td8OrONm5mDxVPHoCBGnBNsggD3XEtC7EGNtPuP
	 URxDY7hkEk4YzeMbHIqlM4yEFN2As94nelvjozEn1smrRc8kLfWL++9zHFi25Y5Jq7Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsVUFq4K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24F1606A680
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 20:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C24F1606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FsVUFq4K
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so4104031f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 12:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795638313; cv=none;
        d=google.com; s=arc-20260327;
        b=GDNp7dNSvSjlYbLE0OFS6Lf84cgvvDDO5bpFDhyOwvUZpRanU67o7yPeEJh8XLoVvq
         Bt3aOhhxDHQmCitxb9fCkk9kA5UYr8D5B+c2R3Ap+ZajyRn7D/pwS+qxaB+Tq4Mhu8YC
         0FjiR0lw1BONpe5S7hMKbcjZkoTm1+BaRno2k4DkOUEKuiDBJ+PzzlPPBXkN2jg5TKR1
         Vo/KBBjo6nYuCmmlm1/0p0MIQHQCEkTeV9ik4Ax5x2MV/NeKR0d6erk0wMcfvjlt8SHr
         ZrrTfrqGi4E9vv4EhG4fjiH0rmksjPUCqIH4vklpVUXOHpCq333IOes49coNwIIbh9Av
         aEqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        fh=vmcehuDey0Zhc0+MmBWl78QIsZNP72F0ym3slgVYqDE=;
        b=qEgmGyyFnsrJhVrGBZ6f0d0K+YgxEAVbrbXZXec36797lT+UcPiOh9hXlN1ypozqa4
         tcbyjVENNscjCoqaTmUMBBrKYrPhul48ZZO7Ftj8HZ/c894SIJTSU1D6OxgdkfDQAlzN
         igsYBPNQgyhHtevvsFvpVVKhEdhqee2ETmYHuZOug/zQsAH149L6ItfowO4m+MHYpgM0
         QybSjPz/eGeXepVajuIvjQBATMtLOKhUW4U9EEJI9N19bY/jMfv+1IjU5cIlXUa7Y3V+
         idTSejIY+IIIfnRuc+ysxFv44Jh2zSLsQ9aY7cPKJcjxNSIooXV1LmflXE0EtEGnO5Jj
         HACQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795638313; x=1796243113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        b=FsVUFq4Kxydr5a/GRpviIjKPXJDEjD+WqAdPZ1XWo1WKh6FISDbmtggw9Zb9JFW3df
         my0mKvhcR7rXcURvxIiyLaU0x8G53jEG3RdWyadxD5Sjrd3S3bRm9m2X9eRmHdgcwpBt
         kJEx19iUSOYIvPsz94vQNgXJI2BVbCnizYEbhclF+Ay+piUCPYbizA3IKKECYAyth31c
         1cycvaj0oJ30o2SFzRwfoCqCkfAxS5IRdiXE6Aygof4B197kFd92a26XgWumaMHu5NwL
         j2GNWzFlP3MDK3hmVarn2zbz/A34WRbObbIdjkRH2C2OpDhJyhYRxAmTFIj0Zm516Hlh
         0Dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638313; x=1796243113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tNTrkUuaHlHdlSJ9SFhPuXAnSzxCe+1wYBLFF6dY6Vo=;
        b=IB+87bokzd8N7viIFzszxRM/NnsqobaIN9qhBjOUHeL/WZdaRbLIr3Jx4tLNa8Ez/F
         K+g49fZ1cAdKmd36kOdIH2TW01e1hzfJJuCuSgEHXQAvzm6RNUaZKopLl2kL+wRSl9Cl
         T9pkoLn+/J5ow1eOHVQ1zwMze/P31Z5CbMAqmJt27+GbSEm7rUQ63BhrN2tEdo7Vz+mg
         Iw2r2CvScJxA3QO4QPn7r+9nEnMnay2qPCbhK7X+z1XZvilNalaqw4BY/qO5S0jAC832
         InN0A/H8HMGiAoUs678Rg6ZFRs/jKuFoL4TIfamTZUPHGb/sT2qzdx2vQe7xO7dO7riS
         o2gA==
X-Forwarded-Encrypted: i=1; AL+hErHHSDBQ79PI2mudksvAN3iCfcZ10b+SsmQa3tZXd4KKIoIRPIT257Sgf8rxH3383GwWvOV/trGAwzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NKgrBoXEOwPYyFs71vmFdy0pxCUgbYIsAOsZ6N7O+/W/3YWa4
	OkFC1tIIILrmG5ZRgvwBlcVukWJZfL06C8xwpZqWFVGgP/bs7bHQAlbCgkUVbfrXudY+yPNKRIH
	95SrTemi2cP49dGVfeJEqmgYiuidqlkI=
X-Gm-Gg: AZFdTZem0r3Q1lTSmtlctZMDmVk4Cee9RF+N3taD1/HD35WH3PSSCj+wU9Fi/mVv5JZ
	s7zXI0ysEy9mNsMrrnh3CLRdS97qJQ20VGcaTqS+hP+Fw0ttzRVnWCx7r9pK9yTXrEJkj87FjuM
	cGCVPewMnNjPI9TbqtDv1uZeqNB3ScDoofjZnal6IZ9GsAWdnQEGzoRvdo01xKLE6asvEWrPTzR
	lktLtoXwxmre3TUgJi9mjextprGKmVKyY7Or6RA3dPLMgLYdTlsBlLmHabTneDNoRcBJl/yLbe+
	vCQUM4bwr1YLbt+8XID4VgngmYYEn5oRg1jyftp9YDZSZ0bBtu5mL/xW3mcx6VJQzd9yIpSlERk
	fu3PFPuP8uXiscKrR8zsjfyE4fF/hXpHC3IGO3R0RqcKInDDD0xSHZl4czkd/ivCuhzev7a3Y+W
	ve8h+t6Qk0lU4BqWmuhS9LJy1BFMj4n5N5T95F+vA=
X-Received: by 2002:adf:e010:0:10b0:4a7:518f:bea6 with SMTP id
 ffacd0b85a97d-4abb3a4d2b1mr26580561f8f.28.1795638312899; Wed, 25 Nov 2026
 12:25:12 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261113221248.3535369-14-wusamuel@google.com>
In-Reply-To: <20261113221248.3535369-14-wusamuel@google.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 25 Nov 2026 12:25:01 -0800
X-Gm-Features: Aa3M54pvd_ufUhqcRiZwrOrjoyqqBDQhM2r6c2QuhvkGt5RO4ZEh7lWEiXzteDk
Message-ID: <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> wro=
te:
>
> To find a few kernel symbols, users such as libbpf parse all of
> /proc/kallsyms, which is several MB and text based.
>
> Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name or
> by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> and optionally in a single module with module_filter, or all modules by
> default. Each call returns one match and its position; pos + 1 continues
> the search, until -ENOENT. The output returns the address, the size, and
> optional name and module buffers. A buffer that is too small gives
> -ENAMETOOLONG and the required size.
>
> vmlinux symbols are found with a lower-bound binary search on the sorted
> names, module symbols in one pass, and ftrace, BPF, and kprobe symbols
> with the per-index getters that read() uses.
>
> For versioning, the struct carries their sizes, so the command does not
> change when the struct grows.
>
> The command uses 'f' 0x30; register 0x30 in ioctl-number.rst.
>
> Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> Signed-off-by: Samuel Wu <wusamuel@google.com>
> ---
>  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
>  include/uapi/linux/fs.h                       |  43 +++
>  kernel/kallsyms.c                             | 319 ++++++++++++++++++
>  3 files changed, 363 insertions(+)
>
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documen=
tation/userspace-api/ioctl/ioctl-number.rst
> index fbc3537fc9ee..f5dbb597257a 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -250,6 +250,7 @@ Code  Seq#    Include File                           =
                  Comments
>  'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       c=
onflict!
>  'f'   10-11  linux/fs.h                                                c=
onflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   13-27  linux/fscrypt.h
> +'f'   30     linux/fs.h                                                p=
rocfs kallsyms ioctls (PROCFS_IOCTL_MAGIC)
>  'f'   81-8F  linux/fsverity.h
>  'g'   00-0F  linux/usb/gadgetfs.h
>  'g'   20-2F  linux/usb/g_printer.h
> diff --git a/include/uapi/linux/fs.h b/include/uapi/linux/fs.h
> index a46c33692aa2..987569dcdbea 100644
> --- a/include/uapi/linux/fs.h
> +++ b/include/uapi/linux/fs.h
> @@ -674,6 +674,49 @@ struct procmap_query {
>         __u64 build_id_addr;            /* in */
>  };
>
> +/* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel address=
es. */
> +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL=
_MAGIC, 48, 0)
> +
> +enum kallsyms_query_flags {
> +       /* Match query_name as a prefix. */
> +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> +};
> +
> +/*
> + * Symbol returned by a query. Each buffer pointer and its *_len must bo=
th be
> + * set or both be 0. When set, the kernel sets *_len to the string size
> + * including the NUL, even if the buffer is too small and the ioctl fail=
s with
> + * -ENAMETOOLONG. The module name of a vmlinux symbol is "".
> + */
> +struct kallsyms_query_sym {
> +       __u64 sym_addr;         /* out - start address */
> +       __u64 sym_size;         /* out - bytes to next symbol, 0 if unkno=
wn */
> +       __u64 sym_name;         /* in - user ptr to name buffer, or 0 */
> +       __u64 sym_name_len;     /* in/out - buffer size / string size */
> +       __u64 sym_module;       /* in - user ptr to module name buffer, o=
r 0 */
> +       __u64 sym_module_len;   /* in/out - buffer size / string size */
> +};
> +
> +/*
> + * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PR=
EFIX,
> + * in the entries of /proc/kallsyms, except undefined module symbols. vm=
linux
> + * matches come first. A module_filter of "vmlinux" selects the core ker=
nel.
> + *
> + * Each call returns one match and sets pos to its position, even on
> + * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, u=
ntil
> + * -ENOENT. Use pos only with the same query. Matches can be skipped or
> + * repeated if symbols change between calls.
> + */
> +struct kallsyms_query_by_name {
> +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_n=
ame) */
> +       __u64 query_flags;      /* in - enum kallsyms_query_flags */
> +       __u64 query_name;       /* in - user ptr to name or prefix */
> +       __u64 module_filter;    /* in - user ptr to loaded module name, o=
r 0 */

similar to the comment on the previous patch, how does the user
express that it only wants to search vmlinux image and not consult
module?

and naming nit: query_module to be consistent with "query_name"?

> +       __u64 pos;              /* in/out - start position / match positi=
on */
> +       __u64 sym;              /* in - user ptr to struct kallsyms_query=
_sym */
> +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym)=
 */

I'd name it "sym_size" for consistency with "sym" naming, and the
comment/doc here is unambiguous about what that is (struct size, not
the symbol's recorded size). seems fine as far as UX goes


other than nits, this API looks great

[...]

> +/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes=
. */
> +static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
> +                                    struct kallsyms_query_sym *ksym,
> +                                    const struct kallsyms_sym_match *m)
> +{
> +       size_t copy_sz =3D min_t(size_t, usym_size, sizeof(*ksym));
> +       bool too_long =3D false;
> +       int err;
> +
> +       ksym->sym_addr =3D m->addr;
> +       ksym->sym_size =3D m->size;
> +       err =3D kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name=
_len,
> +                                       m->name);
> +       if (err =3D=3D -EFAULT)
> +               return -EFAULT;
> +       too_long |=3D (err =3D=3D -ENAMETOOLONG);

nit: if (err =3D=3D -ENAMETOOLONG) too_long =3D true; is just as short

but also you are eating any other error, maybe write it so that
original err is preserved as is, not special-casing ENAMETOOLONG? if
you get EFAULT later, original error still takes precedence

> +
> +       err =3D kallsyms_copy_str_to_user(ksym->sym_module, &ksym->sym_mo=
dule_len,
> +                                       m->modname);
> +       if (err =3D=3D -EFAULT)
> +               return -EFAULT;
> +       too_long |=3D (err =3D=3D -ENAMETOOLONG);
> +
> +       if (copy_to_user(u64_to_user_ptr(usym), ksym, copy_sz))
> +               return -EFAULT;
> +
> +       return too_long ? -ENAMETOOLONG : 0;
> +}
> +

[...]

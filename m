Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654102;
	b=JzNV8p8g63rdARAKlFtMq4mKDWkz3cp9wHUgFDj0sUtqso1SUP1hqdwzWnxPWF1ZgxAO
	 yzwgvJ1TVat85DoL0dx4/Gzy5KcF1h0qJfOmoPGWnjCZGZDnhLiefoRVhMWHnDhqs9REc
	 I5SE+OmOUpCJTuwNS1VtQ64iI8oyLpx37ifiogy7eHErLADHNj2ImKZNo+/mWaogdIcc0
	 oyD2L+5gjsxXsBK8XJwIgSq3CqkkHyjZ1fgnh2v2jo6N3iZ5yCFiDlk6ch1shz01+Xsuz
	 Kcq4mFubDZ3ySDp6V1yanHpajjipnONzHWywdtcPgR4WcWdKMQf+HI6Zlp/psLYwX9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
	b=mTTFxVWE9pA9YQn6DqZ+2QQZdyDyPTh67JpJEBvrZZrL/51rjrkreFs3NQqO23Ngc9Lj
	 voBjTVxJIzuiq4oFJxl/vc/OYM7f+UzGt1JFwyzTkmu++MNhoE70EWIryy3WI6AcGESqM
	 oEa3nZIQnUadu2zj3m/ykKH3UT6/CqMUzUnl5Q7junw/MK6hynrBPAx7a6ahmeH0+ZTHu
	 XaTjQDga9y4rYfvJVD9tdG9NiCeyN+Nbf5iLFiH5UMoi3atlR9LelZv62hZeBXyYNgjOU
	 Celfxbx8xnoM0pJi17tOW7udEqLidpJkwEtrEcST6aduIcAVg2vqHJBXlvtEwizZVgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QWMZ80Cz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A508606A323
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A508606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QWMZ80Cz
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4395d31228so1090683666b.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:48:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654101; cv=none;
        d=google.com; s=arc-20260327;
        b=dXIE45hnOOU6sGpPgrMOS2hZ8Fuspumn3OWbmY+L0FEJ6x2MBEyrLugQqwMlq39b5S
         AY3X0VzaMbzx8vkQJrufZx97pdxaFdQ5lneV/Y6ukWyOcNTHoEUQrIC6IVxVKNKEIgnx
         CU+HstiSSpaDHxhO2V7sz3OQFsyprtiZ8KtYKdLHdhh9806kQsyRbwnoUfnUlD5WfBpQ
         LrgBkn39kcER6ATkshnAU6bkh+f8R8KdFO2Xd+GPk6zXZxc0VUOKPUPtxdiY1AGizpz9
         6Z5LiRTzNbRFJJ3RkacJg13kRgmzAKmai7FIGerW8JQdQXeqhm5OVht0Xft6/zasi2VG
         kkJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        fh=6o2l48KSKUgOr5UB9Hdfxcsesx2qcCOcx/eSzg7Utd4=;
        b=nBSZHRXOf2gOJpkx9WHcSkfCfJU+S9GPVCXuGgDgNzQug/FKZB5AVDJa6bGvsNkooO
         bV65kqECgvUKVG2EUaREseDbicBpsZTzmNdG7xLHAEsabH1SNoOUoijBPsJvCljy/CZE
         OsAS0M4Wvm4zbjQvSRBtleNYW9gRfKb9gtt7XKONnxHngyZ/gJgmHuxnvkZG/9PALmMZ
         itGhwPxDBE8v9y8+kWsuloXJIZjiXwuqOheRDy8crhxhr0JavVwbQ0iICm8YRPF4EuVV
         DLwfirva3AqzRA4OuIi/V3eCt8sZYzuh58J3Kg75tEtf7m1Y5IbD13BL11AH3wRrfUpu
         tlIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654101; x=1796258901; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=QWMZ80CzZfH6yoH4sucNVvHTrwf1PIcC+Bp2zpQDOXhvTaLR5/Hb6aclEYP0GJ5EbO
         tJUXzbHm5a1lhC/Ax05U+ZOxJaUnTui2Rk4msdPfixijvZGIv/STMD8sdmvdk0JLoPML
         TqbI7e+F27OvNQ1L2QOdn33Qfg3eLkeqAwD6ryOf7vQH0q2dc2f1o0EKha9CE2cwglDJ
         7Sd/maZlmbFd2u6vfPe4Bc4+mGU0kS7nC1KhuBzJ0BY73ENkc4VuiMfat2qIpNB6JRsB
         QZjOMEBbuY0eBgGxKWFhpFa0ZVGml7Ayw5gVKKOPjRvn3VcvJm969BGQaiZe0I0XPK79
         1ZVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654101; x=1796258901;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iCzRjJNZndkziacQw9rQDKbsJVun7kbrLRZjMIP3YsY=;
        b=opRmZBPBWxhX4uuRVLzxh4wbTBZWwh0b1Io2EAEmH9/M2iNPZiFoP0k+WD7Vysw3NY
         nhGMPv4eJOBMhEv5Y+6G7N4nC074nhCl0NMbIhL277pTeqUAF/BpXW1lWG8N5+p4ypR4
         gWUQucuvIMv0ZcXDMiPojn4sBsEqNG2cKqKXga0TmAlyeiP2SUd+BTJDXZLtJh32sTWs
         F0R5T4Vft2NKWGZBiC5aE1PMRzRX11lRdT6OZ+JM39LzipU/weEF6vPDNHK5w5HTBZKp
         W4HNKq+fZiTgOcO/UKWEfVqKSUBCrOj18Pu41WLSmuA824ejihjqhJiuNKgQmKXFxRtZ
         bmrQ==
X-Forwarded-Encrypted: i=1; AL+hErEeF9+b1v3yLVXTBEZiRCJ5xkhXiNZ+AdP7Xlrqky1ETIex6K+z0yc6HFiF2D8BNRvhxRlbc8FSw2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pbTdj3KIB9C6t+JNJlna4Y0+PEnVVX2Za2S/cMeSFdatSHv/k
	l93ZI163VDYUXvrYtNSwmoJQSl7vryFat5BCeIRaKMeGQq63tp5zBkP5bLPLPw8xm+ofp21Mzwo
	fmKfCMe1FGhAamGwIKM6/3pP/jZwHxnU8HB+922JG
X-Gm-Gg: AZFdTZcPe9wLjg5c3PxGe3Qt+tDoi2GzDTTDW4eD/RK+rHLWcvvpcB5MFEDeT8tB/qx
	G52mWjvcBq6X2TrQRKdQm4FGxRFvA7E8cr39ChQwhTt9Oy/ws6GdP/6qKPy272wj/lDkcbEVZqF
	JEtzbuVWwIT/7GXBwIiIX9Sfhf7Ul147Sf/TkA8XIrmDQ5SlL8RxzA0LaYTXIQ/C+oOSwjDbjru
	24vNEZsYzkAd+74NOyah770SJIxpFpdFcHlLIAzY6dkxEyjU3lftF5Ns3VR2OZm1Bd7Gr7jBaD8
	u9gBTPCQg3zWMKSvqYLDPw5Rmj5xso+PFuWbQVLWkdAhqyA0WY9EHdEPmzmQukNVkXKJjx/2JQR
	m4m+JngXUZbIXQ0aRZ2DaFU0ev8ufYgW4wka1hnw4cxfSLftlL6CmGRZ2YMeSrHnTIiU=
X-Received: by 2002:a05:6402:1d4f:b0:6b7:f106:3419 with SMTP id
 4fb4d7f45d1cf-6ba37ed40e7mr16523342a12.43.1795654100281; Wed, 25 Nov 2026
 16:48:20 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-14-wusamuel@google.com> <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
In-Reply-To: <CAEf4BzYLqCCwxSAfuzB-wZiae_tgf0yxAVsFc_wzfRAdeqjDtw@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:48:08 -0800
X-Gm-Features: Aa3M54pWdHazBU-AqLK5TiYQKtZxCNreXkIezAAKXNEVmmWGCBCO_8U3jzAUf4c
Message-ID: <CAG2Kctp-XoiK-Ej3eHWnYyijydej6Bw5sLKNNi-S+xEGDB+mGQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
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

[...]

> > +/*
> > + * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PREFIX,
> > + * in the entries of /proc/kallsyms, except undefined module symbols. vmlinux
> > + * matches come first. A module_filter of "vmlinux" selects the core kernel.
> > + *
> > + * Each call returns one match and sets pos to its position, even on
> > + * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, until
> > + * -ENOENT. Use pos only with the same query. Matches can be skipped or
> > + * repeated if symbols change between calls.
> > + */
> > +struct kallsyms_query_by_name {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_name) */
> > +       __u64 query_flags;      /* in - enum kallsyms_query_flags */
> > +       __u64 query_name;       /* in - user ptr to name or prefix */
> > +       __u64 module_filter;    /* in - user ptr to loaded module name, or 0 */
>
> similar to the comment on the previous patch, how does the user
> express that it only wants to search vmlinux image and not consult
> module?
>
> and naming nit: query_module to be consistent with "query_name"?

Passing "vmlinux" selects only the core kernel (noted in the block
comment above, missing inline). Will rename to query_module and note
"vmlinux" inline.

>
> > +       __u64 pos;              /* in/out - start position / match position */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> I'd name it "sym_size" for consistency with "sym" naming, and the
> comment/doc here is unambiguous about what that is (struct size, not
> the symbol's recorded size). seems fine as far as UX goes
>
Ack, will switch to sym_len
>
> other than nits, this API looks great
>
> [...]
>
> > +/* On -ENAMETOOLONG, *ksym is still copied, to return the required sizes. */
> > +static int kallsyms_copy_sym_to_user(u64 usym, u64 usym_size,
> > +                                    struct kallsyms_query_sym *ksym,
> > +                                    const struct kallsyms_sym_match *m)
> > +{
> > +       size_t copy_sz = min_t(size_t, usym_size, sizeof(*ksym));
> > +       bool too_long = false;
> > +       int err;
> > +
> > +       ksym->sym_addr = m->addr;
> > +       ksym->sym_size = m->size;
> > +       err = kallsyms_copy_str_to_user(ksym->sym_name, &ksym->sym_name_len,
> > +                                       m->name);
> > +       if (err == -EFAULT)
> > +               return -EFAULT;
> > +       too_long |= (err == -ENAMETOOLONG);
>
> nit: if (err == -ENAMETOOLONG) too_long = true; is just as short
>
> but also you are eating any other error, maybe write it so that
> original err is preserved as is, not special-casing ENAMETOOLONG? if
> you get EFAULT later, original error still takes precedence

Sounds good- I'll simplify this to preserve the first error via
something like `ret = ret ?: err` without any special handling for
ENAMETOOLONG.

[...]

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654409;
	b=NboeKkrsQ3E0kjI2amr6tgScSdvtWRy/hYZM2IVcljs+VIDsH77q54Qb0E/u1LOTX5EL
	 B+4poUusHIPePyue2Q4pcGZaAhPhlGqmYyuQT1JOwNYDkGOxorph4TNwcul1Smj80tXsn
	 UQIh3AG9hTn9FWpRyrtgT0IzndBcuc00ImysutI7y/aJk6CPR8/SbdnM+MYP0IEDfC225
	 ezqWfbzmoUaOks3U/T95sFNLbtXXTRktbZTcDQ8CHY9hrS7NEFVFvICAm8LUtth/OkKD8
	 orvItYUk4uzkQehJWSzw9CrSMHUN333Z5s7lmwS9oJgdvcUHtz1L9rBcHWklSCcaFzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
	b=dYtzgKo8ZsBN7Xl1RVtWcykPXYL9qJGbxV/htNkljLiQdo/sxONGBZfx8nElCpKZo5vp
	 To7yrzQX09PL2CONRQDzL2mJHt2rlnejL/ErAHzRmz0WybMfXlJlem3dyKeYsUp/yRz1I
	 fHER54a4bFxqWQ9Bb1xhjWMY5VjxjDkcIBeqsluWpsxULsKSVmMFCrEE1/F+vdfKO5gU2
	 7bu+Rk2DhFseFwvMrQVGUtwEn2nn81BFM4NGLq/ok/rbv1tpJK4QRqKGEtDxxYOojEx63
	 wnm5G3kdzmB/EYjGxLjMqIe1zy8gPzi2P8DaINh1sbLuQFBRbWMb/Nz1aeDRTwkH0HQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMbLOmTg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105C606A330
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3105C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OMbLOmTg
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so1038065266b.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:53:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654408; cv=none;
        d=google.com; s=arc-20260327;
        b=SkxibWMchuQ+lwNm+VPfw33QOnhISHSbVgggf2O+HfYYd79uFhLo+k0CfD25h6+ArK
         Lwno+AHBEyeigqDlmzF/kKsQuBLRqNsdMWClNmLYL+wtr36sR2qTMWvvJyiOVmLbS4U5
         J7sia/o6Uk20lYQEN89vmW8tqgvBuSQj3uHSmCWEatSoFAJxK8gUqRen9NfcmVIL31j2
         3eHZ2VEJH1Wf7WBVXjoZPkySXqMkAdOzY9PNn9NtJcjO0QkCPHuA+Hs3jkK0d5y9dhJP
         MhVL3ZNGTdqokAirw50NtqGIKc6K2TJl4ajVYPERF3dRrRyJVa+en3lOfMGv9bECFnh/
         yn2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        fh=O6kMEf0P8P85ZFzRme9Xtudv2RlaCAqWktLoNXFQyTM=;
        b=Mm7I56XrZ2S6b3xwbf1yvkwGy6lY2VUr0D12hArHZjLNYYAymDGz8yLQULGxqaFwSw
         g9FwTBiQ+8njhS3gcBmL1idpc3AUPayJ7lJqyoGhDbDv7LF3mUPpA4XxWhFtbQarzEYQ
         UdWr3tKagilJO2Zy+UN9cNY/9mKCSrzRGmFNYHiCkmfHJd1OsbJ0a2yOGN+ASKs9IJUh
         ZJLR2f32SZsGn0M6enmmg/WJ3SoqPMLmANFoa6VK/GLxJHKglrme+M100N70diUnZ1dz
         RRsgspdHJsvf+Tv4EEN4dE4X+Vb4ohxFTUAloXsyDkrYDW3Bb6Y0nJzELO6jM14fNL4D
         U04w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654408; x=1796259208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=OMbLOmTgwkBLdVF5EdkYSC2XrgccLIkkqOXgyFgiuHmBsv8YiKTp9E0NEIyhirgYwo
         BZ+ApH53YZ2KTVkaJNbDjcMue9DCSXid0Du4+70qfpSn/U6BPQcaO0rTHvaEKiMrhjq+
         cgrO6KnCn2xh6qE6NyajQBDq/7N3cmFb2502QyBeGyuN0J8TZ8STFtPa+xPXpE5PEied
         9EIDboORco4TC6wv1vXi5MBxzHo/qEkcV1RPpsCU6P4rl7yl2ijcQhep5KTjor4bMPiQ
         FloIu+x3tOotka6vXyHSWrSW9RsgR8EkvzFkVBto/arghTtNsJHfG3gnYoPBAaEQS9BY
         49RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654408; x=1796259208;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssrpjNNwMPYh08mQfz/FC+I2tBSrmUfphBtDGQUYlDo=;
        b=eo0qrgijNKn/uC9crF3nqV1/7F10sC9n7w3NMaLT2sQgSm84soB1nYbnm5z+C7nbAY
         fOS2FkJYI7en+QrwDWULtIlGCcX77SYi6n0w6R7qAukeaQnY40MjfJWPveZBovDvXJXf
         Rl8fhr1gRgY4aTjePetzOAjvBBDcBuLHEd66JarvpXq+ve034YDe2vyFmKLxGQqd11yI
         IygxrxUwBMckcnVdFfnB9bgVfCKH00hO4r8uCNTKDTi262UBNc+q16UM2FNuyF+EPrSj
         L4ohKUcqnOGjfLTgXvRBsl535yXhqbqhWfn2zhFD0K31WJr+BDwVKMRR2MXiqnZGaPVd
         B+6g==
X-Forwarded-Encrypted: i=1; AL+hErEmT6uiyNfuusk+cbr+2rrq2TvY4lgiC29sIYYkTqa0+aPxfpC6te5jjYVfCFj/u1ahRBIxpTE08oA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+BE22JYaikTTLNLi0Qp2/t8za/Ho77glOpu9K2o6R4iuQvln7w
	w7C5uhUIGVjepWFbVrDB8iwSat3sWpD8yDT0cUtkueGMKfcWNhMhz2cjaZey0lMHKniL9SPOpTT
	lreJc1pUiCqVFIMpjBkywRyS8LSFXpTE0hkXKVyla
X-Gm-Gg: AZFdTZf55MKweUkz0QKvOT5J8AvMgP2QTLiEgReo0Y3OOjNlnC4uYLMCPx+RZPd98Q4
	WprBb8uyen3BH0q28A+U3LPZMOv7niSiFKHnnyv7NMkCvX84cwLMQrEfwx/7230Dm8VBBJyAFEH
	xJmnz7lH2IwGuUwlJaDT4jMwxSJ7D/UNUnUBDC+lOS2/zaCWm+q2b897HoxjhPjFIRT0BtZpfby
	x2cfekjuhHuu6zrln0ZQ8oh9BhVkpECHG4ByIkmwCDVrXubdofKu6uy2swSW0WGFDzd7Xz1roYT
	s9PMIzAbR858P38lWGL1LB/68SvsLVtsrbJSdm6vEUHqeiKCpRAkdY1qEjOQSB0LpkkDqCEG1ES
	Z7osXH6Lk501v6xPfIGcTJ9ggTx3eNU0kNwy35kumlODwXdaTYCKiG28smMg63N/o0Mc=
X-Received: by 2002:a17:907:c643:10b0:c2e:4292:d27e with SMTP id
 a640c23a62f3a-c513a816d3amr1138026566b.22.1795654407168; Wed, 25 Nov 2026
 16:53:27 -0800 (PST)
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
 <20261113221248.3535369-19-wusamuel@google.com> <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
In-Reply-To: <CAEf4Bza48tGhcUhFRhSSv3qijV0uF8YrAQcLM6Qv9az-8zvK_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:53:16 -0800
X-Gm-Features: Aa3M54rfuKAHSB0QMI506grzDhwAStyJm9gAvy8QXVpNXfEJd-B8LId_HiOPEPc
Message-ID: <CAG2Kctq98pvyV=jmN0Di+p7m0AWQKg8+QF5YBvdLi79kTJaKoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 8/9] libbpf: Resolve typeless ksyms via
 KALLSYMS_QUERY_BY_NAME ioctl
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:25=E2=80=AFPM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Fri, Nov 13, 2026 at 2:14=E2=80=AFPM Samuel Wu <wusamuel@google.com> w=
rote:
> >
> > libbpf parses all of /proc/kallsyms to resolve typeless ksyms.
> >
> > Use KALLSYMS_QUERY_BY_NAME instead: exact names, plus "<name>.llvm."
> > prefix matches. Ambiguous matches at different addresses fail the load.
> > A missing strong extern still fails and a missing weak extern is 0,
> > without a text scan.
> >
> > On any other error (e.g. -ENOTTY on older kernels, or -EPERM), fall bac=
k
> > to the text parser.
> >
> > Signed-off-by: Samuel Wu <wusamuel@google.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 99 +++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 97 insertions(+), 2 deletions(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 44134421bd7d..f3f3475a64d3 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -59,6 +59,34 @@
> >  #define BPF_FS_MAGIC           0xcafe4a11
> >  #endif
> >
> > +#ifndef KALLSYMS_QUERY_BY_NAME
> > +/* 'f' is PROCFS_IOCTL_MAGIC */
> > +#define KALLSYMS_QUERY_BY_NAME _IOC(_IOC_READ | _IOC_WRITE, 'f', 48, 0=
)
> > +
> > +enum kallsyms_query_flags {
> > +       KALLSYMS_QUERY_NAME_PREFIX =3D 0x01,
> > +};
> > +
> > +struct kallsyms_query_sym {
> > +       __u64 sym_addr;
> > +       __u64 sym_size;
> > +       __u64 sym_name;
> > +       __u64 sym_name_len;
> > +       __u64 sym_module;
> > +       __u64 sym_module_len;
> > +};
> > +
> > +struct kallsyms_query_by_name {
> > +       __u64 size;
> > +       __u64 query_flags;
> > +       __u64 query_name;
> > +       __u64 module_filter;
> > +       __u64 pos;
> > +       __u64 sym;
> > +       __u64 sym_struct_size;
> > +};
> > +#endif
> > +
>
> there is no need for this, libbpf in kernel can use kernels' most up
> to date UAPI headers directly, and on Github we sync necessary UAPI
> headers into include/ directory, so libbpf source code can be built
> with latest definitions of kernel UAPI. So you can drop this part

Ack, will drop entire #ifndef block
[...]

> > +
> > +       while (!ioctl(fd, KALLSYMS_QUERY_BY_NAME, &q)) {
> > +               if (!ext->is_set) {
> > +                       ext->is_set =3D true;
> > +                       ext->ksym.addr =3D sym.sym_addr;
> > +                       pr_debug("extern (ksym) '%s': set to 0x%llx\n",
> > +                                ext->name, ext->ksym.addr);
> > +               } else if (sym.sym_addr !=3D ext->ksym.addr) {
> > +                       pr_warn("extern (ksym) '%s': resolution is ambi=
guous: 0x%llx or 0x%llx\n",
> > +                               ext->name, ext->ksym.addr,
> > +                               (unsigned long long)sym.sym_addr);
> > +                       return -EADDRNOTAVAIL;
>
> I think there is ENOTUNIQ which we can utilize here

Ack
[...]

> > +               /* Check exact name and then LTO .llvm.<hash> prefix */
> > +               err =3D query_ksym_by_name(fd, ext, false);
> > +               if (!err)
> > +                       err =3D query_ksym_by_name(fd, ext, true);
>
> err =3D err ?: query_ksym_by_name(fd, ext, true /* lto_prefix */);

Ack- will update in v4. Thanks for the thoughtful review!

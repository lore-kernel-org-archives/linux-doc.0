Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793914614;
	b=SeGVhLgpCFeZHNxx3wRpsWuCPU9hSdohg9SOgPDIvU/D3kpCyf5JL6SXVUkOA12+ckba
	 baDTqD7Mszj6XeZ7VKsxZiGr3eR3zBDIanU2b7CeOb2YkbHjhFbQl9lL80PP7kANiqqyq
	 O0b4pO5NZz6aEG8BZsihTCNVCWVkbEULE/xeNAEKoAGBAGVefl2MEF9572Yvh/tX7iM3p
	 2ILrkf5TS8wolNLUBC3QlYjc3Y3uW3bSA7JhHU4kD/E5Ld2+0LPtTHSbEw1noJXX0kWvJ
	 FIx75wVpWhPWjcYgxB+U1DbQeA9hmrcjIenaNqoVkQnKcsiBASUhBQuagpiEDV3+RoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
	b=iM8vcnQ1PgocZHL/xdz1upmNQjv02397s75PYzE5ymxk8Ahx2P1Fq9yAPn4fbpwldXld
	 Nuv8RftXYMyI94qhaaLNSd26jVLkIQBhz8hL5kq6eaii3IDtQrq4kWKQMwMVIAmhDGDa4
	 9RGquk2wYYAvpVIpDY3q7leoxpNeHVVQFqXanLipK1W1Y66sAmq2wzdSg96jR8rk2Klsz
	 Fm9kMq+VodYpxHzSlKEJmoVPn2KQMvwYpD338h1VrVnveFReyAMQO3bg8Lw27MfHV6xI3
	 KlPDMHsFzb3gPTx0mn7DNgoJYMhlGCA3zsOnqyCRDLOs1ltIzDjtMIJ2f7rxmv2GQ+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qNV3YK2A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06C6606D801
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 21:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E06C6606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qNV3YK2A
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c247f6687dcso407239366b.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 13:36:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793914612; cv=none;
        d=google.com; s=arc-20260327;
        b=Ft7jeV3wrck8v2ohptHGMl/iAfRCenM9Y/8lXTQsAXLiBdudEnCO38SnRVrdRvPJye
         pDksRln+9vYtu3hLTds+3lR+Ywi4Vens5JY0jP62VBRbUZkgG8togDS6vy7br4D+faNO
         6QOiP+/kv4iziMFl/1i6mee1ekqZJBCKbt3u1oiR/mpzERv7GLXRBLxu7SLwCjd3XXFN
         4vYpo6zpqN5ST8rQFIyOO++SatJVIa7iB6F4aXRfKCpPUPRhxJaqSgfei21dWoDZ+8P0
         i1T4Ocy5XNZ11tP1ls/EaW4OD3rrSVl5Ds4a1F1jQUuVcowuUcWTJcgtt0XA4+rOW7RW
         DyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        fh=DLzwSXVNS3f6rGC/ouk58hX85xdaV2A6HvFoe0SoMO0=;
        b=htjzzX8tHsQP3yIgMRKOi8oQE4R7OQ7K4dQ0gmcLXhXr0kj/Hc72XZdscz2BdmcOzp
         VUXIEl3J+LbfqnTf4ktDVTrA1fQiWRmNI5hx4zm1x4WXzX4bNhu0/9p6IYPlirAkHiHh
         CGjN1TAyYqjJbXOxmWeoxVDUhBEjTUytYwaetIiXXEh2cCxYaLyIKXlSKzMb/DtRII3+
         jGl30HorRaR9pknElNy0Xzcclqe7acOoGAQJb3IgVhZTcAc9eM+tN7AuUVwiht0uISg3
         mqVAgey1UYyNUmMYD0j3DKZZuYxlKeQy1CK7frcp8ka5yyUZLqgOHmp2yAnOiA/+Cj2k
         axUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793914612; x=1794519412; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=qNV3YK2AvifU1tOsCQ8wk4axq2Bpnp9T4w05lcq35MoN1lflDph5Y1IYtTpLN9oiu1
         oljv6zhoDl0Vdx6KwOE+YZ2XrvF12KIBahqeuzL0AI1Ihf1xglBIFGRlNFmbLRw1BvGj
         cHOsnpHe5ExcVUNebf5XytYqgD/im+o9YfI2/bO5gRjiKXBfTL4w9S2eMuvmZ4trc6CA
         kCNJxMHTFWh4eiUO3KMPLUXRVAjTsqzWtt3brnLtM+MWPucllL2IlplxbMf3C29B/5Fm
         Zq9m93kWEpns5SBYbYB5Q3+CTVkb/fUXg2wz7C4TsaW16nXsgwuTB3NnvQNvu0l335c9
         ZYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914612; x=1794519412;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2E4Xme3iGj8AG7tp5kyRL4U0PVxMRPmUII8euE4aY4I=;
        b=tBze9vf316W39fYkf8k8y9lzzNts0rcQ4ERyIhuicC2+Aa4u2YUc8Ysw+6bqj6an9/
         xAk6WX2H6D0POrbPlXX38WVGBgbSUnzi5q3J2sPUU3qdtGKe6YjZnWZi0vXodRkTlvCi
         w14SWJLwzPObXQcNvP21sfTXbzxiWYvvJrGOV1bkEz31RdT/kn5q57rzI734T96d5PZd
         F8J7NYVO+k7nder0i8Ttkg0a7pFvtOnpXuvUQqGipsC7k3/zbCecPdOZRTeKpCPowYAO
         SXWXKqQNwQOmQ93FJjDG+YiwiOFhj0FokwczTmIQOf3zqfMOUZTLnVubyHmFFreBY0F2
         mzhw==
X-Forwarded-Encrypted: i=1; AKwUvBwP6Et/7BsWF0F+LM5RK0tTJ5iMZNSZdIZLF67RuCQl7pbuEZUCbbbpBSRdx3HiRxPMHSovttPGv6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/IUvlK/yJpPVs1KbS3GRRY9eh4A5UK1sTCA58gpkvt1lrULoYR
	XP+kTkdmRHEZF+oN3ETxDsqLyGWfTVcvUFND8YWR2BcIiQ2GB3aaQtJa7XhbXpPCz5l0Yd1Bqvk
	Ji6o9RXEowZIpLXgzRfWhZDf8XXx9FbbGBtj9FzCs
X-Gm-Gg: AYBFou0SXX0uOZEyJcpfCMFrtZbefRqE2xW1cAhGPiO3PDgfz2yF8f5qlU4FOpfoDvI
	xxBk0D0+KiYbIOHXjv+yXheq2C3bLbMJFXRljoRj9Zi1GqnS4k3h7stKN12jNVhtBLYahPPpysI
	lUMBu/Syslt60lMShFICHYpsHB63XtCy5wcUeQS5xwO9bgw7H2ICUoqjLrMKGqh3UBg/VtaNXcm
	bOeXJVWBg5uOZzy/o4uJPbG9soszO2uagBvUQmfV+XJH7xIWCh6T9ExJ0ZMLVvBuxLfzQgVdhRN
	1l686VxEWgcoqLawpAMN8oO3ybx/4GhSwBn0T9Jqfm7NnCxVQRUXYT4S2LWdbAC3bTTz5jMKDw/
	taSHmYsw11S0ZoVcQvhaqzYxvy0uYRKLXeMp5yG0XruhQhFVz/wgg95KmZcyGLzwJEME8hi0=
X-Received: by 2002:a17:906:9f89:b0:c46:645f:cedf with SMTP id
 a640c23a62f3a-c4d3546bf6emr55329366b.15.1793914611758; Thu, 05 Nov 2026
 13:36:51 -0800 (PST)
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
 <20261105083712.14847dcf@pumpkin>
In-Reply-To: <20261105083712.14847dcf@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 5 Nov 2026 13:36:40 -0800
X-Gm-Features: AclHuK-4-3cdEVpuwe7ZR8h4IzWEsLs5z4V7r2FIsMuL4z-PpEQaIZ0fXLkqICE
Message-ID: <CAG2KctocE=kj2CO29D0tVmrBeWmCDYA6FhpHr-7ZbD63GM1CsQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 12:37=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Wed, 4 Nov 2026 16:05:52 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > > I think it might be more sensible (less pitfalls later on) to return
> > > the symbol number - not that of the next one.
> >
> > What pitfalls were you anticipating? If the current symbol's position
> > is returned, userspace needs another ioctl() call and an -ENOENT
> > check, to learn that there are no more matches. Alternatively,
> > returning the next position means every call pays for a look-ahead,
> > which for an unfiltered query walks the module symbols even when
> > userspace only wants the first match.
>
> I was thinking more of the kernel api.

Ahh ok, makes more sense now. I misunderstood your previous reply to
be about the ioctl(), not the internal kernel functions.

> The 'position' is just an array index.
> So a 'read by symbol name' would return the array index of that symbol.
> A 'read by symbol name index' would return the name (uncompressed) and
> do the lookup (binary search and linear scan) to find the value.
>
> I've used a bit in the 'sorted by name array' to indicate that the
> symbol is a duplicate of the previous one.
> So checking an 'exact match' for being a duplicate is cheap.
> But for a partial match you start needing the name buffer to be in-out
> on the read-by position request.
> So you start needing 'read by position' and 'read by position with
> name compare'.
> It is likely that the caller will need to validate the name anyway.

Got it, thanks for clarifying! That works with QUERY_BY_NAME in v3:
- In the UAPI, the input query string
(kallsyms_query_by_name.sym_name) and the output matched name
(kallsyms_query_by_name ->kallsyms_sym.sym_name) are separate buffers,
so the name buffer is not in-out.
- In kernel/kallsyms.c, the vmlinux lookup only needs the two helpers
you described:
1. lookup by name/prefix -> index
2. index -> uncompressed name + address

> An 'interesting' idea would be an ioctl that returned the value of
> the nth symbol along with the name of the n+1th.
> That might get confusing though.

Agreed, it's simpler to have the ioctl() return a single symbol.

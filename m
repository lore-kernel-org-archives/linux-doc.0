Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793837167;
	b=dhUNg1tQgZLfadOStRdd1Qs51ZuMpMJwUkeYu9wm1dE4yUiAWg3mDE1Jp60rzJ4E0Lj0
	 a4JosISEvkWTHr2b1XM5Etb4iNvanWq/u4PgNajZrLEk52HrFL0INv9+NPDA5dJEZDXEY
	 YpBqWuzxFKZZ8kp1iccX2Egt+sAE2b6dIGALx02hSgZKARSdIWpeme/GvKp2U/TW4K7k7
	 GvvGJmqPLyJS/5b8KXtU3N+q5d+PWCBUoXiUYR49Bd25DMcCCAHZdBGX8yNnOKaKnmL6C
	 9T88+QOKAEL4o0p5w10OVOXMeEUx3XgClzIDdVCspkQlDYIP9RlZhZ562BAg9t95+7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
	b=LeWbu5OjOM00jhv/boTQVADAMP2Q4AMkOQ3k9qqdrliDqiO63tnXgvh7DeKDD71CXJ4g
	 5vARmeu9ZEKqpGB7UN8Rm8pvolXxW2ImKCdel1IKVgzRWoyt3jdeZHeHwgo9YlHx+BdZG
	 OXmiW73Q6sI2TeRUojsIBluH3PmBCpYKEMtAwjFt36nDiHlYM8iSlzVb73XOI/XMW6i9P
	 1PeGhym5JlJrSn/tXo3nf8qiJpNkyZWtWF+PbFd2u1eBU7ZuUTn7Tz0/JgzoPtHwxrCy/
	 cQQxeZx7IEkbJ1mxPmvmx2sIHpeIuo2MpQF8HgZ1EADqLT6xMesqcY+RpW5dWYWyfMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UW7+Lg7r;
	arc=fail smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806A606A328
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 00:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E806A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UW7+Lg7r
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c45551fa84eso216383866b.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 16:06:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793837165; cv=none;
        d=google.com; s=arc-20260327;
        b=jqpF9kPc1x4nyVSPiWGLsVIHbqlu9D8ACvlJFmSwhNfYuCOHdtFxejURH7MYXU4Lot
         kDQHKi2xc9ZygTNAZa3nWEX10XtEh0My9D4buM7s7EztfThYHkBOxXY7uJHRB9X2nqSS
         Wx160QCsax+kqqksZEL1W/AKKimf/u6gEChxjEU2Sm26kZPEh/12wtOiJ7gSQwQNtVq5
         hTq3pJvxXwblfZbWnF9YfrFufNyQBTl8mplimZI1LnLmjkK/JtT0VUqK3FkCCMZESTp2
         NwZJD1/uveUP7eRkTqiX7+lhqlapqaQJw6s7z5MGHFPaW/XQ5m4G/QHQSHZKqoBrXB/I
         N0lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        fh=1I//HqMr6HUUrzP56PY1rztw2N593Bq1sYczjVigJjU=;
        b=hjlyUB4rYSZ72gkj/TVwi+XIXZGtCxTU3whb2kpRzAr1lpXnmN5TOPmcOMJZK6qdtz
         D+zpbIrdOkRDXjvKJW4sm8ViAUVMVcsF3qUe9IaROyTV8qEjN0yLnOE1N3ThgeuEPPeo
         1qRc9ROlNeJoRsmNwGYm7GReSM0K3sygum3p6ORWh8udI9aWEKbGtMmSGFe1dXsfgMrk
         DNXDr9scB6OVLFE9Wir9671FB722+aCc2S1s3ExIDVhjYAsE8fbrCvj7S+1D4EPKb6ll
         nYQjS8edxQbnKlzc0BaeEy7/sduTTZQU1WIXaXl9KIDrn8Dds+tN5ADBVKf3hEFWF2um
         Khcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793837165; x=1794441965; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=UW7+Lg7rFdK2cPOSHdibyhfqd0mNfE52oRphbaahRpCOHjIZJidko9tTbllyzCryjy
         siNubT2yNT8UsddMzx39cRlaaf4u9pnE+6dIm/dTOyiVwyDFMyx/T503O/SAkgV4IgXs
         efUG5InyQPdPjXkVj3FyrgQw8Tp3Uwud4aaLkD2TGlBzm2pE66Yo0XieOJu07M7lI+DV
         gUkNX9hygDXotIY7g19Ob5YY4jcsnCTMlsFTY/Azp5LW+ukD9CKA5AAnTO8zpTJXxWqx
         5Vgp8TB7FfNb2pRMsONUAcd0wfnBxqAeiMrEDvVnn/35z4BZWsrn2RkRHETiQqHGP/C3
         KXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837165; x=1794441965;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rBao9fgm6zvnqMZ/xw9mMi296PqW8mAwycCLa5M4/yo=;
        b=esSvpjL6ufQiXqibxxUlK/PHDaOUY3dvcp/v3z7dCmI/BbxHV+uDCI0b0XK2Cw3ke0
         Zrt9p2mB+6Ot+cC3yKIsRsUysmjeJcuSNWs0mKdGvSDI3NuICul8pMgvfxuDGsWsgRpD
         SV/n1IDhGmtureGF5Ap14R9YFxBD5h+RDZETQR8dItmj8O7ZzBtBSw8cxnN0VOTi6yCX
         /MKAor6YxvmfoDfnpR8lhDXBJZ7Azem8SIY3wJCBv28Mu3ziCHpsUfb/fkCg/bD7j0CN
         MMCm36HXWNBLDHgtifHDeBrwLbY9ewYSNqe7K7v2zuxnxV/7oS1kevJHNmAi4lAh2+96
         lmPQ==
X-Forwarded-Encrypted: i=1; AKwUvBymV3SrXUWY6HBo3uO3fag01h+nqfeozhfwfYciuY4avY39StNFXivVt0DwH+bDoH1TKaNaWFDVhzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IVz/+ayTjjCso134DdTuOBp+lNPkzvXh4ylevbuLruyaB6A7x
	nPl5WGoI3/ZISlKve9/qRuJuHZEpTWAMdxklcyOywDAhjsU7/gCdK5XoKCY1QDbn2wS8/5arX1J
	Ou2BLtmX0Pn2Eh0BaIjM/ueDJi+tQSsIjYigTLUKr
X-Gm-Gg: AYBFou124SiIqnHFm6cL3E4VB7L9t2nNO31ugCGtwZN1thwSm4NElmGQTd76A6Lmv7t
	aUu5x+a2OqYY/Keodr7j3NH4bBXTg7I4hg7HX2GGyUEFWuJsUW8acnbQx6lpZvmuIIDmVxlV0Bu
	TP8knL6BuZvS4ljlxGP3Y/l8FcaseYvK1JB6JfKvDpab04EL9t0N2etLTbRNH4mImFoTN6UF6rv
	JezK7+aNY72m9bLeWRbn3MnDkZiWeyOo2EEByuuUgGUMocrXD1gZFdJcH4SSdL9QBYWhGq3EJ/s
	l/xySDlk02hpthvKitFXSN/IfC47pxyPg4PEN20OJ/9fsf1dmcb657Hl5K+IMN6gkRa/SlxhRdp
	P+P+KCxWEq6+GaGY33wE1C8U1drJF9ZLwhsIqXSIhZ+V36KnAxB8uciUPRR3H4nqLQ+mh1Yg=
X-Received: by 2002:a17:907:3351:b0:c4c:b560:2a71 with SMTP id
 a640c23a62f3a-c4cb5603d9emr979541566b.36.1793837164883; Wed, 04 Nov 2026
 16:06:04 -0800 (PST)
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
 <20261104142307.431fc12f@pumpkin>
In-Reply-To: <20261104142307.431fc12f@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 4 Nov 2026 16:05:52 -0800
X-Gm-Features: AclHuK8Z7yNuvzdyvQXTyXXmXbvszi-XVmOSWc_IPj379xX-z3zgWWYR8Kt4UgU
Message-ID: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
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

On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Tue, 3 Nov 2026 17:14:26 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > <david.laight.linux@gmail.com> wrote:
> > >
> > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > Samuel Wu <wusamuel@google.com> wrote:
> > [...]
> > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > > would be different symbols at different addresses. Please correct m=
e
> > > > if I'm missing something here!
> > >
> > > Only that the user might really want one of the copies.
> > > Sometimes there is only the copy.
> >
> > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > pagination to cover these. A prefix query for "foo." also finds the
> > copies when plain foo does not exist (expanded on this in my reply to
> > Andrii's Oct 30 mail in this thread).
>
> I'm busy rebasing my patches - they got stamped all over :-(
> I should get a v3 that applies by the end of the week.
>
> I will add a 'prefix' variant for you.
> The 'next symbol matches' flag is exactly that (actually it is a
> this symbol is a duplicate to avoid issues at the start of the array).
> So in this case that application would always need to read
> the next symbol (by name).

Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
approach so the two series stay independent, but I can switch over
once your series lands, so there is only one search over the name
table.

> I think it might be more sensible (less pitfalls later on) to return
> the symbol number - not that of the next one.

What pitfalls were you anticipating? If the current symbol's position
is returned, userspace needs another ioctl() call and an -ENOENT
check, to learn that there are no more matches. Alternatively,
returning the next position means every call pays for a look-ahead,
which for an unfiltered query walks the module symbols even when
userspace only wants the first match.

Andrii, do you have a preference between the two?

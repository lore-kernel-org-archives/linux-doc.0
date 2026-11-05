Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793917931;
	b=dXs+HoezW+e460F22vjsJQG1EOdhMuoVHV03jaQ05+DPKzOnolAef6U0bi61r8bZKbOX
	 iLWLTG7HebxiA/kXgykx/f3xiKKpivwPuXfnd30obFppamWmPheYrtbFRha/7GxJScE7F
	 goSbxC1Uy6aFVJlikq8ulsXLXhqu9q2k5GBD15+g680nA4iRN8cjUi7D+z6Pip6ZTjgHA
	 PTT+WHpicqPJd1EohIwW8paVQlqgPaAMzrbURUqBATW7x4XWbedNIyZLs2bzcHDNNEmhX
	 0YHOFfUpAfJfTbsoDSlY5e/NmqUKxINp1yzkCmHKRTMUlixlzTVh7zIcqKkaOnYiKfQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793917931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
	b=uKlJL55wyDL8gpM9im3ZO4toE34WIlRahODZVC6dZmh2tAlWwsDvDB5OwnxZ5DKFwjFW
	 5Da/umpv2dg/Ud4VQMpI/QHqNhlsxNdidlLK81XvnJa6x3r6bE7Uxr5Lm3XDD+/UKuwcx
	 EYhCyYFgMCsdSIgZakO67ygjGBRK8ifddn4hZg2lhRZHL+ZctlaSO+3H9/omgs9CZ1fiE
	 WlDBk7ieVj/Zxyx+eP2wxHjvVcOQ1KtobktEII/w+3OnW9TcKLU/fhbf0LCiFRiDwwq0e
	 iMDDrMPdwnC72NL6/fO/Y/GHLaXU1mJ/EvSgy31T7CMf+zE3+aWG/aHxr2j+U7O+NDA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh+RrIwy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756B606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 22:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3756B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Eh+RrIwy
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8a06210b29fso1324305b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 14:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793917930; cv=none;
        d=google.com; s=arc-20260327;
        b=I1b0mvDbq7R3Gylpov5QgXeTUhlYNj6K94FZZ2OHnMHM/8fYNFb7UXf69lc7MOEBfz
         Sy6biBbDWIbs27Qlwu8F86oKnv7oQ1uObKzbJAuQJJIAbQ4pykj5soYGk5etS10+2mRm
         Ti3cYaFW17G+iywRboVTn8RgB/BxIX5pyuEdDrrmA9BAcmEBAWWfYFcVUUb+0iiWp6Mi
         mx4eT85vwn7X/aMzGDK3pBbDugtifRbnwLjHPkgdyEuzwZoD7/0RxvD0kmkT23Ojxyb5
         h/WRfgaDGZjXy3QbE4UU3j8YMszzOp0CgmwakXkTpHRTDMZlnAkEKNa8cQtFn0jpSDdE
         Pn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        fh=Hch6aHZf/2QR/Y86SDD4WnscJaNrcPvuToGx2KZI75Y=;
        b=jVm1zTs2QJmz7UrPkopyNYGHo/0wLv7c6QfvCiSHjUBtu0D/ZMCq4GQwqL4Hhyd4GK
         5snX1DXoZg7KUpn1F4iU3S6xiEFfH6aoGxq5ind7euKQfvy1KJ8DzGY80u4p3EnTfwhS
         V+2TAcQhUsMLPBmmQrLJ0whnxVwNuF/poQ3TefaPZhNImuY02iRYbo5ocDWv+DcrrfCa
         YVVZjabFOz3JSRoo278EYc9sE/PlHZYuLaxuM1Yn3sWVfY/rmyDPxPlrXAQVQxoY4psb
         OYTtIZqfld4rnI7nKTwU7Zv+zfTWVZ9S7Qu6RI1mQe/M34Xgf+xRLrDTFukFYNXHIA7/
         Mp6A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793917930; x=1794522730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=Eh+RrIwyRW2pLFAckDF0MHCbB39wfpgowwsx1EjCEg4TjglDCPKN/+7ORVBplodNEl
         jPsuezn9sp+54nY0YFIN5id6tKlbCmtePGeBOzUEgEtD3zRu4wGuAGpQI9AU5O9H/OG2
         BPrZhYK4c4JMn8PnVzz5wZtQIKJrYDSceGNLApikgEpvL+Cm5kmuYnC7eHy1JGXZFMxb
         f758muqYNnvb4aLtbgJMg7+gE4B3HhSKAGYRVp57kx0wCQq7XDhPMG4nfMdkf23f4ouv
         mOvK402Ka+ie5oiUrYTV9bgBNPGKvXrkXueKKPphc1LciwU9R0c1CRCypkNY+ZaDHYvD
         3AgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793917930; x=1794522730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dVk8FlSCk0p0X/zLsBRSgcQPtRAQ4rsApX2OtPYv6mA=;
        b=F+/ytmQCDG6hR6tSAxYrotzS+BNeQ1YhnL1JPPOe/G45Dhm4/9G/2jo4AMvnlg2z+s
         am2VwxJ/IfMdAMBfb1Wv5Ng5Zmir59+fzIkn5xZFTIoAoYvKaXtId5XNIMHcYx1KQWau
         v39NekKnJSfedkyHVELdBUxzqSvbEMScQWJgWjLftZSoCMIfBNhfqfem+bkuwus46k6v
         OewG0xOSg9I9KKPxo5JRbx32G0ToeSgmPTMblJ8g2rGq1V9FEqQD0pgWqL6sRPVJUeBu
         DZC7ENh5BUCm0xTJ387Scdn9gAd0LiXPX5jjLygdgvH0RU030kewbkxqueTtL34ME5Y7
         rLYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG9wN+KYiKfIkoCtXulMfV+/5ygsr3NiMmHGXXz7qZimKdtb8ChCiraxyI7Ce3gzkWeiATxabCrBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fgzQLH3TkaITwfud3KNf0mIkfeoDUpICrBQQhvHHpZZl+R91q
	g81nxNXvQnJSo30BkkPSMtzu9Pun3uRCDFwS0nBL2MUy+kzEQTx3sH4jhaqF16ha5kAPoNiqw8+
	o7fNHP2GCl12EFaKh5qGqjVhLp74oGv0=
X-Gm-Gg: AYBFou2MojN/a14xSipZXtKL4hv4xwBvOL/f20fEWj4UBel7PC78+N1AaI1VGr4jojG
	od97Vx+gCtJ/OvagJqMGh9SM61q8AfeS73Df104b2LKRDKB6x3C9ilPSmXGT41aBgUYinb+OBfl
	qXRxfpWLYkUMCdeWOocpmfnW4taUdElKCXqqLL4zSHeT2c0kSreZ70pQ7+iRoo7Fcp2Bk/xIkJT
	SHTXksyA5umt/6owjHS84xjAOjTINdVSv/ojFpfbB+xRR53QGdO1yO1pZdpjCkLI/WMw8xAH/jr
	4l7SUfNEbf6Tw6eWqwe9RpWo8x1CUXjS1XosKtWmwvRJCMHRbPDH/iLScar/wekp4aAoMS24kX3
	5PtBHESVisbXVwId7z4Co776NsjO65x+ib7+Sw8ga+w1kOBRAehLH+uEpxd2VIWIeecvxcN/F8K
	rk6odrDgaoHTEaluoOuly8qONOrjh0IRG3xg==
X-Received: by 2002:a17:903:2304:b0:2ed:1f0c:d31 with SMTP id
 d9443c01a7336-2ed40e688c7mr9370095ad.59.1793917930400; Thu, 05 Nov 2026
 14:32:10 -0800 (PST)
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
In-Reply-To: <CAG2KctrY6GmVqsKP+fXYCsL6wDR4zp1kdRd7a7uOdCgg_JcMdQ@mail.gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Thu, 5 Nov 2026 14:31:58 -0800
X-Gm-Features: AclHuK8BPGpbYIUoL0zJXTIzG60i-gPbL3KKgBgfTHwRc2VAS0UUrPKJVoGciTA
Message-ID: <CAEf4BzbYqbPRPWQU9yM29E+Pr68y+KX0O8whK-36dyH=Zd_udg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to /proc/kallsyms
To: Samuel Wu <wusamuel@google.com>
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

On Wed, Nov 4, 2026 at 4:06=E2=80=AFPM Samuel Wu <wusamuel@google.com> wrot=
e:
>
> On Wed, Nov 4, 2026 at 6:23=E2=80=AFAM David Laight
> <david.laight.linux@gmail.com> wrote:
> >
> > On Tue, 3 Nov 2026 17:14:26 -0800
> > Samuel Wu <wusamuel@google.com> wrote:
> >
> > > On Fri, Oct 30, 2026 at 3:02=E2=80=AFAM David Laight
> > > <david.laight.linux@gmail.com> wrote:
> > > >
> > > > On Thu, 29 Oct 2026 15:05:45 -0700
> > > > Samuel Wu <wusamuel@google.com> wrote:
> > > [...]
> > > > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so th=
ey
> > > > > would be different symbols at different addresses. Please correct=
 me
> > > > > if I'm missing something here!
> > > >
> > > > Only that the user might really want one of the copies.
> > > > Sometimes there is only the copy.
> > >
> > > Good point. I'll have v3 add KALLSYMS_F_PREFIX + pos/next_pos
> > > pagination to cover these. A prefix query for "foo." also finds the
> > > copies when plain foo does not exist (expanded on this in my reply to
> > > Andrii's Oct 30 mail in this thread).
> >
> > I'm busy rebasing my patches - they got stamped all over :-(
> > I should get a v3 that applies by the end of the week.
> >
> > I will add a 'prefix' variant for you.
> > The 'next symbol matches' flag is exactly that (actually it is a
> > this symbol is a duplicate to avoid issues at the start of the array).
> > So in this case that application would always need to read
> > the next symbol (by name).
>
> Thanks, that would be helpful. For my v3, I'll keep the lower_bound()
> approach so the two series stay independent, but I can switch over
> once your series lands, so there is only one search over the name
> table.
>
> > I think it might be more sensible (less pitfalls later on) to return
> > the symbol number - not that of the next one.
>
> What pitfalls were you anticipating? If the current symbol's position
> is returned, userspace needs another ioctl() call and an -ENOENT
> check, to learn that there are no more matches. Alternatively,
> returning the next position means every call pays for a look-ahead,
> which for an unfiltered query walks the module symbols even when
> userspace only wants the first match.
>
> Andrii, do you have a preference between the two?

no perfect solution, but given you don't always care about duplicates,
I'd probably return the found symbol's position, which can be used for
further pagination (if necessary, user just does +1). so, let's return
current symbol index, and have way to say "find by name/prefix 'blah'
starting from position X", where X will be previous symbol index + 1?

but tbh, you have to write some code on how to do these "typical"
queries and see whether API is convenient and meaningful, hard to know
upfront what makes the most sense

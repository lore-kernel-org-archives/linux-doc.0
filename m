Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D098A18309C
	for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 17:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718213362; cv=none; b=n9wu+0Xj5mfjHcWvGgnAY4z3T+YVPu9PckLlkCKxqQjX71479WPutlzEcg2EiTtyjPmip6NwRMaoWOXwAmmNx+ElsQznLdBJc8TBe23vBK7iQm21FtDVi1oBbbEeKa7Xs4nGHJ3LKqx9Op0kyuA2SFIW+h+SBzqe7OkS9RnTva4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718213362; c=relaxed/simple;
	bh=SqHXwxyX0hOMrGyXlbcSlWw9tiq1bd472LhKjNZO0j4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhS/xX8285cwx6pzMhp2JlCW+81LRyB3Ymsl1JCCdmAz4oLqnSE7Arrt1Zdq4WZ9aD5Yj/3RIrunmL+6nYat+3ep9GeZicYtvz9apUdrbrnMhvKsxDeGbpU95p8aGqxvT5pLYT+zEQrN0297sz7s3tMDy/48JfKpWs++tqTiq/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=cHTfEDbH; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="cHTfEDbH"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dfe41f7852cso127836276.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Jun 2024 10:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1718213359; x=1718818159; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60lvPuusqxavVhRXfVcmrSoiIVupdLi0rpCh21972os=;
        b=cHTfEDbHk6HIEEn0Ouvd1wUDoXpMYFN/HZO3ahKHW+K15xPGFiMJcf8MVBZfy7Lndu
         9B0gJUKFP12+r7Xc0M3Fq2RqW+bZgItpodmOakdof6kuTbSmAdWWeM2ubU1BlyQiebMb
         MvuxAQamRDwQeIW9ZFBIcvc59CZMvSKdRtNzitNXU8JHVrEMDHNC/i5Yf9gBEwfkTVAI
         KAIunmbnZvUDIKtLlMs0yrTuey7ImwDoH+0hvUxrPZx76Hy4yG9yQD5DOFiP9PpUxuj6
         EIcmmCaIDNDCFGvrURI3v936AvRLS4oTV3eYPx2TdJldxRqJalPrHlTJbKC7D+B/tmAO
         4PzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718213359; x=1718818159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60lvPuusqxavVhRXfVcmrSoiIVupdLi0rpCh21972os=;
        b=XGrbZdE/PYjeHLGu/n3J2QKyaCTcxvDV37CTEmgjFGWYC6gcQFoUEV2xnpckLEe0C6
         5mf6ZMl/V4aZcPKkNWgEZAKMr4W+Vz/KOo/dSzsiv+BRNRJbqnlfKA3vy61tspc0DNCF
         VytAz6BBkmiBHvQe83gQp3i5p0iBFcxTqOSKQ0HTT/ZqVEv2V8AvWEFC614r1DWXual5
         sCcIEDhry/8em7suXlgbU84XdlP8qwwUMVvsVvZ5ZlZEExg4x1oVPboCdvERjLCcfzDb
         D6oZafH9gNnkd1DaIQ2FuxZFbvS76Wivv0WrlT4rX66W4pBZSlv2SmJDxuvPIdVtpMd3
         BiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBa9HPJ5Sz2l/3X/+isC47to7swFAA2Zpz4Hkk3ICqqwxX1ezdt19lkDMjpDZVVEm5xNJ8sz+VvqftxVQqhOcb54oFUKwk+0r+
X-Gm-Message-State: AOJu0YxszMprGRr8AMk2nrQS1wMSTwt3CGyMSukKbdb4DkGvTgl7jfRP
	gvDfxPJSUYaTWik9wVtpEn+PwsUyZbSWt6/FIfC44D9CpvBfhLAUhFx1ZZijEArSqv31H/BRYBM
	UPxGDyE5RMPoRgfhrzd5y09y7V1pkm89xYwn8
X-Google-Smtp-Source: AGHT+IEhGQzLLgCG9zMe0EWuDP1y2oVPtsHywKe/9At+CIXkctODudh6oHfrQfYIPwmYuFhbkIgUb9iq6CY+5R6qw6E=
X-Received: by 2002:a25:7:0:b0:de6:1695:13a3 with SMTP id 3f1490d57ef6-dfe62f1a60dmr2505543276.0.1718213358736;
 Wed, 12 Jun 2024 10:29:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240609104355.442002-1-jcalmels@3xx0.net> <20240609104355.442002-5-jcalmels@3xx0.net>
 <CAHC9VhT5XWbhoY2Nw5jQz4GxpDriUdHw=1YsQ4xLVUtSnFxciA@mail.gmail.com>
 <z2bgjrzeq7crqx24chdbxnaanuhczbjnq6da3xw6al6omjj5xz@mqbzzzfva5sw>
 <887a3658-2d8d-4f9e-98f2-27124bb6f8e6@canonical.com> <CAHC9VhQFNPJTOct5rUv3HT6Z2S20mYdW75seiG8no5=fZd7JjA@mail.gmail.com>
 <uuvwcdsy7o4ulmrdzwffr6uywfacmlkjrontmjdj44luantpok@dtatxaa6tzyv>
 <CAHC9VhRnthf8+KgfuzFHXWEAc9RShDO0G_g0kc1OJ-UTih1ywg@mail.gmail.com> <rgzhcsblub7wedm734n56cw2qf6czjb4jgck6l5miur6odhovo@n5tgrco74zce>
In-Reply-To: <rgzhcsblub7wedm734n56cw2qf6czjb4jgck6l5miur6odhovo@n5tgrco74zce>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 12 Jun 2024 13:29:06 -0400
Message-ID: <CAHC9VhRGJTND25MFk4gR-FGxoLhMmgUrMpz_YoMFOwL6kr28zQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] bpf,lsm: Allow editing capabilities in BPF-LSM hooks
To: Jonathan Calmels <jcalmels@3xx0.net>
Cc: John Johansen <john.johansen@canonical.com>, brauner@kernel.org, ebiederm@xmission.com, 
	Jonathan Corbet <corbet@lwn.net>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	KP Singh <kpsingh@kernel.org>, Matt Bobrowski <mattbobrowski@google.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <kees@kernel.org>, 
	Joel Granados <j.granados@samsung.com>, David Howells <dhowells@redhat.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	containers@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-security-module@vger.kernel.org, bpf@vger.kernel.org, 
	apparmor@lists.ubuntu.com, keyrings@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 4:15=E2=80=AFAM Jonathan Calmels <jcalmels@3xx0.net=
> wrote:
> On Tue, Jun 11, 2024 at 06:38:31PM GMT, Paul Moore wrote:
> > On Tue, Jun 11, 2024 at 6:15=E2=80=AFPM Jonathan Calmels <jcalmels@3xx0=
.net> wrote:

...

> > > Arguably, if we do want fine-grained userns policies, we need LSMs to
> > > influence the userns capset at some point.
> >
> > One could always use, or develop, a LSM that offers additional
> > controls around exercising capabilities.  There are currently four
> > in-tree LSMs, including the capabilities LSM, which supply a
> > security_capable() hook that is used by the capability-based access
> > controls in the kernel; all of these hook implementations work
> > together within the LSM framework and provide an additional level of
> > control/granularity beyond the existing capabilities.
>
> Right, but the idea was to have a simple and easy way to reuse/trigger
> as much of the commoncap one as possible from BPF. If we're saying we
> need to reimplement and/or use a whole new framework, then there is
> little value.

I can appreciate how allowing direct manipulation of capability bits
from a BPF LSM looks attractive, but my hope is that our discussion
here revealed that as you look deeper into making it work there are a
number of pitfalls which prevent this from being a safe option for
generalized systems.

> TBH, I don't feel strongly about this, which is why it is absent from
> v1. However, as John pointed out, we should at least be able to modify
> the blob if we want flexible userns caps policies down the road.

As discussed in this thread, there are existing ways to provide fine
grained control over exercising capabilities that can be safely used
within the LSM framework.  I don't want to speak to what John is
envisioning, but he should be aware of these mechanisms, and if I
recall he did voice a level of concern about the same worries I
mentioned.

I'm happy to discuss ways in which we can adjust the LSM hooks/layer
to support different approaches to capability controls, but one LSM
directly manipulating the state of another is going to be a no vote
from me.

--=20
paul-moore.com

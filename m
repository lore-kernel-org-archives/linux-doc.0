Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357056995E
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 21:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707861536; cv=none; b=A5LIoPp4WhmKjIZggXLX8U3/cs68iDFDYDpnHlYurH4PKqlo55xJw5u8ejxCMI3w+nWlReUQtGQ6JXHUqJKlxDHgtl3OeRtqNPs6Nmftwgze8lshEDlO2WpXC7Hhux8FaREAtx42neRgmhWLSfrpMNxq34+k2elzhjfCXQFFIQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707861536; c=relaxed/simple;
	bh=y3mhTelgi0cx53H62n2OpwC2+wJXIbkyAT/UHHyybvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JsGugMDKtAjqemr2pcbSmMDaP8j8TVPa5kuZcXAR+6kWusvjqPPh7qjRO+z0WDY77M2jeCbWpKO08GpPfR13FqDaGm19QtQsfuTnFTKn9UjMvc1Hh1vZkzEobh5PgYU85thza5RiwwJOqRUSSJHsxGCdhIwjP2pb3sRF7idxMt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Rxb8wS3o; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Rxb8wS3o"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so187074276.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 13:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707861533; x=1708466333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj6FkWt0IHINoPp252M2H78r73QaJ+UAYuAK2lRmHyc=;
        b=Rxb8wS3oMHnLIb34yoTtwMfqoD4BcyVNuvNgGPdVHWPCpCIa6nEGYA5xvYOo5c/pvz
         J2+OGg5pEfmE2ho3y5XIHT7lyPc4URII+matfJ1wGhF8/rZuDswE4lvq0eGNeHmc4d6i
         1TslSmbu7/OW47V4jOiZ5LOcxgKzmPryQ4zK+pmespbb8vXgJxMG8uIdRMZx91X4F4MZ
         GLPJ/mSUpVJkzmEWH8AhXqdx7DmmTZO/C6XQK33qFlrmwPlyjLWoDnxwx87d60SE9xih
         +mW7UIlKhjY11M0oWGgX7klJ3vobUHc6ZLro1BWt6iAV7lHw8VKFBSbHNeQIPKHeeCWG
         zK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707861533; x=1708466333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sj6FkWt0IHINoPp252M2H78r73QaJ+UAYuAK2lRmHyc=;
        b=SrnCZfO6/xqqIL4Mr4yfIYE5ZbOgVf+rN/9HpSBAQgjCDP7+9imw9dY5vlQIoCd+A5
         Q21fFQlIBMVQrRrShUGOA4kkGns6jLeFrAX43Bfl4C3Ps9z/8i5QTV6/ykuFHZNFCoVm
         sr8o66C4V2uAhsk7V/uYPcJemx/TfPLO6ktTiMxElaSTFajKhEuNQEiPaLwP0JbvlpDb
         ScVp36wq97uh052Dt/fgsOaD076ZR7teoIJ/Vg3zVdQwdwYi8u2/ZlSKXbV9B3kmks/4
         Mo2r5BOqUZje5yaCaiVZqxEWx/dfvQ8oqe2sUZX37i9THZX/f1dyl0Ub+i21phodhuKg
         pDgg==
X-Forwarded-Encrypted: i=1; AJvYcCWetz6bdrflPovd8pDqvYGPzgX4mZ39bf3lwRlNQ7FyBxRBGSezJ2xQAYH0HZBXrDA7mnKLbzeGH8pMCLeRUoYEc2SmrcwisDbG
X-Gm-Message-State: AOJu0YybIQWtNL/UGHDetUzNZ74VCSJVvivMQeZT3RdU7V517m4Ynf4C
	ZLyLBe4shHWWDYDehkXtV/KduPgKpjrldZ78r0ldO7tWpDuPTP6TSABnofgrJtEqdEPQWY8wFvt
	k7HHo1H2MBqDw01cRg2D4TJIss22etyIUG5Hm
X-Google-Smtp-Source: AGHT+IG6l4h8KgCu1mcr/ZMWQbdEFueKYTFVYNMwYlVMCYSQKnQPu8RzycqvNzeYz47HXL5wboAvOGkSQgCimZvCNdM=
X-Received: by 2002:a25:d815:0:b0:dc6:e7f6:254a with SMTP id
 p21-20020a25d815000000b00dc6e7f6254amr127954ybg.8.1707861532899; Tue, 13 Feb
 2024 13:58:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <Zctfa2DvmlTYSfe8@tiehlicka>
In-Reply-To: <Zctfa2DvmlTYSfe8@tiehlicka>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 13 Feb 2024 13:58:39 -0800
Message-ID: <CAJuCfpEsWfZnpL1vUB2C=cxRi_WxhxyvgGhUg7WdAxLEqy6oSw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
To: Michal Hocko <mhocko@suse.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 4:24=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Mon 12-02-24 13:38:46, Suren Baghdasaryan wrote:
> [...]
> > We're aiming to get this in the next merge window, for 6.9. The feedbac=
k
> > we've gotten has been that even out of tree this patchset has already
> > been useful, and there's a significant amount of other work gated on th=
e
> > code tagging functionality included in this patchset [2].
>
> I suspect it will not come as a surprise that I really dislike the
> implementation proposed here. I will not repeat my arguments, I have
> done so on several occasions already.
>
> Anyway, I didn't go as far as to nak it even though I _strongly_ believe
> this debugging feature will add a maintenance overhead for a very long
> time. I can live with all the downsides of the proposed implementation
> _as long as_ there is a wider agreement from the MM community as this is
> where the maintenance cost will be payed. So far I have not seen (m)any
> acks by MM developers so aiming into the next merge window is more than
> little rushed.

We tried other previously proposed approaches and all have their
downsides without making maintenance much easier. Your position is
understandable and I think it's fair. Let's see if others see more
benefit than cost here.
Thanks,
Suren.

>
> >  81 files changed, 2126 insertions(+), 695 deletions(-)
> --
> Michal Hocko
> SUSE Labs

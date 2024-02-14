Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06257BB17
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707930887; cv=none; b=IHgtmqMgIu0qn3la0bZ6kI9uW132+jyaneag08qvIsL7XOwZZ+nLpEaloLGjgRT9w3Q0vo0svyc8kgtlhTRUtyEA1kBiv4hnicz9smAFGX7GJxk12fkAZFpMUP2Nd588DK/anTgVVuiEmizfAKS3oszOPd688HoNfZRrUgShc5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707930887; c=relaxed/simple;
	bh=8ou5WjqaFbf0d6dlT4/+7co77L0bUTMJQFMyMq7YuMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jkqlfGeoE06wt7B/BKPr/K9BGQicJ3vxA4wrFKWlTANFyfrl6ax/1eFYCsjSO74o5DIfN1T70AK6/UCkEMt1d1akx/0w9BKBf7JPsn1FXECQQ3UXFgK76AeqA8+kxCj5DF+wwum9Nt4FYnGLRyfawkaTb/QAKMRd6IlP0mUOD/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nfzj2FGl; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nfzj2FGl"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so821792276.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 09:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707930885; x=1708535685; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ou5WjqaFbf0d6dlT4/+7co77L0bUTMJQFMyMq7YuMo=;
        b=Nfzj2FGlgB96dAxnYVux5aTYI24Jx6lVlPdgWAzkHqNSad+efPitOrmSSQ7ZeKvZDk
         GXRiW+A5T8Q/UaFzJaeCcE7juGM+T4QBxF2aCsi+eJ2Q4qBk9SuEjq8ynudjOKhSrndJ
         8sInBIBP/WLRxbkxbwOiryYviQUYrv0H15f7yO/Kx47EGAXXDWKCE7puN1zuo1A3cUmK
         mKXFztD9Nc9mkmNZl6O7yCYUb77+yf6BLfFzQb6Ail9dX+pkdX2IxyNq9DYqdHGgUX0P
         PbY5+1UDOYA5gxwsFQ2+52lSDPQxgivhCoMuTFNqqOn7OnsZ85UcGVzxf9jr6bhPFFA8
         BwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707930885; x=1708535685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ou5WjqaFbf0d6dlT4/+7co77L0bUTMJQFMyMq7YuMo=;
        b=Vb7baXVGZ9ia00exzLqhrOJNZV6pTbiFZzGuOxj5n+VDS10E3M3wMK3OWHYqhKSoPJ
         VzqtxB0XmmlKkAtmfq5HttO3vmxukQgsn4LgAr2DYVRXh2XxZx4Jx6fVcp/ElsHOm1VN
         peVzS/g6rz0weBnFQY3ihlmtbbvAiqfEHY1XkTHDtPE0vA8LnV7A9NCEAlfHw3UP7ToV
         GIqz/KA90UYjxpIeerWDkM3fVRmLoMnTwY9DL47kWrpQDWwSNH+QV3cUgizxZ7zMPLPP
         hY00BMup1w/G2cRg3HcOJLcyEauk5tpC1ZWQbKxfpZ7CYynbmTGBj10beTgu9XaAzcSs
         hohg==
X-Forwarded-Encrypted: i=1; AJvYcCU/y4AyH9LIFlUVqe4aUKDTsvZjdVEit1oF4m2sFKiP8L3HUlT0frWA+3jQzri35sb7VhcHq+zpK8KdXgc+F2prF0Zcd2B4173q
X-Gm-Message-State: AOJu0Yy6VCWAAGCOUNP6fvCrxImcvLvzYeDr0yma2Lh/pDz21IwFfumV
	SAVg0wP5kSZ/MXIHkgASvCDo30andcMqq4GFnQc0ftfIjjKpSjkIWAMqVorwb+SghpEDdFjKlWT
	mcCyvDhE4Iqmq93jSohQEHrF7INQR03Tjj+ul
X-Google-Smtp-Source: AGHT+IEklcDkHwhJJTRfE00RVqD2YD9tPurIlvkQmweXW1ROZAgTvoBmd93LGr06RSN2meH7bqCAE1CDi8ShYu3HlN0=
X-Received: by 2002:a25:4b84:0:b0:dbe:d2ec:e31 with SMTP id
 y126-20020a254b84000000b00dbed2ec0e31mr1980533yba.27.1707930884496; Wed, 14
 Feb 2024 09:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <20240214062020.GA989328@cmpxchg.org>
 <ZczSSZOWMlqfvDg8@tiehlicka> <ifz44lao4dbvvpzt7zha3ho7xnddcdxgp4fkeacqleu5lo43bn@f3dbrmcuticz>
 <ZczkFH1dxUmx6TM3@tiehlicka> <udgv2gndh4leah734rfp7ydfy5dv65kbqutse6siaewizoooyw@pdd3tcji5yld>
 <Zczq02jdZa9L0VKj@tiehlicka>
In-Reply-To: <Zczq02jdZa9L0VKj@tiehlicka>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 14 Feb 2024 09:14:30 -0800
Message-ID: <CAJuCfpFR85w5_8sX0uLfi4SsVb8Yr6DDu=VTA25PB-3SgC=5UA@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
To: Michal Hocko <mhocko@suse.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	akpm@linux-foundation.org, vbabka@suse.cz, roman.gushchin@linux.dev, 
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org, 
	liam.howlett@oracle.com, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
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

On Wed, Feb 14, 2024 at 8:31=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Wed 14-02-24 11:17:20, Kent Overstreet wrote:
> [...]
> > You gotta stop with this this derailing garbage.
>
> It is always pleasure talking to you Kent, but let me give you advice
> (free of charge of course). Let Suren talk, chances for civilized
> and productive discussion are much higher!

Every time I wake up to a new drama... Sorry I won't follow up on this
one not to feed the fire.


>
> I do not have much more to add to the discussion. My point stays, find a
> support of the MM community if you want to proceed with this work.
> --
> Michal Hocko
> SUSE Labs

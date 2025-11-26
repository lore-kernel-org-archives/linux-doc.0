Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30782FF153
	for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764166827; cv=none; b=AJzuUMpEbtNazOR4QXZIVCyVfU9Xt2Ydscf0PXgI93Z+SDtkui5AH9FE1qobDlbHBXFx6KQT5Ih3X0l0DISSYVGpANBtaJ5SsO4ZxsVcyvgf0RV7uaSwb7mZtY7Ul3mIkmdwmutNtYqKNeRQnI1a9q0+qrTC/UTkJPMiq7MT7+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764166827; c=relaxed/simple;
	bh=hBETWyJXR1+k6f3cyXUv0ivnrSiwqNEJzpSkQpr7ohg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nx2Rg7GvfLgrADiaiaNlsEvrTwLoQc3YAxBEHeIyjx3kRUMklvRmNATY7tu91DUACVfKJTCEW0ue32uxr2Lca21ipCazlrboIfdEba6bb6uguQ8GUEBcKPVzDZo7QAVeFaM3kr7TRghMJAuSBtS9Plb2GSUUbrrXuaTINmXsUHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VF0LS8Qr; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VF0LS8Qr"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8b2dcdde65bso997763085a.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Nov 2025 06:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764166825; x=1764771625; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UygfS1gmAzBwZyN5jNpTgDld1SbxnKAShfYEWk/vvM8=;
        b=VF0LS8QrSTijo9/n8+VsWe4HVtZ3/KmFq++tJYVUnLtY6KbPH0tA32h2YQS/NF+0dz
         uyhhIz5x+NY3tkxiM6YW2sqMCWxkCOj1wvboizBta/syOQ0XYMq9e6SYcSwUMmaxxyNo
         cLtP7J3O5mMmgRVHS19QD8fObMc2uE1SMlDH8nD3rWx78xiUSPxqmbi8X7tN4S6tZFuP
         qJY48R3iwmEgu0CGdgueeoTkBNQJLqQNp2a5fy57UbJ84yEbQXAbAcjTDfNqinYbUSrf
         eU1iVzB0mju6vxYCNqzgCGcXZwkM2WSjWxqkTNkNuyhupknSBazFj1Isn4NAFb5NZnZs
         Vxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764166825; x=1764771625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UygfS1gmAzBwZyN5jNpTgDld1SbxnKAShfYEWk/vvM8=;
        b=JnlYpZkdmEOOX7qCLOz68CcfHp24mwfpupyjl2xZ5aKhqt4XCR+hU6Z4jkaffu0tSS
         47+SKhBST34ZTi+J0Hm3rufGkDndn2Nm73kGzPVLlC4n80V0iO160w3a+QsK0wLb8GV8
         ALzOJivWjNZB/4yZAqCk3H5/ZzrsDAdpGsORf2GaKvoWRVHlbcw2V7DyjFDgzkLREO9I
         /oRadJFyuUNxPkfGQK03bU+3cFJqWSOWNBT5+p9uXQKeJubrS+c74cxKzF3PrQbPB69Z
         1rcBJuHv50Ile1diJ1nYSjposGDbj5LY0iU6h5DR9efkpO/391NDsrplCqcazwJhBTnf
         IB4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5XsvBSoZoPHRPdrqpHoJa0Sl3JTryDUkb6SV3w6jFKO2ck5+MBpRZd7f/DwfkRjZm8mhhegqW+/0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzASQ2e4qXGCITz6B1HgWD+jbn3ZyeVVQFMKBQ3nHfEJp9228ad
	+0NGbxQcaxAyp/UclxqFn5mipQeCh8nS2oNmYCUFCDUhcLtC2QSUyMkpJqjP4jLUBxZ1n3mvmdl
	xY1LoBTmK7cfd5PgY6RtFbVkJeDka2/76mwW1aYNwpDx5TIbQ9Q/0
X-Gm-Gg: ASbGncs5TpSmYAQ3EBOpfbtSNzRXhNFLKcqzdCLCsyHq+ooVsk5Wyq9bTewt7twTBnU
	y2UyK3IMB5d4nhP0AibzsZOdhJjA+oIaIZ+fkJRhwZV1GO9YEuYX8CjVIG9cTQG65/d4k1sC6Yt
	g57UTEShhYyxVVt/5NoDSCvWST29RHrQOf8UNp4B2ViKfoB+WVcFKTLdgqgzdJ74OBQPzblbjHH
	Xf40W/8jIxYYcx96kA22YLXOpG9C7DF6WKt8icpXIsM5wZ6DomViGM2lf0iSs08DWq6j5R/FGgG
	d9sHH62q2pstcz9zs8uVXZ0tCTMGaqz1ymGHNxM=
X-Google-Smtp-Source: AGHT+IEXhMtdXqOIXMjzdjhXPvF+1CFwLCKnETjmeKA2ia2qVKHR8qbNsixLeJGiRYPNKgiHRvy/8M3YPyXRFNRpBZc=
X-Received: by 2002:a05:620a:460f:b0:8b2:e5da:d317 with SMTP id
 af79cd13be357-8b4ebdae699mr876378985a.54.1764166824849; Wed, 26 Nov 2025
 06:20:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org> <20251126140154.GK724103@e132581.arm.com>
In-Reply-To: <20251126140154.GK724103@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 26 Nov 2025 14:20:14 +0000
X-Gm-Features: AWmQ_blJiwM7FEghF6YmUIgQn0KwXPlNxgpbgeT3ameLv_-rX431e10EWW7vOyw
Message-ID: <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 26 Nov 2025 at 14:01, Leo Yan <leo.yan@arm.com> wrote:
>
> On Wed, Nov 26, 2025 at 10:54:42AM +0000, James Clark wrote:
> > Document how the new field is used, maximum value and the interaction
> > with SYNC timestamps.
> >
> > Signed-off-by: James Clark <james.clark@linaro.org>
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
>
> > ---
> >  Documentation/trace/coresight/coresight.rst | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
> > index 806699871b80..d461de4e067e 100644
> > --- a/Documentation/trace/coresight/coresight.rst
> > +++ b/Documentation/trace/coresight/coresight.rst
> > @@ -613,8 +613,20 @@ They are also listed in the folder /sys/bus/event_source/devices/cs_etm/format/
> >       - Session local version of the system wide setting: :ref:`ETM_MODE_RETURNSTACK
> >         <coresight-return-stack>`
> >     * - timestamp
> > -     - Session local version of the system wide setting: :ref:`ETMv4_MODE_TIMESTAMP
> > -       <coresight-timestamp>`
> > +     - Controls generation and interval of timestamps.
> > +
> > +       0 = off, 1 = minimum interval .. 15 = maximum interval.
> > +
> > +       Values 1 - 14 use a counter that decrements every cycle to generate a
> > +       timestamp on underflow. The reload value for the counter is 2 ^ (interval
> > +       - 1). If the value is 1 then the reload value is 1, if the value is 11
> > +       then the reload value is 1024 etc.
> > +
> > +       Setting the maximum interval (15) will disable the counter generated
> > +       timestamps, freeing the counter resource, leaving only ones emitted when
> > +       a SYNC packet is generated. The sync interval is controlled with
> > +       TRCSYNCPR.PERIOD which is every 4096 bytes of trace by default.
> > +

What is the default value?

As far as I recall when this command line parameter was a bool then:
perf -e cs_etm/timestamp/ <program>
is sufficient to turn on timestamping.

This is worth mentioning so users can correctly assess what happens
for any existing scripts they might have.

Based on this then the same command must set the timestamp to 1 -
which will have the same effect as before as we do not want to break
existing behaviour.

Mike


> >     * - cc_threshold
> >       - Cycle count threshold value. If nothing is provided here or the provided value is 0, then the
> >         default value i.e 0x100 will be used. If provided value is less than minimum cycles threshold
> >
> > --
> > 2.34.1
> >



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

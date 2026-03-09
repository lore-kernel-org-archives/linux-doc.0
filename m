Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025039A813
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 11:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054946; cv=pass; b=mo2670bp87anvKsVpdBDkQVvGN6yxAsQPhXIqu7iKsisAK3mG7dAUME/K9hlqwWV/7q9TOZZwtSTimevXrgv6uqBI4pb8X/8Qlqu2Th9pg9f4bQEZ0SFXVNl2HZPwKL3GmodyZzMmcz9eEI+vMYTCl+M3BP+ckf4rA0Wkn2QGRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054946; c=relaxed/simple;
	bh=bwnTPQewhTZfBV+DUD3SsbtLeKJPcVZC52nT9OgQfwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J+nDlnBDYGQsmtNxy3VER7w4PTX8umR72b91nUmmiq3j1eAWai56nHtqwy9XY2r3g03F5hT2bKd3X7SkhXsd+P5MGbDH43+m5pYW4OayPedyK8v+ZbbQz/Yw1KWwJkbZuvSraMT4ItUldWkectOmVpewL+xRkHKpMmacAHfoa88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3YPkrhXS; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3YPkrhXS"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-509062d829dso733731cf.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 04:15:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773054944; cv=none;
        d=google.com; s=arc-20240605;
        b=Y33CVLTl2nnFA9Hjts5ZQiMRHIWSQ8R4jSGoFoPSJorJi8SnaqgsHrN4WYJAmUwTgQ
         x3Brm9CR6Y+IY8Sl92rNIRgLpFOfj5F0BgynHCblHV9c9ouz7Y3TsUBjSmNLVJw5Imnf
         +6Is2R9Su5f0HIto16Wf9mj29Fzd5ievg9TNH+kGbuEd1vuD0GCT46lbssNkBjUfokE5
         vdQmr2YjBGGFZilg4wnhiYaWyAK5s3iwAI69wKcpLp/vyFd738ZjWV+3sS3PQiknUa3g
         7jMghaB1zdKL4tUOuCuNDetr5sDTCnV75bAoWGYywFzpdrVhQfjLYP4e4AgAza+3cNsh
         dSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bwnTPQewhTZfBV+DUD3SsbtLeKJPcVZC52nT9OgQfwk=;
        fh=tkfjXsb3L275BZdC35fx3oqroVlzjNYzbNjOCTn70XA=;
        b=fazgGrQS9LQRUNezkyYPSkyHeiwLChJ+XOt4WZuW5wHNZepW6F5JBMab8c058ruZt5
         0mm4888sXiMrEBlRRFkAX40J8B3dIFiyLw8/C1lFydB2i0yutdKAkYagINri+ekrrZmA
         L2dNagR9FGEpuvo3kHpcIHwuFxc/S4D/hFFd2ATeDCc8VJNMmo/8CxSke/7zc07cQaWi
         +2ot9RruFliuBF4QXUB4+DjOVCN9DW6i5J8750115ujuz3ljNEG7LVvn8o50XTOn/1w3
         LI3+7WPsKZQ1TjRYPfLiEB7+zKurj2/XnHLW50zX5gL+o+IYW5hEbvKXVEs17D2Acj1N
         xEcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773054944; x=1773659744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwnTPQewhTZfBV+DUD3SsbtLeKJPcVZC52nT9OgQfwk=;
        b=3YPkrhXSm3GaAy9SxVLzdt94rUHSB+eXLPeosRqRxoAI0ep5W6GAZGf/jCY3OQDu+0
         hYlxZV5tvhH7VVEupO4NO1fNUXfhrjtvN7PRNkHGpCZ6AvnLItNROnPtj2Zz0uoPM0D7
         L3jVb7o+GDp1O6Bfa66iiJey97f9aSvu5nEAgTrKA9XKwSU3WdKV7ytrJjNjx8oeL2Da
         pMJbk6J8JAkE1YvwnJC7kTz7yRBcphUudl6qTAm3cTt4d+07QYw/Hq9iYob1sYVmk9n/
         oSKL0UhjCYNTs4l/+7m+Wfwh8e+y2ytopKZ2TCBtCYf7grNtYC9ehkLq0O8CRfeM4kaa
         kZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054944; x=1773659744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bwnTPQewhTZfBV+DUD3SsbtLeKJPcVZC52nT9OgQfwk=;
        b=j/o0c9n3sDc66x4kNjb0gP8XQSJE0ny99Wawn66FJyd+xI1BUCHupfq15H5oswamhW
         C0C4FTJ/F17qf7S5DqU0TH+LXdV9rfsQMVXHTuqft0hACcnHUdTtSUH7k+hNPRqxGjZq
         IURG3C8QWQTegMkaLO98ElwneOwGBPT8ev11P2+rbaIOYDPUYeCFJusaj73K0YJjVdr6
         rLKzXhQPSd33T9lzkyVut0pEJ/OcDzRQTGGfXDBcs3hyIsDfBd4LzLgZkiSs/hpJN9DT
         2cPv/2FobQZx09nItGwQf0l+aBnIHLH/dYkXVRErA5bYt1AFH0nItD7uEYnv6QGg+wbr
         LT/w==
X-Forwarded-Encrypted: i=1; AJvYcCWWIHhEiDXr0fljLh8+3SnOt/ZteQidcYbd1Dr6ABCCc4tf/MOeXDlrf/QuVtybKhE1KvGp7K+m1ak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt3jKVhQPrOLWb3/wd+sr5NgOrzuFsI7OQ4sKF6cuEhAqZ9+8p
	B8a2jROXQ97O8DK44yLg+5pyXQ8g/gniflEpQl3t+dkQsv+OQWZB6wsvy7oKaYQeZMq60IbaCO/
	PiBi2qSSbAqN3wExxKmkoZ3EwniVGdPqM3dyWL8hv
X-Gm-Gg: ATEYQzwceiIWgaIXv26+4hb1g/gRdIdcvCYeHSuJFqe2n79Eoxesu+U+Ic9EH60uHpY
	OPiJ1LGTFECGco2NjgofqutVtVhp8kPjgdAcDZcIjeg/9ow0U6CB22BogPFfRtkNfyWQUg76Khw
	137B9S1XzXlNXo/VW1eSQ4hew/1Mu15wVLKjGy5m9k01ztVr8ryqC20ksXjF6r5awFVp/jIyiju
	miUuF84zCIh/Ga0UIJNc8ADOHT2ALx4oaBh0omHBcRwlpgHGJRYZMYkXs/6aw/vc7o+PerhpDH7
	jQwBuNtmIJ0cpj6Id8E3e5nlBo3bUs6M8U07vvbW6Q==
X-Received: by 2002:a05:622a:309:b0:4ed:8103:8c37 with SMTP id
 d75a77b69052e-50900fa7fa4mr22518531cf.12.1773054943674; Mon, 09 Mar 2026
 04:15:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260307090010.20828-1-linux@opensource.nslick.com>
 <20260307090010.20828-2-linux@opensource.nslick.com> <20260307093006.GU606826@noisy.programming.kicks-ass.net>
In-Reply-To: <20260307093006.GU606826@noisy.programming.kicks-ass.net>
From: =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>
Date: Mon, 9 Mar 2026 11:15:27 +0000
X-Gm-Features: AaiRm537s3HnYYKX-9TgG4VRgrwS-5joKWrN8ricsEVy1qLcUU_sUcpVi_zjyDg
Message-ID: <CAJFNNnoweqzaTn6GVb2L7dpvnby7Zi0je25hVbQHXS_kX2O08g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] module: expose imported namespaces via sysfs
To: Peter Zijlstra <peterz@infradead.org>
Cc: Nicholas Sielicki <linux@opensource.nslick.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-modules@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 7, 2026 at 9:30=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Sat, Mar 07, 2026 at 03:00:09AM -0600, Nicholas Sielicki wrote:
> > Previously, the only way for userspace to inspect the symbol
> > namespaces a module imports is to locate the .ko on disk and invoke
> > modinfo(8) to decompress/parse the metadata. The kernel validated
> > namespaces at load time, but it was otherwise discarded.
> >
> > Add /sys/module/*/import_ns to expose imported namespaces for
> > currently loaded modules. The file contains one namespace per line and
> > only exists for modules that import at least one namespace.
>
> What I'm missing here is why users would care about this?

FWIW, we use a symbol namespace in Android (GKI) [1] for symbols that
should not be used by all drivers (e.g. direct file system access).
This change would make it much easier to surface at runtime, which
drivers are using which namespace and thus have access to symbols they
should not.

Cheers,
Matthias

[1] https://android.googlesource.com/kernel/common/+/a38b207d4f4e02041f72a8=
168bb24d1617099988

Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123FF1F936
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 01:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775094858; cv=pass; b=aTVTn+h/j0ZaBJ5+i/nm7J2xx6/+FsB6GpdFDZlBP7lJJ7ilxjKYG6UZNqrUvl71JorQA/Opq1BwBfn9TfDLMNAD92s7WWzksITwQVDW91Ul99aBiNtRMFH26TrHWyRPWoeqAsruBKCP+MhydWhdS5dzbJKiayk+eEHc27SkuoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775094858; c=relaxed/simple;
	bh=ZgdAy4qNSHyKJtotTutzlKM7jv1dqpgGb4Vak3LPpxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VTnfwG9cOA8G//WTZlu/CS95r9uQedOFNE/G6/hL2rghugvS3K4cZHOH4bP/DkdKFtBA0WVLiVAWk34TefUnrvnqFA6SKYjHgCiow1Jcudr0kD+Gsi7IhmK9+p6PrQVRdppp3+SicHrgXJmlmQZ+h1daCrHhk9rZRUmg3p6HbvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ww7PwDxv; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ww7PwDxv"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6501725d888so328887d50.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 18:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775094855; cv=none;
        d=google.com; s=arc-20240605;
        b=dTz2AKmVhwdIgnA7noY8qulXypOrgXweKXmpXY1/Shr6ttsLWtnowVgvC6Gz2Su7do
         bU3mz3lzsUoUQAVO0KgHvLZfYZqeJua8V/soaL+CTbc4Mqz884kc+Osky9O72dq+byw0
         /4Bph7BycUd55TYOlp8SMbEOwaUrAScvnqbAzURGxnA58lcgj0OfRzDvNTQLSBa9YrWv
         hmMuH63XTuMykvEg34/eJBD8uIUfjzZ3uUskbbS0bdaSiOJgOV1ZGK0z4bmI7Yyfqdjs
         w9Rur8B1d0AxfHR/SUB/UCpQ2TViNyDWAQO0G7YCjmro/Kz/IYNQp6r5TvR1zHFqfzgb
         2xSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kiceuLyx91rPyzndVsPjUqGeAIHXDkrelSUnbkKBTJU=;
        fh=ano3Vf2RuaWU20JU/n3s0dU/a0SZnqKMNmDMGsyV/F4=;
        b=i5CMe8gPiwUYv0LUdJISXvMECmafPUN97kBEaGW3JSAACfdbo6RB2cMtoAFTJ47Y+R
         0Hkaf5880kPsWVxjoxg/AdfeGPkZcOTadb4LqdZ/d/HC5BIq3Y+GjKiKt+L1CEUaBmzc
         a+ETxiDdnKUIaFSqgMw7KF07kdLBWt3kdIO+EY4APh2Rx98pSC1D8YEc5Z8smLqBxdV2
         H1bR3b5qHsNBQJ9Ds4yGAh0H8DGn/HQM1qtOvJHdUQQ1FdxqaMVywh7A3uXFdWhNnpUf
         Cc5qXzSwku/jCf2V53iCOKe+W7d5zj17iMVZW+Ci5oOOT24q1bYlxP3is2UEB8zG4iai
         hfNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775094855; x=1775699655; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiceuLyx91rPyzndVsPjUqGeAIHXDkrelSUnbkKBTJU=;
        b=Ww7PwDxv5MVp3tsNlTeE3CT0Oz5MhiebXjUc4q6rFMf/GmFYPBDczuil0bH3TBySVW
         cQ7fkOrw3Fs2HWzDJLfsnjY/hZHPdGI6yfTW7uszLmZv0eLNZdu2a/xGZzT5b/Uebxp/
         Dl/sKqbTT84G8zvSDyy7UpAWWhRqTBa6rXzvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775094855; x=1775699655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiceuLyx91rPyzndVsPjUqGeAIHXDkrelSUnbkKBTJU=;
        b=BrbBEPzTrnwrJC7jhILdWmOyWQPI6qk9P8lWI1jcnkOQc4y00+KmqfYHsIocN1nNto
         xAgXzN3onMYJtSsVmxFBfwel8iEM+saufBpR7Ub3QAZWZl8TvvqaWdcs4HYmDPzj0iCt
         5/O8X0H+QLk9iV0Q85Vxdve0a+QaaE6O/0qSWEBNNeomiEoRMjBkqz7cOStpVawaJAPC
         byr8dbWrG5yA4nCi8YJ53XALzHvVW0WOoUSAVS8lWYccSIYDjmEXwUz5AVMn8WesPy35
         jxcbMN3M+ljpKQggxijktxZsk1SNUEfxjkifuHotrNlpkHi6rMYFhxUkQ63vl4h6t7gr
         rDMg==
X-Forwarded-Encrypted: i=1; AJvYcCUaVwE9HO/V78PM1e8Fb9/sAUO4RzbTNnDDfOZJVG56TEmb/TJJYU39MpRg0a5QA/s/qwP8+ea1lCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvqdAke1tH9EHsivYhryNqXxmYdGVKoZXF5RsqE7N++S0ZFpgB
	WetXeCRD6ombf5ZLC5CcB2+bkkmpjUreIGfqbMsWkPznUxSL341B+hAPgU0nVRAj0rEMEUyD6ni
	rCUdvFejkFx9R2eti9lixNLh62EU0kdlDhSOf5tE/
X-Gm-Gg: AeBDiesO47sqOTv7tljxbmMiml2C6J3hL3IF8xgZAEvQjb2rWJWqcys/zE7QA1wdfmw
	HdXmXzxR5VS0FilvbP02amiGAcTVU/I7A0lmVWtGMmBZVyoOUo5/C/XKg4VWnN+GbwWWh1rhqLw
	lat4PQPfT6qayn01loKPPvUY++21kf+MDL/psswgEryTGsviE8ei1L+v/JrUVvUpxY+xdyzTIIm
	MoT1xLJiUqq9TVELPZuT9muuwW87SXuabksLbGPDlU9yjzTvogOreT/d24yzL8y6jgcXodxnZcJ
	p9u0lrkec1IbmjxzSjKOpJK5tGEJ3eb6OISVOBTDCQ==
X-Received: by 2002:a53:df45:0:b0:64e:abca:564a with SMTP id
 956f58d0204a3-6502fdd0ac9mr5063421d50.22.1775094855220; Wed, 01 Apr 2026
 18:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324-send-upstream-v2-0-521ce8afff86@chromium.org> <20260325-naughty-hungry-wapiti-658e83@quoll>
In-Reply-To: <20260325-naughty-hungry-wapiti-658e83@quoll>
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Wed, 1 Apr 2026 18:54:03 -0700
X-Gm-Features: AQROBzDfrwBIaLEV9wnEuLry8lUVCQVrP4uxpF2MQpcY1Q98CokyJ5Vf0yATg4k
Message-ID: <CAEe3GZFWiUG5ET2oQ42+KvO-TMy2Eq02tR0UMaTbACJ0=V8D0A@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Add spi-hid transport driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, hbarnor@chromium.org, tfiga@chromium.org, 
	Jarrett Schultz <jaschultz@microsoft.com>, Dmitry Antipov <dmanti@microsoft.com>, 
	Angela Czubak <acz@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 1:49=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Mar 24, 2026 at 06:39:33AM +0000, Jingyuan Liang wrote:
> > This series picks up the spi-hid driver work originally started by
> > Microsoft. The patch breakdown has been modified and the implementation
> > has been refactored to address upstream feedback and testing issues. We
> > are submitting this as a new series while keeping the original sign-off
> > chain to reflect the history.
> >
> > Same as the original series, there is a change to HID documentation, so=
me
> > HID core changes to support a SPI device, the SPI HID transport driver,
> > and HID over SPI Device Tree binding. We have added the HID over SPI AC=
PI
> > support, power management, panel follower, and quirks for Ilitek touch
> > controllers.
> >
> > Original authors: Jarrett Schultz <jaschultz@microsoft.com>,
> >                 Dmitry Antipov <dmanti@microsoft.com>
> > Link: https://lore.kernel.org/r/86b63b7b-afda-d7f4-7bfa-175085d5a8ef@gm=
ail.com
> >
> > Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
> > ---
> > Changes in v2:
> > - Fix style problems and remove unnecessary fields from the DT binding =
file
>
> Style and removal? So other comments were skipped?
>
> Please write detailed changelogs, otherwise it feels you just ignore
> parts of the feedback.
>
> Best regards,
> Krzysztof
>

Comments are either resolved or awaiting further confirmation. I will
add more details
to v2 changelog in v3.

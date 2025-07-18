Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EF319066D
	for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 17:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859073; cv=none; b=uKCsu8LjNJ7MfuzwFnjo949HhwP78Nl+kqZ4movJkI/Kwsm2fhEanHerxuTJ5rK7nhnZPR19lM2fIaa9X2TZowQXMhvqu32RUszjCKmP/fnv0wCUPUgS8lWPASe8AY3hyqoMRynbPkHb0Th7BOHUDRkKcZAJBiYaMcqrPTHckGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859073; c=relaxed/simple;
	bh=JUlQrI+fknuidygvc0QVhNjmP0Fn5UPuVWMQ9E41q1s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nqTO7Cf6SGO1iCU920i0fx3IzjhjcL9Lva3y3VKe9ozyicMp9XysLkYUft+ihbvmo6vVL7umzvkj39PWUe3VlttSiwLnr2YNsls/sPCNNGlVe/6oEcrWISuC+ik4eo8r5eadY1BPRDW2RBlvJ9gidzONs4OmDejs/B8/vr4WO1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=W9Kw6bKp; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="W9Kw6bKp"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-237311f5a54so19005765ad.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Jul 2025 10:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1752859071; x=1753463871; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQsUdI99uVdv1G5VrfovBfE2ouV4UkpQzyyZDykQuDw=;
        b=W9Kw6bKpYxcq+T7UAVjFy3KRpgsXAc7ldPpIk+0x4HC1h9QQabqjXwPgI61ZIJUWFz
         rVC+RJ5a3GKaS/5Aiip9w9FsvGIhna8hxZGs1P0z8GtqPII5OdeOL45RZFYRPt+Ma4rf
         T+XTXMNvgBAu4G64sZuxo1C71JjiXXv9XouGOWs4Hv5TfMXUhLnZPL0SSIj0CF5xCU4r
         2DNJR+8jvchqwTdlHjqHTrMR3rnRPAb91AIwPSHkbc/g/5rwGvGPoKVyWZvW+yHfP6kw
         Lgl5vtJk13IpB7kwhPBCKkYrVBvDWBIQJ3yUlJJk2F0WQ3y5WoSZ2dlS4MtRQHMiOaAe
         6lQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752859071; x=1753463871;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aQsUdI99uVdv1G5VrfovBfE2ouV4UkpQzyyZDykQuDw=;
        b=FovR779jA9THaISnHa25LhM/PA3o+ZkvpZbEAnvVMQRPPHGmCbOtcHNF12sbUNxxR3
         bd2Cp2TAOyoTcotRLfQq+Rn/XU8HzWMK2u9y/FOgo+o8GwvmXurWqqrKqQrncdTAPk3h
         mXERl1Ul+7NGKMWATYF6uDnau/D/BIVPaNlcK6//SK5/JCJr9Enf4HuX2seA7x/ZaU18
         5KrB8pDqpKh3V3p3yk+3tHbP8jGahO+iU1HAm3IevWa6Lc+c2bNYaSMJFnw5ixN5a3Df
         HvtGeX370L7d6Zf607OPgtgZ4PoRXR53nh5/T+F3cCksQr6S1/mk4OjWUaIbz4kOHJUA
         zbjg==
X-Forwarded-Encrypted: i=1; AJvYcCXD2O8cCY9wcVJyKeLJOhJcrEaQEr3dHFLyGEON7HS7+PCNFK3kTYGtK8HV6rLQTJ82dHa/HfQJQ+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YymUYZPy6iKWWA82mkhEcCo0Z4gdSopS4zVUWyasmv6NJILUCCz
	OZefk5nfcjjFnvoZv6M0Cl1ehQQrFeFKvrXhTbpeFks+iPcgYYIryQfcdYSCJ28TC3Y=
X-Gm-Gg: ASbGncsy0xNni38RRE8wmjnCV//IFU094+A3dBy9u5c/T/ziEO1trTUZIsv1OZVRiPk
	hwPc01IdZSinqiEXr1snjajpw93qh7NSW28SgX23PcCjFiwzVOLczusWRV7nqefdl48keE86JwD
	ueKS9evGRZV97WUwZHU7nAPMlDIfsirWkexzVfMLwEpC1NF06nSv+SEgmU7nAhgkGQJxVsbAgNG
	oBgrheLsEVzMG/Aq5YJQ0rIyos2C1TW2sbVySbpyQa8af12U1sleo7PDoLo12DrXMRBTa621SmX
	izTbuTkR3i6WtEm81Qatc4u8isW2JVZiXKRVDDCmqlDjyQaGwdQB0MIYCrpOUOng5Vec7QM+tVv
	aa7dEIq1IjRdsVJ40XlY=
X-Google-Smtp-Source: AGHT+IEY9VDKHPJfWeHWvEU5wqF+TlZwRpsDoYx13B2warjVxgd6exSsfIi7OB5Q426MGYSgEP16xg==
X-Received: by 2002:a17:903:8c8:b0:236:94ac:cc11 with SMTP id d9443c01a7336-23e2566b0d9mr164068795ad.7.1752859071385;
        Fri, 18 Jul 2025 10:17:51 -0700 (PDT)
Received: from localhost ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6f2184sm15987755ad.224.2025.07.18.10.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jul 2025 10:17:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Jul 2025 11:17:48 -0600
Message-Id: <DBFCOJFGI5HB.1RNJBDPNTEL2U@brighamcampbell.com>
Cc: <tejasvipin76@gmail.com>, <diogo.ivo@tecnico.ulisboa.pt>,
 <skhan@linuxfoundation.org>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Subject: Re: [PATCH v4 1/4] drm: Create mipi_dsi_dual macro
From: "Brigham Campbell" <me@brighamcampbell.com>
To: "Doug Anderson" <dianders@chromium.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-2-me@brighamcampbell.com>
 <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>
In-Reply-To: <CAD=FV=WYBFrm-J55BTEJ7s=Jk4EFuMVAkahVZfdzW6V8mxE7Tg@mail.gmail.com>

On Fri Jul 18, 2025 at 10:10 AM MDT, Doug Anderson wrote:
>> +#define mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...)           \
>> +       _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ##__VA_ARGS__)
>> +
>> +#define _mipi_dsi_dual(_func, _dsi1, _dsi2, _ctx, ...) \
>> +       do {                                           \
>> +               (_ctx)->dsi =3D (_dsi1);                 \
>> +               _func((_ctx), ##__VA_ARGS__);          \
>
> nit: shouldn't func be in parenthesis for safety? It's unlikely to
> really matter, but just in case it's somehow a calculated value that
> would make it safe from an order-of-operations point of view.

My assumption is that wrapping _func in parenthesis would cause a
compilation error in the case of _func being a macro (more on that
later...). I'll test that later today.

>> +               (_ctx)->dsi =3D (_dsi2);                 \
>> +               _func((_ctx), ##__VA_ARGS__);          \
>> +       } while (0)
>
> Can you explain why you need the extra level of indirection here (in
> other words, why do you need to define _mipi_dsi_dual() and then use
> it in mipi_dsi_dual())? I don't see it buying anything, but maybe it's
> performing some magic trick I'm not aware of?

I mentioned this in v3 after the changelog and prompty forgot to include
that information in v4: The extra indirection between mipi_dsi_dual()
and _mipi_dsi_dual() is to allow for the expansion of _func in the case
that _func is also a macro (as is the case with
mipi_dsi_generic_write_seq_multi, i believe). Compilation fails after
removing the indirection.

There may very well be a better solution to this problem. I'd appreciate
your thoughts.

> Reading this with a fresh set of eyes, I also realize that this macro
> is probably vulnerable to issues where arguments have side effects
> since we have to repeat them. I don't think there's a way around this
> and I think the macro is still worthwhile, but something to go into
> with open eyes. Possibly worth noting in the macro description? We
> could probably at least eliminate the need to reference "_ctx" more
> than once by assigning it to a local variable. I think referencing
> "_func" and "__VA_ARGS__" more than once is unavoidable...

I'm using _func, _ctx, and __VA_ARGS__ more than once in this macro and
I don't expect the indirection to fix the potential issue of unintended
side effects. I believe we can use GNU extensions to eliminate side
effects to _ctx, but especially since _func can be a macro, I don't
think there's much to be done about it. Not sure about __VA_ARGS__.

I fear my inexperience is made sorely manifest here.

Happy Friday,
Brigham

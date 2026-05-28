Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBA43F9F4D
	for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 17:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779988945; cv=pass; b=kLFWJhwKPGUBz9pWUwno9mZEYAfcDDP35ocPRKsaUR+SDUM3XuQtjzP5kjaRXmNn9XuVguWo8WskuWi7bNqVzt8DNTfGU0r6t871YkJ5jdpV+sIyJHjar1n3w0b4vszDCxZzYJ+79tvLp4ngkGHXbAic6C0WqF1wslx7k/8Piuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779988945; c=relaxed/simple;
	bh=KxgWeyNXz7ap/tz4r62YW0FmgrvmVcbaWU03mvoGV/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy8YRcFTSA/C+sdFsERxC+0Ordv1y10wYkxKcWvzPlVHvPC9/lqONs1UBSloI9kdlBH7XRm7iFeu5CpIenbh1IYWj85rybjuFb0Zf82K7ENuZrHmn4vAG7wSOvWvdC/ymP8TEJcTlzMWNyV1SVYWmmpP7dyWHhrOCOcagYShIaU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cywaps14; arc=pass smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cywaps14"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-69d8f70cb0cso3899227eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 28 May 2026 10:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779988943; cv=none;
        d=google.com; s=arc-20240605;
        b=CVy7AgSzRNt5Nj70pT+K4Ee5gOHslcYpcQd0OdoOyDnZSi9GXy3dqGLd57buNkHBjX
         g5+ELg1NClh4A3/vhZl3shgKXMnalWF9AysOlnsPthxkXU7K+qJIhYl6VwFCkEowQzsQ
         spCURvllny+pkAaZPYjh9PUOGj64y6rcE4+SUgE0+Bb8FrxMrSS2HfsAMR4hGB6fwtj+
         6qHMxe0a0FcEzovbJ9XE+euB0CfFQVkoMTDxHVbWJTIX+4PZHrZJGWrzqnXSqzOsQnaP
         mtFctbpVJ/5U+r2n2h8VZAFftfgqNyli0GQSEgr8FWwx/q5/YYBPfwPKQ5c1FemtAe8b
         0Wbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KxgWeyNXz7ap/tz4r62YW0FmgrvmVcbaWU03mvoGV/8=;
        fh=g5mUwEfIruw+HwgzAQvH0/p2sT/pczxvzeEGrnngZi8=;
        b=iwfwpDI8QFGB/lvk5KIk3tbf0sTLDRqMA+MW1sgXO4xajPJpVDMCdU+GAXVqsBbz3e
         FX1wbK2tqJTzarro/p9Sup3fQgWRm5m1w6z48tawJzPfDHiTpsELRs+KmTMUzb8ROlr+
         1o/uHQBRgqBHS+iAYGNYIx75DdDYdyCf3dWozk3hYqB1Ass5S+STlAzEfcceuquc2N7U
         CP+GDuCyY0cltoW+XrbjHLhNW5aagCRn3uxXuuA512yC/CDCSv8IGHySYqWyCf1K7lqL
         pUHDwNZ/7r23EpXiiUANrAsRLGPyfqwPBjw+IUNBetzYlDf7ZkUzeMRGjX5bznM+AnOP
         L7UQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779988943; x=1780593743; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxgWeyNXz7ap/tz4r62YW0FmgrvmVcbaWU03mvoGV/8=;
        b=cywaps14lZkDYsok3XPfF96uwgTRilDUrGa5WXv0Fh6P5DWdj6uHODXHM6tfLSX+1u
         ft3ym5FRQ4iwr6Osq+/JpClFXHTDzp8bEGXoNjopzLtNR4W7f3xaWQwexdzyFWJC+hcl
         pi4u5TyjiPp6bx5nnT4zFsVpe4O+dzEbAS/8pW9wjX963VvgJGVIqbPLhjEzEETx5zuy
         StVrGIbVUu/IRjCDqGUIkw3vyZdxkb4QChn+QaHi2WBgseac7MH2RjtqGvucQhK9FOtW
         2xx3R2vkiygGb5rolhv52RjKxGSdHpZ/npgFYUFTSk7IWGSc4nx4j05L8DJh9Fvy2nAk
         RcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779988943; x=1780593743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KxgWeyNXz7ap/tz4r62YW0FmgrvmVcbaWU03mvoGV/8=;
        b=p+RyfAdqllhYDUfDyj1662af645SybCcDEM9GZSFnc44uIe2jsWdJ4mXYEtytAdGYb
         7Wz+cbe5/X9pxTiCtioun81zlQMmRW8xzePM5iwIweU125+BLAPD9vJSnF4lldeUpi3A
         AgPQZ4ivrg6BGJebOL9MmXHPQdtnqCR+IGQRXdZQExnDvO9qyvZImZ83xcwLTakeqjfm
         p0onAERHgZTdO2XbZ8uGwqGF+DfyKBw5cESlAVfDoJT4h1cZsMQp/MayHrSfHS4vSCRX
         N/tGMN9l/1Cdy5L+ThcsA0i42KCcFGxtJlZtjNFf54ntU+oiYH+y4ho4b3d95EhsEa/c
         hREg==
X-Forwarded-Encrypted: i=1; AFNElJ8VpVUl0ULwhNyHQH6qLV2rHBaLyHLpLsxluKsUm6yGFiwh200Lr9OLeSI3D/+rV0qfFHhDDvGyPRU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA0Q3+0HvTWThPZebd6lIhIq7DXJHDvUYKkfjIYCJ+L0D5b85t
	yYf77CG2bddt7ksQWT5gR5wl0Cu0L6df7Nfa0/suDx3vlxWsWcA0/X76Nnt1SkmiQo0ZCY+jlR9
	YxiTBekMUcciIkX9qTJz21f1Yt2OE4CI=
X-Gm-Gg: Acq92OGImYzIVySoM4d5gMHa7E1386Y3S9LfpUc7TsVE07J69VdruZIK7RESddmRECf
	/XsFX+KhOsNhNLW7AvkxU342JMGieLxwiFQCrTtQ01u5kVXKGhraQ3tS2Iu+YAMZG7xkOo6ax62
	Y3HqAcmPwynD3Wu/1wz6Y4Bfswo/8kTvSZIeFatfbMqM+MkAojpA4HXLZUdvlBtSIcHAlhVSb15
	6D+/BRQDvgEbBAbxrsGB4eA6IKpZZQlDJrhxUmsC3mw0+8dEkGM7H4MqAAt/izrIAB+mt77Yh0+
	caWnqU4j1eb8ksOPKjxLYErrE+PKBofsFuU30rDBhu1yL283/w==
X-Received: by 2002:a05:6820:2085:b0:69c:502f:bcdf with SMTP id
 006d021491bc7-69d7ecbf8c1mr15996485eaf.50.1779988943365; Thu, 28 May 2026
 10:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528041958.57231-1-amandacorreasilvax@gmail.com>
 <CAMAsx6fWkQi1BHRPypDQeXL7LsDftfm5SFsgf1-pSUMQAdo8YA@mail.gmail.com> <874ijrlhf4.fsf@trenco.lwn.net>
In-Reply-To: <874ijrlhf4.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 28 May 2026 14:22:12 -0300
X-Gm-Features: AVHnY4JgdKO4zS67D4hMgKNBwav5lvmF43F_iXqbTyqHthwW3f8hT35eGPUF_QY
Message-ID: <CAMAsx6esEkQ6bGn7RYVrrna2r51qLLTvZbbsWJ=y9zg7aBTgyg@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: update maintainer-handbooks
To: Jonathan Corbet <corbet@lwn.net>
Cc: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 11:47=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> w=
rote:
>

>
> Is that an Acked-by?
>
> Thanks,
>
> jon

Hi Jon,

Yes, that is an Acked-by.
The preceding text was just a note to Amanda regarding maintaining a
consistent subject line for her future contributions, but the patch
itself is fine.

Thanks,

Daniel

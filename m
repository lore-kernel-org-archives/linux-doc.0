Received: from mail-qv2-f41.google.com (mail-qv2-f41.google.com [74.125.230.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06CA39E9C8
	for <linux-doc@vger.kernel.org>; Thu,  1 Oct 2026 02:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820856; cv=pass; b=dBRCLpolFS5rcpCydHbiK+sKGevErSDfv+U8/h2TM0e3iUzQ1rhQgIsnRE3YRpPK5spx/TS2S92Mml/eW6KUf6iCbcDDvXBaSDoB6MspmZuenHQ58gyGG4/XDIqidpG0czLUk1z6DxgR/mv7AHByU8YtSQ3S2xDiIGRnSOcBV9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820856; c=relaxed/simple;
	bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s6KMxSHHGp+EyrukWFnF12MLSk0sCvimvmdVVCdXZrHHfC6QVQjDGlmU+YZQMeMmNrMY37tN3oc6pfYnqJrtJmr8mxP68k5shI2T0uc9YzgbLgaFLXr50PQMZAkZPj4mlIbHTZ0N7ZWrjt6b05pphNaWFc3KRcZeCKpJTxxGexw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oit94SJR; arc=pass smtp.client-ip=74.125.230.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oit94SJR"
Received: by mail-qv2-f41.google.com with SMTP id 6a1803df08f44-91788e38a27so24131976d6.3
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 19:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790820840; cv=none;
        d=google.com; s=arc-20260327;
        b=LeKLOKYMaPupnVk8Fdb31vpUQcPu07fo8lU2ELztWr/WoEMU6HlUuY9hnQpZfnvWOS
         D1bXnYN7J0i03ZB5hEqYzl6uR2wqkMgSUIefq9m0DXykxyIJb40peCUxeYd5bvLjBdjj
         RbQX4gaN3XC49POzlir1HkBGXnRCKY241mlnkU58tOwWeEBrOezuz1yQz/+GgYdEL8Xw
         CKoipN+gsf5O1N9r+fsO7deDl/04CbGmZMjC8BYbgfbgs1qfuv7Kh9XrIxbh4nmzIE95
         nxZf1PN9yiRfosvCEbyAfp1QV0ubvMgJm/KjcSB64VGWp4JzQn7PEyPoDi9+fGFV5HYc
         FRLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
        fh=spSD+7ECPDs9v+PE29oXDwnFd9RgGpsqVVuHz2tKm88=;
        b=OxycWRanf+28Jg9FmOzJysoZspaOg0NsIjZWHdIVU4pijMFhoy2TRVIAsgQBSYOcpq
         ibjYwPdUdfBOGbFhbgCfbgmE38TSnQD8nw9oxenszCwJEuRqZdBoMfBsRH60GrifR7lw
         tQAQJAUP56yrzybbP3rZ7OeILhOQj3D8SM0xrQ6BHF5NLkVSCaSWj84ukHY5fQ4BW8eH
         Gq07ob0mel4l7xaqD/1HNcSHR4CfgdkPSeXEr3YlY660/7UefntM7GuD1qS2BTY3WeNx
         09O2KDC2EoUSohTNtKkCZsvuTxIcX8vj+znbnBUZ9A0Y5Nqbf6l6euIkHEJCFN8HymRi
         eJ9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790820840; x=1791425640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
        b=Oit94SJRUX5rbbg3VsBngS5x544esEGnRGo8ANr3+h9/8pq9PelPJXK4ebV6Sh2ku8
         WMCPzr8kPk9yhHgSKB4FZ0e6IrSOZG0GjwjNacZznWPWP9unmNDezKKgDKMA9djNoJ3T
         oOMlkqLgT4AUzeRAy5f2ixR50EiOhQsHeDsgPl2csCBxjzvxUcItVAVWP3xltXyIXNs+
         6bNDkN14lmvzelClLVdq4EcAlhUFmrvSBheyrybjTL0trw11xXl6SqwKAx4A/NVjuHfc
         5NuvX+2R19oMwzYd9HkLPDNDj5RniT6l3ZpUbgzJPJFSh2CUAcTx/tfS6PiNhtiB4dvX
         6ODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820840; x=1791425640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yk7ss9TOQXru4kMYGhjweiXMWqsnD33IHm0XuGjqUzc=;
        b=nQIGGId0Cg8OpgCskXt5vO27yYItBgwDMsOxYxqnoGcL43FxyVg4fl3WQRykTkkgCP
         D8Qr6vQ2XvULn6ZwbYWkr5TKnaOeZZOCLdQuttt2Yk95xDKILP/nFN0yIVWRC41IiqVZ
         cFxT6cnPOyEHc6NHLof7+LLB/pB7TkTR9GIdtLMvyxeL3RlZns6q6b9I7ZnmaVzbKZfM
         JmvoMT86s6X2Tdp/UY8XpIct4zIzUwAJPGhe2fpLv/TibwIuUbA1+WZH+6Cuw1kPbXQW
         qltzjhYqoaE+k66WinUmnxACnBQANER+/WUkO49ht4eHGOevGrZN2djpxrlCtov7nu9Z
         R+Ig==
X-Forwarded-Encrypted: i=1; AKwUvBzjfE2ew8aoGEwbzn+gEPdMHTgnOSsjzMp1h5YKqIRv3U36F9CIgqSHfHOTIZnl8CjanV7EYpUKJvI=@vger.kernel.org
X-Gm-Message-State: AFuF++k7br+QoGFiy4uH5QLAS/jCc1XVdljggVi48u7v6HpJB6aNsI2t
	b8mq6Z63DO5JifMvOcEHETZBgckGWT7Xp6EfkEC+HeaPmQ/zREVwhGb3n76Ty1nD65ny9MpD9l/
	ncAg6CwmBSVG3bp/7Q0CbiYk67Nj3GoOq+EIYRFE=
X-Gm-Gg: AYBFou29XGi/0TiQBc4Kv/U7FSktOHzSAPAzqDcQeLuf2qEGyyFk/C7LObHTiZRWCdb
	48Q3X9JdZozXwATfGsofyVV9mdiQlOZVqku8nLoEuWZA6fkIzyMiBc87F1rKJR4PKmkCEGI7A24
	5RdXdTxGrxUFdZlwAj+dw58dUOg8+TmumbdoLKfWXQ//RRtCJd4/xt3PRNmk58Q3hwwUOUid8DG
	igLdUU8Pp6k19Tm//j6L9yBcKsT5FCJwZCyuXETj1nP1+jUCrl08fAOg9+k+O2tevuuu1advcrh
	8SnI/7AMPszqKWJ9ZubbAQrdeylkdOVIdd/4eAhj0Pbc9EM6It5wkY+sgrrqqy5yRwzwaapes/m
	d0LsV3q2yjRb5mfkm9H3ThOoaYLbKySK/cRX/xX6KKK2ppo71CllEC4H81PMb8bx7mF3Y2TSoIe
	Aum/Sc
X-Received: by 2002:a05:6214:2269:b0:915:e6ed:db32 with SMTP id
 6a1803df08f44-917a0d609a1mr60922996d6.43.1790820840135; Wed, 30 Sep 2026
 19:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923025148.35637-1-vinicius.m1821@gmail.com> <20261001013833.29002-1-vinicius.m1821@gmail.com>
In-Reply-To: <20261001013833.29002-1-vinicius.m1821@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 30 Sep 2026 23:13:48 -0300
X-Gm-Features: AclHuK_jbvTF7AW6PD8bczL9LsCGaQVdfIoh7r2Bqp9D2zg3dubFwY6ez1cEZVs
Message-ID: <CAMAsx6f5hMH8FF4ykRp42AJ7AxbuOJw=g-VL9PCFYYOAW1-SvA@mail.gmail.com>
Subject: Re: [PATCH v5] docs: translations: pt_BR: translate threat-model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 30 de set. de 2026 =C3=A0s 22:38, vinihsr
<vinicius.m1821@gmail.com> escreveu:
>
> Translate threat-model.rst into Brazilian Portuguese,
> maintaining consistency with original formatting rules.
> And add it to the pt_BR process documentation index.
>
> Assisted-by: LLM
> Signed-off-by: Vinicius Henrique <vinicius.m1821@gmail.com>

Hi Vini,

Thanks for v5, the translation looks good to me.

The link to admin-guide/reporting-issues still points to the English
page, but that is fine since there is no pt_BR translation of it yet.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>

Thanks,
Daniel

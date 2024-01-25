Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A96C1B944
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 08:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706172215; cv=none; b=nHW4k+3VoXtxUrmtFGgIGZjCDIligDFF541HeLP0qQRuZs9mykN6dYgMQgVCUCVq0BNDwrJsUuJ0hgJprEDiAOzy4zRGaLTIH3lNDXkT3pS+OqeqMIiNxdRWSUSrLVgnKexfkiUN/1JDauX+A6z7ViWGPMqtvA9tbfUekt9Bmrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706172215; c=relaxed/simple;
	bh=R6xBsFIzxs3ZX3VwdwbYtSZ2G1w2NKp7zYhPX2+phdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XNCpp5bjOJyA/tcefyNRViff5NvJ0bP31tPaf6bONr7ZLC9R+gHhQQPHnow4XqPiZt7+mISdsYWiDddiPL4bgHVPtqVDGkeA0yKK89A//QkE/WGsiS0lV2fAokNWcqiT2FLkaZzIfX5+pWJvY+o26igIaYOXyycEil5RLpKpTY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jHovY/vh; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jHovY/vh"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7d2df9d1976so1598278241.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 00:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1706172211; x=1706777011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6xBsFIzxs3ZX3VwdwbYtSZ2G1w2NKp7zYhPX2+phdM=;
        b=jHovY/vh27gGi83bwSC1nxezO1U38Th7Yr+oeesczc0u1vRIrqI56PvBSDDOQJapq1
         KJKQcS0JofaOnpRCVUwGoGZY1038ln9dpjyyGi5BOczjhnWE5/i0diSAyGIOtf0u4Sew
         aPT6WgX64VFgu/BRzSseqDJ9BXBIwQJs5z9hJqAb2eFXJdkmN97e5h6eQfoGp/85LZw5
         7qsa3AF0wujZqQgk5DHUnX0oXWfins7l/7Q+s4Ol8+mnfeXCXzfB+gobdYuEcOxjsaiI
         VA9mfO+3nqvY7KIWiAhsnD0Nz5IgZYLmR93oNqTfagEEyJpCwPdmx/9qYWl0ecAGYjoi
         UaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706172211; x=1706777011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6xBsFIzxs3ZX3VwdwbYtSZ2G1w2NKp7zYhPX2+phdM=;
        b=w+BiNtIw6cvRp8GoCehnqPwSPi/6Ff5AbsVBdXq52e+LZr35aHDA/dDjFBfS5W+lVA
         3DIwS4es9HCH3uqk1Rq80Yb2U9/H3Jp0rUKaHWwdKdpqhawCEsGGJDXqBjhVZ5WZGc9b
         4oU20UC/xw6fHQm8wFKhdQgt33fczlZzsVvmK3qLZRihGO2OrsiW1IwpzMy5nmWqsSIY
         /5EtKCwysWEhFFEp0RFVn0MQRbCk2QqIawJB9g9tMRPBVNxwsu8Ps0aHQWAWwewNJaMp
         86pE4czKmQF/esCD8VVLOqzVvd4tKhnfgWSO5awzvwXVeTu1Ms0dVTPO8x+Twxh73Ecu
         GL1Q==
X-Gm-Message-State: AOJu0YwHGtrA+/PXfcMtYOHSTCTpfDfK4mPJPgkUvtJaJPMAtjrbMpfS
	vnnaMZ/rxWPeiD9XxC1x1JjKzBWxdqjuxdNvD1z3GEPNpq5pBJg6HoqPh46WV1Ds8vKcgZOmbTR
	57EQHqjrccM83MiiY2kZPSNV3z5lxTL2w3rTA1w==
X-Google-Smtp-Source: AGHT+IEbxXAzBMt9uknzb02Bu18zwPl1FJlUa5sv2Pkf2R84ZO0GUaj5kptWwmB77ttmAnfgr6+xWwyt6cR6zJEEknc=
X-Received: by 2002:a1f:ee4b:0:b0:4bd:7bf5:934c with SMTP id
 m72-20020a1fee4b000000b004bd7bf5934cmr177165vkh.4.1706172211020; Thu, 25 Jan
 2024 00:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240123133828.141222-1-warthog618@gmail.com>
In-Reply-To: <20240123133828.141222-1-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Jan 2024 09:43:20 +0100
Message-ID: <CAMRc=McEwWQuJMb+25Yo23yXbhTsCDN4kMT=K0Lwg8xyJTrHpw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: describe uAPI behaviour when
 hardware doesn't support requested config
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linus.walleij@linaro.org, andy@kernel.org, 
	corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 2:39=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> The existing uAPI documentation does not adequately describe how the kern=
el
> handles the case where the underlying hardware or driver does not support
> the requested configuration.
>
> Add a Configuration Support section describing that behaviour to both the
> v1 and v2 documentation, and better document the errors returned where th=
e
> requested configuration cannot be supported.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---

I applied it but shortened the commit title a bit.

Bart

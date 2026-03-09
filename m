Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2881A317D
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 01:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773019366; cv=pass; b=nCxfetDEwXYAzifWy7QqKSTkOfQKZTj9OUGoWlB6/qdRMRScI4N4N3FZ/olrlf7udB3oh37VB8WPtMYsd0pcptEg7m14qTlmhZpz1LtHcF13KRWdpAQfzSyzo772X0/N43NyU5dG1BU9fF+QtYKAL3JjNFUvGP6Li+060T2WTn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773019366; c=relaxed/simple;
	bh=B+NZvAdsTPOHEZcWxfpCFWLMOlEJi4VPfEOETliyfS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VgO2UZ6hVNaXI1WXb7cQSP+EzNZrKVa/XpnIcfPBRnUosGe4kxE6uivErNodt7qKf/Q0ZcdVU+NWWTIVM2Mkag2OvdA+N9uaWKhN6KUI1EIUEl0rA7vKLrRVp0c5Ed1UZLxxNHrdp1zuDBBGheK1fLXSkz17kE/NJFuUXQOW/Sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9ujmNrY; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9ujmNrY"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64c97997b0fso7788587d50.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 18:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773019363; cv=none;
        d=google.com; s=arc-20240605;
        b=F8h/j20GsyN3uoiVpbpcJ6ALRhfkcKxTMypQWk4zLA7Y4hcV/DbZ2XpOdQ0LwMwD/e
         bvAKK33N4XF6OIOfEvp4qSkyfdisb3935RSRKXEzg1fxJ4ufLXC/Xj8r/OYLruUrZSX9
         F47UidTXAPNpfnjtuvDbRLE4hGXizn+30uY+zFat4gWYl9ke+hZmzh/tRq5DxpNcT0eQ
         8UwRankMxsmlnliQBJIfHl+7Kxbnj1bVp8y0xcL78rko+bsWu5DBEqPOvpf+Ht4BANCW
         rIz+kwkMdI2kM3crOaogZluFvmbCrlII0i+2P/1LfhI01L95l+U/cHNSv07KXQDsJ6su
         dvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N2EabwjW5WxPwX5Blg+/kL5UKsujhBTVnxIyzjEUEx4=;
        fh=RUIvEHtReqaLixM2zejXEVgrSIV35i1RVJtbBSGbu7s=;
        b=LNgwektX5LmLA45Xkaiv3J2gc6sgAhMXfvJC7FyIvjeoRD8DwT5DYJrMD1lITCM9KD
         bX4RIw2jTVPlK5U06oycXS488hphEJ78mgMjnF89a2CndhNbnBK+RCoPmp0tyJxkePar
         L7creQCU2UaOXrA1W8Fs7+jKcLtf2YnwfO3L/zY8FFzOLB66JRJjMYHML9roDwG4wSSV
         VM6ZxpmpGsHToeTWKhUeM587+du41J9/HwudNj/j9njT7Hi83D6vX23qrQgDmYeuNcZX
         xZEQlczdz/e11a6R5MOUr1qOvygKEnO69Na4cVuzC5uY0dTKQIG8c6mvZpE2qibsqboW
         VvCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773019363; x=1773624163; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2EabwjW5WxPwX5Blg+/kL5UKsujhBTVnxIyzjEUEx4=;
        b=S9ujmNrY6kvhPdJkKNlDrKxydO37LRXT7ecpFOXe69wG6UT7gZY3mkS/EN3R6dSlcr
         R+MhLyXS/gdt7mmnhCGWfgjRsqwxVKHPDPKR962L+ohRWDYypgwiPeGqbJMGqzu+SZPu
         H0JLfsDUckB4frkbbwgPvsYxY80jB4vp+9z5n3H+SPB+nXmU8fqkThjo49Wp3pCekdvo
         3jWPsMzIGtsZgOazdQAVcRUhyNLo5iU5IZzT4V41iYP/z8rR/2+mRz3bou2X8eOwIzqw
         oUROKN5T0mMKUP3EwsiWMvGWwnMvh9/l9/hOEFheWpPr5narXHPpz2T120n5eY6uy4wR
         6yfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773019363; x=1773624163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2EabwjW5WxPwX5Blg+/kL5UKsujhBTVnxIyzjEUEx4=;
        b=LqD2CflG1RAObUeeIbllMxacLrCtm/tNcv8Haz4cK/5cTMCOnp2+8nwxbfoHrpWFSS
         dUPofdHJ8z+4IhcXrn4jOas2b1ZrMBUsYJEPfxeY0cdAI8GRD0CgbNfLDLUMM7JQHk7M
         H63Ejx01UFUpASgDU92MA5yWBaVd2JDdTEGzC6hXm+GJtKa0qPjEnuRcrjjybEPXodRi
         PCUginL2t+Rmy5ctcmbn5t9mh7LrjKNvgmN9H85ohPANeJWlZYzKFRiIUuCXVY/sb+yb
         L3O+Mx0i4jY08d8bgZ2sqZu+FCLNbUTnmIFfpeoV+wzDPcecyf7lMRTSefZIV3JOqL6K
         YU5w==
X-Forwarded-Encrypted: i=1; AJvYcCXedEYc0CBnLBvso+x/KHLE8aqtklcWAvt87aYa5dSWK57Tm2ZhkAL7nnot2gC7w5GaH/spFqgRWAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ/ksIucLd0LIebB8aaeKCuRaZzlYKGYU1pE8YZVlMjpyQLXoS
	gQobPvgDKWJSOUgivAG1i/JBGCSx4bLQJZQ4ALGYPbhKbxmXzIWpRHTNo+ezPzUKJxNb5CLJdfN
	eWb0WSx2j3Co8iRPmlmvGU793AiJdDT4=
X-Gm-Gg: ATEYQzxHBll6pRG6mK+AGITs3U8vLVlUho0vzgdkWKfXG5CX+ou/yCl6MzMimwICJAN
	StCrObwqcZ/8KIB1LNRukAcnIKspitZNeAT3IrLEhAf8bfktOWVgUindxztF2QSvA7lB5LExJTp
	ZEyHJ9xKORfpg3WgeNLfjRnEAvfWjVNpQsBHr7JwGiy0K16hie/fEYWI72laggFPAjEkLwQY1N4
	83rCEF6wJtAVCIMR08iDp7of/jA9Q7s8ouSaS8APg1SF37etPfCajxpXv5zcn08yBw9ki/BxtuC
	KfcZgg==
X-Received: by 2002:a05:690e:144c:b0:64d:294e:9924 with SMTP id
 956f58d0204a3-64d294f2d51mr2796898d50.86.1773019362840; Sun, 08 Mar 2026
 18:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260308100851.341-1-tttturtleruss@gmail.com>
In-Reply-To: <20260308100851.341-1-tttturtleruss@gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 9 Mar 2026 09:22:16 +0800
X-Gm-Features: AaiRm50wSmO0lVbz6Ja8d-X_hAJPknw6EK0FBsvvFyg25jIlfu5X_T3ch-YDw8s
Message-ID: <CAD-N9QV+xB+0zc2RM1rbO3L36FyFa7WLHZ+4vMgviGg717iTaA@mail.gmail.com>
Subject: Re: [PATCH] docs/dev-tools: fix a broken URL in dev-tools/coccinelle.rst
To: LIU Haoyang <tttturtleruss@gmail.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, cocci@inria.fr, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 6:09=E2=80=AFPM LIU Haoyang <tttturtleruss@gmail.com=
> wrote:
>
> The original supplemental documentation for coccicheck is
> https://bottest.wiki.kernel.org/coccicheck, which redirects to a not foun=
d page,
> thus change it to https://bottest.wiki.kernel.org/coccicheck.html,
> which adds a suffix to original URL to make it direct to the right page.
>

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

> Signed-off-by: LIU Haoyang <tttturtleruss@gmail.com>
> ---
>  Documentation/dev-tools/coccinelle.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-t=
ools/coccinelle.rst
> index 2b942e3c8049..f73ccf5397f3 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -61,7 +61,7 @@ Supplemental documentation
>
>  For supplemental documentation refer to the wiki:
>
> -https://bottest.wiki.kernel.org/coccicheck
> +https://bottest.wiki.kernel.org/coccicheck.html
>
>  The wiki documentation always refers to the linux-next version of the sc=
ript.
>
> --
> 2.53.0
>
>

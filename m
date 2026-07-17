Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893303803DC
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 18:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314498; cv=pass; b=B82lQeHwkv6Yx6gI5OhfWGqfbDRDQ94JaRgxALXqMa8s7DBCRJbVPw+EkKzHdD+nnqlk6lcw0fu0n90Ud2EJ0eBKE9ve9CuwGNkrs2j//IOzRxkZcRPhcFJurbKHlJ5HCJt/8gX82eLZVdzCzSIDBA3A7KkdxzmQFcQH++rBTAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314498; c=relaxed/simple;
	bh=hzPKdzAkDuPInWzAG/qXgMK4TTpDSE3vfiw+jA4V4Oo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tpccCQlXM0E1c+7YtfBJcS8NUJkrwN+GtFUbXEDP8HqkxbkItKhIz107A+EzNFCmicuLV2KX6gx0O2vRavTiR/KBWtZG73KNVByKqT8voxow/fzZWvFyy19A2do4DEMFL5G9kLD99iuNohrjHbojjfOnWo+jetAudUVc1Hlr/YA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ntLq9MGr; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ntLq9MGr"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8efb708b1a0so73520266d6.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 11:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784314496; cv=none;
        d=google.com; s=arc-20260327;
        b=daVDwKHkqIzGrL9xn+TCk/sIEha8k1ULkfG18ShePd1elFv5oxoX4Lk+pvqoRhTwxr
         1zoeX/G2EWHMWHmtgRAy+3HHNpKJX2tpWjwC8wv4g+BeWhoXF2gtJb9yRfZn2KIlfebm
         cFG/SJXG1fj9RA8FXCTo+wMOdJl2iTCSyzv5k/XIMvIUiGXfQaklqrZT+ehV9SRIeeA/
         Jzo+DmOmvSPpgSYUqCqV9SE3uieLfD5WYNex4sF7tPgVJE/sdWcOVfeoyEhe7db19Zhg
         IOWKwfxHpLHBqKQTmq2lQ6jQqNAdl96SgQ/FrZ4WrWWGqNHI8M8jgVc+bEbseZatT4ub
         Qmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DngZ5CQ7ucnFVXCIsRSJeAkU/yQlFSOK73yKmtouDOM=;
        fh=MwM/ibIM5CqoA0CYmYNey+nKQGz3x85+tcO5XyP/Ie8=;
        b=mTeG0ROFgOS8ZTeTjyYL31PHxP5g0TQjuPFYjoptLXEv8/axuPf/o6g9FpNZKs9rOB
         f1Hklb9dpcu3RELxxSlbtxnqSfvwZKLwRSIZQ8xLUb6on9ksVkhHQES2biwWaSDqjW3y
         oi+AE6HbT6vUIUs5DpyWBI2YwxP+fymaDO/rp+iSdZCaNJMqDlSBnjNkyAM2QyYsEZEO
         K4l0bLd99Z1HxP53gdvtEyWc3/vRLCLziRbj5dTfRubvG29ED2Pq88H7XebypU4mQOzq
         STiQXAZhD8nNKHvDaUn9jPMQxXfBueB+FzfZDSft3iGvlO/4GRW35c9sxSuMi9I/iVt/
         +IKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784314496; x=1784919296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DngZ5CQ7ucnFVXCIsRSJeAkU/yQlFSOK73yKmtouDOM=;
        b=ntLq9MGr6RBhonfgxqIGFc9f0VrYwT6oofBkVM+Ihg+UhE2H8+AHnHIW37z5YA8qGB
         7vncesQ9QR0hVK35WZnKD6fO3R+YR+4qHSk5UnwgiZ79Rx3gvgtP5cHqJbtysk7UKbDZ
         tc2FL+uPtD7Qx/HUU/01kudfkDlJrr21pzH3i9v2aNzM7ED4RCwbOwnrld6KqlnjkrSq
         pYzO/4FdKkWRjlhMXEeauLxMi4CiQ34A0K1W/igPEtCDLuw5RG6RAjTquxZsOd7DpgxM
         8Xo+apgXVv5KoIFnJsG7RMKBoynaCVC2I5Vok6GFyolpyQd3GdewOnDnhHvG/KtCm5Km
         ak7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784314496; x=1784919296;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DngZ5CQ7ucnFVXCIsRSJeAkU/yQlFSOK73yKmtouDOM=;
        b=Pbo4KbeZGdgqYnOgRETyAzOBvZaIVw6SeRdLBpjTZdMOQMgctu0leN+oF1KS1EcFci
         PuBUr53g/cWeW7SaazuwLoIQTTdzGAsEw8ip3HaZnYYhAmqnZy3i/LK+Gja3HPtMhnDn
         O9//JCePdIquV5nCEz6GWz2wyiTEkRnukDzV0luwv1RtpEiRhcVrjTkeW32vjte5Eunl
         F2stmPBEXOYTFNuk88e6AwnhJMexvRhmcPuzm3w6XsTsJy6u4L2ep3Hb2I7cKi5YGHQs
         bqGgG0VGFFLMRB6dGovNXdkHvHuJi/Drs90YBitwkwotxlXjK1oU+XRmn5UVHbUyjb0h
         jM9g==
X-Gm-Message-State: AOJu0YwcQ3TjUIcjmwh66IgAw01VQ5ZRwTYTY4MyUncNdQ5QomUOmrRM
	t0qFJ9GMYvI4d2He3x8QVigq1Gl/tCFdDNI98UJRiAHdJHrDp6M00he+yj65n4o2drGEXgV2un/
	Kt4c6jEGk8jlf7oS+5rLOifqNcSm2k2nfPQm6h54=
X-Gm-Gg: AfdE7cme1jh1F1Yl1sez+7YHPszy4Beys3hDufuBAf86h0hD0/F4dmf1+23MnbAiJ9r
	hY1wk7IXSnK3Q41ZKSHJ+bm85J1QhwA+x+H8M8bcRosF6JkTlNIS3Gd9c3FURIrVK1Y/zaQIbJ2
	y77CPLdhUuuurmJD/ElYuzc2x0RgbE9NosT934JmNhGC3Jq6H5RXsX60XEJ8W5+OmotXPfx4J6R
	pn64KD7SgHy9Q5PG7jMfpzoIBRZOdqBCMJmAIe2ZmMboZAD8tC9VJF13Pfl2J/K5kGs+PPb9W3Z
	GkfHyZzm9Gq38AiRgh84Yb7UOaVS3Q9HQZLRk9eLqWtgVoYJGVn6E/4zf0eiZeZn5CMr/4hRWC4
	ZfBIkiHWs1w==
X-Received: by 2002:a05:6214:5709:b0:8cc:d29:9f73 with SMTP id
 6a1803df08f44-9077835b0c3mr46172726d6.21.1784314496026; Fri, 17 Jul 2026
 11:54:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717165908.1040053-1-le590616@gmail.com>
In-Reply-To: <20260717165908.1040053-1-le590616@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Fri, 17 Jul 2026 15:54:45 -0300
X-Gm-Features: AUfX_mxdnIr6czVut2iUrL4BNnIzbWxXuxT9EPy2iEbv8eueQWxeqkfu5pyXsh8
Message-ID: <CAMAsx6dWuHdYGGTOWZzP-Oy8DXRGh+J_QdpCzaZs4dLLLt+jbA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate programming-language
To: Abel Philippe <le590616@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em sex., 17 de jul. de 2026 =C3=A0s 13:59, Abel Philippe
<le590616@gmail.com> escreveu:
>
> Translate the programming language documentation into Brazilian Portugues=
e.
>
> Signed-off-by: Abel Philippe <le590616@gmail.com>
> ---
>  pt_BR/index.rst                        |  2 +-
>  pt_BR/process/programming-language.rst | 58 ++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+), 1 deletion(-)
>  create mode 100644 pt_BR/process/programming-language.rst
>
> diff --git a/pt_BR/index.rst b/pt_BR/index.rst
> index 5b8b60cf930f..0b9748e8b986 100644
> --- a/pt_BR/index.rst
> +++ b/pt_BR/index.rst
> @@ -83,4 +83,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
>     Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
>     Adicionando uma Nova Chamada de Sistema <process/adding-syscalls>
> -
> +   Linguagem de progama=C3=A7=C3=A3o <process/programming-language>

Hi Abel,

I noticed a small typo in pt_BR/index.rst: it should be 'programa=C3=A7=C3=
=A3o'
instead of 'progama=C3=A7=C3=A3o'.
Additionally, could you please include a description of the changes
from version 1 to version 2? Providing a changelog makes it much
easier to track what was modified.


Best regards,

Daniel

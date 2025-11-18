Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E793702E4
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 22:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503369; cv=none; b=r0i/J/fJEDM8br8jxi4ntEEumKp4gpG87Aut8Wxq5Nh5LAY3geAdbC7TLedaxAif01weCudM7+s7urXY9I5Iz8IjuqCcDgKBLHJEGONvkohhwGiORrQJziSf5ucXjb8qqm9ao6sKiLP9WuEyyudrl/zbZ9+iIeLBGSisgVM/Gn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503369; c=relaxed/simple;
	bh=YCFULhcxAgKGD6Fu4nfO2Q1c8WwStVF7Bfc7c/+DIyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mtw0KBwZlLr1NHN6riVVrdFUIL2GnW79dY+CT3RSYFAnQD7E6iJhvSgndbjZPY2K0LPt9ZPB0V5sfJaIHmg5wBeHVUbuUbYirI+oj1oAsPxlS84PkN19vipix5wDnRiLH2m/zF/JQ7KBruXjHCxyCnJTwxRF9bZhp1Hq9mPfhLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFcUuyT8; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFcUuyT8"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc07266d011so192360a12.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 14:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763503368; x=1764108168; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pnEXeMjZ0hBeMtgsOWCTWuUi2e3FlgHPCN/8EUoo/LE=;
        b=IFcUuyT83EzXvDiWXmmrnqssJnw14hoCu2E88wNR9E7uyHFb8iJrnz07fv3pGuZb9q
         uohJQjl85uqybt1mLV3bbGupKojXgqIccXXG7T6XhVc9557vsT12pILR+Kxg1z9Fodsf
         u3A9UX6v831Pyvfq5AdNofJWAR9S5JZr13UECjpuR2Fn+JNqplNPSKDixPVYlDabe3dR
         5mvUjg2njLCgwPk5p1A5vMtu4S6g9o/f8gTlgnvk4XzAvnxasxG+mmxCferT0tYXPinh
         DhFaBQXDCPKBlFNl5v3MyXYjP/Qf9iDlr2qCS9WkRgRHG+2ecgA3PzgAHAp5gN/N6oWh
         YdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763503368; x=1764108168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pnEXeMjZ0hBeMtgsOWCTWuUi2e3FlgHPCN/8EUoo/LE=;
        b=CjnZOlbnHKgIz046rk5/AFVQWauTn6qJWny/C6ku7ocWQ2oZip61t5Ib+T+LLOhgXX
         gvbRQiRAF/lKeUWB32zyeAIx6rvZGREl8e0XE/dxciFaOT6QVBpEdBGbhMVaut2o7/3o
         nrjxi7h5APajW6MTXmJFKCKLryzYacLpO/cSDg8fXozu9LvXih5K70hc3uEsnyYn3jDJ
         z0Qeln4arIZAF+AmGzjNQ1MMJy+OQV+Sgw0I+k4UVJ393FdoapFiFfIkYTrLojzFZv6w
         MPL4lN9YGXORHgBPdFC6CdkHqTCeEged5yqI0kB/NoCFZk33dkxkdiym7XTDO3H993uG
         136w==
X-Forwarded-Encrypted: i=1; AJvYcCW4PkT+p1V0EiSRj6pcltJK82xHKicXdUmYm9GB4z7Cv65U4W3t5KCb50ZR4XN9G3jRS3ygdL45dDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNM9pUPlb+i3UTgdi7bx/jZZXo6a9bFp5TtKt2xRJXO4KBWQ9+
	osoIKP5RNN96WsvPQUDY5k7dsrMl9fbmreOWSGMFL0QvyiBdsG+Rzci5spyJxm9+NrOtxoRywis
	+RNjz8QQrJt9Q2VL0u/x0OaATGK9g29I=
X-Gm-Gg: ASbGnctXMXddVRrLNu0tsjRXQDDO3fOLVFBC9lfbcg8ayRO7p+FwzIlx8SVOKdIMysV
	1WU1bec6H5frn7Wy/hOrkwr9SkfuIjih3a3xSr+Y8P6uF2IIGOX1RAm/Ot3UMkUsv2yK5oPG84c
	+mSzciNvG+E8l+p7dN6N0XwBo8EII0GpfN7Y1izdUwNjEPTZJZDBxv+YP50CmiP8r5oem1UPU7c
	uX5KsG0tr3PO0N7xFcmzcPN5Q7hV8t/znAbvV72wIlQEeC4RcHxGMtnNScOzhe+fyIpbvEVgx5R
	1RvStYx84M7TSMAaw/pJG/EfqbVqUF8lR1AeSOoXhkYgeMCN5vHXYvy/GxjLjtpk00O55styo7a
	ukiKQA6NQbe3J0g==
X-Google-Smtp-Source: AGHT+IH7rCgMdfX3UmCZHiTFv0d4wSFQcC+v2Dt1NUsbF6aijRcdZPzSDVZOg7Rk2sjC8+Szq7V1PdxyUI3aMVmjJ58=
X-Received: by 2002:a05:693c:408d:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a6c985b102mr1783503eec.0.1763503367413; Tue, 18 Nov 2025
 14:02:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
 <6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
 <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com> <20251117133203.71b97d47@foz.lan>
In-Reply-To: <20251117133203.71b97d47@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 18 Nov 2025 23:02:35 +0100
X-Gm-Features: AWmQ_bl2zqT17C8BhXtKQ0Z0YfPJU7JdKtjPIIuQFIyZbcgkn3IpFhWSC-Yv9dA
Message-ID: <CANiq72kGvfB2wqAv-d7F9racGoSX+TOmezA=ip-E4ouva-0U=Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 1:32=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Heh, the same applies to the current usage of htmldocs - specially
> when SPHINXDIRS is used, e.g. one doing, for instance:
>
>         make SPHINXDOCS=3Ddriver-api/<subsystem>
>
> may not be interested on building rust docs, which, on such case,
> may be a lot slower than a partial build. Also, I don't think that
> rustdoc currently does something similar to SPHINXDOCS.

If you mean building the Rust docs introduces extra work for people
building the HTML docs when that happens automatically, then yeah,
definitely.

Perhaps it could be skipped depending on what folders are requested.

> E.g. you would create a parser_rust.py module there, which would
> generate ReST output from the rust code(*).

To clarify, the idea of the "external references map file" in that
issue isn't to stop using `rustdoc`, but rather to allow `rustdoc` to
have (at least) the references to C items (e.g. a link to the rendered
`printk` docs at least to the source code where it is defined). In
other words, it is about allowing developrers to just write something
like [`printk()`] and the system would figure out how to link to the
right docs automatically.

We don't plan to stop using `rustdoc` -- its output is specialized for
Rust which makes it quite nice.

`rustdoc` can export JSON and that should be possible to use easily
from a Sphinx plugin without having to parse Rust from scratch, to at
least get some degree of Sphinx support. That would be nice for the
other outputs support like PDF as you mention, yeah, as well as having
independent-to-the-config docs. We discussed it a few times, but it
has never been a high priority, especially since `rustdoc` does its
job quite well.

Cheers,
Miguel

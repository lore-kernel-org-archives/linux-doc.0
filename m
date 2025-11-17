Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B713271EF
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 09:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763371174; cv=none; b=o/fUape3HLU9N2fDvOvk1RSQzYQOIrGiBVyZ2L/q9YMDFug0zw5uex7oAHlypU8pkAqW54x35ahUf1QE0HvJflRDaBrK+wETuO5stoq8ItnrK7akwcyfknOurr1WuBjDM8CNUBltjGnzFptOeDaIVXq9k39H8Gq2kSk+sfRn9zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763371174; c=relaxed/simple;
	bh=WDPdm+YP+6oF677OAg2ugjnlKPLsO4ptRzvA/O1ew6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jH7zoUvcaNo0WCQ1OJHTdeui7hcYPfwb+br0OYhUTbKZnTyl895ZkFxOiJ5vnPqOHVVGw830IISUg3tX6GM9FgkbFnLWp9SWP9VurHk7WSIxoH6iuQjsfhOBoSgjnAwnEUEkA1zvxS6r7oT1g8lL6TE7G/ynBLBbB0peSwny4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idVX3u/B; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idVX3u/B"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b997ae045b7so210297a12.2
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 01:19:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763371171; x=1763975971; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDPdm+YP+6oF677OAg2ugjnlKPLsO4ptRzvA/O1ew6M=;
        b=idVX3u/Bvf+1V6gknatyFtfUFPWpbhltIJQ0XDClZDXCKhFhiZ2hmgGJhU+eBJ6ben
         fW2DyVFmdQUyJtKloXtbW9wj8tblV5efvYJfsCADWpImONUvG+6QDMHzYG117jhYDtRW
         Y+DyWL6BkBMkQXy/ERYxNXbPX1fkWBESKuT/C/9C+szZKYxNTK8lBr+T3sqk6fhn5GWy
         qSZfe0nqpHlutqmAQKcjxGy7hNxjXHCtllpKYRHbqr7ej4Ls76PD4pZwB2FpPxzHk5F6
         RhXqMaI9SFuXsIHm+CpguvMGAmXXHwmFVP4/sQ5Srgyi6kEPAbG22CNmeM9Z8HCiudJH
         UtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763371171; x=1763975971;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WDPdm+YP+6oF677OAg2ugjnlKPLsO4ptRzvA/O1ew6M=;
        b=uQoQxziM4YRfUAqnV+JH4RjPtgNxoihjSvC8kEvDx14dxo+TcDpJukfK7q5QHRiBRy
         Uen+z+MlRRokAwkGW9bNpMn2BMPGZT4cSfoMuiSK0JY8de/K3bB3u5330oSdITTJAhHY
         OMViCSMkp73eNpSC0MANgrlL5vvHns4YgjOLj7kZLyv4TyhzKvALh8t4cb43b4wiZubm
         zhvY9QoEISeUcXVGlojcS1Nv7st26HmkozAGVygYEZyBN89pyWqRO+oRABzv9KCnnNVT
         YByilYUQ7XGBlWkKzeWDYf1Ep3N0CMZ9ByoPv0R9JHveBbzNAZa8ekeQKybAjsqtXjkS
         1DHw==
X-Gm-Message-State: AOJu0YzmHeBTAhpcB1u8QM5LzIrMkTG4Aws4D+XfK8PhIc852ShYPyKu
	eXDpVjxiQDxaFldeTMNaMg4nRivdw0vfkzLYmSufnAEtEoBidMApg5qZ8QHjOPhmUIMUmfFw9XF
	mc7MXzrrZlvHw0mZgZG76aLYp3SpjW2k=
X-Gm-Gg: ASbGnctyZxUVyCUUyy4FTxfJvLsMiSHeJ3m225C1TVPOZq0aDG6rFHj2GR9ET6vNLKD
	aQz/Hd/FSSyzEany6Lz8iSEjGHqlkXX803mtfACHSnCtMrMxvuonKgGCKpPjIqGhf7pf47yKIgV
	BMWTfxQXet8baHWBZaANmKySqB0Apl7HiZUQZxRN9NQbVj5PkxJO34EXwAsaGL8iSvLcOOLMwJK
	KjCkoLocsto6QWHSiPPQMS5XNau1U3Q4L5DjoT0UakcST2c1SskJPplyzVfcG3rWHqeeI8MH7PJ
	XyREF02AFWBVM31s437HBs0vGwMye+zWD9lskjh820jQE6vUViNo9AnSiSIIAczBXU75czBqZPh
	CHZE=
X-Google-Smtp-Source: AGHT+IHS2rKvGa9gCP2psxLJRTnJmB6/wVFaZM/rGGuYxM67yE5u+3d7j0ZDvMkMMTEbRBscJuynSvrhozqkwJ61yjs=
X-Received: by 2002:a05:7301:4549:b0:2a4:3592:cf8b with SMTP id
 5a478bee46e88-2a4add3bf38mr3906737eec.2.1763371171036; Mon, 17 Nov 2025
 01:19:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
In-Reply-To: <cover.1763370163.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 10:19:18 +0100
X-Gm-Features: AWmQ_bmie3P0Pgdg2dmVUglEqECil2eh3ipiUSEi6j4U34lH7JJMvWamiGtN6HU
Message-ID: <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 10:13=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Another alternative would be to modify the rustdoc target inside
> rust Makefile to make it dependent on htmldocs, but that would require
> more work.

Why? No, there is no need to build any htmldocs to build the Rust
documentation, so that would be wrong.

Cheers,
Miguel

Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705BD78F3E
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 03:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767930804; cv=none; b=dUTQGH6Y3sYBA8nSVY34qXm6GlCLZHGMz0n6sfQ7c1iijAlRTOf9RenjdUgS/cRCaLHuYQA1SlCOY2Ewjpc/szKgDvV1vJlO7hqD3xRXV+aXMENRLkeR9hCdyzArchKgvVWvsRaXaPN/bdufiFX9NWOumZBdyI4Ej11uP/Y67tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767930804; c=relaxed/simple;
	bh=cjzf1hezxDWR12VFZVi9i8a61PH/8bIfFWYxzgThCic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JezdFfIFI7mV5fE2uxpZiRocLj0i5F6AJS1iwChw4S95vhIXaOCMmjBLvU4immli+gUj/587xuOeThiiT+0qMMD7RuxVydq4bD+Wp5l4B+xcrxkopXVW7q5XJgJHUCJ5g/N+KCrx+Tp55DtIrjGlrH+DLjMwmlpQ0YsbCWtPH7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5oxOSI6; arc=none smtp.client-ip=209.85.215.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5oxOSI6"
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-c026e074373so1987774a12.1
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 19:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767930803; x=1768535603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+Aa2YGg7UhZCDl66L6h+JyJSb8ah/8nQF29Auvd56Q=;
        b=T5oxOSI6i2ZQqvTjeqE3fRjMGUz6yJgOosZfFTd79hRy1+BVyKctGUcnYLGAB1TUED
         G9hiqGCRxgXY4oK1MN3eVq833nEBBzJLRreIsO8yH2nXMatJXFwG49RCwB7mSZbUGL8H
         MZm8AyFQ1dG2r1/TyW87UJa0W53gYtOP82XvrPVPxMdrkZioQHo1b/3Fo6T5zH6KnVOX
         wp/TeQMNg/mDW4eTkE1gcsYzlCkrlj+1XGXyo+yLyau+7jKUwgmAmvAdW6pHyZNIfTG0
         gUhm7Z+NVLKoxZUGF/3eBLEAgCQ13oTXAeri4rDa9Y2Dtv2pFOL9ztS/DlgaIrp/wXhd
         BFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767930803; x=1768535603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+Aa2YGg7UhZCDl66L6h+JyJSb8ah/8nQF29Auvd56Q=;
        b=RscGAh0RjW8ypqkHAj2GAc9cjemy4aVC+gl52xAFk8KoI8YEWQY5V3KlMnOrrs5u0S
         nmRr/9yEEFR4kpS7wxYaO1y9hK5uSJgOC9Xhl8MqKO/qOrvWmWPqdYcISM2wCLLZqsSf
         u5SJQVXxQ3f0w85nEqDXWP0MaIRFpacO6iq8Xp3fmpVMFn+Coz6SZS5K4kfvtWuvitY8
         XUBOUWXQQ87ER7UMMCzBKAiRWy5slb+dD8oWxHinTNVsapM9+0ZMR9muLgzL0++1Oj3H
         7f56WjYKioR19OQToAyKXXHvF1yFDinBJsqZpq/Z7GpM7JvwrTGfagB3DHGQ+R8/FhDU
         XMpw==
X-Forwarded-Encrypted: i=1; AJvYcCXH7ii70tPOakxbBqWSq7V87SG+uiAV0o18dAdzfpZpdmjttSKtDZOzw2yxsLUvLkPk+XAJFREMFAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHIrJaljR90kcAqG1dGf1XFOxRQd35urlHlmix4zGqmCTJhpCy
	PiXGqMYmiQ8I/ryTFACJSpxJ2ow823hQj9HgSFDfdScOQksm0gfdOl9G
X-Gm-Gg: AY/fxX7HWr/ZCXbhOomWFsVJa68Ot7d+wNqvYs3HusoUYLVZFH1CXRuhphXUUQ3R5IZ
	gg9Lpksq6SfW8oyF9HIv9mBPB70ynJ7jzlSyF6WQBBBTKxiYdk53g/pmdm0LT9lYSdGrwldCulH
	YDhsHsQ0ohGa9POTy8aiVcCCIAJ29r92x+xnyJnl9vwgrAbXi5xHe+PRtU5LbcuYcDi7ifxYSTu
	nsU1994dY2X9l8TlSNY+qSe8MkgaK/2dogN9KZpNm8j+2c2DyWj7uzgNebn21jXC4Y2FhvNOBgJ
	j8wcKWErOl1wn+t6KM2rntF07R1lJTDU69S4tjOpMxAT/s7t0XHUiDsfncOAJ6TtvJOwYaMFKjB
	bLCsnKjt8H9dYgtPbJ+U/asXDtLrMzuNGHhhynFbq4x/tXgYUN/NOKplX+a/6P801aLryaRQPwY
	BSIK2KbOM=
X-Google-Smtp-Source: AGHT+IG3DbwcRlj4uCjp94O1bayt9ny/rytFl1TUbZvGzdohtEHLlfp1Gg9vbixfjueHNe9CAYoQWQ==
X-Received: by 2002:a05:6a21:32a5:b0:366:14ac:8c6a with SMTP id adf61e73a8af0-3898f9b549cmr8446525637.64.1767930802586;
        Thu, 08 Jan 2026 19:53:22 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd2acdsm90501745ad.89.2026.01.08.19.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 19:53:21 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 18C0643A9037; Fri, 09 Jan 2026 10:53:14 +0700 (WIB)
Date: Fri, 9 Jan 2026 10:53:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH v2 2/3] Documentation: tracing: Add PCI controller event
 documentation
Message-ID: <aWB7qtKhzbEoY8pJ@archie.me>
References: <1767929389-143957-1-git-send-email-shawn.lin@rock-chips.com>
 <1767929389-143957-3-git-send-email-shawn.lin@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tfncDExG7J/FagGI"
Content-Disposition: inline
In-Reply-To: <1767929389-143957-3-git-send-email-shawn.lin@rock-chips.com>


--tfncDExG7J/FagGI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 11:29:48AM +0800, Shawn Lin wrote:
>  Documentation/trace/events-pci-conotroller.rst | 41 ++++++++++++++++++++=
++++++

Missing toctree entry in Documentation/trace/index.rst.

> +Available Tracepoints
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +pcie_ltssm_state_transition
> +-----------------------

Please match section underline length.

> +**Example Usage**:
> +
> +    # Enable the tracepoint
> +    echo 1 > /sys/kernel/debug/tracing/events/pci/pcie_ltssm_state_trans=
ition/enable
> +
> +    # Monitor events (the following output is generated when a device is=
 linking)
> +    cat /sys/kernel/debug/tracing/trace_pipe
> +       kworker/0:0-9       [000] .....     5.600221: pcie_ltssm_state_tr=
ansition: dev: a40000000.pcie state: RCVRY_EQ2 rate: 8.0 GT/s

Wrap above example snippets in literal code block (use double colon).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--tfncDExG7J/FagGI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaWB7pQAKCRD2uYlJVVFO
o5mFAP9FeIBElbvGhzGEGTxXvKkxEhBsgv2Q43GHm7uX5DykmwD+J0p7viA36u/v
No484hOhG6lBW2aezEIzjzxuZ2BVBg0=
=UMJa
-----END PGP SIGNATURE-----

--tfncDExG7J/FagGI--

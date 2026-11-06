Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793926047;
	b=lrpr76zBExMIz2qetasbohEcce/xIJrKipa3VR9O2KOFykusFHxY2E7/T6aYuS9OhGcD
	 NTFwKyWzKBj21MaJc6qynX/9Hatyi5MvdNAUPjgVY1XMDrsphFL83PbE4CHKUZplB5jql
	 J0l1fYpU277tzuG99alGxIPKjQ9QgnkVqUyJuTjMgmSbSD7eEYMzZqyOAAL6Va+aaS2N0
	 iXGvWoF1EE3HlovDUtJOAsNMrg11ghFshUiQ+T7PQq4iHDo9urwu3cP/iyL3W3rUUtyo/
	 mUsJc5b0q8XTzeMMCAimwT3Wvc95NHybgCKIh0HF4senExhBjzGxZRYKvRnYN6r2L0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793926047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
	b=xnO8S4dLikHGqdnEdZUH/9QFteRPuYSrjbg+rVT4jkUGTbwG98ImplhjOWSjjZTsNgkG
	 oauwDk8S24AkxO3+7DAb0XHBI50vHPbdIZfBhev9A2yqyduvLChrawd4UUfIgpB0f3ONc
	 8XgbJGa5/hgHlQlKJZmSL/n+oAVbi3XuLZYvE76pkZN0wUI0mKFrcFZiJnNTPARfhQw43
	 g7OJk7WwWjnXMfVatxUswj4N9/9ZfpIhLlZww9S6tc33nDuO20JfB+EWd4tBbaKep6nlY
	 VZfNME7e4A2QvP0gik4sToQbgyVdwcPjBeZ1xbOZ4r4E8Lctdy3MpplrzDNHb8KpGpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIecB4O4;
	arc=fail smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3531606A328
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3531606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LIecB4O4
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4550d8ab15so12259966b.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:47:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793926045; cv=none;
        d=google.com; s=arc-20260327;
        b=TrStinf+/3u7wd1F2Dq9SiS7xWzGxukt/K6V4yzPNgDzOgqqRluVSRF9rSPrvUnEVP
         AhadbB6WujEgGTIyxXrzUa9aLe3kB4S4JxY1eeTt9qu46DcUJWlXETFyMfMmeRVNwpGZ
         pvZTTl0A/Hp4IYXuT8Pk+7D9l4bgKUrCWkrCWkJTze8zaqgAoy3QK7z3c2mIX2J9CeFa
         9Q6LVnDPG394XP9zJN14klnAsQ2ppStE4HjgMyGzv3X1Sg6t+HTAgLzytm3VH94LAkzm
         UAIls9P6t3RrUrTC9TPqM9IVd6UNR3hFUNlhIFDfwGNdd7ZD8Xtb2TbJUUSvLgGu8aV+
         +XAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
        fh=j0c9kGNuF6oZGZjyfMy/04XtLyg/bLSc7ddlxoaFkMQ=;
        b=WTdNMl06qyUK0xk12GZPlT5T6i1xONp6HDcR6tH9YrFkuuJu2JYUKIWmB2eqRi+xgi
         nI8iPVmjgmymoDbefJNkA05SkgqcDd0YY8/5mYzdECet+WflVTlzwUWkWsXx+8KXSEWS
         sVfE0nA/AkQRzLry0t6oWidETWMpPRh4MmWJI/ADC2554aNT7HnDI12jKTblgcxQepu4
         iYsIghkGWEQGKdpLnjfTuvMMTXlYGcfggzGEa+G+w4TF0RfCjufQgxMmgRvNYmXGrpi6
         llouFCTHthp+A6O0810PZBflX0k0BcHZITP/QBs7/bgD2oasFpnOokdLF/u/umD/tBKX
         90/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793926045; x=1794530845; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
        b=LIecB4O4eRRofJzvG/tvhMmXYhpZUwPA4yerXfp7rVc7X2Gph9Vwlg1fKJRDBKiB+v
         bltFvkuSutP6NUJPujTY5Bf2qJxUuEvSIgLScLc6MmNyVYsK0a6XL9RBW2VEsy1hEl5w
         CyIlaoFv8GE3hhFrtCjbc5hWdtrudTSiVyvj2rds73tGX6xu3JT3gEqXsyZjIDw9psiY
         d5xo/cIn9UVGc0m9QgIeIyr8x4yTrp4HJba1n5Q/KJvI+79CbDI2BTutZtBCHxbBKdx7
         UxPa+C9LgG/ePsIOotML/nbEWEIqiiTCiHWORP5/pit0E2bmtumqXTxbeEfSF4oa/Zrl
         TErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793926045; x=1794530845;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q/Pn/3oT6XlOFb2SsTcDdo2UH2iFiBAGJC3TZJWHkxg=;
        b=Zp9ZOhFTQ3fySRXcGRP1NrVf64QvEnVtmhr7c7O13/Dmj6HWqbczkS/wF1Cyo7x3eC
         vOGuWs9JyWfPvwDDwOsvrEynsnk7MGwkTO41qMPwd5d+g4F2TWBiBjxFEtBwLmWmCGTm
         fZRkFx1189xdfTuZxcxDtpDfYQ/xs5J6v597+h2u5XxRJazzZQRCcwXtDZOhl4PFsKV7
         fExIsiwHXwgoNn8fijgAHoFYmOgj/N50MSc8QCTUM9isUqyFWWnHT1j9j9PjKII7GNr1
         N7ugXg3BfSpNsEiLcURbB1aYg5mRMhtejf6y1loMOBfq6m39z77VHp3N2uHwCBcIR6rH
         rp/w==
X-Forwarded-Encrypted: i=1; AKwUvByY/phuXBD1yDONSXbjjDOeTiu6dpR8ktxX4Ff8TUiBVwybeZrgIvZRQkThyb5G9Zg3iSR2abSwCqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+84O2XTAHg2r8zg6QuzO0JZeuL39Nexv59CJO8znY+jRhuGif
	ADnPNkwguNPPC8WNTwMEHHEV1VxFB1uL6jAbXTIaAG7kDZeVwAk6wrhxNeiog5vffeucX9XbL2V
	oEE0x7nSwPkC8o/8ZjvY8zed8jhXOMAgdeoHBhs3W
X-Gm-Gg: AYBFou0CG/MdCqdwp2rN9SgKKZY6hzKtVzbFSyLsmjUsQ+IvX3duAuY6/cPlInQrvsB
	10M/hkV4LkwqqrqvLNoWs5tMdTeJteEstqPS5F5wd3Z7opXvAz2xiQOnDt+E03oQ8ExNePEAfOd
	FJYgPS62jPm0MjFZPff+Hcjt27TlpKCJ2jteG9z4IL5rChazkY8oot8Is46997eoPuecLTvR1EE
	ip79AcUcoGvZ88EB4/pTu/LTeOKdaVP6xbjXndM9bnoffWlheAKbESnfQVQJyLx/vzx1vfnMDIV
	AV6pL1wCZ3pOoucjoNW51fdpnl77FwQS3vBIjV19sneGui7BOefpBd2uo+hUOiRVZJ+8QNTcD3y
	SzvIvapH1LT0JwZrVDNvZ3+nSuEbC6e4TtuGjvg==
X-Received: by 2002:a17:907:8687:b0:c48:a838:c16d with SMTP id
 a640c23a62f3a-c4d34c333bdmr88685166b.30.1793926044754; Thu, 05 Nov 2026
 16:47:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106004218.604799-1-dmatlack@google.com>
In-Reply-To: <20261106004218.604799-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Nov 2026 16:46:58 -0800
X-Gm-Features: AclHuK-6t-LHK5FESHi0261vrVlL_qd-J_ZV2n6hQwmFkPQFVA0JTaSgUA12BTs
Message-ID: <CALzav=dOnBUdYKN8ucD8tMF_5RuQZOzYG2aW=K9Grd5itgvnMw@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] PCI: Index saved capability state by
 configuration space offset
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Cc: Alexander Graf <graf@amazon.com>, Alex Williamson <alex@shazbot.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>, 
	"Oliver O'Halloran" <oohall@gmail.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:42=E2=80=AFPM David Matlack <dmatlack@google.com> =
wrote:

> Merge Plan
> ----------
>
> This series applies on top of v10 of the PCI core support for Live
> Update series [2], which is targeting Linux 7.5. This series is
> targeting Linux 7.5 as well.
>
> Both series will be merged through liveupdate.git, matching the
> agreed-upon tree in the MAINTAINERS entry for PCI LIVE UPDATE.

Apologies, an update I made here got lost. The PCI core support for
Live Update is targeting 7.5, via liveupdate.git. _This_ series should
probably target 7.6. I doubt we can get reviews in time for 7.5. And
as for which tree, I am not sure. This series is mostly PCI core
changes, so I lean towards merging through the PCI tree. Only the last
commit touches drivers/pci/liveupdate.c.

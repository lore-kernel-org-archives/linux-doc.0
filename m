Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794149898;
	b=b34Eigj0R9Z7a7xbSsbxzDQ0aqJg0aQWyDdQR5s24unzEZMbvp8pnzsqdjY2gCRVtOqu
	 zqPEacNL/zoRYN714S0rD4CfyQQv4iWQZFxHtHxuU2bZafFRDqJXRs2RG7iYZTwBm3NcH
	 KQYTTehlJbW9GWHROqm+U7jWH9WZTidBH3BjaryWw/p5ltz43kPmwGunCmdutFljJmbt+
	 jy+4oBJ5vyEvioKYwigMfX/kykl9chupKobyAFdo15ohaLfNmPVjFDfMuQBzMDJ2aQ6LW
	 RBOwKuKR5dvInDmceBaxc63N+O7e0whwcGe+hc9tPB2z1OQe5zLqQ2QfDJjrudyu6xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794149898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=zg9wHbUjOFQvCSSXrqJHlgr9ERwDV2A9O9zK2C7wcfk=;
	b=0qo/SO41W1+4z+/LZptK8AFCDSZx0s+/a1vr2yEeNuEwDib346/sIHhK5TajEwpxYpCT
	 r76yV8HksVFIXhDRgHPNeWwWXJ1HJQHLdBODDpRBxf7ZLXV0UQtaHPebditg1sx18pe35
	 e/2TI9h+3huGa0AX43sMPeLgFJrW8qpe/9rsVS2Y7n/JocuDGiFV3emJLPJJjTkzyW+Ov
	 P6a9SnLfmQD1xw/KBWr/bDRkc8md8owrC4+yZ48lAYL+p4HUXI0mw73fG/nS8ElByZtfT
	 RU7qkFDFO+rwVlbhpjG0RLexmtbA9cVsEPop0Pkm96zotNjN3luUeMSxStYNWpcZooA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HcS6u0uI;
	arc=none smtp.remote-ip=209.85.221.173
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77462606A321
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 14:58:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77462606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=HcS6u0uI
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5ecde8e8e5bso26660e0c.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 06:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794149897; x=1794754697; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zg9wHbUjOFQvCSSXrqJHlgr9ERwDV2A9O9zK2C7wcfk=;
        b=HcS6u0uIhoh9TG5kUk7m09X0xPU9+Mwuv4H0pil3okKllS/JbNjw4JddmRd+KNy6rK
         6/COhsGqCao54mkTwsKK9Ew5gFfF4mCvIs0G8yLupXu0KtnG7vtUNEJp65CeqdORuhNu
         xJR331SS16VS9Nr70KyGExUhIgkJdTDg2mv3rPNv8YPtv5LTEA5Oww/EwRNez94dNV1i
         VT+kz2lxNqcPAokFzLoY+z9Z8PT4grgBIBs8Qop942/G+pKgSlh2DBBqO04vESPqMOGg
         6twqXRKFO7dIFS7uVkg0bMCoeA4K5RTedfCOEglxORHoK95jl1CnL6qcUj7o6i0nYNO9
         6kXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794149897; x=1794754697;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zg9wHbUjOFQvCSSXrqJHlgr9ERwDV2A9O9zK2C7wcfk=;
        b=j3LaSXrXG9c67kOrR3hu+8UFPbgj6rVCi++QxKw3k/4bUkH399allB7nL503R4XMlP
         1TH0SuXnM/27u54S+QVeuaYAEUUJrTVXLjaEpJFbc99GSKka5cDcIiQRYQK9jf3AzUoG
         V7DqhqRueBul9BDQh/kyWzFWs0zpB8n1yfoIFY2Bq1UGfFD4Iqp1yJxvmmFm30p9CT1t
         i0ZTSnuKw43FzQu/oQxV7KhJzm1buD7kyH39nflBEppp2HLxXBhtRTSFof8gws5w4SKM
         fwaU0mzrLvgTQR9hjnWmi/SD308HYaqnC3SG4TEXJqWloCaMqPGH6LWYZVEbtlfYHsnk
         OfRw==
X-Forwarded-Encrypted: i=1; AL+hErGWuCzM9IX+LHDF/8Lj7Z/NJSSpmpbt3KuAuQn2fQUZOkWkH3Ja12y+SIpD0qEMCHDlpKNwV7MDtDE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ecLYnvNCFQFkQ2hBC+YxucIjOZtE+5exnsnXUutehpbRA6Gry
	s43Orz5eNkeV2RbmAhWnRolvUL0/4siWKNnUQT3GpoOpS20y4p2PpKn+iBR3sg33+KY=
X-Gm-Gg: AYBFou3E3sx6ZMZqp1y0G5DqOakML3jM5yLFqkiPcak9v1l2wT5/DfjEzcgrtIzbY9q
	kvU3LPd2QuWBfsvNgjwsr3oQAgs4qd2AspEjKv52BP9SVR6lKpTKjRVaTc6E7yl3BChnwLQiKri
	gguxHW24fxGPDi0ApRqOt3ZSdqy04RHyFOo6QbDHJXfNP/+Brk8QSyCoy9t0nI2C4JOi5Yq7TN9
	52CX933qBkf+ryUME0By8eoqunQ4x/9LYhb/3H1+Yp4ogHQtMGOiklph/8hJLpTjv3xkt9spLkA
	VLQLpouUVqMBJgWVNLVvkQPZytSBgiCY0chtnDRfrhXj9gnEEdWJ8+7nZMHxO9tUbQQQmOhBGxK
	+jiKxDhdBxhZUeiKC7MA0fEe8oU1icIUmiZpZSIfmibjPdOAjr+3aZo4K+QdDWBCny7CqDiYoBZ
	jpOHfOWtfV8svmsvs2qEBH8gtZDe6yr8bnfmkuzXeLeRV5Ibt0di/VTyPJ3K0xYZud2m9Om61bu
	Nsl7MpSCvL1pRRmuIkHrCyqXfm36wLNvWq5Hhp7acb4/HMKocdY7bqfyMG5EPQRFaiM8K61smnz
	J4KUtz5Cxp1W75JUDrnI5wpP12poDoY3OtIoFVOw9f9m3sBDgCd3FNotsAKO+3ynLT3wzUhyKUd
	xfq6uTksCHWRLpyLqKgvupB40gM5Lqh8=
X-Received: by 2002:a05:6102:511e:b0:7d2:cdd6:6be with SMTP id ada2fe7eead31-7d2db193714mr282127137.21.1794149897376;
        Sun, 08 Nov 2026 06:58:17 -0800 (PST)
Received: from localhost (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c02a108d6sm1838855241.7.2026.11.08.06.58.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 06:58:16 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 09:58:14 -0500
Message-Id: <DMPX235ZQEHC.379KOADR3QVFU@soleen.com>
Cc: "Alexander Graf" <graf@amazon.com>, "Alex Williamson"
 <alex@shazbot.org>, "Bjorn Helgaas" <bhelgaas@google.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, "Jonathan Corbet" <corbet@lwn.net>, "Josh
 Hilke" <jrhilke@google.com>, "Lukas Wunner" <lukas@wunner.de>, "Mahesh J
 Salgaonkar" <mahesh@linux.ibm.com>, "Mike Rapoport" <rppt@kernel.org>,
 "Oliver O'Halloran" <oohall@gmail.com>, "Pasha Tatashin"
 <pasha.tatashin@soleen.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Vipin Sharma"
 <vipinsh@google.com>
Subject: Re: [PATCH v2 00/17] PCI: Index saved capability state by
 configuration space offset
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "David Matlack" <dmatlack@google.com>, <kexec@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <linux-pci@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261106004218.604799-1-dmatlack@google.com>
 <CALzav=dOnBUdYKN8ucD8tMF_5RuQZOzYG2aW=K9Grd5itgvnMw@mail.gmail.com>
In-Reply-To: <CALzav=dOnBUdYKN8ucD8tMF_5RuQZOzYG2aW=K9Grd5itgvnMw@mail.gmail.com>

On Thu Nov 5, 2026 at 7:46 PM EST, David Matlack wrote:
> On Thu, Nov 5, 2026 at 4:42=E2=80=AFPM David Matlack <dmatlack@google.com=
> wrote:
>
>> Merge Plan
>> ----------
>>
>> This series applies on top of v10 of the PCI core support for Live
>> Update series [2], which is targeting Linux 7.5. This series is
>> targeting Linux 7.5 as well.
>>
>> Both series will be merged through liveupdate.git, matching the
>> agreed-upon tree in the MAINTAINERS entry for PCI LIVE UPDATE.
>
> Apologies, an update I made here got lost. The PCI core support for
> Live Update is targeting 7.5, via liveupdate.git. _This_ series should
> probably target 7.6. I doubt we can get reviews in time for 7.5. And
> as for which tree, I am not sure. This series is mostly PCI core
> changes, so I lean towards merging through the PCI tree. Only the last
> commit touches drivers/pci/liveupdate.c.

I looked through this series. Even though it is motivated by Live=20
Update, it is primarily a refactoring of how the PCI core saves and=20
restores capability state (to make struct pci_saved_state compatible=20
with Live Update), so it should go through the PCI tree rather than=20
liveupdate.git. Only two patches (12 and 17) touch=20
drivers/pci/liveupdate.c, and we can Ack those.

Let's get the current v10 PCI core LU series landed in first; after=20
that, this series can apply against 7.X-rc1 so the PCI tree can cleanly=20
pick it up.

--=20
Pasha


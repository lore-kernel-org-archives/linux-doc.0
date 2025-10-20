Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31628695
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961029; cv=none; b=uRrUVqy0c/cgU1bSjri/V7iqGbpTAhBMsZcYn0XL9yuMGgapvU8tyCI+uk/ZuNFLL9PDVenygZSKLxaf4PsTGPq6fya8biCaw2H5qyCX6Ku+454zL5IQBbXNevQL7QSLAjA520wR7chxJsPsQ//uWCOWNlNr0R3xivXX0PMiKYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961029; c=relaxed/simple;
	bh=3Ib3zrr/tPmm6C+NhCIYGI9GLz3/YlX3IpNvy/WsbBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvR0DkYNOLwrXQZIKRemk+sBElGI1cVjPw4Z4UkJaGx3h/Iyxr4Ciknm8bSiq2jy0Dylu8Se7xVD/+fCPnV4Wpubr8Wm6ITULY573xF2AVaCDWJ5vaWHO0RSYvK9GUsECQmYQdRilHgKNkHylUpyQa3AqCHluJiQCTxWLVr5awI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3Q8Fmiw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3Q8Fmiw"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e9d633b78so68086266b.1
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 04:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760961026; x=1761565826; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3Ib3zrr/tPmm6C+NhCIYGI9GLz3/YlX3IpNvy/WsbBw=;
        b=D3Q8FmiwZInTYZCNZ1U12ur50ed8ev7+xzgz0oSlfPRYDYt+iqQpVAcelpSnWzKXhY
         mc84dPtZSk5q4YPHvst/8GYW1R1Fqz++FYc81xOs3+4o6XZRgdrHKqBc38hcperdMOhM
         BNi2OmHzGRQ/CvywgZWFgnsmWPJ1zco+44sS4w6YYkVxw6P6XJlwSFAIcHj6jZsz3ku4
         QxWRbDL6dYs65cfl2du8Brrd8nBagE8+IonYB8qpYmAh2ZcMjZutr+3CumMTv+eNKs+a
         +zzm7BaRVeaf+rC/WSedHAO2QskhIHw1rKQm4ET4jXBhOUNrGEe+AA/u97YqAoE69vqh
         XCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961026; x=1761565826;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Ib3zrr/tPmm6C+NhCIYGI9GLz3/YlX3IpNvy/WsbBw=;
        b=TkeDY6+1BgygWO76SzEhl90jYSzzz+FY/YgyDtZBep+k9hJxtzGRj8gBgpZWkait/k
         Z85GAAw6tL/HFhC/vldocS/bHriJbEBmZSnPDyS9zN94N6lhDOmhnTHNYdKFheZoo5y+
         U/qnuIAdwx89GazzF+lKCsY7XIFsFjeGUg7gqK0beZ1YQsU20NJFwrGnqs26rwwjpALA
         JH2iwVyMRVj3NhGxaI5iC6cbZMNS6sdhk6Lhvq6N7Qh5LvOWrB8hTiPxHSJrUtKbhsx5
         fM1uKtSNA+vjTU2Cez5fzm4QOZXOYwqsYHXDb4Y60Zx+3aYnYJRdViO5D8cIZCxgik2o
         mwwg==
X-Forwarded-Encrypted: i=1; AJvYcCVJNol3oftQM41kgRZE5v6wtn8yaeSZDRTDUyBaip9BaFA4OpHCrfjcXFaNSFLZSN+hAKizL+WXqmc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy57ToF0v+IW4XXyF3bAkoiWaR3kkqy5t9ByjBr/oPTVZpR6OPn
	ZBQPL7e1IFLISU3GjKMC3pN1NpCBKN6I6rosvR1pBBsr/BPCHNyhS3RCJ+sefOyHXXrLcptj2AS
	Kk+pVZyOJm1L0gyouYlWlPMYkTR2f4g==
X-Gm-Gg: ASbGncsGseMwLswZB/UofcKw1o37MXyes/3AGa+d1ubpqHrP4jEgr/x1zCSGJrDH1vb
	G4w14mrVo8xIlfDpQh5266zMvhhamrd+NESNMkhNRfE23BvrKMko+pf3d08rB37XExLJbWbHVbQ
	1Ub6P1SsdV9fzI/Tb3tQ2GXiQBuATGuu+2AARXpKrpgeY0HysT3J4LRsRlDtewQtlLML9ApYJyb
	/ZyLPEO9yLxLKNu7cou6+eSnUL/YoyQfRhJ6pY23jy5TrDkbxCw19P7zpMwkucNBhWX
X-Google-Smtp-Source: AGHT+IHpqrZ2dPIwhNgY2sr456DoKSrudoQCSOVCHp2/+Yamq4lGHHP853dkoUAlwu2plIGKzBU9GigR01lDOFEXyUk=
X-Received: by 2002:a17:907:c00d:b0:b2e:7614:d92d with SMTP id
 a640c23a62f3a-b604e6d11acmr1848895866b.0.1760961025902; Mon, 20 Oct 2025
 04:50:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016103609.33897-2-bagasdotme@gmail.com> <aa388d29-b83b-454e-a686-638c80c6a7bf@infradead.org>
In-Reply-To: <aa388d29-b83b-454e-a686-638c80c6a7bf@infradead.org>
From: =?UTF-8?B?VG9tw6HFoSBNdWRydcWIa2E=?= <tomas.mudrunka@gmail.com>
Date: Mon, 20 Oct 2025 13:50:14 +0200
X-Gm-Features: AS18NWA3E0Ss9-ztf94LkzgiKtO5TbAFbLXh7zu0w6jJDo6kFqwu4lbvMiqUEHM
Message-ID: <CAH2-hc+XQR7v9Z28yH_CTWZ4ieaF5eQFKBVut1idULP=4w03fQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: sysrq: Rewrite /proc/sysrq-trigger usage
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux Serial <linux-serial@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Cengiz Can <cengiz@kernel.wtf>, Jiri Slaby <jirislaby@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?Anselm_Sch=C3=BCler?= <mail@anselmschueler.com>
Content-Type: text/plain; charset="UTF-8"

> I am still OK with removing the 2 "However" lines. We don't typically
> document or provide warnings for how the code might be changed in the
> future. If someone modifies this code and the documentation needs to be
> updated, it should be updated at that time.
>
> --
> ~Randy

Problem here is, that you cannot really modify the code without warning
users in advance. This is the warning.

Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F286617555
	for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 21:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773522082; cv=none; b=U0YgMvTs543RUql5EvAKAAlVKt1JFNiEgTyx7o+kO7VO78Fum/RSj1t1hxi/rk6+GtCTEuW86zvg1jwNtbknZrl7cCBjgZeV/HDDMhqq2Snhfl0gtMej4uwpMC2MLhEojQKjX7YJ1wRwBmYiDmDVYJd8W5Dc+w50mAyQH/nNJTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773522082; c=relaxed/simple;
	bh=8lF3HJa7/LViE96rk5TGf3Vk6ty3wq7zDxfe9Ma3Oi8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mzGdlPRSSyf4+lAlkPGUDLSUwjj4QlvOPv+0bp6BtMC1K4Y067hjTgRduYBQshb35SQV4MC8qBC2S6y43GXUL1+qYaZdQM2QN/OQbWGrX2RnG8IOSzrlmyTSkz+q6I7EpJP36WlJzM/KJZnodCQMI1Wkkz0310ybTN2PvffdVXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fuppvLlX; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fuppvLlX"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64ca09f2056so2539151d50.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Mar 2026 14:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773522080; x=1774126880; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m+zGRoENMrbo8et3bFP/gCtlGLikevvEj47JRHD6z8Q=;
        b=fuppvLlX3f/udfW/liA893qUxCkNEQOvkhX6ZFzl2Ki7/UIZxM42YPXI8LFxZPk5B7
         KxpyBj0nVhZJ7vlwG/rzQnhh5tAkT7P+o9rW06v5DVdL2fmSLwcgHCbakukItnmyH/qE
         grxANtoN1/64j16ZhBz5bamF8PYpM1xRNp5FHaPrU6SeMFILhcDiVtTrWA8dKVxB1EMB
         3ik8A9ft/r4TB7MBHc0bsyXK7WVcB2nGQrPyEfD3rrHcYZxsJPMqX5FQvZ7HthINceqr
         uxCAIFirpBA/JC8QDlI9TWsDRRAbq8GDtlSxX7/AX6o8Hi4e214jbu1D2XDh5piMVIZh
         9hzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773522080; x=1774126880;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+zGRoENMrbo8et3bFP/gCtlGLikevvEj47JRHD6z8Q=;
        b=luZ/VodI9t72xSB74w4a4KzDsLi39gRWX0VzJhYuxTcGZD/90y40bqBUHZLz/eHMju
         RFOVn9L2jwsDyG+YmP+FMEZQSRA/kP5VvVFh61AcABBsHgR9PROmqJTwpeoFIAF7pov5
         0jZIeq0YG6eWL7i71r1xsz8LYpmLWe5gXzH50nDaNy3Y7pYxYE7z5ySQi8nF5ALvDY5v
         4Iqm3SiD07dxdzN99cbw/4zzR+FQfuRAQEQJvgjJmzD5wqLejo/CSmslk2Hq/oRYJgFe
         Ua0i1pVW4tFtNwEka7adW5U0yODEgZh4tCFaWnKRP/t/6vpSm1MHj6DM57v3vGWkMXyu
         HLBA==
X-Forwarded-Encrypted: i=1; AJvYcCVQRODr86Truli9a9iPgIJrT1IbGVUBdvVUaxXmg7J76xpJ+rAZaTazDR/vMaFEDM2LUBXyuGaKkDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YynwpWyORfgWKMoXXXeN0/RN2UgcAzApJms6ZvcUhQrNBkWDev8
	BNdBhoR5oN0j23wVx5uObOCrTpGuTwaGSTnERWShiJC8JRWCYFt43bPReohqHn5kFQ==
X-Gm-Gg: ATEYQzwkx8pjb/zWxL+xwe31H24Rza0hGF+5It9uQqGxvYlapfqg8dhf+XCIhj8Q19Q
	AxDyhvne0pOWCPRuEGtRGk4wqLVYsRe27wWJkJ6qtI0rsPmsYR/s9i1BXNepkMFLKYNRibHE7wN
	y/f15VYHeSM4kSmvQbRt+OOt6I+5DVJazlGYrJriS/ItXXUcEAMDt4F4B2SHKDOcw7QYSKw61Ne
	ndwPMNSB6i4vbz03Jt1/SyAb4Sh4L8X+OtNHCPUXydJRR0ZeQk7mz12XidXCXIuzMk/AnUKlGGm
	43mqgFFp08goDA3/0lKm579uhVBjYC2mRwqq5jUhO9jb5coSqubGusdsnBcDAE7q0xaFYWQBlof
	7ij2Y+SBpZ0yExhnk90eF7Amd6ThPE9kTL6aim6QrNBhelkUeWg/VcRV1KVfmVDcdgjRYIEnLkW
	CWpr3GljHmx19jPLTlyZszPUKmgREcr9F0vRDE69ZAuufTeMq8utfVD4p6/2HjzUnWezC7hgyEM
	FKdiuc1jw==
X-Received: by 2002:a05:690e:1c19:b0:64c:f53b:d3d9 with SMTP id 956f58d0204a3-64e630957a4mr8568179d50.75.1773522079573;
        Sat, 14 Mar 2026 14:01:19 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a51580sm3183232d50.8.2026.03.14.14.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:01:18 -0700 (PDT)
Date: Sat, 14 Mar 2026 14:01:07 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Kit Dallege <xaum.io@gmail.com>
cc: Andrew Morton <akpm@linux-foundation.org>, 
    Jonathan Corbet <corbet@lwn.net>, david@kernel.org, linux-mm@kvack.org, 
    linux-doc@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>
Subject: Re: [PATCH] Docs/mm: document Shared Memory Filesystem
In-Reply-To: <CAAZVx9_6ecePCB1MMRa0q8V4afa=zRSmcaiozaFPDrrK-+bv5w@mail.gmail.com>
Message-ID: <b4203018-78a1-2e24-fa65-b02553abcea3@google.com>
References: <20260314152538.100593-1-xaum.io@gmail.com> <87ms0ajtvy.fsf@trenco.lwn.net> <CAAZVx98Sz1MknCcMpQXxeGpUjXBDyz+0KyRuUiCXsM+3qzqpeA@mail.gmail.com> <20260314111757.2a17c3acce8c3a1eb68ed209@linux-foundation.org>
 <CAAZVx9_6ecePCB1MMRa0q8V4afa=zRSmcaiozaFPDrrK-+bv5w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463770367-168415370-1773522078=:29478"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463770367-168415370-1773522078=:29478
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sat, 14 Mar 2026, Kit Dallege wrote:

> Hi Andrew,
>=20
> Thanks for the positive feedback. I'll add the Assisted-by tag in v2.
>=20
> To clarify =E2=80=94 I used Gorman's book as a reference for understandin=
g the
> subsystem structure, not as a source to copy from. The documentation was
> written by reading the current source code and verified against it. I
> didn't contact Mel beforehand but the book outline was only used to
> identify which topics each stub file should cover.
>=20
> Happy to have the relevant MM developers review each patch. Should I
> resend the series with the Assisted-by tags, or wait for further
> feedback first?
>=20
> Thanks,
> Kit

And now the negative feedback: thanks, but NAK to this particular patch.

Documentation/mm/shmfs.rst? I hadn't realized that such a file existed.

tmpfs has been known as tmpfs since 2.4.4 (but a few people do still say
shmfs, and I'd agree with them that shmfs would have been a better name).

Please send a patch, either to delete shmfs.rst and its index entry,
or to redirect its readers to

Documentation/filesystems/tmpfs.rst

I haven't looked up the preferred way to redirect in Documentation:
I expect Jon or Claude can assist you with that :-)

Hugh
---1463770367-168415370-1773522078=:29478--

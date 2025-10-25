Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7492C0F83
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 06:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761373447; cv=none; b=HT4GVbBtdrI7WVQhiJY0jJ0J8qv0YUMxoL/LN0BXrzfcAXc+ExRiuFsdvCYOIIm2CgtbWKnjW/4WV4+t88xQnK43BprMPA0ludYdq883CPI5gwLG5R3Er5616NibM6JnHhtZc9XVbd+rPaXMl3AOaW32epfd/E3yvSmHkjt85bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761373447; c=relaxed/simple;
	bh=FMw0+LtxF1XFnxeM6wfrdoWVKBhlpw1rYFoS6IMYePo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opVdpbL4awnJgHlqxGju82n0vhZxeuY/J7IeOvB0QKxK5WPCACyNahX4iNpYOocYruB+Osv6VANtPTJLsV2Y1rHSpWxwfJT4X9a2ZS0DUuX58lT0pyKFVz+0REZ+VGo+/xm3KgZIfHoMSkpkTX0CfVyDcryvMHUk1l0Sp82Tx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XNzcWh2b; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XNzcWh2b"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-26a0a694ea8so20637545ad.3
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 23:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761373445; x=1761978245; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Uyn+lqnfj+DF2Mnswe7yP+PmxmYmbtnyxPSWDdj2IYQ=;
        b=XNzcWh2bsHRhXIg5xNeAIKsJqhwchKF8+WPtWD5qzgB821m367N5VOXqOYeVdByUsT
         f21ry8atQ2Z/BMPzisV1yEM5pma5LujBytxUM1X1Nnvn2NWepzUUnP/X6YCAiZ4viYa7
         4ou9prwSwJLccbf3JmbYhKaGuEgiKeW45whAy1pSpbtXjxRnXMnxOzuk/QH7rwypRupH
         tqp2FvRl7v5fP1cmXi+Zt6EzSsTmSRAzSgkP9HZ7mNjHQ0fm0W8e9dl07UdmM6LF5r19
         ld+/wDwtZDehK7hQPL6Ig6kulgA5qKcZUUk2Q8+7Gmzweh0qV+7xgz8/NX//HwwKaHq8
         H3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761373445; x=1761978245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Uyn+lqnfj+DF2Mnswe7yP+PmxmYmbtnyxPSWDdj2IYQ=;
        b=ud99QYegfzIjXx6zYXN549ZcADvZurlE5OOX1BOsSDtMM7yey1pqzQKLSPem+OIL/I
         Bmeh1dUG/KZRVsx4wEtYCyLa3L6Cgha2l6FyH+z6UAgxfmoSxoT+32IdPx4S4jhCxnu2
         5++Nm1Dt1aFFQiC1NEZP20cAf2fdBGBu2umgtGuvJFMnN49TZcBEF1egPl6nYdHtMajf
         1PEjSSUq9EBJVs3AIhiSNtZovwg/olF/7H/sr/5C39+qIKpcKujBpremge3W3PhzaxMk
         qnGd+IaAX1y6BhFVF/k9ctnAmMrThefxBT2cQCyoKBr3DfdLUNPOedgHq1SsAbIUBpxA
         yltw==
X-Forwarded-Encrypted: i=1; AJvYcCV3Cf4w2Jv+MPu5BFfzn+iOANSF/+ubR9gkEXgIgayD6aF3rgn4J8Qp5jFWhykeIHTRKrDrC9l6zwo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkII1hGwQMFPhF9DL+hgVfdI+E3B93U3QLa2esae44OkDc53xq
	yWqFYvNfKJUP6g65+Aq8pnCLhv+Q/buwV3MmMVVZ8zMovLR475UUPW/n
X-Gm-Gg: ASbGncufTktA6dJLVU58BCn1ndywRC6T5AncJ7W9nl5OnjE2scr3u3SaAUf91jZCw8E
	ara8FkvFGwkJ7nB31v0PVxV+b3YthsZ82LUgGuLC1B3bTZkFeerkq8IPfkdtDUvuMoCOAELCmEI
	BolNoNrPgsRwNFgoqsjKuItc93F64vc6VqtAVxsf8X/tww4bbznHY/c8V4KFIs9eNLAFvRYaROY
	byKfrdpxN2BS741H+pHcCJTBKKnAYlYTMSRdRrPhzEBVllF07u4Wopz4kJdUsA/sjjnS7lSnC2G
	pzScilCLxZZUP2VSfgjATeyJ0+7qmNGSdo24SAOO6eDi1BteywaeVpcpqRtwWRKCS6oipBv8E4E
	eojXxBnVmghvo46427lVUXlwnCggyFFcVtIvPzh/KvwqsxL+4fPhhmMtSTjulm6YP+UAmHOwBqP
	/rDcBs9aNIqAbuoI+9X2IaVTfQX1MkrUQbx2tswgqOEwnXjx3nD1rnh5s6
X-Google-Smtp-Source: AGHT+IHplQPVfCIQoY8PHDd3B2J4jw0QISC8FZ6gWYBjJGGEKcAtDwmwgPaM4vZb11xkzDseTqP+IA==
X-Received: by 2002:a17:903:249:b0:25c:8005:3efb with SMTP id d9443c01a7336-290cba423a6mr366592795ad.54.1761373445251;
        Fri, 24 Oct 2025 23:24:05 -0700 (PDT)
Received: from ?IPv6:2401:4900:88f6:d7b0:443:a828:b6ba:688d? ([2401:4900:88f6:d7b0:443:a828:b6ba:688d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498e42ea7sm12204175ad.101.2025.10.24.23.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 23:24:03 -0700 (PDT)
Message-ID: <81e6af8eea5b0399d1685797d0ea6a6ebc273270.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
From: ally heev <allyheev@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn	
 <lukas.bulwahn@gmail.com>, Joe Perches <joe@perches.com>, Jonathan Corbet	
 <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>,
 workflows@vger.kernel.org, 	linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Hunter	 <david.hunter.linux@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,  Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm	
 <linux-pm@vger.kernel.org>, dan.j.williams@intel.com
Date: Sat, 25 Oct 2025 11:53:56 +0530
In-Reply-To: <aPvAm1E7CvQfOIuS@stanley.mountain>
References: 
	<20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
	 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
	 <aPvAm1E7CvQfOIuS@stanley.mountain>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-10-24 at 21:08 +0300, Dan Carpenter wrote:
> On Fri, Oct 24, 2025 at 10:59:16PM +0530, Ally Heev wrote:
> > pointers with __free attribute initialized to NULL
> > pose potential cleanup issues [1] when a function uses
> > interdependent variables with cleanup attributes
> >=20
> > Link: https://docs.kernel.org/core-api/cleanup.html [1]
> > Link: https://lore.kernel.org/all/68f7b830ec21a_10e910070@dwillia2-mobl=
4.notmuch/
> > Suggested-by: Dan Williams <dan.j.williams@intel.com>
> > Signed-off-by: Ally Heev <allyheev@gmail.com>
> > ---
>=20
> I don't think this patch is a good idea...  There are two issues to
> consider 1) The absolute number over warnings.  500+ is too high.
> 2) The ratio of bugs to false positives and we don't have any data on
> that but I bet it's low.  It needs to be at least 5%.  For anything
> lower than that, you're better off just reviewing code at random
> instead of looking through warnings.
>=20
> regards,
> dan carpenter

makes sense

General question about the process for my understanding:
Is checkpatch run on full tree by CI or someone and results reported
regularly ? My understanding was that we would run it only on patches
before submitting them Or we just run it on full tree before adding
new checks to understand if they are catching real issues

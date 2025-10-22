Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6781D9346
	for <linux-doc@vger.kernel.org>; Wed, 22 Oct 2025 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761115951; cv=none; b=q5LyS1XIksv/5q1j0HwcWpCljxGQaFu6eQTSrtBoHTQXt4bXMHRZq/q4zkfF0ZNC0AvlyUFBWa0sfmDLAGi8a+bkri87ldM/Nu6jOWNKmbWIErtm/s2K7sGVlniwqK07S/tcRO8RRdSwPmGf6DU06GvTNrvElLC3BdX7vGKkBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761115951; c=relaxed/simple;
	bh=s52Slkr6wkat7EzJCzoI0soaZIqwObWpYaED/LO6pXE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e8invh+cFIRlZJkWQV7HJsBDRZd02CR/p412k5SnPvW/xps6Cq9qEijkZpwejoKh9DG70IpSyBOvZNGT5b/9nHerABn0j2MOyiS+PEhBiYIp/7qc+8HvvbMeVOKO7lY/v+G1P7uCFyZ1yikTmH7znV1tBpNk/WQzfEonMh1XYlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M0Op8MER; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M0Op8MER"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-27eec33b737so97684325ad.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 23:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761115949; x=1761720749; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cfCAtQxbjLOYFKdU41YYM4nSvS1I4T1EjpHpy1QIl2Y=;
        b=M0Op8MERGvvNYr3uZy5Lo4KydLmboaNi+dNz6f5d97ZEMjAF4xqyfmHenEQKTa10fh
         6nPCCHvQfTZrqQOgqj/vSJE5nKYHXxZ1w+sfKd8sGsnZHRFuJ0JhPUGJWiJ39DJGiXIL
         2brV4vM2RCBIzBfC3628dQl5Xe63ws7kiDuxn0SKeod/YdDIkYrKFVJ9AbX8Run/PgaY
         JQ8HQb6d+6d3RNPJa/mGjN0h35VZtgEBLnp4tCsg0tqYYL3C4J1mpMeSYQeHEOymButa
         d8W8GSlkDfBXvvXFwehjYp4sl/le4219sZ/OOMWsrCl1TisNdyjrh3vgHzFFrbh7gb4I
         pxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761115949; x=1761720749;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cfCAtQxbjLOYFKdU41YYM4nSvS1I4T1EjpHpy1QIl2Y=;
        b=trK5/K+1yv5lJE/rNCmKL4wYW2Shf/2bkn0Ir2d+I5gDN9fdi8Gph9xukymmLDL8sb
         KwOyuVj1ilZjfZYm9iFCUgAfkorz4iRkoZ3bVgPE75hoxX44HC6bNg17TiE4nfursW4p
         1dTjBLv9jxJKwt7v1Zcg6abwh5KJTidOjYbTLrtpR07O/lsfYXfq0xuGoTkPpnJlavtg
         Ol6Lk1Hcl+BWnU4C3M+D42UpdV/9ICV3cfCHt32hU6wnU3lMgLgGwqxZNRKsMbFO/dgZ
         O3zbLPAiNrU5dmZFv7fOb1MMZKMPXRaiiZyGJg7gtDEg3FaZQNbCWb3OMMOdaGv1n5/x
         4LpA==
X-Gm-Message-State: AOJu0YwzwIVhfNo9tazNAAipYyC+3GyKVurXF7xGJFts5+K1UNne1P0/
	tLvS3MX8q7BD9ulu/mpI21mv20gJwKwam1SUsHTLcsJs914fEi2R03B3
X-Gm-Gg: ASbGncvODrT2QgGQKG41w2LdLOLQzfnMb2Yv/kXANhgizekiotB8melB5ub5E3XftLN
	/Hjz6m4jGpd7e7aL85DBwybxIWn2/aYQhzSMqPJGV5yvjHSBgARTgezNz4pGznjDjBjr/PJHNgo
	nTG+dyf84Co6PtRBiewQZsPwA5vgTNSlYZANgH35EumyMRrV4Ap4LonANIRWnsBBOLB3eYPJTqr
	HSaKm2yNr1tXFa6KhTKz71xTf3eQHwe9QOw1n4pWYfkX+ozx/0JdIw5AXQwSAF1OIGCRsI0A/0P
	QLxehp/vodZTYlvWXXlEyX+mQOzCdkAkNymIkCBcYLbzDA8EQntMdFqSOb9feqxnW0a/kMyCO15
	p5WJ5tOsngg+5878jG8T/JQp1BWFGNJJQ6BMkffpF6njUzoBe0mHR/YbrZGQ1xko0JWp7Izry21
	V3OoAFn/ls5BG9AUo7MvYxO5tyK7EutGgXMn27FOoIsKQ0EdE=
X-Google-Smtp-Source: AGHT+IFMSuTEE8EAynNZfouzzGpRK3ZPx5DA2CURr/ENLw6IvstVTll4IoLJt+N4CU1a3g16jTSfkA==
X-Received: by 2002:a17:903:2441:b0:271:479d:3de3 with SMTP id d9443c01a7336-290c9c93d94mr258464315ad.12.1761115949501;
        Tue, 21 Oct 2025 23:52:29 -0700 (PDT)
Received: from ?IPv6:2401:4900:6575:cc6c:809f:5c1e:f090:c761? ([2401:4900:6575:cc6c:809f:5c1e:f090:c761])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471d5874sm129655605ad.54.2025.10.21.23.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 23:52:29 -0700 (PDT)
Message-ID: <9e80ec7909b40e662ea719d97151b9e6dbf8faab.camel@gmail.com>
Subject: Re: [PATCH v2] Documentation: fix dev-tools broken links in
 translations
From: ally heev <allyheev@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, Yanteng
 Si	 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Hu Haowen	
 <2023002089@link.tyut.edu.cn>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Date: Wed, 22 Oct 2025 12:22:23 +0530
In-Reply-To: <87qzuwt3hk.fsf@trenco.lwn.net>
References: 
	<20251020-aheev-fix-docs-dev-tools-broken-links-v2-1-7db64bf0405a@gmail.com>
	 <87qzuwt3hk.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-10-21 at 14:16 -0600, Jonathan Corbet wrote:
> Ally Heev <allyheev@gmail.com> writes:
>=20
> > gdb and kgdb debugging documentation were moved to
> > Documentation/process/debugging/ as a part of
> > Commit d5af79c05e9382d38b8546dc5362381ce07ba3d1 ("Documentation: move
> > dev-tools debugging files to process/debugging/"), but translations/
> > were not updated. Fix them
> >=20
> > ---
> > Link: https://lore.kernel.org/all/20241210000041.305477-1-rdunlap@infra=
dead.org/
> > Signed-off-by: Ally Heev <allyheev@gmail.com>
> > ---
> > Changes in v2:
> > - fix kgdb doc path in zh_TW/admin-guide/README.rst
> > - Please drop v1 of the patch. It is malformed. Link to v1: https://lor=
e.kernel.org/r/20251020-aheev-fix-docs-dev-tools-broken-links-v1-1-5d127efe=
c0b2@gmail.com
> Putting your signoff after the "---" line caused the tooling to not
> include it in the resulting commit.  I've fixed that up this time, and
> added a Fixes: tag as well.
> Applied, thanks,
>=20
> jon

Sorry for that. b4 messed up the formatting

Regards,
Ally

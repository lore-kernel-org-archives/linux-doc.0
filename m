Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0156C3C063C;
	Thu, 14 May 2026 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761120; cv=none; b=SIXK3QssX/5U3X/zTft1MYK8IgeYANzlJ3C/Iw/CfseL5x/dqWiXvjFSxoZ7UCsxz75jR7a5dNZoCxmsUrVYKiesK9oypP3M7fzsoVdja/JNCD8HoGYgA0MvuEjCrpuqQBiqthPF3thE1to2Zp6nrzFvbvIKFfusQPwcFh/dTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761120; c=relaxed/simple;
	bh=7Ce1dQFNjxZfuSYtyx4eg3KwdQtZxUBgmuZmELs/KaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bdCsC1J6jOVMhWrgbkMeu4NA10Zf/9nU4Lr+mxvPUVLzBoQm22yZKyY1M9+phFyTYDGdNqY+OUETpthmV0Whvu8yMeV1bOFW7Xw3tJx+iqrgh8Dc83QzNPsMb/GqqmDUFB7gad1+2RJN5QoVLIf3kWQ83h6Opv8JutXCnl2v0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Z2lb6/SQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Z2lb6/SQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9CDD3410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778761116; bh=+NAlYa14LpWq+vBr6UEy9Ob3K0Kek3sjvK31oTD8wEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z2lb6/SQs1rSVYxx38HpGECyOXvT19Nn6emhfmaT3/akBrqAJu/Am++QMuzSk3NVb
	 dAJ/ig2fSKjrZ9lT8WZMSeJdAcaAKYjLh6rGyKbnEU699nrV7TaGKhYEujnSYWwnuI
	 k2/EqOpmjBWW9qBrM1gv4BwJ7n+kQd+IancRK689ioqFzlJjQC+sKsaSwAdqhHz1K6
	 KiSPmmCgFeyYLcj0/2X9fc/hFhp9pqt9bBOPUPDhH2yM8UJG8cWPvovq/8jyebYq1I
	 sUG0MU7vavtZFO5xDqXy8H9bTazvxeIzyFLOPXhLnSrDwVOhY2RJddF0jMDTAQcxmy
	 1j6FivMGiwYFQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9CDD3410B5;
	Thu, 14 May 2026 12:18:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: WangYuli <wangyuli@aosc.io>, Chen-Shi-Hong <eric039eric@gmail.com>,
 linux@leemhuis.info
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] docs: reporting-issues: replace "these advices" with
 "all of this advice"
In-Reply-To: <e2cced37-58ea-4678-a586-97f9a6db7e9d@aosc.io>
References: <20260514082808.655-1-eric039eric@gmail.com>
 <e2cced37-58ea-4678-a586-97f9a6db7e9d@aosc.io>
Date: Thu, 14 May 2026 06:18:35 -0600
Message-ID: <87zf22uquc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

WangYuli <wangyuli@aosc.io> writes:

> I searched the kernel tree for the misspelling "advices" (the word
> "advice" is uncountable) and found the following occurrences:
>
> "
>
>  =C2=A0 >rg-i "advices"
>
> tools/perf/trace/beauty/mmap.c
>  =C2=A0 68: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0static DEFINE_STRARRAY(ma=
dvise_advices, "MADV_");
>  =C2=A0 70: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (behavior < strarray__=
madvise_advices.nr_entries &&=20
> strarray__madvise_advices.entries[behavior] !=3D NULL)
>  =C2=A0 71: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return scnprintf(bf, size, "MADV_%s",=20
> strarray__madvise_advices.entries[behavior]);

Please, no.  If you start churning the code in that way you will
certainly get pushback.  Typo fixes are a fine way to learn the process,
but I really hope that contributors will move on quickly to more
substantial work.

Thanks,

jon

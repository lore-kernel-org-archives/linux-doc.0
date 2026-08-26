Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C6F3CD8B5
	for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 11:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787744983; cv=pass; b=iNbmfbCM6BoiUXA36ikVPRMZCnvLLywVX+TAQ2DWYTVZQlFTCfDjop+WeARmk82vnh0AlzKP/rbiYGyqaa4VZgqXhczuQUbTZ94ywSvGNBqBv30sqEG9RMG+ASlcFcEriEIKFl0BGLFmdcn6eCjiYMwwCPmlDNw5ePqJQclG0HA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787744983; c=relaxed/simple;
	bh=dLvsSLxd8cFpVkVYK2o+AbG56967S/8dtQi9Yj9PszY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r4LJjXnkgjRJrLceGA9NpI6IsS6Pw+03dnw5a71myzzn9jOcPOw9x+ysUsP3F0tJt5z3itx7kTTHSn3FWo79cJTociC4rlmWEsk49tgjSGgjiAvUhc3lJVXpn9IQrPboRusNu1mJ9PTlcsd78gLCrs8lNheubd0UGpAMhlXqcqc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CN36GhsS; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CN36GhsS"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51c05dcdf49so8696551cf.0
        for <linux-doc@vger.kernel.org>; Wed, 26 Aug 2026 04:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787744981; cv=none;
        d=google.com; s=arc-20260327;
        b=GVXPEGqYHFtXiczZCNmTQzzsU2XEOVG2tRovGLu62/E+tod8ufDpHAwDqd03QQce/a
         t65utRBaNvomXOzkQznuBNu0wzyRJ5PGzjC1QG8ClOIivLUBM9Sn1ITpvIlXWrQ+clZR
         SKgMWPCov3P5vMaiFhKIx68NZQDjldB92/+wCkI50Yg+wySQkiebs2iFVD6GZLYmZEmM
         3G5F6Cu6npxB020zYLax3hdpegp9lGuF7rarExQJXZI41MPFJYxaTNKoenJSDVzHXLF4
         23qdX2+ciE0nlK/RqYvKnQmHgsiM7Jcl6TYylvZClKWHuMjgqe4z6ALEQUioAYFObinO
         f+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q8N5eKWMe80oBVINOcq1r45eUB1bt+xB2b0h22yQjao=;
        fh=JtYeF46djLQldqh6Kwqp7MI8bTKfU5HMhVjJ7147hFI=;
        b=nluGPc0oMqGuuFeAShU+v1ddXU6fzojopWJGASUM/D76jikXBK0e6rfxAn6z1ixnFp
         qinBLVlrJOY4CIE2wxIlIiYxQBGRY876wxnbIO9Fc5bULm9LtHlTs8wGl4xITh3f2r1d
         MVTgeokWw5RFHOb1JxK19hy6d2XWL4SQnvJgpVFT/MJcXmBlkeFh/V3aDN4XduuTcbiE
         g/5uNgfStdAOkqvHf4WKLdoIvduDsqOT5kqFHsxpThcH/M+gACYwCAUaT0LN6nMAPObX
         lhnpbbNbtxIScS8WTl11ut8fvBpkoFTElB8SUvlBiNeZRjSHHloJLYnjvwe+7v7Dlvfd
         uLYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787744981; x=1788349781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q8N5eKWMe80oBVINOcq1r45eUB1bt+xB2b0h22yQjao=;
        b=CN36GhsSYlJkghswWfYyV6zm7Wx1Ge4S1mSJUsZPH/ePErTVU6J9PnTtvWa0Oa+lr4
         qh1nWUBzd5s0bel5YLWcgdj+Ux4+cD8Y+VQ/wh4uej2NIpsg5NaYF3NbJG4AU9EBWY4p
         WH1QS6k3dnxuAGcNdPv0vY8xSvzdh3oT8Kt4QxZ65Ga2Dt5jXQ2lUezRPl8gaFFZGPAL
         gogCNX7Mhv4pfks0BhcKRQelWZj4T7HDUd35fxlPy/Lau1lrAL5D9JeyWLNAx63OEkaR
         CDaY5n6gYKKngUYSTuzZ3Gbtr4IsDgWaP2DMYVpUIk9mVGxLgcdtcTzf5PwVPTmZDccv
         I6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787744981; x=1788349781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q8N5eKWMe80oBVINOcq1r45eUB1bt+xB2b0h22yQjao=;
        b=jKOfMfxa70huT8CbSa0q3MB77mQ/RIZ5sDqFBQalFNuAmX8kH2zQ0WA8TYz85Ps3CV
         aJDo+O0Sn+zSELsKwonN/4hH1mkyuGGF9CJBE6EPyBGdzMxm890//w5IzJ50rr/4U8tz
         z2Q3Uj40eMkIdvQWxYEQvLSuChz8a30Zl2wfS6Msv/BaQyLIreITh5HEFG6VbkWrQrkZ
         JHiH4wqIi3VeOn3P+QaDxFWvGqOTc/XbTsfFa90HhSCF78l4K6NXl4MHzwMYQG8u6gu2
         JNY2vpNynjvtZT1uSYuZpyXqVKfY6KzMNHZ5HahvOrz1uPwE88dASV55yJMrdmuiYY/C
         YZig==
X-Forwarded-Encrypted: i=1; AHgh+RohYQvWAFtJe8B0H4p2q3PBEHzx+opVgSm4vz+eP5w2bghTFpJHOjz19+H8CMZYm9jV79O8lkDDr8E=@vger.kernel.org
X-Gm-Message-State: AFuF++kCo7hjSwZ16j5QWfvZmuKFkqzTrtYnF2r6SpG1CAt6WBD3wfko
	mvY8hMmjYU4WirIIqICs53yF4+ZyrEkhbAG3qAK5Fgrt6uNDjx1GNNX/PMkyGO2bTdsyO4HIqB5
	oC0oaU7f4AkfonsVZBWszFJ26UviQ5P7AIjtRtx8=
X-Gm-Gg: AR+sD11hyU4J2Anse6nMCKukaE34DGTKzv/P1oPeED9NBrSJKcGLfhS23JL6+tRvPAN
	5gQOEbzlb6isXeIkFBE4e6QsaUWr5HByid44uqAVsSCyUNr2LhqhUBPbQ8sScEaf27GxDmlkyLM
	YMLtz5VAx1dSQFwphL5RyXL571sjUoEzuOCiy+mK9sQjP+Zt/moAngJPN5IB5YEfM6gMu5fPyUf
	VgNzUHThsz9ixd9+8fOXEAAtqJ3wzBMRkmDHqlWlxLK/cK6VoGbmOUwDI0qQ5ug4iYky3JEre93
	efaa+pc5z1BccM1DHe1mazNEzb6wN59RrbtVLomF5md+B0tHE9ZVMBivugaNd9Q1o/iMXoFwY0E
	3qNlNpTLd6K9808f6GSng3RfiJDA/23SPaDXd8lI1TV3bsZ/ID0kEqant6A==
X-Received: by 2002:a05:622a:1b17:b0:51c:1590:8e13 with SMTP id
 d75a77b69052e-52e4222c9d1mr62120451cf.4.1787744980935; Wed, 26 Aug 2026
 04:49:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826023107.15130-1-silvapfabio@gmail.com>
In-Reply-To: <20260826023107.15130-1-silvapfabio@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 26 Aug 2026 08:49:29 -0300
X-Gm-Features: AcwNN1X5Tnnbr0DFZytA_S6jvfWIjKJNAUNFT7opxGG5e4o4VCYxznhigDP7ztQ
Message-ID: <CAMAsx6dRaPv8ingydCwZgnrg1ekEV4SM97TMh3e=Rv2grT1xAQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: pt_BR: process: Translate development process
 and programming language
To: Fabio Pereira da Silva <silvapfabio@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 25 de ago. de 2026 =C3=A0s 23:31, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
> Translate the development process overview and programming language
> documentation for Brazilian Portuguese readers. Add both documents to the
> pt_BR process index.
>
> Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
> ---

Fabio,

I have reviewed your latest submission, but we need to address some
issues with the current process:

    Redundancy: You submitted a translation for
development-process.rst, which I have already translated. Please
verify the current status of files before starting your work to avoid
duplicating our efforts.
    Submission Discipline: You are sending V1/V2 versions without a
changelog or explanation of the modifications. This makes the review
process inefficient. Going forward, you must clearly document what has
changed between versions.

Please pay closer attention to these steps to ensure our workflow
remains efficient.

Regards,

Daniel

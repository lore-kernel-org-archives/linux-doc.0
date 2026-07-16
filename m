Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4635B37DEAE
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 04:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174421; cv=pass; b=HYL0yw5SdrqRCOLtPHk+wANe+me4EXi4ZFvuNPfbmDGX6yPnkXoSo6f8v+GLTNeA4AH+CT4wh/NdaZCX+zydC8C+4Aa7tmD80rSy5mUuqvHhyIB2dOg1/7AcrZfslYLMPE1FGYb2yJ/UvF0HpO0EIUIiW6bDR+B02c1UkJytb+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174421; c=relaxed/simple;
	bh=VsAEqKz4yVBp16RYzMgKnNUXFVsFcWzWLt8SBxiKCIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQvR3mXYw4PAOtu9mOYSasYTId1uIh6YWr/BGtEcWUI1g5/GBQw3gim0/Y5jCSOai7Z7SRwdYd3y5xaSFzmhMppA834NOA+FB5WuhhasmjlSP8+dQaj2w+akNpGNSiJesNr29fbL5BmYf2658OMvgWJCTkXCzja4n8n3gWazpb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwJ1Lqfe; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwJ1Lqfe"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8f18d92172aso36750336d6.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Jul 2026 21:00:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784174419; cv=none;
        d=google.com; s=arc-20260327;
        b=noch8CV37brNVjOqmTk0coE1G6C1qEnfoXqSDqOeN5AkyoggjeMR4kmOvEVMQaeEqQ
         9S+vo6jYPXu4pi+i8i164UKmulB7bsN1yuy3EaXd5wzskF2c9/AioYWTGZuefJBgucQg
         lFNfsTOcbRPriF/MSeP5jgj35PAoF5fF1qZAiLbfmcvuShDu8WeTwLuSHz201bl4zAzH
         w7APb43weX9DS/Ubwa4eAAGi/39aeZG6bmCrT0cphd/y3cjcjjggGkn6nRH8PCwc+mqo
         ipawnGzV+jmbEH/vnJZF+vREqRmsNfPXxxCHXG0X5FL6q1jVp3PfyQeQ51+MrfJr71wQ
         u5Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r+mzrOimBVtW9nuij+Y3CXsUxkRDkIZijXKK1Hsw6aQ=;
        fh=MwM/ibIM5CqoA0CYmYNey+nKQGz3x85+tcO5XyP/Ie8=;
        b=n04cVsXtA5SIUFxqLzIGl+aTxT90nVcf25+syX3mH9mBXI2tb2JqIX6xVttxHkKA5K
         C22nZzk1SV9HK70MgL9jz5K67g8emR/hhNui0Q/jcXqkMKeFZBuR35TiDPWnW+9UnpI6
         QgBjwuI+LKL0Dpq7qkBb2fCv/BES+MqxO+8b/sWdpWLdVy4GWjXluHTM28cLu3Xn/+8D
         ER0EWoNMlqZ3/8KV/c9MaoFFBqyAGoY1tSJigvqcizcj3NR7vouyfE4AtO67ZEWaYCym
         A+QwXi+XHIh4HHskpkk0EG+nws7muk377UJzAnqgdh06QVHW+XcewKqc38qv1ffPr78w
         tJ8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784174419; x=1784779219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r+mzrOimBVtW9nuij+Y3CXsUxkRDkIZijXKK1Hsw6aQ=;
        b=ZwJ1LqfeTJlwaMQeh8RSi1Wk/htIL/eFH0InJG3BpdKnvBDn0v/KxKAxVEV4Axqnz/
         t2V9+2JlxDF9vY3KT1AHY67jypqyUynHogo8cnDvtX+7Gnv9sbVuxwmetvBB8OZLzLxJ
         t8zQmRZWtsZN2yxEKtxMY38/szDkmlR+GlUSaThMxj7MtAB7dae524Trn2nswGS03FDw
         Iuao8pYVUWKuK1CE8eE9+lg/E8jj+66nf6MXnjTD8yucRoUcBimBXJlH+NI3IuODmYGx
         3GkvRXVW/CcoKv+W0WDSV3dsHXDY6H+y/uIOFvfa9Y5uTSD4Z7Bv8G4dvQJDnlKV3YhL
         rgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174419; x=1784779219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r+mzrOimBVtW9nuij+Y3CXsUxkRDkIZijXKK1Hsw6aQ=;
        b=mjaDjx5EodCNB/jyZ6ejuT0L1Bz9LsiQ7FrLKWLFMqtDy3SQLAZv8rkhLpICmt2Ot4
         wbEmOGC5dJUOUGZUNxBlrRrASqdKgRkWIEigQVthL5TW+Kr6mS0RfVGy1y9rXf6WcLZ8
         8d2yMbQlSuz+ZdrfUECP1zSv9S5LfVjv8nY8SFdhAWQM15BK9mQBjgYP1xidCC4vXDi9
         BBEP5dRrkNsg/SyAVKg3CkV/06g9D4ym18pELpr8NmyuUZJx7bKch+7wyegnnKxv+dgg
         0FUCkcXsrQlp9HjmOel9XYjGhYC4tdGkGk0YGNQIR2ahVHKN8lV2Dq74xTWBpOjuyFQu
         k0xw==
X-Gm-Message-State: AOJu0YyKNqbCP9Yxw1dxYvvnQ5KK38RMfavvbrECbEO878y/LDwYpT4r
	czh6L57qpw9BLkXbjcmxmB3V4Q8bjzU63s2Xqt5vwmo9gsAwyStihEHdTr6ZmGGa7moGH1Qe/iM
	3gH0+b1hVGwUPqxHbGHWLVzJM6EilQI0=
X-Gm-Gg: AfdE7cm4FbDNLZ6dHUp/4tB97bmiFnj4gr7wXwBpvcR8zn1/RCH2aki+x2HIhTb8/5W
	4gb41fIfYroKikGNZ7XSPaPsURK5rD6QQcbPuiVeITYT2ru02x6tGKj3f6Jtqr4nCk7kA9nO2Y4
	l6ZR9K0lId+ZWW6VilwHAvFW4JEMY2pOMqxiK5r/AU2LGM9tP4sXTeqGF6RRzlC1c4OdMUY5ZwM
	SfaBQb4k9ftmYH/H/MXlUyTx5lC78e7V0eRqoUweM19lBITX1yLebkFAhYd1uh7htHNQF4/Jd2l
	5V23fWVclJJhQfvwjqHqB3nuS2oLBQI4L/kl3vu1fpbHj7khM7QtfGoH4QuFoOZd2IgoSXPmjQQ
	P
X-Received: by 2002:a05:6214:4c46:b0:8ea:2beb:287d with SMTP id
 6a1803df08f44-90403261b2dmr215706166d6.38.1784174419007; Wed, 15 Jul 2026
 21:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714222354.107462-1-le590616@gmail.com>
In-Reply-To: <20260714222354.107462-1-le590616@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 16 Jul 2026 01:00:06 -0300
X-Gm-Features: AUfX_mzCRAnlfXx1-GAHdQRGACskDuy1adWOCqvzPiav5_b_85TalpMftkVwaX4
Message-ID: <CAMAsx6dLkWNPKgUW6m1CZMJBa5zjqEStA3V5YQNu_FoQeSNe9A@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: process: Translate programming-language
To: Abel Philippe <le590616@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 14 de jul. de 2026 =C3=A0s 19:24, Abel Philippe
<le590616@gmail.com> escreveu:
>
> Translate the programming language documentation into Brazilian Portugues=
e.
>
> Signed-off-by: Abel Philippe <le590616@gmail.com>
> ---
>  pt_BR/process/programming-language.rst | 56 ++++++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 pt_BR/process/programming-language.rst
>

Hi Abel,

Thank you for submitting this translation.
I noticed that this patch was sent twice. Could you clarify if this
was a mistake, or if there is a specific reason for the duplicate
submission?
Also, I noticed that the new file
(pt_BR/process/programming-language.rst) is missing from the index.rst
file. Could you please include it in the index so it is properly
linked in the documentation?

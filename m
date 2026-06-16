Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17517303C9C
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 12:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781612658; cv=pass; b=nJ2+sLXICMF64Nqmk/nWI20pbe5bteoWXp8rsXcTQtST9q8ufGodev4pabA04Qle3MejEOKCBc02SUOi3b6hYkRi04hU5Rmj64ZxOwlgCygrul4sexWA1+LxkIainU4jYGtWN8XFTVq9ju732o4k/WNKMVg0jP6fp4GQfVdnEYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781612658; c=relaxed/simple;
	bh=D24Z/Of+fT6yKmZSvnrIhn76QjQimJcrM5uzxAcBRC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ls46wvfosPDgeNEvE3+BMbaZOdzqoncxbFK33d4raaLuAObwIc77FWw5uUkCpGJ2UP6wm6LfS0pAg5UMui9SPxGHiXtdg3VPXcEsFx9CbHtOcbo2VCE2TuBScN4FHCMomIPkBq3SSdrlo6ejfNX1NWhaevrqhVvuCKHhIkWC9c0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdpPS1vR; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdpPS1vR"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8ccf18ef922so66064436d6.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 05:24:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781612656; cv=none;
        d=google.com; s=arc-20240605;
        b=LYuNSEKVB6/u2IZVvBgCR5JVY81CA4hZu8FOSs4M7t+qKK6kn4nyww4A1DlpxhXyPX
         t3u260q5pmxo/TFhmT+XXsUgPFU3aZMNXhLU87k+PHbwfVWV+w6c+Bb7pdD7wMjsdChG
         pwBH6CNbBEHqV79Wnfa3NnjU+Ifcdc2ugtoPm1Jp8p5ljfRpqYZG1GXCIMZeCe/9qDF6
         oYDFjuuyRuIYyHY+dXP/DoFWbueNh4ZUkF7h+oCMiWgufOMYfysLaTP1DVBwev0kr5g5
         IjrBFcIXoEYPLjFB7wDEg+Md7hpJhE9v734HhwvJtMXeojmX51cIEHvMPmycewAfQJK/
         0nzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W00RbMhlrpPSsObgw4waI4jS4KF3V/ElUcpL/BYCNbY=;
        fh=65Drdghmk6DrUDvcoX4VSJPykjJTxTzCQ6QhkhHzIDI=;
        b=I4HZkN1j7G2uCDdCFwJnpDR4Bv9F34fKSwQDF2Yf/IvBtlizFSe+FNp50FVW7pc3c+
         xbOj0bP8JjQ/t3ASIGW+Gi4IB3W0EIoG/r43PKu/tASP4JclCOWyFPBWFAVkkQKnpzgK
         0KOH05mg+z8B4vyEp2i3aAGUOFTlhWp1U7ggqua/T6MVKZrZLthPdRWx1DHWegiSiQ7m
         ni+X8maNx4fXi/ooWFc4bcAWGBcwqhxEKjYRiqLmlqNBUTWDxtWN6/F8eV02F++H3mOY
         uovWfAEZmJw1owoimn+KTTHTXPKCE2NXAssuz+83YLL2DNFnbZW6c+ZWY2ihh09FLjEc
         Oa/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781612656; x=1782217456; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W00RbMhlrpPSsObgw4waI4jS4KF3V/ElUcpL/BYCNbY=;
        b=PdpPS1vR96O2tjj+dsA15IVI+W2flze8iJF7E5YJyr9WBRXboUnS51qljDWTl2sXcE
         gyEPcMpgs36Spxlu71JLBb1O3dupuY6zDz3JDbpi6czUTfdqDeMqqPcqTJjhl9oXi7Re
         f+dIAHcJPj2z3vWYqtZw6HQlRS0i03mlwi5Ik8YntOOluLeF3LvAGqstIFfvpsaJ2U2c
         XqTJpO6BOCBKV062ENAFEuBxh1SCmd9IVt5liZO3Cn2Iq6jNYz05EOa8f44lxnEAB7tC
         mPt/eY2XBLpZIpe8ZgKUco43uwVjvA+Mq8Fs4tw8+i8CSrB03wp2NxJx3Uyc/def1ZA4
         tIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781612656; x=1782217456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W00RbMhlrpPSsObgw4waI4jS4KF3V/ElUcpL/BYCNbY=;
        b=sqS4fjeAk7BHExl17aRJ/6SMnTZ6AC8n9yCB0lgQvt6E3Y2uXCKi4JhToaN/lBXGLH
         cifaLsH1GnIBSDhdaz3mR6q2Gk3B4lsi8UMCklvYSRAbZzqaUrxOnsLUw38cYDaGywR/
         HMcg8PuScQ7XjndWR4rMqVV5Wy2kCSSMQ+e/toOnFjuMYMCZS3Hpz6AXsHh3be1ySyZ7
         gLZqJrO/5w4wCNf6wIQHNK/EJigHo/kLURrxYCT7mG0JlhO9e3NUrCWAjSPy2EZbNCEq
         JRdAz9/DiWpk54+CFidt1pwYXSxn7KhtxIc1Bt/M3mJrdi2Wl+DWlbY+IM+cGSpe6Lv7
         NjoQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GaZdjGbTeVD3Ovu6hf7Nan1vyKxCuOQ/axMA7BL+iozCuM8wVs5xWntVYjLqxHvG95Onn6HaQZdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnibCbDXFDjaCDznVuhgD+8R7bmINVVyaTMVhDrap1bxrlSxoX
	edw4WR18F04YwrvQ/e8n5hEIt5Rwls5ZSlVzrwOVXV0eZl0VYTYgA2kEcPVZ3CCWn+UgotiVjwD
	bFIH0PT2DHujcsWbk+s3S1Uw08oMEC2n8M4VmxgE=
X-Gm-Gg: Acq92OGY6yxAygROFXBXW94AkEsLUyiLw+n9sv+Vy0gvcuxh9bhohYDL7d+GCfvgfZ5
	5qPtLuFHxBLIMrKkVn6BgnEtIzeY6zGDa7li57m3UZQJbkvwn/qn6L1CS/pSkmi7doiQFGVKcT+
	oVA3WQg+Z5i6YX1f2JM3a+O6MEX1wKWwyAaJFbZcqx3jJZFsyG9fKOgveqKU2UpWpe7T1Ae6oI4
	2yTisqMR2FDrGvij5r4q0QSgdeBwfxboZI5orQ73+xwIat30OCWbDGjeih6nuGHWW5bn0WsrPMo
	IlDzs7Fb1rCvUKyRMEQrD+yF0hMi/zI2wK+Ljlw=
X-Received: by 2002:a05:6214:3283:b0:8cc:3546:2613 with SMTP id
 6a1803df08f44-8d44fce1006mr244086466d6.42.1781612655735; Tue, 16 Jun 2026
 05:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260616005234.11036-1-amandacorreasilvax@gmail.com>
In-Reply-To: <20260616005234.11036-1-amandacorreasilvax@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 16 Jun 2026 09:24:04 -0300
X-Gm-Features: AVVi8CdACM4fyYsFeziWOb_20c9CrkqAl-7hwyn652S4IQOzPoV8rwqUWKTVFTE
Message-ID: <CAMAsx6c5TG3_QsgAG_6e-OHLvphecqconqMP9pQaxifAehetDw@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: update netdevsim section in maintainer-netdev.rst
To: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 15 de jun. de 2026 =C3=A0s 21:52, Amanda Corr=C3=AAa
<amandacorreasilvax@gmail.com> escreveu:
>
> Update the Brazilian Portuguese translation of maintainer-netdev.rst
> to align with the latest English version.
>
>     Key changes include:
>     - Updated the netdevsim section to reflect upstream changes
>     - Added guidance on netdevsim-based API testing
>     - Fixed minor spacing and formatting issues
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>
> ---

Hi Amanda,

Thanks for the adjustments, the patch makes sense.


Acked-by: Daniel Pereira <danielmaraboo@gmail.com>

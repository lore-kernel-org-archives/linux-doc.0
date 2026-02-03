Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61A81A9F91
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 18:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770144336; cv=pass; b=r6y9Romn92m0DrGNv73S1dZX62rIE5ul1tIBnVnRmq6dUupXS1P+/teJxvTsob1f/UGdJ2jCQXTNTjthseIG9fFoYP2GwXvGIfZ7wDA14tUrxYldFS5QcjZapN1sf0q1JYnA86e3t0AKs+1LitPccDpA+DOQzglT8x3wx8WgPLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770144336; c=relaxed/simple;
	bh=PMqkHMXr+ZpQrlwXt9vF6Z4+JXKaoZ54baqMNUxrHVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RR0i/34YpEPzE3FyHKOekXEj+6mzSmeyFfVjBtBJXUPnU2Cmz0q36iPXvS05lVhl1jIuERFGm7WsyNtLa1SV8o4VYcLTCdO/Y82/aSZhEsGuXYlL27nnvxmWMrtMWEKOcGdUfJo18bchSN1tYSZS0MYrOys8ddST2aloc4ikw7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEYIB7wX; arc=pass smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEYIB7wX"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-663170b9472so2427437eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 10:45:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770144333; cv=none;
        d=google.com; s=arc-20240605;
        b=S1lhDUfeVt7nSm2/6zDvg3qP+KwudaEGyX4WOpxBQmbFlwibKHO/5Oey7eNQRU7lqw
         R6eAHRGD2xA1QVS5WPrphMh261QTwCdeeOD2flbGYjUJ7/0RMXv9TqI7mWT4QMTEu7CP
         S+6GnBVlO2Zf51AkYCKImLJXD3nTcQrMTh9nhKmZ4C/gS4wIPj3tavle1+XJME9t4EMu
         ElUukQzH7Z9/CPKdhXE2KFPRRdEyugKe+G3tRUQSKn+jMmkz4K1V6YnvoKIqDeTLx9zJ
         XOH0NHXD2+cz08GMcrq7iscE5tGUkZzo2TDubFxeH5+371quRmRmOoDrbSpf1Au86tig
         ptnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=rSKd3nitYxB7fwwCBP6axPYZO0DTUL1n4IbhiAY6LCM=;
        fh=RlI5HGectjr9KFDQFUz0xDWD9QrfoZcGCzlpqVt7xFI=;
        b=BBHH1WOEOHbwtYer0hIfjENB/fPB4JtgRjegsAPXDnpnFprGhoM/CVCWQ3nV4YgOLp
         C9oNyslZam1RIqpUGzkGT5IvH3S4SCdHund7S7GEQWpDRdkeVOEKh3qQFCJKoL0yV5Ja
         8dRkgqspFM0hGaUoHyMVwsrM7JXjlCcg2k1rZAYjEWQnPFMTN7IeBbELt5CEJnb8F4nc
         kPH6k12gevk5aQf/N0qxSOTkqeDxWTQyQm9kCypnggnwGKbCFdUddhcp9xlvUAxWEbTj
         0FfysHwOqe2eWXiJROK7kXUr9/V73P5oV8E+AZ4lBpgbBcellqyItfKi6vjGRZgQ0cE4
         VeOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770144333; x=1770749133; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rSKd3nitYxB7fwwCBP6axPYZO0DTUL1n4IbhiAY6LCM=;
        b=jEYIB7wXWh4FUHv3iyaS7SC/VXd1YRZxKNskUGZX+ACcRdznHLDT3M6OVT+FOtG4RX
         6IubrBCuHJicqOYwDs/pXgE33onMxgSFYiFX1BZtxhkHVIQ/1TgZbf1GtFdXjCe2OZVy
         OvzbCaAW8+f+bzoUapexdVhHFARTxhoGyQPd4LzMGFkNmCvA4VflBdgVX31tVFvyqZuj
         dF6qiSfc3EQ+QRQnCFztMfgadY9lgBs+xm6qnIxQAp9JAqgHIYba2S4EzoF2pT2XDWTe
         wYj8bwh7NKvQtXtf4u9eLHJvA5hnOO7Uvv0YiLqIRHd0/Oez2PQGuNsk76tIcSytw6vx
         zdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770144333; x=1770749133;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rSKd3nitYxB7fwwCBP6axPYZO0DTUL1n4IbhiAY6LCM=;
        b=LNUoyhzshJrIs++WTcOE/Z/jFL521pVW/bgThWVaUbKT78SegDvhBTVCf8pku8LXSX
         6KQyZC9CK7//jVrdRamLY67HeAFPIJRWUPhmDyp1DE4VaMAvuQBz0t/2CNqMvd/of9yz
         drf1+iKSiCq5iZawD0m+94x52GkueFVvYIsMZ9Kbx0Duc6fgxkZji73dwXGKgcfEqnPh
         rkvRZVtxDv+3J0wkopfAWnPOP9exkI/audi4NTDlgYqwCJfLTGydckCVmkXsQChiaddV
         NP5oJRcRA0i7Rj9nARHu82/6o8Oa+EPrgAEmkOXYU1smZBV44X5Ifcg0iuf8yEpZx7ja
         ExVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4iEquKWTE4Hyjjk1AKqmJHK/ab8TZZFNyxRBap1znH6jP1wD19vygHSsj0mTpF8PNvnIag7vdnf4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu1DxOvIhzmYxu79bQPC3WsjeqJImN5LfwZ394jNBAaTFwmV24
	6uP1dEzZJh5Wk/33YkN+OucwJin291/2g7GSkjltHetnvdurMZJXfVeVPva/nSveJFEI3paEv1i
	TQX8StMGQdEXdgViVqwD2hCbwsyDTLSQzflGgJwA=
X-Gm-Gg: AZuq6aKSysSYu8p1lfN5DHLfUI0/XyctPPwV0rhWYHISlyStKjfPxDVS3Cx7JerPI4H
	X8Z4kV1kpPl8s5aQ9xjMUllTr+b2vyWsOZc7n0OJ7Q/+WcMwVnw+v6Czig/bDmefF5B/Zn9LnWt
	5c70TVbY1n5ZVGoRIluMw7f/A+jqRSFZOY/nY0fWvL76fvDEhHnm7u2GxrW0CtVKjTjLyByj1hz
	UEqPi5g6D2sn2WBCLO28Pek/mOd01G6x174c9EH7G6AG5JhOh0vi1LGA1LUIT2zm+f3nNDqMEAP
	yS1pAHgc8y9OZeLSkEImI07r31M=
X-Received: by 2002:a05:6820:4612:b0:663:1239:9eac with SMTP id
 006d021491bc7-66a234318d0mr268800eaf.59.1770144333418; Tue, 03 Feb 2026
 10:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203120859.65735-1-danielmaraboo@gmail.com> <087b5848-8f51-408c-bd5a-d51fea2731cd@infradead.org>
In-Reply-To: <087b5848-8f51-408c-bd5a-d51fea2731cd@infradead.org>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Feb 2026 15:45:22 -0300
X-Gm-Features: AZwV_Qgk58GELHo4MobGsH1zofPzaxdV1LCXbGgbPJOa3fj76Jlwe3Pt4RARxQY
Message-ID: <CAMAsx6eEup1gQitY1=GVZ1OzhKSRPjs8Qi1hzzui+fc8MP=dgA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: add initial Portuguese translation
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 3, 2026 at 3:11 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Hi,
>
> On 2/3/26 4:08 AM, Daniel Pereira wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0efa8cc67..c5e0e1f2b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -21141,6 +21141,12 @@ F:   include/sound/pxa2xx-lib.h
> >  F:   sound/arm/pxa*
> >  F:   sound/soc/pxa/
> >
> > +PORTUGUESE (BRAZILIAN) TRANSLATION
> > +M:   Daniel Pereira <danielmaraboo@gmail.com>
> > +L:   linux-doc@vger.kernel.org
> > +S:   Maintained
> > +F:   Documentation/translations/pt_BR/
> > +
> >  QAT DRIVER
> >  M:   Giovanni Cabiddu <giovanni.cabiddu@intel.com>
> >  L:   qat-linux@intel.com
> > @@ -28876,3 +28882,5 @@ S:    Buried alive in reporters
> >  T:   git git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> >  F:   *
> >  F:   */
> > +
> > +
>
> Don't add extra blank lines at the end of this file.
> I.e., that entire last diff block shouldn't be here.

Hi Randy,

Thank you for the observation. I have just fixed this in the v4 patch
by removing the extra blank lines at the end of the MAINTAINERS file.

I am resubmitting the corrected patch now.

Best regards,

Daniel Pereira

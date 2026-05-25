Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052128643C
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 21:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779745967; cv=pass; b=j9zq+rsLIGNBnZSXi3FqUJeLPuDE9Xrm8Ny9jiyVHpc4w6do1Z7LsDfa6lDc1Ey71ReHYy/INq/6QJbc3N5Hz7kmsZ7TN5Q8iCHDESPhBy2Bc3XsUmjilU/rHJuF3gmtZTVauxCodly4d8EGrX0YxXbx5CntgdxkCkDEuViKtN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779745967; c=relaxed/simple;
	bh=kLeLeR+ah76xi/5PrT+0BJWyrp4RC8lCrf6UVaEHtX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PT2S9fh2tp5lESEk6f+3z6qJFMXZMGoJDWxf6dxFO62P/2BmbwP2UQLvE96wNp9r7oMc1JKR6SzYUAz74OPzrqDUTGIu9F66QnJ1tQX41vE5FPpu+XMK5SXS/NzwNXCxDuRnH34c4t6IEERScBJpDywDiopJ9n6kpUDpBc0/htw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BexcT5NU; arc=pass smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BexcT5NU"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-51306c9f2a8so120264401cf.1
        for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 14:52:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779745965; cv=none;
        d=google.com; s=arc-20240605;
        b=RtdvbF3MinT9lglow66ZXyFIcoHCIlhwd4ERyPOlbBecrj6PHQEjRB+sWTeuYQj8a8
         xVVKfgZIurleAG3y5YkS7RxbS7XBvbks909m/yh0CyxpR6V5v540iMWB94UMeODHDZJX
         MRgvFIvXmgiZ3jtOr6JhcKL/sLxeKmhQLaEuuWack1j4K5RSoboThiPbgmUY+sqx4Gqt
         vB65Z8+oycdgD8HEjSl2zJvKs4fAEAnTpN7eMr64cV9yHLFi+KUNXEZ7br96VEF5Awv2
         oSwTpk/ml/SD/k/1eBJAT5fYIWoeJ3YF3z6l4zPWa8mXijdc+ZiKvy4XPzeWWV7xs8hL
         bfAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kLeLeR+ah76xi/5PrT+0BJWyrp4RC8lCrf6UVaEHtX0=;
        fh=F3t4BkkibGblBxW8J22QwoaFRYHq/xpcmDCvpG0JJcA=;
        b=C3MA22bK2/Z72K6deTETRxNpUZ7/SDuWs3JtJ+nsMKTxLO0WU1SwzTLV0GTFXyz0i9
         Xic7LWcKspQBdc060trDfyO/rUVPEZkb2FMJFy7tjoejTLRemrtsTrgUJXQvZKC+2F/k
         aLLz+2RiCmpXRsmgunRegwPYwEL7Bzx/oc2aNs5bwb5f3a2hErPf9tN7Tdb4sN5pggSt
         eZdfrre69tDoVqDtH/mEmQ1ce5aYItfG1XvK+aw3G0WKNb2dLnd0mISXF8+MEyOe0u5f
         97Y1ibEqF/fYoE/81otSfaf7TO7NbltLD3sX4Gsepi+VewHYB1GtmrffO8vPb2/m3VzY
         F1pQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779745965; x=1780350765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLeLeR+ah76xi/5PrT+0BJWyrp4RC8lCrf6UVaEHtX0=;
        b=BexcT5NUxfMx5ZU56XMp2pFMfdDsjnpU9Mp377YOaPXveFoNkDxE0YQqLIDG6SP3E+
         E+LbfKX4mjOyhT/881FpVOupstjSXdQ5Do2D/KTpLUcEG7h54j+xeDv16xnxL9u+/BN0
         WrVSVO2+SaFJRiPtbZeZ+9XA4sadF/yxh6Y6ycQfDZGfDIhwn9qN+xdz1kyT9OzdTO5C
         GxC9/7QGHDdLeCsvoQHCxfH+oFMwb8Sa4XSnMVvaXf7u6khDA1P3JDPRuEwJLaE2uXH+
         P5QRezAwJpFI8WfL8uIm5iqIdCFKsLL1Zaek1yia8g+c4S+cfvyEugJh6sISD9RXIS8r
         TOAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779745965; x=1780350765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLeLeR+ah76xi/5PrT+0BJWyrp4RC8lCrf6UVaEHtX0=;
        b=oD0qyJMvRGSWgHACEHdP2zdoV0ee7FG3VV906/kC+bBDy+PXTV9eiBXByIB4kbb63F
         rhVpe+XKmeHD/KQq8HkFYvAVYELiQp/m3E0wGIQcLr1WXf8SYhJoArRBRlo6Q7RMrTgw
         lfq+uCoA9hCTmDDCkaQ++sCf8I/8fKFkiBKZIvW+8pxexeWcBx2LObB5f2UlzPKlZzKI
         dhrK6t9qlVI225c4FEDz6AfMiTGtvitaFkdDKSPBnhFo9LY3JNyaIYPg3uO7yE4o4EIZ
         bGsNw9O1Eqgf3dSQzwhr8QsBUsn89lkWQI6NO7eKn3q46rmWcUXMTtjskV/GPpvTHKci
         pQfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8uKe9s2NH9hjJ5KnO+7VgZmKvp+9hbdy4HNSBbT3cBuOBh446EgIR1hvo6a52JgbPsIZjeXImAgxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx97me33+oXM44R/OupY5+/F59NPL6DW9RaArdgv9ENCv1RcQCR
	Zbr6F6vv6Zl5FaV6bskxlE+ffQU85tu44IYDzG+1Z5NFwk2gz20d36kTESCDt02D8xvCxJpvXP1
	groACSj/k00QwR2FMQwh6fVi9B/m3F7SxN0bJ
X-Gm-Gg: Acq92OHoCbuZJgfBhijcd/HFm6EFKdF6pgJo6jXljnqISTTbDQmHbuZIGTC9FB80gLr
	dHezmSLL7DEjpWVl87wc0bOgeYp6hIVnF1UWssjUE7uSfSIF+UFmPxEjzshxZ6JXgHqAJiPjiEe
	DcR2t34i0dGGNYtVxxvO55fXyXY6FaBjbDf9d4sLY2cd+Jmu4TFBfymxMdXQzGF7efT9SugUtKx
	CX3B9Jp2tg3pb2k0FXXDxQyuqyjZ4Nc3Elzzwybug5q8bjMVpt9UIU1oA6G2aLnFMb6M6g8AoQQ
	9+pgk8eMFCWKLEemi/HhVtsAnLN2IVKuEgc0fgWJ
X-Received: by 2002:a05:622a:15cb:b0:516:dc23:c146 with SMTP id
 d75a77b69052e-516dc23c2e2mr190040551cf.37.1779745965432; Mon, 25 May 2026
 14:52:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519095622.9541-1-miguel.martin.gil.uni@gmail.com>
 <87cxyj1by0.fsf@trenco.lwn.net> <CAJjvy-ZKGhQEZkuy0nD6PMZBXF75m25iGOJHHvBsUfaiLHXFgQ@mail.gmail.com>
 <875x4bz0fi.fsf@trenco.lwn.net>
In-Reply-To: <875x4bz0fi.fsf@trenco.lwn.net>
From: =?UTF-8?Q?Miguel_Mart=C3=ADn_Gil?= <miguel.martin.gil.uni@gmail.com>
Date: Mon, 25 May 2026 23:52:37 +0200
X-Gm-Features: AVHnY4LPI9J-7U8YOeLzpXSvN0eFj0FXTk0spwQ27FwX4WG76lheeMHysjbVJ6c
Message-ID: <CAJjvy-ZE0Qb6=8Huciq_cF3O_3j-7WbePQY4XD_pQT_-jDOPsA@mail.gmail.com>
Subject: Re: [PATCH] docs: md: fix grammar in speed_limit description
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Jon. v2 sent with the corrected Signed-off-by in plain text.


On Mon, May 25, 2026 at 10:41=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Miguel Mart=C3=ADn Gil <miguel.martin.gil.uni@gmail.com> writes:
>
> > Hi Jon,
> >
> > Thanks for the review. My apologies, I will use my full name.
> >
> > You can change the signoff to:
> > Signed-off-by: Miguel Mart=C3=ADn Gil miguel.martin.gil.uni@gmail.com
>
> Please just send a new patch with the fixed signoff.
>
> ...and no HTML mail, please, that won't get through to the mailing
> lists.
>
> Thanks,
>
> jon

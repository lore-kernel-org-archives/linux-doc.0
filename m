Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183523B18A
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 00:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781484944; cv=pass; b=l3Z0Svl3amKmCy7RL8ok7KLHhoAGRLQxGNJj/bXReN4JPmSysW2mPVdmceBgTRwD6SUlLwPPxWkAx3vS6RVRK23beKd42iPQBQp0Vw2Dowvbl+xanFjkcMofeyGac9B7gj1vYpY8DLeGgmBmwchl5WN72D4h4w/S202pYj7z//k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781484944; c=relaxed/simple;
	bh=B38+V2PeG8lhCVJY7RDcnmbnHoDWtBCLg6m3yTZY9Gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AdNqHzdnsZ1unlV7sIZQFWn33E8Vx2UjxTsB604FYLnvbukJ1rAa9RYQt+KxzMSpyDVi/69Bos9cDxmr6Q1+PUTzPWcXjfhdrtCkYJRQCPnRaS2wrVNBii255g5OOOXEGb992apvBRX4RHn8FCRA8Z8+Sh19CBrScmvMep0WKak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5nHX3BF; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5nHX3BF"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so36428186d6.2
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 17:55:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781484942; cv=none;
        d=google.com; s=arc-20240605;
        b=MSXW2vuv0xGMP0cM5V3APKDZQ3wquLJMSHmLUcWUxekHlHD5Rgme/pONhtcBQG0i/Z
         R3wU6eDSUGlnalGBn1M9Dgykx3r1FIM3eIBxReQl+jB9xsZu+pRv5aOiYIj3oxCWMQjG
         FtNxrK2V20MqwmKhJ0gHiPvXak+b3DUDGC8Fvj/Y7EjCniVpBHLC8/BbrNPS/HGDMwdM
         6apZkUFTvUAdwVJObQnAhP56vRCoAaEWpJsZvhPH/3CoB9H5eZqDuBKdydTwHPNsQH5C
         /FwmsD4zHeHmrOtndmONP/zWrKhTy8ViwDeQ/UyyNzxG9XgNsXxK9s0E5PmmaLuzeS8M
         PJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kVCU7mycdXVDj7GL7PlUyRlirWgnwEZPy2L0MrpGPT8=;
        fh=nUu4CGi9zlJ2wICgSoLCa8fVfp0D8oR8s1oBXTt5U6Q=;
        b=f5b5QhhQKPj+f3aVkG74b3hBRZj+Ga2j/hr4fheCmoRBFPlpLCbYBkrTF99zs7e0dJ
         ofnEhtT1J8TXiePjO58AqYUNLV9cfZ4MuDEDZ7ZN190NRxyVKQSDolvHrtrVpEdRaEXc
         GvaSpoN4ll53SxevthZk9U8VzxzH5wuMRzxs2CrHBcohkC+I2sKSEVdjGciMAXSuOIdp
         vfy2gYjAQj8Qvm7Bn6bFiczfbpk0V4zIdQ/R6DigavVNZybSekdhOKw3sfjtjjwpeaLW
         PsbPRJqQtPb78jdBzu43Ex9VpI/kZlP7W5F/yNgEdwEq5qN1+ZPndV+SVHtrm04Vj3Xu
         3lKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781484942; x=1782089742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVCU7mycdXVDj7GL7PlUyRlirWgnwEZPy2L0MrpGPT8=;
        b=a5nHX3BFfpQtwW+1V47TxSYFGrHR1ykVH9XbevdbAf17KSMMNsfBG81VPK3AdcOixB
         JWQb+roFr5lQ9FCLa7pziX26J1IhjugSVWRmN8mBkgAXsP4YFGrV0orNru8ahtldZf/B
         Fw4YGw0KfIH7XjSYTLuxqe4td9w4i1iwAgt3CXAku7jOK4+cdJE3Bw6ChSNVufH53M9k
         ad08N0O5hpiiur5ofPBfuIkycF8xZqlxFnYir+EbljwVKn5Uz2vtEGJIX/Q/FAJXVx8j
         f8pjBaMcA/EMoMuv8nrOnyoD4GsKkMaCvfroV57Budh2+jp+sa+LezlEbnlYCWvhVNx4
         Ihpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781484942; x=1782089742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kVCU7mycdXVDj7GL7PlUyRlirWgnwEZPy2L0MrpGPT8=;
        b=HIKp5tbjz2zBljV6ZJ9LIQQgyIsAmBspn79OooP7wZjfIswg05Kv8+p7GrbSWE6mNN
         Dyy28mPtKuSYiOrTgIEQWABNQEH8PyzEqsgPrEcWvgUvU3K3nimvHaPZlA7917r0AYId
         dM/QM8EnbxTej82vNfscYmg5Mvn0zAODPYwYo6q8RTtpfqGqYVql4LL3ZM9AFQteHqaU
         CZ+e1013DORbErIIM7PCrOOD6oiW/nBItDAVi2WRp8Ra6f3UxdQ1KuoKONWHQ10gQahe
         PX+5Lt1hWZOlPS90ns5QF3EN9oHRPEaBgCe26l3Te5sDi31vEYSjMkDzfv8ZmmWnEKyX
         zjmg==
X-Forwarded-Encrypted: i=1; AFNElJ/C5ncEheb1Mqh2IVJcAtf+uP1f5Bc6DzFGg38k9UX9PxoGAhva3MU1RmMSdK/O2PpN/+W0586S1wI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz39vsiCxq3OpwXk6DHmVAnPRIfISyKgAdPSYTr//2Bn4fJX79t
	0PwisZChShtYC4vhkt5Sx6UUrNF8mIe/club/wlChucM87WOU3YycDxO2twtmKsoPzqW13//3x/
	TodlqyBnxaHbkz1PkDjMIttiOnhXfB5k=
X-Gm-Gg: Acq92OGcdnStS1YPK9bYpf8B6mCLKcNhRVVctU1O57i2n1nAo6pY7O7XNO+9hsbXFax
	KPEjbWI+OXU4Et1GaJJy2lXB8ucsocFj+1lpr7Kh2OSF9sl7peU+HV0UFoI7xOAhJ/654cs+LYL
	N+3kzX39DgV6YueaJTVXQamGeljXYPyWZlqdxIXv7yKWtTRzQqelXP3NNtLbIz29RjjRM/WYEWn
	o9nCWUvU5guhc/0Q4nYYXnFik0RykCv3TaDW1t+zG/AsOO7EGTLvL9LcLcIgwbH8p7uCMb+6gA7
	xC69AUyn1QUs91bMG49lMLVvFvz9lq+tI4xueLVc6E/5kfKu
X-Received: by 2002:ad4:5c67:0:b0:8b8:726a:74d4 with SMTP id
 6a1803df08f44-8d32c010d01mr225123406d6.16.1781484941998; Sun, 14 Jun 2026
 17:55:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614234320.8199-1-amandacorreasilvax@gmail.com>
In-Reply-To: <20260614234320.8199-1-amandacorreasilvax@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 14 Jun 2026 21:55:31 -0300
X-Gm-Features: AVVi8Cc3uSPRIaX8r62s4W-khrIaNACzt6qM1w4gZfB22VXXYctSn67lFkoYWZc
Message-ID: <CAMAsx6f7G=m3ee1Ep-NJSEnTA-7jQexJs=wGTEaXsknWXrq13A@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: update minimal software requirement for
 pahole in changes.rst
To: =?UTF-8?Q?Amanda_Corr=C3=AAa?= <amandacorreasilvax@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em dom., 14 de jun. de 2026 =C3=A0s 20:44, Amanda Corr=C3=AAa
<amandacorreasilvax@gmail.com> escreveu:
>
> Update the Brazilian Portuguese translation of changes.rst to align with
> the latest English version.
>
>     Key changes include:
>     - Updated minimum version for pahole (1.26)
>     - Added note about kfuncs annotated with KF_IMPLICIT_ARGS
>     requiring pahole v1.26 or later
>     - Changed "optional" to "opcional" in the software requirements
>     table
>
> Signed-off-by: Amanda Corr=C3=AAa <amandacorreasilvax@gmail.com>

Hi Amanda,

The grammar for Brazilian Portuguese is okay.

Thanks,

Acked-by: Daniel Pereira <danielmaraboo@gmail.com>

Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921D747A0A1
	for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 09:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768987198; cv=pass; b=CrON+h6dxZp1cdbxRcoFVpbe16yYLeJCp96PX7MY5dRLHGHiNWwGPgPD1lQ/tSmhhiv8tMoK8Hq5R5hVB8K0oeMAyhu2AUSt0ULk21yDiqaC+38EMj+e3MxoIxpmC/Aq0Rk6sf59XmMZZI3ZnCuvyH8G8QHMJF4dWBy9o2Zp3Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768987198; c=relaxed/simple;
	bh=79b775lMvczPPQ1sCHPV9x0iaa287H0D0dSytd73Qv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sUEO9BovBlLhKKxUpn+G+OInJrAfZW2B9cZKTdVySvISxhdy2qufEz6xLxYYoXMIDafS54BlBL3dCWcvYRepkzGy6QfYOV0Bk+ZN//CojevhW43EQmTGh7YyOer0Q949wBtda55a3PyhwT+gHZ41R8YjjnmTEpIffTggUYwUj1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jO7q7wal; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jO7q7wal"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59b9fee282dso6337601e87.3
        for <linux-doc@vger.kernel.org>; Wed, 21 Jan 2026 01:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768987195; cv=none;
        d=google.com; s=arc-20240605;
        b=PJsF65DHSwOaLDTcK3iZ+84BKn/vllM5jAWlvHuqnFmck7hytpmbTetE96BNhaokZB
         YMfdU6eKurz/sk9uVfFmYkV/7yN1zI0J+8YhfSFhOwOXrAQ9pZwUu363J+hB+vXsyKOi
         gP4iG8y6rWwdw3ofdP/j4i3C8mLOM4QV3Z4qfj6NV5Geaa2lmZCVrjS4USdpxlTZx5ao
         tpYTJUykDjIavp8yhMFuYMT5zQmT+/rQrW0NGTZs5YRABmppQugXM251Wh2q0niPerzp
         fvk4j2CYzJQUp6mXVwzbh1NadMLoxGrLSH/nAV+mf51mI6luvN0/6Nlg3Zkbw2Q1w3Rh
         YJKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cKTgJE3f1vXR3wpOnVsDNv0ntd16ZnwfsXCdqjWFLU8=;
        fh=lWm2dqEUmLiZWqY8bwSKr5xNfxCN1QGPP4Mtn07ZqQ8=;
        b=gMbrCo3twPfZcsGrE0dAr7aoPSiGt4/cEu5P8gMkV0oF3u4eQxsiyDgUF2ErVJ+iEu
         8ApDKYCqMi3QcKW8nNGVdEw9NcNCNr02ukgOcKPU5+J2gfXTOE77tD52PuTCR5IdHFRi
         mMnMtjS90mMqL9s4V7MLZSI9pF8uebWMsMnJhwS+UFvJJ9fAaelpRta6wd75kQfDm+F4
         zkuAG3jOF4hT+/Wkyz9QNKcOpFFRaiozx8zYMjgIPI+Hn8lhxPU2EDNuPDfTwP3FucNq
         9OTehu+HMKn/LOpT6itmadQPlM1JlT8uzC+fofdq4Ws5HNAK3yjLLfi7wgfLcJHxI3oz
         pdIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768987195; x=1769591995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cKTgJE3f1vXR3wpOnVsDNv0ntd16ZnwfsXCdqjWFLU8=;
        b=jO7q7walxoTYrTV55gj7+zFq7/mMJige3Fi0WbTJ3uSmRNVKHXH/73RX99yEC1SoIT
         p0ZTk5wUop33HwM5CF+4aFCVnx5PTBh+OX7JmnDBk8JFzA5wZjndbqZULYIgG14SFKmM
         X8+c8y/dWwSeBcA/yabTEMSIs1IfTZguop6k8EAoXkNRq+swbnxzqSCeOjNRDknjTvw5
         B5Dad1l62CHw8iVU2V+osk/J2aIGzvxGz//VaeP5TTsZ4uVBAheXgswQYeJFz5OhDmMS
         tlqGzLaWBZRnRbNez19uotw0j4YO8wVG1pbcYuWwj1ucOMY2ncqGwwTVoZns+mhXsK6h
         YZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768987195; x=1769591995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cKTgJE3f1vXR3wpOnVsDNv0ntd16ZnwfsXCdqjWFLU8=;
        b=X/tOfYk3pwTmmqz5B3jguIuv/YAJ28G/j40sYvz2yFDoWdX1MkfNI11aMw5DMcbfdJ
         0KmkAiiYvyMTg04Qq2pg55cR6GkYBWKKHhYlIyDSIe901paW96ELd8mZB6nk+4uIkU3A
         iiwUmMkd9YPGGZRPqbv/6lv/7VCac7ZQR8paUAP8WUljuvYERZBixQHDNB93zNYS8mbt
         aa7gxdDPXwrzE44TlDgQUQAZ7lVr6bpnmh9f0SVGjXCLf4Z9QxeeyzS00Ufq3ZkZFmiV
         PBD0bgnHHOCxgPRDpYQ+yqbjqAWajtvYXZ1EONDnz/8kwfaDunrHBz4xniMrGg94BkGi
         wM6w==
X-Forwarded-Encrypted: i=1; AJvYcCXQhhxifQbZeere6YDpgjt6rhPbgmyt0p2kHU0rRv1LvvvBDxpIRgijxeV5PKooN+OGZrBBEPNEcuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQueCDADdclMnZnjQOiDmEDjIAjKE7X04S9722Oq51q+V7VPG
	Y9382KZ6BwgNPXOAaJ3ot+iYAlvWQm+zEM62Z8B2sOKK6/gpgwVdvP7VKs3qHYW/yKV2asECrp5
	MuYYWhgM3UEIvpHJesVvQOFTcCjc1fzo=
X-Gm-Gg: AZuq6aJa0Sa64XVMuFuBwfQcZ1lyzSTsJtouwYkNhBy1SA9CklI2hcM+kSA8wk+JZs9
	FcD0J3j5NucufCJUoydPd97mPK7jg+5wUdpVL2ir9QmjDFCEy5jP9xTmDXT5SyhEKWfAAvh3U7d
	nnmy/TMm2xffLbqV0XBGk43rrRIPdf4fXvLGUj7plN7Y3MlmSk6lKjdTvI73G9jLnOQXIvSmjd8
	6Lm/StomFi1DYAIslsY5CDsKIv03TlYkKiKikgkZ2IDzDiIdiWsuIGwvs8Q+Vi3A1FqGPOBqNho
	n9FB4A==
X-Received: by 2002:a05:6512:3ba7:b0:59c:bf2e:fa15 with SMTP id
 2adb3069b0e04-59cbf2efb55mr3787256e87.5.1768987194335; Wed, 21 Jan 2026
 01:19:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226235101.106451-1-vishnuocv@gmail.com> <20251226235101.106451-4-vishnuocv@gmail.com>
 <aW7Gh6WsTjVo5IO_@archie.me>
In-Reply-To: <aW7Gh6WsTjVo5IO_@archie.me>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Wed, 21 Jan 2026 18:19:17 +0900
X-Gm-Features: AZwV_QjqEORNJ_8f-MFBPABn9dnWmNGoiIrX3uwxX_lcnvbIxZvfTJIMH0UgnWc
Message-ID: <CABxCQKuF_1w4iGwH4DVwWZSo1bfbUui8U_RenGBj8JYeCzOG9A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: dmitry.torokhov@gmail.com, hmh@hmh.eng.br, hansg@kernel.org, 
	ilpo.jarvinen@linux.intel.com, corbet@lwn.net, derekjohn.clark@gmail.com, 
	mpearson-lenovo@squebb.ca, linux-doc@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, 
	vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bagas,

Thank you so much for the comments.

On Tue, Jan 20, 2026 at 9:04=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Sat, Dec 27, 2025 at 08:51:01AM +0900, Vishnu Sankar wrote:
> > +Values:
> > +     * 1 - doubletap events are processed (default)
> > +     * 0 - doubletap events are filtered out (ignored)
>
> Please separate the bullet list from "Values:" paragraph.
Acked.
I will update this in my V6.
>
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

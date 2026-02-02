Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BCC2580D1
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 03:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770004656; cv=pass; b=V65jijpMaKSdp0UdblQmbPLMrOtPaM7ZoJ/MJc5AP9mc9zJAtsLd3E4qzaZUKw1fYMUvIXctFobA+tri8zn2zXf+sAIU4ILelmsZGmCSnkiHE/S1U2AP9HEM/5uWBoyrKS8Fc94tv5N9a1D+EkSR7TCeSSb+u6R8ZjQl+lYSZ0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770004656; c=relaxed/simple;
	bh=NQqxDajhoKEjVOw3sQ9GExXSu0a7BSic0YieJ2RLuIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O+kyF36xRXavmuB6Jw2Md1ItCvIq/qfT6YbJ+9Zzid5xJydWu7BA3I3/3jvzJZiRH5vMJyIxU35dYL42/oHlIYYHhGXXycrvzAuoIPseqss4VDbfU+RMnYiE4/7gg1suTJ6L7/CzQ8D/9MCVJNzLPby9mTPE3xx24caQn2EuDdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEOxp1Ft; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEOxp1Ft"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38316445a67so34248911fa.3
        for <linux-doc@vger.kernel.org>; Sun, 01 Feb 2026 19:57:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770004653; cv=none;
        d=google.com; s=arc-20240605;
        b=aBzUU6z4rt9h74uTyLDFUC69r9Zvjz1ylqP/xBcIffelFWQS2jASlIVbMq9I09hvye
         sO9aNqj4fYJ613xH+4JXd0F0Az7SsL7044/fEcIzpzyldzCDGldGIcOlLTyEkhpHLz9Q
         zN6jjoz1tzkZPM2tGbQKNV+ySSaUwXKW2FIIvRMV0ViK29sXGrjKem4rInovzs6nfXyH
         WvEL1A12eJaGOCco1WRm95rPppcuGvbmy090ScTJ5TVoFqjY3+asNH8mWozSWI9pQ+m9
         XmrINTYtqcSho1OyrmfNq+/aAHEGmGav3pWbKJVUbJNdimbIBauNgm0tAsyPi13n+3gM
         WGBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4KkZHBfEV4LhZKQypQJPlt0kdlnTL5wPT8BeiQYjtYA=;
        fh=ZRl5dYAhArLczeY5i8RoBCtxMmzzTKuJy59bZlpjbNY=;
        b=jvzBSUeryYjbZ+mM3PVnAzALe6UzalCu42sHngsxstYZZDhjuSByuka/I2maj6+JWR
         hNVTzY8ImSGKgEHw+ZPsKe0un+z5LQyjuCTg3l/tcFFcXAqrYL2M1mmb3RZeMSw9azn+
         QdpnP9AiGcVpDLnE79iF+1hkfk07JkK85lGv1R9oQJOLMWQv1EiymZ9Y0xYSQ/Oa8LJ/
         BgttDRrLvuukgd0KH8AEVKPwmWDYFYp4er/1qQPSD8iZLVgY8GniVciKhF3dsFMYPLbm
         m6ytPwg6XI0gPaMkeAnOQAom1uavXzKamPKP5WRnTEAMA8EnyqoZwZDw8/hErFcBfTvw
         eChw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770004653; x=1770609453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KkZHBfEV4LhZKQypQJPlt0kdlnTL5wPT8BeiQYjtYA=;
        b=BEOxp1FthZYwzVsjC3ePN3qNwM9mOoVDh0+qt7oD5lnJy4pHpX9FrKZzcMnNJDF/FJ
         zRzGosL21WU5OIZj2nN6YX0pWYCwp3Y3iSzzBjd65LVlu8TjRwbcmvPieSBKYrwEMI1b
         Q0FrrK4BNque5MsBC3zv5B4un3zcSrXS4e0u5EAn5WSA/q932q6LDBVC0GLkYz36Mzx5
         JROd+FSP61law8b7xIDsEXC6RC2VSucP6wBVssC7yeXxE7ln5lb6taKApV2MzXbwhjqM
         Cloh5AbGPcsvBLUSEqifFwXdiu2nH3BRNjM8W+kUBQLk6QCtO1xzx6ZB1X52xe8wxiDb
         ReUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770004653; x=1770609453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4KkZHBfEV4LhZKQypQJPlt0kdlnTL5wPT8BeiQYjtYA=;
        b=g980AQD7gJteSN8y8X6I3amVboG8Y6ioEOHHMWJ5CmRxt1JwxG8dV8IWB//VNcllaq
         uUHYQfQ99tCnosyVcYRV6f6r6/oJRy2SmTZNfedZMGx05mQ7ySumBneg6jPm3q+MYtmR
         CFL0JlcGcc5wFWL961gZVGFlnEgkjJJrK08L4CulvcIjIYqsYfyZAmqhXDJ/M5SPAZkQ
         RDquL1ChvxdjJiZq+rpf2/IpVuSiT7Wj2XmSskpjF1L0YfbM/8Kebc99mrf3r0zaNe+Y
         ldplzoOTAIxpEtIVCM1A/vz6ENgTVHSiDpMW9p/rdbZkUQW/7XQFpTK0I2LQbTcQu0zD
         pm9w==
X-Forwarded-Encrypted: i=1; AJvYcCUlA6O2J7uZwNwD+RxpQcxcJgtSCudd/DeQIzHHvqRB+QrRboPIsFAaASNIEWRRXTWUzGbcWYGiAxE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB4fvtaLmKw6xJLuccJkW8xJ6TTJS09+U+03WCfmWynR+qgylk
	6lcv7WGhSt2nvj6qzJanPT2/HOSnSjS77mTOaUFgkuGzcuxMGsooyxTILGc72GMxYJz9Atb0t0+
	Z/Wif9DS1bIFHrIy9Py1e8CzQi08txpY=
X-Gm-Gg: AZuq6aJYtjE62ULAaAAjao9T+TAYbSlxXEgTSbKL5EMYkKp8Tj2minY7Brpyc8fqWL5
	XZni1oe+vDtzpa82SVjNgU7+Tf+z66j+LjndO5FjLvPKXRcsjh3nwIyVU3dvcj8UNct8XdiTYyk
	dhxw7vsoktte65PAuBkZlJczl+l+CJcWYpO274HzvrcnPplftA0Fp3sMoOSGqgSBHxeCiaf+msN
	CVq5c9EBp0M1jJEEMPVPB0w9ovNZhW94vPYJA9is7X5oCcqyPrGxUjceKNXS5106Rf60loe+lJQ
	YdM=
X-Received: by 2002:a05:651c:1c8:b0:37f:d484:599c with SMTP id
 38308e7fff4ca-386466b57femr37828881fa.28.1770004653148; Sun, 01 Feb 2026
 19:57:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260127103907.20269-1-vishnuocv@gmail.com> <20260127103907.20269-2-vishnuocv@gmail.com>
 <aX8JwB7F8_ypJRAz@google.com>
In-Reply-To: <aX8JwB7F8_ypJRAz@google.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Mon, 2 Feb 2026 12:56:56 +0900
X-Gm-Features: AZwV_Qi7tToR25uY6WlcGtxk-3piw3C98qRUN3Lr-_pA-7htZB6yfNnoroFq8-s
Message-ID: <CABxCQKtW5hnTdo7eojMCDyN_bFK3E9MSmacTA=sD+xLYVF279g@mail.gmail.com>
Subject: Re: [PATCH v6 1/3] input: trackpoint - Enable doubletap by default on
 capable devices
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mpearson-lenovo@squebb.ca, hmh@hmh.eng.br, hansg@kernel.org, 
	corbet@lwn.net, derekjohn.clark@gmail.com, ilpo.jarvinen@linux.intel.com, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thank you for the comments.

On Sun, Feb 1, 2026 at 5:10=E2=80=AFPM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
>
> Hi Vishnu,
>
> On Tue, Jan 27, 2026 at 07:39:05PM +0900, Vishnu Sankar wrote:
> > @@ -470,6 +509,14 @@ int trackpoint_detect(struct psmouse *psmouse, boo=
l set_properties)
> >                    psmouse->vendor, firmware_id,
> >                    (button_info & 0xf0) >> 4, button_info & 0x0f);
> >
> > +     /* Enable doubletap by default on capable devices */
>
> This is obvious from the code, please drop the comment.
Understood.
Will remove this in v7.
>
>
> > +     if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
> > +             if (trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBLETAP_E=
NABLE))
> > +                     psmouse_warn(psmouse, "Failed to enable doubletap=
: %d\n", error);
> > +             else
> > +                     psmouse_info(psmouse, "Doubletap enabled by defau=
lt!\n");
>
> Drop psmouse_info(), no need to make the driver too noisy.
Understood.
I will be removing his log as well.
>
> Otherwise:
>
>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Thank you
>
> --
> Dmitry



--=20

Regards,

      Vishnu Sankar
     +817015150407 (Japan)

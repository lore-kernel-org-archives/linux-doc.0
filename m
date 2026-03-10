Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1082D7DD2
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 01:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773106685; cv=pass; b=jdkbeAJ1MGxaI1GFni+vwQ5sQnPt5lJcS3rxqVBzcT2KnWgGyJwteawypL1DBtwqqxhCwIkzT4+Fuw+98w0sAr3bXyQSHniXLAWJ/DGpewTbbrxGaDJHFtVVwTqBlQF0byatp63hcmIhnuBZ0lqap2yoiZn17X3DbV5R6+bTL30=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773106685; c=relaxed/simple;
	bh=hYFb+CHAPoD+FxG1b0ogsBVr7QuNFxqc1woQT268nfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XHeQf0YVD6aYn7NRzG7s9I0QnNbgx332/o5+dyNj8oNGGdnRrNzF5Mo4s76rxqGAMLx9lErAenOLS5d616m8yFhnc5Stk7nyq3yh9VsjpXv5fhBFDxM25qDDJ0wKGrlOBa/9tTVHtGJf1xITPtUBToC6Sw7ldr/3eX7S3ohC8Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g4aEi+oo; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g4aEi+oo"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a13d6a2d7bso3163503e87.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 18:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773106682; cv=none;
        d=google.com; s=arc-20240605;
        b=jxf6xdGE1rbxWJlGmurKHxKkeqAEgh3nxHb4TKIkL0rzen4d8YYYeXM3oRvLGEO1g1
         thl3sXIcxIaVWTSLYZTTj9lBqrwVRYVcoj5rwToewqo2ZmSayvKV8yH+80epTpoLpqK2
         t1rN5pNi9ULtadX1Ld2dEzA/XIYx4JdzsMb7p2lXa+Yr2sgGIQocfvFZvKbrZCfiDGZD
         IWV2jIe8bNK4J0elpPuA+6qVpXsrOUEZH1rOflXyx4ZPiW+uiOx/D5rmWKg/89X6krsf
         Ut8ZO2YtT7rAFz43ZevnUIVNRXT7HB+B8nL080NDsCUzXC5llleqXYmMd7/X52A61hIE
         aN9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5JD0I3h+Bg6710KUeP09U+MH0kWId3jo7xnuY4+fPZk=;
        fh=MJldmQKDj26tWhuS3ZwS4thZcH8HWqNkM+6PZgG724Y=;
        b=AGbhAA4IezQnNDQ/DoUEWZ8j/jF9B3Ts8M1C9Wh9FmFhEd/g/Orb8Ybjslaqmgncap
         +yAEakJGisjfqGqWXkPvcD0NGyczMxhS5tQKsuJgC5UfrF1SdMop4r+lz6vU1NleMMBa
         8lTcJEXEhR687F1tZZ3Wzce9d6Q9LV6tJ5BZyxApxLnuMXjQgpjm1Dge3Pd7AWufZ8lW
         x7u3HvfMe0oAAxLJ75Xm77It9F20AayEFXhvdVO/8woKtMcYnjAt0I/brQFsjBqsyglL
         37o86du1SHt2c8MsEXuZ7dGIk2oKYhuYfp1rm0Pzo86kh5+ZIyeKUTZgSKt1AKQ3dnlA
         OD2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773106682; x=1773711482; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JD0I3h+Bg6710KUeP09U+MH0kWId3jo7xnuY4+fPZk=;
        b=g4aEi+oox/IZ4wgYJwBPu4j2bwQdlaV3Dxu26cJBM+bQ7FtnKBxZSVJjMbXYqwZCUK
         XBdV9QlSiTgD0D7zk+k6HdhlgB0Dk42lvcH5NJPImRUFr56cHZnH7lPz8iGPRN43hTQA
         7QQTVEyUm7nPHOta9ZIPvKLvSQ/bwydjHyQgqJ1dsCid/pUnSnbgwqZdBu834QwRRW3l
         4TzDwaR3ypktosXCk3JWmNVGiIiyDTeGI5gDsnlLm3Icn8dSja4RcBXQIBewp6EumuI0
         QRAaMRAMEPBe9D1JsXkFDPBYWGEIx+F12iMZPAcXJtxBjMHXcmLTinFm2NOVi9jYNttd
         mhhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773106682; x=1773711482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5JD0I3h+Bg6710KUeP09U+MH0kWId3jo7xnuY4+fPZk=;
        b=KBdDKfpHT3MgbRagaJP2ndhV87YOS54deIE6J800g5pEDpG4Rfm8zWuVw/UkEqg9M3
         Y25YLaffcOWYF0gAT+EFNwQdcvlNMIyozrl0BaaD0q4oesXB6MljXIcmNWKZVe6pfjfn
         zzgje85tP9A8in6aJgLcD+Rj10hIRaHvM3G7HpihiD0ZiD4eWxlf7GoPDUVFBV1u3hDa
         DU6i1tCLLygegKlDj1Feyi2JXqTJlbdkKl1K+tgY3kAytge9ZuP8N8EcSdfGPMBk3kEY
         nGhsSP/6S8NaaOGFQAdAISGgbHr2EKxwUZDWHItTSA8Pwtor8w824wSWT+sF6HmNbiRV
         oqIA==
X-Forwarded-Encrypted: i=1; AJvYcCU5CZrXqHzQNUk7gWqOzmnj+Jmm83QpfT5cT6oUfr1W+uxEOrbrDR0qMePTadeuMN5tlXLECttzoQo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjbr++jJo8a6UlDC/Q8T4L4EXdGTp5HyGqqIwtSYA1xRvLhzU0
	Kw8Rj/YLhgw+wzzJiyz9wAkV8bQS6N5q8O1zRuF7EUeV2ZQWrcKhYGIHwGtu/6IAeUrtmTLxNZu
	DJeMSWwpwtEtpxdxxZp8lH4Ti71flSEU=
X-Gm-Gg: ATEYQzwRMAUp0+Ts3vN5nIRaU1EVqq+Kl9FUCMq9ZJaQhf8X3zp67poxdLkiZ7pWkOw
	p3q0u8ij/fCmuQCMCX3Y28HZQiYR2vRbG7wRJrYppfeGj7CKZqSXVn99F9T0L2yRV7Irv+5uSG1
	ue70Hq+6Ki/1ja4+qFYvtXGK1BJF+DZaOkfblvDZ9FHVV8vLO0u0tuhsmYus3gc76e7K6n9clLc
	+dbQbxH8Eev7AehDGp3X2iT+hUdLM+rDSBc8O36jKObbZNMtOi+lqasnKn2dUlRm+JVu23cH2mO
	/nog
X-Received: by 2002:a05:6512:1193:b0:5a1:3561:c6b0 with SMTP id
 2adb3069b0e04-5a14e46db0dmr517828e87.7.1773106681940; Mon, 09 Mar 2026
 18:38:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209063355.491189-1-vishnuocv@gmail.com> <20260209063355.491189-4-vishnuocv@gmail.com>
 <991f8a08-7c5d-5611-7904-6c5d336a74a3@linux.intel.com>
In-Reply-To: <991f8a08-7c5d-5611-7904-6c5d336a74a3@linux.intel.com>
From: Vishnu Sankar <vishnuocv@gmail.com>
Date: Tue, 10 Mar 2026 10:37:25 +0900
X-Gm-Features: AaiRm53P8wNeC2Lcw33Sa12VDuTovyX96CkTJT3bZYRAkHoVY2iDwuco_s3ogyU
Message-ID: <CABxCQKuojiPhY1J5XSEfiMaZFjKQLk14+n9TV05egzeWMQic0g@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] Documentation: thinkpad-acpi - Document
 doubletap_enable attribute
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, dmitry.torokhov@gmail.com, hmh@hmh.eng.br, 
	Hans de Goede <hansg@kernel.org>, corbet@lwn.net, derekjohn.clark@gmail.com, 
	linux-input@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	ibm-acpi-devel@lists.sourceforge.net, linux-doc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, vsankar@lenovo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ilpo,

Thank you for the review comments.

On Mon, Mar 9, 2026 at 5:04=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Mon, 9 Feb 2026, Vishnu Sankar wrote:
>
> > Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.
> >
> > Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
> > ---
>
> > +        * 1 - doubletap events are processed (default)
> > +     * 0 - doubletap events are filtered out (ignored)
>
> There's something odd in space vs tab here.
I will check this.
>
> --
>  i.
>


--=20

Regards,

      Vishnu Sankar

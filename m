Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB113A48D5
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.180.73.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787067248; cv=none; b=Tx2Z0ZBvOLvzdVBSqdcVtHRnbdAcKQpRkAzNa75/JgrWC4G2HooMnnumGW/gEXX0C4xR49v5jvZ0bQcS7DPpb2TznKT0FOVz6VT71eu+kfOOGL8/PMIjMTHjeSuhkESu4LBrzP2Q7D+i+aB9LCvXKop1rwmou+UWHkR8RBPHR9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787067248; c=relaxed/simple;
	bh=6HnqJVNnO8fbVCbtUOQtItNQMwwlBtU8Xk8AKwaY/R8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxhu/3LFeA4201kz6rvQ/9+/Z4/17yqqbJLzYU0QgvIXvwS/C5v64MFo0iX/59wmNGinNlB13Fs2ophSLkCgxYvP8+wBFvqmyO5vXQUVwPTo7chRiTKLFbA7sEi/IqoINwI0bW9ZXWsSHesqkuAtN8ioHgbiq2Vxbg3om/wxp1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=G1sPNRbR; arc=none smtp.client-ip=157.180.73.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="G1sPNRbR"
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id BB6AD3FE01
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 15:26:45 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id 13F0E3FE05
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 15:26:44 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id F170A1FF9AE
	for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 18:26:42 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1787066803;
	bh=aOuj/+W84x2+rIHLSDGB0H4BsSYWB02IXh4muXkVl4o=;
	h=Received:From:Subject:To;
	b=G1sPNRbR39gOCr7i76uRkrPxfSlwzq0bprxbDHGLNA2/Mn5Av5QMcse7omiFpuhIg
	 uUCxPKAzGP81xIdkmtR42vmHq4V54pU0XhLF1KC7Ag4fP3U6jwAoXkh5HaPePvd52N
	 gdWJykOea9jrWbyAGv42aSmHVnT+ATQyF5tmr2KobNiBlZVn98mw+DJY/ZVPDBmBvF
	 ipjiZqsts1GSUPeeHzNWFnpfrS+Qki9RS1+MWG1/Wgh3vnKFXSw9T2e0KYcvuWRNDn
	 JP2JheAyn0Lz8ZRhfW4cXdqvWp1SPc85b9XU1FbSG+RPQ9y1IUy6B0V1pHFRpagEu5
	 GZ/NsLLggwq/w==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.210.174) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pf1-f174.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-8487214ad2bso91058b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2026 08:26:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RpjkqIk8SZwgORa9yZO0wfIFczPoi52xsNMlfMQwzSSSG+SGai222RcFxL0NASxcK0vsXDu2TuObgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgQ4B+hPzFhLSi+reTQjj5BG1dJYY2ygdO301t4Erh4AxKK7qA
	8Ke9PtsUfSvOzDE8qqkgLQU1Ttm30g0nqIKea1zAwazHJUJYE3btOOA84C7s0nzFa48TIynsT+e
	8Pv/yqSRS1r+0I9Q17y/9J25eF9lyHOc=
X-Received: by 2002:a05:6a21:2d4b:b0:3b2:a809:ffe with SMTP id
 adf61e73a8af0-3cc71a2d522mr45452060637.14.1787066801283; Tue, 18 Aug 2026
 08:26:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com>
 <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
In-Reply-To: <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 18 Aug 2026 17:26:29 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
X-Gm-Features: AcwNN1UhVCaNOkZFdVfL73RRF7zncaDflReojJs4T1XIHAhKKPfu3HJk5Tqo7yM
Message-ID: 
 <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>, W_Armin@gmx.de, corbet@lwn.net,
	hdegoede@redhat.com, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <178706680342.724246.14270643568292836452@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> >
> >> The ML patch set uses a guard within a switch case that violates clean=
up
> >> rules. Move the guard outside the switch so all return paths are cover=
ed.
> >>
> >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> ---
> >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platfor=
m/x86/msi-wmi-platform.c
> >> index dfb65ac8fbf6..33acd448f674 100644
> >> --- a/drivers/platform/x86/msi-wmi-platform.c
> >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct device =
*dev, enum hwmon_sensor_types ty
> >>      u8 buffer[32] =3D { };
> >>      int ret;
> >>
> >> +    guard(mutex)(&data->wmi_lock);
> >>      switch (type) {
> >>      case hwmon_pwm:
> >>              switch (attr) {
> >>              case hwmon_pwm_enable:
> >> -                    guard(mutex)(&data->wmi_lock);
> >
> > While I cannot see the code easily, one could also add braces to inside
> > the case to avoid this problem.
> >
>
> I don't see the code either, but wouldn't this be a use case for
> scoped_guard() ?

Hi, not explicitly stated in the cover letter, but this is essentially
a series on top of the series I sent last year but I did not clean up
due to a variety of issues with MSI firmware that would have made the
driver unsuitable for upstreaming (to my standards at least). These
issues span Intel driver problems, HID controller instability, and
varying WMI implementations esp. in regards to PLx setting between AMD
/ Intel variants, shift mode behavior not acting correctly, and fan
curve application / resetting being weird (the fan curve on off bit
does not seem to change whether an automatic curve is used but how
close the device alings to the set curve? requiring us to back up and
restore the original curve? half of the devices keep the curve during
sleep and half don't? but if the fan curve is so finicky do we really
want a resume handler for it? Perhaps we can kick the timing quirks to
userspace)

For this reason, I focused on other manufacturers such as Ayaneo and
OneXPlayer. I will revisit this series per request from Derek as he
seems to want this for steamos and hid-msi is already queued for 7.3?
Although, to be honest, compared to the controller firmware issues,
the WMI implementation is pristine.

So I will need to go through these issues 1 by 1 and see which can be
fixed and either drop certain features in the beginning.

Particularly for the fan curves, if we say that resume handlers are
required to be in the kernel moving forward, I do not know how
realistic it is to make those reliable for this WMI device family.

Best,
Antheas


> Guenter
>
> >>
> >>                      buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_MODE=
;
> >>                      ret =3D msi_wmi_platform_query_unlocked(
> >>
> >
>
>


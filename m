Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792553193;
	b=W8kFcI7Qi3uGdOcaxCVxgQ9oXTwJlD4/qGiaOTdRwEeXPVGG9PYb5RUjkGAR8pDe1HMx
	 rBSb+sqZVGcYNVTgNcQo9qboz66wktFf2qRPTVOrL6P3uWinpq/KIYWTVw5FVE0PrZ+Qw
	 n4OCw8/87UOagqvjsvmR+H+TX7g7WamlpaNWn0ow265BnLADOZ0GWXVchFdzLv465y78L
	 ruBJ/fQ4f8Z7+FTg3VXMwjoVD9X+tY3Ryh2LKyD1VGEjwbv4SZw5WnpC+bWfV/l/85NrV
	 ITnSRZjd0jACV6T/oMqYys8h2ANIvESE93P/nhFuAFfvT2jyIlbctcZQhWI3kUrdkkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
	b=ugidTV1yz1C1dqdv+q/auVV2j6hWrni6AKB3QG05sKE6GAtUuk6/XPkhqW29eSvc/E2T
	 azmlV/k8NoWr0Gd2OeHQPServA/jMwg8Sj1cUpTCXaOCA5JFCBCFtpLWmny60lr9KbusY
	 kMOrvO8Xxj7ez8dzdMP3/Q7//9eyS3GHIvFIM2QTHq5zbd8iabRInXk5BqtPximGhyK3+
	 DbAyRE1KXuClhQsZd6fN/+bL9D1BmYIVKVUAlU7/7FbhkeYnVy2/UIVt1mpNxz8pDsLZd
	 tiz+lzHlbvNOyhVrbORXe0ANkIPoU8k6GgRS8l+U9k81fn59cOQZLIHRYxGjPpv4B7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lOcwEeEx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AC5606B547
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 03:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69AC5606B547
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lOcwEeEx
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e901e114fdso1248785ad.2
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 20:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792553193; cv=none;
        d=google.com; s=arc-20260327;
        b=OZlCbaa5YLwZAfgQ3EjAah5SQSmZWPGtE1Qmbo6AhISuEDM0UN48HYjINnkhx8bink
         U0dMHmPRhjWCE7LWUk9taUOBI91TTWm8evChyuHEQ0zo16+LB1izFfPyn4lj704DkEC4
         nJpWcpGdC52CdeaO1D6A8GuaFwL5uo1mtHUy5Lye8bY777+79usO35i0AJ/341OSNZRC
         FEC/9t5vHRx3PsazWeQeeSufhqpPBxkOBaImi64brmvAZL9fxMoIOq1rlh7rlSW3+Nlt
         xpzxi6xhaVBeONdTyfY3mJ3sghjNpwi/ZALdCTFAueUwskENnhYyhSH7sBXUL+/+NXK0
         zdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        fh=IF/6OcbQ6KOPdhtmpBAbjXgCCGzlSXdxzCBZK8zWjR4=;
        b=YtSJ7p/dkT697JYRIQE3jsFh6r7bbXQIDRIL1B4FQ9USTW8O3NtS+DP9HzEQco3u6K
         uCBkLFqsk2Xr8U6+9eGGttMpyhijRKY/LaRUXekJS8+XEqIANK+S3K5Rq3MsaJfndveG
         zB/Pl9viInSzGEZsJQZALGGzqSx1weg/PDZxObwDkPMOUQTMvdCpWgMuZ6yzuS10cWyd
         4+7VBq4kc6tTh2l7J4x07MOEBeFAyFW8p5l3jyHPmF7fYcCMuyU7wNY3duxpS6Jvcvl9
         XtoeQO8z7EmPREgaNLBlCAfhUTdiMWG0Ld/taG5HbHaKkwBjOHBl8yCwx9EmtLweCcqZ
         REXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792553193; x=1793157993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        b=lOcwEeExZVAEIy9usLkBIV4yuk0sku3m9Y82hmVTKbhLuOlYNdNr17teoxDu7qO6jB
         vncGvDKOBjWc5ulwevD8mnmYQ2x8K8t0rq2y6zLbe6kYaiiWMJPeraxA7reUgy6xVaDv
         xeItrhLgGBJE7C6Poj6JHlXIoHybbwYTvWcdf4HP/SNJcyz57TyuM6+JeAMxLfg6TZ/w
         zCy82mTslfSCqC3LlbnLdYIshuKwVFTmvLlY3v39amL7q2aJ+XR54vm1Vi6ctJd8rlFU
         G/zqjdmmL4cK/C03NQ1yAR+lNgSDdkNIQHHLbQ2JSbviH5oApWaqCfRw2CssNQLoR+Qo
         om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553193; x=1793157993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        b=IXMd5AQzvuLWWTd1593DiyvB+lcdkmVpOFqLkFlYYG1QDHGDo4bXsoGqm1QMPDEvp5
         opuqQhOLNI5FYJi+7P46DO+UX03HWN9GpTErrjhvf90/C0vfrbjz7+eRWuCTpiuXhY5Y
         u8nS+9shkOWVBQQ1PRgrUXMhOh6iKFIyo8dnFntZiAXh0ZWXI3We3aBr1sOMB7K4i8mS
         xpEzRptjaU3Cv/3AycKe4QlnXBbRUVbAAgA+zQKfNVMKrW+5mQFSVm8VJvTESCFeVuBg
         dpGseb3IWfXqugA02+zMgzAfFQ93X9ZzZ8aAQljG2J7AdWjxAg1Iz3zXbzm3mbEslZhv
         zBnw==
X-Forwarded-Encrypted: i=1; AKwUvBzeVv5STsqD9bUXP0FmhQblJD1+Z3YUnfB9B3EBuXziv0tDucIHsq173CaX4zq8pzexcCvtCqxPabU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKC8fyacm36lOD0oZSWhWjpGACmRW8q8C7mcYmIOLgHCWOc+5Zd
	Va+Z8xI0/vKCdMXQUYEtQymh/CxQRBG4iuMjJrWS56g8jW0g1YPRF/y6mMAH7TB5y/iPU9qqxcV
	j/0gFyeK2PDNY6dSO9bfj7PfkKvgZu6s=
X-Gm-Gg: AYBFou2eOMr8o1HzqWDVxTosWjG3s4BFXR5nubIZHtmbzWNBjBkVvK0yGLn6LeE0iUB
	yoZY+VjqsCxL7xqzM+o4/sSMMNPYcDgEZjB/7uQ+eIP69JE0ExzZMofuwX+gGp/GnN2N6ZUO1O9
	rRa5SPEHV9mCV2gzsvsHiTVReHHYTQ+RlZrqMoGko87WqV4HgmoYOIAJECLuIhDv2L7BkkYvRaQ
	Jgs3ha08zfCdGpV3acQYxqZ3n2fNFQDz8AnypWFXGzzhsl4jyW9ElKNe2agpbHZ9JcNeKU7AD5W
	3Aplg5ye3to/M5DpIEo8oLwwbbe4WSeGtrH5SDMfCoXpMrgnLEXLWViFtHlEhvvNFdSfMmxpO3+
	ngJo7bllCVntK4Z2yudFlMxvM6TnX/aq/D2nLx6xGmYFqE8esC4Ggr+G5EuFFQ0zAPKIRY1s=
X-Received: by 2002:a17:902:e74a:b0:2df:4dc5:e12e with SMTP id
 d9443c01a7336-2ea43d88783mr5847285ad.27.1792553192737; Tue, 20 Oct 2026
 20:26:32 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev> <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com> <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net> <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
In-Reply-To: <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 20 Oct 2026 20:26:20 -0700
X-Gm-Features: AclHuK8Xs091-vKVT7bOvhDjoq3_nWge5aBpQnq0586E9aA_45l3eZeGSIpucN0
Message-ID: <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com, 
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:53=E2=80=AFPM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
>
> On Tue, 18 Aug 2026 at 17:26, Antheas Kapenekakis <lkml@antheas.dev> wrot=
e:
> >
> > On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > > > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> > > >
> > > >> The ML patch set uses a guard within a switch case that violates c=
leanup
> > > >> rules. Move the guard outside the switch so all return paths are c=
overed.
> > > >>
> > > >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > >> ---
> > > >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> > > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/pla=
tform/x86/msi-wmi-platform.c
> > > >> index dfb65ac8fbf6..33acd448f674 100644
> > > >> --- a/drivers/platform/x86/msi-wmi-platform.c
> > > >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> > > >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct dev=
ice *dev, enum hwmon_sensor_types ty
> > > >>      u8 buffer[32] =3D { };
> > > >>      int ret;
> > > >>
> > > >> +    guard(mutex)(&data->wmi_lock);
> > > >>      switch (type) {
> > > >>      case hwmon_pwm:
> > > >>              switch (attr) {
> > > >>              case hwmon_pwm_enable:
> > > >> -                    guard(mutex)(&data->wmi_lock);
> > > >
> > > > While I cannot see the code easily, one could also add braces to in=
side
> > > > the case to avoid this problem.
> > > >
> > >
> > > I don't see the code either, but wouldn't this be a use case for
> > > scoped_guard() ?
> >
> > Hi, not explicitly stated in the cover letter, but this is essentially
> > a series on top of the series I sent last year but I did not clean up
> > due to a variety of issues with MSI firmware that would have made the
> > driver unsuitable for upstreaming (to my standards at least). These
> > issues span Intel driver problems, HID controller instability, and
> > varying WMI implementations esp. in regards to PLx setting between AMD
> > / Intel variants, shift mode behavior not acting correctly, and fan
> > curve application / resetting being weird (the fan curve on off bit
> > does not seem to change whether an automatic curve is used but how
> > close the device alings to the set curve? requiring us to back up and
> > restore the original curve? half of the devices keep the curve during
> > sleep and half don't? but if the fan curve is so finicky do we really
> > want a resume handler for it? Perhaps we can kick the timing quirks to
> > userspace)
> >
> > For this reason, I focused on other manufacturers such as Ayaneo and
> > OneXPlayer. I will revisit this series per request from Derek as he
> > seems to want this for steamos and hid-msi is already queued for 7.3?
> > Although, to be honest, compared to the controller firmware issues,
> > the WMI implementation is pristine.
> >
> > So I will need to go through these issues 1 by 1 and see which can be
> > fixed and either drop certain features in the beginning.
> >
> > Particularly for the fan curves, if we say that resume handlers are
> > required to be in the kernel moving forward, I do not know how
> > realistic it is to make those reliable for this WMI device family.
>
> This driver still needs work. I am getting bug reports about
> inconsistent TDP application on the EX. A8 is broken as well. Even
> with your patches Derek. I need to grab a new version of center M and
> see what they are doing.
>
> Does this driver work in your experience? What is that SMT toggle you add=
ed

I've got a few reports of some issues, but nothing with much detail. I
have the 8 AI+, 8 EX AI+, and A8 in hand and all three had effective
TDP changes in SteamOS with these patches applied and SteamOS Manager.
I haven't done extensive testing over multiple suspends or longer
sessions myself. I'm also not aware if there have been BIOS updates
since my testing.

By SMT toggle i think you mean the STAPM toggle for the A8? It was
referenced in API_UserScenario.dll (setPowerLimit_AMDSTAMP) which I
reviewed using ILSpy. After toggling that TDP started reporting
correctly and being settable.

Hope this helps. LMK if you need anything tested or additional info.

Thanks,
Derek
> Antheas
>
> > Best,
> > Antheas
> >
> >
> > > Guenter
> > >
> > > >>
> > > >>                      buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_=
MODE;
> > > >>                      ret =3D msi_wmi_platform_query_unlocked(
> > > >>
> > > >
> > >
> > >
>

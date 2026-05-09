Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A6262D0B
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778347574; cv=none; b=Fy5qVHm2xgHGmdb1gSWnJAxxKJdp4KotEqThgT9L1Lb6iDlqUO6Aag+n5wsf4fzM3h4R9BVm9bgD6PnJdEgwH+FdbHQx6J7MG1U7PbsYTZA8r6iBtFjP2IxYnLPh5G+hRsgLxP2H2BNeaTbqvf4Zzl8JcbgNSoYXNkVCdmJ8RBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778347574; c=relaxed/simple;
	bh=l462U55PT64SV7/6J/PrglUYrWnvSBMER0UTA9BRUMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KR/axvp9aN40tMDq7FEcuIsgv2oS4SuWtD9W0u30jwd9gDnU9kPyrvNGmra/7GaTV4xF/E4Q0iLNyz5lzRq7Ivbqv2K5Um+lvElBUchBUd7JOrBZN416qAwdqCP7l6WrA0jQizhmQs8NdI7vBYIVs5+q01NAAdSYipu7Stkbo1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=FwuE4eld; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="FwuE4eld"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id 9D160C1993
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 20:26:10 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 02732C3BFF
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 20:26:10 +0300 (EEST)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 6970E2007E6
	for <linux-doc@vger.kernel.org>; Sat,  9 May 2026 20:26:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1778347569;
	bh=aaVLGWdALPBEsCmykSE9FJJUaBWJ7tM3Snl5Lo8yqac=;
	h=Received:From:Subject:To;
	b=FwuE4eldBhmgfse68R6YZrDSb8KUE9ZpPyGMmAPwRiQLuQHoqSJw6kUzp+rbzZ+uf
	 mHTmA9qg23D4DR7TuaeZYxiO22YSjug9WGD9eqWT+M3q2nU6Z/a9UTQ6Z4cFK/ayca
	 ZgqQojf4d9rwMHgaHYBOrl6SDZpSuVJqy/xJ9G1DDwxb056dBemfDJyv4No9EmpdPM
	 PvF0rVGQmfVxYzHDIcjAUvo7WAGK5UvvvJ4rZUuvvMK46rDh6s6WwXMNAWf9eDa0dh
	 tLir6Ie6hlPTyWpYGQQGriDSRVpmfFHU03avWhvKmG3AEobzmoOfoZx8chFZQAkGhT
	 Jv2K4zd4bda6g==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.182) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f182.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2aaed195901so14719075ad.0
        for <linux-doc@vger.kernel.org>; Sat, 09 May 2026 10:26:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AFNElJ+zYYcMPzxtX/kxGHq2pww86BaH7GvNecjOXyzxITk2uQvYQl2RCUi+XLxQ5xSAROVwNFO6iJ9sHCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEo+uPjcQO+oef2nUNucN4n7i4CEHBURmbvsBwNTM7pZnblm4C
	auY/oLPUh8+J+j+4fxslXizrbEJbBLptLqu+b2tnBq6WL473mpS/vteaxTsjx1g6hikVJDRpGmH
	VemOoYZjeZhDNZgf0Q3YYxFcaLK365GU=
X-Received: by 2002:a17:903:1a28:b0:2b9:f8e9:70e2 with SMTP id
 d9443c01a7336-2bc7a990b6emr31487655ad.8.1778347567646; Sat, 09 May 2026
 10:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260508184104.623016-1-derekjohn.clark@gmail.com>
In-Reply-To: <20260508184104.623016-1-derekjohn.clark@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 9 May 2026 19:25:54 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwFXDP+nQO8bkW01t_iSOYQ6OUQkfv35ULfHrnLjVoFZvg@mail.gmail.com>
X-Gm-Features: AVHnY4JBi-EFhXFTQHQXwlf5sV1Obpy2Ad4iTU3cNjmImPpDtrJiKAc9dKkWupo
Message-ID: 
 <CAGwozwFXDP+nQO8bkW01t_iSOYQ6OUQkfv35ULfHrnLjVoFZvg@mail.gmail.com>
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan
 curves/platform profile/tdp/battery limiting
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177834756961.2678444.15540523894626334276@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 8 May 2026 at 20:41, Derek J. Clark <derekjohn.clark@gmail.com> wrote:
>
> >This draft patch series brings into parity the msi-wmi-platform driver with
> >the MSI Center M Windows application for the MSI Claw (all models).
> >Unfortunately, MSI Center M and this interface do not have a discovery API,
> >necessitating the introduction of a quirk system.
> >
> >While this patch series is fully functional and tested, there are still
> >some issues that need to be addressed:
> >  - Armin notes we need to disable fan curve support by default and quirk
> >    it as well, as it is not supported on all models. However, the way
> >    PWM enable ops work, this makes it a bit difficult, so I would like
> >    some suggestions on how to rework this.
> >  - It turns out that to fully disable the fan curve, we have to restore
> >    the default fan values. This is also what is done on the OEM software.
> >    For this, the last patch in the series is used, which is a bit dirty.
> >
> >Sleep was tested with all values being preserved during S0iX (platform
> >profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
> >least for the Claw devices.
> >
> >For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
> >his new high level interface is merged beforehand, we can use that instead.
> >
>
> Hi Antheas,
>
> It seems this series is stalled for 3 days shy of a year now. I have an
> interest in getting this across the finish line. Will you be continuing
> development? If not, I will take what you've started here and finish out
> the remaining nits, keeping your original attribution of course.

Hi,
I plan to get back to this after the standby rfc is in a good place.
There are some issues with this series that need resolving, MSI
firmware is a lot more varied and unstable than other OEMs which make
it hard to pin down to a defined ABI.

For V2, we'd need to look into testing into at least some laptops to
verify shift mode behavior

Antheas

> Cheers,
> Derek
>
> >Antheas Kapenekakis (8):
> >  platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
> >  platform/x86: msi-wmi-platform: Add quirk system
> >  platform/x86: msi-wmi-platform: Add platform profile through shift
> >    mode
> >  platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
> >    attributes
> >  platform/x86: msi-wmi-platform: Add charge_threshold support
> >  platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
> >  platform/x86: msi-wmi-platform: Update header text
> >  platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
> >    unload
> >
> >Armin Wolf (2):
> >  platform/x86: msi-wmi-platform: Use input buffer for returning result
> >  platform/x86: msi-wmi-platform: Add support for fan control
> >
> > .../wmi/devices/msi-wmi-platform.rst          |   26 +
> > drivers/platform/x86/Kconfig                  |    3 +
> > drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> > 3 files changed, 1156 insertions(+), 54 deletions(-)
> >
> >
> >base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2
>


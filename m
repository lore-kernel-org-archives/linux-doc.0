Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A257345CAB
	for <linux-doc@vger.kernel.org>; Fri,  8 May 2026 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778265669; cv=none; b=TqMDH5+AIcOB13PbRv+hwS80b24rYFwUfkAOsVCeDgBd5KBfkCOxm/MdAg6KDgmV5mtcff4k0DuZUTzRaXF4hbYWh3NCqmBEAwQg2js62nNBD1taK/pNfizxYX/i5soNvGescAmwyRgd3ALmlA8yQADyGOeb/+FeYEyDvW1XCRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778265669; c=relaxed/simple;
	bh=EZaiKQ2Igewejr/mBgC2O2msXgfzgRjupf+kA1bz7Sk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqIJBSJhUBiOZtfqSOlbUavtmkt30rMmcrS0tiTuhvEwO+tcrvn0iRS7ja+xIdb9G5e6wxaKrHJXieRUL/vZProWo63jW0kgCemeRieA0UDm8x9jHhCtK+bauoKDtfkwrpizaEezxA4SqLwbLVgVaa1z4CZNKbWAdnkMZhRXQT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAj8T0m8; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAj8T0m8"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1329507c387so568302c88.1
        for <linux-doc@vger.kernel.org>; Fri, 08 May 2026 11:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778265667; x=1778870467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WNHFxOPKssTiIkdcxNpnCuXp2DqdPiAAb46D1S13Dew=;
        b=QAj8T0m8errkfGu54SnXxEgn403EgURbX3giHC7Da77qJHu2N1u0wYWJh1ZIMCkG70
         JC7mn7z+dx0qp3a1FYnDCPPEitp08BLyakogoAuHh90i7FA+pkKaeFPTndmXA8EwNyB4
         QZx3nL7yZKXfydcfV//ILY2maQlTMmcHxOXKtwFd+2Btln9y4vZnQITMuAXO4iRsOHiE
         Qt1Q0Ftk6l+fDXGX2jKQmj+oqCVppw40OeU6oL91e5d6oU4AlebjMrudqq5n1MoJIUlz
         gBv2mLxnTOzaSfVWaYfa5KyDuD8WZzwcaRELhgutnX9p51O/pafLgmLeYAM1zBMQS3aq
         Vifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778265667; x=1778870467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WNHFxOPKssTiIkdcxNpnCuXp2DqdPiAAb46D1S13Dew=;
        b=F9cSFGWxr63pW9hyiOw6TL4tFktb/BnKwRJlvaW10fmhVs9xe1si7PmZ/s7d2m8NMf
         tQrxfyunIdwWj1AzeYi5LElEMNTCu0ZtaOW71ac7dPjLFCLRA+p2+pjPYtvVi/iyXsVM
         cKarJ6CuunvVyfl31X8mlVJMTvfy0uY/80EGE66xKPIjmzCK1DnVzPp94PULPA6fnhsh
         6FGwM+2ows7/IYCPSt0l//tc16tOrgxJk6tjsCGRMZKZdzmKFXcs8FhtcSgHcSKrpWWk
         nbZjTW39dp7I6aNw16ieXLFT/7QLmTEZ75V6sMfCEvyVTStYE7QEgM1wTGvxWm8XCarY
         lVBQ==
X-Forwarded-Encrypted: i=1; AFNElJ/bTi3iT7IYCJIk8vASXbRuybhlp0eGfII+cZAwMsr9luvVggAjaQRtB1AaAAAfQHWejOUnhgQFfcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz185UZAKFAUhx0DZdUGhnsiZGcSQnJ9sF3aUxA0WPV/jByTLZY
	04MOKm7/i59MtICYTMuHFcYSoZC6DPm8JSM9MZHu7MzoSReJhbqRVrD3
X-Gm-Gg: Acq92OEYPyy09AdS48+rVywnzzki3/ywOGGJCJ6mlB2Dl0SkVQo/zQDwDhhPPi7G2Qb
	RRjsaXx+gkiLfhg9mA51nAw6tOx4wxUKjW/UXw/Rwzkvt6D0OPKfGCiO+/rVZS8UIyLB02DTbf9
	eHVVob8r29jwR5/MQ4VqPMDzeGbj8+Xjt7hgim8pacp1zY1/lNFQHPpA2RD7pLzdBmxVYMczLzE
	f6CgOvIPViof7ddzlMfH/+MQFiMfEQVQEz0NDc2S1mHqH+9b5EKJasJbpZcs57EWOZ9tScCRsp3
	IAiYWZkLZ7CcuxW+wQsFlhXWp3Gx0caXqL8pC5UdblknEjgEBEn61Wd9xiQY+oVOnUeh9RrbjHQ
	3nj/D4wrSqVhfq5PMEKK7dvJtM0OzthphOSq4ZVWj1fwPJ9K7QmaUg0Qbd9QddLFY11AwmLcpyU
	dkwDVMeLzlItp5ekaIa/z4NX4cGT0Rd0ihw5Z0zNR0guO3N5TTwuqRAH1CTuhr5GtVZhd4zhPuM
	OKS
X-Received: by 2002:a05:7300:e60c:b0:2dd:6937:79bc with SMTP id 5a478bee46e88-2f54ad72f58mr7379780eec.6.1778265666442;
        Fri, 08 May 2026 11:41:06 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88885be8esm3365279eec.22.2026.05.08.11.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 11:41:06 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform: Add fan curves/platform profile/tdp/battery limiting
Date: Fri,  8 May 2026 11:41:04 -0700
Message-ID: <20260508184104.623016-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20250511204427.327558-1-lkml@antheas.dev>
References: <20250511204427.327558-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>This draft patch series brings into parity the msi-wmi-platform driver with
>the MSI Center M Windows application for the MSI Claw (all models).
>Unfortunately, MSI Center M and this interface do not have a discovery API,
>necessitating the introduction of a quirk system.
>
>While this patch series is fully functional and tested, there are still
>some issues that need to be addressed:
>  - Armin notes we need to disable fan curve support by default and quirk
>    it as well, as it is not supported on all models. However, the way
>    PWM enable ops work, this makes it a bit difficult, so I would like
>    some suggestions on how to rework this.
>  - It turns out that to fully disable the fan curve, we have to restore
>    the default fan values. This is also what is done on the OEM software.
>    For this, the last patch in the series is used, which is a bit dirty.
>
>Sleep was tested with all values being preserved during S0iX (platform
>profile, fan curve, PL1/PL2), so we do not need suspend/resume hooks, at
>least for the Claw devices.
>
>For PL1/PL2, we use firmware-attributes. So for that I +cc Kurt since if
>his new high level interface is merged beforehand, we can use that instead.
>

Hi Antheas,

It seems this series is stalled for 3 days shy of a year now. I have an
interest in getting this across the finish line. Will you be continuing
development? If not, I will take what you've started here and finish out
the remaining nits, keeping your original attribution of course.

Cheers,
Derek

>Antheas Kapenekakis (8):
>  platform/x86: msi-wmi-platform: Add unlocked msi_wmi_platform_query
>  platform/x86: msi-wmi-platform: Add quirk system
>  platform/x86: msi-wmi-platform: Add platform profile through shift
>    mode
>  platform/x86: msi-wmi-platform: Add PL1/PL2 support via firmware
>    attributes
>  platform/x86: msi-wmi-platform: Add charge_threshold support
>  platform/x86: msi-wmi-platform: Drop excess fans in dual fan devices
>  platform/x86: msi-wmi-platform: Update header text
>  platform/x86: msi-wmi-platform: Restore fan curves on PWM disable and
>    unload
>
>Armin Wolf (2):
>  platform/x86: msi-wmi-platform: Use input buffer for returning result
>  platform/x86: msi-wmi-platform: Add support for fan control
>
> .../wmi/devices/msi-wmi-platform.rst          |   26 +
> drivers/platform/x86/Kconfig                  |    3 +
> drivers/platform/x86/msi-wmi-platform.c       | 1181 ++++++++++++++++-
> 3 files changed, 1156 insertions(+), 54 deletions(-)
>
>
>base-commit: 62b1dcf2e7af3dc2879d1a39bf6823c99486a8c2

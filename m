Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E7B399CE9
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 17:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952299; cv=none; b=g5aC1PatbCXYXT7sOwRkYinoRlD8kwFJIau/JF55jnEvIffV+g/kZQSFO71UsEWeRgjhB6CBGDA/ocg7pRwKFGXRqueS9hbi/+d3pVmDfreIsoYensWzVlJVb3d7fzXLq8vMh1ipT1GeeL0tnJhVGeBnJyE1HXLQozvsuOPl1vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952299; c=relaxed/simple;
	bh=DZkacl0LYj3A25+z1d7Cuy+PCvVB8P5B8rNSW1GpetI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+ci3DD2hURn4f9OFSRVE9+DafDOwMadhhipyJXmHp04EREnPQj48M1FJImYOLxMi+OVd9pFJlOFB0t+1/9ZiPjBreVXtwtg6nXbfs5VA35D8xc2mSAACuCXdBPh1IuaG/mQOqCLBEDnAaOuYebD0HV/Tta/Ux17xCUkKddd+oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=o/IUA/SR; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="o/IUA/SR"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id AC2E1C1FF3
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 20:41:50 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 1CA57BF456
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 20:41:50 +0300 (EEST)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2FA911FD7DD
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 20:41:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1785951709;
	bh=vj/5gBDVK0oBuvLw+3g3cE7T59jtDMK52gvvyGpaH5A=;
	h=Received:From:Subject:To;
	b=o/IUA/SRXAC17suh5nkX1aVMMT17TuuGUx4k9y1bOUpTS6qhVfqj7OMCwUx/stb+Y
	 DSrMStx7iVf011ueDgV88bmN4uw3m+uscPkuPl9QIsg/YO7IT42M4m24KBDS18s06O
	 Fhi2SKyen1JX52IKR5CUvhrF7Qi37oAQiIAJmodZOijUKhvC/1+M3FovOM35woTxfD
	 HBJOotLQEhui1PEghrAGQYPBzRf9aE55iMvbLsSdtIFRbk7idJ3+NNet+7S15yWAK9
	 nukyf3AkUSy8ijSXLHCt4iFGaWkMMCHXzF8zCLTXVA+8GTa986rpfg5bsDPJLsb/OF
	 Niq12jECs4+Cg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2cf27856f9cso16292995ad.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 10:41:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RobtBYN9YoHf+Ty5d79bvj9N+RlBn6Cw7YZvJxonJet2sHO0PjJ3FWlRVFzRVBCLWPY+wwhyEKUItI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+88/gZqQHDsPTua7n/RX9QL40FINH7i4OemRzECkZ1yrCwvLK
	Cel43rSHe92kUZ3009GivN67z+o2u3PzodFdXsMGwbccTTZFj2Rre8JiQsEJU0z680bMPM2hBVw
	s3RqHKLvvhdhQv89XE04/PqCcRIcU8dM=
X-Received: by 2002:a17:902:e88f:b0:2ce:b7b7:30e3 with SMTP id
 d9443c01a7336-2d0ca9904femr93820805ad.17.1785951707537; Wed, 05 Aug 2026
 10:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 5 Aug 2026 19:41:36 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwF0JBxHSw8=aiFnxgZs-C_0HhsCdfRXsuvoz9MqJJvtoA@mail.gmail.com>
X-Gm-Features: AUfX_myFrIlrgkMgfNSrYbVrvXa1nImqzA89CKFbt3dMEk0RnDyE2R_oYdnqERk
Message-ID: 
 <CAGwozwF0JBxHSw8=aiFnxgZs-C_0HhsCdfRXsuvoz9MqJJvtoA@mail.gmail.com>
Subject: Re: [PATCH 0/6] Re: [PATCH v1 00/10] platform/x86: msi-wmi-platform:
 Add fan curves/platform profile/tdp/battery limiting
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: W_Armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, kuurtb@gmail.com,
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <178595170961.3026403.11457932940281431976@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.5 at linux3247.grserver.gr
X-Virus-Status: Clean

On Tue, 4 Aug 2026 at 00:16, Derek J. Clark <derekjohn.clark@gmail.com> wrote:
>
> While tesing this series, multiple issues were found that cause crashes
> or compilation warnings. Additionally, since this was first posted, two
> new models have been added that each have a unique feature that must be
> managed before TDP control will be used. Given that Antheas indicated he
> still plans on sending a v2, I'm posting these so they can be
> incorporated in the next version, and so that distro's packaing this out
> of tree can get the fixes and additional functionality in the meantime.
>
> A summary of the changes are as follows:
>
> - Patch 1 detangles a guard with a switch case that violates cleanup
>   rules.
> - Patch 2 removes an unused err variable.
> - Patch 3 teminates the quirk table with a null entry to prevent
>   unquirked platforms from crashing when the driver is loaded.
> - Patch 4 cleans up the device quirk names, fixes a bug with when buffer
>   data is copied as a payload, and adds separate PLx limits as indicated
>   by the windows DLL, if pl1 and pl2 are set to the same minumum it can
>   cause instability.
> - Patch 5 adds support for gen 3, the AMD Strixx version. In order for
>   manual TDP control to funciton the STAPM flag must be toggled off.
> - Patch 6 adds support for the 8 EX Ai+. This device uses a new shift
>   mode, called "manual", to enable TDP adjustment. Since this could
>   conflict with the existing "user" mode, use the quirk table to
>   specifiy which mode is "custom". As a consequence, "custom" must be
>   checked outside of the switch case as it could be one of multiple
>   values.
>
> If you incorporate any of these changes in v2, please add the
> appropriate attribution.
>
> Thanks,
> Derek


Hi,
of course. Its good to have this chain series for anyone that needs it.

I will note that for patch 1 and the missing {} I am aware of those
fixes and implemented them myself to the downstream patch I was
carrying. I never resent a V2 because I did not address Armin's
comments. The missing {} was exposed when Armin fixed the
autodetection. So I cannot attribute those to you. Patch 2 is a review
nit, so after I fix it you can add Reviewed-by. I will make sure for
the last two patches especially to attribute those to you and if
possible keep you as the main author / not add myself if they require
no changes.

I do not have access to my Claw until the middle of August. Once I
have access to it I will have a closer look.

Antheas

> Derek J. Clark (5):
>   platform/x86: msi-wmi-platform: Move guard out of switch in
>     platform_write()
>   platform/x86: msi-wmi-platform: fix: Remove unused err
>   platform/x86: msi-wmi-platform: Clean up devices
>   platform/x86: wmi-msi-platform: Add MSI Claw A8 support
>   platform-x86: msi-wmi-platform: Add Gen 4 device
>
> Matthew Schwartz (1):
>   platform/x86: msi-wmi-platform: terminate msi_quirks DMI table
>
>  drivers/platform/x86/msi-wmi-platform.c | 151 ++++++++++++++++++++----
>  1 file changed, 127 insertions(+), 24 deletions(-)
>
> --
> 2.55.0
>
>


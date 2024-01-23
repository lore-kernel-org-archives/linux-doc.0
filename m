Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED1359B75
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706002117; cv=none; b=LYo6VAsICQrrSq4sm19m5TxxXBAWcNFAJgfRS4v4xtWuvJzuetH8XRGvbbXdimgFn4fC5mpa2sw06e5GMxIvcKqjgWIOSVFCosM6trAnObVUUZWBhWipWo0R1VoEL74fk1lT9nlUeAKmNk+30tcnTfHyr+TRliHrEs1PcOPImfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706002117; c=relaxed/simple;
	bh=xmE2deCpE20ed/OZitpwd3izN/aSq/TCRV+gv0G97Ts=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lde19CafPBl7OyW5bxaXe1moSdMrfdOl9cnAn25PytK4lk+ZJrJhMM5nopCGNPjDLL5l5GhcXMnMqagG5VdFme7jTMvHCqQrKDW3yPmUT3zIwig7XXZc1R8tWoudoxTY2VjOcACRSnBC0TeRuQvQKIGrdT3hQD3DNwaYhAj4h+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKo/IV8H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKo/IV8H"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40ebf373130so2724545e9.3
        for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 01:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706002114; x=1706606914; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kw4Srobn+f1O7VL878FXWvTuM60WtZXWiD2XR6BnhL8=;
        b=PKo/IV8Hi98gQLe/JqUIpAo52s5utab04PX13pU5pfjCRDZsgzuwOQ52dG2IK+2k9w
         ZpqK06mvfwq7bi6MCBTZobTAXCU4/bxebVpXvTGdFtLZqInL1IL6cV3MuUfILwnHt1d9
         h9lDKT+/pAdgdAyqupu8ADe2RM9lH8+VfsTgU3Q9VVo2mGP/TWBpEeqaBHnDU2z+A4qw
         OwX6wxke5FsX4McJcmuVni+JxdKtVyUCWW41TuiJA5Egnk9IKbW1xOxGW3wWyvyXFTf4
         7zIjicrWZj0XsCDsVZA9fYxju2LpsXbFDCkCtUiGKDrg7S7cWeegnOGnv3C0lm76o+pU
         KL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706002114; x=1706606914;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kw4Srobn+f1O7VL878FXWvTuM60WtZXWiD2XR6BnhL8=;
        b=UcqNQ9ktLPBb/2LN2EwU6+Wmhbeo+qG/fnA/Kdc5tXXmWkTNi2o15evTFCqIaDpRWr
         j4RWGw2vucIWBAuohvZGnbTrlZ7xWpB7frXe8uZSC5CrmebOgLsMPowVtTkWu02hbNK3
         xd/M59GdRE7BBJ9RnoHag5ZmhvdGG/AR9ZAilc2QjybQF7+r/pRMfh0PqAdBwCmDe3hP
         APrNOwlNwfVPnWf9igadW95lNYZM5oVgZSZ6LqRzM2NwfRwlaM8KhADzZFHHCyr5ZhGs
         5GEzfdvBtIFAZMtRxytrPCvu73nL1fWRS5umkuvqCg6MkJHUP7R/Y7WCmZ/Ct1xRRsGQ
         unwQ==
X-Gm-Message-State: AOJu0Yz0HtravyXYr5VnsRYozd1S9dvnBfT6OCzEIqdnRpt9Z0HuUcX4
	u7ElD/XYHW2FkNrxmKLEtjAs58z16RvN8FqxjymNnXnPCro4D1rh
X-Google-Smtp-Source: AGHT+IFFuGMJJjgVFzCcyEikeVyYKjgt0oO1Ilt53tB5LstuA8CohaGKcGPm7HSUivwILnFmNrmp4w==
X-Received: by 2002:a05:600c:4e50:b0:40e:7f2c:9dbd with SMTP id e16-20020a05600c4e5000b0040e7f2c9dbdmr373419wmq.13.1706002114078;
        Tue, 23 Jan 2024 01:28:34 -0800 (PST)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
        by smtp.gmail.com with ESMTPSA id p19-20020a05600c1d9300b0040eb6cdcbdbsm1710314wms.14.2024.01.23.01.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 01:28:33 -0800 (PST)
Message-ID: <57798354-836c-40cd-a592-d428d768811b@gmail.com>
Date: Tue, 23 Jan 2024 10:28:32 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Expand and improve AMDGPU documentation
Content-Language: en-US
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20240122212719.647008-1-Rodrigo.Siqueira@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240122212719.647008-1-Rodrigo.Siqueira@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 22.01.24 um 22:24 schrieb Rodrigo Siqueira:
> This patchset improves how the AMDGPU display documentation is
> organized, expands the kernel-doc to extract information from the
> source, and adds more context about DC workflow. Finally, at the end of
> this series, we also introduce a contribution section for those
> interested in contributing to the display code.
>
> Changes since V1:
> - Remove unprecise information about the DC process.
> - Expand the contribution list.
> - Rebase.

Acked-by: Christian König <christian.koenig@amd.com> for the whole series.

>
> Thanks
> Siqueira
>
> Rodrigo Siqueira (8):
>    Documentation/gpu: Add basic page for HUBP
>    Documentation/gpu: Add simple doc page for DCHUBBUB
>    Documentation/gpu: Add kernel doc entry for DPP
>    Documentation/gpu: Add kernel doc entry for MPC
>    Documentation/gpu: Add entry for OPP in the kernel doc
>    Documentation/gpu: Add entry for the DIO component
>    Documentation/gpu: Add an explanation about the DC weekly patches
>    Documentation/gpu: Introduce a simple contribution list for display
>      code
>
>   .../gpu/amdgpu/display/dcn-blocks.rst         |  78 ++++++
>   .../amdgpu/display/display-contributing.rst   | 168 ++++++++++++
>   .../gpu/amdgpu/display/display-manager.rst    |   3 -
>   Documentation/gpu/amdgpu/display/index.rst    |  78 +++++-
>   drivers/gpu/drm/amd/display/TODO              | 110 --------
>   .../gpu/drm/amd/display/dc/inc/hw/dchubbub.h  |   6 +
>   drivers/gpu/drm/amd/display/dc/inc/hw/dpp.h   |  26 ++
>   drivers/gpu/drm/amd/display/dc/inc/hw/hubp.h  |  13 +-
>   drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h   | 250 ++++++++++++------
>   drivers/gpu/drm/amd/display/dc/inc/hw/opp.h   |  16 ++
>   .../amd/display/dc/link/hwss/link_hwss_dio.h  |  10 +
>   11 files changed, 560 insertions(+), 198 deletions(-)
>   create mode 100644 Documentation/gpu/amdgpu/display/dcn-blocks.rst
>   create mode 100644 Documentation/gpu/amdgpu/display/display-contributing.rst
>   delete mode 100644 drivers/gpu/drm/amd/display/TODO
>


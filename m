Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D469481FB8
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781017951; cv=none; b=BgE2HTWs8exCOCp2xgGnOqZEHe63cPS+Riv4IBxCvcpxTchQhgzTU0BnCCNjDE2UIvsUCdPWOvZFqrkGQ+qkPNFUSk4bFuTjVceeyKCkfGfoHQqYxYHUYyjH5ouNXnLL+xP2PmA5oKqF9Z4YNBhiLlYxL79pKeb15hLQlsuLbag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781017951; c=relaxed/simple;
	bh=MOv3SenVOIJ+2PjxGXILrvwas4FLe9X40rnIUrUcvII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=acC7PRwNVdAR5tPT7CO4McveTkB0q7+2Qzr2SJ1/7H5l4z+gu5byuKy02wnn8oapmz8G7OGQlVSlXPzSjDR5y8MgiVGrivSj8u3PsZrWiOUnBAloDfDKGKgjSvvtinhK9VH/4WKEcZZGHyq3LgA1XqNMVkjdYZo7S5fj+rnfrbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nSOyieyy; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nSOyieyy"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2d865383so465365ad.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 08:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781017941; x=1781622741; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VKUC1VUaetCGs5JJDLFKtb8dO63YSohjJ7JwyYLsY=;
        b=nSOyieyy7gRAiOb1Sr15URcEnYbX/IJlRn+9J6IdwjEGuJP8lpNB/VuYuYpCv8jNYE
         N7V0GDbvG3BQu5WqqAi44/yguvsMXGySTY6Ay9Ff7bsJicG6r9a+ssI6n7m0HxdDtalG
         zDyGzV0WFa0yG+mhG8cOEjXntHkRwAGnvJL8FX44XjFxV3QwzT9ug+xcKf6OF621teBq
         ic8HjbVO2fdTKi2Gg5KgJ3MDZD4dG2SnOl1m/fdGQ3Ag3FcD/G7Gd9+k5jwQ2lGMe1Y1
         ZUXLWbMoWl6ZpwMYASbEjkV2KwapmuOv9QsmQ29xhQDagMfYj74OIEGi1v7znETpSOxJ
         347Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781017941; x=1781622741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w6VKUC1VUaetCGs5JJDLFKtb8dO63YSohjJ7JwyYLsY=;
        b=SQJGS4Yr8AxJ8mZsojfiMdLddz8cY6d29HZjgsDvZUvjegwdsHFMB6CtHSKHyuKbYv
         VXANZZF0iexhGnFDMbNOaIzpQqvgM4pEkvUdga1BED01yxPeMSpTUm6UAdSZ2gdRW3/P
         X/iCXVDwt/+etjIENRPgkgI6EWQk9UxHJvAJV9+X6rHMDX6X8yFw1wdlD8mf6sF6lBbC
         Pqtkth7/NPwIQHfHhrF5yZc/ZvqsqaFPsS2aCMwfnE70UjJcY2nrd7tA+44qzdSqaQej
         dz3NbW4fmWSKsl6bSLLVWXsVkDQMbnNHY4tovZX3cRz9KloxUg6eJ+H9hHWCcxL3s6D8
         i5DQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PvUmubuErdYc3haAKlXF/Q5GW7i3Z1e+R2labzEQXvyHfU+TqlACU2ozdDMpv1WD6gXairH92Q8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YymPUoTHoatkmqCPoMx3Pcab3jxsPGfKCkVzHXBKxvs3jM41gDt
	u19l4x++muT11w6uJ72KWN+HXiFGrvchhxqSpFoK7B2ZCw1ItztH+ucBQytPnQvRqQ==
X-Gm-Gg: Acq92OEkxS+WdAzJFeAZX5tK+VMJp6zloGCK53YIPrUoVM7CwsLjNsupomGXTNbiLrq
	1XSWdZ/tIVgco1TZwgVp7dr08e8YVucMYRdJmWBTXixvTHlo77kZJ0kHAI5NgVYYThz8z12RlL9
	locqi5nrG5VYnMlrVIMEvj7Fb1AXIP0RXc9VL3fcnRzXDWPQdLLAkeApvpShag+jF+ynug1u8A8
	Sn82QNFVcRhP2kjK0dZivD/8zeLLEv3G5dpHVssjSfstmY3VnYKLj+L4tkLaVKJoNqJ9Fx1eisB
	FMdcVmbivMqBhDeZJGOzFArm2pxCnEijj2FBvQIJTle6P1PuxW5gF0CbrE7phNr8mV6RTRW8OCN
	1YBUqn3nz1MWxCY62zupnWac3l7QEVZ77r4vzMGXS8fLdLKXboi5Q1euof4+lbjU1Sgq9c+iZH0
	vzUGhBVDSfGpdJAVO4kZeJ/7Bc/lAVRZikBxYsj+GggV57cW2uVIDv2ofhVVfTQswlJJNTe6w=
X-Received: by 2002:a17:903:19ed:b0:2bf:3579:cdaa with SMTP id d9443c01a7336-2c1eb942782mr7408845ad.10.1781017940616;
        Tue, 09 Jun 2026 08:12:20 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm208599735ad.64.2026.06.09.08.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:12:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 15:12:11 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pci@vger.kernel.org,
	Adithya Jayachandran <ajayachandra@nvidia.com>,
	Alexander Graf <graf@amazon.com>,
	Alex Williamson <alex@shazbot.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>,
	Leon Romanovsky <leonro@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>,
	Yi Liu <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 08/12] PCI: liveupdate: Inherit ACS flags in incoming
 preserved devices
Message-ID: <aigtS3UDdhUGp3m0@google.com>
References: <20260522202410.3104264-1-dmatlack@google.com>
 <20260522202410.3104264-9-dmatlack@google.com>
 <aiXWmR-ettxin4LC@google.com>
 <aiaeOVomxQZhoM3K@google.com>
 <20260608181640.GO1962447@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260608181640.GO1962447@nvidia.com>

On Mon, Jun 08, 2026 at 03:16:40PM -0300, Jason Gunthorpe wrote:
> On Mon, Jun 08, 2026 at 10:49:29AM +0000, Pranjal Shrivastava wrote:
> 
> > My point was that a FW exploit can meddle with the bitfields of the
> > ACS_CTRL to spoof and mis-report the ACS flags.
> 
> Devices can also ignore the ACS flags. I don't think this is an area
> where we should be worrying about devices being actively hostile.

I'm wondering what happens if we preserve IOMMU groups across a kexec,
but a switch's ACS capability is dropped or the ACS_RR bit gets cleared?
The incoming kernel assumes that it's the same ACS cap from the old one

Now, the incoming kernel restores the groups assuming they're still 
isolated, but the hardware no longer enforces it, silently allowing DMAs
& breaking isolation? 

Thanks,
Praan

Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D2015350A
	for <linux-doc@vger.kernel.org>; Mon, 13 May 2024 13:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715608214; cv=none; b=r3wopF7JxijTG/3r6xX7CIFzc3soe33MuI6F4E/7jp4sNGkYWdXAz9hYQ9nlT8ynPsOqdw46ARKoAAznm0+8wTuTyxYA5+XZx6OQ6sLjdigcukTJI1vz+movGpjzjbxmthOCo8RtlFeqNRKPFwA5c8KxdPqpRP4FpLxpLkCAqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715608214; c=relaxed/simple;
	bh=QgVlfxYOcO6a2FGRtcT89N1sWNGBmwzz5a1/43rPcZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VtvhV60dJybm+53tqjT60kYGSonU/BfX4Hwn+kCnb+PqLFoS1f92LKv6Nb6m7NV2tM+KqRbRO17w44/om6rm4KIq7FoON4XFaD/rJ429qn+UpWHDKhbptyyqTDxb6uT6w3lE1YgzFV/Y47HRI21fCs1SvFSCeSQjRPa/vZTGbq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=LIOJ2fL/; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="LIOJ2fL/"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f99f9e0faso4797652e87.2
        for <linux-doc@vger.kernel.org>; Mon, 13 May 2024 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1715608210; x=1716213010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SH0MPbViZO4ZlHlcqCmeWajuCbTevJze0Tg6yt/BEo=;
        b=LIOJ2fL/YVmZ8mWaZo13qPlgAz/M5QqzftaLqIqyGU4eZ7YrWn8/NQBgGbUBwY6wQM
         Y1e0x1qTlYQ8sp/lcfPLBTD15Qs0pKrccrkhvxaa/2zybEO2vuAqmBOLYrYqBgZ/pO2e
         Q9zyIiDBb74NxJ3b5KS+Zs/M1AqN73tGrnnLjYGzFWoKvrj6f9LAw7/3Kh47Mtc48qen
         e02c6rVsZs7Egm3YSVHbdzix+9wbxutlMN1LwPLISXIeY3ImL0Wjbhd4uYV3Jq+NFLK9
         +ijaetGyW1AriRqYa8dn6rPzlb1pjFgqGXb1h9UwclNaOBZUT1J+Ws3vc0sbbjtMV36F
         /C+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715608210; x=1716213010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SH0MPbViZO4ZlHlcqCmeWajuCbTevJze0Tg6yt/BEo=;
        b=LwNwZ2UCrOUjPhuYHrsrQXKTRRaqmnqfLMXYD2kLlzfVD2QRBooka+kkFlYZKk4t0Z
         X78C5nfIqitniTqNrr48QwZuxpRbkKH4EgC3aODsPMHejccsjgFm66ZKfoI5jHhHkpQW
         PlSDdNP2YyBLxWcKy4E21yTQetpIh7bleaUU5rDtNhDlWR9nXRofLQdOUTCCI1Dg7EdU
         dUg7DUuFMPI+cOLI66u5UXvoXyHvAsO8a1hin/zgLTurmg5NXKns3X310sXkWCJ/7pvk
         XcmQLUSPICRaaAuXodyZyfRxf3zIfBkk26VnBMx/gkQzAir25su3AimRYHbTq8ROKcjP
         /zQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV4PULVDgokfFLQZEmdC3bqKmVpLLWu8PP1yVY17cFc44lzzwXMtq4IFIp9QKsyT56CjQq/zG0FU14KBfqL/zef5K457NwAZev
X-Gm-Message-State: AOJu0YzQYAIG9LFSTmULNZJbP5oYANyeDj9lAT9PiwlEbZ7PjbPBeNPb
	tnEYdXr/a8nTXkasSl7z6VRaYc+QhT0Nsjoq+8jpdAA+8oRknN++gYwpLitbRhI=
X-Google-Smtp-Source: AGHT+IE6Fh0wozcrwTaLf5Ahj24hiWMshe8JoObyBhlcx94qEfxBLJBCl9i+5vlSidtgIAFlzmLVlg==
X-Received: by 2002:a19:e01e:0:b0:51e:ef3f:e74d with SMTP id 2adb3069b0e04-522105847a4mr6673352e87.62.1715608210347;
        Mon, 13 May 2024 06:50:10 -0700 (PDT)
Received: from minibuilder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d3674sm1782660e87.295.2024.05.13.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 06:50:09 -0700 (PDT)
Date: Mon, 13 May 2024 15:50:08 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Piergiorgio Beruto <Pier.Beruto@onsemi.com>,
	"Parthiban.Veerasooran@microchip.com" <Parthiban.Veerasooran@microchip.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"horms@kernel.org" <horms@kernel.org>,
	"saeedm@nvidia.com" <saeedm@nvidia.com>,
	"anthony.l.nguyen@intel.com" <anthony.l.nguyen@intel.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"Horatiu.Vultur@microchip.com" <Horatiu.Vultur@microchip.com>,
	"ruanjinjie@huawei.com" <ruanjinjie@huawei.com>,
	"Steen.Hegelund@microchip.com" <Steen.Hegelund@microchip.com>,
	"vladimir.oltean@nxp.com" <vladimir.oltean@nxp.com>,
	"UNGLinuxDriver@microchip.com" <UNGLinuxDriver@microchip.com>,
	"Thorsten.Kummermehr@microchip.com" <Thorsten.Kummermehr@microchip.com>,
	Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>,
	"Nicolas.Ferre@microchip.com" <Nicolas.Ferre@microchip.com>,
	"benjamin.bigler@bernformulastudent.ch" <benjamin.bigler@bernformulastudent.ch>
Subject: Re: [PATCH net-next v4 05/12] net: ethernet: oa_tc6: implement error
 interrupts unmasking
Message-ID: <ZkIakC6ixYpRMiUV@minibuilder>
References: <Zi4czGX8jlqSdNrr@builder>
 <874654d4-3c52-4b0e-944a-dc5822f54a5d@lunn.ch>
 <ZjKJ93uPjSgoMOM7@builder>
 <b7c7aad7-3e93-4c57-82e9-cb3f9e7adf64@microchip.com>
 <ZjNorUP-sEyMCTG0@builder>
 <ae801fb9-09e0-49a3-a928-8975fe25a893@microchip.com>
 <fd5d0d2a-7562-4fb1-b552-6a11d024da2f@lunn.ch>
 <BY5PR02MB678683EADBC47A29A4F545A59D1C2@BY5PR02MB6786.namprd02.prod.outlook.com>
 <ZkG2Kb_1YsD8T1BF@minibuilder>
 <708d29de-b54a-40a4-8879-67f6e246f851@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <708d29de-b54a-40a4-8879-67f6e246f851@lunn.ch>

On Mon, May 13, 2024 at 03:00:48PM +0200, Andrew Lunn wrote:
> > I've enabled some debugging options but so far nothing seems to hit.
> > What I've been able to conclude is that there still is SPI
> > communication, the macphy interrupt is still pulled low, and the cpu
> > does the ack so that it's reset to inactive.
> 
> Is it doing this in an endless cycle?

Exactly, so what I'm seeing is when the driver livelocks the macphy is
periodically pulling the irq pin low, the driver clears the interrupt
and repeat.

> 
> Probably the debug tools are not showing anything because it is not
> looping in just one location. It is a complex loop, interrupts
> triggering a thread which runs to completion etc. So it looks like
> normal behaviour.

Gotcha. The 'do work' func called in the worker threads loop does run
and return, so I guess there is not much to trigger on.

> 
> If it is an endless cycle, it sounds like an interrupt storm. Some
> interrupt bit is not getting cleared, so it immediately fires again as
> soon as interrupts are enabled.

Good input. I'll add some instrumentation/stats for how many jiffies
have elapsed between releases of the worker thread and for the irq
handler. I can probably find a gpio to toggle as well if it's really
tight timings.

The irq pin is inactive/high for 100s of us to ms in the measurments
I've done. But I've been using multiple channels and not the fanciest
equipment so samplerates might be playing tricks, I'll rerun some tests
while only measuring the irq pin.

> 
> Is this your dual device board? Do you have both devices on the same
> SPI bus? Do they share interrupt lines?
> 

It's on the dual device board, the macphys are using separate spi buses,
one chip shares the bus with another spi device, but the other is the
only tenant on the bus.

No device shares an irq line.

Pretty sure I can replicate the result for both devices, but need to 
double check, been to much testing of random things for me to keep track.

I'll do some more digging, I think we're getting pretty close to
understading the behaviour now.

R

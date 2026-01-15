Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2B630DD13
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768512937; cv=none; b=Ecx7r0iFsaVGZdwmBRNHBbDyoyT52UtU/8OWuUdVRozqXQhyNVMPC6xlRPOxAF2KlvZyrQ7xzU/uV/fMs1npakiD5PQNuKXvvYTwIfxHFmTXs4KG7liiMKN3ie+KpuTnEBKIaBDJ7oLgvF9W5va895aJdylp2crGv/AHCjmwW88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768512937; c=relaxed/simple;
	bh=37YWRbNwvnyyFvjrt7JMRWs3o6ZgMumlyr0qRXEnv1I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=U7OaJG/zzQMwr6hJfyaA3rf5DJlZA5suAb8BfDkCX+L8N39PNb0q7gVp19H8yFnLi5692coIf81lOtMwxfy/dABa+LjMZY6/TTot9ASu63q7jL8Nxsl30f4ey/aozCMR6WooYlQQdsZfAJvDDVLUYnrfo74WLeazScgN56TTcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BKarNav8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BKarNav8"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 407DEC1F1EC;
	Thu, 15 Jan 2026 21:35:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB404606E0;
	Thu, 15 Jan 2026 21:35:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB28D10B686F5;
	Thu, 15 Jan 2026 22:35:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768512931; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gt0k7cpxkwgvJr17BqCbb8eyAiyjEBq1DZWOyzllr+4=;
	b=BKarNav81M8+i7lZoS0D+VOJVywBzkYRHvpkHIlKbPtv24BlZr8KLaLaqqP0R+TO19oyFS
	tNWPUNz242qhsmQENrqIcktYa8Xv9RGvn+L35PvQ85g6Qfj2QIoJ34LX/agrBWQJQf59iO
	gcuelY/WfZ3nns4x2nxFtprTSlLDCNxRyjT5YHKjK7Ypz6Zh5a4R4MyKTQU1cttKKbvXuu
	9obSK8lF6vz+K6WEAgZqPkKw/oor7CDWUtsKlq2CCvSL4DKcAmUNOn7XBULVb0Pwp4dRoP
	Ta9JYB/SZQDsAkR3/XGYKfvhtfIT/MtPVFP/ktUUbSAI60L1oVnUP7dzd6zcuA==
Message-ID: <51859704-57fd-4913-b09d-9ac58a57f185@bootlin.com>
Date: Thu, 15 Jan 2026 22:35:26 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net: stmmac: fix transmit queue timed out after
 resume
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Tao Wang <tao03.wang@horizon.auto>
Cc: alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, kuba@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com
References: <aWd9WUUGhSU5tWcn@shell.armlinux.org.uk>
 <20260115070853.116260-1-tao03.wang@horizon.auto>
 <aWjY7m96e87cBLUZ@shell.armlinux.org.uk>
 <aWlCs5lksxfgL6Gi@shell.armlinux.org.uk>
 <6a946edc-297e-469a-8d91-80430d88f3e5@bootlin.com>
Content-Language: en-US
In-Reply-To: <6a946edc-297e-469a-8d91-80430d88f3e5@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi again,

On 15/01/2026 22:04, Maxime Chevallier wrote:
> Hi,
> 
>>
>> I've just run iperf3 in both directions with the kernel I had on the
>> board (based on 6.18.0-rc7-net-next+), and stmmac really isn't looking
>> particularly great - by that I mean, iperf3 *failed* spectacularly.
>>
>> First, running in normal mode (stmmac transmitting, x86 receiving)
>> it's only capable of 210Mbps, which is nowhere near line rate.
>>
>> However, when running iperf3 in reverse mode, it filled the stmmac's
>> receive queue, which then started spewing PAUSE frames at a rate of
>> knots, flooding the network, and causing the entire network to stop.
>> It never recovered without rebooting.

 [...]

> Heh, I was able to reproduce something similar on imx8mp, that has an
> imx-dwmac (dwmac 4/5 according to dmesg) :
> 
> DUT to x86
> 
> Connecting to host 192.168.2.1, port 5201
> [  5] local 192.168.2.13 port 54744 connected to 192.168.2.1 port 5201
> [ ID] Interval           Transfer     Bitrate         Retr  Cwnd
> [  5]   0.00-1.00   sec  0.00 Bytes  0.00 bits/sec    2   1.41 KBytes
> [  5]   1.00-2.00   sec  0.00 Bytes  0.00 bits/sec    1   1.41 KBytes
> 
> x86 to DUT :
> 
> Reverse mode, remote host 192.168.2.1 is sending
> [  5] local 192.168.2.13 port 47050 connected to 192.168.2.1 port 5201
> [ ID] Interval           Transfer     Bitrate
> [  5]   0.00-1.00   sec   112 MBytes   935 Mbits/sec
> [  5]   1.00-2.00   sec   112 MBytes   936 Mbits/sec
> [  5]   2.00-3.00   sec   112 MBytes   936 Mbits/sec
> 
> Nothing as bas as what you face, but there's defintely something going
> on there. "good" news is that it worked in v6.19-rc1, I have a bisect
> ongoing.
> 
> I'll update once I have homed-in on something.
> 
> Maxime

So the bisect results are in, at least for the problem I noticed. It's
not certain yet this is the same problem as Russell, and maybe not the
same as Tao Wang as well...

The culprit commit is :

commit 8409495bf6c907a5bc9632464dbdd8fb619f9ceb (HEAD)
Author: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Date:   Thu Jan 8 17:36:40 2026 +0000

    net: stmmac: cores: remove many xxx_SHIFT definitions
    
    We have many xxx_SHIFT definitions along side their corresponding
    xxx_MASK definitions for the various cores. Manually using the
    shift and mask can be error prone, as shown with the dwmac4 RXFSTS
    fix patch.
    
    Convert sites that use xxx_SHIFT and xxx_MASK directly to use
    FIELD_GET(), FIELD_PREP(), and u32_replace_bits() as appropriate.
    
    Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
    Link: https://patch.msgid.link/E1vdtw8-00000002Gtu-0Hyu@rmk-PC.armlinux.org.uk
    Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Lore link :

https://lore.kernel.org/netdev/E1vdtw8-00000002Gtu-0Hyu@rmk-PC.armlinux.org.uk/

I confirm that iperf3 works perfectly in both directions before this commit,
and I get 0 bits/s when running "iperf3 -c my_host" on the DUT that has stmmac.

Looks like something happened while cleaning-up the macros for the various
definitions.

Unfortunately it's getting late here, I'm not going to dig any further
tonight :(

Thanks,

Maxime



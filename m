Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12B25731E
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 10:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714645170; cv=none; b=EiEczbeK212LryAA/MemEXjehEaqiycLs64NN6IXfA9s6Kuih51AHRQcQqrdoSAs/SZLNSYsLTPsWPdnM8Dv2FzBulSsvs/KRlocPIKY2QvwVterNt4VQewl5KLLrvKhY1JgwsY5+PPCNCdldK3TVKsA5iv0QbttvXO4SoM09dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714645170; c=relaxed/simple;
	bh=SzdfhFNmfbY0akJ1pT0827xvNbVlgz999vdKmYWFqO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awhKvdt6crvyKQEREKDwn6RInx2U6g4mXB5VJomWCehJ3TWI34akwbSWJrWTNCIzIZ6ovI0bFhFv75yxatUcsmKj8Xf3X6V0flbV1lWcGLiLWYIibIznOzxLZq7uLBNtRy2aLymWRrt+5qwF8f8mtT3lPjLy7SAtqbJdc+TaTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se; spf=pass smtp.mailfrom=ferroamp.se; dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b=EX49FeXO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferroamp.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferroamp-se.20230601.gappssmtp.com header.i=@ferroamp-se.20230601.gappssmtp.com header.b="EX49FeXO"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-51f0feae50fso726929e87.2
        for <linux-doc@vger.kernel.org>; Thu, 02 May 2024 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferroamp-se.20230601.gappssmtp.com; s=20230601; t=1714645167; x=1715249967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=naga1w1FW0PSOrZMYV5n9h8B1yzg3KgoDWK1Ah84GPI=;
        b=EX49FeXO26Px115TokDePYAsAFEO9EfWC3zhXAX6jfWbpocKOXECchwZVvPvSoHNW4
         7e0lozhYd0pPgl1G43FRFh+wJQg9znq666F3KQPbHdwGa8qrGgEYXZZ9uQX2NzA8gyq4
         TGk8V0kN8j+6iMay/Z2LaMOMLtDOixbE1IAKTYbUjGLoG0sIZZtGb458xnBj7GxsKFsf
         fplWcHV/CxhJvK2wcaPqd4TsgKECBO7q+gc0sU/tbGR2wAcdxrUccSTpvol4HPADL03O
         cO9Qd7kczVSO2WuPd2sfSM775y1yii2aO1Orv8p0A6Z2lM/PWnOrXP30VviPDspKV9md
         XBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714645167; x=1715249967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naga1w1FW0PSOrZMYV5n9h8B1yzg3KgoDWK1Ah84GPI=;
        b=Nx5d1if4aR/LkyYvQnGuGKlaaQfhukOLVLh4SYTVcXeLkclEGx6QTiUdveX3hRvVXA
         r2T/BNSZ3EoZFSePsxURDB2ABolc/9U66Oyt7f2sbfGS0c1JkTZgdzHoVGlfMpWYFhjT
         F1vvd3lgwtRUWzQ6LDwp1XajIyaXqq2vNWDNCdnB8j/GnagPxmRXRaaI7iaxVUBglA+A
         0GccRPFUkxWF7SxGiPg2RiPiY9Kyzf0Vv85g6Y/ymuXRqcYSPLB0h4myYIZV9edzcX0T
         svVbeGQlmrrfWohacc65hWRJJUJIgETB08ewCMPF8Qo4cfh/qTXTOwC7lp4y++jO7Qak
         qR6g==
X-Forwarded-Encrypted: i=1; AJvYcCVEZ9mPWg0DClF2wmalpFBGzrWGaEHC0jMORuHALip9BfqsN6fLHCls84w7aEZLKE+3/0AseKw5X8AalUXb8f6CW6pKRUBEBgxP
X-Gm-Message-State: AOJu0YwTCOjlEn/BrWP1ZDTgzdyq5K3hRFOrsphoj8rmm5nScYitpSxy
	V4R6K5D9TuaVjNLBhRNu75bmTqMzUwWd84Hwd4Pv3NFLDsKmRxVjLnINXfqY9PI=
X-Google-Smtp-Source: AGHT+IHCRdtXtGwWe0SqeTDND706jHkPF0K9+vbhrHzYQePwLL8tTiJLxENACnvGP+66WD2/+CI3pQ==
X-Received: by 2002:a05:6512:281c:b0:51d:a541:733 with SMTP id cf28-20020a056512281c00b0051da5410733mr1641872lfb.66.1714645166991;
        Thu, 02 May 2024 03:19:26 -0700 (PDT)
Received: from builder (c188-149-135-220.bredband.tele2.se. [188.149.135.220])
        by smtp.gmail.com with ESMTPSA id o25-20020a056512053900b0051956ad1b03sm125138lfc.14.2024.05.02.03.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 03:19:26 -0700 (PDT)
Date: Thu, 2 May 2024 12:19:25 +0200
From: =?iso-8859-1?Q?Ram=F3n?= Nordin Rodriguez <ramon.nordin.rodriguez@ferroamp.se>
To: Parthiban.Veerasooran@microchip.com
Cc: andrew@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	saeedm@nvidia.com, anthony.l.nguyen@intel.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, Horatiu.Vultur@microchip.com,
	ruanjinjie@huawei.com, Steen.Hegelund@microchip.com,
	vladimir.oltean@nxp.com, UNGLinuxDriver@microchip.com,
	Thorsten.Kummermehr@microchip.com, Pier.Beruto@onsemi.com,
	Selvamani.Rajagopal@onsemi.com, Nicolas.Ferre@microchip.com,
	benjamin.bigler@bernformulastudent.ch
Subject: Re: [PATCH net-next v4 05/12] net: ethernet: oa_tc6: implement error
 interrupts unmasking
Message-ID: <ZjNorUP-sEyMCTG0@builder>
References: <20240418125648.372526-1-Parthiban.Veerasooran@microchip.com>
 <20240418125648.372526-6-Parthiban.Veerasooran@microchip.com>
 <Zi1Xbz7ARLm3HkqW@builder>
 <77d7d190-0847-4dc9-8fc5-4e33308ce7c8@lunn.ch>
 <Zi4czGX8jlqSdNrr@builder>
 <874654d4-3c52-4b0e-944a-dc5822f54a5d@lunn.ch>
 <ZjKJ93uPjSgoMOM7@builder>
 <b7c7aad7-3e93-4c57-82e9-cb3f9e7adf64@microchip.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7c7aad7-3e93-4c57-82e9-cb3f9e7adf64@microchip.com>

> I tried to reproduce the issue in my setup with your above applications.
> But surprisingly I couldn't reproduce the issue you are facing.
> 
> One end is Raspberry Pi 4 with lan8651 MAC-PHY and the other end is 
> Raspberry Pi 4 with EVB-LAN8670-USB Stick.
> 
> lan8651 MAC-PHY side:
> ---------------------
> 

Did you run both client and server on both ends? The previous tests I
have done have only sent traffic in one direction, which did not lead to
a live lock.
But both sending and receiving as fast as possible in both directions
trigger the problems on my end.
R

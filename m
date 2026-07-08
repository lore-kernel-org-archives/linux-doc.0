Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BA6404BE9
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510264; cv=none; b=CAsgEN+ozNFpVNIwppauAMQiwSLKhT7rfHEAj4ex8mpd6BQwrovL+sH9bRB225WiIrv5kzYbL+eRctYG368kvf6gRGSH/+WCNQDP7IylSUKIxqRpRW+EfoSU96e9QISBGTqL8gEYy42o/4+beODNhXicNr/KIe22vxj+MvCqf9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510264; c=relaxed/simple;
	bh=UqVYtH1FlnS/aiysBtJjKkotNDawE18yaWKbuoyRfnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LibGzFsN3w9WMUjGFbh9jVaHl33Embrl/uATKS2/KBfDeYwkmUjfJqFa8rs9PN0HVK3FASHSlR9Y9g3+5nx1P5IYWy+mxb70b9x91NQrMobvYr05XH80AMvSWit2w10rj4c7EztBXsWc+DPrR0mQWjxgY3W76k3kPrSGe0MbSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTW5MjST; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTW5MjST"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso621042e87.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510260; x=1784115060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=39lBDIePAL1NkZjwy0kg0GS1VSHJ5/FOzCIFnS8mpzM=;
        b=sTW5MjSTnFr6r/JlPxnI3BE7aoTJeXE8JYAW37w3nGv6YRpTG+WJuytWtQ8RCEYO0z
         pzlxY+S7YzztULVvPDwJQPuDNWAQrpO02nvcnZAYta5y6QvNdGdQqMInEV+vc7y1vsLH
         aTIaKz6V03aszfCW+JjnwgOdo/iV3GE13GN/XXtNdJaUKc9Wf4+dw8NS5SZeuloJSi3+
         pCJ9RgFdzQHLp8OMNX6zEZpR3Ec+SC+coiBStKA6/YDUIjx/xsSaScEQGC1i8ElkDuav
         9ygcKPoZwJrymEaQoRf+G5nxVE3MdCEldttrNUHKiYS+oD0Xf8quxe2H5uRPMTRSQwHT
         Qu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510260; x=1784115060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=39lBDIePAL1NkZjwy0kg0GS1VSHJ5/FOzCIFnS8mpzM=;
        b=rRUBpPEGyVJqoECbo769zDhg3qpYJ+wXihRJCD2o9O+IpRFpl98e7SBFzJI7jKaG7m
         QaEiAZ5p5hLCxgZDHjA1JH7YsBx0eqbaVWZbogBHBhCEkP7eaiu6d8gQsd+wkmuvOQv3
         b7PlmC6EhqlFq+uHbwGl/7CLcykXSrnZcU71gbpPIy8ilavTEG6RuY3/7OA05dI/z06l
         XCRbbWUdl0cVXKlMPlC25lJkX840kVw4Kwm7YlkEvkPKw0QnMrYwfjnAHKo8SkFjG/MG
         bnTIyo+yQVc6FHtnCSLjEwOaNv6CgxSITKuGpKLA0MH1gvKKaP9Lvfi0hsH4oKk4W3kv
         ekjA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw+jHpQ60ZDFOTvlQsPssiRnJUR1vh7oe3wvPASCe+lMnA9JsUjubb+YkkVUNt4BT7t5DQP1gTZHY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7A7y7ETKYht/FIwmcJtluwEE36SmC9p9Jklsw9GSMqezY0bPt
	ufReAp7MHBlJHox9X4ldMC99eNDFItSukCNATgatJDWihYGq3F0coyg8
X-Gm-Gg: AfdE7cnAzPX3nVc1QAzr+l/gvlEZ7KhUCqOpfpfmY3L42pZhGxq5ozLX6sY+dMk8G0J
	OixPre3+7dQf/DkWZGGQ56iqbcgU0oJwOc0kwFuSMI6V7tKJHkoZslvm9H99q2zhA96bArwhuzS
	4Q8eaeBmr2d7KlmQ/xOV06VseFh+1GZ6/HenTIligSNseIm5mO2FS0BJaVhVjejRz4+zODiVZJO
	WB/orzJ89Nv26jqYA5+kjW0TcOCKrcOLrlKwz/RZJjjb6+J2YdI8Dlc7g+EivM53XK3kcRcxJ4r
	XVT2TUwTKi2WM9OmDb3RYwEuy2b7WkyBarElgjE3NJGMRTk2EKg2UgklRMiVvCJs5QlNW8HMaKJ
	YCM0/GrhJZxvOYW6+lVmJ5yikEapuIw/KmaW1FoLvi8UlinskxdG60YiKtQMuYFBrYED1NaXEMz
	KTQ4nqvkiF6ZXEDno=
X-Received: by 2002:a05:6512:1417:b0:5ae:c8d9:dcf6 with SMTP id 2adb3069b0e04-5b011463131mr553458e87.37.1783510259389;
        Wed, 08 Jul 2026 04:30:59 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13700fasm4437116e87.5.2026.07.08.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:30:58 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:32:00 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak41BRQBNdsQrYww@nsa>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708-true-carp-of-champagne-a0dcca@quoll>

On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno Sá wrote:
> > On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > > On 7/7/26 05:26, Fred Chen wrote:
> > > > Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> > > > multiphase voltage regulators with PMBus interfaces.
> > > > 
> > > > Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> > > 
> > > Please provide evidence that those chips actually exist.
> > > Internet search comes up blank. I'll need confirmation
> > > from someone at Analog.
> > 
> > Hi Guenter,
> > 
> > Well, in fact I'm in the middle of preparing a series that adds support
> > for:
> > 
> > "max20826"
> > "max20855b"
> > "max20908"
> > "max20912"
> > "max20916"
> > 
> > All the above parts have the datasheet under NDA. But before we had a
> > one page "datasheet" in analog.com but I guess that is gone! For context
> > I mainly did the base (core) driver for max20826 and then Alexis added
> > the other ones.
> > 
> > Not sure how to proceed... I can wait and then work on top of what Fred
> > has but this patch is very minimal when compared with what we have.
> > Like:
> > 
> > * No regulator support;
> > * No direct mode. The chip has two ways to access registers (paging and
> > * direct mode).
> > * No way to count how many phases we have or if RAIL_B (func[1]) is being used at
> > all.
> > 
> > 
> > Some other things more intriguing is that these chips, as far as I'm
> > aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
> > a gpio vout. Also we needed some special handling to read phase current
> > which I'm not seeing in the driver. So I would like to understand how
> > the chip was tested?
> > 
> > Anyways, if Fred is ok with it I can just finish what I'm doing and send
> > the patches. It would make sense to have something more complete on
> > submission but I don't want to just "steal" the work already done.
> 
> Binding should be in such case posted complete, so probably not a
> trivial device.

Yes, in my series bindings are not in trivial as we support the enable
gpios.

- Nuno Sá

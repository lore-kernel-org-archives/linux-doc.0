Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792779332;
	b=2fR1SMMJ9iuIiFLmtaz53NSQuOUoE+nUHLXUiSRiGgh1Nm3xwSWhfXWWjufTO93c475y
	 JBqAgivgj94OAt/bz8VL0hO2wxsHHB9qaCSjYPfMH/eGBJgtvLBsBdtKI/5gjNzM4RXJZ
	 TzUVcBoYc2abusvdmXKdMCfZBE8/e1AIZH9N9Ijl1HiKYd7QdpG9Ag3pTsLfkBVLjEOTt
	 Pj4L3Hj6f60p/Fa9ddHSY/HLm4Iwbv0+gYcY6wd5g/F8aTsELmV1rrcO5kpxbi9C+mpgo
	 89+Sp0XB0dhh4jqGHsHMNpAuGzgJyXlO5TjUcFNIwDVqiQge4Ll2uCEx+1iR7DRr3dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qt+ZKJaVNRWLSfsLrt7/fp04EXHG7/fEzwXs7hhdXAs=;
	b=XWkvQQJbqC7726mq6k7KVrgZlZiyTet1Q/hZKZHKQTnCwM8zSEYk5iLduQvnhS04T3bB
	 eVUJXjBdiNKkDxvV9qVbSSFTLCcu6WlD9Rhb/a+gyLtbDXaL8xtgsjDaglHuS4FOsAGrW
	 xYTRc0Z99iDcrj32Ku83KntYgsFLaDzBTUjOaNn0oDOpz2N+QiuHcK/xLrtc4iQgjnTD+
	 we9g/flYQaFQJgqke6OpUwiJGAyhbIoHmGdoiW0SWWPCiVeRf84/+we6YFpN8X9GL5TBQ
	 1MF3/nJ5u1cO9qyPy3UTBtDD0s0hxzyJWmylaXeFdGpBmxH2gX2UKfcxUUnTKpoj2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE7606A321
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 18:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEAE7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3fd91337baso162378066b.3
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 11:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792779324; x=1793384124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qt+ZKJaVNRWLSfsLrt7/fp04EXHG7/fEzwXs7hhdXAs=;
        b=O7qkyEr96a2bINpE6/r6kEb0535R1oyjk5PKdiHdWuRqzyQHVAIHlQayFrNwVqaizf
         OZjoFhvrNBBem744hV7PcpwW+uNDtb3Liqy886CyHCC0HM9q+hVxyT5gJpqo6TbWrz2q
         a95iHMVJ6s6hSkLo/uQJLWBpWlQoTZRv51uNA8sKcev0oI13JRo3QqHN9FED4MiFnc2H
         rF7HNHP3bz9cO+eP3RUTAMe+Isc/LhMQXjHhCxfmDpay9QAcYRLsLuHLwdszmyj/HFG3
         K/CQrimbe1zkJJqSM9Lhz/E2y4Bs2mMDqGiJN+StKl+H0kD7/jAOUDp5G+6V4bMpJgoE
         tV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779324; x=1793384124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qt+ZKJaVNRWLSfsLrt7/fp04EXHG7/fEzwXs7hhdXAs=;
        b=zwyxOnTmEfto/0PQs2dPhT6b29kFdOv5fJ4smXKxuTD7hLuJnTLhcLemwf4HrMDbqH
         uCdekfXYpe8mSicpapA578i8y/ZIidUmKX9mlxMKZYgft0wCEVvvj9o68Pu7Ya7hz6W/
         wgW65Fh/2tZhzUtl/W9LaFD3AyHUTrKSHx92VolahNJ/3lJpL6DoPZV22t61T/oJtcOW
         0G8ejJAYTThwPR+Si/WdcQn6aN5J3QwfoTtfxPvdusc/2l6lFDvip87Osuyx/dfeBXD5
         HfyNI1tMvNPbOwOcMdsrjfagpF/Nl6kwNv6pHjJ2Z1JLt1SLgUdjD9HKsOwA7QQt1MCS
         L3rw==
X-Forwarded-Encrypted: i=1; AKwUvBx5DbgXL0avlQ4Vlcy03FFvMGaecvMr8f5ujuHliNAk3D2T80DLx5sE3gIakFhNp1B/H5dOKhZrPTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI1F9xOc2jMOYP8yvrNrP3evZnLu5rzRis0gElmiBNbxDf+t7K4
	/bbjigMa7SZHP4Uqyo6H1rUKiqjgFnk3Ggh4oLvO897LJ98aEyFNi++K4LmUXCnt6zY=
X-Gm-Gg: AYBFou2l7/5CFeyC/eNmzPAQtSNrobjcdgUYiSTE6G8u7bqnngpr7reYTqSJqOHO6Ig
	uQf6xFbbbF6n/632wib6w85+usqs7CpD/QLwGF1Qk/e/mizch7+fDYezE1rWN6nA2IX8VKDanhl
	2IPyNunRZrpokD09FL8fjz2Z6P+oTiU5tZP17DPyuCw66aSyq5wHbKEW4ktBlfDaycaqDA+rBBb
	z17C+9Ry5rrBmVeF22/Ooy9AavDSeksFfXvtXn6kFXOERWIp64NuSQ3LxOqhCnxlpUTyLRNeLcE
	e1HUW9StpMPW5vErNCuNxmcW/pwTJA3GIKk1xcKl4aRd7lJIO6rOSFQy2S4AeDoWwqVDsMSuNlp
	hxy2ybfST5MarGvd1HAJNlZGrgKpr2JpbrzXAWVhcBvDZ5fd/7YI/1FxL77MOgX3ErYcrJwZDUa
	gIM0RdQyNk3bHfD37ZFX1o2rLpLjEVKuH9YMfkhqOUCyQRwrkPo9FDXOQXHUcjgzuauOVGTXbb/
	EqASwF6kKQmSyt5Uczgw9MddCMAfLTUAvBeLm2FuqZW001VC+2IF2YGxeYZUZYIk6M=
X-Received: by 2002:a17:907:7256:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c46a8eefbdamr488289866b.1.1792779324041;
        Fri, 23 Oct 2026 11:15:24 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46b8bc2851sm27128666b.31.2026.10.23.11.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:15:23 -0700 (PDT)
Date: Fri, 23 Oct 2026 20:15:19 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: "Jiang, Dave" <dave.jiang@intel.com>, 
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"pgonda@google.com" <pgonda@google.com>, "jic23@kernel.org" <jic23@kernel.org>, 
	"drdeeglaze@gmail.com" <drdeeglaze@gmail.com>, 
	"James.Bottomley@HansenPartnership.com" <James.Bottomley@hansenpartnership.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, 
	"Xing, Cedric" <cedric.xing@intel.com>, "alistair.francis@wdc.com" <alistair.francis@wdc.com>, 
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Reshetova, Elena" <elena.reshetova@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "ankita@nvidia.com" <ankita@nvidia.com>, 
	"jpiotrowski@nvidia.com" <jpiotrowski@nvidia.com>, "kas@kernel.org" <kas@kernel.org>, 
	"Quigley, David" <david.quigley@intel.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"sathyanarayanan.kuppuswamy@linux.intel.com" <sathyanarayanan.kuppuswamy@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, 
	"lukas@wunner.de" <lukas@wunner.de>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, 
	"ksinyuk@kernel.org" <ksinyuk@kernel.org>, "Fang, Peter" <peter.fang@intel.com>, 
	"sameo@meta.com" <sameo@meta.com>, "aik@amd.com" <aik@amd.com>, "jgg@ziepe.ca" <jgg@ziepe.ca>, 
	"x86@kernel.org" <x86@kernel.org>, "qinkun@google.com" <qinkun@google.com>
Subject: Re: [PATCH RFC 20/20] attestation: Add the TDX family implementation
Message-ID: <atui5si5xs5px_Or@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-21-jiri@resnulli.us>
 <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed52bb6d48c87ab8023bf2165cadffa259e21725.camel@intel.com>

Fri, Oct 23, 2026 at 12:07:28AM +0200, rick.p.edgecombe@intel.com wrote:
>On Thu, 2026-10-15 at 16:50 +0200, Jiri Pirko wrote:
>> Connect the attestation family to the native TDX service. Expose
>> TDREPORT, Quote, MRTD and RTMR operations while preserving the existing
>> native interfaces.
>
>Along the lines of some of the other commenters I'm not clear on the benefits of
>the unified TD/VM attestation part of this.
>
>Especially when you talk about a TD report, it is pretty specific to TDX. So
>calling user code is going to need to know about TDX anyway. In fact the report

True. For this case, attestation subsystem creates just unified
transport: EVIDENCE_GET. Nice thing is that the same op can be used for
other evidence providing instances as well, like SPDM, armcca, tpm, etc.


>won't have all the details of the TD either. Going forward it's main function is
>to serve as a nonce transport blob and it only has TD details because of legacy
>constraints about SGX based attestation. So just a quirky TDX specific part of
>the flow on the way to get a quote.
>
>Can you help me connect the dots of why the unification for the TD/VM
>attestation helps us get to a wider attestation vision?
>
>
>One idea... Not sure on it. We are currently working on support for DICE based
>attestation for TDX. This is an industry standard and AFAIU other vendors will
>(want to?) support it too. Perhaps if we could have a single way to ask for for
>DICE based quote, it could make a cross vendor interface more useful? Callers
>could just call and get some standard format they can understand. It might take
>some work on the TDX side to ensure the DICE format quote.

Yes, that sounds useful and fits the proposed interface.

DEVICE_GET advertises the supported evidence formats, and callers select
one through EVIDENCE_GET. Providers implementing the same standardized
DICE evidence profile could advertise the same format identifier,
regardless of whether the underlying platform is TDX or something else:

EVIDENCE_GET(challenge=nonce,
             object[]={PRIMARY(<agreed-DICE-profile>)})

We would not need a separate DICE operation or provider family. TDX could
advertise this alongside its existing evidence formats.

Makes sense?

>
>Regarding the device attestation part of this, DaveJ (CCed) is exploring this
>currently and can share some findings in a bit.

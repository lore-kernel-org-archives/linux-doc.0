Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCBA2BE7AD
	for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375225; cv=none; b=bCLukpDKViV8tDdjIguISJ0Y9dHxbGTs5k4aW/S1WEMQWqB5AIkjOrTTgX4k0ZzWD9sGsuHzG/hFeaFwcIbmVbKwRbag5ddDnJF0aW0D80aV/zufnQf4ys2vdEw19GuxxmgvDwNgB4f4qMJqa3Ve8yDfMCUXWdtAh72fzoun4dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375225; c=relaxed/simple;
	bh=AXZG8z2/mlESYwSYPyua3F76ehc9HJ/RiOj/ndVT6Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwCFP9gOcvl7/ttDb2/8gBID82rVFBmfHNVs77rda/mpNazSDJQ8H3+Ul3pSaqX3zP77UjwtDdL1UCy/dP8p689K4NW8reOCLQjIgXVsN8QombK4wW9z2wRjlTBDKaGqVip+FbnC7vOAKUhLS0ptMxdsD6z+QnnQUAIX3Pz6kcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHQ9UfXE; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHQ9UfXE"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3b12e8518so324240066b.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Apr 2025 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375222; x=1744980022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=aHQ9UfXEtgUXLtItA36BHSuNSOm7W0JfafYWoPyQ26lG+UZZq6lwEkklC9x29qon9Q
         a6go+m+zBy2Pc3bVZrqH//eoceD9zo0LadjTuitx/rOX7i97WeXr6WfotMehfuwrN+6u
         osbE8rKZQRA//iNTQnuzTMQ3CZB3oZSdZeNpyOVxTAuz6EVxUem/ZN5189un844KWJcD
         39JuhyJUHFiteRfvrwKQkxRCAHGqjShGUi+BAUDEPO1sKwrbLvdLWlWYe2lW5sycjEpT
         n5/XoxeUT7/h16zhMVHXBkPzuvonZ8+kJL990fgCGApJd96QpS1Or2tOia3n0tAL4RdU
         zh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375222; x=1744980022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=hUfQDZS+gIBje18NPJNZ+0tjIhvBrhJIQXNVatrz09d9IwXtWLnYY/Lb+OFRwUwDPS
         eE0H34k3C7+4e6MDdCBh4SnSz+hpU+79MWvMStuiZD/okAwNzeFG6cKl5UXGCnWkXU2n
         fbsx65J27Gpg7piBYZBgtUBk4/6rmdMv6jYzTGVXoSUGWrAB3+bT8MmoUALnS/5jLBRt
         JhTLSvVfMTp3/QlgfofuS4KyJrlxjvtQ+61BIrVJkCge56p9V3MWtvql5gR9AbMTuvc3
         9U/5DUQWCTh91mSvfaeQdQmmjQWQmXtuSpVJzYhVRx5TKyamz9fmogiCWA8TNQ366+Q/
         tQig==
X-Forwarded-Encrypted: i=1; AJvYcCVKPaUCxdN5waL0yR0L6lnUDJoHaTsFnQybYae7YlL8Syc7Y6uOuSR4m6aHdStm48J/mXKq+7dBK0s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4f37KFQ066ROV2y7QJzN9LEuxFm7R32GnYlEoI3xtfrNXHUqA
	njTI6owbiax1VHolAgEV+y+lWtl/zK+uTkthViNlPWx0XRAaUcnIKy0HSvF7X5Q=
X-Gm-Gg: ASbGncsTIVpxLya6WeAS4Z6APr4LPi9n8tsYX+bVXU7GC7hZBYz5XV+YcT86JmCjbfa
	s05RTrl06KP9iEEP3dTnpe8WjeIq8z86kk6VbW/ac4q8/Dn9ZxLVev2ak/CALocVfXR5g4YFuLh
	+LbTgckaivx5ynI7nnszBjMASm+zey6n7z7NdemJx7NJxRTENFEzpuKiTgbw2tuMdKxks4D/sWd
	lHCKEDRXCz7hTA/J4QAzzR2Ws4KtvO826D931XMUlqFZI6NfHHrveq6cNHBnFltA6XCH8KvTAC2
	zbPWzIxrrZCwEWi/aMnUtyG06GH8gbO57MMQNNQ7CH+/HIFWCvw=
X-Google-Smtp-Source: AGHT+IHgyCOoZTpXR8VI7LoO3entvTJlRIeqltOKvxSFeMXEvp7dwNM/Lz5ZzULD+8sUgZTb+VYO6Q==
X-Received: by 2002:a17:907:9692:b0:ac2:a4ec:46c2 with SMTP id a640c23a62f3a-acad36d5ea6mr209131666b.49.1744375221837;
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b4f5:b9cf:f32c:8fe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be98c9sm448014166b.65.2025.04.11.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:40:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
Message-ID: <Z_kNr52hM-iWUgyZ@linaro.org>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <2025041029-oval-cavity-7896@gregkh>
 <2025041144-imitation-reappear-a0d9@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041144-imitation-reappear-a0d9@gregkh>

Hi Greg,

On Fri, Apr 11, 2025 at 01:04:37PM +0200, Greg KH wrote:
> On Thu, Apr 10, 2025 at 09:11:42AM +0200, Greg KH wrote:
> > On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
> > > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> > 
> > let me give it some 0-day bot testing to see how that goes...
> 
> All looks good, so let me go apply this to my usb-next branch now.
> 
> Thanks for sticking with this, I think it deserves the "most versions ever"
> of a patch series award.
> 

I have honestly no intention of blocking this series any longer, but the
comments I raised on PATCH 26/31 are likely valid and suggest the series
wasn't fully tested on v38. So I would personally prefer to get fixes
and confirmation on that from Wesley and then merge v39. It doesn't feel
like the kind of thing to fix incrementally on top, since the commit
message is also misleading now.

Thanks,
Stephan

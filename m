Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE143A7F49
	for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 15:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785251938; cv=none; b=ODy/frm1aJb+D4wLPghvLDZCn9UQ8OPLzn/W+4rv3dbB4hN0Wb/j0puhdkHi4qY3f4NyI03USenNqCteI22yYVwgnDk5e33Ijed+jB35kyI74/WemEanw8V2ZC0n+wIREIutukxFg5+Nwtxem4CL2fOA0Ox1QhFBtfTr/R4noNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785251938; c=relaxed/simple;
	bh=aM2KX+SLDwftppA55jxwitKAx3AJ79bmrqQfKetSDRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlK1Uq1m5KrwUZNnXISkb6OlxYjPspVo5XklStg64wc3kKjuSoyn9Bj626ydFOCKOhfNdwRXMfbK/mNiQFeuzu6k6iVW6eQmWCql5/+JvzJMtuV5G9YzyRr3yzQp/olWvQg2keIVIydLKTetA7xQ05NpmP9LD+OuYptETLwbKxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=c4RHMNo/; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="c4RHMNo/"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso10007766d6.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Jul 2026 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785251936; x=1785856736; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9di/IG6Jc1VtV8BRHbehmfOGqBLbsLtDHRgb0wHAUZU=;
        b=c4RHMNo/pmE4n+WCgY8d45wnay3DmHpiTk7OncSgzFyWLAavDZDqRcUX+T9lATIlnl
         7nSxXs3pxewDKuWa4XzuxcDcZNyZnsXnn4Z/84qNFAnd+k6vCuBYydyFv8GkfrNmJC0e
         mlXZ78l6B5tEc3uEQP+JMUlCakBtv22KFocQvFMTNWcIiVimnTJ17z2eKG6/TuxVK3Md
         +3i45LbKZ9O6v7xeaPWvHeT4kafWRtIpbdj4urgo3rzrg1K/6V/6NeqbR8VO5iYWbljb
         SkX+6tXUE5QIBTjpH73QgSZ45dLpWORSCVPf/Uvg7GM5hB+21jgLOYil60F3jojFL91Z
         ycYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785251936; x=1785856736;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9di/IG6Jc1VtV8BRHbehmfOGqBLbsLtDHRgb0wHAUZU=;
        b=O99m9bTZGx72ioFEdgNjIv2XwcC1Lsmit1goEnKmJCfYAfyMf82ms7DL2blZDy58x5
         ML4qefhbJZwQsC8af3RRQ8Poi6tfIXZSudJhiMJSCVpuVw2cg8DIiZFYDwnchUPVh9v7
         Qk7TThMXhFuWIaXo4vbQdDiJlxHmql1jUOQ9anENDUaNFyJ5R4aor5hAv45m03JAcZyr
         +204NPagIDmODYuRVT13gxLdHxkg92GYo7HccRbfvxuDWh/cASYfWiZIaMy5ZjCpzasm
         ZPmGyKQuLRc/cTlhFuHiyuOGBjnv9RyI9FiS0N1sqQewjJ4f0FVDXX85LRgrYjbd57lo
         n0Sw==
X-Forwarded-Encrypted: i=1; AHgh+RqHNy3FN1aJ99uVTOg8kGgdMWDE30kRPFia4W3HcVZjvDNOqK2ciSlr78Bys5MoJ3Axrd0BYL86TpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJNWCu+ii5Gx5y3lD4cE5sDcaMgdUs+RBKldZvN4UcxYsOhYM
	VkRcoeTOt3bAI3FcytpZvpouXjRLbm8sXzXnWSu0qTE3rRNb3JxUDJIXivQVEER5Lw==
X-Gm-Gg: AR+sD13tCEcDJBHQwDYIZZKhlYAk10gm3e1vxVrG4TJi1Qp+OaR7hbexAOn9CcVneMg
	XymS+TNWpYhurSa/Gg5hvru1OfvPtReyyWdSxHRcwzzFO4BNyjV8NAKTRvqBghiWkiOzwIVt4Mo
	Z6zeO+bS4nsv1MnUn3orxWIaXP8/WW6XBLeBe1WcYjxJLwyE1Z4bQOyQoJX2anI3qhQ8G+8aD7W
	DA8J2PwOCnVXr1ibfTzVxN9rTH1R88A8+tno9d+4klgDEcOGZ/04B+wJTBtF9LYmDO19Jy+ZrJn
	jb5458/mMHboq6iHJ4Mgnkh09r1JVtPYeSq8BhDGv2ajGXCj+WERpBOixs1kD5VCZ5UanFOL/bt
	z1J49O8xHYXUYUT9CH/H5mIr+RMOwOiAPx2cfRZnLLjdBQdekalQFNH1Yc473jVQId6aYfspnc7
	GmaPM=
X-Received: by 2002:a05:6214:1cc2:b0:907:5319:53b7 with SMTP id 6a1803df08f44-90817306839mr28886226d6.18.1785251935603;
        Tue, 28 Jul 2026 08:18:55 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::883a])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9081dc6c862sm1445086d6.14.2026.07.28.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:18:54 -0700 (PDT)
Date: Tue, 28 Jul 2026 11:18:52 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	corbet@lwn.net, skhan@linuxfoundation.org, stable@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] usb: core: Add quirk for 255-bytes initial config
 read
Message-ID: <df358305-0c66-449e-ad44-effc707ce654@rowland.harvard.edu>
References: <20260727195434.14626-1-nikhilsolanke5@gmail.com>
 <20260727195434.14626-2-nikhilsolanke5@gmail.com>
 <ba2af6f4-0134-4feb-addc-24694fabeb10@rowland.harvard.edu>
 <CAFgddhLNOVPqnZW89W8XvD5W9nOPK51grBdraOeQcCe1_+WVFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddhLNOVPqnZW89W8XvD5W9nOPK51grBdraOeQcCe1_+WVFw@mail.gmail.com>

On Tue, Jul 28, 2026 at 01:37:16PM +0530, Nikhil Solanke wrote:
> On Tue, 28 Jul 2026 at 07:29, Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > Also, it's odd that you add the quirk flag to the kernel without adding
> > a new quirk entry for the Xbox 360-compatible devices.  That doesn't
> > have to be done in this patch, though; it can be done in a follow-up.
> > (But note that without a followup this patch doesn't actually fix
> > anything, since a true fix would require user intervention.)
> >
> 
> Well the device I am using spoofs Microsoft's device IDs directly. I
> avoided adding it because the official xbox controllers work out of
> the box. It won't break their functionality, but it kinda falls into
> the category of "if it ain't broken, why fix it". Other clone devices
> use different VID:PID pair as well, like with what happened Ishaan's
> device (his reply to my previous patch revision). I believe they
> should be added here instead. Since there are many such devices,
> gathering all the IDs would take considerable time and community work.

Okay.  It's worth mentioning this in the patch description.

> Also, the kernel's own xpad module is slightly behind some changes or
> so I have heard. There are a few community maintained kernel
> modules/drivers with many changes that are required for these devices
> to actually function. There is some magic packet that needs to be sent
> after the usb device has initialized along with doing a bunch of other
> things like mapping out buttons, etc. These drivers are also required
> for a device to fully function in most cases (the builtin xpad also
> works in some cases). So just by adding a device to the quirk list
> wouldn't truly fix it.
> 
> There's still a lot of issues that need to be addressed in the kernel
> driver space to "truly" fix Xbox 360-compatible devices (majorly,
> hid-generic or other drivers claim the devices before these
> out-of-tree modules due to race conditions). My patch is just the
> first step.

Got it.

> Thanks! I would like to know your thoughts on the above points as to
> what should be preferably done moving forward. If it happens that I
> should send in another patch, I will address the nits and add the
> Acked-By as well.

That's up to you.  What you have done so far is already acceptable, IMO.

Alan Stern

Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205B1DDC1B
	for <linux-doc@vger.kernel.org>; Sat,  7 Mar 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772869954; cv=none; b=ZCOncaTtNv9A+mFl3Qa7XJcnIKJNhuh8l6QaBlqCxdOspQWQX+NVWwS85YDUNSNVz0cMRb/Jnt822QbEt/xhdmwMWi+NIfUV2dlBkjsS5ip/Q9/S+vnlYIQVzADHgx6pNGZwiOWfrSf7eYmpIyvZ0US+7aDfPRHRALF45Fs8tBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772869954; c=relaxed/simple;
	bh=PLl3ybbEvtBt4usL1tVzzE3ceztfK3Ph05TigYRMy6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RvKQWo31YuNk11Sb9jkGEeh4dYIIGjfhPR4Jq12RIuFgwb7a6660g9AktVcNM3whsrLEg9jYSs0YJpZteJww/LrtEtfMADm5QcPTRvoLU4dj+DQywxjtzxt6mdcV6s/mJHXFmc2wassfIDFkdd0WObO6UOgmT62N2oBUeK2pqy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Mzgeg7MI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Mzgeg7MI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4807068eacbso83799095e9.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Mar 2026 23:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772869949; x=1773474749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q82vwVSYqsxgUfO5PF4fV0qSf8sFXrhZ9cxXt5gjXgk=;
        b=Mzgeg7MIOIrjh+c3vI3Akf/UIjsNyGah6a6RbQ11xw0pXsGQ+c9Wsv43WQfpej1Mfo
         dtehQ3GsKzPO+PydcLr/RnoknSaS27Z/tH49od5FsnCCB7MeCkj8qyLutf1JLXc7Fdd7
         ThvyXVsnu+Q7c2an3F+1SjedMiGdA5C3dSfulg93qQwup8IWQ6elfpQlhRQOTAZH1tP6
         P+tdaZ+mC23yQicU1Zdxxf+JCJiq4BYqQ74/jU3PUECHrc1dPph9IWH5Nv+NXSVTl1AT
         cDQz1MeaW1cB5T9aGQK5Xs7tR9qRJPLK5Fki8r80GzKu0VJmH1PfO3WLJzy6zXgIMh7V
         I2Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772869949; x=1773474749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q82vwVSYqsxgUfO5PF4fV0qSf8sFXrhZ9cxXt5gjXgk=;
        b=Smp7l+uLDIBaLxlnj9cjKeM6g69bdez16sOrsOBeVpQ/w3s3/rRt1mqSVHa9kbNBtJ
         SEuhFSZ6OI/wN2lg8PX+R85MhtGTtIAcQWlGaEdlD3/z83lEY3/01zPa88uZIoDBH7LE
         s7m5r9vSIiOio7h1bOEFKOK0an1PKCEunEg/6vy3wCptOTf2HR4qsKVsw61E+fDHPdLI
         oMdMMVobFeRM+Oghsa9rmx2GKkGqp82bk6QOysZmZbTfWYOTdCfC+Ug9TkPj5hKDiR0g
         KgFXYEZ1nvVWnDGSqepGheBAq9VpcJfVMwarbkKi/zgIJxD0PEJudAKEUt8AEKYOuprH
         JkPw==
X-Forwarded-Encrypted: i=1; AJvYcCXKZLVu5qaPOXJ3WVB5sVuTiDw07FLQMOrHi7eKAdqPFmnvlFpLDhKjc7pzOgIJFcAjhHrqdsybgbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWgxKYncbnNvCEkE8tzLBZGQ0mEi0qpuat4amN338/FOoygKsg
	ZdibviKQ0Of5/DaDgWHIMeIyEUgvSPsiE3xbR3STCnXDHuVq0iX6H95NDtdzZIguBxI=
X-Gm-Gg: ATEYQzx6DqxtZHiuNg5eD6ENWXDykh9m5WvXPcU2p5PUNOVbNbvhcHE3p7i20SSzNPz
	VPHbuhSM6CyxHF8JMLX9ijKeDpkQ05iKWx1BaDgPHlWVJwXJS8mWqOrGiATgcoMBpQJFCecSYwH
	U9d/nJQ6RFjkr4XoPUddji+tlG6dIX4IwK32iLBxzSd8ulMtdwys22MvAcLQwllesd/Lva5r0oG
	Xx02pWoGbyGbl2xzAERBGY7Nk6LAlm1u6ocjBqRVfYVCII0tT8nu1b5ItDHSLg9cmX+5jLqe/oD
	z5qIsBoxn29gbvRBARo028x5Lld4ZtDLR4SvQfPThDCDcbR9/5daMIfTWZ4Nd3hi94M3kJ8PG1g
	CBhkyq6GM2mLOIyXEtJGAJFtqhboSDZmN383Kg9qBiDixNuML79dH0aRM0u24er1ENaXDPRSgJ+
	fpLqAoPtki1u+gEsrHu1Tuh3m8qV/RVk4=
X-Received: by 2002:a05:600c:870e:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-48526951415mr82861225e9.19.1772869949098;
        Fri, 06 Mar 2026 23:52:29 -0800 (PST)
Received: from FV6GYCPJ69 ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4852381c61csm36839135e9.11.2026.03.06.23.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 23:52:28 -0800 (PST)
Date: Sat, 7 Mar 2026 08:52:24 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	mbloch@nvidia.com, przemyslaw.kitszel@intel.com, mschmidt@redhat.com, 
	andrew+netdev@lunn.ch, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, chuck.lever@oracle.com, matttbe@kernel.org, cjubran@nvidia.com, 
	daniel.zahka@gmail.com, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 01/13] devlink: expose devlink instance index
 over netlink
Message-ID: <xf2qlcvpmw64zpqsjogibda2ys33vwyectptwo5imdstwtp6a6@qokwax4d2iwn>
References: <20260304160022.6114-1-jiri@resnulli.us>
 <20260304160022.6114-2-jiri@resnulli.us>
 <20260306193253.6d7d2383@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306193253.6d7d2383@kernel.org>

Sat, Mar 07, 2026 at 04:32:53AM +0100, kuba@kernel.org wrote:
>On Wed,  4 Mar 2026 17:00:10 +0100 Jiri Pirko wrote:
>> +      -
>> +        name: index
>> +        type: uint
>> +        doc: Unique devlink instance index.
>
>AI complains on patch 6 that the index is truncated because it's saved
>to a u32. Let's add:
>
>        checks:
>           max: u32-max
>
>here and the policy will take care of the check, you can then remove
>the explicit checks too

Okay. Thanks!

>-- 
>pw-bot: cr

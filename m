Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725B442050
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 18:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376010; cv=none; b=S/Euw4OJakLAF5OPpA/Dd+p8dR66KqYmtzKz0P/uluYfNuStYkmoiPfFybDNrwW/dPlUbr3+oGy3Xw947uDp05TWPr6hJ3XSRto0jfwaCxgRb6zWUyNSMPeZK5vCjdpcftes4ll/VAChVLf77TXzodcnsLoTHxgXeOGMzfBz1/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376010; c=relaxed/simple;
	bh=QZcNJB1ipbvlJzwc2mSo4w5C22TYRAQkkpmFKA+dYJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFXirDvlcePk9hx7TpUnJdYJNlriQ997Vu8UCCUV5xObpmikXCrIEq1LpTB5ZHbOo1wKUdDKmLXCUH2m9521VS2TZRSXa2i4J9NU4yradgNl5BNLRVC0v0FiNgxy12tv+V/rD+cNV+FnR+NitSw6zvigYNKuJCf/7TFDItrHOg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZX/zuI7; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZX/zuI7"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-128b9b7e3edso9779829c88.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 11:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774376009; x=1774980809; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4KIbqvhidbLdE2zkNvP4L5iPrMq8r7qV66qKB0JP/0=;
        b=RZX/zuI7n2B/ms6ZPA7cXaGVFuHx5NQkCqA+q4tNzFX0foHv9icwAU6QrHOv/1rHLr
         BqOmb0WuFpKcB6pSSLfYUS019BuZGcDupO6UGhRXn5+sG25BlGXJJYiZb0HpWWpC80SH
         8PE2W9u1YMTSdUvjtcMiwurQ33BS3GYN4Iuz5XsGvQ/bWElwF2TSbLjf+u8XBGK11PT0
         g7fRM3eFogeff1ag+phJz72XmlzFeyAVBCVbKfP+dELQsAN2PRoUauWvBSg5SXPUzCvi
         d8f2VFOtBEtRoRlvHhasIyLaR0L0g5GCyzs90EwO/WREDhvicB+aVv4ZBsBSZ5/f6F2t
         rgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774376009; x=1774980809;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j4KIbqvhidbLdE2zkNvP4L5iPrMq8r7qV66qKB0JP/0=;
        b=Hcl+8P2JxYcSpI6k3QYVoAlGvfcbUZsapOiYBzwlPJ2pzExUtfRJtWRSLYsetqJmcB
         24R0I62fZNCSE34QIAmq/tnnkpnsyu+dwf0EAo7YnQ69xWFc3bS5CROU+glv8+D3fj0r
         JDkR350MMM4yP8DSigB16aX4XgoflFe2s7ZeZ3UmYEYywXoa7v5M5X/0W3iH2pRAXZEZ
         RZ6nx44YTpKmySBwQufvmcI0C3IldYVNlQMWcNRZzWg9Mz3EiYZozw+zQkNMxwhyt+dH
         BGtGuTTe1vHoGn2bLfTa9xKEEfGJTdh0yY57+HRBpxyUVOuzkNwTfgzlE19ayXCdcC2Y
         lUBA==
X-Forwarded-Encrypted: i=1; AJvYcCVtXY5s9FDB6hDNgiGCaUxJdebHcufj4M8iRIqm8Ql8J0ciQ/BALG4hBvW8vwQadH8f8QpBphA/Kkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ2ehnLF4OA7zrhy1hCK95boiKg9TBEGaLgMKGKelh5Qq/EUEt
	xfPJG5eJssZ/EHQFwBCBiVZ+dOFtz3TBq0i1LXvU55GfYdKV5wR+z1g=
X-Gm-Gg: ATEYQzw/PPy0gl98p/5c4DrG3L9ALUvku+QMF8SailiFdBBydVNdFbUK3SYDJS58hYH
	nWb2LHdsKMqpHHV2/lUAWMq92W1EUWyEMkgf7/abs5PLCg9Vz6r9wjbu56VGWAG0hyYS6FwHBmf
	r4ucVjM0ZTQ7KS5KPRmt6uvncXt1YNx6Jzvu3vT3TaMdL/jTBJKQOSDRpDgutPBjGsFq8kQGMdX
	svtOmPi1SOVI1z2zrGiuKU9lzW2zi1H07A1aRKPic+n+SLEhqQZa0vxwFnLBFkkKtS+sJx39Lqy
	VEUoFN5rsfrqVAAaUUmB4OZ4kQc5drKGAwsAvAvZqMaLMkNga1weh/31NnvY6YzibIALPObwlGy
	ouWuDgzQCyI6xVbAp2VDyqDQuSwM6PhH9jUHl9aFq+tY89ErJDO1lPNdCEJFcQWOfKMtILI3XIx
	0jd8URPOqwyEk1UTEt4kHcDfL9FG3QJGubd4to9UOINibwku4cT07PEHZboFxwOcsvDp6YT+T9/
	mhVdAwpRLUMaPG2Tg==
X-Received: by 2002:a05:7022:526:b0:125:be41:db5b with SMTP id a92af1059eb24-12a96f200f8mr243112c88.42.1774376008513;
        Tue, 24 Mar 2026 11:13:28 -0700 (PDT)
Received: from localhost (c-76-102-12-149.hsd1.ca.comcast.net. [76.102.12.149])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b35116bsm18984900eec.30.2026.03.24.11.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:13:27 -0700 (PDT)
Date: Tue, 24 Mar 2026 11:13:26 -0700
From: Stanislav Fomichev <stfomichev@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
Subject: Re: [PATCH net-next v3 01/13] net: add address list snapshot and
 reconciliation infrastructure
Message-ID: <acLURpj2nttA6De3@mini-arch>
Mail-Followup-To: Stanislav Fomichev <stfomichev@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	andrew+netdev@lunn.ch, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, saeedm@nvidia.com, tariqt@nvidia.com,
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com,
	johannes@sipsolutions.net, sd@queasysnail.net, jianbol@nvidia.com,
	dtatulea@nvidia.com, mohsin.bashr@gmail.com,
	jacob.e.keller@intel.com, willemb@google.com, skhawaja@google.com,
	bestswngs@gmail.com, aleksandr.loktionov@intel.com, kees@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-kselftest@vger.kernel.org,
	leon@kernel.org
References: <20260320012501.2033548-1-sdf@fomichev.me>
 <20260320012501.2033548-2-sdf@fomichev.me>
 <20260323162053.62a148c2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323162053.62a148c2@kernel.org>

On 03/23, Jakub Kicinski wrote:
> On Thu, 19 Mar 2026 18:24:49 -0700 Stanislav Fomichev wrote:
> > +EXPORT_SYMBOL(__hw_addr_list_snapshot);
> > +EXPORT_SYMBOL(__hw_addr_list_reconcile);
> 
> Why?  For the kunit tests?

Yeah, no good reason, will remove!

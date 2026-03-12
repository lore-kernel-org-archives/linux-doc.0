Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39BA34A771
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323746; cv=none; b=DuAOTcqR0o8IzcEdIJDUR+ZEuN8nou5+A51nrNVTB2YdXlzIz9JAdAcJtDynykVmdLSYsO4sO3si4VAiMcWr7wF+dRdxOWO00i6wnSKOeU56ECaPSLa6Why07wy+MlEryLNvVq4CT0eXodbTpclhgwTiGt6Dkq1JxTLLHoWpEHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323746; c=relaxed/simple;
	bh=dmWr5E91FshndRY5RZ2Md55bF+x5yW+C43tABssFijc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZd750UZf0KMAfIlu1+lh0IaYjUJP284OoIW9usob8b/CqC+lbSOV3CGoejc5fsdOWXNXfrwByggg6NR9vjDEwAo8rEF1iUb1lNW73ai7mX8uiXhhuVgawhaN2oCnzzEfFkk8q2atmg21lKe5GYxuyCoT0HBS9dPG5ykI/DmB2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATXMOSoi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eu+GeV/l; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATXMOSoi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eu+GeV/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773323744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bEtHF9LXuLxS0ovXAZV4W8RauatzMwv6n2P0Ur61wyU=;
	b=ATXMOSoiqys87XuBt5CFamWZ34ucS14uhG3xRN+NPAYpiCUYVm+DUNilJ9K1qr6DMcAooG
	fF4ZadYzKsbDPxzJhC22R4PJzylyz+AcTwS2LGnmjAMgsp99u/v5SyZb4EEmFA5TzMJG4W
	UoBmC23LMGPlvp8BrGZ37G49NjdzavA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-pK_xOSc6MbWPWKzbXbYhMA-1; Thu, 12 Mar 2026 09:55:41 -0400
X-MC-Unique: pK_xOSc6MbWPWKzbXbYhMA-1
X-Mimecast-MFC-AGG-ID: pK_xOSc6MbWPWKzbXbYhMA_1773323740
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-485355493aeso7141445e9.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773323740; x=1773928540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bEtHF9LXuLxS0ovXAZV4W8RauatzMwv6n2P0Ur61wyU=;
        b=eu+GeV/lfsBInASFc0ZmfvTQh2R/Z3IzEtj9u58+vLZbi6JRssNUjd+9tRZIuBGicr
         z4oMpIQYl0Pt5i+dFXb3NuGHHALgapZA/S5fYIBHkM0sTaViBxnrnh2BF0MO+RxDDywB
         gF4VEswfTjGXy6U2YJmy1hOaD/CQ9j9kEpm1X+lvkLClRM2d9W/Imzm5pjoW70/xAp6Y
         NJjfpOqStvHFHsUGonUHWUe4uG+DgwAU0c0t4AKUMxykjZ0U3dRHY9mkNSkJ8zyH2D91
         DNZXrkpUrnWKS5erkV4KhlzG74nUQLFhOjRcnLQvnqlB9DrQwRKwlGHAwtfPhkHH9GKC
         gw+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773323740; x=1773928540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEtHF9LXuLxS0ovXAZV4W8RauatzMwv6n2P0Ur61wyU=;
        b=ZJk+q7iIaMj5v/AXV1MIh7xne5dZKkORfveVw1jCyCNwP172abvV15ktIIPi9rJWfK
         4UQHfdf4IMkSeL3O9bCVQ3/LqcCvipa8OfFGfy92whF666+opRDtDaJRbZihBVX56V6s
         SrVtYIkBQx1ufWjXlxmmPJi/C19o9d3wYGcnEKjIOrDMcWSib9RaguUHQFHhqz0VSMSM
         vRNYZIeBRNLbScPkz+NXr374M3ejLt7t97NvJuQBzy9HJmG83d3zqcDVlmpOovmNmIvt
         PlJGNhUorfK4hWSLsNzeWIo+fggzc2vN6aubfrIMR89Gsk376lokQ2gxpsnOp/vPtfGH
         WA4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjzpstACVYiCU532xvUTi3s+aZ6q4eX2pZA1jMyBUC0UTKIovwU/zDy2ORsLfI+hqNUVEUKykyMSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSE7JVrEX9+6Zl64eSKm3l6uz50m90GzulrBD5+8usbRc8bsoj
	vLzgZHuQdZ6Om6niis1rd84UOIc4k9h23uzPlu5jHDF5jt1A+GQD26/BQwQP4TGPIhk4nxqvdzs
	ePiYeK/3bLkpMRgg3muaTsj2RBECvzS7xMKtrFNczegEIbGPsPoIR38Q+koGnBA==
X-Gm-Gg: ATEYQzytngMxkKm7NIpH+KRVHLzJTjDIqokzYx4VOpMqXKG5iCwGbLw0raFlHdvnSwn
	YFELm+9pjqVWexd8ic+qyYvnazNf3MT4zO1Mmv60PzQosE4XU/PYuHRLxF9b3bTYwDXDsV0FUsb
	xgTsTv63X5C36YQuekxsLOvNmUwU4rpgnlmRJ/O7z1pdyzeFmjMkvVs6+7xzqNrtEQzPSbC4qdQ
	8ljO3YkQzAIEVdPVAdUhitXBGIpkEZn7jUiNhyhXwb3cRiXhpZvoAZwBVvjrrPpmfnJmwIVQDda
	Qs5+PENVRzKj9g509wXXB7zXpCjbuuxhw0Zftl4jDcKeydoqLKMyLMeK4Qq/Sxlrw7Np+xNmszQ
	x3RuNBfXozYstZ6selxibwuOKsRcSd8pQk7c1SV2Vj4VbD0U0P9g=
X-Received: by 2002:a05:600c:630d:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-4854b10cdb3mr105385095e9.26.1773323740362;
        Thu, 12 Mar 2026 06:55:40 -0700 (PDT)
X-Received: by 2002:a05:600c:630d:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-4854b10cdb3mr105384515e9.26.1773323739893;
        Thu, 12 Mar 2026 06:55:39 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm259618805e9.14.2026.03.12.06.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:55:39 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:55:37 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v7 15/15] rv: Add dl_server specific monitors
Message-ID: <abLF2UPW9qb0m1sZ@jlelli-thinkpadt14gen4.remote.csb>
References: <20260310105627.332044-1-gmonaco@redhat.com>
 <20260310105627.332044-16-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310105627.332044-16-gmonaco@redhat.com>

Hello,

On 10/03/26 11:56, Gabriele Monaco wrote:
> Add monitors to validate the behaviour of the deadline server.
> 
> The currently implemented monitors are:
> * boost
>     fair tasks run either independently or boosted
> * laxity
>     deferrable servers wait for zero-laxity and run
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri


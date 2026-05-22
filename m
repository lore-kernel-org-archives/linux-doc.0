Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2147525B08D
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 05:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428658; cv=none; b=B29BfjlsBl6ytOrzqXzzthxd8Uo9aTE7UycdYqT1EMxLbPIFF4kL4ZC/p2SpDH7RnKcdz5UUTbjlo9ky/AIXhzfuDpTd+ZGEKoEPjNv0d+3KdvDa1VSjes9Ms3WeK2UF5uCSqvHuKbGx1hEsOrmSbOKcQdWkw/6WzqLaI1qE+IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428658; c=relaxed/simple;
	bh=jxixpNCHvMRotUXT27hralS4lUCiap0pCNqAAun0jjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVUcoMA7TLpgIol4RnhCzy9TBkZptjs3rkba3RScJQZ9/+/YXznaGBxjLameDksall32Qsxtd0vtHaX7SPd4kNr2euNNHjSvdAgBZOo9I6jUT9SZGtyPK4U0FtoQZS18dNmZj9YeTjyI/+o0u+CL9p5Aqfl5VAK/hv8XUFJGe1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdAoUcgT; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdAoUcgT"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8025500cc7so5365021a12.1
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 22:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779428656; x=1780033456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MRtEIqVoX2FsvAfqkFJAXgU7NEYX8w7sjZGErxmCJVk=;
        b=jdAoUcgTqKFVFY/6aGzXjz1tqeK7H+jvYad74efhjGRmRgZ78laFPSGiBydRZjxdK3
         dyNpN539GhCQxsA1c6GrmwXSL1quO0yEMGdGYUny8c3eAJl2jvRw4xTBDlOvSE0IUPkp
         5z/+2GQGqhltAlNXeH73sEsK5iq6cOI0Hk90dFlaQad9HS5HV+35ktTRtn2QMbDZxeAM
         vl7VSUUg6PpcDJKV4plNd/7Zdx+xPMR+r4H3+p07RQh7LJkDcIx392bSCv70490Ax8o8
         cCYy0vO2Jqmc86gI1VIkiBweBiZtJmyAklr/5J1LZRDRptMNLB6GMJfPFHdNZrxmlIgX
         7Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428656; x=1780033456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MRtEIqVoX2FsvAfqkFJAXgU7NEYX8w7sjZGErxmCJVk=;
        b=K4y8vMRNXZlfH6DGsMMXjyqicqtIz5Ws8j2IeCBuu3eUItdpNNMhFpzdMa2jJyGGMs
         Zqo2MrAyKLrdATOpfxh/NYZ1mGKh5XvWmJhaZrZzn6nSBb77yVjiYBdSNUeQOr4APNKB
         DGw92Bx6zEsTFNPqrChhk5IAh5V0c8pTcu9HIP9YvVOiwNII0mL6F3jwyoE9qibCc6jG
         9RQoSjHcKvgdI0gDT1hsc985jWh+Cz/kkMSZwQ7/JslTvnbA0Qw6afEpGTdLh465Q+95
         W545TuWCNZ3cKBy3vRRyT9x8NY5T1aYzpIUaz+6ZYea4ckDDoQlkqbNAovz+1O9ojOGg
         hPxw==
X-Forwarded-Encrypted: i=1; AFNElJ/BBfYP164q2Qbw3OmxFAjhaI7R+e3cF5Rb2xr2W0A6VNdv/PQWhT1nrK9yrZZBPdmp5tn58Fj1tVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gJ4kU/JDc4QQZiCGMeOfzpjksfIlyI5jwX3GLFzZ0yEDQcxb
	xZoFi+qHp6BtosWBp/8vGQKgtDjvTlW2fE79WoBe5dfpKe59cgP0Qm2oeUb1NwnG9bIvoHJELeO
	1fyMe
X-Gm-Gg: Acq92OGxjLCV73Vkq6jzTI0kbenr+6eCR2oTginCutHINz72UXkJSu/4Ym5azbhBeZ9
	D1rD6fc0tUN6YwycicLkGyOgxyFINoepWBpgfMYOnslsQ0pMinmzN5YeQEZ2BF+AzY0gXnswnaG
	YP/MEpd1Jm2aOAdBqiSg62r97ADJ7gWXuRj7CAqC3IMc5jcwh77AS5Z3xodxNBfFpOOWSp7aWU4
	cKJOl7wCnBc3zkNuWCgxBM8dILzAV7Vfpu4tuxPxoN6LmpSTxTlfIhcIl8HNxfwELoSpgrwaUqJ
	0DVizNaHWJrsVnpGDAFe0fJyin0hqhH8AvXq3uPeRISLWy4eqjHPedihWYXG6+cwsdXGfvOuZl1
	FnR8o+He3no07/scuv1KZ4CMDgBRz0aEA4KDo1AkRxVggDxJUEr1pH4AHV6LX7tAR+PLDby1z/R
	nAOO6mxfhnKUl2HSM+ETHIH58=
X-Received: by 2002:a05:6a21:9212:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3b328cd7fdcmr2319563637.21.1779428656289;
        Thu, 21 May 2026 22:44:16 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85205855dasm480493a12.31.2026.05.21.22.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:44:14 -0700 (PDT)
Date: Fri, 22 May 2026 11:14:12 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, Jie Zhan <zhanjie9@hisilicon.com>, 
	Lifeng Zheng <zhenglifeng1@huawei.com>, Ionela Voinescu <ionela.voinescu@arm.com>, 
	Sumit Gupta <sumitg@nvidia.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Huang Rui <ray.huang@amd.com>, 
	Mario Limonciello <mario.limonciello@amd.com>, Perry Yuan <perry.yuan@amd.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Len Brown <lenb@kernel.org>, Saravana Kannan <saravanak@kernel.org>, linux-pm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/4] cpufreq: Use policy->min/max init as QoS request
Message-ID: <5vwdvlz7zqldgp2xffrymwpomder64y222g3hy25i3dvnquakm@vxzl7csmrnlw>
References: <20260511135538.522653-1-pierre.gondois@arm.com>
 <20260511135538.522653-5-pierre.gondois@arm.com>
 <bflxwyho5epheovbjnzlsvgvoitaqjbiv7kxcwbnoiz2nlmuvv@dtunrpupeyie>
 <99eb1963-dadc-44e6-9e67-814ed7089379@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <99eb1963-dadc-44e6-9e67-814ed7089379@arm.com>

On 21-05-26, 13:58, Pierre Gondois wrote:
> Sorry if I misunderstand, but if we do:

> This would bring us to what the following patch tried to solve:
> 521223d8b3ec ("cpufreq: Fix initialization of min and max
> frequency QoS requests")

I missed this patch, that's all.

-- 
viresh

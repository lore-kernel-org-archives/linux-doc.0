Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177E3A48F1
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 05:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779428729; cv=none; b=SeQVXD9/0QT4dUHFVNkes8Yz/bCd1bRakdUUGRnnOSZdwNUN4TEDbJh1VTb1WhXpYmTIce/UmwlQHf7E14wPpX//VpjSu7T06xVroU2NjrPkVZ3VkEFRg8ebKniCit9BSyAb7ZGSHPEWovMfsGkh9mtofHDu0sl3wdWWAH67y28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779428729; c=relaxed/simple;
	bh=ql10Or8hiZY36+yC6GIP6J3uCWm53wVebObAMuxnouo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o9UM5nKpCqW7mZZbctdpv5yGxpLsjnDzq9SocgmwELcEv8ahQXhbdlouVqQjQxSPOR+rPupGfOK/04ejU0kvVmMGj8hB1usmJTprCNGbdgG1sEVTbqnkCg1fI5DbzfcAx/sXXIAblAKiYDYFzpAcE5yL5kGb0IA+BLlFOFU93zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v8GSlpBv; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v8GSlpBv"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36974220e45so2936746a91.0
        for <linux-doc@vger.kernel.org>; Thu, 21 May 2026 22:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779428727; x=1780033527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/AdTiE2vtDA78mvf7eekNgfm+Kot3vVx+O2IbULE3WY=;
        b=v8GSlpBvs2fHCgzvmATa4KCdIG8EGF5eOEdgwDHBPsGMGcmMoagZsTgF7Imnl0zKco
         EJ9Wu6xK4RLTsOxATaUujP+0gt1m0RDTImRUbtFCGeTAyzt53Q11gRJQX2DismUdjLnK
         pl56jmHU4T576rZZ7JLnuOzMxog6zQyyPKNqhU0Ydp9APOguTnuwFZgnyVIEeT3lhA3I
         kqqyGdotQ3IM3LUkAemNuQWKzru0yEhpAJb/XpemW8SKs6dOyBlRt5TjmP2oyJC8mu0M
         4jIxW3x+rYeJrZH9I016CozUIajRsg4V9HG//IBlXIAGu6Ce3FnlJqKw+wx5T9z45Ieh
         XTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779428727; x=1780033527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AdTiE2vtDA78mvf7eekNgfm+Kot3vVx+O2IbULE3WY=;
        b=j0Cow+dclia/2qM1rIXteWnVYw0Nck/ghLgpTNeEaU3UMWX6Y/dn2AyCQdPIrkmXtU
         l3Rg2qUEnQ4RmzP9rBK+/GjNaF0SaQlcL5q6I+lOriD/Yklgxno/thbvwsPGa+OFxVBe
         HrdYhiH/JLK9kv1C6iMRuDDS9a+15VvDTUmPQhRLM1OvGBJrJ/6AGnDCeyAnFSZ/vb1g
         VBHhHy8snptkWLyelASvwTwYbYu3KWkUGtiivjZ+o7S/2lKEKYcsKV6b+JH/UNWbZ5iU
         IsbGRWHTwf5zTgmOeJk00RA63pfH1DrzLJ6oWXpOku9p1eyDgyuDbr9ftvFRFhQSMe/9
         9z/w==
X-Forwarded-Encrypted: i=1; AFNElJ/wpcj4OOYhcV+eGQc4uR8t3oVJwjyD91VgAeZSCtfxzeDv6JbUr+DKiFLHpLwOKx1dVEqbQKQb0+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwltECpWVLLvbs1s9/ws8AmgjOo5bt/QiU1rRxRlPvPyUsta05J
	6Bm3pHQJ0M2JyzDAwag1XV7v9I+w/BJR/rsnqlaR0U32QdkVWijd6ehVu9Q1ei3E8pA=
X-Gm-Gg: Acq92OE0X4nLA9ZNokZIzBVJGe6m7IdIZs8aoHFgl0C2DcT56R+INCNmKuH6tlmouD/
	kI5jUyum1Qf6WyFSRAjouEhiquiXT0PEpyDQIuI+XSsQAZQsVQd5wPwtz1+wF+QHl6U06MsjqOT
	aF/W8MzYReyBkzg/JAcMtz670rkp/25aLitF4+AcojlqfnXvqlHCE8v93y64nrbawuyxqRgFgsN
	hIgJ5q8eOW9QTxNUYxOb1NUo4VLrIiBOHoZgQ5i+p72xgdgPu/BKexWqCJ71SIc9tZ9jJtd7qWl
	EyZSV0SUk0btyp6gsIXgM9GIsLh1sK6jgXO1NEZVkjcq16H6hMIixSJKuvKZYXANQNU/Z9nh+SB
	GgVj2EUcnIvAcXFAduXlRJw55xHVTbl0nZqT4PIqDqSnW3EgjqIyfK/NP4QSih/IdAisJkPaGv+
	qJqbgqwaR+ddt+RIR/izRd7zY=
X-Received: by 2002:a17:90b:4d10:b0:368:3830:a8bd with SMTP id 98e67ed59e1d1-36a476e8096mr5157885a91.7.1779428726951;
        Thu, 21 May 2026 22:45:26 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852054c8absm434491a12.16.2026.05.21.22.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:45:25 -0700 (PDT)
Date: Fri, 22 May 2026 11:15:23 +0530
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
Subject: Re: [PATCH v2 0/4] cpufreq: Set policy->min and max as real QoS
 constraints
Message-ID: <jwr2oiydbpebemo73ylwynwopeujc7mkb2nrqhugmoq2y52via@yspktx7mszkb>
References: <20260511135538.522653-1-pierre.gondois@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511135538.522653-1-pierre.gondois@arm.com>

On 11-05-26, 15:55, Pierre Gondois wrote:
> This patch is a follow-up from the serie:
> - [PATCH v6 0/4] cpufreq: Introduce boost frequency QoS
> https://lore.kernel.org/lkml/20260317101753.2284763-1-pierre.gondois@arm.com/

Apart from a minor change in patch 2, looks fine now.

-- 
viresh

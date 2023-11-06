Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B428ED
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 05:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eRcSAPgh"
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A914EF5;
	Sun,  5 Nov 2023 21:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=zasn4w0oFWumSsqCqP28MJ/uPlB0cSsr7K9bf/OVxqY=; b=eRcSAPghQurk40C3TGIMY4j69Y
	4Pi1KCpZsK8FUtXRJzZrqZqhaGQTCMmnPvHt7yf1SIBQGmaIHvw/3b3OG6tloG+7KxYwZw5e64w43
	Ucwd+8TWrzmoY2zVW5Za9kZ/SnJyr/GxpuEOSao0SnwPjkG+SuEpRvMO/VGpWcKudcHkwnjSzGUJQ
	r8OWlfaYTI1juyHZF1+5L1ps5p+N+8E80SUfDBpNC2SwVEdHSTRuQ+rZT8q3OpTjOQZycGCxzVj/S
	dW39s1M5goCXED/9TUyown7DWb+MzxF9Y0mn7r9kJvPThVrbnY9MUAXrd88iu546OBAafJ7G/K5su
	dmuWKKKQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qzs83-00Ft8t-2N;
	Mon, 06 Nov 2023 05:26:27 +0000
Message-ID: <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
Date: Sun, 5 Nov 2023 21:26:26 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation
 warning
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Hunter Chasens <hunter.chasens18@ncf.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, daniel@ffwll.ch, airlied@gmail.com,
 Xinhui.Pan@amd.com, christian.koenig@amd.com, alexander.deucher@amd.com,
 evan.quan@amd.com, Lijo Lazar <lijo.lazar@amd.com>
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
 <ZUh2fuCjmgle3vd9@debian.me>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ZUh2fuCjmgle3vd9@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/5/23 21:15, Bagas Sanjaya wrote:
> On Sun, Nov 05, 2023 at 04:00:44PM -0500, Hunter Chasens wrote:
>> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> index 517b9fb4624c..703fe2542258 100644
>> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
>>   * the power state and the clock information for those levels. If deep sleep is
>>   * applied to a clock, the level will be denoted by a special level 'S:'
>>   * E.g.,
>> - *	S: 19Mhz *
>> - *	0: 615Mhz
>> - *	1: 800Mhz
>> - *	2: 888Mhz
>> - *	3: 1000Mhz
>> + *
>> + * ::
>> + *
>> + *  S: 19Mhz *
>> + *  0: 615Mhz
>> + *  1: 800Mhz
>> + *  2: 888Mhz
>> + *  3: 1000Mhz
>>   *
>>   *
>>   * To manually adjust these states, first select manual using
> 
> LGTM, thanks!
> 
> Fixes: 615585d09b33 ("Documentation/amdgpu: Modify pp_dpm_*clk details")
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 

but can it be done without being so obvious about using Sphinx (or is it ReST?)
in source files?

e.g.: (not tested)

 * E.g.:
 * *	S: 19Mhz *
 * *	0: 615Mhz
 * *	1: 800Mhz
 * *	2: 888Mhz
 * *	3: 1000Mhz

This is what I have seen done in quite a few source files.

Oh well, lots of files are already infected, so WTH. :(

-- 
~Randy

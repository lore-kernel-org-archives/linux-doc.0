Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9D25B1C7
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 07:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770189325; cv=none; b=IF7FE9kwFtv0qp/JpDl6zrgQcTZkch2jb01UnFG2KukgKvXKEa0xt3Uioi2eNZeh21wI0EbNXP/HggnkjWticd1tmsRr9uBKAo3/CZq109ZZHhAdGeg3K5uNrEUgPk/o+rDtuxTArkW+fNTpviUjjxv+lETXS1dt4IuesVCXP1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770189325; c=relaxed/simple;
	bh=i7SHrii2V9xume0ZQ/Ds3fTYY3TfRh3hjqvbzH/xuv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ur/mmMm2sROAoT0jnH9q0r8hLkq3HLnCTxkksnm7+2/hyCHjfrjE7Ilf0JWaw3/yp/zt5KooaW5Pc+WfzfBtyClYsJoGHrZF2E7BYWvXc8DTyknZ3011yVRMD1LmlfTaobT4BrpIibM3+ZAb90bh8rT48VD4iqzas9+ZazD9Ryo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=cIJum6Pe; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="cIJum6Pe"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-435903c4040so4295428f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 23:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770189323; x=1770794123; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x92saUYYugyMtUj3313uzdtAS5z3eKHI07XSbNMRFLo=;
        b=cIJum6PezYHw4GB41rtyZVwGO7yKbwtAJlwIMnsUa6leV32Qk/ylJqxd0rLLxgBAo7
         iKFUey2n2S1tnBs6ETVCsQozDPsRo7LZKZZ8tQYQOgZJyD8XMINxRgCcDWs/XmZdP8d9
         EI981owvyMWYXff+bHyw5GFz3LJZCj0bBJP3iPG8wng/6AIlX5mmSTiGBNeEQ1UJfGfm
         hmiKhkaa1VhoSU8JEHWtt+7+1HdFqyC6iBz3JoI7VMIJtCHjVK8owPRYc8LRLZOhjwSv
         itCnUNAQMe7T/a0PhAhwBS+yaSXkTx394g32NxHY0U6k3QAr4SgsC7JcBsgSR+JyqOwl
         aUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770189323; x=1770794123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x92saUYYugyMtUj3313uzdtAS5z3eKHI07XSbNMRFLo=;
        b=ckHvJxxS/dnGRaTaywEevmrOVqgS5KBTCDNVgqPDDz9UF10wGrtNXuYvVBIWNeAZOw
         L4FsYez+lDuDZHhuZcfZNVlnqSNfrOd+46cjqypkwjNWmw3i7PQgIEMKYUALIV80Tv+d
         u2a+KT9VUQIuWavdMyAXIRHxTHk323qHIT18cITA3qjYu55vbwgAinGIt37ronybpuGK
         /2jaARAUe2hKXe6mBqUI0Mp9uRN8ndloEIHRJeFL/3SVwfo6Abwku/GWZSiI60jiFOMP
         e+RqwP86DMZ6bHXHj+tIZiLP/9M1Z9MurDw26wVxPb0G1MvoHC1b2OdC5hqwdQeyR9EC
         vK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdLm6DzyFczzB2uV1KcT9iBWGSt+dybeG5OhrQCfEiEsIil9mt0vxTz0uyt0rhlbhmTSUDUFhEg0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8hOzfl8/l4PEF6niio8sFO1x66fbavNsC4/P956Cpm8UYZqmZ
	1ko3yNRMmRikjLTlvyzoUhnMdWfVR3nzmIUaPeIMIAXYiJt9Kbcr/XYV2yDFzRGLDbk=
X-Gm-Gg: AZuq6aLItl4J/DZp5R9bytu5rvlBl4WAhnxunFttkWztjXSkuCcq6SmXWIX/BlzENdN
	+yaT7wZTxClXIzq7ZtmOvDSNAeinbikA0x6df7qx8QWvKwrb61YnqINo57VcP3jDCNGelfoQ26A
	QAuQ5EEkAzD6fQgzbTlI9rrQAAhPbFBlJ14nWICk11xmDtP9ypSkWqGHoz0120neQ/rOBhbdIGT
	vE3UYS/jX8wKnRgRz7G5U7mls+Hpu5JF6NZkNIpnYgrRZMFsvnB+xW/rSSsHoHbPWaF2xavmRhK
	pXW/qfsuPBtcnT76GwH5VU8EvrPulvgzZuos3nt/3dmc3BCAANg+WPRzsYyR66u2XPkj2C5Sri2
	Gpn+NRrjkxqt5V0kGgcLC8IQ0O6cqA47dWwzsPb+hdfq+xP68N4PyXo7P2/SWpEPULqeN0Id9sQ
	/AW9SMIgmcG7uh8FTDUj1mncqe4hLmtko=
X-Received: by 2002:a05:600c:4e0f:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-4830e98f6fbmr24165955e9.35.1770189323508;
        Tue, 03 Feb 2026 23:15:23 -0800 (PST)
Received: from FV6GYCPJ69 ([2001:1ae9:6084:ab00:9519:b02d:f49f:3f52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483108e3ed5sm19055735e9.5.2026.02.03.23.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 23:15:23 -0800 (PST)
Date: Wed, 4 Feb 2026 08:15:21 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Simon Horman <horms@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH net-next V7 02/14] devlink: introduce shared devlink
 instance for PFs on same chip
Message-ID: <y2q4usbmebqm6vpu32is6m3ga3f3xs5xe3jbk2g5n7l7fmt2eu@4m3guiuc3uuz>
References: <20260128112544.1661250-1-tariqt@nvidia.com>
 <20260128112544.1661250-3-tariqt@nvidia.com>
 <20260202194946.64555356@kernel.org>
 <wdkd7yelgosii7bklmahxf5t6xnn2vydnwiiruiwqpyue722dj@yjnkcdctzeav>
 <20260203184200.216bb426@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203184200.216bb426@kernel.org>

Wed, Feb 04, 2026 at 03:42:00AM +0100, kuba@kernel.org wrote:
>On Tue, 3 Feb 2026 10:44:16 +0100 Jiri Pirko wrote:
>> >> +/* This structure represents a shared devlink instance,
>> >> + * there is one created per identifier (e.g., serial number).
>> >> + */
>> >> +struct devlink_shd {
>> >> +	struct list_head list; /* Node in shd list */
>> >> +	const char *id; /* Identifier string (e.g., serial number) */  
>> >
>> >Why does this have to be a string? The identifier should be irrelevant,
>> >and if something like serial number exists it can be reported in dev
>> >info for the shared instance?  
>> 
>> String gives drivers flexibility to use anything. Perhaps I'm missing
>> your point. Are you againts free-form or just string and buf+buf_len
>> would be fine?
>
>I was thinking binary buf+len is fine, and we shouldn't really expose
>this to user space in any shape or form (hence no concern about free
>form).

How you imagine to name faux device then? I'm sensing that you want to
get rid of busname/devname handle for things like this and rely on some
randomly generated index. But the whole ecosystem is bases on
busname/devname handle. Any idea how to overcome that?

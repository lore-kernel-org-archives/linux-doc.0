Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FAA4052AA
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 11:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409261; cv=none; b=JRZru6ruZs7HuyyQSasjT9Emh/tM1SeszL9/w47MMrkhKFZ4AnZkGOUxTfCXcMjm20m/V+sjmby1zGvf6A6SMP5jFol2UX9aDy9rPxEeT+wBP/Veha5DuPfJDkdTWxDvtQMsMaeF80JZWEsvADtAUrPkVLsHyc5DOLaYk6Fmh+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409261; c=relaxed/simple;
	bh=IkecOhyE31DlB6ewxaKp3faFALMJMMHrlZR/v5uvapI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0fHkWAIsr/h7D3S3OxGdnyA1qLgc+TWU3B0Rr5wQST5hg/Xo/hnPhKyYF/Ut2u4tjvfLHPsMVh31ox6kutCGcobNXlz5kF3vEZp/8VksXYG0fr4fR01Kaf0sTHGIEmxsCDxniWqcgFlnwBRwbHPcN8plpRUyQOs5r9ZknWvqPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=v5IFtawI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="v5IFtawI"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1273994f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 04:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1785409256; x=1786014056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZohQaCf3r9LKYnA3FBqlh9CHwHw3y+cuU8Dt+LV0QCQ=;
        b=v5IFtawIwOPctGXvOtm2VQB/EKa658FwM43NWzM0f9p2j2If9F6GpR8KlAWmgU4vLR
         4Ht4DBRegp0Q3Fm0n2rOSccyuyl14ri2KhbW4ESlD5z8r/8YBYpW+VpVL41aQ4hgbHg0
         eCPK2sq1f41ztD8b2qFjPvKHQExkmfr5fC9R7aR5Q+JvzKshDD1VNnggkgF28AvEmivl
         lOMjE0F+PGOvivianG32TNSnUchPXeKV+xDR9IZzot+44NvIbVGCc+HttA9pUxRl9pXH
         SyD2Q0VlYWoVguixSQOoTudUKyDJl0u3lBo/BHuVU1Xt44oGghYRawgNbit6AR1pgVGr
         FRDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409256; x=1786014056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZohQaCf3r9LKYnA3FBqlh9CHwHw3y+cuU8Dt+LV0QCQ=;
        b=FJyIzt8q5qAvaxBx7txn/uI/7ksKEcU2rwUFbW8kpyZ03mPKwhJQr/dbc54aD9BNYO
         Qfx7jZDtWTO/cmCWSM503PGegd2lSiPg2R6BPRKvhq8mwfOblJg5za0aERAqi55I4bj4
         zdmBywwZxnPq/OWknK/ofErawTEWxg7IICessMrCNOhkXFiZd2BhcJfydFwZUJqweKQ8
         Fh7glWfFuLNzd/GHF6A2CX9nZHnNTiBoX+vXFEXjlyHgm714MrhCE2RkuK7Jfuu9ShEk
         KS06D2JaIRF4jYdPVLizIIAt6f2D1Fbo12ayjpysA6MECYoGmlNHZj8r+1aIqIoaXQFE
         t4Dw==
X-Forwarded-Encrypted: i=1; AHgh+RpjU5Uu6f+kvY8L8KkRBD1dOH76GPlB7e8J3URMJMR50+Uw+TyseMonGdmRuDNSiYqf2i6vNxIt1p0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJrkwJtf/8FZWGV/zElSe4/ipKkluJpQ3evwiJa5D3rYUu8E0k
	V17E4VkdpoQgItuRtMejJI044sSbwcmh+QavoSdgborWs+IvQ2Rc9K0S6FtJAGWmKY8=
X-Gm-Gg: AR+sD12ify1VXGDUKD+xzSYp3UTdy08utNGZGdMKuocAuhzeQolhCPhBaLElmertCg8
	1/hysVRh8fTsr3UKQkITt0qjEDs46YWlqvpQ1GlDrJTWP/r4gOOT2+6graYtu0z0cH73VShNxuB
	XM+6Pte44+3va0a4WJKihOx2X8E/NHQYLWPRvVWE95gXAvYk83wSP8RZ3yoYOt8t5my9lPXX7Rq
	IhnMbOBU9x4bp0Y1JJCVYoALiwkt2usSLyVnB94ThnXy7U8i0O8uC4YMhhf0PShfeoueZVCdQQG
	yyCdCqLoRIr8JO9EePehTZM8M4XkZAeQI62vgiZ7wX5sWjLjtldVn96XQHUNJibY9vG6Ay/PrWi
	y9yqKbk2cIKIrQa4W2M3nrj2dXbOGrSgyT/V/79UM097o44nbu2HGG+9EDOPayOsqzDtKlkZiuz
	5bIHWw5iVgVqOfrr3c2tN+UPSM/iLaCnVtdIY92jLrr6osrxyi6xvYuvhOqW1QQctcOnmg/w==
X-Received: by 2002:a05:600c:6289:b0:495:3fe8:880f with SMTP id 5b1f17b1804b1-49800e6ae41mr26675685e9.4.1785409256325;
        Thu, 30 Jul 2026 04:00:56 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f19bb3sm49193765e9.4.2026.07.30.04.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:00:55 -0700 (PDT)
Date: Thu, 30 Jul 2026 13:00:52 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Mark Bloch <mbloch@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next V7 4/4] devlink: Apply eswitch mode boot defaults
Message-ID: <amsu3mbWht_pc4KJ@FV6GYCPJ69>
References: <20260716084852.549909-1-mbloch@nvidia.com>
 <20260716084852.549909-5-mbloch@nvidia.com>
 <20260724161111.2ac47089@kernel.org>
 <c6c0d67c-d832-49a1-b62a-57fa6ee56a47@nvidia.com>
 <20260727131033.237f70b6@kernel.org>
 <amnDfSmMVzpiH2gE@FV6GYCPJ69>
 <20260729160608.3c491568@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729160608.3c491568@kernel.org>

Thu, Jul 30, 2026 at 01:06:08AM +0200, kuba@kernel.org wrote:
>On Wed, 29 Jul 2026 11:11:53 +0200 Jiri Pirko wrote:
>> >Maybe a middle ground would be to add a dedicated devl_init_unlock()*
>> >were we can stick such init? Slap a WARN_ON(!registered) in the normal
>> >unlock? I don't want the normal unlock to grow in complexity like
>> >rtnl_unlock ended up growing.  
>> 
>> Yep, that was +- my idea when I suggested this, to have this in a
>> separate helper.
>> 
>> devl_unlock_in_init()
>> ?
>
>Maybe "after_init()" ? "in" sounds like we can release it multiple
>times but I think the idea is that it's the final, single "release 
>into the wild" unlock.

ack

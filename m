Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9283C3A961B
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 14:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778769320; cv=none; b=P4D1BQ5z3ZSNDwLM3tlx0TNtLoSd16J1eXqTpTrLph1385CoftiWY5KjSS10/1kSIMnddlB8Lx8aMVaCBXOhrqtTNfiTwYnFHc6IDQbGLKrT6nJIcCQHAL+aAFAiUvye0c5OWOMBPR0GDPhzeapIn+Ntm060TZLH0j12dM8Nk6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778769320; c=relaxed/simple;
	bh=XFku5yzYOiAWkNshlk1RONi26wOOTtlVdHy89dww+pw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKgWRetFHA+N4HTZgcmvU5UspQHab+CrOh3o6ZOdQizeVbpp82gOc2rdTI7JATOTJ/zkIIB25K0h01Dx8f2zuT7AlBamVudF0go95IJT2hDxDZ+4Iq7j3B0MflI/otqemfpjeWrc9+xnH/xxPJI0ThQauoH5ZdLFM26mNCb5zgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbCH9f7V; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbCH9f7V"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-453903ee4adso6943476f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778769318; x=1779374118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s/Z4/+H7H1VVZuahgNCo5Gog19+W4f6AXOwm3rTI+q0=;
        b=EbCH9f7VXhl4iMUnJhrh4wHgMJ3qIumD8DgKlFca+XaCTqZNQeGFu78onpDkbWxcmd
         L/JYhdp0EhYSLqPhlraBZfLrUjTAhJ+P6OeE2esjOh/Vgwie4XH/Fr6F8DabbH6c+dHZ
         4tn7qbXi3LTQg60/BphAJRfJ13uAB3jkc47uKEtEvCGZUlH8q/X+AylcW8uUihIExvb7
         0+FeFiBnVHjWrstRvshoCqSJQCTQJ/F80wMejS/GBvTWY5Oi3jcNRiqjNy8E1ukSpFgf
         PIxpCRlFHwqf9RLpVPh/OPZyIxJzLTtcG/P0htmJJEFtX3HvFRL1U0lRTGG6HEj3QP3B
         97cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778769318; x=1779374118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/Z4/+H7H1VVZuahgNCo5Gog19+W4f6AXOwm3rTI+q0=;
        b=ZZkIp5llrgokeFN2wsp0ZNgT3+58kcDTilC7pyD3rF17QOeJDPw/yzL8mk8t1SB+r6
         sLpCPkjzeUVQS4t4sLRkmu4z5YgWg37upyruATijDdyIBp3dqyo/WzW3oVXtg5t9maEg
         bMTkQ3ACDalZomDchWuPUywKHTLpksAHgp/BH7HeajZA+cxsxmso0LoK3LDa+THrZ4yR
         AOfSpWySrY+Yvl3ecGLoHMjBCR7BZTqe2RE0Xz5L/mi7BkquKSX8RDiPXmhXwR9wGkeE
         4h4obMEhx/onWcl+67DuI6LuFbLgb7rdSAQ7FUObEiQVestv4y4ckC2/DCN7R1vxYqi7
         Efdw==
X-Forwarded-Encrypted: i=1; AFNElJ82CsymE57xXEdXdj9r2GWI4+wkyhwhQlDceDKrzmi/zJJF3QFLcLl2ZmEiFkdxpvjh9y2ZsEO4TBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbRPY76BkpOvh9ikfVnr+DznBXTv0Ks1OLTc2Dybd4J7wA3zud
	r7MOuLKtLxb/MZnmwTj5ekSSHt3UtftgwSRKsoBKhAhhdPSq/Jy9ZzIk
X-Gm-Gg: Acq92OEGZ9X0t9AhwvKeNlUo0BQvNPEgod8oBx5pK8yzxdOiYoiyM7KTO7vqHj127Iq
	VDwVmDX6zVc6WwanFKUoXx6kdCk390D0LuT65xRzNZri+fV7ys90fZt6o9sJ9TyoTjAzDModKsC
	VA8pDAL4NQl/vJr60MNigab/V5IbhtYapoYgsT+3BgrIi9Zt75tEjaaAE0I00BI/g/R4yJ+CBk7
	Mg5zQ3OkL75SSB6xUwAgbvX5BJ+VzFdT6KMsCRSRfqe2g1o7c0SKjyehDXJv+xU+jHlRv9k3lbC
	jx5X6V4+yQp2/mj4sb+IbynsSyO+MszZ5+rdsIjueffkgPAuqkpuK3MB85nTfrQ7IUL1ktHx3AE
	cVKq+RsU+QrjpdVsQ2/zhFxzldDBFR3JlzRtwbhhuA1GP5YZTnGEd+Ik92k6ZMQzQO1QpONI9I7
	Ju7RaFgURPDZRovP53I4q3kvTHpasqmdYqHL1H
X-Received: by 2002:a05:600c:46d2:b0:48f:c903:955f with SMTP id 5b1f17b1804b1-48fc9a4c78dmr120777745e9.23.1778769317918;
        Thu, 14 May 2026 07:35:17 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200:b655:ff13:e355:16a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe46d8daesm1231655e9.9.2026.05.14.07.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 07:35:17 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 14 May 2026 16:35:15 +0200
To: Sasha Levin <sashal@kernel.org>
Cc: Michal Hocko <mhocko@suse.com>, Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org, akinobu.mita@gmail.com,
	live-patching@vger.kernel.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agXdowd63K8j43xi@krava>
References: <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
 <agHeZPA3eHhJHIsQ@tiehlicka>
 <agHgDgwu8H9Opzpl@laps>
 <agHm9Vj7bPPCRS1g@tiehlicka>
 <agH7_QBPLWKTZucB@laps>
 <agH_bGUTvWm2h5g4@tiehlicka>
 <agIHsN9tiIHnVTeV@laps>
 <agINlnNN4ubZgyiN@tiehlicka>
 <agIbaeBQAr-RkqYc@laps>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agIbaeBQAr-RkqYc@laps>

On Mon, May 11, 2026 at 02:09:45PM -0400, Sasha Levin wrote:

SNIP

> > > Even if I'm okay with rebooting that often (and I really really would prefer
> > > not to), this doesn't solve the issues of a larger fleet of servers that can't
> > > just reboot that often.
> > > 
> > > What am I missing?
> > 
> > For one, you are missing more maintainers of code modification infrastructures.
> 
> Happy to add more, but I don't want to be too spammy. I'll add in the
> livepatching ML and the fault injection maintainer (I couldn't find a list).
> Please add any other folks/lists who you think might want to contribute to this
> discussion.

hi,
could you please add bpf (bpf@vger.kernel.org) to the loop?

thanks,
jirka

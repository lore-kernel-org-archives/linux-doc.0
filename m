Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335246E5E9
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708627627; cv=none; b=byu1mL7QPb4fHejuezK4tt4SriEPCAdtPNuyhRlGPuo93KUp7FQP60oJ3H9MCfHo85VA1ZpOYfZhZOnM7/ROhqGrjhpxz8JoR3/V89NXgkiBq58P01MxwCTdnfg0EhGmggD2K2rBCJkK4UvDQ3N30clEiJ3hRoBeBwVT56UP7uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708627627; c=relaxed/simple;
	bh=NwoZ/s/YB6zInacwyEad3YhKFkgtInk+ILfXRdyVvto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDIHlzLh2k0COtwKvozwR7MhfLC9AXjOtSzT2YXvdppYcnj6yD4YuLxA3cEZPAQSy6s4M2OhvW5EiMM/4cuknc+2lgxPs6zFV6bwo4idcOplwKhqz+uJfD/eT65n0zrC9SAAc0ijBDmkGYou9BHMIhQxi6FsxqmjxLBSL26D3dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jZnn94kL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jZnn94kL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6da202aa138so1385327b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 10:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708627625; x=1709232425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W4vpO/kuwhEAbu5lyhpp3cdM+wCLzEUK+hlVl6YVNB0=;
        b=jZnn94kLXyYka+9eXc6AizHVEys8TFY2OiJFG7PIg2WwOoOPGz/WnjIUBC7K1XuDyA
         N9WXbD4i43+FAb+UXraPUYghcAZtBZ9c/hsS++vfJPdXD4DWX6Tn2LFckfPHMQVQ39OA
         b5jXaD5DSRAvbP8DPkBMeXcy0mMxLq472fvQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708627625; x=1709232425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4vpO/kuwhEAbu5lyhpp3cdM+wCLzEUK+hlVl6YVNB0=;
        b=BIrnOOuIVN/MSdWLjeKREKKh8n1VixJVMOSw254S7YaLv8JYng+yx3442yXk5isKpm
         KvzrIV+MatITr7Rt7Yzi+aVzJsefnRKC+pAiuvSV7HQy5xsmRdRV/MC1UnR8rkXqINix
         Z+29y/ZtT+Y+nfJ6khMOn+MJoaZjma+ONYlobx6MfqYTnyhXR7fym+b8iYrCYDl1gc8b
         5kL5ajlJyRnEwZIR3HpmVNJOJh0s74JpExmNdup1Rng+I2JMRRXW199ogHHfuZhTohSE
         25/f/nHXTKabX9VAZRFgv8d9X2C5INFI2Jx/yfsIBJTRSeW7zW/0e9HwOWtVShZ+Wcml
         w2rg==
X-Forwarded-Encrypted: i=1; AJvYcCX6zkrH2kuYvC/cG9AkvMpNZnedX/9eYxZxFcTORM/COvoyDDEHHxHgxjCnvyVkOeD8EA3CrgOE7FxllNzbxoBvWV9jUfhcvy9r
X-Gm-Message-State: AOJu0Yz9vuaFgfDIUxT3iPTFfny1xt8BULbN980d/yplvB2KNaMqZeTh
	5lRaR2e14tT56uuLSkngkxxtgOG95oE0klJTNIUFqXJf388naSRRO4cQrgSBHZ8dNVm3bwjLFYU
	=
X-Google-Smtp-Source: AGHT+IHgy3WwdGAsnQPmK2m2JDsitnCNDlW/VOsDIP4yBtdVhbhIse0VsuYogkkxJuuqsoNLgdNNGw==
X-Received: by 2002:a05:6a00:6c95:b0:6e4:6a3f:f065 with SMTP id jc21-20020a056a006c9500b006e46a3ff065mr12647864pfb.10.1708627625231;
        Thu, 22 Feb 2024 10:47:05 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s12-20020aa7828c000000b006e0651ec05csm11280323pfm.43.2024.02.22.10.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 10:47:04 -0800 (PST)
Date: Thu, 22 Feb 2024 10:47:04 -0800
From: Kees Cook <keescook@chromium.org>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: Mark Rutland <mark.rutland@arm.com>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yhs@fb.com>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Haowen Bai <baihaowen@meizu.com>, bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Yonghong Song <yonghong.song@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Joanne Koong <joannelkoong@gmail.com>,
	Yafang Shao <laoar.shao@gmail.com>, Kui-Feng Lee <kuifeng@meta.com>,
	Anton Protopopov <aspsk@isovalent.com>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6] bpf: Replace bpf_lpm_trie_key 0-length array with
 flexible array
Message-ID: <202402221046.020C94D@keescook>
References: <20240222155612.it.533-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222155612.it.533-kees@kernel.org>

On Thu, Feb 22, 2024 at 07:56:15AM -0800, Kees Cook wrote:
> Replace deprecated 0-length array in struct bpf_lpm_trie_key with
> flexible array. Found with GCC 13:

Yay! This finally passes all of CI:
https://patchwork.kernel.org/project/netdevbpf/patch/20240222155612.it.533-kees@kernel.org/

-- 
Kees Cook

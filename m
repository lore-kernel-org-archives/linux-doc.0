Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891038;
	b=Oe7Og6X9v6r2oJKvAH3BLAeR03nCPFJvt5Lu/FiZqq+4daS4UbSInBUjfc1Jmn4c2FxK
	 /FbZEpOgOlcDKU7o30i+i2D3FaALpGPu8eCed7F8Gp0IvfAqY0cHIGuFTdKX6Sb3+rAIR
	 U1HJgUNdz9CQvGgQ159l8ZgOAYLQylSrDGUdYpwJL+CflOjmR18ZlxzT+4xvBNtinXkYu
	 xY1qKZrlOcjVSVcHNPvWJoxj/X4EtJheKoj5ljyRRs+3OePMD06r9cSH9y8u+LaC8MmWq
	 geAzvoqhOwb8M9qoshfglXFdMt1ovfNv9wQYQNiIs+9qxy6H6o0eI1b2riUoie7BebQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
	b=wI3edHRjr4Wr3Kgl66582UpvmsLYv09tXb1ZwoOvPFA0+CRfLgR07yvm3tFa7/kibF28
	 tnF7zZd4h/vX9Gaqzw8+wQFLIQvdbxIlbV9LaSakvbRIxKdftnahnn/B2XlKHc2SjpCT/
	 KzYPSYiRKuGGJ0bsmuxJMqIi8bmooCqWbOKaEPSmLLx5RsJsdZHlt9xT6wJOucqr6C34/
	 GHgQdlq1/y5YtoUVu4keumwYLpDgCuTC7FTgvOtnLnb1NCeK5LFE8Zp+8XxHKcBo1fgMT
	 vI4MrAKTlbUiZyE+/jb08klje2Ihw4jp/o49odcQ1fuQg5ysBvcVbL1VfKjPU/4J+UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JVoEkBuR;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54677606A339
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 04:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54677606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=JVoEkBuR
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so5373840c88.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 20:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794891037; x=1795495837; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
        b=JVoEkBuRB7FQiKYHvBCxvAxh9Oaxf01xN5UIrTjfVi6OU10CeKbp241d27RcBRcSsk
         /Xi/x0gE95b4H/4imd4d7XC7TvMqKuqGtZq30FdKfitiezpDW1A26JSOriDXlFFBwZBZ
         HwMfdVtpba397eVPFTvqZp/IbohPL8IT2620Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891037; x=1795495837;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9bqqmMB4+kyoRGHHPejEHuADL6UxgHY0xArC5J1XYUg=;
        b=s8pgX/IK/4S6NY5XwIepvvEDuJT9dteYQwM1mq4Ua+YX3q82Ms+XIzR5mxFQIF2aHV
         +b8nZmzcTwIpIZ/dq/+Z9oo+eEQcnkfvXhIXnhsDYVA51iGPb9Am6r02kMQO8yma6kKb
         Wa5x5kNZyZsuwkRiia7lvEgBC2vwXZXlc7fv+iTMVFL01sojCOWR4+NzRrP92nCOJVeX
         TFfM8S4LH+4gsKuLHN7gi19ZEsEiLK9RwQ6pGm7OID+GJmL1hcnpHrI1n+wHes50UIi0
         cg4kzzbinVKi+2qjffWdqX1R4ggvv7S6ma5FQCAIoJtxH7cBrrjSYDCuIZETawKkCV0d
         6Lqg==
X-Forwarded-Encrypted: i=1; AL+hErGUEem+aY8X4SyrjsU+dF8Hx1Dc9uFpPkwK2rW+pcvbf9SgPXe58Qii+nlsWyQe2a7vKa+qQKGbHr8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9L3S5+sHGFl5l+NlxO2mWBbM3TZFjmqz8ug0NoFdgaAu2kNe2r
	qf6cGNQALrTwDFqLd00vMAbW9iZhJeDccjHnxym/j0lp0t30gLn9mrv8tsIappGrask=
X-Gm-Gg: AYBFou3MsCHHPNAgVOehB3Knf4eOK/O+VhKz0NipqkK6dS8ZZltUzvxoV/Jh5ZTsOjf
	FMMBXNpA7bQK5Qlgy6oMg9aOT892Cv6zHK5qADQrt7j83ELfbq45n/AAlY1W4AGhXTcb/UdxoF/
	5XE/KVNLv2tNeflfCr1x1Drgd1OmMeHZl6yszRfY2AFAqRQCoG3vfW4bgTnnaDli8uLlAzCB7qL
	LKyBcaKiBkQiovCS6lnKEo/1BK3OfkWo24fkrZrtQzRuxNPj0euZ9NqBW+2M9k+5zdaoCkv1c7C
	biqp6Q6fjwrANWK9Fjfzw0DyyT7Z+rFSgGeY3t1WngchMk+TpH0tVJlAkkev8Mh3kQQi3daZ/Xg
	nJsGyrLIf7O27ppoZ+VXIG5n3vy3IP0VA0e0GinRc92XLleh1XL3ywh9ok5o4tz8GGuwxImrA+w
	MWjpWXTr8SszrZhJZsKTlfOLGaI5uOpV0Pav0pNTnTlsgEpgL0CXLgJ4rurqAvuAfbQofajXeZh
	D2JZl9BVFfvVguLG02XEn9XsN91hztDkKf9uB02b4ng55grnJy4PGjb4iJmma8oLsuJcnvv7QZ7
	H4DNHL1oG8H4Na2VPO/1lk4Ro60bI04dqee9BVSG9gvasqy8T0vzIlaYMpcKtJuQoa637nBhV31
	RLZLdB1BVBZmKjbmIcEEHc5xygR0YlHwVrPkHPin/IQbHLWoHT91//HO80d8Zryqvk+SUnrByiV
	Jsq21ir7wVsbivmFw18bBzjJY4Yda+cZF1o5CJGXB7hBZwehs6St0qnSGH1rXyXFnt
X-Received: by 2002:a05:7022:96:b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b503105175mr11734678c88.20.1794891037361;
        Mon, 16 Nov 2026 20:50:37 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm53517692c88.9.2026.11.16.20.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 20:50:36 -0800 (PST)
Date: Mon, 16 Nov 2026 20:50:33 -0800
From: Chris Down <chris@chrisdown.name>
To: Jiaqi Yan <jiaqiyan@google.com>
Cc: linmiaohe@huawei.com, muchun.song@linux.dev, nao.horiguchi@gmail.com,
	william.roche@oracle.com, ljs@kernel.org, vbabka@kernel.org,
	tony.luck@intel.com, wangkefeng.wang@huawei.com, willy@infradead.org,
	akpm@linux-foundation.org, osalvador@suse.de, rientjes@google.com,
	duenwen@google.com, jthoughton@google.com, jgg@nvidia.com, ankita@nvidia.com,
	peterx@redhat.com, sidhartha.kumar@oracle.com, ziy@nvidia.com,
	skhan@linuxfoundation.org, corbet@lwn.net, david@kernel.org,
	dave.hansen@linux.intel.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-api@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 2/3] selftests/mm: test userspace MFR for HugeTLB
	hugepage
In-Reply-To: <20261115160105.2507650-3-jiaqiyan@google.com>
References: <20261115160105.2507650-1-jiaqiyan@google.com>
	<20261115160105.2507650-3-jiaqiyan@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avvdGec7NCt5oAFr@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Jiaqi,

Jiaqi Yan writes:
>+	map = mmap(NULL, len, PROT_READ, MAP_PRIVATE, fd, 0);

This isn't right -- a private mapping reserves hugepages of its own, but the
4 hugepages that setup_hugetlb_pages() asked for are all in the page cache
by now, so the seal mode fails with ENOMEM when the test sets up the pool by
itself. I think we either need MAP_NORESERVE here, or to ask for twice
NR_HUGEPAGES in seal mode.

>+CATEGORY="memory-failure" run_test ./hugetlb-mfr

Probably worth adding a 2M line or two as well, since this only runs the 1G
case, which is skipped when 4 free 1G hugepages can't be allocated.

Thanks!

Chris

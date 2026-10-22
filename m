Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678313;
	b=F6B5xjR922EocyOGLtkKC9dFe5ZlPMWD2YdoYP8lCxlGEbkBPNXP1JGYiZQouVyFscC8
	 m3GyCDxr+W4jtpjcZ8r03cLmkTyZhjvt5OkZrnq7adsJTSUwAeXL6gj61tMWZG/kj7J/d
	 TZOvmYZuRtBRCFMSXEFDOcTLUjnko8OoO2CWngBz4b4r3KBmJrHuDElx3cypHhbVDA3Hy
	 /R51SGW1nNyaPXAIFS8ZfGTdDf+zVuiCjvljuSb9zDWMJ4dkdaN/SjMSBty/x8RZNrTn7
	 lWFp5kbcGHZEGJgHCL6TTR17H5Cx2+dbv0OlebrF8Cai9f964liFbs8UCtyvY3NpALw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J0ObRZqURp05kcBQ0Zv+pu1j99ivc4QOppayGe5sXtU=;
	b=GmA8uTP3GieDzNi5Gb7vv4KhCyNHAsJlgF3Abv9lWCMoQYDvhQBnkLWXnEXlu3aNeDP0
	 lczA8KftZ5D2lhaCgRQq7/LSyHycUZs856b9385he74vxQTMFUMCZDDEEOTEJyu6NfZwF
	 JC4i+MdFT1BosypT70RBTA8Y/BW78t3KcSwZ5XlwJ9OjgUkuU83KmlvPBCtH7l+JII7OY
	 Ltf3K2dTzj407jW4FPDk+rfZewYYsxK4Y4Y55GsAQof2S3I7+MIaMGexUiyZT29MYORos
	 oYkL+wAyIviYz6SvpEwV4BoAcLhtQO7NBitzhPWz7yEaA68PlRU8MReBCdDmYSzBdbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hspHbGix;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF24F606A320
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 14:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF24F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=hspHbGix
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91b9e758c50so14597236d6.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 07:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792678312; x=1793283112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0ObRZqURp05kcBQ0Zv+pu1j99ivc4QOppayGe5sXtU=;
        b=hspHbGixeltXLiUWFKLsGHAgMKVn7rvek1mOKEilJTb8bqmvEgcqQyqX4UGFtDg0pK
         QQUrekoQdgImuSvigHwv42IcxDuOq2ghijqvNxgvS0lHBE6gcsdD8/JToNc8NHgkPGM/
         arEC5Ve8URC/4X3t4fGtPrWhiZiZ80aBMkXCwBKodF6s9uE/XC13TdyLK4U9DIoROqsn
         CWPCMQBu0Yd6Q8tqnH5rbDQHxGF6r9+MCJsMFTcqG+vtzsOIHNLFTHEE+kug9BdMuLy7
         G1d33p5icriK711BGr98viLfaK0ljpYlV9bAAaDA4rQIvyxHY0shQj9W8sKEFT+eLi0J
         tzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678312; x=1793283112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0ObRZqURp05kcBQ0Zv+pu1j99ivc4QOppayGe5sXtU=;
        b=CPBDW3tg4cYjHqwJELwV4Ib7Ekv4czmT32H+v68yl5Wkpz3u8JGOljLJK58Vy2jufg
         f6GN59v7HNkvARboVcbm9MwTxMGiU7hdURRqX+qiw5YH+hQH5DIXKVK8yA4HmQZ/dy4h
         BnFDv8YSUGYGmM8pDlFwILnUnIVJoRnpdFdNWbVntPwS7N/3aWz4fsCSxwVGsVSMWAHX
         yqNdFdsEaKpBfwgr5Hnj15FhafZ/CVjqmrtExIPO33h5hmQlORyZkTo8Hrg/WQU8eVsz
         KLgcu3YjB0gmjjWQWV2Ur7u88R8LVMHDaY5oniDhOThtgZilIl94U6DWOMzioJzL//d6
         3Xiw==
X-Forwarded-Encrypted: i=1; AKwUvBwAOpkFvksK3tgEaxYb1q2YTq4qC2FNYbAVxhkO8oebdmeV3Cb3FnXbMZdQaTDsLfdwMRMjh6ZCI1c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk/htUGlAsQpVYOuCCDV4QbotP7SPsdi36OpTktOuKpsJtVObs
	U00J+XcDF39ubqB3o7hCgdbzO9beH4v+yzIgVZkreEPq5Nf+cBBa8r12CWFqRsjNfs4=
X-Gm-Gg: AYBFou2ErGBjqGgMv28Mg1bFOV2N7m4reFtpNu08cVWDQkKsul3EOjATqFlUliTPkgG
	EhKwabIvQ9DzrAkPf0w21UjKnwQQX+R4+fxRBRMXsWWIK/J1zPXqtiWyjH69aHIAHcG3kN7Cp5S
	YFDvEqMD6vtXVmeh7EzmqOTH4AHkcp/E9tjhUfn8kVmzMeXUB22YUVxBteR5j0TqMENiNyPWtyh
	mYG6JR76XkY48lVtxsFhG/HcFxr5t+9UaKXcCAZ6N5UXzn5l563AYVvStLPlU4NwNoL1pBpv4Sw
	hvzsggK/Cx4KlEHN3/DnYsowkWDGrplx5Cb6VxIzfd5i7zuHCSjLgKZVWDSSKK/XKBfy9cfnVuH
	/BT8WTsROZLaCtJ/zcL0YKFD2VzuFtqdrKVTSl3WcQL5jfXmrle063Skc9gQn6fhfsWM7emRKyg
	9hyxN1E1/U0UfQYiyG6YVXHDnPkABxxyH2QINx24OyoNao3gM9J0xvY1Wvi/TPyy1lVC408fmgk
	v0QpJwtA2to+MeYahfqnf3sCqJh1+F8z+Gqqd4mtMT42NnJcVt5mde8cp5PtmBtqvXN//BiFKuZ
	JCOVy9YFFBRnLL9UyhnXyUWfnWa29D7BFLzquQ==
X-Received: by 2002:a05:6214:29ed:b0:919:57a8:7537 with SMTP id 6a1803df08f44-91c232e5013mr44009236d6.18.1792678311640;
        Thu, 22 Oct 2026 07:11:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10c0bd4csm51371086d6.30.2026.10.22.07.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:11:51 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:11:49 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: akpm@linux-foundation.org, david@kernel.org, ziy@nvidia.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	ying.huang@linux.alibaba.com, ljs@kernel.org, mhocko@suse.com,
	muchun.song@linux.dev, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, weixugc@google.com, cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC 0/2] mm: add source selectors to memory.reclaim
Message-ID: <atoZpXaCRc7etPW8@gourry-fedora-PF4VCD3F>
References: <20261019141401.11927-1-lizhe.67@bytedance.com>
 <atY-LD2AzCYATRii@gourry-fedora-PF4VCD3F>
 <30457046-a662-4ff7-a6a8-100398d7a806@bytedance.com>
 <179264138036.2549665.17429111144570830454.b4-reply@b4>
 <9b715272-3ed9-42da-a6ae-467e8ae00c0b@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b715272-3ed9-42da-a6ae-467e8ae00c0b@bytedance.com>

On Thu, Oct 22, 2026 at 05:43:49PM +0800, Li Zhe wrote:
> On 10/22/26 11:56 AM, Gregory Price (Meta) wrote:
> 
> So userspace cannot rely on one write to memory.reclaim to produce a
> final per-node distribution. The intended usage is a feedback loop: the
> controller observes the memcg's resident distribution, chooses the source
> nodes it wants to relieve, applies source-scoped reclaim pressure,
> observes the new distribution, and iterates.
>

I think the critical question is what CAN userspace rely on?

We can make a bunch of feedback loop interfaces, but there's no
guarantee they'll actually be useful.

> >
> > At the very least i think you need to add details in your cover that
> > demonstrates the process of doing something like per-node resident
> > ratios, and show that it works as you intend.
>
> Agreed. I will update the cover letter to make this model clearer. I
> will also make clear that source=nodes is not a final net per-node
> footprint guarantee and does not change memory.reclaim completion
> accounting.
> 

To be clear, I think not just making it clearer, but if you can show
some tests that demonstrate the reliable behavior of the interface
extension under different scenarios - that would be compelling.

~Gregory

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636582;
	b=CGjh1sfGu56A0cX1GfaM1g6GE1EShV0VuJvaW5fnkuTg19y6s6X0oQ2MCt8s9fFW/BnJ
	 IjY37XmXly+rOFEZiw0kVy1365cjysM3UlYS0M8NqbwymG3MykTqWCiAl50vbKjplZaM9
	 LNYtvz3LlwI9ZTy4lUsTHjgn8wMcT/bZZJ7byfhaGAhQ2vnMRlL5lh26uUjhnAU58NPKM
	 7ASFEvPk9vRchzR9Se0T4UsID45+IAWhoQt54Ej1wC41b7J/atmUewes/YNx89V3eg226
	 wB0mvWK2OFkkIfUE7bv1y2hJiglFNaqVZzN1dvMh7OW9hP1AgmnL4zbu9lyDv6g1KtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=OnfyzMLO0P5DWvV355CXnkmHdcF8VekAj3yYMzW5EvM=;
	b=SyfmLifE94leI5ghUg9xOcNUTJZF4EbgJhGHhzY2qmeB0re0E/WsIFwprv789StDtvFV
	 wOt5UPyl6CU496ma8zmIBqFrH/f/1g4qOUu85+WK8WSripPVJGUdNc7OjoWjLnIJ5KfmD
	 jppSYWBfQLyxN8bPxGKC8kwSh36t0yrTAqUJvCgNJjozmP2mv1GM7zq9ev5ROMljdjDif
	 RYlKvSzs22g6Cii3I8Ol0/63HmBNT7Je0jAMt7O8CxRwrHYJ/X41T8Djkh7Ws0s/Xmobb
	 7KAuhYnJz8VPiwFt4A3qqLOP2McCmANLt6OtCAwvTLvSAymRspVHL1TKdsbfAIccYtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DXfRIZoh;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0FD606A31B
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 02:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D0FD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=DXfRIZoh
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-536605c4d8fso9233751cf.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 19:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792636580; x=1793241380; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OnfyzMLO0P5DWvV355CXnkmHdcF8VekAj3yYMzW5EvM=;
        b=DXfRIZohrO6JOR9N2TQfXwi6cS3IFf0u3AYrwtcV6cAz/rVDD7gYA/cEnUd7wXfC6H
         sfSTAy7j3LwrJCHxVAhzWFOpiEsgVwT/fRT6BmOjP8g4NxugF58Kv64hPA8hnbMyMMLg
         Bn4uk+VUNjJYH35He0ZZnX1j8fnuR9z1X+77UXRo20wYlj3BIhM4ayOT/xvxHjPPdiU+
         FfSYeOstSqlXfhKWllHX+JM7bKGrsEHmlMhl8dWpG2+mPCDE3Y3naPT+E0bU+/a3txYD
         pdUabMTzTxVpr1fgM8p26nP5aBPgBmL9e1ItEt0i/hYPGLmhUgvgszhgzDYl95JPGZok
         h0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636580; x=1793241380;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnfyzMLO0P5DWvV355CXnkmHdcF8VekAj3yYMzW5EvM=;
        b=p5d6w1gsB37+q0vOOnsjylrepnVJAjDkgIir1gbeQJIW8NRU0W18Y6DL7zm2T3guQD
         FMNsSPi64tDE/1qZuutLjM2QFW6T9PoHPJudfr/lhATEK8MAKElqlyud2M30r4FQlpBQ
         HcjODbYRDpCwWsRUScXJTDmi+0GNFBDFjq2UaFwOujTuzIwtJytSDAObanOGze4/V91J
         8tjtFeF8v4EZQyCLy3b7Y3GF+yDSL2TbjnCUblVlG4HckCyxGByrQZM8iHfCndXhCdzM
         Z//WRChT2DTd11eje/XQaKZsTM9Rxx9wcUN+6JtpIYu4hjV1XPxkWGbkIAmREbHK8JMK
         wA8A==
X-Forwarded-Encrypted: i=1; AKwUvByGrFSGKJJ+bPee3287NqxJegwI8YKQc0RS2asgJc5hc5q1654vsX1iB++EMzfvSLWOOv5pY0Gf7XY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJj6TlE03BnMW3Lt21G+CrQt/9uqHoFhCuTNpIsIKm0uaTBSrbk
	zf4N3rWOZEglR9pjKrVN6SLPwY2+Oo2MwSwO1CxVR58I2MyAAQMjfvcD4oyO0Q3RB3c=
X-Gm-Gg: AYBFou3FvQOV685N0J4r7V6RIQgndvlB8q++uLwsV/EfuGaE5fDjCurMUaOcpCdZ0uv
	pAM6ZASFRzbvV3MWE0UBve9NVF9I5uKidhgai8tmZPE6gc6UqfqsPgP5OVINoU4UyKCLM5nq0Oy
	nD/LO1CwEpEVEObhVdGa27hKz8ytNrfDaX5iyulaxcvGFvDKCNt3WCIK0CthAnD1RP5u3QIcxYA
	Z2rQ86PJWdmd/16G8q0mGJltTF6Mdja/Xxf7zGheVAF4MHsNAhFriZgN+StHMfbCpXYGonPIo9B
	0/bWZo1B+qBBmt1DtJHKFsg67lrOalNSBt9eK7hBagCcbo+iydliQ0YPcNpzXBaZI+2RNkOqHoW
	gYwPmcoUM8mQ393k6/NDg4RKFlbt3lb/k6HYwMMzfgIUCx/cbDWvC7HyMHN0ViuJu7QC7fRSfvO
	HUaY8ctN1fYmqZmHoObnI6p5zGc7MwnYfqwslOkVs4GM0bWlDLR5RSNLkNF+PrGR0A6cYzr1bR5
	EVNR2V5XIanXiYQNFl+IbbdaqDpEY9Y8mXmpInyWeQnOmQNSJD1QWkEkXpX541XmjUS7A5J62E4
	BVO3WPl/Frns4fupMy7WX1px1e4=
X-Received: by 2002:a05:622a:4cd:b0:533:2bf3:3301 with SMTP id d75a77b69052e-5369b86ae59mr66504611cf.36.1792636580301;
        Wed, 21 Oct 2026 19:36:20 -0700 (PDT)
Received: from [192.168.86.58] (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536ab73b09dsm16032801cf.17.2026.10.21.19.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:36:19 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/12] Virtual Swap Space (Swap Table Edition)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Nhat Pham <nphamcs@gmail.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
 hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
 shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
 muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
 baohua@kernel.org, youngjun.park@lge.com, chengming.zhou@linux.dev, 
 ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, qi.zheng@linux.dev, axelrasmussen@google.com, 
 yuanchu@google.com, weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
 haowenchao22@gmail.com, corbet@lwn.net, hughd@google.com, 
 baolin.wang@linux.alibaba.com, tj@kernel.org, mkoutny@suse.com, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, kunwu.chan@linux.dev, 
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, cgroups@vger.kernel.org
In-Reply-To: <20261021060323.553433-1-nphamcs@gmail.com>
References: <20261021060323.553433-1-nphamcs@gmail.com>
Date: Wed, 21 Oct 2026 22:36:17 -0400
Message-Id: <179263657717.2549665.11401372071846447074.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-10-20 23:03 -0700, Nhat Pham wrote:
> B. Semi-synthetic Workloads (memhog, usemem, kernel build)
> ==========================================================
> 
> All values are mean +/- standard deviation across rounds.
> 
> Test system: x86_64, 52 cores, 64 GB swapfile for all 3 benchmarks.
> Swap backend: zswap (zstd) with the traditional active/inactive LRU. We
> focus on zswap here because it is the motivating use case for vswap.
>

I get that the motivation is zswap, but it would be nice to have
disk-swap performance numbers here as well right in the cover.

If only because...

> For each benchmark, we test 3 kernels:
> * Baseline: mm-unstable, no vswap patches.
> * VSS off: vswap series applied, vswap=off, to verify that there is no
>   regression to existing swap paths when we disable vswap.
> * VSS on: vswap series applied, vswap=on.
> 

If the numbers you presented carry through, I'm left wondering why this
is a boot option and not a build option.  I rather dislike the boot
option compromise in general - but other reasoning aside, if there's no
performance impact, then I don't see why it shouldn't be the default.

~Gregory

-- 
Gregory Price (Meta) <gourry@gourry.net>

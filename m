Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F862D9EE7
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 12:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942757; cv=none; b=NZDzgN+hCeBTwJLMq3mq1HR24pew31uDDnZY2HHiGsKJ/XnOeoQJY0m4mA0cED3blCCMNQ1CUwxpCiWJe27eyNTdweyDBD9r8/Lcu/ld1ThmxabIrsCiyBlxUHGVPo5jP3qwXCPr5hLpiBKGPOCXQXKxINTwORIpkfnzzjYOeuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942757; c=relaxed/simple;
	bh=iGqWnKHBIV73YEyVdtTTJUbEM1wUTqX9O3tRPHVLZUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqXYx7ZmXzh63Mo5O4CCmIgkgE7ZDoNapp+hLajhQtzN1JfOXCEK7C98EyI5S0Q3+FqHDK3/k3EteHH6TY76H/ERpeU0D2WVRmzMCOyn5y0cReXyRj1ZQAcfVbioGa2NOAMvcl3CB1quVdLP+KHTrVhZZfrOuIMYT1xwokJQh90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qIFcsZOH; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qIFcsZOH"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b0503e39fso1944415f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 05:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1790942754; x=1791547554; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=59ow6xTzZEIjngnzpCRDDNtxBrP9iJr2uOu5/gWZ8+c=;
        b=qIFcsZOHxPttQhcXwwa8l9EfT8Lw/8KH8apZ0Vb2rEc9GeiIa2l4IQ0DdU+BiA7eax
         MXPXXBGqRqKhwIa886Kr1aYjoXwVKKWq4rDIr8LD3DYswt1FqnanBMMOHB1+m2U1KQhJ
         /3FdOXUNJX5IEvn1HxxUjpmVhNA2VPKHyiNEU4dyPgDLATNmS78cTGQH+hrepny8b6WI
         aPf/jn14Yy33QU3KgEKdzM/VEt9zUd8yVysHBrr/XdRvZbhY/FsCrQk5bh31vCbm1AD1
         U/096HSfEyBc3PbpDZmgHbhxjfM9+UHMY+nZXfQnshumgJb37xbAjqtCm7h9syh7K7Cq
         NgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942754; x=1791547554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59ow6xTzZEIjngnzpCRDDNtxBrP9iJr2uOu5/gWZ8+c=;
        b=vcLQAr4WuF4rZKIxajuPVwiihIUz5piYHxI7ZplOjiNHAhbeAESu6DhK6SxtTyXec7
         nbikiEwxf7EnXAnJCqhDli/uqkyOYohLa5LPf34jK/erQwUj8+TQNQqIeoQ5i7ZtRmG7
         wlLJzWBVLNq97Dsr/4lHYXD1dutu0CPaGbZOrvSq5J4tsGryFEJ0QCBqmcccuX3rYRpC
         UEuPXvJPylzQijP8Pt+BxLRV0CoPDB7cSSdh6s94fdlLL2R95HHP92KsUmQAOHrGmXAI
         tgj838vUJW8lszXP16V5MtNa35FeahG8FUmC7qC73oJ0L6eWueohkDXI8yydX+5MAx+8
         +qLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtJh8LbJomq5L0IzmOWc6B8CqLyuTJeM92Et2CtIZD84xvoZQD87Lyk2q8l/j+YuM8WSnCs4dOzjQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l/UxIrecBH5I23FKCeknQjp2yjOrTgPG3r7QeW1U6hdpqgIFD6
	fxhId7mY6528leAmwhowwGGEvl5da/V4mvVOfE3IadnMVaCpUTx2IAkcaXGdVToOJ04=
X-Gm-Gg: AYBFou1awO2b9StN89VWiwwbs59d0HziOK7UYvD8SgS3RkP7TdMKwKRyq5h+fAB09HE
	9m13BkgQfzA0c3KOFjR8I2l1sBEllSY18Ro2RZIquZDTGOac/uPxpKOhB2C7hQcrmVhnQDgLiDo
	WvBnH5sCd46whd+Ac6V4ut9TtP1azA/OA3+b6AkryE7lWgPqAAtralITxuMgYfRknMPDCy1w30D
	kdW37eok7NtC8VLc+viGQ0rSklq340KIhdSd4BEq5zjRpl8ZoiLGyCtyx4GjOFA2qDAyRCBgAbx
	HO9gVWWDNM/lgEpPy8/MIKgIRWRX6dpeX+KkycLzyamPHKFS+aYhXO31pQ0QmQ84RJR7xrFdhdL
	6XdxoiogexF0nu4DSKUJ+eBqXsLR5Lf1H1vX6w7ABOQIeA7IooTOEcYwnr28tx338rQUBqY5WgT
	j3we3DTZIgcui4tsX6dKCOYD9FXIG8FQBhk0eLZhhfqqjp+VhYYGKeVceUhVbpAK0F0gc=
X-Received: by 2002:a05:600c:1c1a:b0:4a1:6424:41bd with SMTP id 5b1f17b1804b1-4a164244596mr13162505e9.27.1790942753805;
        Fri, 02 Oct 2026 05:05:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c092:500::7:9b19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0858sm5763893f8f.8.2026.10.02.05.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 05:05:53 -0700 (PDT)
Date: Fri, 2 Oct 2026 08:05:51 -0400
From: Gregory Price <gourry@gourry.net>
To: Li Zhe <lizhe.67@bytedance.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org, 
	rppt@kernel.org, mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/numa_balancing: allow migrate on protnone reference
 with MPOL_WEIGHTED_INTERLEAVE policy
Message-ID: <ar-b2nxDbQjcDbLY@gourry-fedora-PF4VCD3F>
References: <20260930121154.687586-1-joshua.hahnjy@gmail.com>
 <2e3f12b7-0dac-428c-b70b-07e1f63de028@bytedance.com>
 <ar0fURbLDPrphYMY@gourry-fedora-PF4VCD3F>
 <A005B05D-A85C-4153-A65D-0BDF9D8500DF@nvidia.com>
 <280965b2-c6eb-4f01-a0ac-c4fb7e518f97@kernel.org>
 <ar5eC22VfSFlMw3W@gourry-fedora-PF4VCD3F>
 <44d15437-6aae-4d7c-bfd4-296276583826@kernel.org>
 <cac17315-7157-4f97-8ad4-98ef268f1b8a@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cac17315-7157-4f97-8ad4-98ef268f1b8a@bytedance.com>

On Fri, Oct 02, 2026 at 04:15:45PM +0800, Li Zhe wrote:
> On 10/2/26 3:56 PM, David Hildenbrand (Arm) wrote:
> > I can understand the "random initial placement will help if you cross your
> > fingers" argument from Zi.
> >
> > But then the question really is whether the app should then change the policy
> > after the initial placement was done and the weighted stuff no longer makes a
> > lot of sense.
> Yes, that model makes sense if the application or runtime can
> cooperate with the policy switch.
> 
> One limitation is that this is not fully transparent for existing
> workloads. set_mempolicy() updates the calling task's policy, and
> mbind() updates VMAs in the calling mm. move_pages() and
> migrate_pages() can move pages of another process, but they do not
> change that process's future allocation policy.
> 
> So I agree this staged approach is worth considering, but it also has
> some deployment cost for workloads that cannot participate in the
> policy switch.
>

if the use-case is vma (mbind), such a switch can make sense.

if the use-case is task policy (set_mempolicy), such a switch is
not a realistic solution.

In userspace we tend to use task policy by way of numactl:

  numactl --interleave=all ./my_program

This calls set_mempolicy for the numactl task and then exec's into
my_program with the inherited mempolicy.  That mempolicy is dup'd on
fork / clone.

Changing the mempolicy from that point requires every task in the
workload to call set_mempolicy() again.

There is no way to externally change another task's mempolicy.

I attempted this during the initial weighted-interleave exploration:

https://lore.kernel.org/all/20231122211200.31620-1-gregory.price@memverge.com/

but we did not see the need for it once we landed on sysfs controls for
weights.  In addition - there are MANY `current` assumptions hard coded
into the mempolicy and cgroup stack - getting such things dug out would
be (will be?) very painful.

~Gregory


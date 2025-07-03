Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5CA2EE29E
	for <linux-doc@vger.kernel.org>; Thu,  3 Jul 2025 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751553976; cv=none; b=o0srZ94M0i3rf6zmjItGhlAXrSgcQKVBMyUxErqEAVj5lJedfS5nV+Lg3woxQH/k3l20wE7Ofw5kW/nc1abTVoCKzWCf2x4fU5a0XKo3a3DMT9ikxOWFE0rmK+pf8WRC6FSkYpuhf4vl0emeHJ0Cn/tEv822qQzb9YcQqi6JBeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751553976; c=relaxed/simple;
	bh=072pcCvBMR7vtDKQsCrYBJuqlkcEW2Q3tlczFa12bes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tGAEteBrenqCnBkcIzP37rF5odnMvUW4Pik64ZENs/H8piLHDv9wBq+6LI7vMVGq2Pw62ypouocbKUlNVE63of3+c6+t1FSD3ajQ8Rz6oMMHy26Go5Op4cS0+ieSVHac02gV3g0osN1HGtfxdWztuSABcoqsKMxwpMc4P4FGcCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pe97KF09; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pe97KF09"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-237f270513bso155695ad.1
        for <linux-doc@vger.kernel.org>; Thu, 03 Jul 2025 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751553973; x=1752158773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZyBqVSoupq82KbFVVt6LJyI9rbtpg1wvjlbr52oP/Zs=;
        b=pe97KF09BgQKKDcXvBjTyD5thKMVPjlLEj9vsiy1SF+kOVZMI3hdrThiA4DKsmB+aB
         bxc2ukmwbFh9WgG5e5C8vF3LzlA5SpGsdReusVbSUyROmZ8/dJf1JzO0EQlPtkGxk1Er
         6UETb8vAWwUpKdRX1fN3IwMHF+TYbT0e8fADzoNz/17MJZu4fyGv08RJ4Pcxl5/VaLm3
         1x9F3uwSalFW/P+twGFyDIkYdqcNDws+mUKRnQMH9qLodyjTeVeXlFcZFcnzXyVuKMsw
         sNgj0j7QsL06Ry0de97205tHproHHVw0HT+mo74BTVH7pxTLaTFVRUigJHBZbgfIgJb8
         wgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751553973; x=1752158773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZyBqVSoupq82KbFVVt6LJyI9rbtpg1wvjlbr52oP/Zs=;
        b=gwLeGv8jucfZ5Du58vw2yntJVHUN9jrp7WnZEkTKCoQSNXamfgji+c2SVnJud8zJIH
         Oy7Az7p7+AHTITdib5x+UBqfxtDmWQkC72JP4TjHRHX2jdJ0qLIU6sOcbwEVhrIaiZk5
         znhl8A1NkGe+WX3BFa1/SqcsUDNk+IfFNEhdUGzQuSZk1muvQyvkjz8zI6BjME8ryeq7
         lwBgpTTWvpx7ny2gbWuJCom2BEPHWD16Ye8R3HrsRg9wHIW9GC7Rd4FjEk0rhq6QkpSB
         C7GHTn4+fTkgCvBcIUz+Jt2XL8AtkXWkCtK6ChHPxOSpWZk3Dfm6FWJLhdUuQiQHhgPX
         wovg==
X-Forwarded-Encrypted: i=1; AJvYcCVi9fPeFeacBYKkRMEeDud34iNT/X6NC+jCZ/1OvtH++1gFRiW1JAub1HQ7JpY6ga3kvAL2kaQOM7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRcJtdZ9lcj1GZW9zbpK6TeUJZN3Wjce938qkFPkHZcvsi92j6
	YM8JfDwCWYdKX/3la5e4jDEK0uhcftcngiRGjTf+LXNwEwYclcPdPxd5RbqqG1pJNw==
X-Gm-Gg: ASbGnctHiDHArGgpiTJptAhau99/wDA+dWQr36zBYiKU4mID9BcG7K3BqW9D+0PS80o
	Y7ddCN2uV7R8EahiGJS6U0lEDfpQ5/3Tv4n/2rDn8rDEKqYGSNAhcitV5aOZOAbKCiREhQF1rVR
	X7069Rzu1B9pBmy7RzF+M3NwioIppWuk1ERO7TpJ47cI5TGru9Tym8NdIyhuX38FbdIPoeTPC8w
	JgSZMmDriJ0RPYZoe25kctipjK19ZZLBkJngu5HUvBE75tdslJitRXOQNm47hnlgt8SZjbM0vdi
	HhS1bzQvzLWWSq9c/pmxtYaRv0fvJA6fzDqT5dCph40fG9QeRMc6vevm/j0OKcNEznqPx3FOZpq
	BLwskD4KhyY0E/VbLG+ejnRwbqXS8O3A=
X-Google-Smtp-Source: AGHT+IE+IjimVm/cNBTQKKRIynsqnkmviMOQfy4mliRYK2mww3VHnjujL8mKkHcoqxy9cwNV6ZMlng==
X-Received: by 2002:a17:902:c941:b0:22c:3cda:df11 with SMTP id d9443c01a7336-23c79b3ab97mr3276285ad.10.1751553972827;
        Thu, 03 Jul 2025 07:46:12 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e39d4sm158508935ad.18.2025.07.03.07.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:46:12 -0700 (PDT)
Date: Thu, 3 Jul 2025 14:46:03 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGaXqwzfLwsgCH6n@google.com>
References: <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
 <aGRmaOORg-YDfncY@google.com>
 <aGRozoIDIlgl9H9x@Asurada-Nvidia>
 <aGR55PUBnwb8qT8U@google.com>
 <aGSBTpY0nkdp2TTL@Asurada-Nvidia>
 <aGSNmf5Q82xEbDpX@google.com>
 <20250702180541.GD1139770@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702180541.GD1139770@nvidia.com>

On Wed, Jul 02, 2025 at 03:05:41PM -0300, Jason Gunthorpe wrote:
> On Wed, Jul 02, 2025 at 01:38:33AM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 05:46:06PM -0700, Nicolin Chen wrote:
> > > On Wed, Jul 02, 2025 at 12:14:28AM +0000, Pranjal Shrivastava wrote:
> > > > Thus, coming back to the two initial points:
> > > > 
> > > > 1) Issuing "non-invalidation" commands through .cache_invalidate could
> > > >    be confusing, I'm not asking to change the op name here, but if we
> > > >    plan to label it, let's label them as "Trapped commands" OR
> > > >    "non-accelerated" commands as you suggested.
> > > 
> > > VCMDQ only accelerates limited invalidation commands, not all of
> > > them: STE cache invalidation and CD cache invalidation commands
> > > still go down to that op.
> > > 
> > 
> > Right, I'm just saying the "other" non-accelerated commands that are
> > NOT invalidations also go down that op. So, if we add a comment, let's 
> > not call them "non-invalidation" commands.
> 
> There are no non-invalidation commands:
> 
> static int arm_vsmmu_convert_user_cmd(struct arm_vsmmu *vsmmu,
> 				      struct arm_vsmmu_invalidation_cmd *cmd)
> {
> 	switch (cmd->cmd[0] & CMDQ_0_OP) {
> 	case CMDQ_OP_TLBI_NSNH_ALL:
> 	case CMDQ_OP_TLBI_NH_VA:
> 	case CMDQ_OP_TLBI_NH_VAA:
> 	case CMDQ_OP_TLBI_NH_ALL:
> 	case CMDQ_OP_TLBI_NH_ASID:
> 	case CMDQ_OP_ATC_INV:
> 	case CMDQ_OP_CFGI_CD:
> 	case CMDQ_OP_CFGI_CD_ALL:
> 
> Those are only invalidations.
> 
> CD invalidation can't go through the vCMDQ path.
> 

Right.. I was however hoping we'd also trap commands like CMD_PRI_RESP
and CMD_RESUME...I'm not sure if they should be accelerated via CMDQV..
I guess I'll need to look and understand a little more if they are..

> > > > 2) The "FIXME" confusion: The comment in arm_vsmmu_cache_invalidate
> > > >    mentions we'd like to "fix" the issuing of commands through the main
> > > >    cmdq and instead like to group by "type", if that "type" is the queue
> > > >    type (which I assume it is because IOMMU_TYPE has to be arm-smmu-v3),
> > > 
> > > I recall that FIXME is noted by Jason at that time. And it should
> > > be interpreted as "group by opcode", IIUIC.
> > 
> > I see.. I misunderstood that..
> 
> Yes, we could use the vCMDQ in the SMMU driver for invalidations which
> would give some minor locking advantage. But it is not really
> important to anyone.
> 

Alright, I see. Makes sense. Thanks for the clarification.

> > > The thing is that for a host kernel that enabled in-kernel VCMDQs,
> > > those trapped user commands can be just issued to the smmu->cmdq
> > > or a vcmdq (picked via the get_secondary_cmdq impl_op).
> > 
> > Ohh.. so maybe some sort of a load balancing thing?
> 
> The goal of the SMMU driver when it detects CMDQV support is to route
> all supported invalidations to CMDQV queues and then balance those
> queues across CPUs to reduce lock contention.
> 

I see.. that makes sense.. so it's a relatively small gain (but a nice
one). Thanks for clarifying!

> Jason

Praan

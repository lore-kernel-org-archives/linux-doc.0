Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6495E281531
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 22:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751410292; cv=none; b=GNzlvNqNR9dMI0jKNxTEMLycR91HnWQicMBKbL5cey1mWLvlWOtukIQdzMLIdWrZWsi1Cf1PWVtV+c8azeRMb01+/v5rFZBfB5uI0aejGcv3YJi8xLPLpa3FyE1BtsLWepZXQRe89QAWbrTZFixfHTX2qK8FpN/81OboLUptWEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751410292; c=relaxed/simple;
	bh=THyaiSK3XZpGPf2jkEiRMRg3uUKNoJcmWhjWuRS1+Mw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rJlyiInvb5Anx4aHBRu/dJb43/QzF4rEzQCaZ7fQsTDIOnvgEqPJnulmgoHy9wPw4vv27SGulkcclm/uXogA/V/cTXTvrBfmxmG/14DHEyIR+69MDUGM1+ZnB+brrrO1z4K9H+gipfa5nzNosw2JkX1pKJ9pWJFNm5405c/uazc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I1G6t++y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I1G6t++y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-235e389599fso350385ad.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 15:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751410290; x=1752015090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31m5VALjhSZCUtaamU81Tt7LVwzdmFjl/OH4isUf0T4=;
        b=I1G6t++yD9V4C6VFrwS/Ox3IwKdstO81pMUTd+x+5nJN1PCohB5UF8K5lpeitFxLR5
         78bYzSEPQOIHj2grpze+b7urzmXMIa0Sg/gZNhxDnd8TdUnpbrvkpJ8Mp6qURIDsbWiu
         Qwkcst6EuiFEshPMUKSpIPPL3HcDSsVYHUp/BF2WkbngKJfySeT0/tYTp1jPIJtVlcGY
         nQ0TiB+lXGmAJsdNMBfS0G2Qz6ZNYu0/QdaNvLH1uACIXW7ld9z+ZreTwwIIastZdfNW
         KWPgHgZwM978OS4d7LTJQDBSXEzo1+mPuLK2svIXBbhUBdJgtM16dcfj7GudHniQ4Jbw
         Mzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751410290; x=1752015090;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31m5VALjhSZCUtaamU81Tt7LVwzdmFjl/OH4isUf0T4=;
        b=qPyNpt1j1NM6J1Whqw8rbSk07TtHk0muU0CzfIf5RzUtXggDgsYXkx1oPy0IEf4gWT
         wWOZsHmqhlwgXOYjG97Va6JAyDftDVuu2c9Z4ivLBBs+A2tBO5Fg9mC6yVNB6pqEd6tG
         QnfnVpedxfU8AYkoTfzZvK+bkFXwQSVnRbHa+dTNINueQQAv1Yv7vocB8nvEYLGO0Yzx
         90xEgttddQ28+HEMqc1LNsDynthvr1GMdFIt1GuD5/7npyc2WyYHnUC/UK0igSLCWxGA
         B/IBlz9NS1yCL0YgJE7ubI/A0zAZ1+TbmvtK6Gv+pHG6VYrPFFpgsykasMD/P0mGKNVE
         NeOA==
X-Forwarded-Encrypted: i=1; AJvYcCUtfQZzh5CIUIaXoFyIxQ5uhk+1pVexcdsaVLWe/y7L2f7Rc/7vlVFkuONYFXl3Ic1Jua4nXiMLAj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSrv8nshVVCQMKifRmnxLsYp4VN21E2LFBKXhaJPodANt9saIb
	Z2shqB3XOfBjuaW4SJjK5W19BX9EnvSgjdspopQxPk0Bk452M5n/GrUkaS5Cnr20ww==
X-Gm-Gg: ASbGnctYoII4Oti9UxJP9JaUUb9vpu/DEsSvJGsavvCTZ9eEO3OPs071Lkrm5o9QMgz
	MEh1rQq18FlWukdzhkEjb+qRVeHGhguBocX+pg7vj1gXmNaDvUyuHe9rx01jApDsziKhcW4qTj4
	u19cATP6jjcVL8haf1MAnkODij4Ji3EolfK2qv+aJpmufDlbiNRJbtdO4tYoKz8EalN8TnH5apK
	i+EXoBtc3TRfTYJASqf2ancxPYjifDusQhB8mmomBUlmU43ZYQiNJXYdvFg8Bcg3EsSrBNc3ArT
	h1Kdgl0Zec0qwdTvF7EieRNWGR9mIgbyq5K3LHAL9pwo1Zho2ANawCcHyF+jiDG8XJ9XDagnVm5
	1rAxj2eWtXJcFEBJPM93F
X-Google-Smtp-Source: AGHT+IE2A3LONQdf5/UDXdamM9j2FEbJtnYf58bee8GseWxQ7r/tyyPKLeWd6GVOe4rd8pReDprYsg==
X-Received: by 2002:a17:903:40c6:b0:235:e1d6:5339 with SMTP id d9443c01a7336-23c601c954dmr3764925ad.26.1751410289353;
        Tue, 01 Jul 2025 15:51:29 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5384107sm17193429a91.5.2025.07.01.15.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 15:51:28 -0700 (PDT)
Date: Tue, 1 Jul 2025 22:51:20 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com,
	dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v7 27/28] iommu/tegra241-cmdqv: Add user-space use support
Message-ID: <aGRmaOORg-YDfncY@google.com>
References: <cover.1750966133.git.nicolinc@nvidia.com>
 <539ee2ec112162abdba511574e2205a77b425059.1750966133.git.nicolinc@nvidia.com>
 <aGQGm1-i4M75b9Qp@google.com>
 <aGQ6KCI9OZEwHdxS@Asurada-Nvidia>
 <aGQ_F7Qx3scbbA-J@google.com>
 <aGRDtYRXFLoT+PrI@Asurada-Nvidia>
 <aGRIctg4T6cQECx4@google.com>
 <aGRcPSwaJkTeUrMx@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGRcPSwaJkTeUrMx@Asurada-Nvidia>

On Tue, Jul 01, 2025 at 03:07:57PM -0700, Nicolin Chen wrote:
> On Tue, Jul 01, 2025 at 08:43:30PM +0000, Pranjal Shrivastava wrote:
> > On Tue, Jul 01, 2025 at 01:23:17PM -0700, Nicolin Chen wrote:
> > > Or perhaps calling them "non-accelerated commands" would be nicer.
> > 
> > Uhh okay, so there'll be a separate driver in the VM issuing invalidation
> > commands directly to the CMDQV thus we don't see any of it's part here?
> 
> That's how it works. VM must run a guest-level VCMDQ driver that
> separates accelerated and non-accelerated commands as it already
> does:
> 
>     accelerated commands => VCMDQ (HW)
> non-accelerated commands => SMMU CMDQ (SW) =iommufd=> SMMU CMDQ (HW)
> 

Right exactly what got me confused. I was assuming the same CMDQV driver
would run in the Guest kernel but seems like there's another driver for
the Guest that's not in tree yet or maybe is a purely user-space thing?

And the weird part was that "invalidation" commands are accelerated but
we use the .cache_invalidate viommu op for `non-invalidation` commands.
But I guess what you meant there could be non-accelerated invalidation 
commands (maybe something stage 2 TLBIs?) which would go through the 
.cache_invalidate op, right?

> Nicolin

Praan

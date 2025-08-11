Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B54429B8D9
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 07:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754895658; cv=none; b=B8UGSMBzph4XOAEKzsKHTw/0/H7xzIEkvd5raOZU6x6My9dZmVnbYPtACSVKG7GeZFUZoPlvoJgcI7eT4PwwyzT8pwfhcmWlqMa2NidEdriEbwRkfLNE2HZdGSqis2U0laM5J3fxBZ9cv2CHnhpGvbapP5nGkqe2Rz06Mh40/oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754895658; c=relaxed/simple;
	bh=4TXBlBGQNvA7bt3BXu4K6a+JVORCJDofx4zHmkOthDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Y9Mg6ha2FHeaHfG4zoOjj0Zcqs3Bb79YTotYEJcGHg3C4OMbN139AkZLP7Jza0oPBiU/4n+5wolXafdM9xHuBTy/evWYv792e2QIN+tDfdlvpu+tQ5BWVKZwyC7uqvjP82aHCCynyR80uC6gWadHvPojnQ28tGGs0xn7ilTTNZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CkgPCvPP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CkgPCvPP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-459ddb41539so12376225e9.2
        for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 00:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754895655; x=1755500455; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/hwWzDFSbMSy9EZ6eh9Z+w3E0hJBaTZziN3cHZhQKeU=;
        b=CkgPCvPPYinEiDCKNHlRoUuoVm+ePNxSkJm4e+BCILCgFOZkWdE1oqwQtZyuZHbNCa
         OfmAnB4TcLIAX0B8By5RHBr1OJPQS8Fx1VE3DihPhVKuO+9L+VNSYGYZqMdC9oTfmKgU
         vAwWJk4UfGzQDiSqr55Orq9gGLT4wdNAdm043YUM1g5YunCH3UIoUDz6cahGD9SP3IpT
         opBWDbViCdlgEwgrTov+k4HMWf4Gozt0EZjJAnd8UK+QimFjoCH6YB8O71uC7qk4aAuH
         WYmpytwsod7FEC/rJnQ+JegjxK08CweI/1wLg4eJrXjPf6AHGB2tP54LhYpeKyy3IEN4
         QUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754895655; x=1755500455;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hwWzDFSbMSy9EZ6eh9Z+w3E0hJBaTZziN3cHZhQKeU=;
        b=Aod5f3uZgfk8CFYPKEb4X0/LJrklMaVhGSzT2+3UjMOWxFs3Ti9vI/aMQL4QBIREjX
         d6/cFE2KZfLUdc726diniUowWAKMksfNi9WxN8jjJbAoxEl7kXoQMIC1aqQPAEM0PmL0
         K+m9uoSF2IAKeoHrg9d/rcqlCnmlLeHibJH2wnBXX1Fdsn1eLBxM7SboxmUYqJty8qlZ
         GIbMzpUYCdbPaA2cTEXGoo7lEl1k24mHhhft+p64k4yPfTgTwP6+C7lyHY9Tb9205B/v
         dMAeeFfytY+fYqSuus2i+0xD6yHWLFN6dovEyreqGoHs1A2R+FuVJfzy2wjjCPg37mrj
         kBtA==
X-Forwarded-Encrypted: i=1; AJvYcCWIfwJ6bihHGVB6WgaqLWTxxfIX7+3XjRgHOxrbV7tQUvHSvdPIXi5fSBa/4eSuOKUmt3PtW8SvfwY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/QJCzWKrRcvug0JOUfLg/KdhW7evryJJyDj3/5T9Vr3XiFRt
	qNcG3tUtsS6BDjHK0dA30t33w0XIbkBRGfdaBWbJixr6rb6TZmuBInW54XjEmsjjWcM=
X-Gm-Gg: ASbGncsRS3JFuJRMwbf+RZUgMtM3VIC3jVBOEm98Txr3y23yYgnV5AKFc9Or+Z8INZ6
	HL1xsKrouPuWmlsJT9NbnX/uRrSTEuXpjRPOMzzVs4DxPuHC8hZDCO1lt9gwqqSqvaGE7lv0+Mm
	9Mye41j3bX/XYP9HHv2qNRgotsD+nrMc++HhgKdJrAzbYeVB4WgOTqPxR19ae9XXcuXvaEFodHN
	AiITnbfdsX8fSELKIEBbOQse0Vthe2X3F8+tEyC/PLsWF009rO/AeecnNAN2BLtbMz0A+6O3H3X
	4Ndcop2Gu5qIMg//Lu8xyOD+WP05v/z1A1EF6tcX7bdBuwDgj0RL73ygtx/TbEmr/kNJFRO3Cul
	cX9zJdgjwJYlKnPfwJ4v3v0tm1ApLkY7tBjWLBA==
X-Google-Smtp-Source: AGHT+IHRURi+b8G7dagGCHr+89qFgRkhvYaQGSCmp70FV+PfG/xE/6yTSPpoTAWNO1orRt9InmbSaA==
X-Received: by 2002:a05:6000:40ce:b0:3b7:c703:ce4 with SMTP id ffacd0b85a97d-3b900b6aad8mr8041910f8f.59.1754895654564;
        Mon, 11 Aug 2025 00:00:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459dc900606sm305322985e9.15.2025.08.11.00.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:00:53 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:00:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Bijan Tabatabai <bijan311@gmail.com>,
	damon@lists.linux.dev, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, sj@kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>, corbet@lwn.net,
	Bijan Tabatabai <bijantabatab@micron.com>
Subject: Re: [PATCH 2/5] mm/damon/sysfs: Implement a command to only commit
 scheme dests
Message-ID: <202508101330.XRQqvfiN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250805162022.4920-3-bijan311@gmail.com>

Hi Bijan,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Bijan-Tabatabai/mm-damon-core-Add-damos_destroy_dests/20250806-120845
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250805162022.4920-3-bijan311%40gmail.com
patch subject: [PATCH 2/5] mm/damon/sysfs: Implement a command to only commit scheme dests
config: microblaze-randconfig-r072-20250810 (https://download.01.org/0day-ci/archive/20250810/202508101330.XRQqvfiN-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508101330.XRQqvfiN-lkp@intel.com/

smatch warnings:
mm/damon/sysfs-schemes.c:2605 damos_sysfs_set_schemes_dests() warn: iterator 'i' not incremented

vim +/i +2605 mm/damon/sysfs-schemes.c

8014d822c9939b Bijan Tabatabai 2025-08-05  2601  int damos_sysfs_set_schemes_dests(struct damon_sysfs_schemes *sysfs_schemes,
8014d822c9939b Bijan Tabatabai 2025-08-05  2602  		struct damon_ctx *ctx)
8014d822c9939b Bijan Tabatabai 2025-08-05  2603  {
8014d822c9939b Bijan Tabatabai 2025-08-05  2604  	struct damos *scheme;
8014d822c9939b Bijan Tabatabai 2025-08-05 @2605  	int i = 0;
8014d822c9939b Bijan Tabatabai 2025-08-05  2606  
8014d822c9939b Bijan Tabatabai 2025-08-05  2607  	damon_for_each_scheme(scheme, ctx) {
8014d822c9939b Bijan Tabatabai 2025-08-05  2608  		struct damos_sysfs_dests *sysfs_dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2609  		struct damos_migrate_dests dests = {};
8014d822c9939b Bijan Tabatabai 2025-08-05  2610  		int err;
8014d822c9939b Bijan Tabatabai 2025-08-05  2611  
8014d822c9939b Bijan Tabatabai 2025-08-05  2612  		/* user could have removed the scheme sysfs dir */
8014d822c9939b Bijan Tabatabai 2025-08-05  2613  		if (i >= sysfs_schemes->nr)

i is always zero.

8014d822c9939b Bijan Tabatabai 2025-08-05  2614  			break;
8014d822c9939b Bijan Tabatabai 2025-08-05  2615  
8014d822c9939b Bijan Tabatabai 2025-08-05  2616  		sysfs_dests = sysfs_schemes->schemes_arr[i]->dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2617  		err = damos_sysfs_add_migrate_dest(&dests, sysfs_dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2618  		if (err) {
8014d822c9939b Bijan Tabatabai 2025-08-05  2619  			damos_destroy_dests(&dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2620  			return err;
8014d822c9939b Bijan Tabatabai 2025-08-05  2621  		}
8014d822c9939b Bijan Tabatabai 2025-08-05  2622  
8014d822c9939b Bijan Tabatabai 2025-08-05  2623  		damos_destroy_dests(&scheme->migrate_dests);
8014d822c9939b Bijan Tabatabai 2025-08-05  2624  		scheme->migrate_dests = dests;
8014d822c9939b Bijan Tabatabai 2025-08-05  2625  	}
8014d822c9939b Bijan Tabatabai 2025-08-05  2626  
8014d822c9939b Bijan Tabatabai 2025-08-05  2627  	return 0;
8014d822c9939b Bijan Tabatabai 2025-08-05  2628  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


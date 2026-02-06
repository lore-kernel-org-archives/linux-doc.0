Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2C734E74D
	for <linux-doc@vger.kernel.org>; Fri,  6 Feb 2026 09:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770370674; cv=none; b=VTJZ1rZG7SRy7SsvmG3gZ0BQ0S6+u8tejn6hYBEXVCnhTG0Lf9J9Fi45dRPU5CDP8RbnXR7Y1v01FeGPQqcA7Y+j/SMCs66xS5SKZxBNXQtgrp4IPFNccAWnb6qikPP7+vjYY/llUbJtfv4SH7XsqGrMmabiQa5Xm9fD0fLvafU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770370674; c=relaxed/simple;
	bh=a6WHFOsQ0XLpXBz9nVNPRhoAOYofYpq507RpRUTDNVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLjxFqMOzTaQgPFP2vKmHBee2t4V7pCIqJJEibbL9zZ7KgAhe2FSiHWr13iBfKllADAFIa0y0X+StVKqFP3lXygo+Y1safBl988LvNiQRtpljNAPwx4Qu9Samc11TrkqJgVDkTqIXHG5nGWXYFRDJbshEfCI+4T/PIPewEm0III=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=muPmwwzu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="muPmwwzu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee07570deso4036465e9.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Feb 2026 01:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770370672; x=1770975472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wlRYgpRsjcg2ejK1OLntwoYIyfilHOYKa44N62R1+TI=;
        b=muPmwwzueX6ChKrMLIUoFIuPthLqjLgti/xB4Kj9EoFbpNIvzKFy2b19Ux0lUxQ8aR
         PS4QM0bwvXC5fYZW36TtrJ86G7lfyRYSLyFLNPKOafnSVHcjD7VoPdsI9h6PvGQy+A1p
         9pG2Qjm6hx2+DvLoBPMo2U0fdmtytCIJK4Mt98UnHcMckvf8TOYjzUCq0oIEPLv4H68j
         gQFdUThrQ12CgQE+5tITcOUEYR+MYxOhy5Pa0iLesVWBxWGQZN7scP6KnBvv758bZUr8
         XLDgn1vu3zFI69+zeyrQKo5RDMmkgrHIXTcmlHJvHYiC9MGpRVpqVQs63+Etg/ftiLYd
         dsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770370672; x=1770975472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wlRYgpRsjcg2ejK1OLntwoYIyfilHOYKa44N62R1+TI=;
        b=JlmCVNj+7ijI/XIldNy4RqaDJPtVxOaY0FK2iEv5F20uiSOKql1ik3i3QLVpyIYlgU
         IxvSXp7K8gqIBEtx5p6vH8jEA1e2Tw6vMYQEa5+ul6aQKvE2CicZcolCmElrSZnxc8wQ
         kT242f2z0VtPDsGn8TqiaELKeOFck/V/V+mJuZP/bGjczy5uV+Dc13R35EAvY0k8l2Du
         egOkCBrQjU7VUj4FKRE9kOVzFzQZfn/fJeDKOWtLQIEbYx32bHhVtigLVc79QWzDbV9Q
         iHSUly18YJ3cflCRLIgmn7fbztNa1bO/tPoCxCVhnpF9NuhhLJKFHg/ZfMKpXdAh3ZU8
         /jQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQrV/cE8z0NgHA66r0wjzAKgY7tEhWeZQD1z2CUydQEwKy76icjoLHG+uw9/KrsfMeLVlxCtU7U0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBR23qso9+viL4Tl0Ky+1LARiKJWDZU15M4I9LFDnEIFNIKRSp
	1lsgPm4VhjXP7HbMHyYf+82ZgWTjt3WQV0KXllwElsHJk2D0abmaTM0CZGjWfMH/FvE=
X-Gm-Gg: AZuq6aKgNnZX9ps1m5oQW2tc90w0fAMTVoIZFshNvafGRRmo3c+GLRvqi18pYUwSyBn
	PWO9/dCCMwnBMyFx7ySKn7mFZW5JQUAno9+JDjaRWH7ojCvtURZDFDWnEG5QIseSttWL9073QIY
	26qa4/+l7RCKcMtLvrXYuwwggjnlUw28OHRGfHL+l00b7gG0N3YV5VIJAXSsvFitzM4BDQmmEBr
	Xir3rDUADKmUxEKWLumxPFaYyIsEwkxjJg9AeRhyIWb0aWpODPjrVc2aLwPkSxg+J+UzEP8tAmP
	DvcEQmZJONyFMzYgtsHaGhD8SMAG73bFf8SQCBENSH1B+Pyqrb3l7W3vrlBU9Z3WnxHLrj3t7cr
	6ff3tIigfbFtBCJ8VIlAPFAqTg3AB8HRpZjovR/UcHEGQtMPiKe8VgJ9IduHIVfD3dOfu9Ji2Ey
	mAGsZ6QWuZvBdpwhnS4mQ=
X-Received: by 2002:a05:600c:8b88:b0:47e:e20e:bbb0 with SMTP id 5b1f17b1804b1-483201d9fa8mr30397895e9.6.1770370671772;
        Fri, 06 Feb 2026 01:37:51 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm37505745e9.5.2026.02.06.01.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:37:51 -0800 (PST)
Date: Fri, 6 Feb 2026 10:37:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, Shuah Khan <shuah@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>, Shay Drori <shayd@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Or Har-Toov <ohartoov@nvidia.com>
Subject: Re: [PATCH net-next V2 6/7] selftest: netdevsim: Add devlink port
 resource test
Message-ID: <eakcy4lgflnovn64jagsilopjst7xvmhcfujbxwlnphh7pdf5f@jkwcgn5e2ujr>
References: <20260205142833.1727929-1-tariqt@nvidia.com>
 <20260205142833.1727929-7-tariqt@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205142833.1727929-7-tariqt@nvidia.com>

Thu, Feb 05, 2026 at 03:28:32PM +0100, tariqt@nvidia.com wrote:
>From: Or Har-Toov <ohartoov@nvidia.com>
>
>Add selftest to verify port-level resource functionality using netdevsim.
>
>Signed-off-by: Or Har-Toov <ohartoov@nvidia.com>
>Reviewed-by: Shay Drori <shayd@nvidia.com>
>Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>---
> .../drivers/net/netdevsim/devlink.sh          | 37 ++++++++++++++++++-
> 1 file changed, 36 insertions(+), 1 deletion(-)
>
>diff --git a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
>index 1b529ccaf050..272e60eb7bfe 100755
>--- a/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
>+++ b/tools/testing/selftests/drivers/net/netdevsim/devlink.sh
>@@ -5,7 +5,7 @@ lib_dir=$(dirname $0)/../../../net/forwarding
> 
> ALL_TESTS="fw_flash_test params_test  \
> 	   params_default_test regions_test reload_test \
>-	   netns_reload_test resource_test dev_info_test \
>+	   netns_reload_test resource_test port_resource_test dev_info_test \
> 	   empty_reporter_test dummy_reporter_test rate_test"
> NUM_NETIFS=0
> source $lib_dir/lib.sh
>@@ -856,6 +856,41 @@ rate_test()
> 	log_test "rate test"
> }
> 
>+port_resource_test()
>+{
>+	RET=0
>+
>+	if ! devlink port help 2>&1 | grep -q resource; then
>+		echo "SKIP: missing devlink port resource support"
>+		return
>+	fi
>+
>+	local first_port="${DL_HANDLE}/0"
>+	local name
>+	local size
>+
>+	devlink port resource show "$first_port" > /dev/null 2>&1
>+	check_err $? "Failed to show port resource for $first_port"
>+
>+	name=$(cmd_jq "devlink port resource show $first_port -j" \
>+		      ".[][][].name")
>+	[ "$name" == "max_sfs" ]

Test resource name not updated.



>+	check_err $? "Unexpected resource name $name (expected max_sfs)"
>+
>+	size=$(cmd_jq "devlink port resource show $first_port -j" \
>+		      ".[][][].size")
>+	[ "$size" == "20" ]
>+	check_err $? "Unexpected resource size $size (expected 20)"
>+
>+	devlink port resource show "$DL_HANDLE" > /dev/null 2>&1
>+	check_err $? "Failed to show port resources for $DL_HANDLE"
>+
>+	devlink port resource show > /dev/null 2>&1
>+	check_err $? "Failed to dump all port resources"
>+
>+	log_test "port resource test"
>+}
>+
> setup_prepare()
> {
> 	modprobe netdevsim
>-- 
>2.44.0
>

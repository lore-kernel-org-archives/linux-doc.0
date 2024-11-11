Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185DE1EB36
	for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 20:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731356758; cv=none; b=Wmc/C+oX3lQ3KFHVeXd1wuFZ2Pd+xkoH9uPaXzmixyHmhKD/c4M6QncLsmdTzxvi/yjE8ZT7r3y8Le3AnTMOBOGkWiAbGx0Pw+iqTReIX/qEGenQ6mgjqcPJAd23ku84c1NG0NvCCfS3zSQbU9z0DhPLBZYxHz5XVSDcyWYGPrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731356758; c=relaxed/simple;
	bh=2w5AOiqqlQUI7ff1yMnJ4pyBjIIdEcmBrtd1H9hIT58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HMdEbhe9utWoKBSrjVLELc/lunmncCXaQH23ihCz7rHVi8fE53XeiSyVZQP8eQsyeiM/a6pvNUdpI7+ow95lsch3cfHFglCZNgbppwEjoAdqwy/0jFRJHTpZ4IfLtbbpDfI6rCBD//NApVFW5u68md7DouYF4+P2UmmU44aIDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=lo1J19ZG; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="lo1J19ZG"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7ede6803585so4263122a12.0
        for <linux-doc@vger.kernel.org>; Mon, 11 Nov 2024 12:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1731356755; x=1731961555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZedqqjyJeumj8+2BRCMIUVijoRFqC01LDMvINlLK7gQ=;
        b=lo1J19ZGSgA495tA2c6mV5GqbRO74mxxvWhVuWWvlrgoywSQL0AqvOssfzc/I0vABN
         hsKoRixtiL+VDzSKe/nzUdhdyQ9PFtgpn3PmUXv0T5DUKvFpiH45zCkaGMOcaikycVDJ
         MF8cyvBO33Bd5VfV1N/54oqUQFPl/OnhTYZvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731356755; x=1731961555;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZedqqjyJeumj8+2BRCMIUVijoRFqC01LDMvINlLK7gQ=;
        b=FtdbIGqk8xuNeW1wCUoL/qo43PauIWXoSJb1VfUBxedWszHLzB99QwyTWdYNYNfN60
         byA+Wh6Fu6tB+9SwZ3pkatHr9mBaHlD0wAWcui2laLBcHxufourwNWqrke38Aqzl1gZp
         rq3ET7TFb+9ijx5NaC9Skl48ID7el7s2tLzN9clSWrPCDScyhMRK7WXwD7epWcsKgR4Q
         RNytAzGhttGx38ulFdE12YNeP4vBN3Kn0Of+kPcuEN7VVolVVyHK2z5tTj8wsMmdXNuo
         rsOWLztLnTu+hWtgfLOhTrNmnUulFHEFsAR+Di/7olQd2aEV06NDfD0u6o/6PP0icd21
         igew==
X-Forwarded-Encrypted: i=1; AJvYcCU66aOT4qLqNfZkL2tRtx4rINVQEIUrdFpojnfeIHtRellU+GXzkJ9p1ebE5vZbudAMKyAPh5fzMTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh+o0Lk0M58XlwW0iYVaOCQV6J7l91ZNkiUeAd28tEsWV3iZrD
	oEKN73TNcXqlwRpnxc7du1wWYVrZ5YthxgLu70NjYyUoLzP/2tcoa6v5FAh0DYs=
X-Google-Smtp-Source: AGHT+IF2Ru2h4ZQi9WWUaGkF59QU53pPfGyKW8tnYpPW+BjO0RHI3kunAeHAUy1Qepm/XqDiyw7M7g==
X-Received: by 2002:a17:90b:33cf:b0:2e0:7e80:2011 with SMTP id 98e67ed59e1d1-2e9b0b381efmr19863855a91.16.1731356755368;
        Mon, 11 Nov 2024 12:25:55 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dc7f3esm79470755ad.24.2024.11.11.12.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2024 12:25:54 -0800 (PST)
Date: Mon, 11 Nov 2024 12:25:51 -0800
From: Joe Damato <jdamato@fastly.com>
To: Sanman Pradhan <sanman.p211993@gmail.com>
Cc: netdev@vger.kernel.org, alexanderduyck@fb.com, kuba@kernel.org,
	kernel-team@meta.com, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net,
	mohsin.bashr@gmail.com, sanmanpradhan@meta.com,
	andrew+netdev@lunn.ch, vadim.fedorenko@linux.dev, sdf@fomichev.me,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v5] eth: fbnic: Add PCIe hardware statistics
Message-ID: <ZzJoT-YLUHuvK1wk@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Sanman Pradhan <sanman.p211993@gmail.com>, netdev@vger.kernel.org,
	alexanderduyck@fb.com, kuba@kernel.org, kernel-team@meta.com,
	davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
	horms@kernel.org, corbet@lwn.net, mohsin.bashr@gmail.com,
	sanmanpradhan@meta.com, andrew+netdev@lunn.ch,
	vadim.fedorenko@linux.dev, sdf@fomichev.me,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241111195715.1619855-1-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111195715.1619855-1-sanman.p211993@gmail.com>

On Mon, Nov 11, 2024 at 11:57:15AM -0800, Sanman Pradhan wrote:
> Add PCIe hardware statistics support to the fbnic driver. These stats
> provide insight into PCIe transaction performance and error conditions.
> 
> Which includes, read/write and completion TLP counts and DWORD counts and
> debug counters for tag, completion credit and NP credit exhaustion
> 
> The stats are exposed via debugfs and can be used to monitor PCIe
> performance and debug PCIe issues.
> 
> Signed-off-by: Sanman Pradhan <sanman.p211993@gmail.com>
> ---
> v5:
> 	- Add missing fbnic_dbg_init, fbnic_dbg_exit, fbnic_dbg_fbd_init and fbnic_dbg_fbd_exit functions
> 	- Add missing entry in fbnic.h
> 	- Tested on 1-NIC 2-Host system
> 		- Test Logs:
> 				Without ping <remote_host>
> 					# cat /sys/kernel/debug/fbnic/0000\:01\:00.0/pcie_stats
> 					ob_rd_tlp: 88724
> 					ob_rd_dword: 1363273
> 					ob_wr_tlp: 980410
> 					ob_wr_dword: 105006453
> 					ob_cpl_tlp: 98665
> 					ob_cpl_dword: 1363273
> 					ob_rd_no_tag: 0
> 					ob_rd_no_cpl_cred: 0
> 					ob_rd_no_np_cred: 0
> 				With ping <remote_host>
> 					# cat /sys/kernel/debug/fbnic/0000\:01\:00.0/pcie_stats
> 					ob_rd_tlp: 114081
> 					ob_rd_dword: 1902295
> 					ob_wr_tlp: 1098457
> 					ob_wr_dword: 112936622
> 					ob_cpl_tlp: 128409
> 					ob_cpl_dword: 1902295
> 					ob_rd_no_tag: 0
> 					ob_rd_no_cpl_cred: 0
> 					ob_rd_no_np_cred: 0
> v4:
> 	- https://patchwork.kernel.org/project/netdevbpf/patch/20241109025905.1531196-1-sanman.p211993@gmail.com/
> 	- Fix indentations
> 	- Adding missing updates for previous versions
> v3:
> 	- https://patchwork.kernel.org/project/netdevbpf/patch/20241108204640.3165724-1-sanman.p211993@gmail.com/
> 	- Moved PCIe stats to debugfs
> v2:
> 	- https://patchwork.kernel.org/project/netdevbpf/patch/20241107020555.321245-1-sanman.p211993@gmail.com/
> 	- Removed unnecessary code blocks
> 	- Rephrased the commit message
> v1:
> 	- https://patchwork.kernel.org/project/netdevbpf/patch/20241106002625.1857904-1-sanman.p211993@gmail.com/
> ---
>  .../device_drivers/ethernet/meta/fbnic.rst    |  26 ++++
>  drivers/net/ethernet/meta/fbnic/Makefile      |   1 +
>  drivers/net/ethernet/meta/fbnic/fbnic.h       |   6 +
>  drivers/net/ethernet/meta/fbnic/fbnic_csr.h   |  37 ++++++
>  .../net/ethernet/meta/fbnic/fbnic_debugfs.c   |  68 +++++++++++
>  .../net/ethernet/meta/fbnic/fbnic_devlink.c   |   4 +
>  .../net/ethernet/meta/fbnic/fbnic_hw_stats.c  | 114 ++++++++++++++++++
>  .../net/ethernet/meta/fbnic/fbnic_hw_stats.h  |  12 ++
>  .../net/ethernet/meta/fbnic/fbnic_netdev.c    |   3 +
>  drivers/net/ethernet/meta/fbnic/fbnic_pci.c   |   8 +-
>  10 files changed, 278 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/net/ethernet/meta/fbnic/fbnic_debugfs.c

Just FYI this patch does not seem to apply to net-next/main. Did you
rebase?

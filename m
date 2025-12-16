Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1969CEACE;
	Tue, 16 Dec 2025 02:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765851145; cv=none; b=YHqunuB5/mgS9eLlegiUnLDmE7Qn+z4P3tyDlZxJOg8o2kTBYk1ILI5yRSyaREAURTl2EzsiLe1seMPMTz++LkDkNmnXcVJw2W5GcJdB+aLCdr7jgE2gC+UIuKfm/DpqqfrFHaRoIfTrU2kG792djQxsisEe11kdHh0RlpDOUM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765851145; c=relaxed/simple;
	bh=Rm61Z34pGhWCnpHDgIv6eJG+Vfb/x1DU4A+H4PmKqMM=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=odzhW/p23Latim5xpmh3DsHjNAT83TYO4lDc03/fvPLcLV2TmolK77RxOkIw0CLd8SPMC7H2KZ3LhidtTRrUEx6b4TC2tSxP43p5epOIQzvJEkIIm8/5Rb2FlkAf8vIvetXDlk7X9bFvcQRG+0GDPqOKJhbXdRJ9h/7UAgz+IOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CI7GZIQU; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=CI7GZIQU; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CI7GZIQU";
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="CI7GZIQU"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ny61MqGFroEBN84CEhZ8ZqH1kOgw2JrvF+IHTRz9+B4=;
	b=CI7GZIQUTPuQLuGEgWYWj9pr8ko3O/HhHvYlo1byFV5Wl71mDONiwT1QyebJbxJItF5CAK737
	JOZhbgnxPXO/Y6FMtzOhFI9XYwILLcTHWfTmIdTvPfeo1TfzwfXyWutdTWyZKZRVQeks/wYVdUM
	1bN7V54OGKyvsgK3XCmrbQk=
Received: from canpmsgout08.his.huawei.com (unknown [172.19.92.156])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dVgRM34jkz1BFPS;
	Tue, 16 Dec 2025 10:11:59 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ny61MqGFroEBN84CEhZ8ZqH1kOgw2JrvF+IHTRz9+B4=;
	b=CI7GZIQUTPuQLuGEgWYWj9pr8ko3O/HhHvYlo1byFV5Wl71mDONiwT1QyebJbxJItF5CAK737
	JOZhbgnxPXO/Y6FMtzOhFI9XYwILLcTHWfTmIdTvPfeo1TfzwfXyWutdTWyZKZRVQeks/wYVdUM
	1bN7V54OGKyvsgK3XCmrbQk=
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4dVgPH0yCwzmVVR;
	Tue, 16 Dec 2025 10:10:11 +0800 (CST)
Received: from dggpemf500009.china.huawei.com (unknown [7.185.36.50])
	by mail.maildlp.com (Postfix) with ESMTPS id 26A8E1800B2;
	Tue, 16 Dec 2025 10:12:11 +0800 (CST)
Received: from dggpemf500012.china.huawei.com (7.185.36.8) by
 dggpemf500009.china.huawei.com (7.185.36.50) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 16 Dec 2025 10:12:10 +0800
Received: from dggpemf500012.china.huawei.com ([7.185.36.8]) by
 dggpemf500012.china.huawei.com ([7.185.36.8]) with mapi id 15.02.1544.011;
 Tue, 16 Dec 2025 10:12:10 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: Matthew Wilcox <willy@infradead.org>
CC: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com"
	<lorenzo.stoakes@oracle.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"ziy@nvidia.com" <ziy@nvidia.com>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "Liam.Howlett@oracle.com"
	<Liam.Howlett@oracle.com>, "npache@redhat.com" <npache@redhat.com>,
	"ryan.roberts@arm.com" <ryan.roberts@arm.com>, "dev.jain@arm.com"
	<dev.jain@arm.com>, "baohua@kernel.org" <baohua@kernel.org>,
	"lance.yang@linux.dev" <lance.yang@linux.dev>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com"
	<surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "Wangkefeng (OS
 Kernel Lab)" <wangkefeng.wang@huawei.com>, Sunnanyong
	<sunnanyong@huawei.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH next 0/2] THP COW support for private executable file mmap
Thread-Topic: [PATCH next 0/2] THP COW support for private executable file
 mmap
Thread-Index: AdxuLvzPiGNlB0SW/Ee39Xxvv0vdtg==
Date: Tue, 16 Dec 2025 02:12:10 +0000
Message-ID: <c0ceb2104cac497383f7f7e5e7a00930@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

> On Mon, Dec 15, 2025 at 08:34:05PM +0800, Zhang Qilong wrote:
> > This patch series implementate THP COW for private executable file
> > mmap. It's major designed to increase the iTLB cache hit rate for hot
> > patching application, and we add a new sysfs knob to disable or enable
> > it.
>=20
> You're going to have to provide data to get this patch in.  We've deliber=
ately
> not done this in the past due to memory consumption overhead.

Year, memory consumption overhead is a serious issue, we will conduct a car=
eful evaluation

> So you need to prove that's now the wrong decision to make.
>=20
> Microbenchmarks would be a bare minimum, but what are really needed are
> numbers from actual workloads.

Okay, I'm also trying to gather some test data locally(include microbenchma=
rks and actual workloads).
I'll attach the results once I have finished. Thank you for your suggestion=
.

--
Thanks,

Zhang


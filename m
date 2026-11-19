Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070451;
	b=08fAjkf5Y95nbmC9BgDX1lF8kmKOSNvuFgUVeuZJiWZrvrp1lbmljiqzG193McLv+i10
	 KIm/7XeuK3qBgJY+PgX3TVnL+HHs7izjRG0OahrSGqN+quJqyv7bVUC+t5FCgiNpZK25v
	 S3HsMKP0xZQ9GIlsBVX0YeSHBDs1wy2DZP3127srGvnh6k9eI9BqAWuf6/O2a754vieAN
	 iadyDUyhbA0pBhIo5pLDLbsq1VBya5BbSTlfDKuijYttFSBwHvbCiG4W3LKbb9N37Q3pa
	 Gs5uuDLV9NwY141ih1ghjtA/5uSqUd3xcrHGu8oed136dg+niGtbmKmg5RzxLL+blkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070451;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=qmyNQOgDSlHi7bLgEAYFmsoW4l6Q4fZQE6fLWxCxItw=;
	b=nPuEO9ZEExyVDV2c+2rddFZSx6+Al3JNrfmUdSMVOrPBYhKMPQTPLgjxZCuyyMxRPsNb
	 80nttkyvtgEupoqzXkeT4pc+YBglDzsBcZKY//5dwobY+9lgczJv9FUHrmti0/6iWDueb
	 Lvy2poxc2WsA60MLXazCXi1UF5nHH814WXWbaOBSYzbzE56vZbVZKebQCszzb4lyrZ+qj
	 tW3iIspYka7utw3YQB9fIn9l5DnmljnLt69hvgw/j64u1PykRRF4krncL0SzsGGZAKpke
	 gwn//ymWSWnSKf8X/37dfuEUtNiWqKkSPkHIBuLkT5fg/Cg+gveHM8Vm6KxZBXkUXeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=W4uSz27O;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CB2606A32F;
	Thu, 19 Nov 2026 06:40:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88CB2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=W4uSz27O
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qmyNQOgDSlHi7bLgEAYFmsoW4l6Q4fZQE6fLWxCxItw=;
	b=W4uSz27OCn1hv14o2GwFcqRRNsK4bkfn/keWtNk8SFs3aS5cQC/aXA8NrNCJBiXIS7NWYn3rB
	am2gUnQr+JiglTJSQs/cy4O9g0qu8V6w1mUYELJ9F3e5Cv95XWWdjExwCPEvZ/SLq7sPq+wHIT4
	7gVJPorGh8kEDTF1Bk3DywE=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jVTNW2yFKzpSvH;
	Thu, 19 Nov 2026 14:39:55 +0800 (CST)
Received: from kwepemo200009.china.huawei.com (unknown [7.202.195.26])
	by mail.maildlp.com (Postfix) with ESMTPS id DFA844056E;
	Thu, 19 Nov 2026 14:40:46 +0800 (CST)
Received: from localhost.localdomain (10.50.159.234) by
 kwepemo200009.china.huawei.com (7.202.195.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 19 Nov 2026 14:40:46 +0800
From: Long Wei <longwei27@huawei.com>
To: <rppt@kernel.org>, <pasha.tatashin@soleen.com>, <pratyush@kernel.org>,
	<akpm@linux-foundation.org>
CC: <graf@amazon.com>, <leitao@debian.org>, <corbet@lwn.net>,
	<rdunlap@infradead.org>, <linux-mm@kvack.org>, <kexec@lists.infradead.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<hewenliang4@huawei.com>, Long Wei <longwei27@huawei.com>
Subject: [PATCH v2 0/2] kho: drop the incoming sub-blob debugfs view
Date: Thu, 19 Nov 2026 14:37:58 +0800
Message-ID: <20261119063800.698863-1-longwei27@huawei.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117092951.4017931-1-longwei27@huawei.com>
References: <20261117092951.4017931-1-longwei27@huawei.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemo200009.china.huawei.com (7.202.195.26)

kho/in/sub_fdts exposes the raw contents of the sub-blobs described by
the incoming KHO FDT.  KHO does not own those pages: they belong to the
producers' consumers and have independent lifetimes.  LUO, for example,
restores and frees its state in early_initcall, before kho_init()
(fs_initcall) creates the debugfs view, so the blobs point at pages that
are already back in the buddy allocator.  Reading them triggers a KASAN
use-after-free in _copy_to_user().

The same information is already available to user space from in/fdt,
which KHO does own and which stays reserved.  Drop the directory rather
than adding another interface to describe it, keeping the -rc fix small.

Patch 1 removes the interface, patch 2 drops its documentation.

Changes in v2:
- Drop the in/blobs metadata file entirely
- Just remove in/sub_fdts to fix the UAF, no replacement interface
- Update Fixes tag to c609c144b0e8 (the commit that first added sub_fdts)
- Remove the now-unused #include <linux/io.h>

Long Wei (2):
  kho: do not expose incoming sub-blob contents in debugfs
  docs: kho: drop kho/in/sub_fdts description

 Documentation/admin-guide/mm/kho.rst       |  4 --
 kernel/liveupdate/kexec_handover_debugfs.c | 47 +---------------------
 2 files changed, 2 insertions(+), 49 deletions(-)

-- 
2.43.0


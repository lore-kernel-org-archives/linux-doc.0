Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.245.243.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975171;
	b=gZqla5U/hiSq9pwtp+SZjabf9WN4iTD/ihf6256MGG+tyD82S6unW/1+x/No6W+q9gow
	 mEM+kr2RywGK1zxlq20AxOrdhEgLQkjTSrQpSpWJzF/gGuHGrGrQqQczC/fAwaTAqEK7+
	 jw6MfVjiMhIgtmcaI/6gA76AYFBQWEHakK83schKnTm0W+pap1ChEINPo2S5B5VWHmlcr
	 rugalq5K19VlX5TmRNxj66uLKc+1q8Jm2K0Bc3fRJsW52Q3SWTp7OyYtVwdM5cOt0pfIG
	 UmCJ7QsoqM7F4p/u6r9+KudbKOwF2vfuzqXWnIQP/AyQ4loIWAVF4H/ZsC1UEwaxxog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975171;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Received:X-Farcaster-Flow-ID:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=XTe+KZ5Ux9lwqeXnYcQPUxG0JCkCjz9HLO0KkgWlVrs=;
	b=vW9fA8DZzGroouTtxbUUbrDQ6Ibju0MdcPjrxneL6Dk3rqus2nqqxr6+y3qJ5BA05mCt
	 y2T5hy10pnrVK7GukIPIEaV3JuV9cVefSakHINyCQcM263uUkMG1dG5K6d6PYoRRyZ6C7
	 MZ8+bOsKNo/wIfLqliw2/LrSzTchvWpbQ5+dQkkeN/DZ9+ZObbMg6O2bF+nciWduMRFi3
	 X9NSOqzqMNp8hYqd9u4GguYZsygH/LYeaFLh38Bsw95iHsf0ZadC2dIr8kwVNeFjcCMqK
	 UoGU0og4JjR3btASlgbfihsE1vnyLtitmqDwm7sEb+hHSG1VTOMAX24HanFUppQfwbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amazon.com;
	spf=pass smtp.mailfrom=amazon.com;
	dkim=pass header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=k6yCZzBX;
	arc=none smtp.remote-ip=44.245.243.92
Received: from pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.245.243.92])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138F0606A31C;
	Wed, 18 Nov 2026 04:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 138F0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazoncorp2 header.b=k6yCZzBX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1794975171; x=1826511171;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XTe+KZ5Ux9lwqeXnYcQPUxG0JCkCjz9HLO0KkgWlVrs=;
  b=k6yCZzBXoYvUHhMQzsOYddX905XC/HQeakmuteCNbh66/nPBRPqXDAtL
   YRsEPHsGBlCwx68zBuwd56YpDM9B8RL+A9CN0Gj7XjbSLxRfahDu8RiWR
   3Y+LPNnRHZIpq+lLhbpgkyhFv2I+fF03zl/sUCMn/OWXEmCSTidwNHhpH
   Wu2CaXUi3Q3cUYmLba/A3TtRS9A4uWL8a9oWJSDd8WQl4v5qPnpzEXjMH
   DM7vPE7w/uVPLzQ8eu0wa0DyNDSkizdaPNOpnRiojCzSNtiso7FairIuk
   RH/Vm0l9odOaZcB6+VxTW2vBrtFw8lzTKvwtcXbKfmHiTUdbKCtCFI3h2
   A==;
X-CSE-ConnectionGUID: VCgvj08NSDKRTfbcYrIcDQ==
X-CSE-MsgGUID: NkSbELtRSf6HdHf+bEc7Vg==
X-IronPort-AV: E=Sophos;i="6.27,219,1787011200"; 
   d="scan'208";a="33944177"
Received: from ip-10-5-12-219.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.12.219])
  by internal-pdx-out-001.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 04:12:48 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.111:9900]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.5.141:2525] with esmtp (Farcaster)
 id 686a2e21-38cd-44d4-a41a-420cb83cafba; Wed, 18 Nov 2026 04:12:47 +0000 (UTC)
X-Farcaster-Flow-ID: 686a2e21-38cd-44d4-a41a-420cb83cafba
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56;
 Wed, 18 Nov 2026 04:12:47 +0000
Received: from dev-dsk-evostrov-1a-14f749d5.eu-west-1.amazon.com
 (10.253.90.84) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.56; Wed, 18 Nov 2026
 04:12:45 +0000
From: <evostrov@amazon.com>
To: <netdev@vger.kernel.org>
CC: Evgeny Ostrovsky <evostrov@amazon.com>, Jakub Kicinski <kuba@kernel.org>,
	David Arinzon <darinzon@amazon.com>, Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>, Gal Pressman <gal@nvidia.com>, Michal
 Kubiak <michal.kubiak@intel.com>, Paolo Abeni <pabeni@redhat.com>, Eric
 Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shai
 Brandes <shaibran@amazon.com>, <linux-doc@vger.kernel.org>
Subject: [RFC] net: ena: use tx-push-buf-len while tx-push is off
Date: Wed, 18 Nov 2026 04:12:37 +0000
Message-ID: <20261118041238.14396-1-evostrov@amazon.com>
X-Mailer: git-send-email 2.47.3
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
X-ClientProxiedBy: EX19D031UWA002.ant.amazon.com (10.13.139.96) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

From: Evgeny Ostrovsky <evostrov@amazon.com>

We want to confirm one point before sending the driver patches:
we would like to allow setting the tx-push-buf-len when tx-push is off,
but the name is problematic so we are not sure what will be the correct way
to achieve this.

Current state:
- ethtool has tx-push and tx-push-buf-len.
- tx-push on means the driver writes the packet header into device memory.
- tx-push-buf-len is the length of that header.
- Today the driver uses tx-push-buf-len only when tx-push is on.

We are adding a new LLQ mode to ENA: pull mode.
- In pull mode the header stays in host memory and the device reads it.
- So tx-push is off.
- We still need to tell the device how many header bytes to pull.
- We want to use tx-push-buf-len for this, with tx-push off.

ENA is the only in-tree driver that uses tx-push-buf-len, so this does
not change any other driver.

Example on a device that supports pull mode:

ethtool -G <dev> tx-push off tx-push-buf-len 224
ethtool -g <dev> -> TX Push: off, TX push buff len: 224

The core already allows this. net/ethtool/rings.c checks only the
capability bit and that the length is not above the max. It does not tie
tx-push-buf-len to tx-push.

In a 2023 review Gal Pressman suggested using tx-push-buf-len only when
tx-push is on. That was never added as code or written as a rule.
Link: https://lore.kernel.org/netdev/30cb3990-80ce-ca07-6d73-cdc00d0ad7b8@nvidia.com/

Request: Please confirm this is fine or if not can you please suggest another
way of achieving the pull mode len setup functionality.

Thank you

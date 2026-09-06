Received: from mta0.migadu.com (out-198.mta0.migadu.com [91.218.175.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA1C2E7BD3
	for <linux-doc@vger.kernel.org>; Sun,  6 Sep 2026 12:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788697192; cv=none; b=qL+mo30igQxWglcMNMP5RRDImCM8ENqYH4PdhWDu/0pvw9rgEGlZGdXhSW0HAT4xFaSXyOrER4zqc9GCsDxmhqRzoXYEREfILoSNU8OUMNWsfBABqBisj8Ae/Hxa1+vLmUZZ5gJcWbvLXFHL6bdHjTveY0983HPJvQUhiIOpaKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788697192; c=relaxed/simple;
	bh=b/k6rEX2YMuKOXLxTiXkazW5+w3cG1CMjFPUVnk3k5U=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYu4KZhoydclp1DqMTdhaBya+24NZNF/j0WbuNCJZi/JOaZTeFP2HIjvoBedvBTw8TZ1hs+SZprYNUsamnw2UCOTnkFQ+nsHTAlJRLENw6a7RneJvZY0tFOLi8Pv4HJrRVsfo23WryplyWNrayaaEq4XnbXUR79HaqWoipIK/Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=TOZBXRrj; arc=none smtp.client-ip=91.218.175.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="TOZBXRrj"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=b/k6rEX2YMuKOXLxTiXkazW5+w3cG1CMjFPUVnk3k5U=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788697185; v=1; x=1789301985;
 b=TOZBXRrjnN5iBJRKZLfJ+Ik5aKQAP211jFLyRMV4J1RoTHaLe1jZLitsarZTiqdCfFlNtZN9
 YPGwtc3fZgjg0X2IFNVBdFJQhBHB+cfTQ/c40m2bbi0YPijmwq0/6hfFv5rBABSPWjr7PNmgI9a
 i3QntM4E0fa/2sLwXbpRLhhBOoCFYED0ALjNI9IpAJ13NJD8IFgqEvfWp9P0MArcsTB+2YBrdVt
 /vyhthh45aaL91NG6Oi7ZPJfvl/H1pjvZ82k/T7K5E94lJnybjcVqh+x8fgPbFobtVQIQ6vUQ/G
 iffprsJLDADG7Y/cFABKIqPzyHxR/vZ4dE4TxQ6JCg6xA==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fc69339f57cd68b0;
	Sun, 06 Sep 2026 12:19:45 +0000
X-Mizu-Trace-ID: fc69339f57cd68b0
X-Migadu-Flow: FLOW_OUT
Date: Sun, 6 Sep 2026 20:19:37 +0800
From: Weijie Yuan <wy@wyuan.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: add docs-next checkout workaround
Message-ID: <ap1aWcn8dXLjLgX5@wyuan.org>
References: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e5e728877c77a89f6c59e89c88ba8ffa8842643.1783609005.git.wy@wyuan.org>

For test:

Patch-status: withdrawn

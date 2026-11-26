Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672342;
	b=FX3CAQsCiqe89RePWXeiKd1ok6ix8i8YHS4LN/7o72dda4hkfNRl1E8+X6AHsJdCHmn6
	 B6ETLCxpTZZl0+2KNdQWorKLw4h/ApdCxITJD4NgyYiJq+x8oocHwVuO1dEERHEVGTMbz
	 Csgxw9Dkbqf9vHRpfcfUMrecUp6wm3aPDHNPPpyibhMrqwbL+EgwUIZwV4iHiMwggciR0
	 G5KX+cMdSl6S6iMDS2bWL4y1fuxWzKeyn3x+COu+AuvpgKBFMVPxwpeWL45o7oHahWceC
	 ME0US28BEwJajWpivGtOKwKNMsl5pOjDA+8i4dKYjitCCs4BVftahk7SXz/oSe5ql7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672342;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=1mD25X2vM0tKSpsk0hOa7lL0V+yBHv3uETp5MwJ8n3g=;
	b=UG03ICt45xLP+OFON2w1DWNZaErupa9vIqcSNCM1HYzMW4nk4iR1rp9u17n27JwVuCy+
	 l5EH6bN4ipQPVBoeISXhk++fw6A+Mnh6QstwWr0E+neVxeXP34JZ8c2BJxQhPCzIyrmDU
	 wJAFKjqyfJH9RkqOfoPj2qHe4If1bSDxb9MlSZqEXhvlm3gKttL1D40vS7lgkikiskeqX
	 VMn2GjhthSqq/PSBL+yW46TOv3FuZPT9+BlELJdGovragH2FKOWRaztI9aE6mxQMIe7A9
	 JJSNvtjv2jmojVB7v7Gl0o5WD58dYckGXx2PuM9nAweKtc2WH8xTAMOgpgpgyNHICuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SR05x8JL;
	arc=none smtp.remote-ip=91.218.175.45
Received: from mta0.migadu.com (out-45.mta0.migadu.com [91.218.175.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C916606A323
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:52:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C916606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SR05x8JL
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DWd0xhelk2YFIhRVZofJlpgweZVvr/fdjF5GhP3nCXY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672339; v=1; x=1796277139;
 b=SR05x8JLlMUYK7jnKWuLlxCA4kD34Om/t10MxvLDUxvbZnHEc89VTHBj+vWur2/+G1kw8KKY
 R1mKZKnGCfOX4xnCAybMFM3ODtCW42jYsD/rnOjgwDElYIvX74vx0gn7Xs4O0yrAs6kdyhsSoCt
 9Hoax+56vdtg/vTPtZcR9AQs=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 85f3c92f703aec8b;
	Thu, 26 Nov 2026 05:52:19 +0000
X-Mizu-Trace-ID: 85f3c92f703aec8b
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org,
	corbet@lwn.net
Cc: ridong.chen@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 0/2] docs: cgroup: Clarify cpuset CPU isolation
Date: Thu, 26 Nov 2026 13:52:04 +0800
Message-ID: <20261126055206.251724-1-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

The cpuset documentation has an incorrect description of boot-time
domain isolation and does not describe the housekeeping CPU requirement
for isolated partitions when full dynticks is enabled.

Patch 1 corrects the cgroup v1 description of isolcpus= and removes a
reference to the nonexistent cpuset.isolcpus file. Patch 2 documents
which CPUs must remain available for housekeeping in cgroup v2.

Guopeng Zhang (2):
  docs: cgroup-v1: Fix the isolcpus description
  docs: cgroup-v2: Document the housekeeping CPU requirement

 Documentation/admin-guide/cgroup-v1/cpusets.rst | 15 ++++++++-------
 Documentation/admin-guide/cgroup-v2.rst         |  7 +++++++
 2 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.43.0


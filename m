Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562888;
	b=4lWbhXOMDGFr2KgRK0Y1ssm48feo4GffK37vSE9hXE0seQhtddketupOqwSgf+SR/thD
	 bwp78ef9MQTi8lOM0zZDHPTmBdAKujEzV1itO3a+YKevZCpGXTrayiOHCVKeMJPBNcc8m
	 CAf+Y8cB0o2ikPaY/r2k811ju9sqShUwN7BaDlBNt6cKfKFJmkz+IlkcIBmUuxGvXZe9e
	 ss7saCZ4Vpv/SfIcNw7Tcnn2eYXxKqJ+nbbmpWn64YWil4ixE8HK6Sz0OsFjbY0cNcvAh
	 V2yT5cPobq9/wJe2/93mlogpPgebz+54ihOPI41FQSg5Y3C/WO/B/5VG3q0tN3x+PmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562888;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZYe3wOkYMWAT9nEkJmHND9GUlXX8tkyrEnTbfn+hGAE=;
	b=pYkmVaku9OPO2UlVKNox8YUBeVVbJXsBYMkdV1Lw8g4cKqTLlwUcZ82Ae3/26N27WvT+
	 tduwEn2w3XBk/VFiiYH5v5NbqTI+eGRPmCxFUfjbaMIjSz8votEtT8uWoXXoNEKZJBs0h
	 GYkkBM68U7zQadFkESVDdnd3qZRKkCEf1BrPJCDNYGTXVBd2TcsQA0A734mIRxi7yZw2f
	 aH+od3n6QI4VgJavibq0ew9v79QjFxxJsoFAwpW6RRyExUOeQcfQxuDeydYjPAbmYgA1p
	 /xWdb6PXK6et8WUnSe90IRT25O7HwKWvb0DutCaaMGmE/ATDz86qPCtY7ScGMplhZ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p02NDSmT;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8344C60A262B
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:08:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8344C60A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=p02NDSmT
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=4KIURn7WEb1ayotO22ZrkJ9wcqdsX7N260OoXXlEYTw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792562884; v=1; x=1793167684;
 b=p02NDSmTaSCB8KSHun2b3TBjbf1NxzTB/b6rDos/XyDiLhiG+2lxVTaZ4aTR24rWJ9/gY/mw
 cOxsxKQ8l4CCJ668HxHAkwzAjhfXpzA02MknKMDcP6EqNdBo6cYSi0IeK3sur8sTHobIbATp94K
 8nj/4oIDDrwoxMYcccNwBXQE=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id da1eddc643cb8bda;
	Wed, 21 Oct 2026 06:08:03 +0000
X-Mizu-Trace-ID: da1eddc643cb8bda
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	osalvador@suse.de,
	maddy@linux.ibm.com,
	corbet@lwn.net,
	muchun.song@linux.dev,
	lance.yang@linux.dev,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	qi.zheng@linux.dev,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] mm/hugetlb_vmemmap: remove vmemmap_wrprotect_hvo()
Date: Wed, 21 Oct 2026 14:07:56 +0800
Message-ID: <20261021060756.4599-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261019090830.1917657-4-songmuchun@bytedance.com>
References: <20261019090830.1917657-4-songmuchun@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Mon, Oct 19, 2026 at 05:08:29PM +0800, Muchun Song wrote:
>Shared vmemmap tail pages are now mapped read-only during initial
>population, so already optimized HugeTLB bootmem folios no longer need a
>separate write-protection pass.
>
>Remove vmemmap_wrprotect_hvo() and skip these folios during boot-time
>optimization.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Yep, already read-only, so there's no need to write-protect them again.

LGTM, so 

Reviewed-by: Lance Yang <lance.yang@linux.dev>

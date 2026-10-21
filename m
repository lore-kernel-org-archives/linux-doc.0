Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.57
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792563530;
	b=OaAnKlXqmapRiPehKogSOMSMUSUUygwsC2JvotJDoDh9lSULGclgAe+elKjKXq/d1ojE
	 W5orFSUdBmBNI4+h310MgJIYcLXcDSb1cRPQJ5Dmw9YsYrf1A6wjnrVn2Yyp3yp8fkVea
	 D9ZukmhCfJ5kt7Mub2FJDUVvNsrQIzPb77xao0tU6sUw8sQqGWW+iWCsDqpId+5qHJhdH
	 1+yPJScS/F5vzeksGP1biTz8r8xf7XffkX/jTI8v70o26NFmQzz4NH9G2GcrH6tVcKLYu
	 ei8bYZs2IKaj5OAn9V9nxZa+7Jr9OIoVKXj7w5fqCGlvazbB1IFPv0sspgOJnJiD1dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792563530;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pj0w5I+TLXbeTsxEvtV/dSAOrVQeyg/NjtI1DIx1aAo=;
	b=bUmobAcMpXAifFL24tXbG2AMHBVb1uwd3wln9dJJVK6YEf3L4MLplU089RO3kH7DlS+v
	 xG8VebvhCXr5Tz+IlF8LTG+IaKBOH2mZxGpMwaPnLQAWR9mYZiQOnQec7du30b7yXO33A
	 WZZZcmX5LMZXuiWSQcCDcqMfdSnHzVm/B0ck4RDhzHTGlBaksqN88z1BhVPqDUOHewzz9
	 g05jBzZKeXz4tB3tJu0QNZOGnW6BjnNyELsRt1D/D7Jz1/thpUhP5HmN6yB+Jc+pfbSlU
	 3qXx4VEJrfgeRg9OCaCDwewXfHmJ2ulopgwxIJ63R7/z/vO5rs7G6xOaC7uOhWIw2Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=91.218.175.57
Received: from mta0.migadu.com (out-57.mta0.migadu.com [91.218.175.57])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572D8606A32C
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 06:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pj0w5I+TLXbeTsxEvtV/dSAOrVQeyg/NjtI1DIx1aAo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792563522; v=1; x=1793168322;
 b=QqSaK/eKxDPUM3bH4vyLayiguqJ6warLZ28ldQpe0q72pf7Uvj9vGsJW5Ve2sY281s6w6HS9
 Ep6qXpkemssHk94iGyYGv2fnotQlsFTSycw+VaMxHHDljpESjSUuMBPzLGiPbT1UnsPIjqbHS7E
 B1JrO5VnYezitc/LRuLdq5Sc=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2bd75f41de4092a6;
	Wed, 21 Oct 2026 06:18:42 +0000
X-Mizu-Trace-ID: 2bd75f41de4092a6
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
Subject: Re: [PATCH 4/4] mm/hugetlb_vmemmap: remove hugetlb_vmemmap_optimize_bootmem_folios()
Date: Wed, 21 Oct 2026 14:18:34 +0800
Message-ID: <20261021061834.6834-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261019090830.1917657-5-songmuchun@bytedance.com>
References: <20261019090830.1917657-5-songmuchun@bytedance.com>
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


On Mon, Oct 19, 2026 at 05:08:30PM +0800, Muchun Song wrote:
>With vmemmap_wrprotect_hvo() removed, the bootmem wrapper no longer
>performs any bootmem-specific work.
>
>Call hugetlb_vmemmap_optimize_folios() directly for bootmem folios and
>remove the redundant wrapper.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

No boot-specific work left, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>

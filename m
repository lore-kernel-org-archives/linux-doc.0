Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792561239;
	b=29smq6+z6IgTmtAkUXWZ2zG+qjXDCJ9kPDqeh3CFhUMGJh5A0XcSk7SMl3eMX+SBzOKJ
	 jt/e1MR9dLlx6J+5CLV0ffl8DDxLA9kDnvuACyuyf579xXMdfZDC1lkJLuh7wRy8LXBFJ
	 BSU5gmcUVcC7D7MiUIOsBztFnQ1MjqETWB/bHyruKI0x8/Vq21vmxwORfYOPHMeMjojeG
	 bpPTyMuwLYFbyS0FomIuTpNZ4cd3AK9HmbIAguu/uoY1i6p8cI3WyXmdDbDMLrT0gHTdK
	 9K1Aht7cXfNChydfoLAQIfnzn+7na0J7Se5xfvf+A9RUh2z1y9yQDrPUyvoY/QN4cLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792561239;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=MXiUGp1caAHyyuVtstCR/2L4nYD+n3m1gvu2wPtLXMI=;
	b=wfVKuocwjd3z51dc9Pf9Iq32StlYj+79r7/qVwFMUQMuP1fEhg4YYyY1CqmoAvFh/HFY
	 NDYIj7ljMCLZKRaRyUqoyCHxjx75RFSFjGf8jjcszDBsM6XuNwc5ARkdK4fK5QRHsBMXl
	 SMzvt0iLSDR5+o0QXySEAk6x/0D8mES9BbC5RKDe4QzU6vPLdbUfrtwOB7EMPZ98liHYC
	 kimKTFWma51MzgFqm3F1ll+TP7Fqe6LUFiBJjDbrGauIeoEKzm3vC3sDKAsdXlKIBHZoD
	 JjcXw9+eylIxMnvZs8CZoe3QbF+3LHRuXwW4iwM+trDlj8qtzhYG71JWl2GtwXdJ8DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C+vG9SFB;
	arc=none smtp.remote-ip=91.218.175.139
Received: from mta0.migadu.com (out-139.mta0.migadu.com [91.218.175.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBE1606A319
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 05:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BBE1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=C+vG9SFB
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=MXiUGp1caAHyyuVtstCR/2L4nYD+n3m1gvu2wPtLXMI=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792561237; v=1; x=1793166037;
 b=C+vG9SFBdBQyzmPAziKyxgOkVqVFMKpFAz91RKnVqhXiTWdcCNqsz48DU9VR4qp/m0yzSUQV
 Ukar89XaW1+7SLsXgAbtzL1jRmim1TE67erPvFkI9qwWgjmSW5einQc4C9m+YgKG5Gw8xPPaM06
 EGYG7YWYbrPWjGGM4uejPjW4=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2fc8a9e32f8bec1;
	Wed, 21 Oct 2026 05:40:35 +0000
X-Mizu-Trace-ID: d2fc8a9e32f8bec1
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
Subject: Re: [PATCH 2/4] powerpc/mm: map shared vmemmap tail pages as read-only
Date: Wed, 21 Oct 2026 13:40:29 +0800
Message-ID: <20261021054029.98875-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261019090830.1917657-3-songmuchun@bytedance.com>
References: <20261019090830.1917657-3-songmuchun@bytedance.com>
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


On Mon, Oct 19, 2026 at 05:08:28PM +0800, Muchun Song wrote:
>PowerPC radix uses an architecture-specific vmemmap population path for
>shared tail mappings, so it does not inherit the read-only protection added
>to the common path.
>
>Protect these mappings as well so illegal writes fault instead of
>corrupting metadata shared by multiple tail pages.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Nothing jumped out at me, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>

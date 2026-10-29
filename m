Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.111
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242182;
	b=wWjpr9KznALc37j7Yeev4M1B52Qh+W9nD4vRwTn1WWciLebESRQPLvir+RQjCLIHInCp
	 WAHz2Bn8oQoKJOt41ExbkktVYNHCi3ejcAnmCrrX6aWDJa4oXqgdOf6ZMmIyn6QQlngjh
	 RK/chqAANx5CBQ3sgpmHjNVmjbjdaO7Z4W4KBlJchgeN1pp1u14xf1rBL37Zk+xoENedv
	 zu7ApNKEhTR6Cs39Nli2kqlZM+EVQ1ZUg53tcK2WANkPHom1kl910dKXJuErzcXLS6+o3
	 OkVRcdNduw4+9U5n/pkbYDmBrDzfd1qtaNjpqXPtTXOcJDUFnLep/Z7t4duKMEvTYxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242182;
	h=DMARC-Filter:DKIM-Signature:Content-Type:Cc:From:Message-Id:
	 Mime-Version:Content-Transfer-Encoding:To:Subject:Date:In-Reply-To:
	 User-Agent:X-Lms-Return-Path:References:X-Original-From;
	bh=hTvlG/Tq8WG71QR3KEeqZ4U9dHyqctWa0aSN+5Yu23w=;
	b=cTDeDgHMyDkjRiLbo0KyvGuNVTaTW1m2swFHD/2X2S5O+n8AZ07RrIfqurqoKLua+8+p
	 cXqENVbTglgDt1KM3HcN/ZbcfdeVz0QOc+MZ5AYvl4PcoRqKit8O0DWLRp00x7IEKUBhx
	 VawxSPbthGlnKvamqVZ0JsoXzq9O4GdoCmcFJJ15xKhGh1o1uwNVwp6WQb7JFC7x7JhEs
	 vzx5m2MMa0L6w0pwAmgx1zLgw1MUoLDEmaGQI69I7THZ0EhMaUZepjHUBI3iSz6PJaRNL
	 Awt3iAjeivYtG3bvjCUE2cFKPdIgpOlIf50UxDkdZxIaPw5s04uTV2tpz7E1ZUEKdIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=hdocmnqL;
	arc=none smtp.remote-ip=209.127.230.111
Received: from va-1-111.ptr.blmpb.com (va-1-111.ptr.blmpb.com [209.127.230.111])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB72606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 02:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB72606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=hdocmnqL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793242171; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=hTvlG/Tq8WG71QR3KEeqZ4U9dHyqctWa0aSN+5Yu23w=;
 b=hdocmnqL7Au86xutXGj5AxJd6L2RQ9zUDLfyiIK1GwmRJCNJFLwJJpn593fjdbY0zCEJQ7
 1MoC3D7EjToaXcsv+jHn0WflqUguMcKiWxbklah2aPqhNGVtthA/8mWqBPat/mNyWI2M/q
 eqAsetgnmchrJdyRa/L9NLPJvQu6F9zuDHT9k0qAqIBmYRQwf91FDM9XfQAXhxiAKZEzcy
 2VQxwFYLfijiNlYczQRbgst121FvVhB8Zq5uAnENx4ZbcoAw60fw6W4zNZX/BmXw7p6XrJ
 i3+Xw0N4W6cA6duLzeY0VT2yJYKVqRtKcbdXChcWgcCo3dGaSBPKxQHhJKnOgQ==
Content-Type: text/plain; charset=UTF-8
Cc: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>, 
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <riel@redhat.com>, <rostedt@goodmis.org>, 
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
Message-Id: <b32b2bec-4fa1-4899-9014-52a6568cbd73@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To: "Peter Zijlstra" <peterz@infradead.org>, <bharata@amd.com>
Subject: Re: [PATCH v2 0/3] sched/numa: refine memory tiering promotion heuristics
Date: Thu, 29 Oct 2026 10:49:03 +0800
In-Reply-To: <20261028092004.GG2668804@noisy.programming.kicks-ass.net>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26ae2b439+d67bc1+vger.kernel.org+lizhe.67@bytedance.com>
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028092004.GG2668804@noisy.programming.kicks-ass.net>
X-Original-From: Li Zhe <lizhe.67@bytedance.com>

On 10/28/26 5:20 PM, Peter Zijlstra wrote:
> On Wed, Oct 28, 2026 at 12:12:50PM +0800, Li Zhe wrote:
>> This version narrows the series to memory tiering.  The generic normal
>> NUMA balancing cleanups and heuristic changes from v1 are not included.
> Should we not look at Bharata's pghot stuff first and untangle this numa
> balancing vs tiering nonsense, before making an even bigger mess of
> things?
I agree that pghot is relevant to the longer-term direction.=C2=A0 My
understanding is that the two ideas are not conflicting with each other:
this series tries to refine the current NUMA-balancing-based tiering
implementation, while pghot would be a larger rework of the promotion
infrastructure.

Let's also copy Bharata here so he is aware of this discussion.

Based on Joshua's comment, I can also split patch 2 out as a standalone
fix with a proper Fixes tag, and keep patches 1 and 3 for the broader
tiering heuristic discussion.

Thanks,
Zhe

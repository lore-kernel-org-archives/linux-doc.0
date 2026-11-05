Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793851455;
	b=OkE7kZUrvZcH4SJCtnZGIqAv75buNsThElWGOjf9SB84E55ufTBN28eUd3AhONV29g0M
	 FaNQBq6q1cUGhUaVEBE233kIza1NWGnX4/29kyqp/AhhS1EzeurMGVlFp7mF9e6GydurD
	 t7YbqG2JZ+IQFKpwAjALD4lZc4bSrym1zzvB/HU4S22rPiACpf14FIDUiqk0Em/PzJvRb
	 PVkMRu2BKRSzT/ya+LxSz8lIA8QGq9rPJ9yHA1ftYRRHzjQPBI8Ok6lceufTYPhmy/iM0
	 bqDZVvFAJuIl79oCOyRcUoForGFdS0MAfmIIQPnno0x0nExJJOJVtrCtKvzDUmKsWGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793851455;
	h=DMARC-Filter:DKIM-Signature:Date:Mime-Version:References:
	 X-Lms-Return-Path:Content-Transfer-Encoding:To:Cc:From:In-Reply-To:
	 Subject:Message-Id:User-Agent:X-Original-From:Content-Type;
	bh=ZYu4vf+Y1xQk0GWAYhYxqZeXAZ+RYHgD2MH4lwu/i9M=;
	b=SwJXBTwJh5+DD2Pd3Wxgl+TA1AJLgNgFpixxJIPkTGr7q73MMbf3NHiDBJifhNgo17f/
	 rry5KueD9ZTvYH/o99O/lFSG4rYbHlwbEO3xRVHaS725mY79pUfivoOQB8WWjvzhkuBKC
	 1JNULccw/Ta+ArNSwygxKlHLJ+cTR7yCibrr5GWXMBL+6dGc6XfpYu93Eb456z7FdHtl6
	 BQHt1G5fJL3lCrPStJo4lYsDiXafj6gafJtPip1ff0mM2wNn+l/qI2xj663gmEDK79dSO
	 2Uwd4+pXLIgNMbXNM8ilCAUi1N2a9wI6hEf/DN5ATiolGDfzXuPLyjr5HKEku4bFcmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=fPFwJ55z;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA562606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 04:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA562606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=fPFwJ55z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793851448; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ZYu4vf+Y1xQk0GWAYhYxqZeXAZ+RYHgD2MH4lwu/i9M=;
 b=fPFwJ55ztN6xnQ8J5bfVkdvSYtJ34KITPGNICbCHajpoK+N+mKdNsnnBhKwx5cgAn9JaUX
 Jx8eBwZZtB3WNCp+pC3lyVAzToRVQXo5ICo8+BrGZU6N95KXLHO3E8g4kyRc/psrd7JWd0
 a+y+zAZy5SS+oTMTqt60Q65LBJHQmRAvIvcO5sbBak82mnPgAhTfhOnkp9qVe3Yw91wQFP
 ZOMjTFKVQyldfzQsLBLFgN/8RJQNq9bzfv0dTorXlz7iLFmqhJkp2xStqNMnF3KDY3x5b+
 pxeT1l2EqW3tkOwL4g6G4HstHS/YY8hjKOd08tC9vRQK+w8XR/n7Bcw/QKiXSg==
Date: Thu, 5 Nov 2026 12:03:43 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028041253.74839-1-lizhe.67@bytedance.com> <20261028041253.74839-2-lizhe.67@bytedance.com> <0676993f-c04c-4e4e-9f8d-1650c8fd6d6e@amd.com> <010b2b6c-8f1b-4c3b-913f-cc2e8b957759@bytedance.com> <a6bcd771-fcf7-4fe4-8c21-5e65bd579de7@amd.com> <1bab234e-8914-4694-b0aa-f265fa49c6d3@bytedance.com> <c9cf96bf-f3b1-47da-b22a-9600b5fb01be@amd.com> <3318a7f7-4dec-431b-9284-ec7c2807151c@bytedance.com> <aurO98PC4TTweJs0@gourry-fedora-PF4VCD3F>
X-Lms-Return-Path: <lba+26aec0036+70eca5+vger.kernel.org+lizhe.67@bytedance.com>
Content-Transfer-Encoding: 7bit
To: "Gregory Price" <gourry@gourry.net>
Cc: "Bharata B Rao" <bharata@amd.com>, <akpm@linux-foundation.org>, 
	<bsegall@google.com>, <david@kernel.org>, <dietmar.eggemann@arm.com>, 
	<joshua.hahnjy@gmail.com>, <juri.lelli@redhat.com>, 
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>, 
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>, 
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>, 
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-mm@kvack.org>
From: "Li Zhe" <lizhe.67@bytedance.com>
In-Reply-To: <aurO98PC4TTweJs0@gourry-fedora-PF4VCD3F>
Subject: Re: [PATCH v2 1/3] sched/numa: make free-space tiering promotion bypass configurable
Message-Id: <519e6126-e4c3-4267-91a8-ff81174aaa5a@bytedance.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Li Zhe <lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8

On 11/4/26 2:21 PM, Gregory Price wrote:
> On Mon, Nov 02, 2026 at 10:56:27AM +0800, Li Zhe wrote:
>> On 10/30/26 11:44 AM, Bharata B Rao wrote:
>> Thanks, Bharata.
>>
>> I would appreciate further maintainer feedback on whether this series
>> looks acceptable.
>>
> I will give it some additional time when I get back to normal next week.


Thanks, Gregory.

Thanks,
Zhe

>
> ~Gregory

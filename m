Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823033;
	b=CudVRpAjf28v1gC1btNg5TNrMPCPluibO07BQLX9Uvf3q9tFSN8rO6+ri37cwlilDl19
	 fH/PXvOn/J3jHbxBHzjf70jKOhOnOQCugVTlQWggW27ffdWHrlP5iB9nMWkItc5cXirh2
	 ab+CSuomIN6tUE+sgVCybPqDA3LL183tmZpNmD7pZAvOBGRMwRmPO0D94NRTDTyGgHId+
	 58QY9GN29/0FEHhZc5TXW/mTR2naoSeZdaKjipHXfW6/1603j1ASkE/jwld+QlBs6MxUO
	 iNAoO9eaDBDlQvyv6Ptya0ckNh1AY0YUo29wHZYgyOvScW8BLIfOOveJuifQZsEltBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823033;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=I3+Y3topNYRnSbwR28B8ZoCVuIdcjYVT77tTzbCq1BY=;
	b=SGcUJSd5XCMZo4osp89IKgvZkwKjJe6nNE+27RDvMHTr1f6Ns7Tz4Oata3hD1fp46CU7
	 IZtMKaR0FCIhH1wV+3qx2yIujyPb0X2OBPIXqn+lUt1PnUsSSZ1LXTOb4vIAKN+SHxhVO
	 W+4MLFP2yUtIw1UbFmFPimRH7gQX8qNYAys1aq5JgrH5SSbf/jU0b7wGm5XCdt8Mez76Q
	 EEU6ZvR5cDT7iddKIjPAxjn+VRzSxR0VHrCBR2W1g3hCO1epwEWZn2oo3niAb8z3K5TNW
	 GzwgWZMjT/kv8iGG2QP9TOVBJR2SjRu9ek4snb60D/cmMOAn5mfYOjjiWRhx/608dZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mIEa8V8B;
	arc=none smtp.remote-ip=91.218.175.61
Received: from mta0.migadu.com (out-61.mta0.migadu.com [91.218.175.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7E606A331
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75A7E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=mIEa8V8B
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0M/7xDonC715x6+9O5Xr/LSHzL87I9czc2uSQmfZOqY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794823030; v=1; x=1795427830;
 b=mIEa8V8BULDEnZwbMezqqzI07KCN0zKeDZXL4FJMoz7e3dR22Bme/utuM2G1t+HUt4xs5PtE
 rMZtx5sS9s7IkhGSfQsU6wHOjg2m1tNUVTBCjyJAo5sgn+DQM+SJMdA9yV5L9Nt7sx7mrqOtaCM
 Z1FdH4W/U2kesabiU/A1A+cU=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7dbeea6bfe98ab01;
	Mon, 16 Nov 2026 09:57:10 +0000
X-Mizu-Trace-ID: 7dbeea6bfe98ab01
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be58ad9600so7319e87.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 01:57:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEdzPCvmWKapzfAago7cVrYSf/nHhe3RrcPh7rbDMx5yYLYx5xxvcvlNg7tcu1BNHSj/vLOo+lyzoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lQn0zoumjRNP1g29TNaG3aedYSGecfB74WrOeqYTSua88ZRHl
	NsKkP8/LLS+4lfH8/rO5gmddAIU79qHCx02SMICfAgVkx7K2mbj5Mq+cyWwVlteHQfB9OnjBFlg
	1C+v3p7e5VxUp/aH45V5vrUXe6lZp3ZCCHcKeRzI6
X-Received: by 2002:a05:6512:1244:b0:5c1:4bd2:df42 with SMTP id
 2adb3069b0e04-5c17e452300mr150202e87.12.1794823025609; Mon, 16 Nov 2026
 01:57:05 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
 <20261111085448.1130701-2-fuad.tabba@linux.dev> <f2f36f67-a993-735e-39d3-70e22ce6c87f@huawei.com>
In-Reply-To: <f2f36f67-a993-735e-39d3-70e22ce6c87f@huawei.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 09:56:29 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzVCi6y7FJPjnaY=xR1c+EEMTk=uSU5M2=jiXrMpoEhag@mail.gmail.com>
X-Gm-Features: Aa3M54oK9gpHPc0L5YRcoRoBDe4bteAeLTEBUq9FrNTkoJZSiv4ya5-nPjY7kqk
Message-ID: <CA+EHjTzVCi6y7FJPjnaY=xR1c+EEMTk=uSU5M2=jiXrMpoEhag@mail.gmail.com>
Subject: Re: [PATCH 1/7] Documentation: KVM: Fix references to non-existent identifiers
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, linux-mips@vger.kernel.org, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 09:32, Zenghui Yu <yuzenghui@huawei.com> wrote:
[...]> >    * ``KVM_STATS_TYPE_LINEAR_HIST``
> >      The statistic is reported as a linear histogram. The number of
> >      buckets is specified by the ``size`` field. The size of buckets is specified
> > -    by the ``hist_param`` field. The range of the Nth bucket (1 <= N < ``size``)
> > -    is [``hist_param``*(N-1), ``hist_param``*N), while the range of the last
> > -    bucket is [``hist_param``*(``size``-1), +INF). (+INF means positive infinity
> > -    value.)
> > +    by the ``bucket_size`` field. The range of the Nth bucket
> > +    (1 <= N < ``size``) is [``bucket_size``*(N-1), ``bucket_size``*N), while
> > +    the range of the last bucket is [``bucket_size``*(``size``-1), +INF).
> > +    (+INF means positive infinity value.)
>
> Could we fix the broken reST while we're at it? I mean

Will do in v2.

Thanks,
/fuad

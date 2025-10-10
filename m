Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92FC2F6569
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 14:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760108027; cv=none; b=UfzPfyT9zewgNElJeXLDncArah9PHHMJcTzIirBDhzPU/8b4so39Xna4wVRz7R20Rd6meH4tnGoa//8fX3zd8vL9r+xQPxziLdSbv59OJM8B3VbzhsYBVO/hwB+dYdfRun5ChBBbE5L6Atk8JpThb2Uul77Rrr6Iuwdt3napMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760108027; c=relaxed/simple;
	bh=RE51Q+tai5wxyY7IBNplIrEXUroPvyfLKx/UM06nsPc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XE6ac7rlBI5tfKIkAyXsNgwsOw+NPRMMFjssyA8d2zcCD1tNUB3QP6bilLWoxJ4QWpGallKgwxOcbgicdwIjl3VPqgxaXAZf1TudyWBLKunmh/oH4eOFvHlMF2YAFjULp0A1uupWnmUjAXyVNzeMFP2/Slp5zHfc9RKph5T7HhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JYIDHRBw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JYIDHRBw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760108024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mm1LsfcOuzKZTTBgXzTaGHCG8Gr2uq1l0R9yl5s8auw=;
	b=JYIDHRBwniy3mwrkyr7lR76A2mlZEKeUTs6BhgoLhKj4oM1C4WMnOvkOi4cG8i/TUK6AH2
	0jmlGjrb4mnOKp5MvzHB7iZq5rHoalRPjiT0tXYXbHY1VT2DMbli3h8swtpa5HsSWl399H
	qiGfzFHRLrE9JQRmByqYZKrJVziLfyw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-451-usu0l-P9NwqhFjGwLyIfYA-1; Fri, 10 Oct 2025 10:53:42 -0400
X-MC-Unique: usu0l-P9NwqhFjGwLyIfYA-1
X-Mimecast-MFC-AGG-ID: usu0l-P9NwqhFjGwLyIfYA_1760108021
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b4ed2d44df5so208941066b.2
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 07:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760108021; x=1760712821;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mm1LsfcOuzKZTTBgXzTaGHCG8Gr2uq1l0R9yl5s8auw=;
        b=SGCn6Yndjeza1z+D3REvqw5vta5KWbmMP1TLjuSITn54l9QY969OM0oGpVGX+X+XDC
         NXIdM7wMxKCqIFvTKXnVMhO+e3V6pLVzFq4tKtGu3fb5TbwRjKV90xDnlnSnWWfADedL
         M8BdLmxSQMsO54OVxfdBDFLegsp89kEFgUK38pumA03wxtzsb4W19ww5m0z1VwuBX4ei
         jkjl+4Gi3NZFwcGK/tUEP52peyefBV3oAQvkM7dV1INFZQZRkv7C4of2x7EpGt3+4K2O
         eNbaZqpEn3mFZ+ENeeE8BDe3oYaRlbt247efo/Bb4l5w36E2Yq3kQ3MZim2/Imfx/A30
         4OEA==
X-Forwarded-Encrypted: i=1; AJvYcCXtfynLAF/3KW+Cka+vt/S21GCRQZ+l69BXSYO4Bwbp0SHcBLP5dygpCGYsWJ9V4djVk39U7h2G/14=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmCyDAtihO+qSjOU4oHQsrQ/JkbjRy4u9qrZziTDTaguO6Ma7S
	i/yk25H5IDCgbvS2+lB2fPfhWmJAxy3KEREMLwJeA7RWkWw3Sxh4LMwaxO/h0sQK0e0zyFGJFeI
	fn373ql1C19Nn41krjbKNTs4ookRUg6G6MxlHPkf9ttDEtF255G82jEDMvi7UpQ==
X-Gm-Gg: ASbGnct4ZVgnwTo35rE2VcTz696LDXtzlLm8uodZ9vhN71tDUoWKy9Zm8733xDYlr16
	eGJ8y+cYwObhqGsSV/SBi3LnNCjEMAzY+YI0Ir6l72spM1We7sKJ3lvaQc/OZIqedrxQaLOWT9M
	Gverg5z+Pao6ScdoxEpwo8RaGH9KEIHxvvUxNjvmhQUIOsvtzs12v3v9m8hq7O09nl/12ICaSaY
	sL4UaRBnkUdAuy1IozZZjtP5Ty10tJR0IIeM+Co+5tSrFbS7omoT2OjZwBgoYLxuLO8xvbxyfV4
	7MmOx12/TyXI/xsU1A/zk7dBNIIBWn7pA+F7ufZQ6VAbjzTH0wPOT4ZQxzlHbeIZFHahxTUQe9O
	fMjG/jiWSUgUI
X-Received: by 2002:a17:907:3d16:b0:b38:25b2:e71c with SMTP id a640c23a62f3a-b50ac1c0d4amr1269988166b.41.1760108021427;
        Fri, 10 Oct 2025 07:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvs40B7jZcN/+w79lx0XokZpMjaCzgtfhFa84wc/vDHQJD9iDkyGA8sI2ISLmd873BOO53wg==
X-Received: by 2002:a17:907:3d16:b0:b38:25b2:e71c with SMTP id a640c23a62f3a-b50ac1c0d4amr1269983566b.41.1760108021007;
        Fri, 10 Oct 2025 07:53:41 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d67d8283sm249396166b.38.2025.10.10.07.53.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 07:53:40 -0700 (PDT)
Message-ID: <0ec01c17-1c39-4207-96f8-597bc8d6c394@redhat.com>
Date: Fri, 10 Oct 2025 16:53:36 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 net-next 00/13] AccECN protocol case handling series
To: chia-yu.chang@nokia-bell-labs.com, edumazet@google.com,
 linux-doc@vger.kernel.org, corbet@lwn.net, horms@kernel.org,
 dsahern@kernel.org, kuniyu@amazon.com, bpf@vger.kernel.org,
 netdev@vger.kernel.org, dave.taht@gmail.com, jhs@mojatatu.com,
 kuba@kernel.org, stephen@networkplumber.org, xiyou.wangcong@gmail.com,
 jiri@resnulli.us, davem@davemloft.net, andrew+netdev@lunn.ch,
 donald.hunter@gmail.com, ast@fiberby.net, liuhangbin@gmail.com,
 shuah@kernel.org, linux-kselftest@vger.kernel.org, ij@kernel.org,
 ncardwell@google.com, koen.de_schepper@nokia-bell-labs.com,
 g.white@cablelabs.com, ingemar.s.johansson@ericsson.com,
 mirja.kuehlewind@ericsson.com, cheshire@apple.com, rs.ietf@gmx.at,
 Jason_Livingood@comcast.com, vidhi_goel@apple.com
References: <20251010131727.55196-1-chia-yu.chang@nokia-bell-labs.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251010131727.55196-1-chia-yu.chang@nokia-bell-labs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/25 3:17 PM, chia-yu.chang@nokia-bell-labs.com wrote:
> From: Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>
> 
> Hello,
> 
> Plesae find the v4 AccECN case handling patch series, which covers
> several excpetional case handling of Accurate ECN spec (RFC9768),
> adds new identifiers to be used by CC modules, adds ecn_delta into
> rate_sample, and keeps the ACE counter for computation, etc.
> 
> This patch series is part of the full AccECN patch series, which is available at
> https://github.com/L4STeam/linux-net-next/commits/upstream_l4steam/
> 
> Best regards,
> Chia-Yu

## Form letter - net-next-closed

The merge window for v6.18 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after October 12th.

RFC patches sent for review only are obviously welcome at any time.


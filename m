Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793710978;
	b=ApSvix+VXVYuWA4lcHwVasF39QMzEUNV2kxvvCarfqXjxfNG+JEyft/aWJzIrf6PB9tB
	 KID3NhR10SC5AID6iu6f7uf0rwEqYJ4tg4fbK5JC+R/rK1YnBQo8DCLYULd/G159OO8D6
	 kKWwenv3CdGNdqr7Zpz93ndEFqLm9kaJdAuhAuvQFlFp/szDmCbtxvq3feujFMMrC9LA4
	 t/rKdn/t6OTBWqV1byQ7Nv+65rldi4pZWX6+iIJNCUo7VxU4OiLs6gj8aiRdiJoa1QoPo
	 ygsGyE/8JBzI34s0p7vLrICCUfWdQ/PEYGlaTOfgW2n7rtBFLjAI4pSTM6vDmfwjLfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
	b=DZ8d5Hek1zSLymVwMaHiZ/NULV6tIQDPu/LzZFVO4SjQsWzlEd/VB0/oqcSJk2qDRYtX
	 lMksK6Sut+lNByvFa45GWvEFdn78dMfrbWcdbyEoq4+qaW1dbs6rfyWBGhC3V67BY4Ipq
	 ztv2tnA5f7hiCAF2OuVZckvn7Z59mWloliuRvq0nyo7iT3nn6EHsnIi3uobUwhhw4Gqqw
	 Z8INy/smgiyparrUglw5ep/xIZoQd2hCdTGycZjIoS5egyD4oo1DrxZLXVt5XqH2ytbJo
	 KnzkKz57GGj2sJ+Myy1PGls0qrXwTVMqHMvXpU6E82eDSNgsmp05niqXIa7ZZXXEP+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0J1OrXe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265B1606A328
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 13:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 265B1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v0J1OrXe
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c75be77c4so41116266d6.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 05:02:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793710977; cv=none;
        d=google.com; s=arc-20260327;
        b=njgL7XJIqFS/vaYLnZVtiSAsf4Z8RpS+0fXesRymVzbOP9Q2v4Fu69fD2znlRLtPOs
         Mrux4G0rL9//YZGPnujh9OycsM4jwoGeNqrmfEPID0v9a0c8cDH8UuAIAUJWk5g5K44E
         qv89Fhwz13juKH21GzJoY518/+u/WlI+hGYzfGNjE3Jqolce6tL5NN/mBFLJpy9RIspK
         Gv+8iRP9LC2j7DvbKH17PChWWSmUW2Kk9GI3MazhI3WJSWMShQmqig4H/Qs0+wey69ll
         gbgN1skutJXwj6kcBDhLbTrz4g0U+5GKE4nHWBjK/LHBGkSNcekEY9hH6fjuHRByPfcm
         aqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        fh=R6NsYghcRjRltCHVlCRM7jkM9IV1vj52+6DsdSm6LU0=;
        b=OB41Xv9wykJTpWCPnpfZVdtsx/D/gTBHmqcZwu2fx3YjHsln70SdAT6+bBqc15hOBn
         IhKZrkiMu8K3T3CWIWrxZRU5Sn7Yd6qR1+7/Y2QwGIligelcZMsidGi/LvtaBYQf9Zoj
         9J04uspgTTVDT/7wiIn9Ls1m69RqHNEi6sQw5Nqnz0TSnLg+qgKdx8Ge6zVLJ5JCISfC
         JTx0RrIu0EhKCW5MBJ3vLzIVFBEolFns20OhmpE9FhZeY/7lqB1s+usItw5K5fRJx5V+
         3PhAWU6ZH8J0Lqf9/uXA4qMG/Jl+bwcHRuyfgEecTl/ytC39StxXPo55hRPIZYlae1UC
         BrYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793710977; x=1794315777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        b=v0J1OrXeUMPEmEEhT62ssZ3ErEq4u9Fiey81vE5lfj9wYme9hgrRMzBDKfKooflQgS
         eZdeGpcj4iTjypeLMMbRFaCyvNzimAA43o2YWCrUDXmOy/uycVDcOiQfDTHF0QK7HrOS
         djEB0ujJ5N+KMcZkV/NBlWQEj3Svm9CAadJvAqlkER1rmRsjH4fDc+yZ99JTr3xiF7aL
         Ik7C0GrsEywAJcI4vzpqmn4duAKSCbpBxYWZmvPv3bSd1gmE6FuSFd3+dsOETkmXYcDb
         jWFakBYUVgLmKIVcx+o3d2c1qaXlQ53LfuvK81EDJ8MP77oBRb5w9tKYMyfega1yQF1T
         WfQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793710977; x=1794315777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=on37PXbM7L/a+kn8oZoA/9dm3L7FCQljHg4Hf4R0FgM=;
        b=HwfUl6xy1H+hF8FOIkB7X4TB3rGSkD9fFInHf54Gtu47DdBNKkIdOE29IrotB6EvCQ
         jMKCMQaRbYvmbAOGoSgWsvi9xKAEy9x3pdBtVlMhjFPJJ14ZlYJdgDY7rCwBexg7kome
         KCHvLS0abFTHrpZ/CzE6yUFSA6TLa+Xbds5HqM3RUVJQPCZhgcg55qrQYXOrV+JC62Y5
         MGwzGp7vriXM1s36KsJcz7GMIBqW3LeLaaFAEmJ6u8sc8bx3P6HOWm+NI9mEF9WtvCdh
         A60bK6xq989Hrnqkfkdl2TobXHCNJvMt8oNNKYVUP9vcYUJDPrHQs45l7/Lb9JDa2PX5
         x7pA==
X-Forwarded-Encrypted: i=1; AKwUvBztdSiHBJlpchrHOHOqUxgEoJjWtmn04A5ua5MAehjWG/p/OAqHAoMxHzW4Oei3Nb5M6rlZuGB19p0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AwQiitF2FbzyiY72ouO+Cu051ryzleWalq7Z71kcw2Uclsz3U
	PrgK465WeQVcdbZnbem2uGx5mTNhV8yHxQWOTE4uaRp74gS29qhFuPjyp56cnkpPGoHHfVRL/t2
	LWPyeW0u/UKf79g5HguE2dV5fkWUZZJ4=
X-Gm-Gg: AYBFou2yqUVQDIp3pDRRu44RG7acOBgOPxoewvZNikPrOvXjmtA8n301paQdnK72bCT
	gNkmMWjfF6JVh43mJ0cfjBsGwY8OeWefaIqVVOPvAb71b+A7yr/jRsbfjH7lLTUVPTrhBY95VOy
	M38gt4u7DCLD4LnnKMaXECdrrgmYet3Jc6EdW41KI6bGR1VMFrRcQHbWwu5Bwpfz32QyAGuFZLB
	FjbCJJZ7U+6flQx2oruPXn1PwIVXyIjzppoz6YqEhn9nzG1/MDtUGQ8hhakGwXXeiomwvZgM7qE
	WgXOMjPOrCtxnK8N3Y/8WZUBOFUOXQx+IohMyuSwGtyZpjZf6qhk3MyFkzdTf6Y9mlXcWajHx2l
	ERU2jpQjlIs5igvUIAl3ncB+ZybtoGeNehSGshzlhPvj2a6D7O8yHdHc3Nmc966PL/Zj/CRqqCw
	aoNspVXpza2O+jrydz4c63LADZcaSgWIrebWpk7pdr776WWnMLG5ZuHzywcP1jN7WFXTz+ZNVKx
	kIIcs4DnWSqpK0Se4KKsOs=
X-Received: by 2002:a05:6214:4a89:b0:91b:9352:15d0 with SMTP id
 6a1803df08f44-91ca4bad090mr196643286d6.35.1793710976699; Tue, 03 Nov 2026
 05:02:56 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029123611.1108424-1-ruanjinjie@huawei.com>
 <20261029123611.1108424-20-ruanjinjie@huawei.com> <CAMAsx6c655ZN6YkwCSmgo9rdddUG9sjYQE_1XQi6=J=i=7N_Jw@mail.gmail.com>
 <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
In-Reply-To: <432a92de-bd62-4d89-b0b8-3e89086660e0@huawei.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Nov 2026 10:02:45 -0300
X-Gm-Features: AclHuK9p5bXr6svQ6FTPGus5f_ZqQ_8eDBEs8TppHm5Lc6glYTBwkJFMiYpPjIg
Message-ID: <CAMAsx6fCiTLSPpbOPW9nh1rmqLEzy6i-YjK5BzhtmRq4nBykjA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 19/19] Documentation: arm64: mpam: Describe the L2
 monitor events
To: ruanjinjie@huawei.com
Cc: reinette.chatre@intel.com, james.morse@arm.com, ben.horgan@arm.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 03, 2026 05:59 AM, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
Hi Jinjie,

> This is an outdated message leftover by mistake; please ignore it.

Thanks for clarifying. Will the commit message be fixed in the next
version, or will the patch go forward as it is? I ask because the stale
sentence ("Say why a bandwidth counter is assigned for the life of the
monitoring group...") would otherwise end up in the git history.


Thanks,
Daniel

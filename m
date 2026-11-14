Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690313;
	b=OkoS67w6aEYY3oLRxZ7DVFipW+RfFojOBtIQXyEQBrzGxIuCi/OEUYuE0Z9ujSA/nGnL
	 Pms/8ff6hpuZ11UTIwELhtdEeJmwe2OVAFV6ltPJuzuZ7TkES/Vd2cIqPLIjwNf922k0v
	 RaWE84bCTrG/kFvuh3KDg9i0JiAEaMxS22ntcJT2QNHo31kZ87ibpsAjs86/mCZ3mMSgZ
	 e7utzV56hdZwqsycPw9w1dgeIjAc1eCgDw9zEUVEJziYIn97Y+qyhNYoyAb3uf6iONacy
	 p4unaLHsD81CO2dOrjYXwTzRcnUdq8rPG8XkzE4/v7oINvlY+urkJ6dYJYuhmYJ8OEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
	b=41wkW6k9rdMPZG46q2wbDi1UVJhLSfcCRfJ2WWLKvOGl5onz0EmTNyFYzkjkiML4wS8G
	 rm/VllzVBhCMRCbmsgPTAzQ42UMf1/Z886M0IS9VGZMto4GUBB0jksUbSzb+3CwhXid8t
	 T/ZCex/uHriEa6xShF94ml+OnNY8C5rr/B7nGXCBgPsoZwPxKkBwqvlTlhRMXwlvvVSel
	 45BWK3yrP+ft56omRTSU6bjD2k4+DNJMi8g9cKRDTqctpICQjTstWM+7IiygddkP99n3D
	 ik1x5adloB0imkJYFYiQaUjI/NWS3tqAsjcXUuXL0Vo98NafSfenVljVjtdBXxk2eZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F483606A327
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 21:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F483606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Fb5v+9t5
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so2858256a12.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 13:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794690307; x=1795295107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=Fb5v+9t5HQpH99lBDL6eSyXCd561d6T4RIG3tul3obk+hV+lLvqwx2E/a53VBrruzj
         C7QdCNRUNH/J3utrvpe2c/geGqZ5Sl8S8ROXMNSnD6HIxac1Ng+Ry9w9h6KKx9WqPGRk
         nL5/soLI9m/NrOZQjEKC8IeWYL9z0hSTP62ueEx8glDPxYjodiB5UKN/us3YZ/pjLuiy
         jR7DawCFm/DODgpczCGYTo42aYB6PExJBlNnAUTnFQ1VK90sXBu/fB3nC7A4lv4SEGbL
         FCfXgTsCZXAhHYy7HOtrxslAD9W2+jbfWDGJdsvIuv9xo7so5tZou4C9uFbhXQelwj4a
         ryLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690307; x=1795295107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S6r9JliYuLkU6bNVnsHUex3XuU8S/UM2soCRpJowQjE=;
        b=fo1mHMHvhE9j+eY4IHGEUQFfrdzBaZpN5uUF4AcE+2SD/hxlVXF1e6OU+g5+IdY7sF
         MkP1B/TOaGJcRu3kwlODpSe/fWCF3ASe4G4lCCGGWwgoLOIzAUYd1fCrq6WF3YmVA2pr
         g/D+xDa7TpOJ/jkOL0tJi2JXONudwfKWBFBj9NG85CHiZnkpxfksRamKC77eIp7CChJ7
         qvrvfJ1gtnp6vzPNq9cuHz+Rp3zywHGg2PPHUW5j6uXa9LuWj0Kx+RHcmYdVBJS1Fl0y
         YRxkEhUHz65Gppkwsgc4ztfTwxsk9p/0ha10hs8fuON/Z5htt8hjFpJNJlDQp8T/mp++
         9Siw==
X-Forwarded-Encrypted: i=1; AL+hErFCplTh0LnMX8pO6+cQK24naZZcP+WFL5mADrl8m/aY1ygtu6s/MzbOaq+j7d7C850mSAbum1C6EZw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d2lZ80aq5FRY8bXvHbTpAjCtIeCYdglK0PbDzMJ2auHyjGxG3
	i2V34ix2eIEcEeKEEYVjqrWuyPUrT+54ShV1jM0t/jahzKmz2imDQ/Itak/HqhfdrA==
X-Gm-Gg: AYBFou2vNB8y3ObwhLMf8njQdGVj+nnP4woTeKDPQUpjZJ9N771fCFvgJMl0nxqRjTJ
	X6ImUeBB9wbOqnEYCzA09L/EKvuNHsub/03HRH+SCJtnTdP7v3npjpzBgZ5SKt8BRUy878C0f5C
	Uk2uBENoV0wnmonX8Ug9ADANAsWdLPCKkabBuAioHqSB/bU50IiGOaBMrw4NfuVyW4oDfdhowyo
	2E8qNJX7/YcAqd99YVM8AT/2X94AEBT//4UJ6L0fATIjKCkt8PivELTw4V4oJK1G/l3t3EsoXgB
	r02I7lYjDQpoQwniSp9yxfalw0gQSMNepiAt9egCqDi6ztxOq6LTlajfrNRO0D80wfWkA0jYay9
	IrZu3dFjVBd+iQFKavTPRHkSgU8Genfq0BcUvX3Lyz06Tl4j5P/N6w+2bOysxGispQeTz5Oq+Pc
	YZoM5rocHd7OiB2LjNf4kLCbREV6Fo3PKXX5s7MAf3kCP6jJYfnjkGgqDkSd1gtKZXONmoeP66Y
	q4nA3FLwVp9xVj5TubAN/0f8rl2esRke0M3NR02KRkfXlJNluLgRCY58t3+VKCqqqI5WvMWT41B
	n+QNuyr3S72fwKNPagStwV+Bqz1gOCxp/janrSYiZO5kzQkyqrxsIF8OqGjnZCv87xFwvMnNU3O
	ScjFMiXc22XZnrIpRzysIvEmtlEzwgN0d4vJyoBujuY+tn+Qw3t80Yeg82GqJ8CzShUSra7uw47
	8B+8cDeXezseC7qZAYq8aB6DGlDhvHGwWJBiKA6rD59rcpWIzwGmmaVeBTiezy+DH5p2/43Kj6e
	rwqnssmblw5qJfJ5JvrALwl1griDwNtl0KHBEd5bPM2rMA7QETqFiU+R+NYGc14vaO2xc9zvBgg
	tOE38N6LtfkVE7Ef0bi6B07X
X-Received: by 2002:a05:6402:42c7:b0:6b7:eda4:e136 with SMTP id 4fb4d7f45d1cf-6b7eda4e281mr1321653a12.41.1794690306618;
        Sat, 14 Nov 2026 13:05:06 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c2361280sm2705836a12.10.2026.11.14.13.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:05:05 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	dsahern@kernel.org,
	idosch@nvidia.com,
	ncardwell@google.com,
	kuniyu@google.com,
	richardbgobert@gmail.com,
	willemb@google.com,
	ecree.xilinx@gmail.com,
	linux-net-drivers@amd.com,
	saeedm@nvidia.com,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	leon@kernel.org,
	linux-rdma@vger.kernel.org,
	alexei.starovoitov@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	martin.lau@linux.dev,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the header they describe
Date: Sat, 14 Nov 2026 22:05:02 +0100
Message-ID: <20261114210502.787195-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179468119953.2168702.10813567320493574993@kernel.org>
References: <cover.1794139176.git.julius@bairaktaris.de> <179468119953.2168702.10813567320493574993@kernel.org>
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

On Sat, 14 Nov 2026 18:33:19 +0000, netdev-bot+sinfo@kernel.org wrote:
> - How the issue was discovered, e.g. hit in production, hit during
>   development, syzbot report, manual code inspection, LLM or static
>   analysis tool scan.

Reported by the hosted Sashiko AI review of v2 2/3 of my "ipmr: forward
GSO multicast packets" series:
https://lore.kernel.org/netdev/179182559332.434549.18294510093742639467@kernel.org/
I then reproduced it with the selftest in patch 2: on net, 6 of its 18
cases fail in 2 of 2 runs.

Julius

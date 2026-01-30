Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74F378820
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769771629; cv=none; b=FkdzH3c/JHh8GttOuAi41aXZDI3+CZe5t/ajPBLIpp5SbN3JDGOxAmTsBtuj3j2gQ0Nrk+dvOoKFB6LR5EiG6DRdt6znbFi8CJnUNk1rDrEoKN7DIrGr9bha1roW3qnDoDRLFxTnHoajoCwKyXI8OjS2JN8PEQwxPF7t+cDFOWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769771629; c=relaxed/simple;
	bh=TCis+rQCC6z7XYAkYemlUIoHru5jgaTIrUqt6t+FWY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwiimgnbhE9zvgSNO2MLkJ0qwNMmTva03Hv2d45AkRCuRZmCV2EH6KSR0t8l5SJj8kOqY3/qhOOo9S4bsOklDuF19E1NeoIET8hqUnIeFHuqmBK/eL4CFfEm5nn+vio6e7/+Cyv/dwJp9L/xFb+m2zgTgN5PhEBWdmrFUIWzADQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bijCiHCD; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bijCiHCD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so1312629f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 03:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769771627; x=1770376427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+yjYwZ7RDCJlqlGtt5ChUntZSWDd8aPFqDlY3AniEk=;
        b=bijCiHCDiDsrfYSkVIjAqtFdXK0pP3y5v8itW4VnLqZB29KGa2STuu35LNttVG3FeD
         3c42LD0VN3OVZl0OwXHeg2zrB8V3YNvwyL0HXxsDzB1qcEZ+YwhJ7CMckfyeQ+x5xU72
         s2CrtAtfxPINwcj5teHNx/VBE9F7lnSx4sGwHfirvj88paMTt7kmu14fQ0auD7MuVxvX
         8DnEgXkyvEy22rxA+B3tXASXH4HcS+Nki6mWmlmUFHjtWbY57ac9OYUKL90KW9PJMiLN
         AunrO3J9F9L/zmEkvl+41y/JuzskrpStPTww79WkogBJh0QU+QarB0Sj1xg+1k9NaeNx
         ZBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769771627; x=1770376427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w+yjYwZ7RDCJlqlGtt5ChUntZSWDd8aPFqDlY3AniEk=;
        b=uwYVJqtb15gDTm70PoMufeBWzlcv9HvDrtmLti0ozgu+Z79P7+U6oMvxeM1NyZrvHt
         lPDy/fR18L4TIIrLAxwnJ5SHYzOeB7nqJ2U2DcpMxjheAeCMzzzTi2WmnUJCLQB7+z5t
         5P+ys8rMze+t3gxeDDAOywXdrZaVxNOzn/fRKSL74gIRP8+gnTmgFACDRN7P05RVxQAV
         /o/PnzUwAXnZXFwr5k0T+FLwOo4ZV8mQ7t1FfrGFGp7hxi+ZcOOwsIkP1fOlHLnZgBqH
         cuZAXjJzrEOE4Lz0dildbfGSlW32eugKkXHGDk/u2s4SporSSCwYnjIDuvvajnp0076o
         yPgg==
X-Forwarded-Encrypted: i=1; AJvYcCWCbIQhe9t0JKFw5CWVY58B4QeSKPJ7cPwnCKE97qGHg9h2wgBgMQ/P5Ak+M3iQhUUmFNbfG5zXT/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuxrkpA4bgLIsKSv89iUySMjRf96wAwbRwAkMSxmtdHKLOHGA/
	W/DcFtCQ4T1TAW/Hox0yTq1I+7Ubp0Rf1WjWkYjlvKS4nI/Jd50M4/pE
X-Gm-Gg: AZuq6aLLBwNnmnecJyzSNcfTVZtMJISBLKvbhcJAMcTp0laZG+ZRAGZsfQc46pG39PK
	0EWa5p47NTujCLhfBrIre1S+wSU7l3IXIZuPUK42BaQsBjYyhi/uSbepOobX7l1f86BDdssBUBi
	GQUXShX3ItoivJcrGqMXmysi/vJULegZZ3qQbC+JLgL6okMu8lNXnlCuUwAzPfZ9ECHzdeafJPp
	PYCIfXEB5Yn1SXzm25VcprldGcqSMhe450ThpXKqSyAZVzzPgj2YGIU1rjfpPmgSnHHq7/MtTQ5
	84phs2lRhBUC7ofDXSCvFwXfzlcpV2VqiR84d5H6LYSuOrR1gwDc+q+h3kU8frx0pFwymDEGSjp
	go0qZCAiOEefnr72LYTb5Prw03yEod0wD43B7j3c0ajUELFnfJ4kwAaVG99LyES5jSXNWOb4zn3
	2KbKWO5cLNLcukOpy/G1QQYYZ/wI4KEYv1tcoYvLnz2qSUmjNVp1jldLZWmjmi+Ii5M81ieMypX
	67RS+17kwJAWWo7dQ8eLdYqmXt9bNUPv98RDhEDbw0T69w=
X-Received: by 2002:a05:6000:2905:b0:431:16d:63d1 with SMTP id ffacd0b85a97d-435f3aaf59dmr4092783f8f.44.1769771626677;
        Fri, 30 Jan 2026 03:13:46 -0800 (PST)
Received: from ?IPV6:2620:10d:c096:325:77fd:1068:74c8:af87? ([2620:10d:c092:600::1:99eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e131cfc9sm21437487f8f.21.2026.01.30.03.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 03:13:46 -0800 (PST)
Message-ID: <c37ae03d-2b0e-4179-ac22-7d0c01ff601d@gmail.com>
Date: Fri, 30 Jan 2026 11:13:35 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 0/5] net: devmem: improve cpu cost of RX
 token management
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stanislav Fomichev <stfomichev@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Mina Almasry <almasrymina@google.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn
 <willemb@google.com>, Neal Cardwell <ncardwell@google.com>,
 David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Shuah Khan <shuah@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 matttbe@kernel.org, skhawaja@google.com,
 Bobby Eshleman <bobbyeshleman@meta.com>
References: <20260115-scratch-bobbyeshleman-devmem-tcp-token-upstream-v10-0-686d0af71978@meta.com>
 <20260120170749.101e8bcc@kernel.org>
 <CAHS8izMZxM6rcF+7Lfw=KFv4dmbHGSUrQBPmxO+sYj=V3TRuwQ@mail.gmail.com>
 <aXe2QhzL4DoVbesQ@devvm11784.nha0.facebook.com>
 <20260126173124.1f0bb98e@kernel.org> <aXhUfC7ZyYge1jti@mini-arch>
 <CAKB00G3p9_VUTEW_KQvS1JAd+Ju_pjrU5r-v_p+K8Y=vH__mTQ@mail.gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <CAKB00G3p9_VUTEW_KQvS1JAd+Ju_pjrU5r-v_p+K8Y=vH__mTQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/27/26 06:48, Bobby Eshleman wrote:
> On Mon, Jan 26, 2026 at 10:00 PM Stanislav Fomichev
> <stfomichev@gmail.com> wrote:
>>
>> On 01/26, Jakub Kicinski wrote:
>>> On Mon, 26 Jan 2026 10:45:22 -0800 Bobby Eshleman wrote:
>>>> I'm onboard with improving what we have since it helps all of us
>>>> currently using this API, though I'm not opposed to discussing a
>>>> redesign in another thread/RFC. I do see the attraction to locating the
>>>> core logic in one place and possibly reducing some complexity around
>>>> socket/binding relationships.
>>>>
>>>> FWIW regarding nl, I do see it supports rtnl lock-free operations via
>>>> '62256f98f244 rtnetlink: add RTNL_FLAG_DOIT_UNLOCKED' and routing was
>>>> recently made lockless with that. I don't see / know of any fast path
>>>> precedent. I'm aware there are some things I'm not sure about being
>>>> relevant performance-wise, like hitting skb alloc an additional time
>>>> every release batch. I'd want to do some minimal latency comparisons
>>>> between that path and sockopt before diving head-first.
>>>
>>> FTR I'm not really pushing Netlink specifically, it may work it
>>> may not. Perhaps some other ioctl-y thing exists. Just in general
>>> setsockopt() on a specific socket feels increasingly awkward for
>>> buffer flow. Maybe y'all disagree.
>>>
>>> I thought I'd clarify since I may be seen as "Mr Netlink Everywhere" :)
>>
>>  From my side, if we do a completely new uapi, my preference would be on
>> an af_xdp like mapped rings (presumably on a netlink socket?) to completely
>> avoid the user-kernel copies.
> 
> I second liking that approach. No put_cmsg() and or token alloc overhead (both
> jump up in my profiling).

Hmm, makes me wonder why not use zcrx instead of reinventing it? It
doesn't bind net_iov to sockets just as you do in this series. And it
also returns buffers back via a shared ring. Otherwise you'll be facing
same issues, like rings running out of space, and so you will need to
have a fallback path. And user space will need to synchronise the ring
if it's shared with other threads, and there will be a question of how
to scale it next, possibly by creating multiple rings as I'll likely to
do soon for zcrx.

-- 
Pavel Begunkov


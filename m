Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AA13C1409
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 08:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773218091; cv=pass; b=tQ7HXwmaBrCCuPvaLp3l6QmHEVe3ErTlIdr8SKgdFwN4eibHg4afrMO/z9lsjeFns+Fc7kf9SXkydWkTkzkL8bY584rIwjl2jRMOdOH73E045Gi7D50KAV2dkp8MAF6pbbxzTxa6Wp9JrFsX0xjqZ1r2/cN/HeHo6FmsxVNHmEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773218091; c=relaxed/simple;
	bh=SsapxUY06a7cs9bBuRB3R8cKxgdqx7oMrI3eEaj8qe8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TDPhjM3gHpwKeoOJeaADR2pROo2VvE1D69b771mGLOt7qdIKU/FrEDGH6I6vexA/4FoVZ4JdLdXMAWMBxr8awm+4cx9wOTc3udQ82Seo/whnr3FH9zZREONJVGmhfpYaOoTt4ey5ghx0JWIRYKGz1qKzWWFI8Iyz2Yw0o2GTVCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hlk4Q8yu; arc=pass smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hlk4Q8yu"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-509101189edso31582621cf.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 01:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773218084; cv=none;
        d=google.com; s=arc-20240605;
        b=R64Ub9r1s1+6jBx7q4fap0PnXNJMyuQYXoj0XaA0OjE8qIjvwDXWnbrj5QmD3qjEL9
         4G+0BCEeggKeewJiGqB9AivG2dlzH79S0ZfMge8hqt0HYGT1/5UMlTcpNe+Dh5iJFg45
         yoDLc+RvAzNgdR1Qlz3SR/BNslMjLpvw38gTn3J14VMo0PJeo/DGpPRC03iGo/J35KQz
         vfeplSYXNOpp704fTyHZynOqshHNU1qecW845YKzduu+Q2HXvYSgvmDvi7ynU8B7+xUG
         B9hhjU4lbakS7Oq1O5lyIP21guSFJh6q22JqN6FH4mm/cmu4HpcHhiwmvBtbJWU2PLod
         OkmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=infw2GOKBa/xQ0FaqhlrOevyT/EEGe52s1hqFD6TVIs=;
        fh=Uj808cJrc70ihDguIsKyz8Lx2iJnoIwKFPJAfLE938I=;
        b=KVXr83siwmenHptBrtSuZv2sfsKFBHgEhnSz3e0rGmvIgWmeifCOsliDnh/S/LrrXB
         5cLd1jU+JGGuRfPOhT2tMD7Bl7Qi5JEe1m+Mpl9PkccPyb5sUzwln+Lo3GHBGArnnGCn
         3d5rab3tI4Z7pP73kmz+juPxVSgwlPOKllChhfdd89+ThGolQrvBbzDJkdh8o75uy07A
         Jy16+WWeaBzIZh5Vt2jLFb/kh4RunfWHI8PPvXOKsMoNhH31DhNkIlH5WS78LZIKCby+
         kpixnmiXzSnXCoW8dm7BG+KazdMyPjZEXMs6t7eDywlf5EqlnLHkDE2rkLLsPpwtnHsj
         /Z1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773218084; x=1773822884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=infw2GOKBa/xQ0FaqhlrOevyT/EEGe52s1hqFD6TVIs=;
        b=hlk4Q8yuViuaZ1defw2+7C1/3pvIVJguTIjEDJ+mqoYMaxn6LVrLcHXfndrlvY7qzu
         rhrSJ8jHMNez9R37G8qhA868kTE64M7NLAFtnUWyJxkpUg+7VuKzbrlm8TbozbcriFdm
         aTOoQJMBsDG6mZsab2j5c3+Up/oNto26+SNMFS+nh7j97f0rFlqEMLHwhrUzhPw2ouOx
         k/H08RstCdFj5vaN3KiYkGmrMydgtowhs1KeWl/YrfsHewWHCtbc89umaMT92PSVKvSg
         qcZBsClFH8t0EfRf4DIFzLXGU9mGpp+bIHiX7Yui7/SFApAe3RCMSdi2mkx28cO4GbMQ
         FLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773218084; x=1773822884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=infw2GOKBa/xQ0FaqhlrOevyT/EEGe52s1hqFD6TVIs=;
        b=UcwZlP6muyw3WiMkQB10l0Q5aimUFwmhXOaJyhwsclpVt6aPSswD53aN72wpDf5bdP
         faatYLHVDzFqGkl2gSQ1ztkfiW8R4csDCVGNNgF/tSAcvr6dD3ew5cO4cncf+qHkDKX+
         jMB+6M8dn/zeCx2AzfmOP4Iggxl4TNVSF6pVJ/kudTfv9d6SW98iUMCUaBZ27MrxaLi+
         Z2t7HqAOc13mpLiM5tA7sY8HWa65EgsHkP170fNTwUaAAMei9DCnNQAQaUFPyr8FLbsq
         t71iNdl2GeDENFa4TmkBS/WV5QsxfAuVjVtgYXHY2F6K0hu0bP5s6Y6rZ4yS1RUk8X/p
         C9fw==
X-Forwarded-Encrypted: i=1; AJvYcCVi8c1Mz2YnYEB/Iib5r+FQGE9dJNl2E6F23Rh276hh6kz9cXTDxX2Txlk7u/r2A11Z8AHTnKgXBTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCZzvKI34hw6xmMASeEKi1aiLlm2IxtUFWg6yvPmSRX82oCnaQ
	Ar2NAYgF27QElJAa4qgBYssaYFmgaDdEQj6sQ6RIQLBtWjr0PEr2yW8b7H6dkv0aBV1dLHOjDrJ
	vY0ZwEebtPvvDcmkbthSi/8Th1+CtqPuaJg6q9fgB
X-Gm-Gg: ATEYQzx63N1f03hWOkCRPkDCFFOnxGP/DbMwYJbSVTyicKq5eC1XTqNR/nTLHzwYbLX
	zQU+sXeqsJuLGDplJoSh/3nhGHBKvH9aGfJBSk+gnYiA2CoCZ5icRiDnm1tMOp3h4t2u2ANLI8K
	z/48k4AGYAlwtIz99iepBJcDdJSosKimUNb/Ok76kIU3EFcMlVXCaF7lcK2Zy+muMO9DxCcADHi
	xiqlj4xXlN3d2oUXLEiSZj6OP6DT+jcZ1oh+7DjjKLhNSfVBFjzbgNUnc0QAxkzPzVaKAbwUgt3
	A/KKKZDg
X-Received: by 2002:ac8:5f89:0:b0:509:20de:4ada with SMTP id
 d75a77b69052e-5093a18950amr18737181cf.48.1773218083994; Wed, 11 Mar 2026
 01:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311075600.948413-1-atwellwea@gmail.com>
In-Reply-To: <20260311075600.948413-1-atwellwea@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 11 Mar 2026 09:34:32 +0100
X-Gm-Features: AaiRm52wCKdcSWz9oNAzUWL_GQOag0jSamOEmON1h9c132p0nbosojJsMVy1eJA
Message-ID: <CANn89i+dojcg=TDh6E1++g_TM7qdcpnyu47n2Q9DRW_w73TjzA@mail.gmail.com>
Subject: Re: [PATCH net 0/7] tcp: preserve advertised rwnd accounting across
 receive-memory decisions
To: Wesley Atwell <atwellwea@gmail.com>, Simon Baatz <gmbnomis@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	ncardwell@google.com, dsahern@kernel.org, matttbe@kernel.org, 
	martineau@kernel.org, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	kuniyu@google.com, horms@kernel.org, geliang@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, 0x7f454c46@gmail.com, 
	linux-doc@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 8:56=E2=80=AFAM Wesley Atwell <atwellwea@gmail.com>=
 wrote:
>
> This series keeps sender-visible TCP receive-window accounting tied to th=
e
> scaling basis that was in force when the window was advertised.
>
> Problem
> -------
>
> `tp->rcv_wnd` is an advertised promise to the sender, but later
> receive-memory admission and clamping could reconstruct that promise
> through the mutable live `scaling_ratio`. After ratio drift, the stack
> could retain or advertise a receive window that no longer matched the
> local hard rmem budget.
>
> Fix
> ---
>
> - store the advertise-time scaling basis alongside `tp->rcv_wnd`
> - refresh that pair at the TCP and MPTCP receive-window write sites
> - consume the snapshot in receive-memory admission, clamping, and the
>   scaled-window quantization path
> - preserve the snapshot across `TCP_REPAIR_WINDOW` restore when userspace
>   provides it, and fall back safely when legacy userspace cannot
> - expose the accounting in tracepoints and cover the ABI/runtime contract
>   in selftests
>

Your series will heavily conflict with Simon's one

https://patchwork.kernel.org/project/netdevbpf/list/?series=3D1063486&state=
=3D%2A&archive=3Dboth

I suggest you rebase/retest/resend after we merge it.

> Series layout
> -------------
>
> 1. track the receive-window snapshot state and helpers
> 2. refresh the snapshot when TCP advertises or initializes windows
> 3. use the snapshot in receive-memory admission and clamping
> 4. extend `TCP_REPAIR_WINDOW` for exact restore plus legacy compatibility
> 5. refresh the TCP shadow window snapshot in MPTCP
> 6. expose rmem/backlog state in `rcvbuf_grow` tracepoints
> 7. cover legacy and extended repair-window layouts in selftests
>
> Testing
> -------
>
> - `git diff --check origin/main..HEAD`
> - `scripts/checkpatch.pl --strict --show-types` on patches 1-7
> - `make -j8 headers`
> - `make -j8 net/ipv4/tcp_input.o net/ipv4/tcp_output.o net/ipv4/tcp_minis=
ocks.o net/ipv4/tcp.o`
> - `make -j8 C=3D1 CF=3D'-D__CHECK_ENDIAN__' W=3D1 net/ipv4/tcp_input.o ne=
t/ipv4/tcp_output.o net/ipv4/tcp_minisocks.o net/ipv4/tcp.o`
> - `make SPHINXDIRS=3D'networking/net_cachelines' htmldocs`
> - `make -j8 vmlinux bzImage modules`
> - `make -C tools/testing/selftests/net/tcp_ao -j8`
> - `make -C tools/testing/selftests/net/mptcp -j8`
> - `packetdrill --dry_run` for `tcp_rcv_toobig.pkt` and
>   `tcp_rcv_toobig_default.pkt`
> - `virtme-run` guest pass for both packetdrill tests
> - feature-enabled guest pass for `restore_ipv4`, `self-connect_ipv4`, and
>   `mptcp_sockopt.sh`
>
> Thanks,
> Wesley
>
> ---
> base-commit: 908c344d5cfa0ee6efb3226d22ea661e078ebfa0
> --
> 2.43.0
>

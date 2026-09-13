Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EA11A6816
	for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 09:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292904; cv=none; b=TfvQQgxvlt4EHQpVpV36YPjSZsHbLTEV5fg5sopBuEvqzK+2P28tfM4FK34zOGtCr7RNhCIbyu7uSQ7FefbuYeHkXAoUeKjIu4TX2SjUReLa4r7kcNrdCeYHKtffph1gmTRYNp4jnOT9CJMZERIm/s2fDq0K06lmPHFV1fvavBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292904; c=relaxed/simple;
	bh=owsxUV26+TugNfbC4Bz0+KGKiRcbdSBwVMp6oIjgyi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=En+joE8/8EK0a3PXOTw5NA2teFZUJeDKjoh5+GpyKU5I0JpZbazgc5i/rbxNqifBxcBWtGRuCa/RDMiBQL6tJ7UYs3IJb7DR8C7mKegCD0NTVzsGiRARuixVjWyTN8W/ewRwH79qYJcLjpwne/AZNeeephho7IXviH535JKH5HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERyJEzhx; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERyJEzhx"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso547920a91.2
        for <linux-doc@vger.kernel.org>; Sun, 13 Sep 2026 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789292901; x=1789897701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V6u+Sjb8r7xjY6JptTsujS7yPcyjNk7vFPdDqkz69nM=;
        b=ERyJEzhxiwVFNLLVAKtsqa3XQSYbhWLnwT8ROTveg+9z9uD7AhHl3NebFlLVHyN/ZL
         VPIloOBQn12QjLehJfrwLlrwHjD4btGVXax96vlyioanACf3EdN3qNWORuyE91FIb2qX
         YhyI1QT36C7vBgXEYWhSQ/brx0Qr1yt2StoF7nxSNKwQs/4GazhqdjRY9lB8oTO3xmIC
         rGlB3VJylrSIrTn9IfIwSlJRgsxl+kdGtEfFvOyeYWn9OpAqFYWujhGiho5bP8WZl9BV
         Ta5/JmyHjIjS4CREBTawY8c45Mzagat6pNVZZlR84uuKTcOjslJ+fWzLdSFBSD3qjaG4
         n25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789292901; x=1789897701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6u+Sjb8r7xjY6JptTsujS7yPcyjNk7vFPdDqkz69nM=;
        b=nPXQLNFfcDO56czM4hYw0SPaLrXmihov2y7d3LtfioE1C7mfa8oN/skBb+Ai53HTze
         /E5VZnUQfCS91bo8XQKjU5DQXJJgonGcqKcmkwXMZ9N+OC0vfl+EnJCPSxr/uPNh0oPq
         RVDpWmLpSLqqfgqaTBeL5fS8zhU6rnuH2H+PbqFZgm283a2IDkzJ9CMxDQQismbjxc8y
         yg02WWEmOLi08+cbN8M+y7kDM1j+P1o6cnZMq0F9QVJL4gdfRi492pp1jPbZRONJGDe7
         o7JhdXf0L1Byoz9TbOUapjTkKap/MOnKFuIwtYZyqeUB1jrwufiAa8wwFP4tgkEsqXpj
         urEw==
X-Gm-Message-State: AFuF++l3ygOWJtpF9J6AzsbOJQPgi5gjMx+gNRaOE0c3bAWUoe3kVPCE
	IX47fNtipIGQSWoGz/hnbX45SRrgJmwQydf/WE8II/PPlSn1gH8Jah+K
X-Gm-Gg: AYBFou341WqocVHqnrqx7fZxknPKDpytSv/WsEnkBAqE4wM+CLVrjOzyiZSGcvvlxy/
	13g0D5iwQFNhXr3qJN5tZ+K8BYpa/AVqEiWn4POVumIx0xgFuA4C5ONKi8p8iwRbhfpV3BAI3XR
	UR+U5nSeWZez99JLtjBLkb0T6cX/+c6Ub/I3O4Bk/YzcD4Bky6U79aIjXf8Nvoays8IbHo6Ku/L
	q4cF1OGqqny2yUAy/zaFGkqCmZWP20ykWTMKgRHRaJzdb5/nGIZj4b2AFSWWwZ3QJNCzYbVNW47
	0gPNKNi151ntAbUe6gLP0kXyzaUWKIINux8sA1PzRkR7/z5KB/XtI1OHx/wLyOzYiq2NdFoKzS8
	/UBmf+yz5e5V1bGlLc8Jn9WDXMWFLaRx44RbPItdoB8nl8KXb6gCkzOO+GWxdEWG708LVBPVqnM
	XbeQE3J1hS919bO7V5BFwWCjXvAxhxsgFjt2ZeS63AGLBS9geGkctOOjHV4Ft9371YPro/oqv/O
	Vr0d09wnu0gGwjFuzs0AZXgN6dIc243pp8qTFnF2pBt
X-Received: by 2002:a17:90b:53cf:b0:380:540:d499 with SMTP id 98e67ed59e1d1-39dbbeb3c67mr11040631a91.6.1789292901241;
        Sun, 13 Sep 2026 02:48:21 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994cf9a6sm14389647a91.10.2026.09.13.02.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 02:48:20 -0700 (PDT)
Message-ID: <892d82bf-aff4-4b0c-9585-8438280b45b1@gmail.com>
Date: Sun, 13 Sep 2026 18:48:18 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] Documentation/litmus-tests: Add SRCU fastpath
 anchor-before-scan test
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: linux-doc@vger.kernel.org, lkmm@lists.linux.dev,
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, skhan@linuxfoundation.org, paulmck@kernel.org,
 dlustig@nvidia.com, joelagnelf@nvidia.com, corbet@lwn.net,
 luc.maranget@inria.fr, j.alglave@ucl.ac.uk, dhowells@redhat.com,
 npiggin@gmail.com, boqun@kernel.org, peterz@infradead.org, will@kernel.org,
 parri.andrea@gmail.com, stern@rowland.harvard.edu
References: <20260912024225.2872265-1-kunwu.chan@gmail.com>
 <20260912024225.2872265-2-kunwu.chan@gmail.com>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20260912024225.2872265-2-kunwu.chan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

This is more of a knee-jerk reaction, but

On Sat, 12 Sep 2026 10:42:24 +0800, Kunwu Chan wrote:
> synchronize_srcu_atomic() may end its grace period immediately when
> its scan of the per-CPU lock counters finds no readers.  Correctness
> requires the grace-period anchor written by srcu_gp_start() to precede
> the smp_mb() ordering the lock scan.  This ordering ensures that any
> reader whose lock increment is missed by the scan cannot have
> incremented its lock counter before the grace-period anchor, and
> therefore cannot be a pre-existing reader of this grace period.
> 
> This litmus test models the key ordering between the grace-period
> anchor and the lock counter scan, where "seq" models the
> grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> smp_mb() and the lock scan.  P1 models the reader-side counter
> increment, with the smp_mb() of __srcu_read_lock() following the
> increment.  P2 models an observer that sees the reader's increment
> before seeing the anchor.
> 
> The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> which permits this outcome.
> 
> Tested with herd7 7.58 using linux-kernel.cfg.
> 
> Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
> ---
>  .../SRCU-fastpath-anchor-before-scan.litmus   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> 
> diff --git a/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> new file mode 100644
> index 000000000000..efa9c0c4e047
> --- /dev/null
> +++ b/Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
> @@ -0,0 +1,57 @@
> +C SRCU-fastpath-anchor-before-scan
> +
> +(*
> + * Result: Never
> + *
> + * The synchronize_srcu_atomic() fastpath may end its grace period
> + * immediately when its scan of the per-CPU lock counters finds no
> + * readers.  Correctness requires the grace-period anchor written by
> + * srcu_gp_start() to precede the smp_mb() ordering the lock scan.
> + * This ordering ensures that any reader whose lock increment is missed
> + * by the scan cannot have incremented its lock counter before the
> + * grace-period anchor, and therefore cannot be a pre-existing reader
> + * of this grace period.
> + *
> + * This litmus test models the key ordering between the grace-period
> + * anchor and the lock counter scan, where "seq" models the
> + * grace-period anchor in ->srcu_gp_seq and "ctr" models the per-CPU
> + * ->srcu_ctrs[].srcu_locks counter.  P0 writes the anchor before the
> + * smp_mb() and the lock scan.  P1 models the reader-side counter
> + * increment, with the smp_mb() of __srcu_read_lock() following the
> + * increment.  P2 models an observer that sees the reader's increment
> + * before seeing the anchor.
> + *
> + * The outcome is forbidden by LKMM, and herd7 reports "Never".  See
> + * SRCU-fastpath-scan-before-anchor.litmus for the reversed ordering,
> + * which permits this outcome.
> + *)
> +
> +{}
> +
> +P0(int *seq, int *ctr)
> +{
> +	int r2;
> +
> +	WRITE_ONCE(*seq, 1);
> +	smp_mb();
> +	r2 = READ_ONCE(*ctr);
> +}
> +
> +P1(int *ctr)
> +{
> +	WRITE_ONCE(*ctr, 1);
> +	smp_mb();
> +}

As P1() has a single memory access, this smp_mb() can't have any
effect on the outcome.

The one you see in "__srcu_read_lock() following the increment" is
there for other ordering requirements, I guess.

Ditto smp_mb() in P1() of 2/2.

Thanks, Akira

> +
> +P2(int *seq, int *ctr)
> +{
> +	int r3;
> +	int r4;
> +
> +	r3 = READ_ONCE(*ctr);
> +	smp_mb();
> +	r4 = READ_ONCE(*seq);
> +}
> +
> +filter (0:r2 = 0)
> +exists (2:r3 = 1 /\ 2:r4 = 0)
> -- 
> 2.43.0

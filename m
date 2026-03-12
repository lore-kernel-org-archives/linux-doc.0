Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D9E521D00A
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 22:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773354681; cv=pass; b=WOBSAnhQDTHQoh8aho5Ze0jdEKZ4r3Uz30qLhKTaEl4VHqHBDsF2bI3+5cu/L0T+d78Yq6WJAE2GnB3qp4N6uSvZ2aQISKCKYQ5v4OilI4JDnWu1aoHHZOJdnh/k/q8cr5IjZwjDFO/r50+oN6wPHsZSMG0luoEUMZHNC/AgD8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773354681; c=relaxed/simple;
	bh=jIysDDa+z2vnCpZjDOfTgI4RhgB7fGnohz/dtG6w9Qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxoZJ+b1LTXbyp3uaQhV+Se8Ityflmc7hHy4mtjRjTWu/YZq2du4vqpxnIjaz7sOYuKklWs7yHNBZT4M2bTQksMJwUEFdI5jZ9E0pkpiiXdy3L8mAFBwZxYcIvVnmSDpyGM/yNI/GPGYeGsWGYWxI29a9nSVavokngNcaqkCoec=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=DdDsoHbQ; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="DdDsoHbQ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso1596564e87.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 15:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773354678; cv=none;
        d=google.com; s=arc-20240605;
        b=aOO67l809z5UwaK/Zx8n09Srjyj45rD8xUhnEy2g9f2FTIF3PgWxv7WfFA/rq5boDD
         M4/T3ylGxGOjwUBmOZN3cP6ILzIseSanAkQ21BMIPFfyrKfK1tttRAVjOoGfy4E4J0ng
         CX2fvUWfD+v640epxB3Z7Xy4ehAYI0PD7jwx+ASUYEfv9vLUJgmxag7RRj+pRDyPbvFd
         x6yO2Hl8v3HkvxNbEQqpM5jUg26B44nC9zq6xWfuZlVcygW/dyFBMr/ed2ydqZnLy2Jb
         MhDddBpZ068cxVUv5NpgQZdJbG/fcPcWcPntoPjr46OhD8sYYOd6YIpenzC32+W+0buS
         aWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MpQacvF+mAyXs6pqu3/eg9OImF2i4oKZdu4qdPo1RFg=;
        fh=u2HsVbZeqNM/se3Nv6/UQyfgzSORY1CxSo18K9DthFM=;
        b=dURaJpAyXbsOmHZ+crDw8yw5aXAHnCsfS3Y9DNSrUT+7ln7PjiGCWbyh0v2bPjjBaO
         aZyWOpOrJikrSAk4B0O8wWpScdJ+A8r9uDR7o/0JB0T1HPZyEc8zOkqtzpW/2MCdNeUP
         Ox/++/7MX+XNNWKf1SAmy6to7lLFyAOKXtPCuDmTEK+ylaGaueQwiGCODtTv3P2iDFUk
         9kpl+qgmEatFOToDJUfHEpkNmdujhuQE0BV1TpGaBHQs5hT61Sex8tjkvEfN3oC2pP0U
         +SI5q5O6GM14MTF1+/vkQ7i3bSd4icdutkW4ViMPNAedpMrjjnyTrsi0mTwujHFzRRo3
         gbHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1773354678; x=1773959478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MpQacvF+mAyXs6pqu3/eg9OImF2i4oKZdu4qdPo1RFg=;
        b=DdDsoHbQQpbbpq/aniI/yWh5R3J55sdzc7y2esgxiVMBisQV0mmbw7J4xD/vbx6mnA
         vZ8MpbdMgXHHlRXWTxBxL7+mrlGy7fqAIHEgqzgT3obuSy3vgGwsV0KKK6MeP3QFBQqX
         0ZPWU0FcDSs+SmnsWSVO1OISQfSdr4cJpvqEpszw+AtoZzw4bgqphM23E01clD8k7vFU
         QKRcIakSsMXB10ZpuLVugLShLtv/MSWXphLe7Kr2qvBL67NWdaYqLkPXM7ipPB96f8QW
         Lg2NHqumobwW9ZnPfCupHFpLNIb6ABk2sFwbLhNEImG8FSNaL6R6vv0XnAn+HiIFK9Hd
         netw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773354678; x=1773959478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MpQacvF+mAyXs6pqu3/eg9OImF2i4oKZdu4qdPo1RFg=;
        b=DeycCkWVYq8JUx4LVtYvnaDq80cxtb2GhstjqTdwzMv7sDcKmEB3YA4fgFwcrKjnzm
         5ThuF/kIJcekpLRMrFXert52GnM3a36hN/rKGXs/hTH9hVfFt7loeOoWKuXoy56ppBZG
         sAVsQgLRxdD1b1ZsI0DFoLD8ttDnJSw+pKbFirNBrsbD6KpNoLOiN30s5n97jX6J+8Uz
         LvDPrV6gkMMcirvS6wv7mlWecJQhEdDUSfQiQcGaXqUIbDnZLH1+1RAWsD1aKF+E9Cs2
         qsHdyXJsX2ybatUAOHmgx91qUzuGYMZRki6j5QCvcaPXCOjGyd/LJIuvmaflSGZrGjEz
         TnOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVbK4dsi0x62MOnIfN7FzBJHowQJcZEJFEFk37Y+ghpqZ+3To8kJ2mA3K4VXMrpt2UvHIUolqKwOs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoiPkgPs7gmyuD6by3X21bVkvK0K/y2Q21X+3s1JBqqo5huoUW
	XLilziBUCS8DypVtUvdUWnrSHYHYt4LXq5HSAVqMSqT5t0rS58okXcRBn7vZ4uYNq7aTjRRu8NI
	bc3oFsSR1oS+0+m5N5U/uxqI18CzP82zn8e5XDp70
X-Gm-Gg: ATEYQzzMMnSQnFs0UEs3wN+tEWEdQGkqfHDFes1AZ3R0XDgIxpCm1JoA0kekXW8+4aC
	SzklUx9vVnaaCpuF4wix1uZJ9iS/Aeb7/yMi50BJGNkCRzzKHI0NEzqSRbETeqVuBXbbMALfUCj
	7sVVmbQ1t9TRM3X3TxqCMTQrlZS11lXpiY9Fz+Mqfr6R8X8Yxg06pLeXTVGkzo8H7sgECUN0BmD
	/HyTuXkrJaVzG4tv0Rub2JwppHOXu44aL6YnsFnQV17cMuyzbqKryVM0ApbRYSiDeY/M+1rBXQE
	H6JqGQ==
X-Received: by 2002:a05:6512:3b99:b0:5a1:36ac:2ca9 with SMTP id
 2adb3069b0e04-5a162b2fd47mr388247e87.49.1773354678175; Thu, 12 Mar 2026
 15:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311194058.13860-1-panchamukhi@arista.com> <abKzWIhVz_SeiSOa@strlen.de>
In-Reply-To: <abKzWIhVz_SeiSOa@strlen.de>
From: Prasanna Panchamukhi <panchamukhi@arista.com>
Date: Thu, 12 Mar 2026 15:31:06 -0700
X-Gm-Features: AaiRm51ZlKY4h04uIgBgBAaeWon8_os3iwnwKSpFi3tkPhPpb-qpMihKuCf8Q-8
Message-ID: <CACqWiXD2_O32K4NhmNBZrAUG7U9-N93LTFjJHG6Tq=4vuafNuA@mail.gmail.com>
Subject: Re: [PATCH net-next] netfilter: conntrack: expose gc_scan_interval_max
 via sysctl
To: Florian Westphal <fw@strlen.de>
Cc: netfilter-devel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pablo Neira Ayuso <pablo@netfilter.org>, 
	Phil Sutter <phil@nwl.cc>, netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coreteam@netfilter.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 5:36=E2=80=AFAM Florian Westphal <fw@strlen.de> wro=
te:
>
> Prasanna S Panchamukhi <panchamukhi@arista.com> wrote:
> > The conntrack garbage collection worker uses an adaptive algorithm that
> > adjusts the scan interval based on the average timeout of tracked
> > entries.  The upper bound of this interval is hardcoded as
> > GC_SCAN_INTERVAL_MAX (60 seconds).
> >
> > Expose the upper bound as a new sysctl,
> > net.netfilter.nf_conntrack_gc_scan_interval_max, so it can be tuned at
> > runtime without rebuilding the kernel.  The default remains 60 seconds
> > to preserve existing behavior.  The sysctl is global and read-only in
> > non-init network namespaces, consistent with nf_conntrack_max and
> > nf_conntrack_buckets.
>
> This was proposed before, see:
>
> https://lore.kernel.org/netfilter-devel/aO-id5W6Tr7frdHN@strlen.de/
> https://lore.kernel.org/netfilter-devel/aRsuU57juCvsMBKE@strlen.de/
>
> I did not hear back wrt. the horizon cache.
>
> I'm not 100% opposed to this, but I do wonder if we really can't do
> better than the current avg strategy.

Hi Florian,

Our primary goal is to cap the maximum time taken by the GC to clean
up expired entries. We rely on user-space notifications to clean up
these entries from the hardware, so ensuring a predictable upper bound
is important for our use case.

Regarding the adaptive strategy, we are using this sysctl to address
environments where the current average-based calculation delays the
cleanup of short-lived entries.

Thanks,
Prasanna

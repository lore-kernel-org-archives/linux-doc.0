Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A736A379C2C
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 18:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780941695; cv=pass; b=DQCAP0WQfbulyasNwZKYvQBLfyHf0oPLRzk7kXP2Zb8TiObWaYrpTH5tYT8gagoAKYu6ijMMn9rhdvix6sGWDp604xWTL2J2wmy0BVKifhRo6LeVqU12OZyOCOg/KbtauoUmMXogUHd9/58IA1vwfL1sJXGxv9na4AYCqL9UJSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780941695; c=relaxed/simple;
	bh=6UoX/xydv0CvknQ1ef5QoOdvD3AYDMennvM/Sj2Oa9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hph9LWNofBddSGrBtoHmoHmJCP9Lx8hwEvPbODA4pFooXiX0Q2gzCwiGzv/K8jJ34zhyT83K1b0J6hnyPske5JdnCpSUOhgnufHBXvViUmy2Gcj5QBLjJpdvNt/G6TaaRknHPgL/60LBfDNzSHQt6EtuJcqfhe/DGMpjEfCHrkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fk0ahr35; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fk0ahr35"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so30749045e9.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 11:01:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780941693; cv=none;
        d=google.com; s=arc-20240605;
        b=eoQ7wEnyyZVo7IhkRFcPUkieHhsy8BysCt+BK70xO/o4fSJset6cQlhmoQvWrXubUy
         liKeiWio5JXA4vzMYRb4h7CmcnHaZOfQpMONZhgDS3rYnkOyt6RRIDCmDGyL8daRLjco
         cqmR4TM0X1VKC4bhUhR9WFI94IhWFD9GKlz5I/AdVjbjPZ7ZFuCJyxb7QyHRZJ6I2EEF
         r+171ELxu4fei+GPCn3ldDbDCjkDOt+NKAcc5mK9ZCBk4cRX55AGxl3Sp5thm5iweMQ0
         3RoTHEDJlBW3sPiWzmu5xBUesj+yS8TOrm5475+3zytbJRNdHzsJkirhPQiIIUbtRAPh
         /O5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6UoX/xydv0CvknQ1ef5QoOdvD3AYDMennvM/Sj2Oa9g=;
        fh=FsrZ0wDODiIPlQwlKKV9JnLcFWaIn/09S0VaFZwb2b8=;
        b=E9WVB91eAFuIwgDlCjxu+goIXmgYbtyhUiJO0STzgHSQmkIdjCLVv940D2bFH2wPsZ
         xrNYZbWxfFU9ZAm82gx/7gdrBMHG/hiFBlTmrBtVR2XlLf/aJlDdBOrKbBLw8WejN3Dx
         dGWPsGlZAFCc0cX3LBthLD0/s0EtvZTCE+IIUq1sjphB1I/tBCDAF8nPGoL0stf2sJBD
         Y6ica8N3NpfUQpedBgwUqxJ0wXgPTol2cM8+Nb28NKvbFu5Ry97XFDrBIEc1AKEESn8j
         odWiTjfOHFygSOSDZAItvUBlsB/v3ibyc9cPDGW1JTCZB3mhqyFLJGMGEBS5xyVGJIyo
         hgQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780941693; x=1781546493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UoX/xydv0CvknQ1ef5QoOdvD3AYDMennvM/Sj2Oa9g=;
        b=fk0ahr35tn3rDFFqPzRXgc6PPWq14Da4OJHXGcEtq95yP+GItSDqGSqI8gaQYja5bt
         MjdRMJYN5IbHGBZDOp65Lb6rF/zN6vbF5hICtcdoh4w8UGpw1N3KyPduuWc1cIeBAZsy
         H6Vmn0yf5vJAFeSkbkoJ+gIsn00S2QgWUkZhgHNQXxT8mlrvzmreULFW7LkN5AEfi+nj
         GEWIlmVQjqAr1uYFMQoh0bkpc/7dp0NfRMlNtsgFB5NtZxAoHeOvZEkRkE3LyJO8C+Ku
         Safmj14ff5R3ee/tcUnSZesN+aWlivVUkUa/aHOKKZfihUq7y/nqGqjvzaFjWTY+v11+
         vI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780941693; x=1781546493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6UoX/xydv0CvknQ1ef5QoOdvD3AYDMennvM/Sj2Oa9g=;
        b=tMLWjvTM26Fs0dqMxSyVVsbdhX9SmQVRBdxIA3omubBa6MA+dQNjgxzuID+z71jsEP
         uD6PvNVZPSevqvsyWJmITf/ABTG5T47ZNkTgpGcA51o9AtAVHWE3/zuB4+B2ypu8ReDg
         y+848luGzMv8OlHBtO2iPeTn0a1MvFEv7dpPFXw/SnUMPa4X2KJiB6+2i0TsRqyGBmG7
         4SgnBcHGZwYFsL2viaCm9Ujj0v0YH5T+VLyM4C5liOhmyPKKfvUgHWuuQzJYglbmg71R
         pvgZ3wMw/esAMgB3FRiLJyZmsOIYjWJ9vM1R1ymV253m4YZPKlUZF5/mCBpyElcKDFQe
         bpig==
X-Forwarded-Encrypted: i=1; AFNElJ9JmxAxFhiT4WH9hGZ0LcNT5G/jmmTgShZa9CRNFKm74O3+3PdJiOtDZBZN2wouYdo6QDxee0Ko7EE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpmJ4DvtaHRvuHx8Vg/hC9AdMQzte1U1Jw5NprP1eZbSdOOOfl
	gnR0sQx5JqFyz+7IZVB2FaS6q/qTf1Ig27sl/6BoWHCHY+UppV47A32JQ1ixU30aSW1ygfIYHyz
	h5Hew4l9p2VPe5JpLk2Kaf3Rm1IKuXaA=
X-Gm-Gg: Acq92OGKY4KYDUJPXWZK7PD1Z2Q/tmLjSb++W2uAW8NNZdUTonMpDRTzbptRwED/yc6
	N9VUG+q2EuIyXnGBBHAJ8WjRS8wcD/TxJWdgu9mLrA2TyQgTSneqx5OWJjRRdh4Mu8neRhWM0+4
	v4lw9eLjhpvuhevW73cx4IVcrzG/j8XkGXKWAIxWLBHqdeQKQAT1nCBHHS7oKnZm08OZQFlO7ka
	4o2QfVN3g/Copq6zjYrvcc4kyIGCPpQ+2qqaBNTTMGT1nQnUEKkx+LOCFUZfpz2bC47oBvCl2vn
	prMme9UF50Ab/nTQ9JcNUJ0l7cD406RKBZwQGne7bz+dBUdygA==
X-Received: by 2002:a05:600c:190b:b0:490:9804:afdc with SMTP id
 5b1f17b1804b1-490c25ff35dmr290599385e9.23.1780941692853; Mon, 08 Jun 2026
 11:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com> <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com> <ah4ZZGl7GYJf54Wz@google.com>
 <ff344c9f-51da-8b3a-e7a9-c4a7f4702ef8@gmail.com> <ah9i3uhh3PFiS0Uk@google.com>
 <c7870fe2-3588-79db-cbfb-bd6a2b78f594@gmail.com> <aiBpibRNi0BcM1Zu@google.com>
 <9898f83d-fae9-e284-6b85-c7f4089840a0@gmail.com> <CAO9r8zPBH6-0SQ6-_ZOhTQeyu=rz4F=ugikCrU-JR_skm6fEWA@mail.gmail.com>
 <a60eedb6-f3fd-4092-b726-04a17a695ace@gmail.com> <CAKEwX=MQ3xXBAY-2H8vA+XSX5GHNBubJ2GCYAXGD+Hra++ZM7A@mail.gmail.com>
 <90730fa7-62e7-d5f4-b638-23b22a8509f2@gmail.com> <CAKEwX=PF9hfERC_QMq+rjkSc-BsJyawMgTe+EhwR_86HiQKm=Q@mail.gmail.com>
 <CAO9r8zN6VVZz7dpjNrh8n7wbLkqcrsROPm70MQQxO49HJSmMFw@mail.gmail.com>
In-Reply-To: <CAO9r8zN6VVZz7dpjNrh8n7wbLkqcrsROPm70MQQxO49HJSmMFw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 8 Jun 2026 11:01:21 -0700
X-Gm-Features: AVVi8CfPM9EinXbnTowRrF8hGIP3rew15f95GiBStV7nPCFnW8PfDTRssPsRAOY
Message-ID: <CAKEwX=MCFbsh9ndBtR0-bGRr_=v-6bBwTo=muzd9ZSD-LAK1nQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
To: Yosry Ahmed <yosry@kernel.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 9:48=E2=80=AFAM Yosry Ahmed <yosry@kernel.org> wrote=
:
>
> > But OTOH, this does seem like a recipe for inefficient reclaim. We
> > might exhaust hotter memory of a cgroup while sparing colder memory of
> > another cgroup... But maybe if they're all cold anyway, then who
> > cares, and eventually you'll get to the cold stuff of other child?
>
> Forgot to respond to this part, the unfairness is limited to the batch
> size per-invocation, so it should be fine as long as you don't divide
> the amount over 100 iterations for some reason. Also yes, all memory
> in zswap is cold, the relative coldness is not that important (e.g.
> compared to relative coldness during reclaim).

Ok then yeah, I think we should shelve per-memcg cursor for the next
version. Down the line, if we have more data that unfairness is an
issue, we can always fix it. One step at a time :)

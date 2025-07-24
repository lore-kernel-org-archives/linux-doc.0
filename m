Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ADC2CA8
	for <linux-doc@vger.kernel.org>; Thu, 24 Jul 2025 00:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753317490; cv=none; b=DbMpxoOTvZIEBD1ZmvMYJWF2EyOVYDmV1aW/wLZGZYPK5FNnPg8nzokDOdlmj5W49IUcFwru2KJJoohHXcpA0bKIzcKk8g+xxSEyuoeTJBq72QFcBGDCxr0RbLOTg27obHDeYoBElSsyQuDB6HD4VG42CwExlzaGqU5SINw7B1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753317490; c=relaxed/simple;
	bh=Gxi4m+vj/J+R8ohyx/BksdJ9xrrB6h7LidiD3KtpEUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SKzQa79AY8c8W/ndkESjY22XGBX4DUP7ElMk7nUklfGIc2jfP31QYSCKRGgwe77UTa2ui4TYH/IRQ2VHxRVLrzoGuOtj0G/wnzFr8AxiCSBva62cUbPt3rVTgupDR7Psvk8g+1QsQFYpDE/Ta8aDv88cmYYAvPgegUp3xUw9MTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Wc+gaWEN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Wc+gaWEN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313067339e9so67825a91.2
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 17:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1753317488; x=1753922288; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVzlr0W1TivM5rykoDGW/szIU5hwSlOTrrmV8HajOPk=;
        b=Wc+gaWEN4RZ49G3K2lcJLue4m1dnaY1dWbplrBWrbyVO61XsB3bkHpxnaKG3Id5UQH
         xqABBM+JGkJh8tCIPO7DkGbbgh+zfnwsnKk21H1M6opK7TChLg21guNIhNDpAnxdDEIp
         prIzTkD6IR7hHimrUoYwTPd+3ZUPsqGcCDDHFMcFXgeYq1UN03XzAFdbIPznLX4g545n
         XJraLlWOPKhesYU1di3FWUbV6ClAYQuaZM3mZZ5UDRPY+PvycbDzwaTtB2r5GLSo8ES7
         PbXWjk/Li0GhGnmPNq62IfHA9sPPMBp/pOHoPEjNRuOCAlXclXtaFKISSAcFA5a8APx6
         uTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753317488; x=1753922288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVzlr0W1TivM5rykoDGW/szIU5hwSlOTrrmV8HajOPk=;
        b=IKO5bfeGxYDk7yhuDW6CZk/Z2yLIlZzNoprRSd3u1SNafsIiNnS41N5x6LHIXAEbKn
         9zUsPB+vrqIdPAFiunAupteiy644fXgGQGvuwHGz95isHixuxvdAeEImRL/lg4ge332s
         PEQchJqOUcUvjRmThVuScpRPLBKS681P3akCN9h9/0ALOc7w6L768DPfFsD4nJ094M1Q
         cJymNYf+dcSg+R634Do7v/AV/tngh6bKA1vJ6/UHJM5MeYQ++P9l3JXt1QoQ43thLy94
         AijtONlCcl29DkT5LXGXGlSwrc1zJQHfhj1wIvOxGOyLmrmfJVXjYJl3ZYO+LNYYhi3r
         POBA==
X-Forwarded-Encrypted: i=1; AJvYcCWyRcpO86LOKcIYvD45Ur+fMcQ8HV59Ah74ZOblhT8Lf3IgEsvLApeVIx1vwzqL7EyZmjUTMk//JxE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1t4mz1ciLaHkfpH9I8c3JVEaJkHmUPz6tAHVpiGPBRoS900Vs
	mXIc9cSepdh79OBqPo4lmG8MmKmzi+A3j4sg+JRd417SbfjJzfjfCBeCOGkkYoIEpbvnyA8VNrM
	b/UbbXeeFITWYRjud2U/QOQwW0L3HMvHslwFyTDdWUw==
X-Gm-Gg: ASbGncuypSnQ1q3zf5YwE5mFHvRFrtj/41Lm75KY/O6t1BxsOQELJCQDS4Dyf+vr9v3
	yiitXeMGPyawr+e0O5P82/w0FessCcCzU92h+Wo41Kwfiaj8LMiaEIH+IFtD82y+TqT9lULp2e7
	GyI9/LgOpph6LehwR/lW+ImsLmf1t4qKEahEILHjhxTXAvNS5LkNYShPfdUkmVRX19eOqfzPw3Y
	Vm2Y8IpdrwLDeO2kDM=
X-Google-Smtp-Source: AGHT+IH4VTNJrurz6Qk0XlK+5MoFyD1kgLcpcng5VkI23KoPcgTNi8H+hvLg2MhXAytRFMo4TVGnDbgexwbZuZL+CIo=
X-Received: by 2002:a17:90b:4b52:b0:311:c5d9:2c8b with SMTP id
 98e67ed59e1d1-31e5082c398mr3391035a91.5.1753317487789; Wed, 23 Jul 2025
 17:38:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711002322.1303421-1-cachen@purestorage.com>
 <CALCePG3a6wG+3Nu7-JHha+LMtyRRNF3sXp13sS-=Xv1pvsX09Q@mail.gmail.com> <2272d95.4512.197f7b1354f.Coremail.00107082@163.com>
In-Reply-To: <2272d95.4512.197f7b1354f.Coremail.00107082@163.com>
From: Casey Chen <cachen@purestorage.com>
Date: Wed, 23 Jul 2025 17:37:56 -0700
X-Gm-Features: Ac12FXz6YP-uwsEzBgKW14HU9FxDMDgMIWxUuN9SFGhPeADgC7PX8sOXbrv3-gw
Message-ID: <CALCePG0Q8vAEzP+5ASzY-ytnN_eph8F=-F3MQya5MaYcwMNMBg@mail.gmail.com>
Subject: Re: [PATCH v3] alloc_tag: add per-NUMA node stats
To: David Wang <00107082@163.com>
Cc: akpm@linux-foundation.org, surenb@google.com, kent.overstreet@linux.dev, 
	corbet@lwn.net, dennis@kernel.org, tj@kernel.org, cl@gentwo.org, 
	vbabka@suse.cz, mhocko@suse.com, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, rientjes@google.com, roman.gushchin@linux.dev, 
	harry.yoo@oracle.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, yzhong@purestorage.com, souravpanda@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks David.
The calling site doesn't detect NUMA imbalance by itself. We know its
imbalance from per-NUMA stats. I would think a software developer
makes global memory scheme based on information provided by per-NUMA
stats. For example, the system has several major consumers of memory,
most of them request memory from NUMA node 0, leading to imbalance. By
detecting the imbalance, we let some of them request memory from NUMA
node 1, by hard-coding.

"What if the numa nodes usage are almost balanced globally, but
strangely unbalance locally for some calling site."
I didn't see such an issue so I have no idea about this.

I wonder if Sourav Panda or David Rientjes could provide us with some
examples. Thanks

On Thu, Jul 10, 2025 at 9:16=E2=80=AFPM David Wang <00107082@163.com> wrote=
:
>
>
> At 2025-07-11 08:42:05, "Casey Chen" <cachen@purestorage.com> wrote:
> >Hi All,
> >
> >Thanks for reviewing my previous patches. I am replying some comments
> >in our previous discussion
> >https://lore.kernel.org/all/CAJuCfpHhSUhxer-6MP3503w6520YLfgBTGp7Q9Qm9kg=
N4TNsfw@mail.gmail.com/T/#u
> >
> >Most people care about the motivations and usages of this feature.
> >Internally, we used to have systems having asymmetric memory to NUMA
> >nodes. Node 0 uses a lot of memory but node 1 is pretty empty.
> >Requests to allocate memory on node 0 always fail. With this patch, we
> >can find the imbalance and optimize the memory usage. Also, David
> >Rientjes and Sourav Panda provide their scenarios in which this patch
> >would be very useful. It is easy to turn on an off so I think it is
> >nice to have, enabling more scenarios in the future.
> >
> >Andrew / Kent,
> >* I agree with Kent on using for_each_possible_cpu rather than
> >for_each_online_cpu, considering CPU online/offline.
> >* When failing to allocate counters for in-kernel alloc_tag, panic()
> >is better than WARN(), eventually the kernel would panic at invalid
> >memory access.
> >* percpu stats would bloat data structures quite a bit.
> >
> >David Wang,
> >I don't really understand what is 'granularity of calling sites'. If
> >NUMA imbalance is found, the calling site could request memory
> >allocation from different nodes. Other factors can affect NUMA
> >balance, those information can be implemented in a different patch.
>
> I think my concern mostly due to my lack of knowledge and experience of N=
UMA,
> but I still wondering what action to take when " the calling site could r=
equest memory
> allocation from different nodes", does the calling site needs to detect n=
uma unbalance at runtime
>  or it should change to hard coded numa node?
>
> By 'granularity of calling sites', i meant to emphasize that information =
is local per calling site,
> not global.  What if the numa nodes usage are almost balanced globally, b=
ut strangely unbalance locally for some calling site.
>
> "what adjustment the calling site would make to solve numa unbalance" is =
the *big* question to me
>
> Thanks
> David
>
> >
> >Thanks,
> >Casey
> >

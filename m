Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB71EB2F
	for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 17:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721150462; cv=none; b=TTFKAao6qQ1arGMeURgzf8D5flMsk6XhLQLMsp//FSCWIJF4Qfr3S7QJ5E1DYFa8PAWKNJsbG9nLExzLq0dLUggQ7CRkXGsGLvs3QnZaanUGoFht2dMFc/NBhkaM2MWMI45vSzxkDjv45EAmrVMEIdVkDrOJpeTdLOsrZ/HJvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721150462; c=relaxed/simple;
	bh=1sv+QNc/DGMhPMVsZ2FxSdhckTqknm0RzzQv130owTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F+sigpksnGV6xV7moosC8u7ySyPTXHVqAerq+oZUBBqfziISCIBYoDN83C47nlCxka3+dKdk4zI7uq6ud930JPywDKd+yErwUJRkhXLZHWr4HKQggaMxjjLwpiYFC0CI9IS/Fpr9cyi24XPSTLLORHW2YOHDmxNqSMTzgQdAZec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=PPx/N/dl; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="PPx/N/dl"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-6bce380eb9bso3215532a12.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 10:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1721150460; x=1721755260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sv+QNc/DGMhPMVsZ2FxSdhckTqknm0RzzQv130owTc=;
        b=PPx/N/dl4nc/iPKwhzJnMr8F7jmHQU2IeCfojlCZ4plhnHeqePoMjId55lRYLL8+AK
         fFcmA++DEiWyXhXpVV4EL3gRhVwRO5RnmO1FfTPd5YV/0yOM5/HZLRt/F2pkPGMDld8B
         ex6YqAVPEdFBiz84S83pNu0GAQM66dXD2THG8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721150460; x=1721755260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1sv+QNc/DGMhPMVsZ2FxSdhckTqknm0RzzQv130owTc=;
        b=RZWgKnbuJezGavnUdbzYezpBkmtWuZCH+7FSvyVvzEou2G8Ckx7itKSa/eIQneEidI
         6f+Ntw/ChFLbR8YwL+jHRgjCAUsj/Aw4CVbZKk4TFFAhRu3ZG9TSocXU42MHUfh8+NIW
         dg/kTQA/yEfxfw7cRBr7CGTtGhlmvKS3H+IMYeNmCao/Ojvcrswa8TvzX5q0Y2k3qJTx
         D5FzocuFD8neTI9cAH2DFjlKNcc9fBrxffHD1+oEwYiKwHCW7J++L9nqh5bmv8lfQP2b
         PtkhXuq0JzxM3+EbBJbYTdFybyQ1UT3ZbrsZXexrolL65oiDB4qi+KOJCuGzubk2fceM
         u8nw==
X-Forwarded-Encrypted: i=1; AJvYcCVlvu56RnJy5alINjwXr6sexVd9gpazOPBQVo294nXTPRK1P+mWOFmF5ZXs6A1Jy04GZnEF9GcbsK4ayz+Wlp5cHPj5XaZgvROm
X-Gm-Message-State: AOJu0Yz2MZmPW3XRAiS/QX/I6iM4niEEqIf5G5LrjNF8GRHka3cFCN8g
	q2+nPQsvaVx10pFd90cWkhqCflvZsKbO/P0KCUk/acwXaIdjv9kS0HlQnIvCa73e7yD8xMuf6zP
	Jx6Y5RDlkfjcoi+NTJbCE/v56P89bXp27xi0+r3xxPSt52tvtBdo=
X-Google-Smtp-Source: AGHT+IE0jogasMR5Vo1zc09nO8WrQEH9BAm8Vis6rzWXoOwDzxBtbsrDWTNwvTcelBY4lZmxg6D9GIcINCHKQHMTUNA=
X-Received: by 2002:a05:6a20:430b:b0:1c0:f594:198c with SMTP id
 adf61e73a8af0-1c3f11f7552mr3997701637.11.1721150460103; Tue, 16 Jul 2024
 10:21:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240715203625.1462309-1-davidf@vimeo.com> <20240715203625.1462309-2-davidf@vimeo.com>
 <ZpZ6IZL482XZT1fU@tiehlicka> <ZpajW9BKCFcCCTr-@slm.duckdns.org> <ZpanW41dQ8DimbA3@google.com>
In-Reply-To: <ZpanW41dQ8DimbA3@google.com>
From: David Finkel <davidf@vimeo.com>
Date: Tue, 16 Jul 2024 13:20:48 -0400
Message-ID: <CAFUnj5PeQ-FefK+ja0BtwHZFF0QyJdN9imZQESOj+tRjHSmvow@mail.gmail.com>
Subject: Re: [PATCH] mm, memcg: cg2 memory{.swap,}.peak write handlers
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Michal Hocko <mhocko@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, core-services@vimeo.com, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Zefan Li <lizefan.x@bytedance.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, Shakeel Butt <shakeel.butt@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 1:01=E2=80=AFPM Roman Gushchin <roman.gushchin@linu=
x.dev> wrote:
>
> On Tue, Jul 16, 2024 at 06:44:11AM -1000, Tejun Heo wrote:
> > Hello,
> >
> > On Tue, Jul 16, 2024 at 03:48:17PM +0200, Michal Hocko wrote:
> > ...
> >
> > The removal of resets was intentional. The problem was that it wasn't c=
lear
> > who owned those counters and there's no way of telling who reset what w=
hen.
> > It was easy to accidentally end up with multiple entities that think th=
ey
> > can get timed measurement by resetting.
> >
> > So, in general, I don't think this is a great idea. There are shortcomi=
ngs
> > to how memory.peak behaves in that its meaningfulness quickly declines =
over
> > time. This is expected and the rationale behind adding memory.peak, IIR=
C,
> > was that it was difficult to tell the memory usage of a short-lived cgr=
oup.
> >
> > If we want to allow peak measurement of time periods, I wonder whether =
we
> > could do something similar to pressure triggers - ie. let users registe=
r
> > watchers so that each user can define their own watch periods. This is =
more
> > involved but more useful and less error-inducing than adding reset to a
> > single counter.
>
> It's definitely a better user interface and I totally agree with you rega=
rding
> the shortcomings of the proposed interface with a global reset. But if yo=
u let
> users to register a (potentially large) number of watchers, it might be q=
uite
> bad for the overall performance, isn't it? To mitigate it, we'll need to =
reduce
> the accuracy of peak values. And then the question is why not just poll i=
t
> periodically from userspace?

FWIW, as a stop-gap, we did implement periodic polling from userspace for
the system that motivated this change, but that is unlikely to catch
memory-usage
spikes that have shorter timescales than the polling interval. For
now, we're keeping
it on cgroups v1, but that's looking like a long-term untenable position.


Thanks,


--=20
David Finkel
Senior Principal Software Engineer, Core Services

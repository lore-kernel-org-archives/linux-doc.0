Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBC61B7E2
	for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 20:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707942665; cv=none; b=W3O1Z41g+O/beZJDsnvtoVUw5+rvgCsxIh9RUYjF8oL0HU7e2Vtppn1rh9tHDLIYoAiRWaJH+RQ18fejcKg71b3/cLA/K9OjiBKSVl7uTdsHI+ha09CQOk/VooFtwx9oRqBhDLwCJqf6q8LdleV/l58Qp5WpyF92uPOnj4cRdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707942665; c=relaxed/simple;
	bh=Vd0j1FX9Ch3W6HoLjw5jsyZYk+r6JPnPHoqpsjH65ZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QrobwqNGW1435jvJFVaeWq36AhFhptfdN1OH1GYK9Azabe3cAJBNKWBumPGZRkVDiXssd4OjK43S1FHOXFYJIVyI+WBDMF7xB21vvu9aZqyBf3Uholf3oQSIYUWNoFWwQtOj+C3PA2Y3m3XCXxXlzedim3F3SACdYaHt5J4/W+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e4v7JGa7; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e4v7JGa7"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc745927098so63342276.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Feb 2024 12:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707942662; x=1708547462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcEj/SyVb+AY5aiDL6vEY+YAlLL1EeaxcCrjK4Q+5oY=;
        b=e4v7JGa7cWYIZNAW0huk/3rwOI/kwWdnUfrxj+106qY9WYGnNPyqqU+s/GPTR66aYq
         E6Z9CoturLO7WL9zR8anrnxQ1tb+X+eCL/0xXobCI1PZu988h9jXDuQTqjlbLLhKlZjJ
         l/Cqu8qc/n297fQbIV4Ppz5rL240ZYKpmBE2mnjVkY7hK06kO+MoKsA0DD5SlnFxEpPW
         lTYSBU/elbShzB86eaf1oNF1Zo/wl1EYTb90LOaZ7ulyXM1m0BUsR58hYhdeRibgMo0I
         vIHn30dBEWG2tg1H+Av6fegtFpmgrihEA1yRuOTVjHYV64g7odZ1JazgkMmJJb7cgpvH
         xsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707942662; x=1708547462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcEj/SyVb+AY5aiDL6vEY+YAlLL1EeaxcCrjK4Q+5oY=;
        b=FiHb8cu9ug9us0qpWIn38hjwwxGqha/zJRBh2SpPbZUWUnR5rubhg5Xe/pms7QtrMi
         bYBy51B0uU8xNxXZEz8PZwr//VoLoURa8up03T+l4PNah/KkhhSpBSxqaRLeaTqO1LNG
         9QMI+TEOy2LYOaTZXamsQucmNuiIHAbeoOGfw697aASO2ZQHS8dYr97riehGsp43YOLo
         FII4WbZy/R0u14eydXMIXe6iGioah7ouGW58uh6hrA0c0Gxwk/aw78Mh0VYFvRgcBppS
         sLkO4jnk93rp35ruVuPyrGB3hxGDDPQiKL9Z0lSyvezSqa27qSQUql1qanSr09Ih8QuD
         TNmA==
X-Forwarded-Encrypted: i=1; AJvYcCUzEXiyAeWlK5enFefrhQjPdPX0r/rsxtL+hnXMn7RFHLYoraAE3qvtbt0BqefFkZsHMiHgx/l9j13LdfjyPXIMSWAh53k86WFS
X-Gm-Message-State: AOJu0YxJUfc00YLuaInAJ1MGgxzXESZQE0HPBquPQNe2ipSEyMQ7X9If
	w46HIW6GVaSO0rCviHtyhlgeSLMt4JAYXlU/osDR0zq3xXHZkWX53G+qx96620cCqr/SZ5g4GAD
	1KOTfU1FXvqS2zBTMxtzrh+tZK6OJYIBnEMdF
X-Google-Smtp-Source: AGHT+IFqoJj5aCwpmg00G6ZaLb2aiZ8b3im8fm6yEl4ijg46+lI254clzZhzLZ0Iv0kb6bhFH6lVLC2hnoLSZAsSoRU=
X-Received: by 2002:a25:4115:0:b0:dc6:bbeb:d889 with SMTP id
 o21-20020a254115000000b00dc6bbebd889mr3283052yba.52.1707942662262; Wed, 14
 Feb 2024 12:31:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240212213922.783301-1-surenb@google.com> <4f24986587b53be3f9ece187a3105774eb27c12f.camel@linux.intel.com>
 <CAJuCfpGnnsMFu-2i6-d=n1N89Z3cByN4N1txpTv+vcWSBrC2eg@mail.gmail.com> <Zc0f7u5yCq-Iwh3A@google.com>
In-Reply-To: <Zc0f7u5yCq-Iwh3A@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 14 Feb 2024 12:30:49 -0800
Message-ID: <CAJuCfpEbdC4k=4aeEO=YfX2tZhkdOVaehAv9Ts7S42B_bmm=Ow@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
To: Yosry Ahmed <yosryahmed@google.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yuzhao@google.com, dhowells@redhat.com, hughd@google.com, 
	andreyknvl@gmail.com, keescook@chromium.org, ndesaulniers@google.com, 
	vvvvvv@google.com, gregkh@linuxfoundation.org, ebiggers@google.com, 
	ytcoode@gmail.com, vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com, 
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org, iamjoonsoo.kim@lge.com, 
	42.hyeyoo@gmail.com, glider@google.com, elver@google.com, dvyukov@google.com, 
	shakeelb@google.com, songmuchun@bytedance.com, jbaron@akamai.com, 
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 12:17=E2=80=AFPM Yosry Ahmed <yosryahmed@google.com=
> wrote:
>
> > > > Performance overhead:
> > > > To evaluate performance we implemented an in-kernel test executing
> > > > multiple get_free_page/free_page and kmalloc/kfree calls with alloc=
ation
> > > > sizes growing from 8 to 240 bytes with CPU frequency set to max and=
 CPU
> > > > affinity set to a specific CPU to minimize the noise. Below are res=
ults
> > > > from running the test on Ubuntu 22.04.2 LTS with 6.8.0-rc1 kernel o=
n
> > > > 56 core Intel Xeon:
> > > >
> > > >                         kmalloc                 pgalloc
> > > > (1 baseline)            6.764s                  16.902s
> > > > (2 default disabled)    6.793s (+0.43%)         17.007s (+0.62%)
> > > > (3 default enabled)     7.197s (+6.40%)         23.666s (+40.02%)
> > > > (4 runtime enabled)     7.405s (+9.48%)         23.901s (+41.41%)
> > > > (5 memcg)               13.388s (+97.94%)       48.460s (+186.71%)
> >
> > (6 default disabled+memcg)    13.332s (+97.10%)         48.105s (+184.6=
1%)
> > (7 default enabled+memcg)     13.446s (+98.78%)       54.963s (+225.18%=
)
>
> I think these numbers are very interesting for folks that already use
> memcg. Specifically, the difference between 6 & 7, which seems to be
> ~0.85% and ~14.25%. IIUC, this means that the extra overhead is
> relatively much lower if someone is already using memcgs.

Well, yes, percentage-wise it's much lower. If you look at the
absolute difference between 6 & 7 vs 2 & 3, it's quite close.

>
> >
> > (6) shows a bit better performance than (5) but it's probably noise. I
> > would expect them to be roughly the same. Hope this helps.
> >
> > > >
> > >
> > >

Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D415DBBC
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 17:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709142666; cv=none; b=T282468oMRnDaPRcteUV+Cbm0ZLvaZCSt6zBFlxJp4i5c/p0KDWxfBG//ypd3+n4WF7WMTHMJBhcrVW5VAAj/a8m5o8rk6UXhu0aj6KBC5x467S4jJVkdhhXRMckfEkzDwnhC3S3QpiuhXtv27KI4HdDlajzCbKzxnrSfq5+xO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709142666; c=relaxed/simple;
	bh=Kjp9e87qYUvuVJ7M2OXAg9wWZf/QwADaOftlAlqHnSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqlHkcVDZsuytm1C0q2MLRvh+NcIaM0pilMZN27SNCcZgsAnExPYZc00/fxmD6dLhQI2MYp3EKWLUiiqpgtreaMeSYukSFUdTwUSnhCG5nhzYnQQVXMj5qgWZ4fxkBpJxsj57q0dNNK+jE6ZNolr/CE/Z2uYp9GtCAHhM8SPd/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AGtlO26T; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AGtlO26T"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-60925c4235eso52197b3.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 09:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709142662; x=1709747462; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnQ/ab/JPnAloJ9klQyh8nICmNuzmA4WCeR9lmsJM4M=;
        b=AGtlO26T+doUb5WQH6HpuNAonMJHI1VctQ6KnGaUDOiepgfP1rGunEp2EG/fAzIzgt
         2jIqPjRYCt79wlj1VIm88MH5ngDdryRQHoOSIW2yXrvW1+SEYeglvKzZTlJ6Zf3g/NR7
         uajrrj2JBMIzyvm4bcgTu6gTY4LlDUQLRpGFp6MlqBhwozTTw/lZe9bQDIwrGKZkUtgn
         hPfl50UdRGiSn7mkOc+n1IoWaEdBdeo8HszJPN0zZK0RacuYwh86fvoEl2VZa9Ghun5O
         Eyu7Yuo/iy5/V3RQoVduxsSei9kZcZMcu1t7C8S+2OXNwWpAE5Z+mfaF2ZnbZCtJATm6
         590w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709142662; x=1709747462;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnQ/ab/JPnAloJ9klQyh8nICmNuzmA4WCeR9lmsJM4M=;
        b=Kigk3YVvmmZpxjiZIr0CZkgMRDFUqwfnsnYVIYSxJWcZjZjeaDkHOw+NHeluQn9jS1
         1XG9kEntl82smH7BNeBWzPXIXBWCQz2MTeYuLyScNjsWFcznaeNMEo3ieaJae6YQ7AeO
         S77uWDj9H6UvFIxRC6skUaSmniHq7lQ1sl5iDqW2Enu6KwBNuIUBrBBRg/uiXVCWHNPc
         BNa4rucujzFwmu3YxkWiD7UDxUHvJDKpyX7Uqlm6IBUNm+wCqls7AWpf2uvsb5Bv25Y9
         VEfr9mhJRx5Fr7pc+EZ+70hlnVoCK6i1q/wchGAbK9WEeFq/KaKmKLXFQ9HfNZJzm4h7
         3NFw==
X-Forwarded-Encrypted: i=1; AJvYcCUuD8+y2H086vpght0571zTZd1nP+eyvG2mjS27cbJtHb28B8tc4TVcfF50JeRWnqqTz1dYSEmPubCkCQw5/lcjfBAtZIFb5chU
X-Gm-Message-State: AOJu0Yzgf9NoM3E74jO6m0qxe7Mtx4wfbcaPdte7fceNuKsFIbRt2QPL
	/XJjHtA2m2+nH/DzOkdppny9O98ZmQHVvx2cycfB5CklDDNCVTR9jlsLQR6+W0IcXsgedXBWJt4
	71KcfP2jYf3p+Mc7jh2N74VqVwJzSa7fbjBvw
X-Google-Smtp-Source: AGHT+IG/EeCjxcbMnwV3xlMkTlCAxh5CrdaPO3GQcKcWzYKjyw1uLk52luOW0XOEQwoUYKADdxDUo6eSBLFJyH16/wI=
X-Received: by 2002:a25:9c08:0:b0:dcb:bff0:72b with SMTP id
 c8-20020a259c08000000b00dcbbff0072bmr3550ybo.31.1709142661963; Wed, 28 Feb
 2024 09:51:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-20-surenb@google.com>
 <2daf5f5a-401a-4ef7-8193-6dca4c064ea0@suse.cz> <CAJuCfpGt+zfFzfLSXEjeTo79gw2Be-UWBcJq=eL1qAnPf9PaiA@mail.gmail.com>
 <6db0f0c8-81cb-4d04-9560-ba73d63db4b8@suse.cz>
In-Reply-To: <6db0f0c8-81cb-4d04-9560-ba73d63db4b8@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 28 Feb 2024 17:50:50 +0000
Message-ID: <CAJuCfpEgh1OiYNE_uKG-BqW2x97sOL9+AaTX4Jct3=WHzAv+kg@mail.gmail.com>
Subject: Re: [PATCH v4 19/36] mm: create new codetag references during page splitting
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:47=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> w=
rote:
>
> On 2/27/24 17:38, Suren Baghdasaryan wrote:
> > On Tue, Feb 27, 2024 at 2:10=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz=
> wrote:
> >>
> >> On 2/21/24 20:40, Suren Baghdasaryan wrote:
> >> > When a high-order page is split into smaller ones, each newly split
> >> > page should get its codetag. The original codetag is reused for thes=
e
> >> > pages but it's recorded as 0-byte allocation because original codeta=
g
> >> > already accounts for the original high-order allocated page.
> >>
> >> This was v3 but then you refactored (for the better) so the commit log
> >> could reflect it?
> >
> > Yes, technically mechnism didn't change but I should word it better.
> > Smth like this:
> >
> > When a high-order page is split into smaller ones, each newly split
> > page should get its codetag. After the split each split page will be
> > referencing the original codetag. The codetag's "bytes" counter
> > remains the same because the amount of allocated memory has not
> > changed, however the "calls" counter gets increased to keep the
> > counter correct when these individual pages get freed.
>
> Great, thanks.
> The concern with __free_pages() is not really related to splitting, so fo=
r
> this patch:
>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
>
> >
> >>
> >> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >>
> >> I was going to R-b, but now I recalled the trickiness of
> >> __free_pages() for non-compound pages if it loses the race to a
> >> speculative reference. Will the codetag handling work fine there?
> >
> > I think so. Each non-compoud page has its individual reference to its
> > codetag and will decrement it whenever the page is freed. IIUC the
> > logic in  __free_pages(), when it loses race to a speculative
> > reference it will free all pages except for the first one and the
>
> The "tail" pages of this non-compound high-order page will AFAICS not hav=
e
> code tags assigned, so alloc_tag_sub() will be a no-op (or a warning with
> _DEBUG).

Yes, that is correct.

>
> > first one will be freed when the last put_page() happens. If prior to
> > this all these pages were split from one page then all of them will
> > have their own reference which points to the same codetag.
>
> Yeah I'm assuming there's no split before the freeing. This patch about
> splitting just reminded me of that tricky freeing scenario.

Ah, I see. I thought you were talking about a page that was previously spli=
t.

>
> So IIUC the "else if (!head)" path of __free_pages() will do nothing abou=
t
> the "tail" pages wrt code tags as there are no code tags.
> Then whoever took the speculative "head" page reference will put_page() a=
nd
> free it, which will end up in alloc_tag_sub(). This will decrement calls
> properly, but bytes will become imbalanced, because that put_page() will
> pass order-0 worth of bytes - the original order is lost.

Yeah, that's true. put_page() will end up calling
free_unref_page(&folio->page, 0) even if the original order was more
than 0.

>
> Now this might be rare enough that it's not worth fixing if that would be
> too complicated, just FYI.

Yeah. We can fix this by subtracting the "bytes" counter of the "head"
page for all free_the_page(page + (1 << order), order) calls we do
inside __free_pages(). But we can't simply use pgalloc_tag_sub()
because the "calls" counter will get over-decremented (we allocated
all of these pages with one call). I'll need to introduce a new
pgalloc_tag_sub_bytes() API and use it here. I feel it's too targeted
of a solution but OTOH this is a special situation, so maybe it's
acceptable. WDYT?

>
>
> > Every time
> > one of these pages are freed that codetag's "bytes" and "calls"
> > counters will be decremented. I think accounting will work correctly
> > irrespective of where these pages are freed, in __free_pages() or by
> > put_page().
> >
>

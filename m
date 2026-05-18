Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59523BF66C
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 05:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.194
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779082755; cv=pass; b=E4dxPIww4L8Rg3HicSbqkxo0AVssA967uzs0cfQUnqNMKtpuVHEH7dCCGNAiaAXYxVH/GOWTfoGukel8x8Y5GodY/8m+PwC3lgPXxnEwttysm9j2X9tNGLrrEtoa6aHBQs/ue3aZvLKGgFrVqh9s+oQxR42GJ4USmcYTNSYS+Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779082755; c=relaxed/simple;
	bh=ZU9zcwa/1oA+08JxSkZueqLN2CpJd+9cjTLHgOB8s8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QsijqBjkKn1/Kx82pxigFhag+dqAokWefrf9Eh4YkJMTVOIOHWE7TJUA+hrPm4H8XQBBhmeIQhyIz1nu/yTJPuO3koAdyfiUIULtJeK7oocZJoau10GUM+iSnF7lzKwOu5CdFkekm+6ehNauNFSkOcqbaPXV2diKXeDpHdUZC5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TB1liBXy; arc=pass smtp.client-ip=74.125.82.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TB1liBXy"
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-303dbfbec77so707339eec.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 22:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779082744; cv=none;
        d=google.com; s=arc-20240605;
        b=N0t9MrbU+CWUHVRGG46cpdYBB+69thp8tWay5w4IfoygPb79CKu84z2q+WfSrhi415
         9w9kRTf8RcOsToyc/Mw30UWXlcdXa7RPXxn8BeJwu2ZOgdE6G9gW16mEIgDJorTt+wHL
         GCMCvcd7N2aJRrXfOeUGosQuk0zZasgz4MBL9NEl50dSOl9A331iif9BFpkBFaA67C6L
         GdtQwJ6rus8gPaw9xtrztF4okq0Cbll3eTParaeQey//tRMfFuU97jAiqAAL0M/hKdu6
         39vk+adanyzWkJ1Zrm3hA/JXkRhdNNGYbC7+cuS5kwCJB6z2gQyXAPtGnuZgDdyIj/nQ
         VprQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YLIcqWTVpJE5E6ocMJoFGIXQYdlOWCw+6fTR5Kv3lQU=;
        fh=dpGgfr4FCxyq7gHlAc+1pIqXaFMwEz1zLzzTTVFp3HQ=;
        b=YKEavljdC7A50EstRr6fBxBtkcJntXBpO7ewrvCJE8g4zlAPcHYEOfgkGv1JZgR1ob
         PC9/1yPlHACEQyz/WmTuP9lGC8venFJvZ0gpnG9VZPUELTpSXolDfdIiPDT2Q19t6gMV
         OMBVXkApOqRDH1sYUSbR98RJO5Atkf0LPzBAOqqmv9raSV51qCZ+YrqP+BM+Vs0qdM3M
         IO6Z5YObdRt7xnKHND8jU4JCWOtV5RDD8KHMVe8jcJ4gp9slgw0JY52q+lZqMtwV5XQP
         o6CNcBq6LDqbGzBqCTurK0kVdy8Up7mstJX3t0hgLD42fLYPbe5+JqCd/W1VYv7LgkiJ
         drLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779082744; x=1779687544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YLIcqWTVpJE5E6ocMJoFGIXQYdlOWCw+6fTR5Kv3lQU=;
        b=TB1liBXybDxhylVHUIX2k8rH+3bGu5CezB7CbliFSjzu9d6FVG/oVN+o0kyhOTC61i
         pMHth3QkZcX+qf3rYgCqxDLSj4+mBDzQXyvCL78MxSl6RncYOLEkSmOMngkYrwHlOssD
         1giQgsIU7WvFZXNqZ/C9jhOrXzCVKYoHKw5K6wMFAmF/nqsQPgUVkcgau72VMG6HtXlm
         RRIcLFxare1tCEpdSxedDzwukENJ3+/0qldg6TCNc0BfIV8Dv7usIwKRWUrRZ7/0AwPv
         p5vk5jf4kQgcF4mQ5kEMPfXCMnLuUlykxvlXkkxPtwN1pIbKXOuyxZpYZeze5Uh9H5AL
         BgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779082744; x=1779687544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YLIcqWTVpJE5E6ocMJoFGIXQYdlOWCw+6fTR5Kv3lQU=;
        b=L6hlHZH7mFVG8COHkfwW/gcR7SUnnP2VNfZVKF4V/lrChXD0tRtzv3B1mK/IXOg5xr
         GtnQLzHAJ0gauPfcMZYzZMA3r6HfmzNvdyH63qtSmEfz30LZHunC1wWV/+9oxz6Hl1bX
         YN/J04iwhI8RS5QT5zIlFwx+dRzMufL8fPxOWZ+k5QTRK6RRWgCSuzoGHDpJlNt126pY
         BHs0qE1Rmx3YXC2VP8ujg2JmgNNyqBeIMdCpzOjskCuS7jeBYaBdTULHnHtJ32//SV52
         72VdMkWqkYk4WUYGLD1UoI+YVXQGt7Pdv2qPQaZfzedjJsYvx1hPMLs4taQXbW9BtvsR
         Wclg==
X-Forwarded-Encrypted: i=1; AFNElJ9QVpsuzsK9V7i2MLiISHMBs6wHSUkL/ZwZreImlX5HY8CN2BrHejn/IFWbJXDi6V8hRMwB+DYKG3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRtx4UT8EW3g0UZuUQjJ8eofgGGbmc0ryrwstx9waMJ0EV/NAI
	tqe3eQ1ZyfMBZuQw/68M+01mte9AxbxsxPgpgjLY8HJtqP7GFhfP2JN/H2kBetVIdWk+qAt6Xpr
	EsakjbftoTd3Rc/Y9IdLsZ+kPugDU0A==
X-Gm-Gg: Acq92OHeSS2R0xypP/nSu/n+i0OWlCrDnXItaiN85AYhosSAdYMwdFdD227O7LoVkfe
	PL9YpuVOmsYedw2FOAyC/OmXywusoBPxf1u8H4Jiu9dzJyE93pAwhOipuc1cIcJbJuwsZnBC57v
	4X3p19BEl8x4QIKMBQZb5kZDYjQVjAjjxOvDdw/J4Qsojnc+eSRxGKxh9k897E4wznkT1vl3U+X
	rRAF9VUSPAu2Ot4S5JsNtIGVVyKBNJeLwv5f/FbpJiv1sAM55StPibduKb89p0KVsGjfTqMeHpW
	IUdGIAacBeJogir3rg==
X-Received: by 2002:a05:7022:f9a:b0:132:5d31:dcb4 with SMTP id
 a92af1059eb24-1350483cd3bmr5446081c88.23.1779082744288; Sun, 17 May 2026
 22:39:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516210357.2247-5-ravis.opensrc@gmail.com> <20260517233756.89097-1-sj@kernel.org>
In-Reply-To: <20260517233756.89097-1-sj@kernel.org>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Sun, 17 May 2026 22:38:51 -0700
X-Gm-Features: AVHnY4K2ub7Wht5Qs4RyrHgIQ9aprUqnUTmA2ZoG_aUhnEoirB9aJCACF4FE6fU
Message-ID: <CALa+Y17nudor22aJvakfos3UegPgEG1M8N7cJPAxWX0Ca=MvfA@mail.gmail.com>
Subject: Re: [RFC PATCH 4/5] mm/damon/paddr: skip free pageblocks in migration walk
To: SeongJae Park <sj@kernel.org>
Cc: damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 4:38=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Sat, 16 May 2026 14:03:56 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
>
> > damon_pa_migrate() walks every PFN in a region linearly, calling
> > damon_get_folio() for each one.  On sparse physical address spaces
> > (e.g., CXL-attached memory), a single DAMON region can span hundreds
> > of gigabytes where most memory is free and sitting in the buddy
> > allocator.  Most page lookups are fruitless and dominate kdamond
> > tick time.
>
> On sparse address spaces, the problem would be large DAMON regions of off=
lined
> memory.  The large DAMON regions that nearly all freed memory is another
> problem that doesn't require the sparse address spaces.  If I'm not wrong=
, the
> above paragraph could better clarified in my opinion.
>
> >
> > Check at pageblock boundaries (2MB on x86_64) whether the block is
> > entirely free.  If the first page of a pageblock is a buddy page at
> > pageblock_order or higher, the entire block is free and can be
> > skipped.
> > Similarly skip pageblocks where pfn_to_online_page() returns
> > NULL.
> >
> > This reduces the iteration from O(region_sz / PAGE_SIZE) to
> > O(region_sz / pageblock_sz) + O(populated_pages).
> >
> > buddy_order_unsafe() is used without zone->lock.  A transient false
> > positive (block becomes non-free between the PageBuddy and order
> > checks) costs at most one tick of missed candidates on that block;
> > the next tick re-scans.  No correctness consequence as DAMON walks
> > are best-effort.
>
> I was initially thinking this is a good and reasonable optimization appro=
ach.
> But on the second thought I get below questions.
>
> For large offlined memory space problem, couldn't we simply tune DAMON's
> monitoring regions boundary to ignore the holes?
>
> For large free memory area, is it reasonable to assume such situations?  =
In
> production, users will try to utilize as much memory of the system as pos=
sible.
> Then, wouldn't there be such problematically large free memory area?
>
> Could you please enlighten me?
>

Hi SJ,

You're right on the first point.  For static offlined memory
holes (memory hotplug gaps, partial socket population, etc.) the
right answer is configuring the monitoring region boundaries to
exclude them upfront, not making the walk skip them at runtime.
The changelog is clearer if I narrow the patch to the free-but-
online case.

On the free-online case: I agree large free memory areas are
not the steady state on a fully-utilized system.  The cases I
had in mind are more limited:

   - A workload using a small part of a much larger range, with
      the rest left as headroom (e.g. 64 GB used of a 512 GB
      range).

  - Shared tiers where workloads are allocated and freed on their own
    timelines.  Any single piece of free memory doesn't last
    long, but on a busy system there's typically a meaningful
    free fraction in the range at any point -- especially on a
    slower tier, where workloads prefer faster memory first
    when it's available.

The patch as written is a narrow optimization for those cases:
the pageblock-aligned check is one extra read per
pageblock_nr_pages PFNs (about 1 per 512 on x86_64), so it's
effectively a no-op when the region is fully populated.

If you don't see those workloads as warranting the change, I'm
happy to drop the patch.  If the framing is the issue more than
the change itself, I can respin a v2 with:

  - the changelog narrowed to the free-but-online case (no
    offlined-memory framing);
  - any suggestions from you on sashiko's review comments.

Thanks,
Ravi

> I will hold digging deep until this high level questions are answered.
>
>
> Thanks,
> SJ
>
> [...]

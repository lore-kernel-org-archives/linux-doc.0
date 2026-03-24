Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67214407112
	for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 17:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774373018; cv=pass; b=JRojfODAkl6qR6VaNVA5GYdO8HgfwQFA3KehIPlsIXCMSuSpVWr+PbyG/5NkfC/ixq7msecwF126dp1zq1EVmA+pv8X7lYh6+UqSCwJzh9/HqvfB2G8JFaKSGOBZ3l7SbwvGy6+6HHGPQ/dycc6wrin4o0GnSTpxVcXe7W6zeVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774373018; c=relaxed/simple;
	bh=ADQFV5wS3JCAtbpPelSvRH/EcbFi5KJMA+4XwSLSTOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjpZ0sumFaWKFZRLCI0Quo+hNpvZCgrsmYtd82IRATWXydaS5X9pDPkyxJ30B0TNrziP2kv3KAQJzyH7qnuvNnvN3UhAqMeK5JCdYHkZjSrhXXGMHToS7mCCLheSRK5BnYBTZK5CJCWLMkdRfngKzDn3FSxKkshh3DMFHCGNDoU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hcnQy0We; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hcnQy0We"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso4474438f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 24 Mar 2026 10:23:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774373014; cv=none;
        d=google.com; s=arc-20240605;
        b=MBwb1fcjIILHi/ks/LaDsakethBVmPcoVjy4EDkyx23OZQwc/m3fVMB3fEFG+qfiRk
         VV5cNWHiP7LZcSHb57xekYHWHRnNiGlSWpQxKt0Ba9IGXeDSZeThk79cpUUcg+jhIF0e
         8s6N5E4c9veVjr10aBBWo+TrKi6xNokdnmLvNUzTCq6oSbTpgoEPKHGtqHYG733vAzpv
         OpdzhJrZi2kznepr5xSRXtGIY2e/Q9h8NxtXnz3G7mQir5sCemiTXgTO/j+8tIbrbYiF
         zhIxLbMovGb+Tb3cWVPNfZWRU3/8klgjR4eeQTCfxaj18WE+sbmxu2XKsBjWIyg5sI1K
         Onuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ADQFV5wS3JCAtbpPelSvRH/EcbFi5KJMA+4XwSLSTOE=;
        fh=CPaf5qCb2j/b8lCYk/8YI/b+Tub6CmLaGpzE2QVf+Uw=;
        b=VPryYuegH+mjYIx6GQomfA0d6dCbgQbqSqsjEoohhjcqpF+zO9GfAqZ+U0lPoXY+i0
         gz+zSr6TmfixChp55pQNyRzmtvOApZ3DVMNzRKuhABribfqSdDwzG/SSqagxaXA+ihx7
         MTdoauunDmBrmWOxx2Fx85PxQfMaU/iUK0zmb74h6P0uZVcZRaoC6ZLTWIz3Dy4L97rc
         7JVYmVTRLCK/nlr3K2I2MzOfrvS3YTh+fgWPdbk/IsAxtneOliLsZQQjqNgppiA2AFzr
         4kcj4pQU0cC/wibassO5eLYALweYdw8SmShJ6yPi4MxLJz8ckNuen9M8YXoEhaQePOY0
         HPlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774373014; x=1774977814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADQFV5wS3JCAtbpPelSvRH/EcbFi5KJMA+4XwSLSTOE=;
        b=hcnQy0WevFzPcCqKVm+NhCHUCm8eQ1zYvsUZd9bvQNfg+Ktc1kkFLcwepNHFPzADdB
         tuj9cXClggxyaBnMKi7Fxv7bRq4XmWflvGe26Qwz1albn5o1ngyxWPPJXn8s2Rzomi8n
         31DVxghWbgMB/HFEtzCbbSRitKZn7qJlIK7GdMAAtqtL+Pb0H+UdEqPd4wHuMlowwv/q
         eY7U9GRh8u4SsrnonkvP+wL9jk4Ylg8GkDrqQ+r6AFFUHsDk3r/E0TRB878XbnuIt/Ts
         DLE1icRtRVJ8LBPx9w7ddwTXbmbUfdkWG1jUU3Biwtk1vDNx8FBih++MrhPBCWaWKQep
         hlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774373014; x=1774977814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ADQFV5wS3JCAtbpPelSvRH/EcbFi5KJMA+4XwSLSTOE=;
        b=V9olQU5cKM1+wG9t9hhGDgAX6hLZemcQk6YIC4Y8etBNMpTdM59D+iELc7GWqorc4b
         fTb/TjLolUuR7vBjIt9AOwyOQYM+uvSvs2PgFdvyqrsTgtvd/wMZL16qzQHnxyagSVqK
         blcm2bJTm8jUOdx7JASP8JAGb++gCv99P1CzppqqUczM9qExg00dcEt8eBt783bRh6Cg
         veRFpomUyUKNTgUFZD69wyBM3La5X984GLFb5HY9/bcpD6qf56hx70rc+xFohMJEVge7
         k5s04qfsCx+PW1wrdvAFhwSJRpfMqwhkKjth4KYeM0Jln3U4BEHxLPM/AJz2cGCGj9kf
         SXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+eNNf2Nyz1qFkK6wfPmAX7jBJwl8Rsevg4zNcrFo53dyImJvfoEYEwpjqLrGT8ib6daCChP2PLgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsLtfBhI5CTtbwtssAbzNG/qeOmiKqU+N8RIjExH7H+GsL9H7L
	pgFLX8HaRoPMiWKXT6HRLsd0VxT752Afqgm7oK1b505Nrrwe4FbWpL6/1qsgHGSzMLsHo63ndTL
	hPpMQIVfkqd90gPJgOxNS0CKPxqYVUus=
X-Gm-Gg: ATEYQzyuNkeDN6lbGQFu5idPJ0WYotCM33Cq8xSpYhL6Wy56auu/92b+cgHLrBaqScH
	K+FcW7vlbLE2LKWCeCvjqvccthDCeLKufdd8y8oWn7Qi5MFPU8GqkS5dEwDrUGbsnKvDI3B3TT2
	FWlFw8EoeHJvCFctw/WdEvA+LflsaJi7cl44afxqNIhVI85GLtBAyltJvWnjkQUf6mn0NLz/78M
	S7goST/DUCgNGndH/d9bOisajpJROZWhx/1etumaOAYnT06Su8Pb7Hopv5sDQhgxNRaVMhnAY7J
	wdQt33S8SMUYjJ3T3VpoNaEsR9QIa0wxBA0btTnzP01H4UUKQ5fKxl8=
X-Received: by 2002:a05:6000:4028:b0:43b:436d:781b with SMTP id
 ffacd0b85a97d-43b88a1acdemr451493f8f.40.1774373014027; Tue, 24 Mar 2026
 10:23:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320192735.748051-1-nphamcs@gmail.com> <20260324131931.4004123-1-safinaskar@gmail.com>
In-Reply-To: <20260324131931.4004123-1-safinaskar@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 24 Mar 2026 13:23:22 -0400
X-Gm-Features: AQROBzC3hVhU93LxfbLzywKCT0KcJoCMPUplZMLmSEgnO1rcgM2PnL8QUVFELHg
Message-ID: <CAKEwX=MgoPmiFdBQXK_4=XuR-8mVpGr+3Ku2MfjPmHCeuUdGJg@mail.gmail.com>
Subject: Re: [PATCH v5 00/21] Virtual Swap Space
To: Askar Safin <safinaskar@gmail.com>
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org, apopple@nvidia.com, 
	axelrasmussen@google.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	bhe@redhat.com, byungchul@sk.com, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	dev.jain@arm.com, gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, 
	jannh@google.com, joshua.hahnjy@gmail.com, kasong@tencent.com, 
	kernel-team@meta.com, lance.yang@linux.dev, lenb@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org, lorenzo.stoakes@oracle.com, matthew.brost@intel.com, 
	mhocko@suse.com, muchun.song@linux.dev, npache@redhat.com, pavel@kernel.org, 
	peterx@redhat.com, peterz@infradead.org, pfalcato@suse.de, rafael@kernel.org, 
	rakie.kim@sk.com, riel@surriel.com, roman.gushchin@linux.dev, rppt@kernel.org, 
	ryan.roberts@arm.com, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	surenb@google.com, tglx@kernel.org, vbabka@suse.cz, weixugc@google.com, 
	ying.huang@linux.alibaba.com, yosry.ahmed@linux.dev, yuanchu@google.com, 
	zhengqi.arch@bytedance.com, ziy@nvidia.com, Kairui Song <ryncsn@gmail.com>, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 9:19=E2=80=AFAM Askar Safin <safinaskar@gmail.com> =
wrote:
>
> Nhat Pham <nphamcs@gmail.com>:
> > We can even perform compressed writeback
> > (i.e writing these pages without decompressing them) (see [12]).
>
> > [12]: https://lore.kernel.org/linux-mm/ZeZSDLWwDed0CgT3@casper.infradea=
d.org/
>
> This is supported in zram. The support was added here:
> https://lore.kernel.org/all/20251201094754.4149975-1-senozhatsky@chromium=
.org/ .
> It is already in mainline.

I'm aware of that work. It's an improvement, but my understanding is:

1. It only works for zram.

2. We still occupy the full PAGE_SIZE slot.

3. The writeback IO request is still of size PAGE_SIZE.

So we're saving the CPU work for decompression, but not the rest of
the potential benefits of compressed writeback.

For zswap, decoupling zswap and disk swap is a pre-requisite
(otherwise every zswap slot occupy a PAGE_SIZE slot in the swapfile
anyway).

Then, we have two alternatives. Either we implement a small-slot
allocator for swapfile-infra, or we writeback a full backing page for
compressed memory. The second option is a bit more straightforward,
but then we lose relative age of these objects - a backing page might
combine very recent compressed pages and very old compressed pages.

These approaches have different performance tradeoffs and need to be
evaluated. But anyway this is future work.

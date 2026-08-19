Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBED48C3F2
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787157993; cv=pass; b=WnHtnT/Lk1e7/U3emkzZqz0e9CUYUK+KfCvCqX82dDplIMy9tq/4MgFqw+pQBDw2wsm0EShAgnbBvU86HKVBMytn7sdNulNUtzv+7T8mBCcK6oFMmDMC1rpPFoQtyBEnJajffubzNbiBWIyxy6liyHdYY4eqA2hrUTY9bdygHEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787157993; c=relaxed/simple;
	bh=bm4ASoBKtUmJHUk2zSNZG8bG7KON1caZaOXDl2aDwUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZUsrlT18o9gYVQdjHO81ofs/4yN2pKN1kvR433q/M+3UdzP73fAuXwyZjdSWwbfGLK8seWIW+QC6p6SCCT5LTv5jqnDKjLKjdg9tkXitRi4ee4pjfLaHFctykrl7bFtoe7BvAvxSbJWQq7IU74rhHYaFKgsWYForHOQZwQcc0/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVPozzVe; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVPozzVe"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47de0093c42so1144247f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 09:46:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787157990; cv=none;
        d=google.com; s=arc-20260327;
        b=Gxf1EROyWJP9lLcwZI1e+ATJYTw7w64SOpEeCtL6LwiYdpPjisSJUWRMlOsY1+Mvfr
         qXFky5p5d3dWtxvk5fAsoLyB1ox9KwB0+nGmRGoDBB0O7vNkCzD698jBd6vlos5mZYRo
         Lqo6ArUNgF/schQg2YpjMgY3ixbVDg+mR58bKSsqIeLuBRQh60NTBx0LlbE77ejIW14F
         O+OXeHcmkuTkmuzOetjjmbaXtK8xLWIqct6oKt8BXFtShRQVktKROYKHmFPVgFQ48pXq
         tle77lADy4Wd/1jRn4XwVY1S+/LMz1EvjJkY3sP95oDyV7fEb3SHynA+Vhj7lwAXB/Zb
         LFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KGaMY+nZBc9mwPhVBSJIQVYoXkNeMf257X9LmQBSnFU=;
        fh=lcgZIr9jes4Bwt5lhxAQRY6A7Zg/Mr9wLDUQNZ7IPKY=;
        b=Xj9z+uNhQUyEhANcd53YrjYq/p+/ONBDuoSVGv4jFKeg0bz2hqaGqtJyxIoR/zT+6m
         pl95SZfeasqAIG9cRHombs94sCb0pdEoYslLDDFZrJvipgbVJcKRXbzbX/0NGlj6+oEm
         VQMMtahvg2BfkQeObwcWtxCLQ1vVbAAuxsk/RCCDhQGUTBuc/IHRP1oxD0xc2uY29ENH
         D1AIwMg9l+2JliW7ttmLRnaARueLdcFG+A6ELrq7ShNYfA6VjjQ8R/eL7d3I04iFeKw8
         Jb0VoVbhHJa8pazoJcraCXTdM/w3Chg7qM/Fc4rMVLmYDXhzGSs1V0cD8vrsm4S0xBez
         BzGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787157990; x=1787762790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KGaMY+nZBc9mwPhVBSJIQVYoXkNeMf257X9LmQBSnFU=;
        b=sVPozzVecTITBkKuvfayI7txQF8rWRsy+IU0J9m6uVV6YM4NSyAk3JFUGU9RhHrhyQ
         j0qfyDK/dvFmpvOpr0JlSNW8V0soQobuxS1JdQDhqONJKKWLm5NanByKEEzMlkML8Ar9
         fh57Gdi9Ykqu+X8w/+S4tGQ7dce/26nb3IU1ZiD7m3l5suZZGePlatkK1+e9R6XWpQ0F
         7nST1oNClGH+PHQ27wGfXeqzfbw6fEPY5LKo2srlLWjvz5QitF5yAF27shqF19VXRf/a
         +kRGfWjTodZml167noIrOrbP64RuX6Mkl9tl8MAZZGJqSoFsn71LOyesB8kKqAXjG9cz
         hKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787157990; x=1787762790;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KGaMY+nZBc9mwPhVBSJIQVYoXkNeMf257X9LmQBSnFU=;
        b=iTGZxGvsi20bD76s99oubCfOb3Kcb2i6DfMaisz40xU5Ff/LV0QOm2SoskXmMyEegh
         +21ce8umtt+3xcVhRjNHg16M3NByptcY5kCdDrqvlsc97aXvAZwx7ifqw//Y/ZCDjLQf
         SveFWOluTfHSBad1+SW02yiuGHGzAMft+Mi/cSHx56ycnFz19dEJvTkLTofHS6FTh3wz
         sRE7a9PZ2qE33++B0TO3w8Xl68Bo/MR3hvZFXfxZzi88XxaWuxhe6tE8rGnwEZB4AqaT
         qy08lT2iYgXyez0/77DZC2+TLeGoP32CC5UjQ2tDhXlevvs7CFCiXfmXBdNAxIdbTeLY
         cNKw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2roIDQU8ACrInT7wnpcAnriAmeRxSPa8Ie+tgg92GPMrCiqaxq7xeb9xkKc8nwKFn/OLllcoDrps=@vger.kernel.org
X-Gm-Message-State: AFuF++km0UpOiis06FgKtvNza8JWGogunmyA/2P9fS/qW38Bz7C4R0Z2
	oaz5ILLXFiC0B9uIhHZlEJIg55yswWGF7WFimiG9Ou7nzP8Sws1FiR+Vr0Vuna9ugDXzL9Pfnhc
	LqL3KExxat2K9h/ObMOIiGQF3bB4rV/Y=
X-Gm-Gg: AR+sD11qGPOTGiKaE6V1TtZzwcp6v63nBUC2uvswr+aX8gYwNIZ1XYToNT0N0Tb9w4k
	IyQwxXR+074zJZZMPK95oDf/mYNsAxKfFq7kOA7j0rwm8ZQeHe+2DTe3xUMX9zi5JQJEd2IOKNi
	f2ns54ScwMsvHBmpX6dixk0qMG5Ntpea9HiOfluS+Pvk8husjzysjsPiE2obAJcO/iLvaof/2Zo
	dxXj6A8boQPYlhDKDEb3+l9xGqmSV+oQlJMV61kv3WcTg/Sg/uNxsodhlkDPjdFNs4LGIk+PWrb
	1ZMk2kO6IFnXGol7LVAeTn7pqJ9OwJVGtpdf0Sf79Qzkn5VEx1AoPXRg4hTfVOk94ZfjYTmsojJ
	E
X-Received: by 2002:a05:6000:25f3:b0:47f:8ac0:ccb4 with SMTP id
 ffacd0b85a97d-482b1e9df5fmr12803729f8f.10.1787157989811; Wed, 19 Aug 2026
 09:46:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-1-nphamcs@gmail.com> <20260806184254.3790858-2-nphamcs@gmail.com>
 <anX-ga41DMNWF6-2@cmpxchg.org> <CAKEwX=MmqyWdqfrp8kxeuucNFhU2e6Hk2TdANUGhNFHhvtSPwg@mail.gmail.com>
In-Reply-To: <CAKEwX=MmqyWdqfrp8kxeuucNFhU2e6Hk2TdANUGhNFHhvtSPwg@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 19 Aug 2026 09:46:17 -0700
X-Gm-Features: AcwNN1VW1IFOK11rd1UcYSUArFyDXGImTjTFPjh0sY0B1rB0YRzMpSnPt4Jbiig
Message-ID: <CAKEwX=PjvsAOv8rvp+mz_aPqDLm6iRy6URRW2EMFvFrgD2HEgA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] mm, swap: add virtual swap device infrastructure
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	yosry@kernel.org, david@kernel.org, muchun.song@linux.dev, 
	shikemeng@huaweicloud.com, baoquan.he@linux.dev, baohua@kernel.org, 
	youngjun.park@lge.com, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:41=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> >
> > Can you make this a pure allocation function - vswap_alloc_cluster()
> > or something - that links it to &si->free_clusters, then jump back and
> > use the existing alloc_swap_scan_list() sites?
>
> That name was vestigial from Kairui's RFC, but yeah I agree
> vswap_alloc_cluster sounds better.
>
> Regarding the linkage of the newly allocated cluster to the free list
> - I'm a bit hesitant to introduce new surface for these clusters,
> mostly because I'm afraid I might mess up the handling of these
> clusters (when I unlink them from the free list), but I can give it a
> shot.
>
> >
> > There is a new_cluster: label upstream you could use for the retry.

Actually, I stared at it a bit more. I don't think we should jump to
new_cluster here - it's not what physical swap allocator does in the
first place (we never do any backward jump to retry).

So basically, this is the old code:

new_cluster:
if (discard)
    alloc_swap_scan_list(free list);  /* not taken by vswap */

if (alloc_swap_scan_list(nonfull)) return;

/*
 * Added by me. vswap (almost) always succeeds here
 */
if (alloc_swap_scan_dynamic()) return;

/*
 * not taken by vswap, because we succeeds above
 * and free list is always empty.
 */
if (not discard)
    alloc_swap_scan_list(free list);

/* if free list scan fail, keep going */

etc. etc.

The new code becomes:

new_cluster:
if (discard)
    alloc_swap_scan_list(free list) /* still not taken by vswap */

if (alloc_swap_scan_list(nonfull)) return;

/* vswap puts new cluster into free list, then falls through */
if (si is vswap)
    vswap_cluster_alloc();

/* vswap now scans free list to get the cluster it just allocated */
if (not discard)
    alloc_swap_scan_list(free list)

/* if free list scan fail, keep going */

This works, but I'm not sure if putting the new cluster on free list
buy us much other than more lock contention points (we need si->lock
to scan free list) :/

I'll just rename alloc_swap_scan_dynamic to vswap_cluster_alloc(), for now?

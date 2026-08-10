Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AAF3B3884
	for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 22:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786400883; cv=pass; b=V065NRkeBEQOyxFPkII7dpDs5KoLinwdldQ6SYtjt7r/Gw9uav50l8M4nbdV/lm4wbTjXgxWTST5GAvv3fzXKyOpH0oTNnmOvwuIixbdAZwNuIamBSoX8qHHzk6pjhuwcytRyuIy0j+ahdseBKncmAAGNkPOgZpTR+el0zXNmXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786400883; c=relaxed/simple;
	bh=tG00cln/EZfmDZKyIkZr1KbYylCCT00dXhW/ufTCbgc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IMowcofZniahBoL5qU4haVHy5fjzJc60xeKU2FqEEm3DWUxsYHxyI3NrWr+WQvoReItB9kndAgQpK21melLqBZkyQtzm4t4/f3oSLwJjIvGTRpQvdw9mG0OAQDd7fvmHxRvxxRAsXkYJfs9MwGMkFgfIwW08TD0oJOGImEHcebE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1R4LTDM; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1R4LTDM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-496b7622a83so23120275e9.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Aug 2026 15:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786400879; cv=none;
        d=google.com; s=arc-20260327;
        b=ea9nCKQw0MGih8Dvc1kIZfJ6srfPFpRZTKDOhadOU3q7zTE9KrNnxcRdhmWW6enzJA
         WzX/Ysf1DGsF65Zu8ryNZyffFUU7wL4wObuqm3JZEaoCTdnD2xccqSbZmMvHqKR4bKbd
         6bcyBDXKBojpfSxttoZRLeixno2PTzMLUg0J81tEtrhE/Ui2sfPpmJ83B93+q/KiGOon
         Q6Xl4bx3klv4ytNV/2HrWhl+HDtXPhOJpbsLDrqCntpZSM2hThkHZFj3W79g9d4JZLQH
         bi6EU+Y+2VyUzY3cz0avMire3LfnRDNwxRKLOGZsLM0QoLNCfY2U4x2RTB5tSH0AZbBX
         x5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tG00cln/EZfmDZKyIkZr1KbYylCCT00dXhW/ufTCbgc=;
        fh=XWYn6UMHgAqDvAcuWONc8fL9ZaI1yFa48PRqnkWoO9k=;
        b=cfoixpPvhqBd3yUm6y+G9iNatv611T3FxzmoA22ymmzWPdC2fjRG2tx1kIPNogIp0w
         0pXMMIfrWuFG2pc3MU5cNoB16uEm34z9HPI3V8ZADetXnYHxcFe0KzTNzUYZT6ntBrZ3
         Edlll206K9/iYjB5fSiSlbZKhj8LJr7cie24g9AGZJCOK8oBnPbFJF8M2EgxXSmMjPWh
         KG9kAbf+cF4vYZQ9oeqIeBoQWq6LFJfHy0uZx9R1V6wYlWYXa/8rZdDCYXNrDVV1fC/+
         OD7wUbEXqfAjHkJ7wnHU+uinLMgofH2kUgUs+HKa3EZmqao+s+OmkbWlswePMyK/eOvS
         JnwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786400879; x=1787005679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tG00cln/EZfmDZKyIkZr1KbYylCCT00dXhW/ufTCbgc=;
        b=V1R4LTDM2MRY6S+1o8cNQLHcERSXU8wtoei3zeKyEE4doN5Pw1jlG/EEeDy3MRc/vG
         A7F1kquZ2y1eNGZK9yLkqqjaLebiPDmK3KC6Slmu2C30lUDHJehP6k2qAFqXeQZ0UAm+
         Bju4wR6uPxtKw5gvPEZedzNFHaei1w3zT5/bQzJWqbSpX4RpqJUHgna8S0m88Mz4lUAq
         NuNiu3i96Emu0uoM6LFN4rMo9AANddFUH85jGoppZK+iuxCBAUTuLO7+26NB0/PMd2xu
         8KQYthLkWLYrK+uaedFpE4QmEMUOj3q0Ie4IQPB44NdWizdIt0Bl231fzeArmffRp+RC
         3eAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786400879; x=1787005679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tG00cln/EZfmDZKyIkZr1KbYylCCT00dXhW/ufTCbgc=;
        b=Td9lhKS27x9I0isDEEpUOEoHCSyTUuSkCPvTDDfdmDvCmpqpcVzX6TfOcJhPB+Dh75
         Qrsvp4iRN4L/KW3KEWOAi6Pj3P73lMB+6h73i0PNJyf3WD//sPdPqRrK2DX/6wWXmFTy
         ojeTNpSAJWY9UBZUUdLjgj+pnKNxd7vYo6Czg1aCLtsHvxETXL90SaITuvnnDVG8ns7U
         u8Zu6HX+LAezsnmX0udxLLszoWExpUc/ABnvfspLi6UW06RTsk2CdHxUGWPdcJBeqZqG
         r44LY0Wu8qOEfisCn0WvEtxXFDqkxdPHaV+RkFX3cz3barEGSlRyDGBJhvdpF4ov+47d
         mT9w==
X-Forwarded-Encrypted: i=1; AHgh+RqmSFvBN/LGlj32IW04j6J3d71X5NQgVr0XZ3nmK9y/qtwAZFneoslotwkQTthQcKBAYp396fdO95E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzBGgSSAw3nRftqbh/som3ECAvSjHk0wiTkQ8bC4G1J+isMB9N
	RBWfLB1Qq5DMuGUMod3Pw/Qur9vce9AJ2S0aQvzACeqHLIv7SnNfN06SS1Zga8nBxthtSN/bxn6
	wt3ojH1bmqcXEZNOR5zv4Wb7ntejOIT0=
X-Gm-Gg: AR+sD118M4Sq8bKocMkx7oLgEu32P5YdoN0sfy2ijUEUa/q8rR/07edtYEVcHiNyH12
	yQ3RONvLSbGlRx+5oVrwatn6Bs5RzAshOdJKeymKVQnLBhKRhGIVbmQ58ZOsNyUjXDwiv8bCl5b
	P02ilVkEGOGnWr98kXwlUrcwHY1cVYv+FQou6ZEt8A6nBRW0RIGuwIhri5dQCVbzj0iS30MMtDG
	szzwHt2nGxFzHXqqvyB2CmuGutZL8qZ/mRhKgwYTuHhSl2l92zLf8ms/N7fJ98oz/d/ZNWVgCd5
	iP4G03b32FYJajTvdrdjdawP1oQbZ3LA6DQlTJn2kgZIV/ph3PxXpO7Pq0ytJlk0hi9FXuOZX2J
	lXXTICP9OamyX
X-Received: by 2002:a05:600c:4fc3:b0:499:4892:d022 with SMTP id
 5b1f17b1804b1-4996194cf28mr264737515e9.8.1786400879152; Mon, 10 Aug 2026
 15:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-1-nphamcs@gmail.com> <20260806184254.3790858-9-nphamcs@gmail.com>
 <anYIboHEUZb4fhHv@cmpxchg.org>
In-Reply-To: <anYIboHEUZb4fhHv@cmpxchg.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 10 Aug 2026 15:27:46 -0700
X-Gm-Features: AUfX_mw7dY0-F9-Ej-FIs5p3N5Vk4fr4DFsdoOHN23XY9uPiTQmxJlkSPfIPaBs
Message-ID: <CAKEwX=Pcr7a1Pfu2U=JQ3fw7k_u9LbCkNZgDh6ySH=JMN3HXOA@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] mm, swap: only charge physical swap entries
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

On Fri, Aug 7, 2026 at 9:31=E2=80=AFAM Johannes Weiner <hannes@cmpxchg.org>=
 wrote:
>
> On Thu, Aug 06, 2026 at 11:42:51AM -0700, Nhat Pham wrote:
> > Charge memcg->swap when a vswap entry acquires physical backing rather
> > than when it is allocated, so memory.swap.current tracks on-disk swap
> > usage. Zswap-backed and zero-filled pages occupy no swap space but were
> > charged as though they did.
> >
> > memory.swap.current therefore no longer counts them, and a cgroup whose
> > pages all land in zswap can now reclaim anon memory with memory.swap.ma=
x
> > set to 0.
> >
> > Direct-mapped physical swap charging is unchanged.
> >
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
>
> To head off any uncertainty about this: this is exactly what needs to
> happen in terms of cgroup semantics.
>
> memory.swap.* are about physical swap space. They track, control, and
> enforce fairness for a finite resource that is separate from memory.
>
> When a user switches on vswsap and a bunch of empty pages are stored
> inside the zeromap without consuming swapfile space, these counters
> must be 0.
>
> When a user switches on vswap to use zswap without a backing file,
> these counters must be 0.
>
> When a user switches on vswap to use zswap with writeback, only the
> pages that get written to the swapfile must be tracked and controlled
> by these counters.

I agree, and yeah I should have been clearer about the reasoning in
this patch commit message itself. I made the argument in a response to
Kairui's inquiry in the past, but forgot to include it here. My
apologies - will expand on this in the next version.

It really does not make sense to make zswap and phys swap competes for
the same limit, when they don't compete for a tangible resource (zswap
consumes memory, where as phys swap consumes storage space).

>
> A few inline comments on the implementation:

Acked. I'm trying to implement this. Will report back if something
doesn't work, but otherwise it will be in the next version.

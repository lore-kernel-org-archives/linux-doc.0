Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78E82165EA
	for <linux-doc@vger.kernel.org>; Sun, 16 Aug 2026 00:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786841049; cv=pass; b=pYgPppaaAJzTGlZbusT19BPUfMGs+NlBf3oEFtXj+FTRfYin5/WuaaIPXA0ZzEiM+OVHpsqGGVVszb1cU4HUJ12PgFBDwFf7L1Ez8i+mnLKdvcb0XudMhMkQGy0un3xfSIDs8l6zrbEB/pG0D/XF2qp2gu3y4J4yM4A9ga9kf+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786841049; c=relaxed/simple;
	bh=TLm3DlieNyZ+YZQmLXjzsHNdTqbNaOr1k1Q22XpWOWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ak0Zt/3AXc+fSarFywCGjiVgbqjmbYZAxj3i3m1/wyLzuR5HsNPYQQhgMA99gLtEMw9r8NwWCs3QnWXIL5Ow6iZc9yFXSFybnBzBUYzdG0tSFD8Gmspb91H88IZVPD08PUuV7L4RmLL8pLql6zN0naRIsBE6SCm/LsUvXartDTE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dndlf+Bo; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dndlf+Bo"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49557167508so21998795e9.1
        for <linux-doc@vger.kernel.org>; Sat, 15 Aug 2026 17:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786841046; cv=none;
        d=google.com; s=arc-20260327;
        b=dZT7p5u8QWiErT3VXbQIxk260iC1b49n8cQbPrCy1Szs84v3XoSRfMfAxHvIjY+mqZ
         JT3l09dT0MhPoejeswz4YD/d+jghHm4H5GciusnSArI5CjML2raXBI/x3owLWTwkQJpG
         J0t/aN8ZyMKk7AqNkaiyzH3zb/cg2+jLm/U3S06dx1eu0+w7FjDmpw/CYwsouVuV5eM0
         7W3OGyeHrwlgWRv7qMg4392Rl1vMJp/CEbtlLWzYjDrkm2eewqBSLhyeMs6qEtNn0vcV
         4kX1+q/i/Wll5t+A/t+dpOiepQ8/qcaZ25xc64Vcqbs5kxzSF31ln5zs92rR5HMV7e6l
         78Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6iaB4PCz9gZx05Kn+SlYN40/DtxMK6Wv5kNuPofiZY=;
        fh=JBAcfZMf81tvUZtRux0z3JPLrU3WMMi431W3aCTlgb8=;
        b=ansVfgrdEo1oO/Ud9HWq/MWvMFEOxHgQLzZKUQoOp0NfeK0Xxibslf1KxbDTTfdm8D
         pEYMB0maD3BlAhE6q64/Xo08ndMdZyDPn78GFrqkkY+C8cp6eMGSAGAUzcQGwUeiOFHJ
         sMS1UDuMByhkm2h9lsrpVjdZDz1mG/CLLbNsxUqK5u4oeeHDRdX6RwqZZSyeLPsJmSNP
         VkYExk5n1TjiG9r7C1BYbooAUyhfDbLAZon4yd1eFE47TbezhqvN6UWJm4SlbRLiYGV/
         O+V0uOXJUNIxS3LP+8OKInV9qEaKcV33r4Z4c8/EHID2WOe8S4GnbZSn+VWAwGXNyOVL
         ZaGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786841046; x=1787445846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z6iaB4PCz9gZx05Kn+SlYN40/DtxMK6Wv5kNuPofiZY=;
        b=dndlf+Bogz1E9bSDLvplLJdOxI9Uo2TWVhE3wUqGYAzyW8Y/E1scNsK7cMzHUZ08H2
         UtAw/chPqdqtdde3mXGynGjucChrD8g/9Ftx11LZgqP2V6vrOISWcmSe1J9/kD5xd58g
         NhkP6zs/DfhPNsXuUtX6NKHRadiQ/ADG+hHC+sT3oelCwUu24Gz+UkQyUbbfTbxr++fA
         vqiRh6yWThhj77Zqa80y8IxQ3caFeLRjM+rIrSNK74uWQuFKe8aIwq0A+rvvma5cawQg
         I/ApJrj5WRdqe2QUj7Y9O0GGcPoRbbWPLm0A4qdYyzZy2KwS2NkMfwfNAXxNxwi0GdCW
         vQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786841046; x=1787445846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z6iaB4PCz9gZx05Kn+SlYN40/DtxMK6Wv5kNuPofiZY=;
        b=jK/vaMMw4mDfIdHkd0gSprhw7pZTjVbwm4k6LItq9C0Zzziwnom6asNAi9VN3/XzDw
         xuJH1Axcv449X4u31Lu/bJ24Ywc/lgB3mzyz6Piv7tVuVKAfmGNjDiSLTu7xaKpDc6tJ
         0v8vnwFIrYIeih8UBjpppwvj5r85Jaq1zwz4zHLR3aB4e5alz3rrHBhUOd2Hh1GikoES
         xNefRg1H4YkEjiwuKeugoi/9k1n+4OSB3YjpjyLpTjEea+zh9UTVu5yGP30c5W9N1SAB
         x9qsX6v9Ea6G3gF57oR7Pm0prLvT4toDMXALe2Zvb8I52K2f9iMFnDZE4MODvOvw/3q6
         dUCg==
X-Forwarded-Encrypted: i=1; AHgh+RoNtCK2ZH9BK9DV2g2kzWT5th/KCZIdsLcpbg/LScJiOPVdnE8ODRyRihsTKi/thhg/fst3yO+xQM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXqgc8TPHIAB4Fhf8vbmBu1lXrVhJFoOiSRDvtS0c4YwfbbPdL
	6jpLD08TrCgJTERWRV+Xud76hMd82ZMIvNJGGrUykjRCLHuHi7zBj8OsoeYcEcnZMtFEaoOeCDu
	FxXHhXK9prG8Hh0On5n47mttbfBtVGE4=
X-Gm-Gg: AR+sD10H/8gwxclX8bXYCCaSffNO9zu8QWTvcHXbDBjtCuWmi75fYLcQkRk6RtGCrN5
	CJxUsLybcC+/dEslAT3oEFsHR0794z5cj1vAF3TmqPdRY6iRFdMFV49siNJ9jhpIaq4hyb+r7K6
	Yf62+nnnokLbgEIWzkgi+rBw4Z5xjvxO2v4O5gwFulC998R9NjQph80EIm69s2pN/34D/UgLeWv
	xEPPUu+UBFFZKwBniq3xGV1nhOmVuuXg8uwnRhQluQj9PcbTZC2gx1bXKViaj9Y/BsyFl8hf0Wt
	LYLuwgwMPNK/tB8Bh2SVlkeRNSgF5UBF3nIUactudLj4YUXQ+EJ0g39UrA3zfYn2s01JRy+hWRg
	s5+ndIfxpyw==
X-Received: by 2002:a5d:5f8b:0:b0:481:4761:45dc with SMTP id
 ffacd0b85a97d-48160715e78mr24767349f8f.13.1786841045770; Sat, 15 Aug 2026
 17:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806184254.3790858-1-nphamcs@gmail.com> <20260806184254.3790858-3-nphamcs@gmail.com>
 <an85AJ8auvXQ3+nk@yjaykim-PowerEdge-T330>
In-Reply-To: <an85AJ8auvXQ3+nk@yjaykim-PowerEdge-T330>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sat, 15 Aug 2026 17:43:54 -0700
X-Gm-Features: AcwNN1U63Z-1-cQDWvCFzi6HzhQd1KBrn1HsOOVGYJ0ezMThDvyr09qu6TnkhIk
Message-ID: <CAKEwX=Mrdk+6WF0s6gz-5N8rNPzz3gEgUF9SeTB4O78zXQcEKg@mail.gmail.com>
Subject: Re: [PATCH v3 02/11] mm, swap: support zswap and zeroswap as vswap backends
To: Youngjun Park <youngjun.park@lge.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, yosry@kernel.org, david@kernel.org, 
	muchun.song@linux.dev, shikemeng@huaweicloud.com, baoquan.he@linux.dev, 
	baohua@kernel.org, chengming.zhou@linux.dev, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	qi.zheng@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, riel@surriel.com, gourry@gourry.net, 
	haowenchao22@gmail.com, corbet@lwn.net, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 14, 2026 at 8:49=E2=80=AFAM Youngjun Park <youngjun.park@lge.co=
m> wrote:
>
> On Thu, Aug 06, 2026 at 11:42:45AM -0700, Nhat Pham wrote:
>
>
> > @@ -537,7 +562,12 @@ swap_cluster_populate(struct swap_info_struct *si,
> >        * Only cluster isolation from the allocator does table allocatio=
n.
> >        * Swap allocator uses percpu clusters and holds the local lock.
> >        */
> > -     lockdep_assert_held(&this_cpu_ptr(&percpu_swap_cluster)->lock);
> > +#ifdef CONFIG_VSWAP
> > +     if (swap_is_vswap(si))
> > +             lockdep_assert_held(&this_cpu_ptr(&percpu_vswap_cluster)-=
>lock);
> > +#endif
> > +     if (!swap_is_vswap(si))
> Hello Nhat
>
> Does vswap actually come in at populate time?
> For free clusters (dynamic ci),
> isn't the cluster freed immediately rather than going through this path?
>
> If it is right, then just validation seems good enough. (assure vswap doe=
s not come in)

Acked. You're right I think. This got me staring at the code along
this direction, and I discovered another code path where I provisioned
for vswap's sake unnecessarily (cluster_reclaim_range()) - will fix
this in the next version.

Thanks for the review, Youngjun!

>
> Thanks
> Youngjun
>

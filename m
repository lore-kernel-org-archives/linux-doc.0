Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE1B31E856
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780332314; cv=pass; b=WddxX4HO/6O6K/YdUeIX5Dp1o9/w+S8Op902hbI5q21DAivz1mpZOmuHcPH5dGTzCU2vyVIbrF6No5gjhfvU3FRPuZ5aa19Ytt84ykrjRLBPL6O1NHLJav7fuF7NJwrr31Gv96VU1HUvDqywrYzZS26+V4rvIfRVxe56vmlVwV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780332314; c=relaxed/simple;
	bh=SuechEhgIbIp9Ei8g9Ubfks3HTEaKTHpGRK7meqRSP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LunFtcAqTfgTH4Qtw5TBL1ZiJkLc4YPI8V1yRP42n5jmacCDLhQHmKOvofpEdw0ki+J7pAXB8ZF9Z30E1sYxCjBzhWZ7mhYTyS6cElBmxEW650X4MxazJ6w0hci6DvPiSZbTTnBYMx+UcYbxJcPF1Srzth7BjSkYZ+8FxW02O8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zosvu4oc; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zosvu4oc"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef1198766so1814191f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 09:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780332311; cv=none;
        d=google.com; s=arc-20240605;
        b=MRlGhs1O/HS5m2JrwrosejSbdogt91YyaMDPrNrXhkSEFemqIsiUJDC+eaobTlCuEN
         r8joCRxBKpTPvLUXN526zx3aMgS/uyZWvz9+xBmdo3wIfE7bF7HfTh25ziTToAuB1jaa
         57gNqM/o+V5LBOEXoWoRjfYje9sBAZnj/ictyncjWS0CPIfw360SEFsnaJfkyvT3dAXv
         lhedBSKoDNB0ysGyUGNeQRbjPMGSUoSzvfQ4NmxXcoMp8BhQvD7qhUoMmpygAVHp46MJ
         N5NM9L6oII7JAY2disVv+VLySmNPPT2hnxzDV0wbAksx+h0Gxo6HMnCbDX10fpNW7WUP
         TIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SuechEhgIbIp9Ei8g9Ubfks3HTEaKTHpGRK7meqRSP8=;
        fh=YCGeTy1cyRnvuLIi+BaJ51yrGgtFTGjq/DsxF8BYNj8=;
        b=WYf+25tRkiVZ+EY54y8bq/F4eoblQPF9QOjsGjd2frDYHn/F16slm25JDeJyx9Vnyf
         q+Z4pbj3u8YFLJndHHS+xtjKVhuX92sM4nULYy8SCWXqgoAZvUB2NZqTX8NdpaOxyesw
         pg0Jgd7Wc1m2KEPqyE7zuIbqvfOA0WdjRHhn6lvlGPWO1/Cug7C8Amfz1vhQPK8Qg+bW
         aOdyq5N83TJzTZ7EY5X2YhaEojF9PIKN1znkWBSHX3maXOa4TK30EQ1iUAT1nqu3mDAn
         DdXBE8fxytgc1oTXyDjZ1SwRNLpZR/iMX3j4krpcU4ZEKv3FDpGrNyLVfPuIzbTzX2VD
         +7Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780332311; x=1780937111; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuechEhgIbIp9Ei8g9Ubfks3HTEaKTHpGRK7meqRSP8=;
        b=Zosvu4ocCarAk+Grhx2z8xURDwVMSlR2hDHmpFhnz996KId3/JA+lJFZeGhVbLPvQ7
         MR1lOxNTG0hE4+3Qt+MEP+ifpY58Jn1UeWjJDlx7nMz/w4Z/L27ze9EHqJhlKcZVMa+8
         jemFisSZNXZ/T7Z6qm+Js9vjh0oR4jjq0ElHY1Stjuq8OuavaSdopDH41hl3gh1dxZxJ
         5KC7UjqMCbaXdVxXjMqk4VrbAmkGe0DQc801XV9KFFQhtz7AyGOLD8CVNcaUJy57vT6f
         TyUL/vU34x9wMnc8N8vCoro/DqgotZ21thmIctJI761mYZMh12/JwEf0X2VKIjup1dm7
         YQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780332311; x=1780937111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SuechEhgIbIp9Ei8g9Ubfks3HTEaKTHpGRK7meqRSP8=;
        b=sDH1o3aQtvz8+nJZqR2Ip1tzTCKW6p8o/gFiCy8FdoTblUR13fYsMccMx4YVZKMd4q
         StbfIV4XUbPuBU0Q36eyzer4A5Y+fk6liPRe1jsKh9RsfoDLF0pTaTWtSX8xfONTMEle
         QZMQaFj6uSdZjtnBuJxDEC3mL8i3JHqbbGcvcYVzmB7uAIfhtJvec3PJM1ZOi/yy04MS
         TNU9S1cgtDCBkwOnMRXHiM6aoI5oL4coV7muPySWAtd3Ev6nH70Qp3yWqkKmmvyhDsKk
         B5WyqBIdAIwZrk/M9HZaXH18nL98/RBqzUOYSJtKIe0Ef1bIe7aZnu85JXyqccn6/1j3
         4jXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8eLkPJxvkqjHfgnlqyuxwkaSDtBibEDjtGEDTgr/cYmeHqiTS24Kv7KOeY9YXePi8Rfg9Y3htXrjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLkeHrM1AGwUhdtHDDbnU8d5H8U1sJhJL6DGRRI2DhIpRB5IEE
	dqoEIQIGBDR00OOXk9e/ufrzZ+68Svpoy1JwtA+YaFcxlDAOVdpTwC80s0EBKWxIK3spiu3jg+8
	8G7oemFGcYNWz8jUxcfkORUZrn1t9uFY=
X-Gm-Gg: Acq92OGp3LzOqSXBQ5P4Uu6YS4Dhf1qQdIzVw2RBn6JtJGEi5L1U6w2dtm53Y0oxCL3
	ElmIFEJc2IsbaK5iH1dSpU16VDjR7OLnyJnj0Flev8xIbVdKbVZg9uUN48NazuF7QwJ8FAlp/xT
	Uo4vu7GDMxff3u8VdQKib/DyVb9EkfZLbnVfp08BHu0ljREXLIOSi4L4YieiKPeMXiedqNIeKjT
	FikjcCrupNclgswFkqYzOeOMBtfek39Yrz6TGj95u6SJ+tg1czE8BwsEm5ndrCMbAMf53PVR25p
	u83YKnuVqZ5AxjzswmqDpe7OC6RwpMKKaXCdXlkz4MBEkVJQyw==
X-Received: by 2002:a05:6000:1611:b0:45e:8526:7dcb with SMTP id
 ffacd0b85a97d-46018cde5c3mr378861f8f.7.1780332311119; Mon, 01 Jun 2026
 09:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526114601.67041-1-jiahao.kernel@gmail.com>
 <20260526114601.67041-2-jiahao.kernel@gmail.com> <aho7nepN5jZtKmef@google.com>
 <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
In-Reply-To: <8c0e60e1-5713-69f0-a687-088c87e75764@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 1 Jun 2026 09:44:58 -0700
X-Gm-Features: AVHnY4LT_5ehEfmIR9cnGphIbcSEKQX4RD4VzS-3orz-D5X1L6ZBlUnrbx8nVYA
Message-ID: <CAKEwX=M5KiWc8ZZTEXCXtxeBrQho3Gs-JnKmBB=YNUkp=WXaKA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] mm/zswap: Make shrink_worker writeback cursor per-memcg
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Yosry Ahmed <yosry@kernel.org>, akpm@linux-foundation.org, tj@kernel.org, 
	hannes@cmpxchg.org, shakeel.butt@linux.dev, mhocko@kernel.org, 
	mkoutny@suse.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 1, 2026 at 4:07=E2=80=AFAM Hao Jia <jiahao.kernel@gmail.com> wr=
ote:
>
>
>
> On 2026/5/30 09:24, Yosry Ahmed wrote:
> > On Tue, May 26, 2026 at 07:45:58PM +0800, Hao Jia wrote:
> >> From: Hao Jia <jiahao1@lixiang.com>
> >>
> >> The zswap background writeback worker shrink_worker() uses a global
> >> cursor zswap_next_shrink, protected by zswap_shrink_lock, to round-rob=
in
> >> across the online memcgs under root_mem_cgroup.
> >>
> >> Proactive writeback also wants a similar per-memcg cursor that is
> >> scoped to the specified memcg, so that repeated invocations against
> >> the same memcg make forward progress across its descendant memcgs
> >> instead of restarting from the first child memcg each time.
> >
> > Is this a problem in practice?
> >
> > Is the concern the overhead of scanning memcgs repeatedly, or lack of
> > fairness? I wonder if we should just do writeback in batches from all
> > memcgs, similar to how reclaim does it, then evaluate at the end if we
> > need to start over?
> >
>
> Not using a per-cgroup cursor will cause issues for "repeated
> small-budget calls" cases. For example, repeatedly triggering a 2MB
> writeback might result in only writing back pages from the first few
> child memcgs every time. In the worst-case scenario (where the writeback
> amount is less than WB_BATCH), it might only ever write back from the
> first child memcg.
>
> Similar to how memory reclaim uses mem_cgroup_iter() (via struct
> mem_cgroup_reclaim_iter) and the old shrink_worker() used
> zswap_next_shrink, we need a shared cursor here.
>
>
> >>
> >> Naturally, group the cursor and its protecting spinlock into a
> >> zswap_wb_iter struct, and make it a member of struct mem_cgroup to
> >> realize per-memcg cursor management. Accordingly, shrink_worker() now
> >> uses the lock and cursor in root_mem_cgroup->zswap_wb_iter.
> >
> > If we really need to have per-memcg cursors (I am not a big fan), I
> > think we can minimize the overhead by making the cursor updates use
> > atomic cmpxchg instead of having a per-memcg lock.
> >
>
> Because mem_cgroup_iter() always calls css_put(&prev->css), we cannot
> simply update zswap_wb_iter.pos via cmpxchg() after calling it. Doing so
> could lead to a double css_put() issue on prev->css.
>
> Therefore, if we switch to the cmpxchg() approach, we wouldn't be able
> to reuse the existing mem_cgroup_iter() logic. We would have to write a
> new function similar to cgroup_iter(), and its implementation might end
> up looking a bit obscure/complex.
>
> Currently, this lock is only used in shrink_memcg(), proactive
> writeback, and mem_cgroup_css_offline(). Note that shrink_memcg() only
> acquires the lock of the root cgroup, and mem_cgroup_css_offline() is
> unlikely to be a hot path.
>
> So, should we keep the spin_lock or go with the cmpxchg() approach?
> Yosry and Nhat, what are your thoughts on this?

TBH, I think the spinlock is simpler at this point if we need to do
all of this explanation to justify correctness of cmpxchg :)

That said, if memcg folks feel like an extra spinlock per cgroup is a
bit much, we can go with the cmpxchg() approach. Please include a FAT
comment explains the compxchg() approach's nuance in the code though.
Speaking from experience, I will forget why it is correct 2 months
after the patch lands :)

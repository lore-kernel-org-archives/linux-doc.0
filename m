Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B22C4FDE61
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 19:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790017226; cv=pass; b=YvltMcyxRDdQJCwfsuMEgUa082RMd5uJMb9vcUoHXsPtGTr6dFK6MCXARif6XZob+FZKiOqIN9OBaBTCVSq/Xo+WIjfQPsu7Gad1fDjoxcZsu2KsZlG907DvNzo2+hWAi1fVtpjxpUxH4XU5O0HGDelA1ERRN3tauU2RSMgTnPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790017226; c=relaxed/simple;
	bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9+6hwRqMtm3nZ8dPbS6cbAeqjXH/gTH4HR5KdC5MmkW9ImrvgzeMIIsa8bpYMnvTthi5oOQEFDDpUXUkdX45K1iwjH5NvSTO+n/27SpVMM1uMNP5NWDdVRYU9XgQzxB1SlLSpME6ngoABKVnB8NGUQe1/vtyuX9d/d1XBZ/3A0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2VS8VpQ; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2VS8VpQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ca5b0d6so24993235e9.0
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 12:00:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790017223; cv=none;
        d=google.com; s=arc-20260327;
        b=ZLdaN1U+P9umnFljLD6cpM3Faxh8kwJBNMhjDfiNC2qCUVnyrV1tlID+UfdpjRR2hE
         hKDj6ueoeG8zmEEvIyAqwCiEmEwBhzjPrHy2Y3HlPrkdHGu7Qg42oXhbgQG0oNoJA5la
         qLFCxiOqitr1HuKPoRpxlSUiloHp+0j6WwsVvAkWs+Iny++jQYAQ0Tai7znLiSuG5Pov
         F8jb5vN2YO+UygG2fFKKoZbPHoxMnH08J3CE48HcxvbjFWNV4KilQGodwk80ytM56AgS
         P/Fk5TbG03/eq2pPv4D5zVwieJkrnlz2JtnMfsOEqaonqXqfWN9YStukkvEW8vPzIYO5
         6PwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
        fh=0X4sxHBbzj9Pw8iWYv4ohJ3DhnJ9NqUtKA8v83IFVcs=;
        b=n5Ew7Mxo5+8OR2A5QOFYx0NmPhP3aULrG7l2GuW81T8DKtMRq0vP4Wvi0vaIxvWDry
         xlMb1OVdi3gu4sHkdZWeCIc8SAV2pY2ZNcrhtM2CN6si0DsZIjl8SSNQsDBQEeCanXpU
         djWPQEROFchsIG1PTY95NVRtXg9C6PxHUX4R1iMhHs4+8UItP5ykNZgLUlaG3yTciAOj
         tiatjfUyinFXrxSYwuMZ004tnRERy5P4+/cNQ/ckl4ZPZBMM5dZUtfCqMfJ13d3pd54w
         JUB33nIeGkxNi6dwpMe4uIrOukYr93GWTKXW/fOcpqOFzQsTA0CcDXJ7LU1HWW+Oa7xe
         oq2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790017223; x=1790622023; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
        b=s2VS8VpQ3eYssvPVlbaujURZpRWPAQGNU9KcTLSkpY+ZnnOY2jCaY14bXz3ALJJ15X
         pZGKSpmjq73FEGKs/djzCGNWNUInxox2FEt1uyC8tuTARtaaGYDCs3aWJBUZdtUXHEvY
         0sYDVVPlE+uhFMlUoRZtOT/jCowFnJOVrxu1ri3X4wYBghhcxp3A0bjeFhPiR9iUGSwZ
         meve8EPQ6BkFTMuVYn6dkrdGxYyIqGjUwacvYd597ByuUlvx0j8ybg+pF8jdiZDF1LD/
         Iz08xourpXAOUk8sP0AiroyYZK2/q/VXUeGMQ/VEVmGFiS4g66dgAOpE16Xg8mpnn40K
         q2Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790017223; x=1790622023;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FeFO3AREa1i0Oy9rChHlku4bTopkweu2G7chupZtHVk=;
        b=V43MLovpmdz8/ZUrTZwztjYvQ2h+HgrM73dBAhj4zj/IVMSxDWjAe+qoFTaW7uLc4H
         wvw3RPChtigsYeAQbv1DdyZI57OWFZ9JdJhGV3+mlB4gaT34R4Fs7S9DZiRt09wTZkd6
         LDFUjaY2kmH1xQ8vSWJk8L6SZSHOhxL6Wa7eZzOeH4mzgQKBMFw4UUVkvSyAwx444gj9
         EusNe9vxekVStArXaEU6aCpB1Hg/288iaEuvOjT3oC5IHNynDVpbqk56/VVSPlm5tjB5
         oKyIBIPOy78jc+1lePMI/nF2QoSZjA9bOsK9iOelXrhSc75q1LdDwJvbPpUA4CP6SH+E
         ZAXw==
X-Forwarded-Encrypted: i=1; AKwUvBzVWr0IRvLgur11PsUZZaZZATIYvhaAOn94CS/LvCYgZsyaDeJKyUUQ2yB+9MH4vFP7DGWoyj2S/fQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n5TqZuyhDdhc5BSGRUeVz7RR8FgLsxzc3/z0YwH11pmGnU8K3U
	pZjCXlDFjrBlpqCG2DAJ0gx9yfpUKcRxDCdXMxr1f6RQEplQP8faiSgguxuVEAKOs1R0UdpTaAn
	YpzwMXJ6GssjYNpjESWsasaPbnSobIEw=
X-Gm-Gg: AYBFou008nVSiIt1X6xNCH1vLPKI5nTX8+9iiknaco0kXErmVEBZ7aGw0vw+980zrwu
	Aaewjp1x1yQNnCJPWBHJzABI6SUPArY9DRwOsaiJIAINMEatGMtdG8YqQtTmV4s9snWjzCqADtz
	8PnlCN6zl3yLtyFAVfsM7qpv2HQ7CbTf5YYiL+jir+XHme33hsmJxqPE5/7s6tum0E6qv0AYdyC
	USDBOWS3xuhLy0esWJ/8cNiqWk6AHMPgtoR1Nt+RGuqD/hzRgLy6wrgFVKSa6+Yvl4sYqnOesHV
	t23iVgM3pp2WE8oGpV+8pIxu4PLyGozA3TZiM41izfZOcb0rIBi+cJATQARbJxZfMDORjrZ5IyY
	4QCsOkQtGlXg=
X-Received: by 2002:a05:600c:c8a:b0:49d:433:c3b6 with SMTP id
 5b1f17b1804b1-49fc5743da1mr174500025e9.27.1790017222438; Mon, 21 Sep 2026
 12:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918180241.3424851-1-nphamcs@gmail.com> <6ab13438.71f81b7d.15fa6d.002c.GAE@google.com>
In-Reply-To: <6ab13438.71f81b7d.15fa6d.002c.GAE@google.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Mon, 21 Sep 2026 12:00:08 -0700
X-Gm-Features: AcwNN1VSiww_CbRe6xoCT3Rgd63gTKNcURFr8FJ8W6bVgDoo9VnivNDHr1UO828
Message-ID: <CAKEwX=NczHcGVrGsArjV34Viv95kKbV3jo+c57BdG9pHc087GQ@mail.gmail.com>
Subject: Re: [syzbot ci] Re: Virtual Swap Space (Swap Table Edition)
To: syzbot ci <syzbot+cid08c37b8dadb4c43@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, cgroups@vger.kernel.org, 
	chengming.zhou@linux.dev, chrisl@kernel.org, corbet@lwn.net, david@kernel.org, 
	gourry@gourry.net, hannes@cmpxchg.org, haowenchao22@gmail.com, 
	hughd@google.com, kasong@tencent.com, kernel-team@meta.com, 
	kunwu.chan@linux.dev, liam@infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, ljs@kernel.org, 
	mhocko@kernel.org, mkoutny@suse.com, muchun.song@linux.dev, 
	qi.zheng@linux.dev, riel@surriel.com, roman.gushchin@linux.dev, 
	rppt@kernel.org, shakeel.butt@linux.dev, shikemeng@huaweicloud.com, 
	skhan@linuxfoundation.org, surenb@google.com, tj@kernel.org, 
	vbabka@kernel.org, weixugc@google.com, yosry@kernel.org, 
	youngjun.park@lge.com, yuanchu@google.com, syzbot@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 6:42=E2=80=AFAM syzbot ci
<syzbot+cid08c37b8dadb4c43@syzkaller.appspotmail.com> wrote:
>
> syzbot ci has tested the following series
>
> [v5] Virtual Swap Space (Swap Table Edition)
> https://lore.kernel.org/all/20260918180241.3424851-1-nphamcs@gmail.com
> * [PATCH v5 01/11] mm, swap: add virtual swap device infrastructure
> * [PATCH v5 02/11] mm, swap: support zswap and zero-filled swap pages as =
vswap backends
> * [PATCH v5 03/11] mm, swap: prepare the swap IO path for vswap
> * [PATCH v5 04/11] mm, swap: support physical swap as a vswap backend
> * [PATCH v5 05/11] mm, swap: enable THP swapin for vswap entries
> * [PATCH v5 06/11] mm, swap: write back vswap zswap entries to physical s=
wap
> * [PATCH v5 07/11] mm, swap: reclaim physical slots backing cache-only vs=
wap entries
> * [PATCH v5 08/11] mm, swap: only charge physical swap entries
> * [PATCH v5 09/11] mm, swap: add debugfs counters for vswap
> * [PATCH v5 10/11] mm, swap: defer memcg_table allocation for physical sw=
ap clusters
> * [RFC PATCH v5 11/11] mm, swap: back vswap clusters with a VM_SPARSE arr=
ay
>
> and found the following issue:
> KASAN: null-ptr-deref Read in swap_entry_backend_has_flag
>
> Full report is available here:
> https://ci.syzbot.org/series/713f2473-328a-4c16-8bce-63005d15a338
>
> ***
>
> KASAN: null-ptr-deref Read in swap_entry_backend_has_flag

Ah I think the bug is in the RFC patch (the one that does the
conversion). I was too overzealous in deleting checks :)

The skeleton (cluster struct) itself is no longer freed (I just put it
back on the free list). But I do free the vtable when there is no slot
used in that cluster. It's one invariant replaced with another -
"cluster freeable, but if cluster exists then vtable exists" becomes
"cluster is never freed but the vtable inside it might be freed", so I
should change the check rather than just deleting the check.

Should be easily fixable.

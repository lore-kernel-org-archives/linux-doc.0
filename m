Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B6B442B3A
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 10:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838634; cv=pass; b=So/AWPK95hkWUmE18uMYwtgx0G3OHkeSG4qt6Lk7p9/o+9jnVYyD2Xv9dB+CW/HmTuXxXlrAYqATHv6mQZEluwxpWFZJQ6kpAw3+EPTNWIuHj0hMtgZIuxodjOH192MKndnxAMLZvpTqIDTAQVcs1xT9LcqyJACxSYyqvR9jeVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838634; c=relaxed/simple;
	bh=8lju9U2W7+LSdWc5IALcPW9k6NcSnHsFf54GqQorIHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aIJ3Zo5Pzkm9Iwv/bFjqt6LfkjdmRaxVHWCnT3MI4Ti2X7NuZioDNEMHOVFw87+1RWgKjZEJdTlaOqzZDJrpG6QevyNb0OARD4cBCLk8Z0ZTUB7iPwGCzRVl2pM/YSVriJk6ROi6frRRN3i4jLR1oxOm50pF1p+afekvIm4fx8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxzSCpKl; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxzSCpKl"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39f9d4bed90so6882261fa.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 03:17:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785838630; cv=none;
        d=google.com; s=arc-20260327;
        b=iCMGvKPBJ2YxaPBxV2kNtijBGkng5B709XsFZc4QW83YxfcY5elZDIoansG+7+JvXr
         d1G7Klr52ONJbti7Bs/FR0iE6stZMH+nANWqp63Zj4K+xrpmdpwGYzGyGxucRa4DD7RQ
         ZkJdQGNYiln7d5zDwG+2cwE6z2M4TM10HVL+wIfkHLsK9DKLnvihdgDtKf8c0NmM1utS
         TacLyrm3KSYi/hMlOEqMq30/s2XJDPiRlu69t2gWKKHVSg7f8ruoaL3NuecxdqTi8liv
         r+mLyrbC1EXN5NCsWN4+ikGNe60GaxVm0qfvT4rhvJuCL4z8up6n16EYpxO4N/IkHJTf
         f9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vkEoZO2efPEAJ3sLsu1MthIA4bsqPb/mDlCDSaYXZh4=;
        fh=E1TSMumzMDoeuE5azjW5etq5z9QDl4A/cMnTyUZPzjU=;
        b=rAq9Kv8/xE/Df3YVDVchwr+4vI0ypHwS3CKJAtemE7gkn8o3tQ5sz0R3OIPeFuGlfp
         mUV53YnYsItC2pexO8ucYk86Pkn9yRG6fOJbySNzqEl7BUf+5mPuJhO9q6DwKi4GXiAZ
         Npgr8ew2681ikUYKhKb/Voy3j69tgtcVmWP1eod6z5hQgjRPAav0Y7OvUy8GcVqjMBCo
         c0W1cdGHaEBAhcInH/n779kSl3KT/r3TheLO2eoXeJkJJVvPwWa/0V3fn9qpTesz9M7e
         BBsDb+w7aQccHuuKVrQMZwa9V190+vH8371kS4AJ21dPBSPTgzZmPZxQIcehBZFnL3u+
         FZEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785838630; x=1786443430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vkEoZO2efPEAJ3sLsu1MthIA4bsqPb/mDlCDSaYXZh4=;
        b=mxzSCpKl9I/HMYRUIcivIEFvXzGp3hm7kOVI7hU+1oD6SKRVWeMQDOTInYJROz9efP
         ahMfrLXGcxH6+epChOI+k4ZVWYk4IZEi9Q3Z9mEp0FArD9kFQt5B2bi6UGyfuyvxw5cG
         cgiUsYZdIRPB2Z0WN6pB6M0XEi+npmnM7wMoSDb1oQ0/+U4k99B66BkmcC6OO1Z4Aw7U
         rVDZxw4hqgvlfCFtHnrKCb88t7Ii7dtj88jvop3g9Rwq/3VUPmgzoH83LvKAt0ahBk6i
         8HpezMh3DnnpXotBn3ruf5UXucYIFKzrQa4KaVzMVLdPi2iDHEW4/i27xEmEed4AXVb5
         3tEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785838630; x=1786443430;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vkEoZO2efPEAJ3sLsu1MthIA4bsqPb/mDlCDSaYXZh4=;
        b=UEVE93MhbK7yUfFdqqyRBPwnFej6f/VdmNQz+V0bkLQGQWlRJ6wl+h4FDCTFec95SH
         T2HS1P/lWnqxa62aI/RY+YMloMHzCmrdte8m5uILt0j05O0h3oNE3n/nV9h/Is/purOR
         5EaynPuXQD4s6nzlLPeUFzLn5hsgaOsKGzffT8XLQ2Ww7iuV7hTKESosvIpM7HO+lfD/
         77X0q2FAMCa3CeMhcmupoZwfszqJsWzAXFaun4F6NvX1uiYoHhTy96ZviWAyBSY5il5B
         S1uOG6yjFim3Eon1IaDEBMsjsvESKhF8bpC/kp9yRPCjhGZ/+Hgm/bM/JFdDeHCkqFWt
         ckdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdgKUrdzzKcZ0XzOu5Z/AfRm1SeWaatlnY0v7o8rBhm0pCqZmM3sq2MjFwPVRwPiYC/DAfvO7vncM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfxdrPx709RLY66jWh4FNLgkJAgt2T3cR3c40B3ayKpzchfGP
	DTXC7ea5B0/9QbcVG4uRGtjqeq/yeYECGVVxxUtfDBuBBvq5AGd31G/qTUWSIsufghZVGyzWVLE
	sXy9JcLpe7NL5Cqd/5lJlzdc1XrqYwLI=
X-Gm-Gg: AR+sD10TwSGijxamvGyvmgQCLlgOtSs9z3j4IR74zDr+5GtPkGPbsKKRWO0ZUDyY53U
	J+PyzHM/m3j1+0G/tWsisBbB4xgMGS0DhJiqA5jqc6/dcEWZqG55pUCS0GBXlgDlBZ1Tm0MCm8o
	fUvsNqPABiK1MHKjkQgiSoyrWp4PYAXWQYZAubJ4bvQfre/rdf8cH4LQSOrZirSbTcs1n8Tdrq1
	VhKQv2OaHEDWzTlxPdBiyZzeUU+5Qc6qpSNzN2ubbAXd46asKoutoavHS6C+s9jGjkJRr1ihTf4
	yZJxix/qCkPWPgOGuUN6k0koERm0qbCD3SMYgakBbJcslAUqtxWATTFEDW+OFTmvqWRBnf5Byw=
	=
X-Received: by 2002:a05:6512:1113:b0:5ae:c3c6:245f with SMTP id
 2adb3069b0e04-5b2f2816770mr559124e87.7.1785838629504; Tue, 04 Aug 2026
 03:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-0-2bc72b4f8730@gmail.com>
 <20260708-ch-swap-series-plus-folio-lru-cleanup-v9-2-2bc72b4f8730@gmail.com> <anG0QwQddFNo8PKJ@lucifer>
In-Reply-To: <anG0QwQddFNo8PKJ@lucifer>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 4 Aug 2026 18:16:57 +0800
X-Gm-Features: AUfX_mxjUrqj0tZCczAcQuPfenNF5iSWoMzSQsnx8UpwFtw0qufa8LonJR7O5MU
Message-ID: <CAJxJ_jgdXA=B38huxC5hoevRFhqsVFWT9+Bt5R4zjJ3b6Ya58g@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] mm: rename swap.c to folio.c
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 5:46=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d19822d574fd..c3e535ca4bef 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17085,7 +17085,7 @@ F:    Documentation/admin-guide/mm/multigen_lru=
.rst
> >  F:   Documentation/mm/multigen_lru.rst
> >  F:   include/linux/mm_inline.h
> >  F:   include/linux/mmzone.h
> > -F:   mm/swap.c
> > +F:   mm/folio.c
>
> Hmm noticed today that mm/folio.c is in the MGLRU section :)
>
> This doesn't seem correct - shouldn't this be moved to the core mm sectio=
n?
> If this is already in mm-stable can send a follow up patch for that?
Ah, sorry for that, exactly, should be in the CORE section.
After mm/folio-compat.c

F:  mm/debug.c
F:  mm/folio-compat.c
+F: mm/folio.c
F:  mm/highmem.c

Not in apkm/mm-stable yet, which one is better?
1) send a small follow-up MAINTAINERS fix, or
2) send a rename commit, and could fold it into the commit.

Best regards,
Jianyue

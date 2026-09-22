Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACC05625E1
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 17:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790098389; cv=pass; b=EF2oy332XjEOFa4UrMZpzWGxDIHy1W1R1VXd7fjU8N58Lad0sXul9K97GsOi0ykKZhPItiAunmklhELsRqeL0OHir//zuQaOStXHaBVTogVKHQD9tgrXwyn+gceb0MXPlTJ+Y0sNcR3t5RJoVEuSXus1cRMhSsT28CY/jf9ot6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790098389; c=relaxed/simple;
	bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QzWkTWty+M5Avb54XMnTkwmwHTf2fuojtl/r/PrtXyAYpmBw1Apc3T7uIPVRSX4ud5nPIv6BE8lxV/uTaPKM1oZ1zZcaIJbTQneLl8jcIlABXF9tD9gO8wNN+6QvR23bFMpKfEUX4pZu2X9pBC8qk6Ftvr0VucmqvB3vfPKHZxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bqo5f6rQ; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bqo5f6rQ"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48439feca17so167436f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 10:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790098379; cv=none;
        d=google.com; s=arc-20260327;
        b=UBp71bv0oi2E0TMfa7VqImQl/9dWXMDbx9sl8f8HpTzIwZgtQ0UFdqAjL8RSa7dKLZ
         bZyG/1cQjrJ+2geRhlb5LTtKywkDGAlpkzeZITuKpshlPwU8JDdQsg32n4vWMrz2dEPX
         D3hJarY0zRVgxz1PEX30HMVCEArRmfpCZKdpWiIdNR+S+4oP6EFismF+AliDZonPb9Rp
         qHxv34joGyV1CRnpWsj/2Rc4dXMeGtiePwjIlydpeE3j3F+4Zxb9/PTHDqodckcLzXup
         oEDaCdUwCx86tuZCuvdJwELeg3zlEktGKCdY+NXguwBc5Ei4dOwk23sBrXR2W1BlHBUU
         14YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
        fh=NTaaCCxgo+dPGy7N1k4KFmwNPHN6P4K8mlCzhItbKuU=;
        b=bASi6kw0gNq1aJyj09TRcpPb6+Z6Tjux7vbzo0Y7xcFpQT4Vt1pQm9XL0YVcVkWMZS
         uHfp+q2IiU3Bi9TCCBXC+wuLP4OrlEcg8m1gNv9OLrnkr8A7YcVTsgKEN+pbEzkSsr6w
         14laVsBaG24+1qn8dVa8hw5SCAvT+CJbrFS896h2lD7dWUgxKu5ynecGVDM8lRTLKDIn
         P7W4EM52qmX0gqZRanKwv4pB4yIqydQliuX0iQtKe53PQhJIgWxJK1vOmWboY8qSeFrV
         Ur2F/a/beDu9g12hDbJeaYNBxbrGFfsfkV1KG0LRifU8RNmksutC87zVZtha/9gWQjrW
         CpkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790098379; x=1790703179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
        b=Bqo5f6rQ81SdJcMHzW6h+aCRwcL9/oII0H/XLS8t6j0vgloBmj4IaGLms37CVBWhOh
         fWGrDNwzlE44dRvX55bjReJ2ot9ZSbwjfHV80rnOO1FBzWwd20o4JJmO/3QCDtDo+KTw
         SAF7WAZxa6myBRPr9mxVaiotHwXghC8owapv6VmoL02WC5DKDs+LuZDKIoWulYqH9AcW
         yeRanmuHXW55eYCd95qNpYsfkEcSLVqlR4x4P9g5HIRGQIjXiXQtM5ZcS38GH/JS1fWO
         8ztBqKVqsfU0WZa/4m2e507cELXCtF8nloCvNtK0HPvGesNL1DM80hjXVLCT2sgMFPHi
         CdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790098379; x=1790703179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wfVY0cj3I+ZyoFfhOD2M0rQu+6sC7TkY/5LoCxxQ7g=;
        b=Oz2g/rCgHXNxd4xp2bYJiXf733RWJSvwUQCc5YF1lPGq9IwCoKElfKoybZFsw+cUI+
         eBDRARN8q+G/vqboYK/WOPnf3b/FBibUxlWgprb4xhtKDpQbXReEl3GAxWjsxNmjiizx
         BV8pwF7AexMw1ss0nv83BsqhlP9WuPZmlko+Ao2BgKt9hCZqWDBY0qOq3ZEf/qF3RxKj
         ta4IEbCi1WuTfiuN9aftgOVqIlhQ4gCGQIjn1TxPUJuh5LUECVwa1s5LR1z4sklJRIA+
         /6X/a4wAHMjiC+Ewostz1jakjFsIbUBe3Mp5/tDY+wm0CBABg9f7S92dmD8678dh6lP1
         GExA==
X-Forwarded-Encrypted: i=1; AKwUvBwHiGZKeKwHw4FmUXvZmb9pXrk/388xg+QTfpPw9zp+3UOCSi59m9Iv53jZEkKArnUeqnCdUbLrkcw=@vger.kernel.org
X-Gm-Message-State: AFuF++lLq4tYiuWeXYfLMuMfCuDh1g/JgfSkAJt7UXL70xKqjO8HSHny
	3DjdOGvYH2KlzOtOY0/gRbH+m+iVJrlh8000sNYKWrn2nVpzxPbWbruEKRL8YL9lZ7rG9xx5wn9
	UqoqGTQrB1nN/uJcVopk6n+upTK05cHM=
X-Gm-Gg: AYBFou2hbJkigno3fL5R1TIboig5sTrIXrUd7pMVaPmc+tWIVImFgwa6BBxIxP85mY7
	BFLzj9RWYYARiqDx3MgHUyx5WnJUvrMOaENMgmD/sX/XHalG10EAQ5RIbWKqoh6TWvjxiqvApc7
	Y+5ZzfVx+ckdxzUDaFvrQBaOgc6CmRmMYet5Eid+1cuTPQXi8oAFsaKo1pS4nWjrGLiN2tKzZLC
	VxW8qv5YrVAmX2duD1SrQDJ3y530pOkwvWSlBbNEXHgBK57uNVu8yv7Oxywzc9vVRnpF7wjm4p4
	+IC9SoLO0k1bU6M5xvIeSHPh42B2RPrbbprHTajUyjUsFN1HLU9lcptIBshDP2jivR9Uj3xj0cB
	6w5ItaJGa5RA=
X-Received: by 2002:a5d:5d08:0:b0:485:ac35:5c5d with SMTP id
 ffacd0b85a97d-4886705d7f2mr561509f8f.15.1790098379271; Tue, 22 Sep 2026
 10:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKEwX=MP=zuTnLT=coS_EpXe2KwXq=79yBnsEGXwcZZsW3S=Yw@mail.gmail.com>
 <aqJXx2vtbKaRLt3x@fedora> <aqLi6cIjD2wJwk0B@cmpxchg.org> <CACePvbUG1ApMzMdEzf-63rpjgGVNsRk21pT72OQGJpM=OtRUew@mail.gmail.com>
 <aq6cVXPLUUwJA7-2@gourry-fedora-PF4VCD3F> <CACePvbVaPDnva8X-Xmz84r7j5HjTuih-w5phpw7cerK2uPnK6w@mail.gmail.com>
 <aq8dja2-timYBwyB@gourry-fedora-PF4VCD3F> <CACePvbXudjxQ5vrrY4D1nOXKaFNQUn-tL+p3O0zfxtHXK99ojQ@mail.gmail.com>
 <e879ac65cb0940325736df7984c737edf1c6be94.camel@surriel.com>
 <CACePvbXThspPYD8DZkAeiJtYuMV79vGgC1SGhpMwhn4COWOtcg@mail.gmail.com>
 <785353ef79844e81a8cd97e87b00ef1f785b15e5.camel@surriel.com>
 <CACePvbXZ4i-DsmbQdNtBQb79y59uwZC9J8qHD2wTWpcYaet3LQ@mail.gmail.com>
 <83539be885f15bb567b30264f5f62e718f4a9fd0.camel@surriel.com>
 <CACePvbXZQERwLF_f2FYTHsv--kq_-Aw2vVVFF+z+ovdnsHy1bA@mail.gmail.com>
 <a75b2eac4297ca6b238dde6f9246d2c1807b935f.camel@surriel.com> <CACePvbW_-6M63_a7Cp+09dTmpHeMEdj9VDQZf8g8qoYKQD=wvw@mail.gmail.com>
In-Reply-To: <CACePvbW_-6M63_a7Cp+09dTmpHeMEdj9VDQZf8g8qoYKQD=wvw@mail.gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 22 Sep 2026 10:32:46 -0700
X-Gm-Features: AclHuK853Cv8o08iYHDa9EpXynqoJX_zkfnKle6O-lWkCRkEdpUZ-YCtbcciUuw
Message-ID: <CAKEwX=NrN7-u7gnGvWX3qfHaBQcN6FKsFP-4-k76F=sxM1LJqg@mail.gmail.com>
Subject: Re: Path forward for Virtualized Swap?
To: Chris Li <chrisl@kernel.org>
Cc: Rik van Riel <riel@surriel.com>, Gregory Price <gourry@gourry.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Baoquan He <baoquan.he@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Barry Song <baohua@kernel.org>, 
	YoungJun Park <youngjun.park@lge.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	"Lorenzo Stoakes (Oracle)" <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	"Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	=?UTF-8?Q?Suren_Baghdasaryan=EF=BF=BC?= <surenb@google.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Wenchao Hao <haowenchao22@gmail.com>, Jonathan Corbet <corbet@lwn.net>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Tejun Heo <tj@kernel.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kunwu Chan <kunwu.chan@linux.dev>, 
	Meta kernel team <kernel-team@meta.com>, Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org, 
	"open list:CONTROL GROUP - MEMORY RESOURCE CONTROLLER (MEMCG)" <cgroups@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Kairui Song <ryncsn@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 8:23=E2=80=AFAM Chris Li <chrisl@kernel.org> wrote:
>
> On Tue, Sep 22, 2026 at 4:59=E2=80=AFAM Rik van Riel <riel@surriel.com> w=
rote:
>
> Yes, I can agree on what you observed. You are using anon + zswap on
> that app alone. That is not what I originally asked.
>
> My original request was for the whole system: what percentage of the
> total system RAM size has been swapped out to zswap.
>
> Because when you have 100% of zswap out, it will likely trigger
> different kernel code path on allocating memory. You might suffer
> global memory pressure you did not observe in the single app memory
> pressure case.

What does this 100% figure refer to? Pre- or post- compression size? I
legitimately cannot tell.

"Trigger different kernel code path on allocating memory" what do you
mean by this? This reads like you're referring to post-compression
size, where one cgroup eats up the RAM of the host, affecting other
tenants in that host. But putting a limit on the virtual device
capacity limits the PRE-compression footprint. It is a very
unpredictable way to prevent the effect you're referring to above,
because compression ratio is unpredictable ahead of time.

For post-compression size, I can make arguments on why we should not
also gate it, but regardless we already have zswap.max and the global
zswap pool limit.

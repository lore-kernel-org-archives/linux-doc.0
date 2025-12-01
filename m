Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBF62F3C22
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 08:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578902; cv=none; b=oPVpx+q6xM3CIZQZRucPjfWuhFKYrqyBDeHcvJ7n3EYx/qtDJHHR4u9L3UuJ8OP7nVCXxjJm6ERc5fgBBFvk1KaQ8yEF20stQqL6dBwfRtsPOtYtfvo/JV66vnU/0QOs/QEtxEIdVccE/liD4+PWJfRrZbMWk8aN617j7kjOCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578902; c=relaxed/simple;
	bh=hPBSpKTG46AHhTHl00q8am3B9LeHzglwu5UFT1pxtp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lDjwcRsdryAYPQ7sIZBmkOXiLAmOhIkAI/nElquYAeGjV0gGIEI94c6hRE+2RROYh2FK6c/l0gCa0ThZgD6NwwGd1Uy62z1drzEmZJFQgBi8L5/lP9hAcrsRofcdjw7hLEraYL1lMu7Kq+wEuwLICvPALv7450JF78mBf7bmnws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX2A7QmS; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX2A7QmS"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-8b29ff9d18cso350759185a.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 00:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764578900; x=1765183700; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/+6NtM3DLLWRXnxxWZEHeO/9rYRoXhQJQeYTaoz/8E=;
        b=IX2A7QmSRqjBn63o04TfecantCgG933ctUnOxq5X2bQNQgqXw0SCOti1kciUSML6RS
         xRYyPJFypNiISvJuJ3GiUOlLlC70lmvovM9IQxmtgsImhvhHVUGwbhnkRMmvy6Gp8Zm8
         yrFoCfef/xCF8J1S0vB0HjRGnuxInPMh++kB+Y/ReolmIAAEixnG9i5cfs3AMiy74xv0
         erlHRcFVp0hgTzz2bdsC6EksOkSX4f+jBor32g4Dsx82YpE0fN4JzYenRTSylRnokdKR
         aO+U4/aFiXtQIuNow9P190nFPAGliGRrcrjJlKIEWI/2oVk8nKfaPT/CWTuQ7uYFrG2P
         gR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764578900; x=1765183700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/+6NtM3DLLWRXnxxWZEHeO/9rYRoXhQJQeYTaoz/8E=;
        b=osRHMwUaKQKg5UHHvnAU6SmCdXkvgAeIfHJ/kgdjiuziQe+yz4OrXcRrYiY8PP6j24
         LOgeP8bWsN8qRbKKmNZ+9jvdaG4WQBV0WeUi9TtV4oLW6UTs57weTqWRfN36lW6rdbxO
         SLbXdLXR9n9FlEuliNfAu/vcsT3OTvnYJHGnZPoSrZfxTti7yYO+srF2Gorkm9H/7e2L
         FsVRml+/Y+L6d0QwrUB+WWMI6QI8ZUVl0CSDmxyM1COS4OHaJVB2E7U8Y4WUojdGuelw
         2LIT4R2mPBEQmjOSMFJRMRnkBDrOxUv2hbDvTnMvr+HQrmiZLYxTb6oNFYjzttf72C+q
         vPbg==
X-Forwarded-Encrypted: i=1; AJvYcCWR4mtgAfEwF3bZeLwVprvDts0918BxvnGM2Z6v1Jt6isOObu8QY2uIbXqxpfkQZMNH+2x7o8LGmpI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMdYul+I7dwJx0wJKLGBx6MTiyG00x83O71OIu5R3L5l+s4/39
	brx87e9ov2hx1WJQ03feSnTuPeXO0vvKReRE7+1qZIee/xhjoRvvw1fPTwoGQkgdRaJlOEBBdL7
	ZiTDuBQL3z6n727Ci7s49X9idSSowtbc=
X-Gm-Gg: ASbGncuIiD4w43uGcAov3RUZqf53ZCWB4m0/LnosYtcUAl+k2RrSrA5CrZeNnfcOlMT
	YUaJ0/6nB7iyMeo3t1YDTc+KyVvxioROEAq5JZZ0Dc7EMrmgRnM+l2U5kA25VLJbB+zA7qyFTzO
	CPfJqEE+H45cJT90h6c+4tKRWx1CPOA4lqxzFgfx2XvY19qu7kucvs+F0pwi1t41KLW4eBjrz97
	PJNzEkzDTpp6PIqcV5jzrmgQi/tJbYDTVlDtIDaRl0JFAS3AWUBlHLXy/YID3/mS/BOGw==
X-Google-Smtp-Source: AGHT+IFXD96/9d9v41kHU9zafWGo7EMnOYJR347VJtT8t9f6J23lufIAgGzNSsFhb0F661c0jIzmDGDZIKoyqvdL+/s=
X-Received: by 2002:a05:620a:444b:b0:8b1:d8f5:6d08 with SMTP id
 af79cd13be357-8b33cfb2e18mr4654564785a.0.1764578899866; Mon, 01 Dec 2025
 00:48:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251128025315.3520689-1-wangzicheng@honor.com>
 <aSm800KsCAptVZKu@casper.infradead.org> <ti7h5cbrg5s3zf7surof3zmxb6supnl34x7hsbziqutm7r2laf@zuunap5hwsbx>
 <CAGsJ_4xJ5qMght93FQOYrk1OiJTh-wFC4e8Nd4K0A156N3ZEBQ@mail.gmail.com>
 <86c62472b5874ea2833587f1847958df@honor.com> <CAGsJ_4w1jEej+ROuLta3MSuo4pKuA5yq7=6HS5yzgK39-4SLoA@mail.gmail.com>
 <66c62243a510421db938235a99a242bf@honor.com>
In-Reply-To: <66c62243a510421db938235a99a242bf@honor.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 1 Dec 2025 16:48:08 +0800
X-Gm-Features: AWmQ_bmAIMkc8EuPZDlvVCWZK2eHKFHAp-DTCHKZFgBsCmsFNS3ZKYTH2Xv81G0
Message-ID: <CAGsJ_4x0aVkDf-AhhGbBLU=LCxYFqYoFL0ovij-vFEQeJ46jYQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
To: wangzicheng <wangzicheng@honor.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, 
	"david@redhat.com" <david@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, 
	"yuanchu@google.com" <yuanchu@google.com>, "mhocko@kernel.org" <mhocko@kernel.org>, 
	"zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, 
	"shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, 
	"lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "weixugc@google.com" <weixugc@google.com>, 
	"vbabka@suse.cz" <vbabka@suse.cz>, "rppt@kernel.org" <rppt@kernel.org>, 
	"surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "corbet@lwn.net" <corbet@lwn.net>, 
	"linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, wangtao <tao.wangtao@honor.com>, 
	wangzhen 00021541 <wangzhen5@honor.com>, zhongjinji 00025326 <zhongjinji@honor.com>, 
	Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 4:14=E2=80=AFPM wangzicheng <wangzicheng@honor.com> =
wrote:
>
> >
> > I strongly recommend separating this from your patchset. Avoid includin=
g
> > unrelated changes in a single patchset.
> >
> Thank you for the clarification, separating it from our patchset makes se=
nse.
>

Also note that memcg already has an interface for proactive reclamation,
so I=E2=80=99m not certain whether your patchset can coexist with it or ext=
end
it to meet your requirements=E2=80=94which seems quite impossible to me

memory.reclaim
        A write-only nested-keyed file which exists for all cgroups.

        This is a simple interface to trigger memory reclaim in the
        target cgroup.

        Example::

          echo "1G" > memory.reclaim

        Please note that the kernel can over or under reclaim from
        the target cgroup. If less bytes are reclaimed than the
        specified amount, -EAGAIN is returned.

Thanks
Barry

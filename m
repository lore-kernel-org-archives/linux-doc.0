Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB394282F03
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 01:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783386400; cv=pass; b=Ey0lNwmYlNNVpOTGsIqCQ4AlgqKRa8S4X7vyR/Cvsuf9WjJzn7ZIIoWn9jC/P3MnhqOgtIvxpQonObkuMasU9LoPX/fBN8QsDuBV2ZRG70dIZKCjgrAD+g0YMx0gyL4OUoucoFIg2a/e89AZJNPt+rz7hCs/cKI7HIZs9G586gI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783386400; c=relaxed/simple;
	bh=kFE7yCqXrei8DAtKaf8y10b4St0hE1tBuMS+nLI1nx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mz7BaCOXZMtTN13fKCpgVPiiKTAtoh6pLqgwC5OhICf3epoNmzFbgdbHeBC3IYghxEzPeWb/L2HrKn17HMSoYnzA8mvJA7PjL3ikOQyenCKR72Vz0aNVEmDIxZ6PRbemk2kjT2TehBi0oIiREr+GhIdDk27dbl8hoVz2Mlj+TqQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aYV09zQy; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aYV09zQy"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aeb59d54b1so2956454e87.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 18:06:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783386397; cv=none;
        d=google.com; s=arc-20260327;
        b=bqkpl0BAQClBQq5aACpdNivy/UQyomCA/o/LCLGjIGeed0OtXbGaezbmEiMlnCLmWb
         cNpvCm+Lw3SFnS8OCwuPriPcqlM8mFdwVYgUOpbvy5dZqOX3OCZSD27Iv2qjydnFrJQV
         gb8hjS8fZ1jiTeHKcBglABhYrDnQpoJw7RRaKqTRP3YUR1dutDvO3mF+amoh2gpQW74L
         IThfxP2AHnsqCMqym0PHa1AqdW6vmf8nVFGd4kuAO5eZRFafnNLeMKbT61Tbtcb5mebo
         tilMmG3F/tFE3j2A9SU7EI8+6xBJOWXpRVL7tw0Kj4yYofrFtmas0ERZFKpk64Kas7vF
         n0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5sDU6oQ6P7TaizYKEXdG1qDnlUHlJmtfi/CCzE0Zp38=;
        fh=fKk66JowJ0Ze61/Hfcsld1/E3yTMQPefuzenQam5D5I=;
        b=myP9BTT2a2C9dS9WJbikV3J9G8p9nFUTyw0mjsUBnJcki+h0QxDw1VE5mleLVwrQSV
         WwPVoVuJ77ykdGEn30ZlfBTPqA1i4nmJv7H4uS1WzOzOv1ITuzK4KJBTS8ITKArgiDVD
         XY2pAKA2UVUvdmrIFvu9SGqIVNOVFj/bjM1tOa4EZ/ev0tmWtAzwqAlOW1tqSLLDqsPD
         3+OryYdRXAJ7UZ6jdsUFlnQlgIuKjRsgx4EQjJftouScCu2Yba0I2S6Jtewa38mXvyJd
         fJW1hXZIxnZiLe9+4eYW3BLEGwnn8FALWE03YRdJ4uqqkWVP68H5OC2ixVG9MPOSEjy5
         ZQXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783386397; x=1783991197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5sDU6oQ6P7TaizYKEXdG1qDnlUHlJmtfi/CCzE0Zp38=;
        b=aYV09zQyWTqaO/C41pN3PLciamwQwPa3TiXCOU2BwHDPe60DTFz+Q/jlY3sRlx6YXZ
         QuadInYq1fr2xrsUau9mpIpc0U+sZAXxDTrYNF8VFV4yGFJj84vSfqsOckowrfqsHrbI
         ThsALAnniF7PpLS1N/IKK51K5b7ljE8xGHr0QH/1EavZ+JCfiiLxdfZSCco4J4EwBc9Z
         EHStzVbN/XZEmArJGkDhJs6AknPK2j3rXQir10tvKjGs5Dt6D3G/BZE8yq7rCInaapPY
         LTiEbv0jbL11uKO6Dt2fUzDSbzSge+IEnOkEHBia1yZ+kz8wnl7x758R6Nyq4yOh00TL
         qKwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783386397; x=1783991197;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sDU6oQ6P7TaizYKEXdG1qDnlUHlJmtfi/CCzE0Zp38=;
        b=ItJfQgxEMn+aI1X/ygyIKKvO0gJECJP1DaPwtpuaL7hw6JlutOHWAkFfNINIcqyocP
         g18l/cY60p+se/56Fe46R/H3ZwCkfdwTjCklno1zYW46NVN5/Yj5azD+6JCHds7xdAJ7
         ZykyuqjK2bH0ExGJdaWPKLUFe0YmF3g/K4CzbqxKCIUOVpng3ynxKR6o5IThAQlorqPk
         foG+pMtuL9KeGdcJfwKHdywrkfagREeRxPyCoCd+MyXZ0vXW5t5YEzl3fMwjFn4hyWqH
         U2HS+Ca8dsIdDSwKdjTIy9kk0PGLplezLKxbv2Vs/YIIY899E63onnXxeBRW1kNkBg12
         yIZA==
X-Forwarded-Encrypted: i=1; AHgh+RrkoxfI8f8P2GotnOfqMn5Oj+CoBkQDjmYGBUCo+AWfuWbAFdn0HtxY0QLkTylOdh4bWCCg3PCw014=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VAm9wE1ZRO9I5V2a7JJtkCFdx6U+7WCP1RqR5uVndceSQsmA
	U+cxZoaoSXrmFk+nmtxgvSeSIE4+fPhVKl6DmS00av55nS543qanIYhbNeZ/L0060oW9KXM+y9O
	hyQpVPq15oWo5+2oMsauOGp9f5Z/5cbU=
X-Gm-Gg: AfdE7cmmfzzMFeEixMYsn9G2Coq2zCgadeEoAsg5PsAVQVjfHO8F6i4Wv9Lyk1L2MqD
	xowExckB3RxQYTP2Y+pify+jA7CaJMkH5Lpvms9Ghpd5VWMUZouX4xoPplnei/+H8T4T73xEFQY
	cr15glqjmH9ZDrgLZ2Wk5rgQqCTLC/PN4S6Yf+l0qXmiJz8J1mfL8mMCNxkTFdIJeBH560xDSCN
	bhOpreRCkIsSvPqZ695Jy2LrbPtkhD62bVflPOrXhgA4xHEo5I1L1JY36BU3eOB9A8nRuwvB+vx
	GqcRvk08Sbv07H1l9uBYBWIm9w==
X-Received: by 2002:a05:6512:8356:b0:5ae:bb31:4baf with SMTP id
 2adb3069b0e04-5b007b9443cmr423003e87.14.1783386396730; Mon, 06 Jul 2026
 18:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-0-a028e8b5fc3d@gmail.com>
 <20260705-ch-swap-series-plus-folio-lru-cleanup-v7-3-a028e8b5fc3d@gmail.com> <69f71507-0a42-4fdf-af33-2c596657aca1@kernel.org>
In-Reply-To: <69f71507-0a42-4fdf-af33-2c596657aca1@kernel.org>
From: Jianyue Wu <wujianyue000@gmail.com>
Date: Tue, 7 Jul 2026 09:06:24 +0800
X-Gm-Features: AVVi8CebtW6uoSCTWHkq_dhSGPCkx7ytVnMkZimrVF-yiTWug6bdP8Jdl7_sNB0
Message-ID: <CAJxJ_jj_gLOR2gSEzg869CP5XHpVTjty=-y7n=PbJZrTFZU-rQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] mm: move reclaim-internal declarations out of swap.h
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Nhat Pham <nphamcs@gmail.com>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Baoquan He <baoquan.he@linux.dev>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 4:51=E2=80=AFPM David Hildenbrand (Arm) <david@kerne=
l.org> wrote:
>
> On 7/5/26 16:12, Jianyue Wu wrote:
> > Keep include/linux/swap.h focused on swap-facing interfaces by moving
> > MM-internal reclaim and workingset declarations into mm/internal.h.
> >
> > Leave the small set of LRU helper declarations that are used outside mm=
/
> > in swap.h so this cleanup does not need a new public header under
> > include/linux/.
> >
> > Suggested-by: Barry Song <baohua@kernel.org>
> > Suggested-by: Baoquan He <bhe@redhat.com>
> > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> > Signed-off-by: Jianyue Wu <wujianyue000@gmail.com>
> > ---
> >  include/linux/swap.h | 75 +++++---------------------------------------=
--------
> >  mm/internal.h        | 67 ++++++++++++++++++++++++++++++++++++++++++++=
++
>
> We likely want to split that up soon, but let's do that separately.
>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
>
> --
> Cheers,
>
> David

Thanks David. Agreed, that can be handled separately.

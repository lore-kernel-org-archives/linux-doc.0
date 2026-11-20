Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795157343;
	b=Q8fX2BWov5tdgymII+LK0XaY+kjTqZfy+lqpwHFvU5UnQ1usjR1kp3chjM0xEzsWHcOq
	 so2rfkmLgyrn4alkVfbku/tEG/FmuGErRTKqERKzmafDOJ4Htfb6fbEmu6YrO62kzOxKh
	 8Qflywx5RJB6kR4dZ0B1abnM3Nq+zGQhfQMieWKWUxrsolFPaIYWoHf3Co09ODlweWEqk
	 kqczTY301Obs6Ob3JDI7uvhk7OXv5Sjz1TbQb+HfIKM5hl5jqajgyQ2rTulIsmOfn3kwg
	 cY8+u+grOmKKZG+zWlaNgtOUspPyWRvgPiyMgE8u91QEQ1e7FsDFirJLVKTqeYSdTZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157343;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
	b=ospAGY/bM7Rjz2Q3otgpDunFi0imM9lRtGLvbE4vZM9DK7hcBx1Vuz2fhAsdVBWx6j1o
	 YTai6O22EcvgF9mfuU1cnEwbEqcG3m8ArdCAkTNNxeJDDVgVChdQiKjx/4m1RHTqitEhs
	 Jn9XYASoR+TIS392yzjrlkY0ds5xLSHqqAh13mxqm68r6nf3/xvTeTTFtGLhy96K5ISvN
	 eYLBmy2FX3iWhybqhRVTs1tWFVNpwC21nVEOdqKSMrMMfLeT28KUkLwGL7QQeHn7BP64E
	 Xh8rlh4Eh7yfAyrzL43Z0fDNDc/PuN3RfFp9B6BkJcJWjc/giTMhFk32PrC4jaw011A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK4tFHA5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683FB606A326
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 06:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683FB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iK4tFHA5
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so4332765e9.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 22:49:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795157342; cv=none;
        d=google.com; s=arc-20260327;
        b=UQBBDEqYlOpaXg3yjraOnu1iTCE5i9Srov2yxfyFpyajQ7Mk0VrB/kxxSl9k+siU4S
         IiWLwdHPRfsifat8O2b+c+Vh6zJ4Ilt5MZnLGirU/oD19aOkeMmMiIBtthMtnIKSMd3/
         Jg9CaHE8Pq6LJFYwUynJ2NLDhV2rNrbQdmBf80N4IHkqgGvhFOQ9HoN/EJasO9bTSb03
         aP6gpsMPFnhAyzphddgWWVOlWEHlKw/ae74nd6Fz91xWTwB4oMAwljOtTc6Y+dV2O+WA
         xyKrLKcAngHqb/PhVbYgOFJqOBkkONllfVFklc8fmQRdeGaDrJUSOFTYYVIEJQnC4xKa
         Essg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
        fh=kspttgbnR5dH3B+pLlsDMASs5ItU9VTTiBVKyRzWrvk=;
        b=F3JzxlwAcrXvRrVzFLjt/8QLLTKULH+bTUfYy80LqdTOKUSw0DCJ4LHjJQ+UmhRheS
         zzsTDXe01+9cZNNghha9qJfoq6TGk4aqkQANhmSFedo9gYDdQenNjaMIy9y20/4KXVGX
         TxBnN4uuqhqInqyKfrwOdvcsm1d35h+9/7TdP+n10uqBkhxvAMJtM+emSeuNSxT32jX7
         MrXPhZ5xvh4o3AO8oluuihNDcePRmGidOiRGaKgK1dnjknD9zXO7Vxc7NlWMX6RGmBhm
         olHCIcNRbh5wsq3tAi1dMSFDeK2pMiIAnrP1GvoqpKhp/r0EppZMIel7uvwzGOM5g2Y+
         1IDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795157342; x=1795762142; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
        b=iK4tFHA5Xdp7Y2lQSfMCqU2KYcvTQK8+4Nu0s87bvt85pOPJAJ1ILVdumwjVy3US9y
         5k8cHgJbnumhHajKfHN8yy2wxq9buial9Vcjv+L0RYe4JZMGUF7CE4IhZ7C7Le48HAEN
         5FOgUILuwNCW1Zqq2XE7uCM3HiYbLzO5MerQGNQUC0JL43nF3slvmscLkGTpe+dBbruu
         ONyOBu1c+VKr7wAO8Fc8ET7vtMmJm8+qbDCJjUVygKDhiyFPwsW3gYgKZEuoS9l7TxfR
         nwIH0oQhf9FNUl73+I5hxBJWeVDH+yyuRqnwRSOeh+iXizrQniF116r6vMtC8K91hcB+
         /91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795157342; x=1795762142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+lyQHOp4KoneVTmx0lXKvEiHfZq/Kgi2CNuQIZ6Z14=;
        b=nGgzUT6w3BfNqIB77j6mMk8wCap0AO4GdXuE1PLBUqiNhpECICrqY8kWc5VdrjYx9y
         HCqBa0it2PP3p6RyQeBXmjamDlZcOt/Pyb7moR+Nt56A7Gy3HMjmvm1BKmKxzN49dT+G
         wr4GhN3UoED1lz2476mnIaujhqSntvptz0BD+HA8zYeVmzhW6dfISAQiR6MRTPZWN+h3
         YbIwVo0KbMy9oTiNQ60xe2eIsYPZcSvpfYfZLL8yy7lbF/2ys7uLbziIEHxydyHFQNCU
         RBtn55EkEvyhZ7pO9+pK1fF6SJ26Bo4TI4sc6I2dikgBa/0/7cQtWgwMxGgd5SKygiHD
         mawg==
X-Forwarded-Encrypted: i=1; AL+hErEDQIu8sFq227A1qbkIXbZu8F8+Yqr4TBsXRR/siP0abzr0zy2jHxKEscvya9l+Qgp6DkWyYuIPXGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OTnZt/QRkV/5XbNDn/Cy8XmwjmmQvMzTv7PxnRCfLPpq7q+oD
	jkgZEbEsxfKaKS0MnH3i4F8VCaLTvjyJh3MqTKuMOj4/C4gAyicv6BHmw1vuhaDQhb4KZngNfAD
	ir5iTYGiquLQk1lMlePbS9EbZN8Kq3OU=
X-Gm-Gg: AYBFou1f7nXNDmAc0zbRJ3Hv3dC6FkHeZ6SRaqEFpF/3LEo1IxzXqd9P6TwzFmGpR4P
	syuLhggR5Ex87xLmiSYRWVs15Gu7TJOQfWuU3wfc7Ne/uB58euKirZNlSYNaARZ1TUuScuVA/zs
	YqPjgs5uameaeua56x9QNu1znTmJ/9selL2zvrGcg5lP3d7iIvntIys4MgdQuAP7v3EbK9pLFD0
	n3PXKv4ut7z66Ws0B6n2Ctz6HJeqnbtBJoIRT0z4JfdPCDMToVu19AmLQPHglgkC0OJFgK248JD
	P2vuE+3cmocvwn5mkEJsPsiKcXn+Y6uMiQNMvnbKzeKKRm8W6fzuj86sKqfHZkBSOG5WOvOXcFl
	jTHyDg9s2cROoM5PNLkjG3Ac5UlxHqld66MAa3X51QcE/azN8EfxQWPxCe4iikVa/9Q==
X-Received: by 2002:a05:600c:3d05:b0:4b8:d17e:da27 with SMTP id
 5b1f17b1804b1-4bb88930872mr41310625e9.27.1795157341259; Thu, 19 Nov 2026
 22:49:01 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-mglru-fg-v5-0-9eee2fe97a2d@tencent.com> <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
In-Reply-To: <20261119-mglru-fg-v5-2-9eee2fe97a2d@tencent.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 20 Nov 2026 14:48:47 +0800
X-Gm-Features: AclHuK_tpistnJ8n9EgGJGhoSv7JK71sLxGmAZ5e78h-Lbf9KixLF9WGl76rLxw
Message-ID: <CAN_Opa-7j854ph6e7Ckmq6UgmmQerxF8V-ikSr9JNyTAHZCxdw@mail.gmail.com>
Subject: Re: [PATCH v5 02/17] mm/memcontrol: allow update of LRU statistic
 without holding LRU lock
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Muchun Song <muchun.song@linux.dev>, 
	Qi Zheng <qi.zheng@linux.dev>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Chris Li <chrisl@kernel.org>, Baoquan He <baoquan.he@linux.dev>, 
	Nico Pache <nico.pache@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Barry Song <baohua@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Nhat Pham <nphamcs@gmail.com>, 
	Youngjun Park <youngjun.park@lge.com>, Zi Yan <ziy@nvidia.com>, 
	Gregory Price <gourry@gourry.net>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, Hugh Dickins <hughd@google.com>, 
	SJ Park <sj@kernel.org>, David Rientjes <rientjes@google.com>, Yu Zhao <yuzhao@google.com>, 
	Vernon Yang <vernon2gm@gmail.com>, Zicheng Wang <wangzicheng@honor.com>, 
	Chen Ridong <chenridong@xiaomi.com>, Tal Zussman <tz2294@columbia.edu>, 
	Kairui Song <ryncsn@gmail.com>, Xiang Liu <liuxiang.277@bytedance.com>, 
	Ehab Ababneh <ehab.ababneh@intel.com>, Zhao Zhenzhuo <zhaozhengzhuo@uniontech.com>, 
	Lian Wang <lianux.mm@gmail.com>, Joanne Koong <joannelkoong@gmail.com>, 
	Hui Zhu <hui.zhu@linux.dev>, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kunwu Chan <kunwu.chan@gmail.com>

Thanks,
Kunwu

On Thu, Nov 19, 2026 at 5:03=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> To enable moving file pages in folio_mark_accessed directly and lazily
> for MGLRU, allow updating the LRU statistic atomically without holding a
> lock. It may cause temporary counter underflow, which should be fine as
> the counter is eventually consistent and only serves as an estimate.
>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  include/linux/mm_inline.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/mm_inline.h b/include/linux/mm_inline.h
> index 2395ca8ee305..2edb9beef6d3 100644
> --- a/include/linux/mm_inline.h
> +++ b/include/linux/mm_inline.h
> @@ -47,12 +47,11 @@ static __always_inline void __update_lru_size(struct =
lruvec *lruvec,
>  {
>         struct pglist_data *pgdat =3D lruvec_pgdat(lruvec);
>
> -       lockdep_assert_held(&lruvec->lru_lock);
>         WARN_ON_ONCE(nr_pages !=3D (int)nr_pages);
>
>         mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
> -       __mod_zone_page_state(&pgdat->node_zones[zid],
> -                               NR_ZONE_LRU_BASE + lru, nr_pages);
> +       mod_zone_page_state(&pgdat->node_zones[zid],
> +                           NR_ZONE_LRU_BASE + lru, nr_pages);
>  }
>
>  static __always_inline void update_lru_size(struct lruvec *lruvec,
>
> --
> 2.56.1
>
>

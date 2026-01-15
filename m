Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD8B3271F2
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 17:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768498400; cv=none; b=Q72C1pwhlthnLQardh1JtabH3nsVhX+JQjL5UGVMhbe3GIMPAKUF9oFHvEkxzYHW3wm/qgrNw2Nzhy/BxkSXT4k8ucdUyKon+bRZJKDS2jdIoKCAifMQCw6OEhPzeKj5otyYnG6BU9lZ5hxvgwacTUGvufnDt7H6zuGNL6dsUkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768498400; c=relaxed/simple;
	bh=gmWxAy5uTUT/UhmfH7kZ4VlAnV5ZizQ7PRjs0zDcgrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOHOa+53J9VEczZtZ+azuvYnZ8/oA/q2GkohMyf+yWIZPKNlmCS+YR+d/bDE3ALWTgSbB4c8neNzC0q1s5sGY24jZDssHDZ7T1iBGamymL3OHed7AqKdmO8lyJfGiYhn9Ivv/NCdiAEnbzdb6k/QpVT7V1zX2dkwhbM0gW0p6Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=DDIQUtMP; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="DDIQUtMP"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a2b99d8c5so9383966d6.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1768498398; x=1769103198; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HELVBq+JbyCXR2ZFI5M9lAV4vG/kM2Ay1hf/o0jB9SU=;
        b=DDIQUtMPS6qsYgGC4olHxdA2og7hiboMmzlbdkYOPfrQTvla0yrc0UEt7U0a7jUvpL
         JlUSmDECkpRXSGxaapxEyApW/eTYlXf4e/RhQI/ueH/vC9vHEO8TpXRK/JmOaEsxk/8V
         dRqvb1+sPOCkYfume+xdaF9zZhDuHyQWmWLiS9Az9jd7JyjO5JFgNYzWGR0YR0vq6p7g
         L+yqOpuYCyesOqFnbRg5Rea+bHmHwOtJzfIHA7Qv9WGVy9Z9KyVt4H5Yz2vZKQrQkAeU
         ntn7bxStqacS+ix2hXl/3p8oeI5HZd5zJY+6+h6ZsHN0WPWWT0R99Dx8z2+bKie+e4VL
         Zc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768498398; x=1769103198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HELVBq+JbyCXR2ZFI5M9lAV4vG/kM2Ay1hf/o0jB9SU=;
        b=TbEC1u3bKkVqptja8tdYMmLhwJcd7EP3Ae0pkrexwGZ/AjCJy1/TDwMGCqbsUyhzm8
         /OzzS/jujiSzO4xCKkDvm/xKh3RjEaCfdbKcAgC8tgUlJ+gulkZwrvsIqWMuorOEZCEC
         O2jlqAwPi+gTHgu1l6WGqX0Uy2S4DVBzJzHoVX/PZKw4RAVmsDQrUACvam2vJL9MGdiF
         vDZtkmEICLj7MaiWOU63l2ysWcvu4weYLAmK4NKzS9GxB80g6a1t2uHMwby9aYYxtRjh
         ZsTLgp7cnMMZyWf5FHjjR0z8lJF4yBx/vYC+/Je/1fH1UpHxYW0n5xIuy0yMa0yHsD5T
         Ntxg==
X-Forwarded-Encrypted: i=1; AJvYcCX+dYAzKCreW3L+rfsxvPSHZE/ZE4Y9f1f9gtB8SgIyhwGrDEhL205Khzr1K1FoN+RzNmQhOC0Wqfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiyYe4G1pxWIa9OcyQAEnIEjWZ8tLiGYQ4nADn8p/8pC7GbPuf
	ajjYuCoGVKTySwmrBbXINeS7usMo1gL/UJLyIeN2DzNmxSYliN6hdzhCNb6THhFzPds=
X-Gm-Gg: AY/fxX6J3K8YZuNcaEALEhjByMSl+Vl67nutcnEYhkVoSbZohQmFbZCU+Eeh8rE177l
	Lfulf3AhixwNVWTtRrbsBKsKVTP6429DVNlwca+W8oLtdSrHSqTtqb7192ScVrDPRJYqcEb54OO
	YVyskZwI9RJkHHECMQMMJVawLwoPBNUD5HD4OK5cNIht6m/oC4unnYqnnTsBEqeoxQqYpv+mHVu
	ZsJJhf4yOY0IWET7aQ31+DKIV0dmUlAewCHf0n9RwlPpXiknDVO9Ts6S2UXZM+9bwCpe+cts4qg
	0U/bnf4iKb9zzSpVyJuIOllypPeRNlEAWznl8hq6lqbCBH2W3E9pI54YvtDQlt30/cYQdIJrk0t
	CORDF61fjpwPJTVh57UIuMAR5SfBkHUfIZ9QPJGV4md/HI/l2PTUDhnUiBKG29csNblwL+iBMOP
	3HzDjAvUE8O90oA5Z/9YRImiBg7l6fbMlI3n+ENG1emibFuDiLb8pKVFAu5n65QIpu03dLrQ==
X-Received: by 2002:ad4:5f8e:0:b0:880:541c:8243 with SMTP id 6a1803df08f44-8942dd060f8mr2986496d6.1.1768498397481;
        Thu, 15 Jan 2026 09:33:17 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e47d897sm548586d6.0.2026.01.15.09.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 09:33:15 -0800 (PST)
Date: Thu, 15 Jan 2026 12:32:41 -0500
From: Gregory Price <gourry@gourry.net>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
	cgroups@vger.kernel.org, linux-cxl@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kernel-team@meta.com,
	longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org,
	mkoutny@suse.com, corbet@lwn.net, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com,
	ira.weiny@intel.com, dan.j.williams@intel.com,
	akpm@linux-foundation.org, vbabka@suse.cz, surenb@google.com,
	mhocko@suse.com, jackmanb@google.com, ziy@nvidia.com,
	david@kernel.org, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, axelrasmussen@google.com,
	yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com,
	linux@rasmusvillemoes.dk, rientjes@google.com,
	shakeel.butt@linux.dev, chrisl@kernel.org, kasong@tencent.com,
	shikemeng@huaweicloud.com, bhe@redhat.com, baohua@kernel.org,
	chengming.zhou@linux.dev, roman.gushchin@linux.dev,
	muchun.song@linux.dev, osalvador@suse.de, matthew.brost@intel.com,
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com,
	ying.huang@linux.alibaba.com, apopple@nvidia.com, cl@gentwo.org,
	harry.yoo@oracle.com, zhengqi.arch@bytedance.com
Subject: Re: [RFC PATCH v3 7/8] mm/zswap: compressed ram direct integration
Message-ID: <aWkkuaYt0cEyvbGj@gourry-fedora-PF4VCD3F>
References: <20260108203755.1163107-1-gourry@gourry.net>
 <20260108203755.1163107-8-gourry@gourry.net>
 <i6o5k4xumd5i3ehl6ifk3554sowd2qe7yul7vhaqlh2zo6y7is@z2ky4m432wd6>
 <aWF1uDdP75gOCGLm@gourry-fedora-PF4VCD3F>
 <4ftthovin57fi4blr2mardw4elwfsiv6vrkhrjqjsfvvuuugjj@uivjc5uzj5ys>
 <CAKEwX=MftJXOE8H=m1C=_RVL8cu516efixTwcaQMBB9pdj=K+g@mail.gmail.com>
 <CAKEwX=M8=vDO_pg5EJWiaNnJQpob8=NWvbZzssKKPpzs24wj+A@mail.gmail.com>
 <e6eydzdvuiktmalhcmoiwsgzjbw5v7t4532fkbroylwr5cqetx@v6pgjaoxgmyz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6eydzdvuiktmalhcmoiwsgzjbw5v7t4532fkbroylwr5cqetx@v6pgjaoxgmyz>

On Thu, Jan 15, 2026 at 05:00:04PM +0000, Yosry Ahmed wrote:
> > 
> > 2. Just enable zswap shrinker and have memory reclaim move these pages
> > into disk swap. This will have a much more drastic performance
> > implications though :)
> 
> I think what you're getting it as that we can still make forward
> progress after memory lands in compressed cxl. But moving memory to
> compressed cxl is already forward progress that reclaim won't capture if
> we charge memory as a full page. I think this is the crux of the issue.
> 
> We need to figure out how to make accounting work such that moving
> memory to compressed cxl is forward progress, but make sure we don't
> break the overall accounting consisteny. If we only charge the actual
> compressed size, then from the system perspective there is a page that
> is only partially charged and the rest of it is more-or-less leaked.

Which is comically fine - because the actual capacity of the node is
functionally a lie anyway :D

~Gregory

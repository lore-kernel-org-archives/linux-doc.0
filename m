Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE0127FB26
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761079415; cv=none; b=BQM/+9VOllmFySkK6ZjwAr9jz9pcZyLrNqRoE0ngvE6bB4g7PKx3NxZb7ix8KZeC7WGK9gSwRaXjp6Mat/RV9MJo5QNcWPb/ZVai2HCx8pH7JvQRKFYvAAREWJcj6WUFO/J0bdmlzHTlJT4SPJ6n1e1sGXk7c+p8B65JUpAE8xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761079415; c=relaxed/simple;
	bh=eF1fACVfV6HLT5roiTx6wO7WHbA4YryGuaxzvCrw3KI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRtMlVzFcZkDfJAOebJJeVw5TYu/vVKzruEkPNq2MZmoPtcD7r1jMekaSWU4MhfipxM/uMLUDugY1V7+rP9gnjpbw2MsM5vgAtwu2gj0lQQAyburwgiShyEzw063hZ/eGY9R+yiSAxXr8Lo/ztb+oigUH8i/Ma9v3VOXSsbWQWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XtMJuDZu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XtMJuDZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761079412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jca+iAluyvXYfcIcNG0HUymCKJQKka+3ZoKebkZZYlk=;
	b=XtMJuDZuu5oFP+YUHdoaRFlDVxXFNP4hJjhnZYyju9/872MpBrFJEqxGHbx9hz0PDJyVxG
	mQTicakszrbvhRecOcf9PHAWOBuBxj/6fH3j8eRD2L4Z69qAmx0k0R86kMzLT2o64zAipp
	f3CQIlKcNttmWVn5lrXBB/h5jV3SC8I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-168-91dnMKezMbab2HyYxlVb6g-1; Tue, 21 Oct 2025 16:43:29 -0400
X-MC-Unique: 91dnMKezMbab2HyYxlVb6g-1
X-Mimecast-MFC-AGG-ID: 91dnMKezMbab2HyYxlVb6g_1761079407
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-470fd59d325so30737995e9.0
        for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 13:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761079407; x=1761684207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jca+iAluyvXYfcIcNG0HUymCKJQKka+3ZoKebkZZYlk=;
        b=CKgRRpVK4nu4s+Azgy/8Kgx4vzv5DUpIPLWnSX3wyAYu084x8kwrTl6ocmSGLa32hj
         YQbuonpB+7O1cVSWxE3VELyteTQiN1xGhHRIcIDlKlD3NbyHxFgcjG01UdJiWche/bef
         YDyLvCjz+eBSr4cMLhpfX8BFnJLo/FsORKg/PU+6RzTjsL3+eV5jK05l50SKRQz/XrCe
         DdALM4CPLo6hCReE9xjatVImRJPiXx0RvBzRl7UFDgcur+5QLVefCo9ptLwHy7A/CnO7
         qS6umn+u+S0iPphOVsmkhf4Fqm+yOXIaewoEMIRvgbqdaFCArl8Smhga/GoaiqFM/gZO
         W8WA==
X-Forwarded-Encrypted: i=1; AJvYcCWTTXa1g1RtVCuRNznLy/oIrj6q8tkQLwmxZbnZBN2BH5Lo/JVAGS7ktmb5RFnUGTBzhHADLWM/LKE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxJM731hUGMYZibpfxL9oza35T7RgWGON7NguhI0mnnVYC9UHx
	fjhAYxZXzv9ZypQBldYhdPCXMb/tgl51XX2kPekfmoLsbgvHZsBMHzmoprtIyOoEriW2QvR4Hvc
	gIMFwT4qMLVQBnyl7DYKsgtXtYnBDt4hxwzjeTz5wb8jlfoTvInNiwEwQ4vKveA==
X-Gm-Gg: ASbGnctKs2oKK8Ukz2c6jCGudmpP60fPDyoyZ1E98agadWsw8BTVURm51xANlNq9hKR
	1FXbqS2L40bwKx5ZCByPoPvZaXP3EhcMxYLNNhGuWytyNVTTGkS4jkFnUcjSyUq5rm02amI+WgZ
	WBrlOwfl3U/js2JyUY5ZhNUYa8n8BHI2QK88a2xh8hNJWSIWuUa/lZ5JlKGgOROE+jtLj0cTlZ7
	qCeZQE1Ic/XJIdi8+JMdD63GZUZ+HoMSKFDEy+ZGjloY/Rdnl/5zmxU/lnVgBc3gsxoAeS97Kf6
	P1iu8D8hX/IvDeVEN25tO6GqoaAIaZkCsnzFbL1dSSRQ2h+zmaF3G8BlP732uHmlcIE6
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr155488995e9.30.1761079407227;
        Tue, 21 Oct 2025 13:43:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3tqHiyIT27d9/w9pV3Cihx1kc1ZDJQnIJKiIuWuTpURVwED00bfMi5FBVB40yx0uQLffj0A==
X-Received: by 2002:a05:600c:4fd4:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-4711791c5dfmr155488865e9.30.1761079406669;
        Tue, 21 Oct 2025 13:43:26 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152d:b200:2a90:8f13:7c1e:f479])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c429e82dsm9612815e9.11.2025.10.21.13.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 13:43:26 -0700 (PDT)
Date: Tue, 21 Oct 2025 16:43:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v1 03/23] powerpc/pseries/cmm: remove
 cmm_balloon_compaction_init()
Message-ID: <20251021164220-mutt-send-email-mst@kernel.org>
References: <20251021125929.377194-1-david@redhat.com>
 <20251021125929.377194-4-david@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021125929.377194-4-david@redhat.com>

On Tue, Oct 21, 2025 at 02:59:08PM +0200, David Hildenbrand wrote:
> Now that there is not a lot of logic left, let's just inline setting up
> the migration function.
> 
> To avoid #ifdef in the caller we can instead use IS_ENABLED() and make
> the compiler happy by only providing the function declaration.
> 
> Now that the function is gone, drop the "out_balloon_compaction" label.
> Note that before commit 68f2736a8583 ("mm: Convert all PageMovable users
> to movable_operations"), now not anymore.

What does this sentence mean?

> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  arch/powerpc/platforms/pseries/cmm.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 310dab4bc8679..67c7309c36147 100644
> --- a/arch/powerpc/platforms/pseries/cmm.c
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -548,15 +548,9 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
>  
>  	return 0;
>  }
> -
> -static void cmm_balloon_compaction_init(void)
> -{
> -	b_dev_info.migratepage = cmm_migratepage;
> -}
>  #else /* CONFIG_BALLOON_COMPACTION */
> -static void cmm_balloon_compaction_init(void)
> -{
> -}
> +int cmm_migratepage(struct balloon_dev_info *b_dev_info, struct page *newpage,
> +		    struct page *page, enum migrate_mode mode);
>  #endif /* CONFIG_BALLOON_COMPACTION */
>  
>  /**
> @@ -573,11 +567,12 @@ static int cmm_init(void)
>  		return -EOPNOTSUPP;
>  
>  	balloon_devinfo_init(&b_dev_info);
> -	cmm_balloon_compaction_init();
> +	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
> +		b_dev_info.migratepage = cmm_migratepage;
>  
>  	rc = register_oom_notifier(&cmm_oom_nb);
>  	if (rc < 0)
> -		goto out_balloon_compaction;
> +		return rc;
>  
>  	if ((rc = register_reboot_notifier(&cmm_reboot_nb)))
>  		goto out_oom_notifier;
> @@ -606,7 +601,6 @@ static int cmm_init(void)
>  	unregister_reboot_notifier(&cmm_reboot_nb);
>  out_oom_notifier:
>  	unregister_oom_notifier(&cmm_oom_nb);
> -out_balloon_compaction:
>  	return rc;
>  }
>  
> -- 
> 2.51.0


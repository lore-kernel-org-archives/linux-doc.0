Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449123;
	b=lkV3BJflWEcVJvEsZCAqsfJkOarQCvP4RUD7Xy0qc5CVA01ZdSm2ikfS7f5vVPIETuae
	 C6jeMbchF9aWhVrF69r1XXBa7aCj8MLxEwAogiKqQz1wF80WORKBWS7ef9L4qenU9s1/U
	 /6QOyKM/buB0eZ/g5xhtDm/hQvB7DTX+sd3Bxc7LSjgkB2ab3+O7OzJEdDQ0E3N323Igl
	 q+STbFW+Mr7JreoEidA1qO/LOR7v6T8EwLVhzmKRwXBq90sq5Yn+GbMyHx6Mm3MUHMbGB
	 oj6S4/IxrtdxcXecFChxtSoCBWrwRYpHfoewzqSrCKvNIGiLGni0sZkNoIKfqimShCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449123;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qKzq1YaHaTK/cMOsuVlloBBGSRBcO+4dM5JD9G9qTYM=;
	b=s+BOcAe1hKOJ6kEzSBthIt05887fxSVeUHmH4CZFwZBBByMsDmKFQ1eilKIHbM4nPcZu
	 yQsUE+3T3mo6qPQ15m9twRQwfk5somvRycfr75HYiDGMR+UeLmcfpVvYZs7VMJZ43q8NG
	 nD05MoNqLn86irl+j8iZimbgdSQ3R+qZJwSOcjs96LEFAxjuzZqnDYzkMZxanyz1I91SG
	 R/Jvcuk6MB8wSbQ3k7w3wYIOMBugXZL5HLTKbs4I0UG7v4r8dnWyUGECzyxlerYlscsck
	 dfdalJdy1/aTqcK/SfQfoNLWcuSAxblCdzK+pSzxKdFxXEJnz+9EDlV8wjsZ10oaD5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M8LMUd9p;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49442606A324
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 02:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49442606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=M8LMUd9p
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad41b47541so2355731a91.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 18:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794449122; x=1795053922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qKzq1YaHaTK/cMOsuVlloBBGSRBcO+4dM5JD9G9qTYM=;
        b=M8LMUd9pSI4E189tEYTQVVCeqMNbmM8OBOGdL5r1WCP+ApYPIFhMe0GulCPpc/maC6
         v9xWV2K8DWgADKMPZxbEZBtBgtXib/TA5zvfMr1oREvVJC04J0SflCaRXieUd+SQZqHV
         AecGMblpWBVJMHQl+geL5R3Hc+6KlnC6RG6f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794449122; x=1795053922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qKzq1YaHaTK/cMOsuVlloBBGSRBcO+4dM5JD9G9qTYM=;
        b=SwwgQ904c/C/aDn8RJY8yh64K4a4YBo+V6Ln4Xh5doAHu1soD8/DfT0E90Jmm27a7K
         cauwTrX5/EUl13jo5Z9KbRwPpBqJVzPgE3aS8fY1pkGQ58DuJb76E3V2fZgarzky2DmB
         AQ50oxqU76C6hqDQLAFQduIQqq7HHnbjckv9WGHTKXHBWmAW9eYJ/LD/GYKouaSLNTZ3
         TUPMHE2TbWMcrumEle2Y8cKRIJEMAqsWlbE/obxYBaAA77q+wckgNi9tT9/1ADO01kwb
         4lXcui8imzqAzp8aSPKZn43tIhhm2hhqCjFIOagHefdXmhDOAQ0XAVWx9X6qCcOWt+Bs
         hGFQ==
X-Forwarded-Encrypted: i=1; AL+hErFfXkQDCwQ4rmOEDneXsrwBqZZSu0QnqklJhE8L93QUScd4qJYUrKP2gBNK2XtcAzLxVUtCLDnquKg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mBb2BjvJkDM0TneidDSr+aHZVt8QBq6it90Wo4dU1vtds/JC2
	flUB0Qebevmazx+rah56lpltxJRVV2ToCLY1+/zbDmTBANT/ZVhyxI9QECkaPCfyIw==
X-Gm-Gg: AYBFou1hbbPz+kAXQH0lpyggKs0EhWFG6/Um36DpSjKPp357v9CBdmQDl6B9q4URfl3
	dBDv5p5taRQHTVQ4AbWe5Hs4LKvEhRgSXyWLx7xrdeK+K7oUy3o4NGnTePJb4HzxIUAAN7z+Dw/
	waeQrkNp6PH8oVtJ8jZSqhx43+/Itk6AypEuait7+0IUNsBhMouHx62333pdEzg2OBTIOlgs6Nx
	PFYikVErIemXJasPUMuoDF5FIzdqpvSibTmlQBtZQaqvi0amtsrD6MExOMK4NYnfNsW0GcLmt2q
	HqVN/LtzeYIidHCjvchQuq+DVXvVLMf97wcTzcSHterNry4FM8zeoHFHAQS9EZ7LdqIMrrdV9Z5
	bXO/v0jdSL+mOJIcN+BfCTLKFChKPhooELOSi7S44m/3Wja9cEG9VyBPGKLkBQ0V3VXPUOYHh2V
	Ei+6KPuZfINch5cckEqrUf8RfZbVAOKTabvjRSigD5C8kCfXyx7j+796qmQbU1By85DravF8Ss2
	rXypNjrz/SuNWHP0Tv75uEFCNS0iNCRZ/Cd4qxG65AErHslCGiX3TXo3IdsjdIZUrjmTX2wuZaN
	2o1ZWrSZooA9lWzBprsYUvnmfH6zZuH5GqjKGVeeF0iPBvf4nKkpCWaavqS/9WxoBScYhw==
X-Received: by 2002:a17:90b:4ad0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b182f1adcdmr4140105a91.60.1794449122530;
        Wed, 11 Nov 2026 18:05:22 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ace7:ac44:3dca:1bb4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm1832060a91.1.2026.11.11.18.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 18:05:21 -0800 (PST)
Date: Thu, 12 Nov 2026 11:05:13 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Xueyuan Chen <xueyuan.chen21@gmail.com>
Cc: Minchan Kim <minchan@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Helen Koike <helen.fornazier@gmail.com>, Vignesh Raman <vignesh.raman@collabora.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Nhat Pham <nphamcs@gmail.com>
Subject: Re: [PATCH v3] mm/zsmalloc: remove CONFIG_ZSMALLOC_STAT
Message-ID: <avUet_6jVqlWSP00@google.com>
References: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111-zsmalloc_stat-v3-1-2d85ed51570e@gmail.com>

On (26/11/11 20:41), Xueyuan Chen wrote:
> CONFIG_ZSMALLOC_STAT only controls the debugfs interface. The class
> counters are updated regardless of this option.
> 
> Remove the CONFIG_ZSMALLOC_STAT guards and rely on the debugfs API
> stubs when CONFIG_DEBUG_FS=n. Skip statistics setup silently when
> debugfs is unavailable.
> 
> Remove the Kconfig entry and replace the existing CONFIG_ZSMALLOC_STAT
> settings with CONFIG_DEBUG_FS=y. Update the English and Chinese
> documentation to match, and clarify the pool name in the debugfs path.
> 
> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> Reviewed-by: Nhat Pham <nphamcs@gmail.com>
> Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>

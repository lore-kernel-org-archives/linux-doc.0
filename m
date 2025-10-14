Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC3A29BD81
	for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 07:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760426661; cv=none; b=oqoOlFa8ua+FrXyN2r4Q837HOgjPFnHnvLnvqwafIJx5xx3Jn2o1ailaG9HPpuMU6gXYlifaO48aVZ0scYemOv3KNw2vObE63aV57Fxx0iXB0JGMTT9DDpKlxLUwl2SG8sdJlfffEwUCUL4paAyBCX1F2Tyr3NHA4FAoPM3PHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760426661; c=relaxed/simple;
	bh=XNpQiaoPmtubQWjx7HZt+FaoHtPtuE6h/eecJifiCfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACD21bosL1L6e4Le6b2F82szm5l4INlVG0jevY2S3sq1UgEm1FC/fKUCBnGDmmE/hL73B1PorKmwX9RPaxdQm1SDl+v4l0UNzJhlQWs4FPjltjGWw6BTyQTsNu1TXRt6cyDdEC8sARUacmar5kRab/46jIPDe4ZxbnxfC9HzIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R/y325+A; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R/y325+A"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e52279279so35268225e9.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 00:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760426658; x=1761031458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DJsuSntfzmyGwBLDCIOK8zsxQdVVbjKkDRasCAUOBFU=;
        b=R/y325+A9c8MxvrcUQukZV+j96qhVzE2ziF8QrunjEewp5G9eqQsioXUUEwqBBtH1e
         S4vHR0knK68wKOmJppkqHeEoqP+qEriQU/Fg0aJMlzlooYsQg3Quax0Y1oirx5SeXPg3
         b/3i8ru3btHplF6Pwq2FBUYVE+ySUl3NqsqlhkTp6ovg7vJ3ZgM7R+rL2CFv1ft75oXr
         RN1cp2dRqIpudgFo1BZJ7y4hliUOrzpIfPEljpKFAb9QEJ/1TLDNy0srWOjY0MNmeYWv
         bnhYotosgLR1qcHEkK5wWFTSmUwvoiVkYxCl5evyHgeEHp/5s8L4Uu84U2F55nu1ahF7
         FMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760426658; x=1761031458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJsuSntfzmyGwBLDCIOK8zsxQdVVbjKkDRasCAUOBFU=;
        b=ekvmxf3wQ/eSbqIVkjV7fdhuBC7kkapmrUQflrApBcNqKQjhrOnGnpWqaMrLqDLViI
         BI/i6BkMrTAKgi3v/Evmj4Tok6HA0rWgTQnzSZa0fooRRdSXeCl6887BYMwYEW36lLmn
         Xv8bRs1UX1dTMHCzYJ6Yle1/uvlfnhA/mxdJk3XyUgJ4LHQDes13KQ0aQ8HPESZlS66Y
         J8Kw/Vhcy1juG/pTil9GGNU3CEAFGsc3puZk1RQjh8iAb5Zr8PU5uJvrnXNdNVbehPVk
         tNCGPJaPwP47vHF9Xst76beVCwD2XSMtt5wQxNh7p2A2CmEs6HLE9xiCHHhvDB0I5GbD
         6ltQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzcZfZkBkCGXR7tHBXjCKohY85ITMxlBvZRcjrU46SUWXherdoV7j7+jAk3iG7JfreGJltXBl/iW0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxB5k6D6uujL0XEnY2XHNsE2zHkdaBuN1qBKNMxf9SvG/kwq011
	1TfDCmArIyzO4ndYX8WQE+GOFhoIzplfV6u+b5kiY+TFe3PBtsIdd+WX7+fxqIZfQvs=
X-Gm-Gg: ASbGnctAotv8CvHahap5aT1u7xxmOw9s/hUD7u1lda0d7lyVQQZ/ybJC+AdBIb0eS+l
	fBqBOOkRBCeElZy+b28yOayqj9+V055CVoE4s93+4+NJIS9LwwbYIRfGUeVFNTu3Q4yh7tqd7E1
	kXwI6bKSd2uM1koh79bTRw3tHUS7mCy8KqOjG3th8VXSaxfoRQ3iUo06zPTIMff+JLo39/xhM3B
	NjcguERBI/HRLBz877fXjt0VV2/86cHJNZt8Bef8m2Yyi1pWH6eYyQ2U9vG9ouFP5mCSz1jJSue
	heaI6dZTKRfdiLASZZS3YA4sSMzxJixN71tfQRKmKJISUNQT0FDjkQoCrzeQCRhQMSOUdbLBeYx
	fi+etmztkgRjR4JLXhXDYdPET+nfomlTU7OSzLnTBHx9ZokKRhSTzZ04ao6rWHtI=
X-Google-Smtp-Source: AGHT+IFRg4GPmLD9q+m6Z1pGRfggv0OTz6EOdiAPNLgTJQcEwNtxGs3WA3GtVkRT34c+YV2Jq9/wAw==
X-Received: by 2002:a05:600c:8b24:b0:46f:b42e:edce with SMTP id 5b1f17b1804b1-46fb42eee44mr106715865e9.39.1760426657567;
        Tue, 14 Oct 2025 00:24:17 -0700 (PDT)
Received: from localhost (109-81-16-57.rct.o2.cz. [109.81.16.57])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46fb492e6ddsm250256765e9.0.2025.10.14.00.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 00:24:17 -0700 (PDT)
Date: Tue, 14 Oct 2025 09:24:16 +0200
From: Michal Hocko <mhocko@suse.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Vlastimil Babka <vbabka@suse.cz>, Barry Song <21cnbao@gmail.com>,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Barry Song <v-songbaohua@oppo.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Huacai Zhou <zhouhuacai@oppo.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [RFC PATCH] mm: net: disable kswapd for high-order network
 buffer allocation
Message-ID: <aO36oKRR3UliRFR5@tiehlicka>
References: <20251013101636.69220-1-21cnbao@gmail.com>
 <927bcdf7-1283-4ddd-bd5e-d2e399b26f7d@suse.cz>
 <877bwyxvvl.fsf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877bwyxvvl.fsf@linux.dev>

On Mon 13-10-25 15:46:54, Roman Gushchin wrote:
> Vlastimil Babka <vbabka@suse.cz> writes:
> 
> > On 10/13/25 12:16, Barry Song wrote:
[...]
> >> An alternative approach is to disable kswapd for these frequent
> >> allocations and provide best-effort order-3 service for both TX and RX paths,
> >> while removing the sysctl entirely.
> 
> I'm not sure this is the right path long-term. There are significant
> benefits associated with using larger pages, so making the kernel fall
> back to order-0 pages easier and sooner feels wrong, tbh. Without kswapd
> trying to defragment memory, the only other option is to force tasks
> into the direct compaction and it's known to be problematic.
> 
> I wonder if instead we should look into optimizing kswapd to be less
> power-hungry?

Exactly. If your specific needs prefer low power consumption to higher
order pages availability then we should have more flixible way to say
that than a hardcoded allocation mode. We should be able to tell
kswapd/kcompactd how much to try for those allocations.
-- 
Michal Hocko
SUSE Labs

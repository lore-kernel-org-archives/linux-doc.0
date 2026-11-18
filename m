Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960413;
	b=xfIko9OHywOiw93bJ1ngOOnr2kMNv357Qhn9VgCNyrLSkoB7AORiLMUQotl9/uygI7WW
	 Du1y0lEYmKUXfzj4QNjgNaRPcezuiRC6uHDtqFuPQbQdeJSMmWnCZzfwFv4TXOJGHhBkf
	 7f+0XWLiDrNt7ya0Q+beHeWmAA2EZ1GBvolcinkbwG7mRAgbrdXwP02TLqXSSgEryzrGv
	 ibzPtx0wioeBKzZUVZbqxrNhw566/M9Z8v4zXjFFeSKCesO86tgmWLP/bUbUvKRwNBbOs
	 yhQz1XlDPOapZYvLDSzcJBaX+uAHC8q9ILfex7dkujVolgSQzKvherx6rJYw4y8lnxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
	b=nLmO9ou7C2M2mUxmHhmM9B9Aujz9OLDqNaQ78E/DUYnylsMJlaKZom+1xgOvPEOaTkx0
	 it8sG5e2E9LR8WsY5QwzqbRjK6EcOg+ZSG/afA+rhFY2/8SOxTlSx+Z0SkXjrannBe9bS
	 FZ5hr8cRyOyGJDsaI51f6PUucmMfAo2yRuw7eJE6UyAc8afJGIu3/iGPDanSMeoq8F6be
	 i9Tdk/WSEHjo+uujwIYQF0DXkM8eg2SFuLgsjH9tSlG2ylwgxtONmZCkcTbPFlZn1UCIJ
	 pkz8wglgz+x4PtqckKIYuIK0VV7CxTb7f8iO6aoFWUmk3w4vbhAhhv+eeyhaVHylxoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iqPF85Lp;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9469D606A337
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 00:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9469D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iqPF85Lp
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-381d542bc29so851506eec.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 16:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794960412; x=1795565212; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
        b=iqPF85Lpjor6frnj88wDyrBjbXbaBII5DodpVoIl7rwrg6Seti2haELhLqSfoXM1O6
         dyK0UqLUVY6TysXcPhQtWHuIb/SfNfu7MSpfADmZ0rDgFBr5Ln9RXTf6EXp3G5nqBYGI
         g0BJFhee7HlLnLDuEh4lFUG46SyHGwNiEZiJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960412; x=1795565212;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whdIwtpmJAdRFtIWUAbtiFqajWsbSsIAg/rpjYImvLo=;
        b=r6tmlnMOBVeTrH+HDZZyw/DVfsSRHqrSBLloX8x6dks7R84L958AOdD5/nkcRtRsQ/
         CFPVegdmy1eJbkWkBIzNMTMtFb2SOMhFxmp71tZqp1FC6MaijaUoHIeMrXI9AdDXO18T
         1oZl87TlmoHdOYEGhSfSqGfKPCd2eqOrkNHX3eK/LVyRqJ2LXhPSSZZBS0MrmsYCgO4q
         rwarBQZnk6pw/2QY5ZlqETLnxqMbtDJ1oJI53mQVdxHIBBqTXfe7fPWcHIOTKmXo8JUE
         nKaWPApEBG6eZPpYEfHLak07hLKq7P7ID0BduMDaYvnM27Dz2loispDK6WaVGP9gQtq9
         WISg==
X-Forwarded-Encrypted: i=1; AL+hErEHdWd4rKNlnAMZpZMmLnlphDaIUeVBdA3eTJKv68+JTamK5+427b7hQor7k/OpbtHNsRscmCeUzxk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P5VNgIMKltwMpIEqp2h5JfkG59bkJOWfpCipT/pp8rtG1njWY
	JJHfnKA19nwSIqfxsfK6hjMloIw0lmzYgrnaCX1be5JaulaDl6RGxWq3TtODRW4DwcY=
X-Gm-Gg: AZFdTZe/X39OSddArbUvucTRWFSMaPYBxY9r7gieoXLCp5GkbHwP+sFRTb+qjT7PTZN
	z+Eu6OBV3d5Kq8B2cNeUm5lBgp0t5SV+elM7jswv2C+mLYYqUZ8uW1mpFhz5/IFbX02KSmbylKQ
	kuYLZzknRamc1buVEQt1G9UVj20HMuApNSvABHE5DR4WcrtXmJ2++PNToeX2xSxjs25jMB5rsVH
	0wYIdujYjmgypzhsPSze1NFV3fazv3HXVFsw/0Tq5wihms8DxP+6PHGBTSDmCqpAAiLXEQtzzyB
	+6HrMMCQz4YAhBEtgyZW1luOSqdcwm7XmjoBw23eCPqJoCW9ctYRvDAT8R03S6XPREli5zn4tQO
	PpWIsq4fn0MB9ZdnojY23lmfJwhWHyYMATqtNkMGB8ycYIePlbZj2mhFpGH79zxL8cVS3TVo9eP
	948UMJ1yt518ffHMlcCewrCAmctecGZwidaj8366H4KLV4Rd0oLTSOxQsXDWTQVEWDN0ZtleqKY
	2Iau4zCTLcIszuL+D6BzsNbR6b7BS2WMQs/ocb5iqVln1/EGSCSlHETIODMZusE0MFoR3pIFJ8L
	OLmOu9V2I+1QPcLe2CWBL9IxTXZh6jbNiW8I7vZia36VFrbqJaAP4LQ5XUMdDrWDYxTcD2Mxrfi
	z9WMOhiKzRSGdC4nzBA2ATg+Sh7McibELd9aXe5JG4ruebmKYz8N1aWbSUYcTT1WFv+CFrs4We3
	FbSzQ8YOXsCcV2+AUUly9nPXnsDKxh/9BWQNVQVXKWw0oaZFY5eZ2zo/P/+e+qky2RtR7z8Hduv
	aKPJ7Sue5sulA==
X-Received: by 2002:a05:7300:d210:b0:36d:4135:cd7 with SMTP id 5a478bee46e88-3828083e094mr888033eec.18.1794960411569;
        Tue, 17 Nov 2026 16:06:51 -0800 (PST)
Received: from [172.20.0.3] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a63054ddsm1519563eec.4.2026.11.17.16.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:06:50 -0800 (PST)
Date: Tue, 17 Nov 2026 16:06:47 -0800
From: Chris Down <chris@chrisdown.name>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>, Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>, David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>, Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 5/7] mm/page_ext: allocate page extensions early for
	SPARSEMEM
In-Reply-To: <20261117120627.50601-6-songmuchun@bytedance.com>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
	<20261117120627.50601-6-songmuchun@bytedance.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <avzsFxVqO27Vf4Db@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Muchun,

Muchun Song writes:
>+	if (!slab_is_available()) {
>+		addr = memblock_alloc_try_nid(size, PAGE_SIZE, __pa(MAX_DMA_ADDRESS),
>+					      MEMBLOCK_ALLOC_ACCESSIBLE, nid);

Hmm, unless I'm mistaken, memblock allocates top-down, and with
movablecore= or kernelcore= the top of each node is ZONE_MOVABLE, so this
puts the page_ext tables there. It looks like that then offlining those
memory blocks would fail with EBUSY because of the reserved pages.

I can see why Mike suggested always using memblock here, but only KMSAN
needs the tables before the buddy allocator is up. So I think this needs
to either go back to using memblock only for clients that need it, as v1
did, or keep these allocations below ZONE_MOVABLE.

Thanks!

Chris

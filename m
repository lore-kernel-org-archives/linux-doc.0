Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566AA396B7D
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 16:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768495859; cv=none; b=iEZjFhxCsG6GQwCqy9/iUHWXk356LtX11m610LT4qJCHvJQAX+/bQXNrhhiii1fJ5zE9xIBzVX3HqnS7qyhTggcxJ4mCX5PPO7uP+Pha51zHTPHHOYMcpo3oOXEOowJixPX/kJwJzSEvySpjlSP/68TIw8IOQt74HmbvVp6nJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768495859; c=relaxed/simple;
	bh=0bAHEY7ff2Q8E5C6vXUVAPLo5jv8Vnp2PPLiRrb00mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ims12q7Ut6rJuyYaxq3+0jbHRDdGxZVTcFAdWXopGREMrYJ0pmHLCsky67pKpsqejI4Z/9DYnGS4uOIDMk9HxuRkiZki7/S8zUJD7Pgz+ZsV3ewMNldGfMBu5xFSg5qcz+pa85pB0y1MmW/GvIfbAR00WZT9mvudhS5tf7p5WV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jAP089gj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DCV78onY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jAP089gj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCV78onY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768495857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SljNJ9ya7guEeZDCesmPS6qTlCZIDBdh9EBAuJaiH00=;
	b=jAP089gjR4c3y1KcIKcwlWcrrFlP6AAT4dfEbrhC4z0gOUbFuAdeJ3eGK8GkYun3D0cOKo
	popN74Dh4JrSswUxtg3icUB+59836aT0q0jAAvKf2hwCEFPplWz78pE0v9r7J3E7yRg4ki
	lMyq1CzU4o+TPcMYGGYogLX3ahIIgFo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-80-l0HhnxSxNmKsW7rLFZqMcQ-1; Thu, 15 Jan 2026 11:50:54 -0500
X-MC-Unique: l0HhnxSxNmKsW7rLFZqMcQ-1
X-Mimecast-MFC-AGG-ID: l0HhnxSxNmKsW7rLFZqMcQ_1768495853
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d3c9b8c56so12594195e9.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 08:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768495853; x=1769100653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SljNJ9ya7guEeZDCesmPS6qTlCZIDBdh9EBAuJaiH00=;
        b=DCV78onY2krCTTrP+URc/4FHWkSj9kMT9anFNiog87H/KXvh/QQXic64HVV6cZF+t/
         9pmjvYw9vnqE2qgoIQ2/4th0Pbv3ra0PigzBOSo/Xh4ooWeFJ/Es6j5i/m6uutGOCFOt
         4Vkv3ZHICQcaXKWXbqPEy58RsmCKkZj11GcbG4CfDBHG7WLH2DJlY+iX+6Y2LCDHIDGC
         /rTBYvNr6o4dSiaokIS+mQzOQ0gUO9HBFb92vAXHY12DMjfgZUSIWanMmvji+SWUi2Et
         bjv5+JzvueZ0A+sSww4ezs/c5tlwRHeSYM7H0zf8y0PvjpF4nRTVhd1ab8iGMRQkMLEt
         p5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768495853; x=1769100653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SljNJ9ya7guEeZDCesmPS6qTlCZIDBdh9EBAuJaiH00=;
        b=kAVVEV65FZiAQtQXyvoHidAEONZw6GYTndcU8rs9gPTot1KKqih55eFT+z4ncPe7CR
         2mel5ioy6NX/qeLZy0EjnzJOYwLZ1W+Uln7EwAs68f76KEntVo1JfZFBoZWqGvhVzeFf
         O+qaLSw0QjCL2ckAqeD2zO0VnPrtwIOuUpJ2YGEm8cBomo1Nr66Dau8KYM1Iq8irJB8Q
         zOYOfJ1D9GLvuO4XjS0/l95ltDbwLEZY8DRU7DUpRGFPm+CXYaUr3KmaFDMHxDRDsHN6
         FycsrU2TD7ktZeblFDBBnjwuKU9Au4fTdXz8mlBx1AfN5bQWilyyxiqbsaTmcI51+rVs
         uGUw==
X-Forwarded-Encrypted: i=1; AJvYcCUdIcv0duYkccwB0aL5/O72zqgsvH7uF8GGIFSZUO78Lkq7noh4zCnOhIaEROHRHa8jSxN87deLKOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiAP0GIJ/3oVr4m4suVlkZdDJNqQlG1rQmeDcRMr/HLDD5D9/h
	PqvZAtQAsuMPGPWvFBBlL5Vrhj2u3JCyEzEQl2CDLnk8IZcl8EbvaUrnwXY5ZQUogxgPWgMpIsU
	xd1rvsmHX7eaynqiadBk1pV1UO7iP8YZWHx3qmgI+Ek6WwaON+YVu6ZL+ii00+g==
X-Gm-Gg: AY/fxX6jEPyZUKxDyxP0Nszx85rKrsr4MrpRdS6SsnJ+jL8OV7PimHMPSVSqgCInrnW
	W+dvzoKmMLU44vleFpdH0f0HdgM7fpAflrAOUneUzWtcjKbxd/TjECOlBQGV/eHGNMkGQvA8m4K
	LzwvSog+koLCn9H/K677TOTso2NYYmZ4Gn++rh2tzGTdxQgkNTnQxZp35eZZEld1LbF1wmkMzVX
	Vz95W8nrBs+ZmC+D1RAfxq7AJ/9lKlNCAd2Z3nxS39ZKZGZr9X8VVTxY5+bsa11vJ/ytLOPdc3x
	vH92wP0CaIyRio+dkvzXM4h2kp4m1vF5JuZvDWt9T8usT76bLr3CPjA1U4gufLj7XKArPhKVqG9
	PVuQaqnUMSdx6p1KRoI9/hUCV7ZUCYg==
X-Received: by 2002:a05:600c:45d5:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-4801e30aecbmr4637265e9.13.1768495853186;
        Thu, 15 Jan 2026 08:50:53 -0800 (PST)
X-Received: by 2002:a05:600c:45d5:b0:47d:264e:b35a with SMTP id 5b1f17b1804b1-4801e30aecbmr4636905e9.13.1768495852632;
        Thu, 15 Jan 2026 08:50:52 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f4289b7aasm57337815e9.2.2026.01.15.08.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:50:51 -0800 (PST)
Date: Thu, 15 Jan 2026 11:50:47 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
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
Subject: Re: [PATCH v2 22/23] mm: rename CONFIG_MEMORY_BALLOON ->
 CONFIG_BALLOON
Message-ID: <20260115114849-mutt-send-email-mst@kernel.org>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-23-david@kernel.org>
 <219f7be4-8355-4376-bf97-3410c6e23867@lucifer.local>
 <37fdb994-59d1-4196-b377-f3f749148b19@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37fdb994-59d1-4196-b377-f3f749148b19@kernel.org>

On Thu, Jan 15, 2026 at 05:33:56PM +0100, David Hildenbrand (Red Hat) wrote:
> On 1/15/26 14:55, Lorenzo Stoakes wrote:
> > On Thu, Jan 15, 2026 at 10:20:12AM +0100, David Hildenbrand (Red Hat) wrote:
> > > Let's make it consistent with the naming of the files but also with the
> > > naming of CONFIG_BALLOON_MIGRATION.
> > > 
> > > While at it, add a "/* CONFIG_BALLOON */".
> > 
> > Probably not relevant but cheap for me to share :) so grepped for
> > 'memory_balloon' and saw:
> > 
> > include/uapi/linux/virtio_ids.h
> > 44:#define VIRTIO_ID_MEMORY_BALLOON	13 /* virtio memory balloon */
> > 
> > This maybe relevant (I guess this isn't actually used anywhere?) though
> > interesting there is also VIRTIO_ID_BALLOON... hmm :)
> 
> Yeah, we want to leave the virtio stuff alone.
> 
> Now you'll learn something you probably wish you wouldn't know:
> 
> As you spotted, there is
> 
> 	#define VIRTIO_ID_BALLOON               5 /* virtio balloon */
> 
> And
> 
> 	#define VIRTIO_ID_MEMORY_BALLOON        13 /* virtio memory balloon */
> 
> 
> The virtio-spec [1] defines ID 5 to be the "Traditional Memory Balloon Device".
> 
> And in there, we document that
> 
> "This is the traditional balloon device. The device number 13 is reserved for
> a new memory balloon interface, with different semantics, which is expected
> in a future version of the standard. "
> 
> That's in the spec already like, forever. Likely, at some point someone wanted to implement a
> new version (for whatever reason) and defined ID 13. But that never happened.

yea Rusty wanted to do that. balloon has lots of weird bugs like it does
not really works with large guests. We really need to get around to
fixing this, and maybe it's cleaner to do that with a new ID
than trying and failing to use the old one, was the thinking.

> So now we have these beautiful two device IDs.
> 
> I'll note that the spec also defines a "DEVICE ID of Virtio Cpu balloon device as 47". But
> no changes really happened in the spec with that for the last two years (only the
> id is reserved).
> 
> 
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-4260001
> 
> -- 
> Cheers
> 
> David


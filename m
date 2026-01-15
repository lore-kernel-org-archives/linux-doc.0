Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F633B9619
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496030; cv=none; b=N14YSATUEo3PvclJIgRmdtv5nubqKCvMoPCbUK1ykvZBNmqUKBpKELbBKwT6ZngErETtFgm+OXheC8Sxfz7AdI8vPLSHQan18Bddd14EsUlhSsFGCM6yX/p2a5AdBgEin/cQSFV3NBcwa8MRenDliCLJyTZeh38a7Lrx3JVub/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496030; c=relaxed/simple;
	bh=V54PrZBvUZY0PjY3cU1uOI/0T7/YH8EFTu5s2qL0YK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5wyCxo3l5cgh/FnEorDVVH1czyl/IH0FSYz02CDjtnsftM4bf9D+2Vgg5O14MWx5vP3Kk5nterDkrrFFCka0Z0QswHiBMQY+LjMXqbnARxdiB+rR0L2/q3/2s/NPx7I1/5rU7xwjTMqFNcHj0v3TaZ6pSE7S/VsmQSTzBt//a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oblod9Ii; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sFYKdBc0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oblod9Ii";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sFYKdBc0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768496028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5su/nAHmwHcmkA811BDe3v/5JJsozj0l7oyd1uJGuPg=;
	b=Oblod9IiJogxeYADiNgkkExsd8ae/DQMuct8KNvton5h+4eo84CQ0sGbddy3lyF119mZbw
	lTWDBymtNoLKtSC0JWOr7os/H8AVkYEEyb0foS4nhwOsy97IH/PU+1bUZnZA53FH+G/y4r
	G2XZndvQoDZK0kmS3/CH4LAH0TjKo5Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-jkdVVsi5MVytb5jKZVmoWQ-1; Thu, 15 Jan 2026 11:53:45 -0500
X-MC-Unique: jkdVVsi5MVytb5jKZVmoWQ-1
X-Mimecast-MFC-AGG-ID: jkdVVsi5MVytb5jKZVmoWQ_1768496024
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47d28e7960fso13247155e9.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 08:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768496024; x=1769100824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5su/nAHmwHcmkA811BDe3v/5JJsozj0l7oyd1uJGuPg=;
        b=sFYKdBc0lhcjxTwVOHaFZ7Vaizc457Ji380b6rq4nR7zGVNMHRhXBeG5GXIoq72uh+
         MJGLIe74QWVExNg8ixWYYSrZbfT1sowT+GxQBMjperDC/2BF21AEYVWgajz92nseHDb3
         6yEj0JUqc4Qhpw8gInowG8y9C8tqBqUoZjYqhOlkbd/bffFlprKg9z8xivvY8Brmu9uo
         /InZ7+qLm1Jd7R46UX7a17jL2qdh2mK4hGPu1xoq+L4cPHLsu4gcF9vJz0Nr15asut0k
         tCCwb5p7n/9TmInsToKwzZV/rUifkpdqj8dncGVOwDPohORIgyn7XJvjs5sWUSxjKUye
         TgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768496024; x=1769100824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5su/nAHmwHcmkA811BDe3v/5JJsozj0l7oyd1uJGuPg=;
        b=m42Kw/th1ab6OveZzRWHnpffzBjGRg58xJN3X6V50TXTJCw8rC6ss6JEARwN2f409T
         MUcfxPk2mnnFmsU3H9PEbu/UhKcK1w6PYjnNBUSHMQZeaw2zRGq/CAtdTUnYNnl1RSkG
         J7KZ8K1TO6z/LqkZXPTa8Ky+ALhcnuPKvjsKMPBac2l5DuAeBkTfWIdiHe7KFvz/1y5U
         BV3IYV9tL+grnj7pd2HQSdQlu9TD4+ybDn2sb0+s4Np3boEYsiUWJhGpNsAJ1KmsJv1T
         VFsMio+TKINn7oTcUepLwEz8jOw3A3rQAsyDcdyTI2x3ZpwycRM8qbo69frX9DmXnRMh
         VkHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmF8b4KByBjHcSUpUAnXfZrB3H0QiPuWRnXudsoIKa3q447x9y0XOZboRw3YXhjgQewuHfWrRXDVc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr9hdhxThUnJZj5aZIVePtO1vWWKpvweBmHVKao6kNM5oEYkKK
	MzjPcZMgOYidfBxDLyMNVDUabiAcqwXDzI/9s5SDnoADxbdx0yovyQeZB0s9oNy4/zQ0RsqsQHZ
	Z4SZiIL11J9+jo5FFXBvTlt+CppkEdqNE5w8kWhdJpIs6P0uisc5YB5y8E7r/PA==
X-Gm-Gg: AY/fxX6z5E33r9tzvvn1lWkvZhMaJ2EA2B/7vtiQpPM85H1HkM6TN9nftHcIKElS1Jt
	NJdBbpR+XNy37Dg/x/zPeMdpf7cnvvRpl+WPTqoQP5dyoqrMbGLXckz8l8H1aoXeoAgPcCEOzl9
	dbOpUsB28CaamvI19F957tmHo7UDgaRcnk0TuuvV9pHAN4CsdYpg1LDWWGujtTxfs9bMSPy9fIk
	HxdskjG4GovA/6HHbhpg41O9M/Ji5IgEpBb5XIT72tViDy3qtsx3MG8yEjosqarzoxuTJOv2QYU
	XLFU3aDJ5DI7q3spOxr2MoTCjde7+ZEwAe8pxukwGZSHdtERJ4Wz8Nl+NF2sWqXyzZ8grmz3eCy
	STfmgpfbqSKLAhDjLYFVvJLLsiAxJUg==
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4801e30d482mr5165485e9.13.1768496024077;
        Thu, 15 Jan 2026 08:53:44 -0800 (PST)
X-Received: by 2002:a05:600c:5487:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-4801e30d482mr5165105e9.13.1768496023585;
        Thu, 15 Jan 2026 08:53:43 -0800 (PST)
Received: from redhat.com (IGLD-80-230-35-22.inter.net.il. [80.230.35.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356992681esm58497f8f.11.2026.01.15.08.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:53:42 -0800 (PST)
Date: Thu, 15 Jan 2026 11:53:39 -0500
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
Message-ID: <20260115115228-mutt-send-email-mst@kernel.org>
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
> I'll note that the spec also defines a "DEVICE ID of Virtio Cpu balloon device as 47". But
> no changes really happened in the spec with that for the last two years (only the
> id is reserved).
> 
> 
> [1] https://docs.oasis-open.org/virtio/virtio/v1.4/virtio-v1.4.html#x1-4260001


Maybe that's a good reason to keep calling it "memory balloon".

And hey, there's also the floating, pops easily kind and maybe someone
will use those with linux in some way :)


> -- 
> Cheers
> 
> David


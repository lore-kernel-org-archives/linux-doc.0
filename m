Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792623826;
	b=Il3KKoqJMLcBNPHDZaP0wfYSS+dpTsm2OJ7Enw/ZI8iXQBvPRvMSMYi0oxV+KZPLoEbE
	 1mqwXOWnZXMRJRjNWq892Aguj3mSSDsgyRM/91X+5dWo0dQDwKz6k9RD1RKNKhIFaJdTL
	 JfgrmaQUo4YcMpR5ygImv4udY1MqNC1fNdqwV41W+e/qVMBH20V0hmR7DrNJyWBfUHWi8
	 tqJVPF02gXsdHgf43ss2O62SmYROb7fLSrwLZvRS+ivuhbmhQ/EQPXX/NZooe0jk4ClIu
	 jMEcPfHX+zG5mdbwM4Ls2IOoJzPvWM3QGQO9UrCWOO4mlGgLlJASM0NQ1W8APH4naLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623826;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jGy266VCPwYvIDUWYVr0t88Ce39cKFxVLG4EB/XzkPU=;
	b=bqYXEkwFzxC0vzbu6pFhoL2930puT/8ksDGwmLitTEA4l0jDE/ZQuv2atWrwW2Boj2gN
	 aPky5qfijB/zxVRnhOIrHfF8iQdgkMQqqCvjrCt0BSUGWpKGf7xxmD7sWdoDJEnNJzN+c
	 XdlpWjtkEg3DNqgT8J5D2trUU2DqE630/0vNs82SS1zQV84GmbwdHY/j4eFlPx8Tp71uS
	 Z1Ab+kAlbZqqD8FHtFhL9UWKGE6sUryBen7mBfhMKj5Md6VYQ+otO0MU1MYhUhrWYP+7C
	 3MEKjG+Buyn5HF71D455AO4Dcl9NKOELUbuvA78ZRxk0s6kiWeGcDju3+V2SjG9dJlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UywjvSFz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6BF606A319
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 23:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=UywjvSFz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7431F000C1;
	Wed, 21 Oct 2026 23:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792623825;
	bh=jGy266VCPwYvIDUWYVr0t88Ce39cKFxVLG4EB/XzkPU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UywjvSFzXCbCANEWfPAmPkcP0TIKKWxwAs9SSqMXsBJbf7hATd0cs1whhmRimISjo
	 k/Dh4wRJHnAildmzIeVAGYMokJ4yQTyxKMI+H8t0HSLALiFZNNzEG35jkRLbhmwZqe
	 eD5P6/UVrDWI5V0AqUJMoZIn7K/lSL19VgVpZvW8=
Date: Wed, 21 Oct 2026 16:03:45 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, David
 Hildenbrand <david@kernel.org>
Subject: Re: [PATCH] docs: core-api: include documentation from
 linux/uaccess.h
Message-Id: <20261021160345.f01d046a25999a2d6edfb65d@linux-foundation.org>
In-Reply-To: <878q3q4qby.fsf@trenco.lwn.net>
References: <878q3q4qby.fsf@trenco.lwn.net>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 21 Oct 2026 16:54:41 -0600 Jonathan Corbet <corbet@lwn.net> wrote:

> Documentation/core-api/mm-api.rst brings in documentation from the
> x86-specific version of uaccess.h, but many of the functions in common use
> are documentation in include/linux/uaccess.h instead.  Incorporate that
> documentation as well.

Thanks.

>  Documentation/core-api/mm-api.rst | 3 +++

It's confusing when a tree-owner sends a patch.  I never know "is this
for me, or does [s]he intend to apply it".  So please make this known!


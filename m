Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30761FA8F1;
	Wed, 18 Dec 2024 17:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734543891; cv=none; b=LZjBd2HNguMNkySFUlsQ5ntArOlgSgjJs/v61sT45Ygfg6OmZcatZBxnpMWDTP7++hsc2mBbDmjxG8UQFS33w2tQ4tw13wu/WMiugLwZwm+5tuQt3JKPeb7BRxUoq0bU7zep4lmY/AigVq7HzxD68witYV55nTQ6y9AMnXhFdH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734543891; c=relaxed/simple;
	bh=1U/m58WV0uQ7Gz7333/wd07dB9O1kAdqG0JevSNCuDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XSQUQFiO6brUA9kVrXfhYr5497q4U5VLXf/lZgLIieVASqjifU2xUG3OCAPh/fd6YCofMtjjT7ICdoOSNZ1AeSsA+tosYud4hopjpz3RzfNASKkrfHP3QdZWk4mR7vEyGQz8yWty10P1XGaBrR6nYs2OYZrH99Ph6LPrvzV1+Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DMiKqCHd; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DMiKqCHd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6AKsDHa8OFbJ13ceQoyB8+HCYFVXtvagr3LUgXqZF+c=; b=DMiKqCHdIz7aJ4mIkP4E13B3OH
	B+YrsklM2VnF0I2XJEHNa5E5wUJ6CotOsnY9lWkfNvfESeIQCxPQsMzueJaaSIpP2tbDDtRxufq+X
	mfPo/5Z2CQy1SM63picLtapJZo6oUCgs8w0lzIoguJf8q8wInxvWVRpM0MmoU5I5Mb4zxXx6LIgTv
	Fni2PB271v1o+s2beEDaa9NlCWsFwOjqNFHMiadI6M2e+vwRnm4qTqb0/+GkVty8E0KHZb6hgsMar
	193I8ZgEBzKiTu4wRC3lRJkjBuSPUpq8J/im3CyX33Si52Rh2Wj0orq+HWt9e8CaE3OeF6C/vylOA
	Nd5iFlrA==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tNy60-00000000NX4-35ov;
	Wed, 18 Dec 2024 17:44:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A542130031E; Wed, 18 Dec 2024 18:44:28 +0100 (CET)
Date: Wed, 18 Dec 2024 18:44:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
	willy@infradead.org, lorenzo.stoakes@oracle.com, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
	oliver.sang@intel.com, mgorman@techsingularity.net,
	david@redhat.com, peterx@redhat.com, oleg@redhat.com,
	dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org,
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
	lokeshgidra@google.com, minchan@google.com, jannh@google.com,
	shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
Message-ID: <20241218174428.GQ2354@noisy.programming.kicks-ass.net>
References: <20241216213753.GD9803@noisy.programming.kicks-ass.net>
 <CAJuCfpEu_rZkC+ktWXE=rA-VenFBZR9VQ-SnVkDbXUqsd3Ys_A@mail.gmail.com>
 <20241217103035.GD11133@noisy.programming.kicks-ass.net>
 <CAJuCfpHzsQeejdPPbDdA6B3Wa=-KusnYRUyt1U0WnCRr8OKfGw@mail.gmail.com>
 <20241218094104.GC2354@noisy.programming.kicks-ass.net>
 <20241218100601.GI12500@noisy.programming.kicks-ass.net>
 <kfltsrry7qjuycyqpe2wune2ejad6kvusm2zixvfbtprbnw2lv@wcafrui6qaa7>
 <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net>
 <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>

On Wed, Dec 18, 2024 at 09:36:42AM -0800, Suren Baghdasaryan wrote:

> > You will not. vms_complete_munmap_vmas() will call remove_vma() to
> > remove PTEs IIRC, and if you do start_write() and detach() before
> > dropping mmap_lock_write, you should be good.
> 
> Ok, I think we will have to move mmap_write_downgrade() inside
> vms_complete_munmap_vmas() to be called after remove_vma().
> vms_clear_ptes() is using vmas, so we can't move remove_vma() before
> mmap_write_downgrade().

Why ?!

vms_clear_ptes() and remove_vma() are fine where they are -- there is no
concurrency left at this point.

Note that by doing vma_start_write() inside vms_complete_munmap_vmas(),
which is *after* the vmas have been unhooked from the mm, you wait for
any concurrent user to go away.

And since they're unhooked, there can't be any new users.

So you're the one and only user left, and code is fine the way it is.



Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF581FC8;
	Tue, 30 Jun 2026 00:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782778398; cv=none; b=Ks4Ii7x/vWxItMT6f7XsbbNE48AXzh4Q+1+EOA3+PL+ilVlOd//LJTpOd7ohs40n6jDIFGbVFLRMlVQHPxgebx4Kc0xi5EzbliSWl5yiukCZ6GYBI7l5Z+ylYEEaq3lfMyKFffD88VGi0sayeIY5sLASIGU1EIRVUETCklmnzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782778398; c=relaxed/simple;
	bh=NRTbRZBhjh+YETJBRqW8ZJ1kReH9btr9xEOgFFt/58o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2VfZwOvjD2uP5dTK8m65VGcbZWzrFrRptwpXdIqL2LtBdJu8jEv7Fl1muVs1VUTkv4pJVFwCVhy6UJV4D+J5GHWI43zvsMjCqsPfyD5NqBNwMTrEJ1Id3czKRX941J7Zt1zgC8ZKAHZSUwLqRNAmlkaph9Rj/3jrX25Opb0sKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Efq3waWr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Efq3waWr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0231F000E9;
	Tue, 30 Jun 2026 00:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782778396;
	bh=DjF0l/h9OZCEgfGf7GrkzYyWlLtuFsVav+p607uCMBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Efq3waWrCIaXPATELijKYmR0Czufu1OT9QZhBjnOlb8jXT3KT/bcwGXu8zYs7gn2r
	 /8xVkA8STm3ySUKB/ZzwQSVefKFsBAhtMdXH6t5qaESDu/RmPnNUqADlJqjqNOuXMP
	 xw25wdJosfDZ4GHq9XMvN+KusUa1Tu1/UQq+9Tk+YGJTbMEvPHwiF5stm93r8HIi/t
	 5DvRiDWXoELlRbay8wLv2E5Q/QVXJ8Z7aj1zPj+BhE/BjLb51uIHhagPcpBiKjNL0T
	 EvGB9NjNs8yn83pgZ4RhMdUeP/U8BaXk6cf0wyXW4Tr0qPCSWH2fW8s59pPhie19fb
	 Px3MsHWTPyRQw==
From: SJ Park <sj@kernel.org>
To: SJ Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs/mm: Fix braces
Date: Mon, 29 Jun 2026 17:13:07 -0700
Message-ID: <20260630001308.140793-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630000620.138992-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 29 Jun 2026 17:06:19 -0700 SJ Park <sj@kernel.org> wrote:

> On Mon, 29 Jun 2026 18:11:56 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:
> 
> > Correct typos in mm documentation by balancing parentheses.
> 
> Good eyes!
> 
> > 
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > Acked-by: Randy Dunlap <rdunlap@infradead.org>
> > Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
> 
> Reviewed-by: SeongJae Park <sj@kernel.org>

I mean,

Reviewed-by: SJ Park <sj@kernel.org>

Sorry for the noise.


Thanks,
SJ

[...]

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951316;
	b=k4baqN0zZ/KDo6FXFhI2rTxw3v+CiJbxQAT+eQ3EhYvaEX7OnUHnPrYmjtt9eVbqD/B2
	 Quldp3om9Y7jk5idfQ6jSZKurCGbh/0WnGYMTJTPcnCyShf+mk2lJBLh/n1yoaGDrmmOA
	 lQSA59gOIlh/cEPKWfMqb/vWHHductTFeZv7yAg9RCVS8do+qzV7YSjM51bVbl1/xcIla
	 Q2z3Lp5BCShF5nstSFNXbLtKzj6/9z85GUNeXpnQ00oQbyEk8UDc5uqmJBoO8IdP2VzCf
	 8nNc8mjaslB47mBp4k0nRv2ZQRrYkWB7fR9WoaD5wKR60noIwTGSiGwsegbYIk4f5jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951316;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=Anks4TzdC4CpR+AsePZScfQOH9LZg4KMnD77+CM5Nlo=;
	b=cazz+LknqiiBBO92NYU53ZB+Sqf5mLQYd7rNuyQG7gjnajyJZIxqwueok42nnoNwa/MI
	 ODpRdqksSMaSFcmtBV6v3J4WDD7ptO/m78f2BVKCB8rhwTu2QEkZvDbgKfI0hIRP1YEyS
	 oGRgzFo1Xlsy4ps0UDBRxORG8OPrYYeUceMhdX0PqsWsn+1MF8mkSLVMKm0Q1byV717yg
	 mwiLhMvLcXwrTjX/BKIB3gbZHb5moHFLdrtX0mb44dLVNtKWaUHlUrb9Q7SnR9PC/kIBO
	 HB9vXKh+kmk7rFen9gR6MKpxkFMe57/bhQKIEQa+0bXTF98UvBww0lz73VM0xM2bVpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHDhu7tN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A7606A31C;
	Tue, 17 Nov 2026 21:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FHDhu7tN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F0A1F000C4;
	Tue, 17 Nov 2026 21:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794951316;
	bh=Anks4TzdC4CpR+AsePZScfQOH9LZg4KMnD77+CM5Nlo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FHDhu7tNqCDK89se1H/cvw7m/Op6cV5/teGP+OweZ54P/dr3CKVgFjhpZmzt5xdZ0
	 WgalhNtq8RvF+2fCSjb1SW/DEfqQxXCi3jknzizsVUbtGXntkobZzQCaohnxbCoX9m
	 J7Jr9FmUG2riyzekBAWJRUR22joCJdZqddLPcRlokcvixh7XLMgTEE6rnoFM+MJs2N
	 YNfvxL2CeYGOzbItvtNnA77MKOUhYh7FARWjcE6ZdZuPJ5gVlNtFAas+VO7eKiJEoM
	 f4PSx3TxwYh23tEu5hfRJ5HsIm9MSPnwsoSR73B3QrkXxpCMLPiCiDRAwPTb96PrX3
	 Q7C6KqbfbsjOg==
From: David Hildenbrand <david@kernel.org>
To: Hugh Dickins <hughd@google.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Gregory Price <gourry@gourry.net>, Zi Yan <ziy@nvidia.com>, 
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org
In-Reply-To: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
References: <20261113-mempolicy_limit-v1-0-16688b2644dc@kernel.org>
Subject: Re: [PATCH 0/2] mm/mempolicy: shared policy limits for
 tmpfs/shmem/guest_memfd
Message-Id: <179495131088.5050.4198726430362880380.b4-ty@b4>
Date: Tue, 17 Nov 2026 22:35:10 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Fri, 13 Nov 2026 22:36:11 +0100, David Hildenbrand (Arm) wrote:
> For some reason we thought it would be a good idea to let users create
> as many shared policy ranges for shmem/tmpfs as they want. And
> guest_memfd inherited that handling.
> 
> Fortunately, at least for guest_memfd we know that we shouldn't really
> have more than one shared policy right now in practice.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: mempolicy-7.5.shared_policy_limit

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/2] mm/mempolicy: merge adjacent shared policy ranges
      https://git.kernel.org/mm/core/c/ca9e4df0
[2/2] mm/mempolicy: limit shared policy ranges per inode
      https://git.kernel.org/mm/core/c/8d93a9af

-- 
Cheers,

David


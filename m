Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726BA175A7D;
	Wed, 22 Jul 2026 00:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784679862; cv=none; b=iYpr5aQCDsA8xM645RU2R0f+VVnM6dr8p5nOhegrDIXvccY/yhxqIgH3E0pthbywWRUtqLpJWxLtAWDvz3YCFwhiOQjSNWPZgyiOmVRAu3/thwSGZVhgMF4AzNfdNMaqCyUFHb6QoTHpG4tjiZrJlSE8Q9dSwqS4zzYIdX/j1QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784679862; c=relaxed/simple;
	bh=rqn13DmOiv5CpBI3aPPWzniCzO311Hh/SOsZ+8lWAT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rh+L3UlpsY9MUyfKscTXTSWVEBv03nLAodG2oKWBXOdZpPqxFqiIjPw413WiK6AFKuizPS/9adRj7IPwqsdVmuynn8Gv8YYiBHZeY5Wn+sA9KalmZnaZDw+lUV+/N4ecrWjPNXsCxVzg1fVsrkyyXkJss00INJ+WtbJEZotUUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CsQwnhxv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CsQwnhxv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841AF1F000E9;
	Wed, 22 Jul 2026 00:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784679861;
	bh=Q6ZtWwJbi47KLhDRmMnb3Zg0qJF7lKRh73y+5hGmLLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CsQwnhxvA9ZxgnP7LaXEJ5c08PoHAPt5HJmn+V6skPO2tfujGXJ6CKOqHWRbP7+p9
	 OPGHvE5TkjZ72ku9JRsfH8kf3eIFg6d8B7FqF9o8fdjr0IZGpIbJC2tRnC6ka4cw8k
	 iaqjpCHCwIeGNnbEV4ryMLA6YvieOzBntxqnX2XyCjLocDz0oSX6EsThdrWsZUWi2o
	 a4q0Xxmv3ygqWXxuSMpiofmUsufQ5eRpq6TCOt7duWrklyXo4bckfupvjsMaIXolET
	 1Bzd5Q8yIPDfCnQaGwinQCSTxR86dUESSm7cg5nNY+wIJW4RrAy5lD82/S246r3DOd
	 Emd/JHIcRtRdQ==
From: SJ Park <sj@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: SJ Park <sj@kernel.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Subject: Re: [PATCH] docs/mm: Physical Memory: remove deferred_split_queue
Date: Tue, 21 Jul 2026 17:24:11 -0700
Message-ID: <20260722002412.150464-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260721111919.22923-1-zenghui.yu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 21 Jul 2026 19:19:19 +0800 Zenghui Yu <zenghui.yu@linux.dev> wrote:

> From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
> 
> deferred_split_queue was removed from struct pglist_data {} in commit
> fafaeceb89a5 ("mm: switch deferred split shrinker to list_lru").  Remove
> its description in doc as well.

Nice cleanup, thank you!

> 
> Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>

Reviewed-by: SJ Park <sj@kernel.org>

> ---
>  Documentation/mm/physical_memory.rst | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/mm/physical_memory.rst b/Documentation/mm/physical_memory.rst
> index b76183545e5b..a09407d72973 100644
> --- a/Documentation/mm/physical_memory.rst
> +++ b/Documentation/mm/physical_memory.rst
> @@ -262,9 +262,6 @@ General
>    PFN that needs to be initialized. Defined only when
>    ``CONFIG_DEFERRED_STRUCT_PAGE_INIT`` is enabled
>  
> -``deferred_split_queue``
> -  Per-node queue of huge pages that their split was deferred. Defined only when ``CONFIG_TRANSPARENT_HUGEPAGE`` is enabled.
> -

+1 for removing >80 columns line :)


Thanks,
SJ

[...]

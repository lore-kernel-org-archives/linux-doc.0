Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508588;
	b=EhFjT10bxGq1alrg4Ae4vYDUsMAQLIiTX71l8VwyhR4M4eXW8FyHQCnCoauwYVzA8ieW
	 yCzE0hnZZmmVsApwJuhFSdYatLgma8x/RcCFPXfek7z9v96+nspdzy/rlDajkDIMDaXke
	 XoVeLfnor9LIW05nCaoDLfdMtDWX1uD/N+xI/6G5X/ZhKjNHQYe0K8351kPB4Pe4AQkIc
	 /XNvfpdLyLZNf/7pRCdinWZZ/iSmCk3nFLq9JAQvnmYtJEyRVtTvxYpeu9WIKhqaOQRZf
	 Grf6fuHzNIsEsfCkpIdbWgSAuaPjRKFGWOo7EAMuFRTPRi648uF7WjqYjwCsmh2AwWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508588;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=85ylmbeALAYwawIKijj0hXBlUEBRMQLc81ieNVbxchc=;
	b=QG4oiBhr4/6TgIESH07vC1iMHG8KRFy4icjfomopKQg6v5OmQVzLuGI5kl8CZkYZLq9O
	 0U18h86Usakpns7goAUjygA/GQLPMUOfDQQQhyoj04NCUGvQoMi8mnqS+Y1Oot1lv72+U
	 rTBDz2XPfjOQA2ja6X3VGp3g9ssov5V8nqVw7lfYFM+/u8EW0zGO8UGaTnxCzg3BhSJNa
	 HA6QaW/TDlovv2cHg/UNmLqst+BZ/PbPMTEZP9Txm0zy3MHwGLYSwYUkDpzOwz8zwlC69
	 nDjXZtl7lLNUU6hlX0LgAX0zZKWU1dpQVcEJ9dtiRqS2ye+7MvUcmXvZc/e00Ci27KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTcl0jLk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227CB606A31E;
	Tue, 24 Nov 2026 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FTcl0jLk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C3D1F000CF;
	Tue, 24 Nov 2026 08:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795508588;
	bh=85ylmbeALAYwawIKijj0hXBlUEBRMQLc81ieNVbxchc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FTcl0jLkzHHNyCJMixZj3pcRaGFGdP5oXwfaEOZ0pcUeTE00z20ZJTr3DqtaTzusn
	 bu2Z+p/Jirb6BNooVKLPKwPwc3VcgHXhceJ+dYepddjDYR/oZA+ZeoJ3696ZrFRkPx
	 /6nJJtsubVIAZDvm/eCXe3qYyF7ulWd3WtAX4VaEdBhcO+OldPtJMVmNJ4U+aFHGlZ
	 /JzOB9lXIlEyNXUmFWEG6ah/5IqZbsyDGdsymZILsq5J0eSQyFWThGFHPXf78hsZSR
	 CL/TieEXgsX2Wb5nnC2KaJzMyn8W/PI3/ow+MvLi2JRF8XuM80sa8BYdJcjDEDhBe2
	 nq+xnQaizMqRA==
From: David Hildenbrand <david@kernel.org>
To: linux-mm@kvack.org, linux-doc@vger.kernel.org, 
 zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
Cc: linux-kernel@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Qi Zheng <qi.zheng@linux.dev>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
In-Reply-To: <6E11B4A6A6E0DCF9+20261123030904.57369-1-zhaozhengzhuo@uniontech.com>
References: <6E11B4A6A6E0DCF9+20261123030904.57369-1-zhaozhengzhuo@uniontech.com>
Subject: Re: [PATCH v2] Docs/mm: fix stale split page table lock references
Message-Id: <179550858346.7182.6655589672684235643.b4-ty@b4>
Date: Tue, 24 Nov 2026 09:23:03 +0100
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

On Mon, 23 Nov 2026 11:09:03 +0800, zhaozhengzhuo wrote:
> The USE_SPLIT_PTE_PTLOCKS and USE_SPLIT_PMD_PTLOCKS macros were turned
> into Kconfig options, and CONFIG_SPLIT_PTLOCK_CPUS was replaced, but two
> Documentation/mm files still refer to the old names.
> 
> Update both references.  Point readers to mm/Kconfig for the dependencies
> instead of restating information that can become stale.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: core-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] Docs/mm: fix stale split page table lock references
      https://git.kernel.org/mm/core/c/51626ff4

-- 
Cheers,

David


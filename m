Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6EF46B5;
	Fri, 26 Jun 2026 00:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782432291; cv=none; b=Cw3B1M6TtU5cUMRG2zkQI71zgtQrDtiGx4nlRtXR6X74LhLUAwfaOpEhTiAn6uZvPV2e1T5VyVx1ueLT5Dwuw4CtESHD2UyELsXCc7O9omkfcAep/S2v7/XXkMaYL4iKsmuCnv5q2M1D+SeJQwmhjHe7Ccq5C0DqTXnR+dLNhgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782432291; c=relaxed/simple;
	bh=Iu3wtSqZnNFDcVDCTOP27kgW1VaXi7mznE4T6+W1goY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wkx7RgYwkSqe04sKm04+skuZG51MsKZ22GUCclx913yQbcnV/iLYOa1SRkBfIu4awA3uj32q5GVHn5I1W4Ln5r9beImUFVHetjgbowLH6A0cDaWWU30gMmLLkq5mxtWNXSbfWln4EGWRRmMZZWJp3PqIEosGan+cGalvIKbpD/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aOv30WBT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aOv30WBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D991F00A3A;
	Fri, 26 Jun 2026 00:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782432290;
	bh=9n4GXrjO0+9RUKqhp2Kca03H3bpbAY2nECwzkDNb0jY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aOv30WBTgjIAshL6Kp9br1NXtPKhasfWIYVInsO/zu46FZs0xO2i+WXZFQ1EBN06S
	 LuLDulrRTOyyUkdzy/wZ8GGfC0aOYVSCdHA8Hwng/7LSMNwBpz9CW7eSQLJFpG1yLZ
	 HKyjoNqTzBS7QTVNLXd8mNwmbgFdTEzCNW3zoH/FsFtPfrWvFWPCNSx6Om+STkPpPK
	 FOnkByTytajn/R1TgP7j2jRB7QhWexkDCKv6+P+V1fUXPQ00iFjZplXkoWv43jpaa9
	 uDqM+qJUmEtYa0qNFBZr0U2c4kQ5W5jHcyNP+sLgrGsrxXP3+4ysEntK8Pxw+S8xML
	 Px3Xvq9qhLuog==
From: SeongJae Park <sj@kernel.org>
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: SeongJae Park <sj@kernel.org>,
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
Subject: Re: [PATCH] docs: pagemap: fix flags location, member name and sample code
Date: Thu, 25 Jun 2026 17:04:38 -0700
Message-ID: <20260626000439.85062-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625174447.24292-1-zenghui.yu@linux.dev>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 26 Jun 2026 01:44:47 +0800 Zenghui Yu <zenghui.yu@linux.dev> wrote:

> The userland visible page flags (KPF_*) were initially moved to
> include/linux/kernel-page-flags.h in commit 1a9b5b7fe0c5 ("mm: export
> stable page flags"), and later moved to
> include/uapi/linux/kernel-page-flags.h in commit 607ca46e97a1 ("UAPI:
> (Scripted) Disintegrate include/linux"). Upadte the doc to reflect the
> current location of these flags.
> 
> The member @walk_end of struct pm_scan_arg {} was wrongly written as
> "end_walk".
> 
> The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
> PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
> The second one missed PAGE_IS_FILE in the required mask.
> 
> Fix them all together.

Looks good to me, thank you!

> 
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

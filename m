Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C044CF59;
	Wed,  5 Aug 2026 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785934869; cv=none; b=fE9+lLvK1nhk1LYtD2YomNV6aXxfdjr87Pu59JZC9XCdGNbjImea4jFiUznV+iMRjrnNJQ+lrDI8QlYWi4+12hYtz1WejcRJTmxA/QXhi7nWQxgaWpFjaamGdJM/4tSUtVcSvmoJP54clI2B3duwnjnOMZQ3hn1QRBoi1MmLMxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785934869; c=relaxed/simple;
	bh=XBzH+9vqvYQ4ofkHHwzst5ePLKyQPa58cn8NxQl9hWk=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=UA09PK3SPVTCvrEgY8urtNFFAtb1/23CG6ZozjD7WVyPvf9rC7VAPqzQ/MAMg+SvXiEympWf0bet8kMx8c0LXY+gZGJSwJ4pBSG4bPQKi9T8tkQk/BfYmWLVlAg4F628VFv01uzN4GmZnjF9Mud/hWvnQTa5m+7vrYJqGkg4iVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hFVrw6DhNz52SGg;
	Wed, 05 Aug 2026 21:00:48 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 675D0hrM029962;
	Wed, 5 Aug 2026 21:00:43 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 5 Aug 2026 21:00:45 +0800 (CST)
X-Zmail-TransId: 2af96a7333fd94f-8e0ab
X-Mailer: Zmail v1.0
Message-ID: <20260805210045739XrZB2Gyax_ujkhlLwsFAN@zte.com.cn>
In-Reply-To: <20260805105927.41987-1-hongfu.li@linux.dev>
References: 20260805105927.41987-1-hongfu.li@linux.dev
Date: Wed, 5 Aug 2026 21:00:45 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <hongfu.li@linux.dev>
Cc: <akpm@linux-foundation.org>, <david@kernel.org>,
        <chengming.zhou@linux.dev>, <ljs@kernel.org>, <liam@infradead.org>,
        <vbabka@kernel.org>, <rppt@kernel.org>, <surenb@google.com>,
        <mhocko@suse.com>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <alexs@kernel.org>, <si.yanteng@linux.dev>, <dzm91@hust.edu.cn>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <hongfu.li@linux.dev>,
        <lihongfu@kylinos.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0ga3NtOiB1cGRhdGUgY29tbWVudHMgYW5kIGRvY3MgdG8gcmVmZXJlbmNlIGZvbGlvLT5tYXBwaW5n?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 675D0hrM029962
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 05 Aug 2026 21:00:48 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A733400.000/4hFVrw6DhNz52SGg

> The KSM code already stores and checks the stable node key via
> folio->mapping, but the comment in ksm_get_folio() and the reverse
> mapping documentation in ksm.rst still refer to page->mapping.
>
> This is a pure wording update to match the folio-based implementation.
> No functional change is intended.
> 
> Signed-off-by: Hongfu Li <lihongfu@kylinos.cn>
> ---
> Documentation/mm/ksm.rst                    | 4 ++--
> Documentation/translations/zh_CN/mm/ksm.rst | 4 ++--
> mm/ksm.c                                    | 7 +++----
> 3 files changed, 7 insertions(+), 8 deletions(-)

Reviewed-by: Xu Xin <xu.xin16@zte.com.cn>

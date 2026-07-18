Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945B45733E;
	Sat, 18 Jul 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381258; cv=none; b=YG2WbPev49mta8xmrxSlRosX7J1OsxK/1zrlWsdiTxG+cSu2xdixBLZOMKX1tDWsk8gdtEQDjdd0fdpqgqEggSdVyc1eQsSD7SJZsuzhp1VFfn/oKWCczWNsOgJknbkOrErrEJJMB6If3D+1QkhQuDVrJhbsjy95tF4aZtF7kq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381258; c=relaxed/simple;
	bh=clP5SMiiTvc5vo6ZbVHlQSJ7WxtAL3gvvR+pR/5pJ+g=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=HVfyUr7ZWHrjO1kuKYAJp8JvhVSslU40b0mTLbJKXaogbvWyruajg4bket+apBMuCE62F2CdGPuIkQbfq8KTCSsfAGDsVRq31Z8D7lMjZMCgaYzRW2yOzvD4nqFrQ9MrYWfp/0Y6d/8uqrTV/Ql2t5cQTbEWAGvA9Z5Xx/D4c1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h2SJ61Q82z8Xrnt;
	Sat, 18 Jul 2026 21:27:34 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 66IDRSKn033533;
	Sat, 18 Jul 2026 21:27:28 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 18 Jul 2026 21:27:31 +0800 (CST)
X-Zmail-TransId: 2afb6a5b7f43827-a73fc
X-Mailer: Zmail v1.0
Message-ID: <20260718212731818RTVXUKYRzKLFE7z13CBM9@zte.com.cn>
In-Reply-To: <20260718133702354_hJQf_RdG3c52A42Onwa_@zte.com.cn>
References: 20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn,20260718133702354_hJQf_RdG3c52A42Onwa_@zte.com.cn
Date: Sat, 18 Jul 2026 21:27:31 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <wang.yaxin@zte.com.cn>
Cc: <wang.yaxin@zte.com.cn>, <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAyLzNdIHRvb2xzL2FjY291bnRpbmc6IGZhY3RvciBvdXQgc2hhcmVkIGZvcm1hdF90aW1lc3BlYygpIGltcGxlbWVudGF0aW9u?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 66IDRSKn033533
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 18 Jul 2026 21:27:34 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5B7F46.000/4h2SJ61Q82z8Xrnt

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> The same __kernel_timespec formatting logic existed independently in
> both getdelays.c and delaytop.c with minor differences (strftime vs
> snprintf, __kernel_time64_t vs time_t).
> 
> Create a shared format_timespec.c/h with a canonical implementation
> (strftime + time_t), remove the static copies from both files, and
> link both programs against the common object.
> 
> Also simplify the Makefile with a pattern rule for %.o and a static
> pattern rule for the two programs that need format_timespec.o.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

Acked-by: Xu Xin <xu.xin16@zte.com.cn>

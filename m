Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A8930AD05;
	Sat, 18 Jul 2026 13:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381177; cv=none; b=tpKKRHdXCloGYe2clh8WXb6WeO8t7RB1nFryVYff/gKHo9hlao8rWj2adhvBRjF8WPB9ycZdcVQ8NSIZIMlMQ+ks1FaDdm+Td3/lBGWzSmmMVkszwy/I6/e5tKuhngc6JvTlEpnT68NBUXv1cR3jIUn2PrMoypmRc3z6y0gH3Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381177; c=relaxed/simple;
	bh=nCMjkxThM7v0ZpDME49uXUJuU0xBeJLqswYYYyTqxjg=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=f1TM5+sr+DgKIG9gUwalgGrYJVFCxKz17e3k5gTB3kC20SzRqaBbXrd7mNNpCM3zFlRPFK6KRjv62SM2gf+YomdIwY3me5wNhOrbvyG8HI78E9cVm8h0t2WkSe1c6oWcXJy2KWuaXbBRCPZ74zc1ac/DSGLBVhgYZTHTHonU42M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h2SGQ12Fgz5BNS0;
	Sat, 18 Jul 2026 21:26:06 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 66IDPtf8076568;
	Sat, 18 Jul 2026 21:25:55 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 18 Jul 2026 21:25:59 +0800 (CST)
X-Zmail-TransId: 2afb6a5b7ee7045-a5c1b
X-Mailer: Zmail v1.0
Message-ID: <20260718212559220Qigp11KJadqSu8MYN96Zi@zte.com.cn>
In-Reply-To: <202607181335459184foygLX7rXegGUPftV9-3@zte.com.cn>
References: 20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn,202607181335459184foygLX7rXegGUPftV9-3@zte.com.cn
Date: Sat, 18 Jul 2026 21:25:59 +0800 (CST)
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
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzNdIGRlbGF5dG9wOiByZWZhY3RvciByZXBldGl0aXZlIGRlbGF5IGZpZWxkcyBpbnRvIGFycmF5IHdpdGggZW51bQ==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 66IDPtf8076568
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 18 Jul 2026 21:26:06 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5B7EEE.000/4h2SGQ12Fgz5BNS0

> Replace the 9 groups of (count, delay_total, delay_max, delay_max_ts)
> named fields in struct task_info with a struct delay_metrics array
> indexed by enum delay_type. This eliminates all unsafe pointer
> arithmetic via offsetof() from compare_tasks(),
> field_delay_max_and_ts(), and get_field_delay_values().
> 
> The struct field_desc now stores an enum delay_type index instead of
> four separate unsigned long offset values.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

You missed the subject prefix 'v3'.

Acked-by: Xu Xin <xu.xin16@zte.com.cn>

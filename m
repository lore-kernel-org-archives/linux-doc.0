Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDFE30AD05;
	Sat, 18 Jul 2026 13:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784381324; cv=none; b=Rw8svX+tJYMqIYpEdf4nmg5cieipY5BdombXOVd+L1dWKK+3GL27I3JbKDMMxLDufXxIR2XDoLSK5fh/Qwlu54vCdi9eXte5u2MJyqJ7zfGHigI8FVBkAUAHN6haH5FsoFgma2iTFIxF1lipiCD8wvyi4oaF/0XkOxBHweoxnQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784381324; c=relaxed/simple;
	bh=mmIkt27HsjQcpTvILw5sn3cCnrumWUGPyh1tCaKUkf0=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=LrujmXYIGvIWnvH/+0RGI439X0sE0fJnaX55BIfVfIpBhX9/9A/PpVETyt51l23DEB1qjW0Ig2Jr8kEC/hkIV+USsZTlt0/IAz7UmZmnT0B33uj2ZNUNWJHps+T+lTUkY0ZvDw9R0cBcSJA7hQIDWWYvV9xrT8Q07gLrTrnr1ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4h2SKN34G2z5BNRf;
	Sat, 18 Jul 2026 21:28:40 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 66IDSW0W033668;
	Sat, 18 Jul 2026 21:28:32 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp04[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 18 Jul 2026 21:28:35 +0800 (CST)
X-Zmail-TransId: 2afb6a5b7f83814-a83e8
X-Mailer: Zmail v1.0
Message-ID: <20260718212835295nJAob8f4cL4nrS-Tk1OWV@zte.com.cn>
In-Reply-To: <20260718133822444iLo8o-zXcS91NMNEg17Gv@zte.com.cn>
References: 20260718133420538UvsJFurowueTqxAaZ1cRP@zte.com.cn,20260718133822444iLo8o-zXcS91NMNEg17Gv@zte.com.cn
Date: Sat, 18 Jul 2026 21:28:35 +0800 (CST)
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
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAzLzNdIHRvb2xzL2FjY291bnRpbmc6IHNpbXBsaWZ5IDMyLWJpdCB0aW1lX3Qgb3ZlcmZsb3cgY2hlY2sgaW4gZm9ybWF0X3RpbWVzcGVjKCk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 66IDSW0W033668
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 18 Jul 2026 21:28:40 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A5B7F88.000/4h2SKN34G2z5BNRf

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Replace the Y2038 overflow guard in format_timespec() with a direct
> narrowing truncation check ((long long)time_sec != ts->tv_sec), which
> is both simpler and more robust across platforms. Also move the
> time_sec assignment earlier to avoid duplication.
> 
> While at it, fix a minor alignment issue in delaytop.c by adding a
> leading space to the output format string.
> 
> Signed-off-by: Wang Yaxin <wang.yaxin@zte.com.cn>

Acked-by: Xu Xin <xu.xin16@zte.com.cn>

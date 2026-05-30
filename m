Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D9730E85C;
	Sat, 30 May 2026 03:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780112012; cv=none; b=WPpT+umLitsJ/8ra6KxgYnsBpZrT+FsvVg1uGejf4FQR5p9WePl5kgxf8N87Antk75r4Qh7rdEVlbWezGV9pbi3zgmqxHrAmDGOl0aVTjzV+hov9bxNjTZqJYf7O4ExKKh7lQQVzTzhs7lhvQCznIwZ+TOO4tTc88eVzNvufOmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780112012; c=relaxed/simple;
	bh=1GnpDdLTmgf9pTmI765HnGs56jzxJO9vzHe9z9NDWv4=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=c8QK7NfgPBJpPAKWVzUeNpZoCKn0bMcPVg3AYL3DlfyoY9Gqp1a8ArhgRweq40Bb3uYQ3vqwavuuXAGAe0MjKlNCRXdH4ComF8OhJclOAGC8rwMcFLqqidsHrzPo/COFTv0RPtOSm+LbsezBzntEkrhUgyC8TKhTSP5a0KXkJg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gS5RB36Zhz51Srn;
	Sat, 30 May 2026 11:33:26 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 64U3XKo0030401;
	Sat, 30 May 2026 11:33:20 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 30 May 2026 11:33:21 +0800 (CST)
X-Zmail-TransId: 2afc6a1a5a81a7d-d02d2
X-Mailer: Zmail v1.0
Message-ID: <20260530113321615TRlbmM7bJFBTApGF05oYW@zte.com.cn>
In-Reply-To: <6263830a-1559-440d-b914-8e3aff08fdaf@t-8ch.de>
References: 20260527125034.ba695164344d2645dd055af0@linux-foundation.org,20260529124410822pexFmlFsVNGRXq_DUHUmg@zte.com.cn,6263830a-1559-440d-b914-8e3aff08fdaf@t-8ch.de
Date: Sat, 30 May 2026 11:33:21 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <linux@weissschuh.net>
Cc: <akpm@linux-foundation.org>, <fan.yu9@zte.com.cn>,
        <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <xu.xin16@zte.com.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCBsaW51eCBuZXh0XSB0b29scyBoZWFkZXJzIFVBUEk6IHN5bmMgbGludXgvdGFza3N0YXRzLmggZm9yIHByb2NhY2N0LmM=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 64U3XKo0030401
X-TLS: YES
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 30 May 2026 11:33:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1A5A86.001/4gS5RB36Zhz51Srn

Hi, Thomas

>> >It has always annoyed me that we do this by copying the file.  I'm
>> >surprised that there isn't a way of using the original file directly.
>> 
>> Using -I../../usr/include avoids duplicate headers and relies on a
>> single original copy, but requires make headers_install. This aligns
>> with commit 9b93f7e32774 ("tools/getdelays: use the static UAPI headers
>> from tools/include/uapi").
>
>This requires the presence of a kernel build. Which is not guaranteed
>for tools/. You could put it in samples/ which is part of the regular
>kernel build and can depend on up-to-date UAPI headers.
>
>> Using -I../include/uapi/ keeps two separate header copies, which may
>> cause inconsistencies when one copy is updated. Can we optimize it
>> with symbolic links, or revert to the first solution?
>
>See tools/include/uapi/README for the background of the current
>solution. I would stick with it.

Thanks for your reply. After reading tools/include/uapi/README, I now
understand the background of this solution. It seems the second approach
is indeed the recommended one for now.

Thanks
Yaxin

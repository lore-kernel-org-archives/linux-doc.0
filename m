Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795233124;
	b=kVe6vgeSXPwbqhkxBIboH18CbDM2Hpe8mt6xauqORTUAx5YeO13S7WyzXFkHcjp4zXtD
	 64E6CUWCAbOqiS2YlXv3ImZhRlSfE/n787ObJs9sFucp8EuhLfEp6G0FGOWKdbXBeFBwj
	 IzaBeR4go5I8hAQQAX96P3glboc4yKnYP0B/kqNxjUrJg6h7jnMxAZVwyste1uNOuUbVe
	 KL7tj9Uukl2x8ruOeI8PW7ph1aF33iGHvSR7txL0IgLjdYCejtpvjZoBpPFs73gjKWdFh
	 32bIIw5pEMgKxS4KXK9CLbHNHAlE6256dQFA4A5bA90XcUUeSjV2dnXWJgD0J277W5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795233124;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=t3CqGgFk2L3b9FCv605Q9hXhDbgqIF8yWBXPd6hRqks=;
	b=hzVX56oa7m5JoxVf2hjeCPXQ7PpmYvc0MOEiWROY4inth+q2IqZAo1scHQ87JW0tNScr
	 ZEOHTC25hMI1BE0XiD96spkCfllZAHZtuU9Ae8i0UP76lmuHg5RGFxppwMuP3VDP493bK
	 1VDvn6pi0s2bmiD8kynQitrP/mlfrHz+0ix55rfi7GJdLLIVrQq5FNyJzE6eJjcp8krm/
	 W97AIIMjPvPdJSuQDmI2gh+t9M8IyAu6iTcH6X10k/m25lgwSh7rIbyxLTb1/GxBuvZlA
	 AfiTL7f06d0Rw+9LSvw2N+kyrsRPly7WLEPJ3Sct4vJWwPXas/ZSUSFM8VovxBIiFUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=rz3KlIm9;
	arc=none smtp.remote-ip=160.30.148.35
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16A6606A336;
	Sat, 21 Nov 2026 03:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16A6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=rz3KlIm9
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jWdYl03hhz8Xrnt;
	Sat, 21 Nov 2026 11:51:55 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795233115;
	bh=DOnW6S/xLmyi4nJeJaEa/jHKDCKCeHl8OiqL9xF/jkE=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=rz3KlIm9g3b31wF3buDln+rUCaQoTS1asc7JnsD0NCpmTIs79NJhZc1b/teufme9O
	 BnZSO+jerEWLFipm6vBwv9Q9Ru1BTpLlu7j2o0bNkxF8baTZdymaM7Ty48fVXXiRRA
	 eb5blDKpIcZkZX5MelorYlT/MWniyV7TRsO0kAIO3uMRvgntJ8BpvvSbgelwlmK1kp
	 FSoVXtuNfXfDYv/zMHyn1NG/sxW4N9Oa37WUJQi1b7ME2UEmgvz3sC7r8v87dpVZsj
	 Re6ykCElYQJ+ifKCvk1Y6va8P5dGSuVbC+R2N4hae6jQ4kKxmxSokbGtePRyGtl1l0
	 jGvT2HgF94+IQ==
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6AL3pmsF049972;
	Sat, 21 Nov 2026 11:51:48 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxl2zmapp06[null])
	by mapi (Zmail) with MAPI id mid16;
	Sat, 21 Nov 2026 11:51:49 +0800 (CST)
X-Zmail-TransId: 2b086b0115550c2-02606
X-Mailer: Zmail v1.0
Message-ID: <20261121115149793vTP8Pscjt_Jn9lz8KG-Lr@zte.com.cn>
In-Reply-To: <20261120-various-achiness-6c942b0c4803@spud>
References: 20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn,20261120150437672HnkUOWm6mhr5u-3Ha2pJQ@zte.com.cn,20261120-various-achiness-6c942b0c4803@spud
Date: Sat, 21 Nov 2026 11:51:49 +0800 (CST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <conor@kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <liu.qingtao2@zte.com.cn>,
        <he.yilin@zte.com.cn>, <ye.zhihao1@zte.com.cn>,
        <zhang.cheng35@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAyLzJdIHJpc2N2OiBod3Byb2JlOiBBZGQgTGVhcFJpc2UgdmVuZG9yIGV4dGVuc2lvbj8gZnJhbWV3b3JrIHN1cHBvcnQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AL3pmsF049972
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sat, 21 Nov 2026 11:51:55 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6B01155A.000/4jWdYl03hhz8Xrnt

Thanks for the clear explanation.  I'll drop patch 2 due to lack of
real use case for the extension framework.

May I ask whether patch 1 (LEAPRISE_VENDOR_ID) can still be
considered on its own? 

Best regards,
Lv Yating

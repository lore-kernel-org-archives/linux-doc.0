Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E8944998D;
	Thu, 30 Jul 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425344; cv=none; b=lFxnd5UJ4QBYtbLZ/A19VsebU9GysSweEB5GRrZjtR5WVcOUIplwV+xOIoAWTpXZVzY1t+WZCYayjijlfAub2Qzgt3GOjeaxiqiARCvUYgXI5sfG/LgwoxaqDKRXQT0KysT68PVlu41bf3XxzYwPz+jWs70grvEOowjf//Ad93Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425344; c=relaxed/simple;
	bh=k4RhFfB6sk/oyTBMy0X9sXeYzh1B/m5L82UJ1BPK/js=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=OXLCcta3KxOvrJw+08aSkYDLi0gqgyjiIHoq+jenZypV/N2jkzMQ5Y0v3wdsRQ02Bfpr0p3lvAE3F/Dg4qmEZxYo9w4fa7vxiMOSzC4hOYK4fJBGddVWywCwx5pkR7Sw/x4YG1mjWT4FSwjVXzFjsDc4ILEpQfZUQ79vsLIjxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=A69vgJJR; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GLYu5YTw; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="A69vgJJR";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GLYu5YTw"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9CCDB140010E;
	Thu, 30 Jul 2026 11:29:01 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 11:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785425341;
	 x=1785511741; bh=lphiCGMjZUFhWF/Pky1WRqrvvxx6kVpMjk3KptVNI/k=; b=
	A69vgJJRfbe6wvHP47OgK58zS88w/KbTMDQpmVSbqxscQCSIRzgwu7zXfegvX4Vi
	9XznWSyq6UQe4ph90cOpkn5vdYVt78K4Nb/A0iRh94mLd5qDPySyz0JmCts4RUp2
	TsD2XfuVqkdpSEyHzxvQt2HwL8KdvfYsDGjO8/6Y2cpk/Ji5sFK/ViU2uNa8UE8k
	jjdgjy9pyk8Jy5ft9LKJpeZtL2vPW+anz2bYiYTkNj5MaCcE2U396KADwgdyLodG
	z5NqpNSdVtw4snnhMpaEoYt0moiIapDm45hHDJy9tzvcaifYnPYIlsYiPyrvscCf
	u2bmNe8PfDDRUlgdojEt/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785425341; x=
	1785511741; bh=lphiCGMjZUFhWF/Pky1WRqrvvxx6kVpMjk3KptVNI/k=; b=G
	LYu5YTwMXTX+xgMkJM9Zs9nUNkw6mZZSUNIY2rMq9tVRFr4YuBdKWdb+W779mYHa
	DSzf9nahUAxnZPJ+CDm9acy9z1goH8qamyoPXK3OdPdr78YmfcVd+fZcyDYzwrSN
	qjJ7/Rf5+s1Mv6QPtSfZS/hP4LiqLalFMiskv3CQzAQC2esLTaBSZaRb2KVHj6va
	JIrZTfklzPPqgw3wyoEFcBtnhjVbl3UzvwjwpsVq6afxOv8e19vikuvw3Yux4ecF
	DGFY4JBIM75QwTTTy6k9mPO+w8mihR8xogAlW8+qSTXjo9SsIXAPh0w6dbFisyAq
	U92cMdV/jZSI2tqGxrOvw==
X-ME-Sender: <xms:vW1rarI8om0F1kZmzHr1SXpnLYv_q9wseP7T1c6RMN6Ft0eiqJeVGQ>
    <xme:vW1rap-XQpxUry9J86To0fOOXVhZrliPCZDhPZ2CfPrqymVTnWGEyr1rHSBaTFxUw
    uYriUFnz5fjKDPwfoXKhqSXxXYQSdbDMXNcbuVj4tuFSZXudYAMvG0>
X-ME-Proxy-Cause: dmFkZTEuarT0OCepT4NtW6+L0PNPFGE47+MBORemYy1Dp2MlMhsAT62Cz5D/GAvTHJU0ch
    woKkpcMwLQotjBDzWtwKFLJU39OHJB8sRPY8EhT8+/Q5ylXhcx6zIlvHEAvJ8fkeQN10i8
    Ae85+EfPT813+KV/2clboG3o9VbS34HBUZ/FwuTQ1q9tZ+AeW3qg0iAIizgIUCz942c5en
    +BGmujsVfN+1clt+uQobu7ORneb2co4sFslf3MYFxD5+PfQNH5/+Ce2Bv2q7PhecRN/2qC
    nOFpThwKIpu80HViSLDxFsWzaJNeIrYgnz55ZwXQFTxSOFk65uiDepwpzQUzrTuLFF0uCT
    HCjob1I0iuk8qCrUtGn6l+an+K43LqWFk1+JmSWWiEyv/Tve3REk006RfncvLzmshMSCBg
    emllPmU6nrq5ThcBwDp3XAO72upOnlJxWcTrexfGBzmoWfixM8KeZX+8XWcwpIKRs9xEJ2
    Pu9aKXv2nkZ/w6jGiCzBvSisFaw6Kmoj/Raon0IHfViXGONHVvZhVT490pIcTQtScXILXZ
    uHfBW3vGBmwCnIxD8BjV9kXtsp32KYNHxjsJxxehWXqQYWQa8w4PW8KJYWbwM8q079dWxe
    dVQlGGCQdQsiaMsArvJ75IbtnBj+Ma/YY/TMdswxG2wPNM3qfO9isYu7yVdg
X-ME-Proxy: <xmx:vW1ral3iImzqsEHR-yHz_kLLh-uA6pbsUq9OEsga8Hbw3TrboKLlDg>
    <xmx:vW1raiFn-I6vyBJNZ77xjNmQYOwk6VJmW9XOD5cnAjnrrtHijuKWXg>
    <xmx:vW1ragv4l1CDryJh-d8J2I9QMv2idfghD1frDowiqtnYi_lu_q7HjA>
    <xmx:vW1ralqPJNA6cHgK9Dx5hZHNP4S7CKSOfYvF8BztEuiBZJJj8b1XhA>
    <xmx:vW1rapsIPeOQZcMAIFv3OWtC3dMKi9PVIJqRTntsGMyfObltncTTpnX0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 799D5182007E; Thu, 30 Jul 2026 11:29:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AFmFlwVs39wo
Date: Thu, 30 Jul 2026 17:28:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Graf" <graf@amazon.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "The AWS Nitro Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, mancio@amazon.com, diapop@amazon.com,
 mknaust@amazon.com
Message-Id: <f876636d-8659-4ffc-8189-6e931f2d2250@app.fastmail.com>
In-Reply-To: <20260730125312.71415-6-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
 <20260730125312.71415-6-graf@amazon.com>
Subject: Re: [PATCH 5/8] nitro_enclaves: Add NE_SET_ALLOC_NUMA_NODE
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2026, at 14:53, Alexander Graf wrote:
> +		if (ne_enclave->state != NE_STATE_INIT) {
> +			dev_err_ratelimited(ne_misc_dev.this_device,
> +					    "Enclave is not in init state\n");
> +
> +			mutex_unlock(&ne_enclave->enclave_info_mutex);
> +
> +			return -NE_ERR_NOT_IN_INIT_STATE;
> +		}

This does not look like a normal error code, what is going on here?

> +struct ne_alloc_numa_node {
> +	__s32	numa_node;
> +	__u32	flags;
> +};

I don't see the point of 'flags' here if that has to be zero.
Can you just drop that?

      Arnd

Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F2844998F;
	Thu, 30 Jul 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425344; cv=none; b=DuVIwd3C/4uLoXmNhwMpsmiiZVopleO1n8S800qTy41HydIf1eZXM+51V9xzDFN4MuuCk1/rONDdsvv1TNjURknYH0i0z85D5VEY9B1WwZPpagtE4UHlxydWZWRyzjGOtcDmnGfK5b+N7saRAkiIGrglyhEugE/sG9qYPxs0+tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425344; c=relaxed/simple;
	bh=g+Qbyretcdv4u81W05iNSQo7cEvkoq1dtauYOHl1la4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=WdjSjyNLJCTDvOgU6em1AcMirNDr4TpfKAFXpgzgx7FF6rkG+D9BBocTsHqQKPJmiq1x/fd08PJUzTJDV9h+vLVSVpHchWblQ9Fy7oyYWF5ORyLVRSgPFXfjykF/ZKzWfLgxAx7tFYBOmioY18jN577EYIif2EROF/gaa7zIcnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Gn+pM9j+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q737rCzV; arc=none smtp.client-ip=103.168.172.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Gn+pM9j+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q737rCzV"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 92D2F1400109;
	Thu, 30 Jul 2026 11:29:01 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 30 Jul 2026 11:29:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785425341;
	 x=1785511741; bh=FHNiBFyc3GaY3I5t6LPevJGLANMU479WkFO7tTTVT2c=; b=
	Gn+pM9j+JgZrlJjFpZ9RFwh0xf2u3zbHt56PjJTz6b8N4SUltjIXEcPoTUV/UjoL
	pNvpMD2U/ccmiHrKwiolu6S19ptWbINeoZw6NZGzGrWaHwye/ztUB++l6gXrI0pc
	tJ513uG69LJYgpOMVe+kub7mL8Aoy1ZVSLgfRvV9FfI3ECsYf9hHlAbsvZaqJ3UY
	QihyGhsauO70VOgMyxkH3TwwJh1ANGz9inh/vOTdJJyM0eRk4HYthZFumEfJkHJ6
	li5ScXhkayA9K17bmgPpC7cYFYn4DGKWT+PPckRfQLD3d38+vSe5K/Yl5W90x/8s
	VddBXlLx86oXf/i92LJVug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1785425341; x=
	1785511741; bh=FHNiBFyc3GaY3I5t6LPevJGLANMU479WkFO7tTTVT2c=; b=Q
	737rCzV5ncEkfq3mjt8yiRnJPlzKO3oB84NdFnE3sOWtwIvMThedpyKgiBKaw6mq
	LmpErQHhUkd/mCsbKlfwXTARdffrtOmx+/rBnV2KNCqjEVEldHuliwNYWml/+b0h
	Nf4kow/Oj/NiMiO1Up692ObC4z0viEImMBrcomnPGYBvHp9eQ23lsiORJgSt1Avk
	xrusE4sIzgGcbjy1HJqzE35elJe2qqHfgIWAWh704WhX2exbtnAMNkswa2YH3WkN
	sXabNsUCKDyrpgoVzmMOLAngW4eoV7lbRcYy7qPMasAnDQkFLlXtsPU0joC5e/Eu
	kHsU0FkJSR/AW3Nd8goyw==
X-ME-Sender: <xms:vW1ralMpfC7fq4u-F0q-6A2l6UGoOhrn1pYjzyDyrujp2cXJWTcPog>
    <xme:vW1raiz-EEbLKdQ7J1j6fXyApCcABR-p2XBY17SaNsuKkyUORXNxBPPAFE5pqrPC_
    G3LtN9KFmmo4TUvJKcFl6pU9fOICfYJH-n8aVlMfHgYyyvLTJrWF8w>
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
X-ME-Proxy: <xmx:vW1rambrrF1eaKxUZZ7_tmqWkVxWI6iiwneMHWSKeARnTmoJgMB00Q>
    <xmx:vW1ravZVKI2pT7qEeUiMyQyPHPlWs76g3QZDIV_tS_AmTZSMajiD6A>
    <xmx:vW1rarwG8H0XPODiP9NXirBsccGWjb4fKb0_YThu-nmcxeanVZyQLw>
    <xmx:vW1rarfWAUUjIqLNx-2bJsPzvtlR15X3TMsbIiFViTMHSh8QKBcMNA>
    <xmx:vW1rahjB8j-BwKnJxyAXmBK3tZOZIWb7n7kuuG82_veZTp-iQ-ZUxURP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3CEC11820082; Thu, 30 Jul 2026 11:29:01 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AzthGADIziMg
Date: Thu, 30 Jul 2026 17:28:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Graf" <graf@amazon.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jonathan Corbet" <corbet@lwn.net>
Cc: "The AWS Nitro Enclaves Team" <aws-nitro-enclaves-devel@amazon.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, mancio@amazon.com, diapop@amazon.com,
 mknaust@amazon.com
Message-Id: <a45fa55f-5637-4d63-95b8-948cea922c14@app.fastmail.com>
In-Reply-To: <20260730125312.71415-7-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
 <20260730125312.71415-7-graf@amazon.com>
Subject: Re: [PATCH 6/8] nitro_enclaves: Expose CPU pool state under sysfs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jul 30, 2026, at 14:53, Alexander Graf wrote:

> +static ssize_t total_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
> +{
> +	ssize_t ret;
> +
> +	mutex_lock(&ne_cpu_pool.mutex);
> +	ret = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(&ne_cpu_pool.pool_cpus));
> +	mutex_unlock(&ne_cpu_pool.mutex);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(total);
> +
> +static ssize_t used_show(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
> +{
> +	ssize_t ret;
> +
> +	mutex_lock(&ne_cpu_pool.mutex);
> +	ret = sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(&ne_cpu_pool.claimed_cpus));
> +	mutex_unlock(&ne_cpu_pool.mutex);
> +
> +	return ret;
> +}
> +static DEVICE_ATTR_RO(used);

The names are a bit inconsistent: you have pool/claimed for the internal
structure but total/used for the ABI. It might help to pick one set of
names here.

      Arnd

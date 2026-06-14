Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF48260566
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 15:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781449254; cv=none; b=uaWsKBJUzZqpnV//9DiSoZZ6tb8uYl+In6F58ZofzTztNKNqQE1n2eQoBqavgXD5ENo3vDaOxQji8LSA1jQrqXlVxtSWK+2sfRs/9iUB0YTCVqj8fbSAH6k2Kt2CJcCl+98NnolWUJYtwyQsrru8ZhqdbDHUI7/r3Ng4EcCmmiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781449254; c=relaxed/simple;
	bh=bnn83/VQiP0XKx1cDRZdXo5MQrAVpAi8pEi8lZj2+0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Siz9A2t+6mWsE8Q1aGnV9E9WFBdolUAmiCrWpoWeVWNWdB+RKonxpTRUycjm2dCCumZBYLiO9qSbz1NDxaN4MKd4OsxIUGMQiEM520fOzn/csj6oMXSujWW7iUEBRumG31NEy06NTpqG6LA3onuxeSvgUAj91DQ6BVVftW0S5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKaWcFA0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKaWcFA0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso17949155e9.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 08:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781449252; x=1782054052; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bnn83/VQiP0XKx1cDRZdXo5MQrAVpAi8pEi8lZj2+0k=;
        b=KKaWcFA09XUjQ9WfBM7ZBHM88looRNGGP7zqgzPm3nqFlwY2wqxjZmmoSg4rs1063j
         wr5fKqhdR0XIgAIhXsxSA7hWPuVoa++jv0GoFrZB17MgCkqNNREA3EGaBBfP3JOh5HvR
         uPPBqFVEyd5VPkCOm0kOnqYbJr6cqHx7TDYPiPnz2J0USisk3qrDcQCWRNT6eTEpnbjW
         r1GIs1W8X4woIK1UwGdKZvfoIO+FmeTsGIkFigdY8GY4V8y8FwCi0YFdA12CSYhxvCP9
         sgVrSIe1fAtp+O197sdh5oAWmrGbvyl7kXKc3MGyS3OORXZOrLn3BU4Jz4HXBZX30fxj
         Mdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781449252; x=1782054052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bnn83/VQiP0XKx1cDRZdXo5MQrAVpAi8pEi8lZj2+0k=;
        b=RCigSxut1XbfV7nyzmTx6k2jdq6CFFMD//o4iAJEnf0P5eHwU9u/5KNUrOh6XY8jsD
         t8T69CBCb79Nq+2wvPTbHxcBRAiVZV7YLeUje8W3StY8u58vKt4HP45n9ZUi/E990Pt+
         JycEUgj/Zq7OAGh/NH2WtC808k6ct/R2CGcCknJytobCDBV0IwQ8R8pd87g32js+FgUR
         Zvnqi2c/ed3oaU8OZuveSj1MqA9zEAoKKapajauvydXkKeqklg6k6uPyE93/vCWCaYJo
         NnTCKqHAuqw3CH3MzWHCAB2xlfJVZQdDM0UV2QFglP/PqghVq2lN2PmIqJGVV+ikjjz5
         yXBA==
X-Forwarded-Encrypted: i=1; AFNElJ+XD8OAzOxC1P6t5WqKtezjLeC4qqY7pduNxQpBD8Z18kfpGZ3/J+5V7npeqAd5phwtrc8eB71npXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8GaBetPQCFU3p1tBA/43WVQ2dJdjVJVZeQVOXv+xH5chZg/bL
	h+49RoqVkmJAcR4WO3sf5uvQ73sQyf/pfFpb2abE6k5cokkoKA/CQ1Pb
X-Gm-Gg: Acq92OH6zfddGQNLPjgLV4gKLoZ9f8yu9Lky7Yw8vqAYN7YG+fGbNIAmJey0ZjWDpFH
	+MmlRBvAHz9T7DO/2Qe6bBKWdGp3X8c5F3a+qIeGme6d/z+d8yB8mA6kjc9eKAJYmDodFkxBHwt
	E5tGvf/wD5+PsOCyjKOJ04rrEr5AIyCcCr+F2vlrMrsfCDNv4JWQ51YY/+S7vuq8/esAId78wMD
	lsZzngC8aVjrtNzzL3bklXDVJjIWTyZQQnrKAX5D/iUNrUExt2dLjdsQPPGXlovQcAXvhh+S0TO
	1WNgt+unH/Dm4fMed//zCq67gYwQVslI4RF9O4kw/PM83wjj+7du5gh+r/2KQ7bg3kahyFd0Z0k
	IEWm8EOy2XHX7Y9uaSS24OpltZE3YyyXBFU66XVbUbgii5gl89qAL+z4jZNj6rYjJYoqxbyZfiA
	hRyGhkKcfnsPofVDuDMAUcQGSvo/Ia+h+b6BZLcrhRjJSnkWDXpQ5Zd7xUFGqg04RZcDOcDsEF2
	5GfUE8sVam1+dt5x/w=
X-Received: by 2002:a05:600c:4754:b0:492:2100:aba2 with SMTP id 5b1f17b1804b1-4922100ac1emr78147525e9.4.1781449251459;
        Sun, 14 Jun 2026 08:00:51 -0700 (PDT)
Received: from [10.128.10.215] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203d2449sm153669105e9.14.2026.06.14.08.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 08:00:50 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <b677c9e4-edd7-42ab-ac0d-d721e7aaf2e3@gmail.com>
Date: Sun, 14 Jun 2026 16:00:50 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: kbuild: remove ISDN references in Makefile examples
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>, Chen Pei <cp0613@linux.alibaba.com>,
 Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Andrew Jones <andrew.jones@linux.dev>
References: <20260613232830.147116-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260613232830.147116-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/14/26 00:28, Ethan Nelson-Moore wrote:
> Documentation/kbuild/makefiles.rst uses some extracts from now-removed
> ISDN code as examples. While they are harmless, they appeared in my
> checks for CONFIG_* symbols referenced but not defined in the kernel.
Hi Ethan, are you using the kconfig-sym-check[1] that was recently
merged? This dead symbol check should not have the false positives on
documentation.

Though maybe your check also catches dead symbols in C, Rust, Makefiles?

[1]
https://lore.kernel.org/all/20260527142703.107110-1-andrew.jones@linux.dev/

- Julian Braha

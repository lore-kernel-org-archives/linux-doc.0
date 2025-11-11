Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4E6347BBA
	for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 02:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762828321; cv=none; b=jmD0dmJxhGTgrJzbbJ9TTqP1QHqDCTg0MOmaOEMuVExwDZGTMhxn+VNtyuIrEpwLr6ZySxxHq7q2qU+YWl+ZypHGjh1TbTz8SzrTsc+7Ap2d8DjarU5BvfxUvyPyQ0UYQrs94BKL30lf7ItFfk21A99mxOvR02vm4nXnNtEGnhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762828321; c=relaxed/simple;
	bh=yV9cPHk8dIKIWoV6mdgwaGrSx9FwHfzI8XWgtoJnrQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BVvz4nIiMnxUfO+1kgVfa0Worw77budfAgYRpUkWuWzTL4frzV2pMfDEFmyUwdRgc3pDrzuQiJGLyZqDjmTMlhICyBGxaTWhKbf/aym6JdkXvf5B2gt6t9XVDGUo+uWeotHU/8W6R3LqJlItKefADlDpC6w9KvFzb/jy25bg71w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY7TLh0m; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY7TLh0m"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4eda6a8cc12so27952591cf.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 18:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762828319; x=1763433119; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/klxSk7UtTirsvyrKiSGuSrx879X0M+sdkmegY3UDfY=;
        b=mY7TLh0mVfrD9ru9QrZiBGmdJOXDxfpMg/1/xH7q1yLWYusA2X4S8YorYJsMl2wwfr
         tqZ8UMImCxMLdlT+lq0RZICM38x/eVk6IwId3mI7vnb0Dx+dbN9uqlUl7/BYAIf3oIcl
         m4jQMzvBMdU0BtP5WqvrwR2DKtnAo/rEkjMzD0kHd2/EMCN/wc0TS1M4nx/e+lr2s/a2
         sKE2dYA9AOF34xSloa7HcjYT9IhCXG2b/FEBsItQSi0/uuKJ66Pi0NiFK1bG+peD09Fo
         nmy3ps+D9+8lTi5BqczHeOxewVhtkDdUZ2BXZTA1fg1mptDoz8IMMNOX2qrBhWbDCcan
         WyrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762828319; x=1763433119;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/klxSk7UtTirsvyrKiSGuSrx879X0M+sdkmegY3UDfY=;
        b=jFwJhjXm/RVPZMtsW1jOVd6ovpjJwbcKT9wuh6Fqpli3xdnV3tiPOBpHbAxSh8QGPN
         4I+qzmHxdbyBU6mcVI64eR3UJeLux2Gh4R455o22ayPq4GAgS5abR7O96Lq4UbAkvXhR
         4Zt+ATTDWru6K1HofPbKX0uKJjrL9zMBuSQwLEdIIdVPLIRlM9rGL2DgtF5/Ki5LpnXN
         DEhKsQvOPXVpc2qWBtTW/dIlLLePOizAAFVyVQD4JpEJYvRi/cndJOXLskmcL2dV2URt
         ekvHNzoYtIaBdN6elHh3NODkmfrtFcGZB7bmhwqiq60sHqtXrpsrgnRW/faHft2zl4Zv
         Bupw==
X-Forwarded-Encrypted: i=1; AJvYcCVZ/cPrkFq1rOkNtX+HJNf7xLMi7h34n09FL0UVMw2qEMowq6nsF8HROS7oHeprZ+z9B72yUVf7e+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YySvwUN//TYBQtfWLIgBzHl/YCjHtAExA9tf7XCNh3ipyvuAUyy
	Z1F8O5ubZk0c7MTiS8oKRYW0OXmPQA/0LrbASEazszxi+iXPlgSOgW0YCv3zYvmCY5E=
X-Gm-Gg: ASbGnctzpu2N0Kdl7Qz4TTwGj9ER3dqfpdCw2dHqTKEIylYDbxwERSyLTKzKyIzJvsK
	NboSTIHWzAxd2lokH4Nnl6AKIpoiBEC7gr4kRzTNgdPd5kiCgV/Jswn49YL1cjUkWXA+jQCa4dX
	MbLtsZpRjJXTjFeAlyaOqTQdTNVn29XiYfCDSgwlQxqoL6jdnB+QUaQnPVxxMqVVYq0VZbTxZe+
	eQdBvBvLXmicvnPo+351otk9OondUVPdlcaDEk20KblZweJblGF+UwTquW9WyGEKzjfbs5+1Nqz
	AALBRJisyvBEmMK2L6Bzhxnm9NYCL2gne5QT22mXhvniAgPmPE1O5obmRDlzWwA1cYR+aGocXJC
	9it25W5pQOI9re9kFnwlmyp1vogIIXjqu+9Eja6/izaUDccpKs7o+b9x20HZ2M2eKuu61mIgAZw
	Ss4UMPX7w=
X-Google-Smtp-Source: AGHT+IFn+vjJHlq24fT2sBNnkUYmhDssFsbnrCMPiJF+OP/zw7CiLhchDG+Dlttk0AGAXdtB6JpCuw==
X-Received: by 2002:ac8:5d56:0:b0:4e8:9f46:402e with SMTP id d75a77b69052e-4eda4f90156mr128481231cf.40.1762828318658;
        Mon, 10 Nov 2025 18:31:58 -0800 (PST)
Received: from [192.168.1.50] ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4edcab79093sm8694271cf.18.2025.11.10.18.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 18:31:58 -0800 (PST)
Message-ID: <d836336a-7022-44e3-9416-1e6cc6a70155@gmail.com>
Date: Tue, 11 Nov 2025 09:31:49 +0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/9] xfrm docs update
To: Jakub Kicinski <kuba@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Networking <netdev@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>
References: <20251103015029.17018-2-bagasdotme@gmail.com>
 <aRJ3rVhjky-YmoEj@archie.me> <20251110160807.02b93efc@kernel.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20251110160807.02b93efc@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/25 07:08, Jakub Kicinski wrote:
> On Tue, 11 Nov 2025 06:39:25 +0700 Bagas Sanjaya wrote:
>> On Mon, Nov 03, 2025 at 08:50:21AM +0700, Bagas Sanjaya wrote:
>>> Hi,
>>>
>>> Here are xfrm documentation patches. Patches [1-7/9] are formatting polishing;
>>> [8/9] groups the docs and [9/9] adds MAINTAINERS entries for them.
>>
>> netdev maintainers: Would you like to merge this series or not?
> 
> Steffen said he will merge it.

OK, thanks!

-- 
An old man doll... just what I always wanted! - Clara

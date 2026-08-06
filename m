Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388604734E4
	for <linux-doc@vger.kernel.org>; Thu,  6 Aug 2026 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786018900; cv=none; b=samPYHRiJHbnqAFC7AK5P9sfG86E8axClOFvpcmma8hob/A13Gt5Dp6dbnNe+5DOwII7AK0Wx12PrEamqxW7QXqRrOT3S3eKjeL2+bdM+PCYImm7p0NKsLoU+K1dPQOjjUAeKlmF6FrEpw97psKr9BzNaiWrLo9DwlcpawfDQRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786018900; c=relaxed/simple;
	bh=TTiHlStxZcKVKrwqcuDMLj38rBSP7TpoZoQlRZGLyrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDmF16GDdOWlg6kv5+Pg18cg0f+WsWJyBBSvqP/BJTUyNPWXEBz3izm9G9GTAIiRMlAcT7KOf3BN3ly3PnWzXmLy+gDo8lonAcpyekq8O26Cuy8ngUSrkc/fC1eMEEVqsW9FSgDYc7InyCfIu8AuCSjQcLvbXi8Sj3IEmFkKwxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJn+DDkP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJn+DDkP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-472326ca506so1438544f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Aug 2026 05:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786018896; x=1786623696; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfDlnjwEjqQiBft6//i9aWDA7+Wxp9IrqsB/3Fhaw40=;
        b=XJn+DDkPJjP/V2NYxQMNMiUSztdxL5BX3WbOePcGIWTdGsldovqU+YfLJCrgljR9wi
         Y7Zz1/sSG7RzzLYA2LPhGo+cnU6cJb9RbZpDL23FjZFb+K4qZGkYxZJToxsT0UUNh/da
         4gSd5ws2QvWA2bITT/VCjrmjCHJzcr07+p8KF1EhyRnckQU+Fjc8duNsPqwMsXZLrnJw
         8XeSVdu3KCL8RgMkdeKpLnPdI6TcVjzcqv11BdjCHvpdXY4YJW9NTiepW9CXB4dA8Ml1
         3OATNWEVAQ3M8+khX9YopaUgISPtmr84CTmTp5pvcKP+jJCJPvR7s8sU9HZX6DBjg+gs
         W/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018896; x=1786623696;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DfDlnjwEjqQiBft6//i9aWDA7+Wxp9IrqsB/3Fhaw40=;
        b=DFvNAIO/r6mK4S7uFBdLuYtd9KmF8D33p2qSvKTZKy/WTn3U0KvJXsXMjhRfolJ40n
         3GUwz10Wx6dFHSu0H6cp+Ibgfl+UB28orLHE/TcFGEggzWY6JaY1U+uVpn0Wuazm/3si
         O11D3rT37uCkC+JTpj8p6EcVy6ME3trmDnPgC98ryv08WBHd5QBrZFytgsMnSoMnn/Q3
         5XwPIQ8Ix1N9nGDl4dS0+GSL5g7trwN5Pluz24CNlRxZN7SoIu3QGwtAMLDPP4+SR1PQ
         qlCmqvixmaLqnpCH2juu7LTpIzoYDC7nf32PsPRNf9K1YPq5cCDiC1zxnbcm+bcar20I
         MZHA==
X-Forwarded-Encrypted: i=1; AHgh+RrgoG5qE5zGmUKDrm+dwk5Luq8shhyJRXwCdvAnptbX0F441/fdF+soP5QnFAk6XwGKi4c+V3iCpYc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ1xSEvvqLU1W4H4dL2qlz1mdS/kK5b/OS2jhBMdQlnFu6CVSk
	4chk2sOtL+b2urt4Mb+pWi7LYMwKtEZ2AAtag2WYPWiyo7AVXQqEalTG
X-Gm-Gg: AR+sD11mUWTmv9dG156Hdm/DmSu18vy9XYZVDTdmyj/zI4kBOn883HTx5/lkUjKDrD+
	Rh/KJw7fmA94kOD6b0fLbA1UWtsZTslQH5i4oopy4TaIPdwshOC7VHGena+KmYdY9RkUC4acRPb
	E/e9nbhVC2Nu7KkASBnV2iX6CIMXsEqbokQafBtX02fbxIq/Cum50t3kQN5sLgdFVKDzGzdX1lK
	4dbiekN+w7eKOPbgah5ZLnxBbaZZl0js2zDp4DlnqlPBdFf48m23JF1bghYuRHoN1or1aI0FA9E
	qtIhVSX8n6pyG0fhEXsBlLvLqDWvE5hgVFDME143E0FUOxOUByyZ2mBR+cbUXz1wRrQnrS+xBb9
	AlF3JaDVhrnND8NGw/v+xQZqekKFloHpnZkkKU6IE8yYTOALjEA/tJhdQId7CDX/bvx3uw0eB5V
	Upq80h/xkyb1//PrL2APkSZlRU2gWaa628EujtDwpHKynWD99W36m9ObBmND9T1yUhIciiB6rP2
	4nIpIk+bl3U+kZruCxqamkvTt3A4U+HKO26zOgNv7zSoJnpGomR/z5MgNErHkCSgTFjj92SMOe7
	1NkvPl6S92QOufSuvzYjIGv5Gpb8c4n1eNCrUA==
X-Received: by 2002:a05:6000:290d:b0:47f:f42e:9715 with SMTP id ffacd0b85a97d-47ff42e974fmr10864047f8f.12.1786018896398;
        Thu, 06 Aug 2026 05:21:36 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b32492sm5927425f8f.35.2026.08.06.05.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 05:21:35 -0700 (PDT)
Message-ID: <f47ed617-5ee7-4259-9f5f-a6fd0f5aab24@gmail.com>
Date: Thu, 6 Aug 2026 13:21:38 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] block: rename bi_bvec_done
To: linux-block@vger.kernel.org
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 Damien Le Moal <dlemoal@kernel.org>, Alasdair Kergon <agk@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>,
 Benjamin Marzinski <bmarzins@redhat.com>,
 Dongsheng Yang <dongsheng.yang@linux.dev>, Zheng Gu <cengku@gmail.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Chris Mason <clm@fb.com>,
 David Sterba <dsterba@suse.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Ilya Dryomov
 <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>,
 Viacheslav Dubeyko <slava@dubeyko.com>, Hannes Reinecke <hare@kernel.org>,
 linux-doc@vger.kernel.org, dm-devel@lists.linux.dev, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-btrfs@vger.kernel.org,
 io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 ceph-devel@vger.kernel.org
References: <4e4c21858705a200bd8848ffe4080522e3eb5c1c.1786018753.git.asml.silence@gmail.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <4e4c21858705a200bd8848ffe4080522e3eb5c1c.1786018753.git.asml.silence@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/26 13:19, Pavel Begunkov wrote:
> struct bvec_iter::bi_bvec_done is used an offset in the current bvec,
> let's rename it accordingly for better clarity. I also plan to use it
> for non-bvec based iteration in the future like dma-buf, so drop the
> "bvec" part.

I have this patch for the dma-buf patch set, but it's a very noisy
one, and I've got an impression that it'd be a good thing to do
regardless. Hence sending separately hoping it'd get into 7.3

-- 
Pavel Begunkov

